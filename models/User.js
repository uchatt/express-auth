exports.User = class {
    constructor(first, last, email, phone) {
        this.first = first;
        this.last = last;
        this.email = email;
        this.phone = phone;
    }

    toString() {
        return `${this.first} + ${this.last} + ${this.email} + ${this.phone}`;
    }
};
