xquery version "3.0";

(: The manager ID :)
declare variable $manager as xs:string := "Big.Boss";

(: Access the persons :)
declare variable $persons := .?personnel;

(: Lists the manager's subordinates:)

let $s := array:size( $persons?person )

for $i in (1 to $s)
    let $person := $persons?person($i)
    let $link := $person?link
    where (exists($link?manager) and (compare($link?manager, $manager) eq 0))
    return
        <person
            id="{$person?id}">
            <name>{$person?name?given, " ", $person?name?family}</name>
        </person>
