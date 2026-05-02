---
title: Squaring the circle on employee equity
---

People work for startups for many reasons. They may like being part of a smaller
team, getting more responsibilities, working at a faster pace with less red
tape, feeling more connected to the mission. But despite regular advice to
ignore equity, many employees greatly value access to startup equity and dream
of an outsized outcome. This is why every startup talks up their equity package
during their hiring process.

Having worked at startups both as a founder and an employee, I have seen
employee equity through a few different angles. I've received options and RSUs,
seen two companies exit, walked away without exercising, crafted an equity
compensation plan, and calculated payouts in an acquisition.

My conclusion: the current tools at our disposal to give employees equity
exposure suck, and most employees do not understand the limits of them. In this
post, I share the issue with a few different structures and explore potential
alternatives.

> _DISCLAIMER_ I am not a lawyer, and I certainly am not your lawyer. This post
> simplifies many concepts, and offers a layman's understanding of a very
> complicated topic. Please consult with a tax professional for any questions
> about your taxes and startup equity. As Microsoft lawyers are fond of saying,
> this post is
> [for entertainment purposes only](https://techcrunch.com/2026/04/05/copilot-is-for-entertainment-purposes-only-according-to-microsofts-terms-of-service/).

## What's wrong with employee equity?

### A three-month exercise window is unworkable

The standard instrument for giving employees equity in the United States is the
Incentive Stock Option ("ISO"). An ISO is an option, which means that it gives
the recipient the right to buy the stock at a given price. Typically, ISOs are
priced at Fair Market Value (FMV) so they have no economic benefit as far as the
IRS is concerned when they are received. This is a very helpful feature: startup
equity is illiquid, so giving employees straight up stock could potentially lead
to a large tax bill with no liquidity to cover it.

The advantage of ISOs is that they defer taxation until the gain is realized
(i.e. the shares are sold) rather than when the option is exercised, and allow
employees to treat the full proceeds as capital gains. On paper, this makes it
an ideal instrument for employee equity: a tax bill isn't due until a liquidity
event.

> _Note on AMT._ When ISOs are exercised, the delta between the strike price and
> FMV is added to income for Alternative Minimum Tax purposes, even though no
> stock has been sold. For employees exercising at a meaningful FMV, this can
> mean a real tax bill on phantom gains, with no liquidity to pay it.

But ISOs have a serious flaw: once someone ceases to be an employee (either
voluntarily or not), they typically have three months to decide whether to
exercise or surrender the ISOs. This exercise requires committing funds the
employee may not have to purchase equity in a speculative enterprise sometimes
years before the shares become liquid (if they ever do).

With companies staying private longer and longer, employees are more likely to
need to leave before the company gets acquired or IPOs. Their life circumstances
may change, they may move, or they simply may need a change. Whatever the
reason, leaving presents them with an impossible choice: lock up meaningful
amounts of money in company equity, or surrender the options you worked hard to
earn.

I faced this choice when I left Pebble, a company I joined as a very early
employee. Exercising my options would have cost me substantially all of my
savings. I was pessimistic about the prospects of the company, so I surrendered
my options. It felt terrible, but it was the right decision as my options turned
out worthless in the Fitbit acquisition. Not all of my colleagues were as lucky.

Zach Holman, an early employee at Github, wrote colorfully about it in his post,
[Fuck your 90 day exercise window](https://zachholman.com/posts/fuck-your-90-day-exercise-window/).

### A ten year exercise window ... for a price

Zach's article preaches a 10-year exercise window. Over the past decade, his and
other people's writings have increased awareness of the issue and extended
exercise windows have become more popular. Companies often present them to
employees as getting 10 years to exercise their options after leaving the
company. This sounds great! Unfortunately, it comes with an important caveat.

Here is how the extended exercise window works: when an employee leaves the
company, their ISO still has a three-month exercise window. When that expires,
they automatically convert to Nonqualified Stock Options ("NSO"). NSOs can have
a much longer exercise window, which is how the 10 years window is achieved.

But NSOs are much worse than ISOs. When they are exercised, the delta between
the strike price and the fair market value at the time of exercise is treated as
ordinary income. This creates difficulties for both the employee and for the
company.

For the employee, this makes exercise even more difficult. They not only need to
put up funds for the exercise, they face a potentially large tax bill. But
waiting for a liquidity event to exercise means the full proceeds will be taxed
as ordinary income. Companies rarely explain all these details to employees, so
they rarely understand the mechanics behind the exercise window.

For the company, NSOs are burdensome as well. When the NSO is exercised or
liquidated, the company needs to report the ordinary income on form W-2. They
also need to make all applicable withholdings. This is costly (payroll tax,
social security tax, medicare tax, ...), error prone (how do you know what to
withhold if you do not know what the employee has paid already?), and
administratively difficult. Imagine needing to process payroll to ex-employees
who have since moved to a country where the company does not have a legal
presence!

When Memfault was acquired, paying out all NSOs turned out to be very
complicated. I cannot imagine the problems a larger company encounters.

Some companies now create guardrails to limit the number of NSO holders. For
example, they may extend the exercise window by 1 year for every 2 years of
service rather than automatically set it to ten years. Or they may only offer it
to key employees.

### RSUs only make sense at later stages

Later stage companies typically move to offering double-trigger RSUs. They vest
on a similar schedule, but do not settle until some liquidity event (the second
trigger). Similarly to options, this defers taxation to the liquidity events
rather than on vesting.

They also solve other problems that later stage companies run into. RSUs solve
other problems down the line: ISOs have a $100k limit, and AMT on exercise. When
a company is so valuable that exercising options becomes practically impossible,
RSUs are a good option.

Unfortunately, they run into the same problem as NSOs: they are taxed as
ordinary income when the second trigger hits, and they trigger a payroll +
associated tax for the company.

They also offer less opportunities for optimization to savvy employees.
Exercising an option early lets you start the clock on long term capital gains.
RSUs give you no such option. For early stage companies, they are strictly worse
than options.

### Options and RSUs expire

At this point, you may think the solution is simply for employees to keep the
ISOs and stay at the company for as long as it takes to see a liquidity event.
But even this approach has pitfalls.

Options and RSUs by law have an expiry date, typically no more than 10 years
from issue. As companies stay private longer, employees bump into this limit
more and more often.

In the best case, companies come up with a huge amount of money and do a tender
offer. This allows employees to sell enough stock to cover exercise costs and
tax bills. Stripe, SpaceX, Databricks, and many others have done tender offers
in recent years.

But in the worst case, they simply let the options expire. This has happened!
For example, Foursquare let the stock grant for over 100 former employees
[expire in 2023](https://www.theinformation.com/articles/the-private-tech-company-that-let-employee-stock-grants-evaporate?rc=1qkrrp).
All of a sudden, the equity they thought might have been worth a life changing
amount has turned to dust.

### Loans are dangerous

Another solution people sometimes turn to is loans backed by vested equity. When
the employee exercises their ISOs, the company loans them the money for the
exercise. No money changes hands (on paper it goes from the company to the
employee back to the company), and the employee gets the stock outright. In the
happy case, it seems like a great deal!

If anything goes wrong however, loans can become very dangerous. Consider this
scenario:

> You were a trusted early employee at Startup Inc. You believed in the
> company's prospects and its mission, so you decided to exercise all of your
> equity. The company loaned you the full amount of the exercise so you did not
> have to put money down. Things did not work out as planned, and now the
> company is getting taken over by creditors.

What happens next? None of the scenarios are good:

1. The board members you knew and trusted all resigned, and were replaced by
   people from the creditors. They want their money back! They'll go after you
   for the full value of the loan.
2. The company forgives the loan... but in some cases it is a taxable event! Now
   you owe the IRS some money when in fact you received nothing.

Famously, some Bolt employees
[found themselves in a tough spot](https://www.wired.com/story/bolt-stock-loans/)
after the companies fortunes turned and they were laid off. This is why Fenwick
says taking out such loans is to
["playing with fire"](https://www.fenwick.com/insights/publications/playing-with-fire-loans-to-exercise-options).
Don't do it!

### Exotic setups

Some companies have come up with creative setups, put in place to solve problems
specific to them.

For example: Automattic, makers of wordpress, created a class of stock called
A12 stock that employees can buy and sell in regular windows. A third party
estimates their value on a regular basis, and the company repurchases shares
from those who want them at that price.

It's an elegant solution for a company which has been private for over two
decades, with no liquidity event in sight. But for a traditional venture-backed
company it offers no real advantages.

You can read more about A12 stock on
[Automattic's website](https://automattic.com/benefits/buying-and-selling-automattic-stock/).

## What companies can do

Unfortunately, there are no good solutions to the issues above. The best
companies and founders can do is be thoughtful about the trade-offs at hand, and
carefully craft an option plan that reflects their goals and values.

Too often, entrepreneurs just take a form equity plan provided by their law
firm. These forms are typically employee unfriendly, it's the lawyer's job to
protect the company!

If I were to do it again, here are some things I would consider.

### Issue RSAs until the first priced round

At the earliest stages of a company's journey, the fair market value of common
stock is very low. Instead of giving employees options, give them stock. The
typical way to do that is to issue Restricted Stock Awards (RSAs). The employee
will pay some taxes but probably very little, and they will need to do a bit
more paperwork (e.g. file an 83(b) election within 30 days of the grant). In
return, they become a shareholder right away, and start the long-term capital
gains clock.

Once a company's FMV grows (e.g. beyond $8-10M), it becomes less practical. E.g.
a 0.5% grant vesting over 4 years at $8M FMV would represent a $10,000 gain each
year. Pretty quickly, you need to revert to using options (ISOs).

> Note that FMV for common stock != the value of your last round (as in the
> price of preferred stock). It often is much lower.

In most cases, you would be able to issue RSAs until you raise your first priced
round (vs. SAFEs). This is in effect what founders do for themselves: issue
shares at a very low price (usually par value) in the first days of the company.
I am amazed that it is not more common for employees.

### Issue early-exercisable ISOs until series C

Until the Series C, a company's shares are often QSBS eligible. This is an
incredible tax benefit which may allow your employees to collect long term
capital gains tax-free, provided they held stock for a minimum of 5 years.

Once RSAs are no longer practical, ISOs are usually the best option available.
They do not cost employees anything on grant or upon vesting, and they give them
the flexibility to exercise them when it makes sense for them.

Allowing early exercise on those options is simply a matter of offering maximum
flexibility.

### Issue double trigger, 10-year RSUs thereafter

After the Series C, two things often happen:

1. The company's valuation is so high that exercising options becomes very
   expensive
2. The valuation also means you'll quickly run up against the $100k limit per
   year for ISOs (calculated as FMV \* number of shares)
3. The company's shares are no longer QSBS eligible

At that point, a double trigger RSU is probably the best instrument for
employees.

### Educate employees on equity

Employees are often very naive about the mechanics of equity compensation. To
avoid big surprises down the line, companies should educate them.

Bring in a tax advisor once a year to present to employees and host a Q&A. The
provider will see it as a great lead gen opportunity, and the employees will
appreciate the information.

There are companies who specialize in this kind of training, such as
[Equity FTW](https://www.equityftw.com/corporate-services). A simple place to
start is Carta's excellent [education site](https://carta.com/learn/).

### Conditionally offer longer exercise windows

At the risk of stepping into controversy: I am less enthusiastic about a 10-year
exercise windows than I once was. While in theory it is better than nothing for
the employee, in practice employees rarely consider the difference between ISO
and NSO carefully enough. For the company, it is burdensome at the liquidity
event.

Instead, I recommend conditioning exercise window extension on tenure or some
other factor. Carta for example extends the exercise window by one year for
every year of vesting. Other companies extend the exercise window to five or
seven years after two or three years of employment.

This, to me, strikes a good balance between freeing employees from the 3-month
exercise window and keeping the amount of outstanding NSOs a bit tighter.

### Offer liquidity when possible

> Disclaimer: i've never participated in or run a tender offer.

One of the main constraints with startup equity is that it is illiquid. The
obvious answer is to offer liquidity. Regular tender offers allow employees to
take money off the table, or to exercise their options without needing to drain
their savings.

Of course this is easier said than done. While secondary sales are common
alongside rounds of financing, offering liquidity to all employees typically
requires a tender offer which is a lot more complicated (and expensive). The
main hurdles are:

1. Not every company can easily line up buyers in tender offers. Fundraising is
   hard enough as it is!
2. Very few company have the cash to buy the shares themselves
3. It takes a lot of time and effort.
4. It generates large legal bills.

As a result, tender offers are rare until the very late stage.

Still, they are becoming more common as businesses take longer and longer to
IPO. Leading companies have embraced regular tender offers. Stripe, Databricks,
OpenAI, Anthropic, Gusto, and Notion have all run tender offers in recent years.
SpaceX runs them every six months.

## Conclusion

This turned out quite a bit longer than I expected! The topic is complex, and
matters of law and tax are subject to interpretation. Still it is clear to me
that the current setup is not fit for purpose. In a world where startups stay
private for decades, options that expire after 10 years with a three-month
exercise window do not work.

The setup I described above is the best option for most startups, as I
understand it. And it is what I would do if I started another company. But a
true solution requires regulatory changes.

If it were up to me, I would adjust the exercise window for ISOs to 10 years.
This would give employees greater latitude to leave and would greatly simplify
the payout process in the acquisition of an earlier stage company. Raising the
ISO limit a bit would be a good idea as well, $100k is not what it used to be.

At later stages, RSUs work well enough. You could even argue that the payroll
tax liability that comes with them is a feature not a bug.

Have you seen interesting structures? Do you have ideas for better solutions?
I'd love to hear from you!

Further Readings:

- https://a16z.com/recommendations-for-startup-employee-option-plans/
- https://zachholman.com/posts/the-new-10-year-vesting-schedule
- https://dangelo.quora.com/10-Year-Exercise-Periods-Make-Sense?share=1
- https://www.benkuhn.net/clawback/
- https://carta.com/learn/equity/
