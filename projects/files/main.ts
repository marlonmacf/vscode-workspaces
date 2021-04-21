interface Human {
    firstName: String;
    lastName: String;
    maybe: Boolean;
    name?: Function;
    isLate?(time: Date): Function;
}

class Person2 implements Human {

    firstName: String;
    lastName: String;
    maybe: Boolean;

    constructor(firstName: String, lastName: String, maybe: Boolean) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.maybe = maybe;
    }

    public name() {

        const LOG: Object = new Object();

        let yoo4: number = 0.0;
        let yoo5: boolean = false;
        let yoo2: string = `${this.firstName} yoo ${this.lastName}`;

        var yoo3: any[] = [yoo5, yoo2, yoo3, yoo4, LOG];

        return null;
    }

    protected whoAreYou() {
        return `Hi i'm ${this.name()}`;
    }
}

class Student2 extends Person2 {

    /**
     * TODO: ...
     * @param firstName 
     * @param lastName 
     * @param course 
     */
    constructor(public firstName: String, public lastName: String, public course: String, public person: Person2) {
        super(firstName, lastName, true);

        person.firstName = null;

        super.name();
        super.maybe = null;
        this.firstName = null;
    }

    /* TODO: ... @param firstName  */
    whoAreYou() {

        // Testing comments...
        return `${super.whoAreYou()} and i'm studying ${this.course}`;
    }
}

let asim2 = new Student2("Asim", "Hussain", "typescript", null);
console.log(asim2.whoAreYou());

function Student(config: any) {
    return function (target: any) {
        var yoo = target.prototype;
        Object.defineProperty(target.prototype, 'course', { value: () => config.course });
    }
}

// @Student({ course: "angular3" })
class Person {
    constructor(private firstName: any, private lastName: any) {
        document.ATTRIBUTE_NODE;
        console.log(null);
    }

    public name() {
        return `${this.firstName} ${this.lastName}`;
    }

    protected whoAreYou() {
        return `Hi i'm ${this.name()}`;
    }
}

let asim = new Person("Asim", "Hussain");
// noinspection TypeScriptUnresolvedFunction
// console.log(asim.course());

export function square(x: number) {
    return Math.pow(x, 2)
}

export function cow() {
    console.log("Mooooo!!!")
}