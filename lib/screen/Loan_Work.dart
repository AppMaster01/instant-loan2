// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:loan_instant_2/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:loan_instant_2/Controller_Page/widget_controller/controller.dart';

import '../Media_qury.dart';
import '../ads/Google_Ads.dart';

class Loan_Work extends StatefulWidget {
  const Loan_Work({
    Key? key,
  }) : super(key: key);

  @override
  State<Loan_Work> createState() => _Loan_WorkState();
}

class _Loan_WorkState extends State<Loan_Work> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Loan_Work', ''),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3F3),
        appBar: controllerAppbar.getappbar("Instant Cash", () {
          backbuttoncontroller.showBackbuttonad(context, '/Loan_Work', '');
        }),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  native.getNT(context, '/Loan_Work', 'listTileMedium'),
                  SizedBox(height: ScreenSize.fSize_10()),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffF1FCF9),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              children: [
                                SizedBox(height: ScreenSize.fSize_25()),
                                Text('How Do Payday Loans Work?',
                                    style: GoogleFonts.almarai(
                                      fontWeight: FontWeight.w700,
                                      fontSize: ScreenSize.fSize_18(),
                                      color: const Color(0xff2F364D),
                                    )),
                                SizedBox(height: ScreenSize.fSize_6()),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    (""" Payday loans have become the face of predatory lending in America for one reason: The interest rate on the average payday loan is 391%. And that’s if you pay it back in two weeks! If you can’t repay the loans – and the Consumer Financial Protection Bureau says 80% of payday loans don’t get paid back in two weeks – then your interest rate soars to 521% and continues rising every time you can’t repay the debt. Compare payday loan interest rates to the average rate for alternative choices like credit cards (15%-30%); debt management programs (8%-10%); personal loans (14%-35%) and online lending (10%-35%). Nonetheless, research by the St. Louis Federal Reserve shows that more than 12 million Americans, mostly poor consumers without access to credit cards or bank loans, instead turn to payday lenders to solve short-term financial problems. In 2019, they borrowed \$29 billion and paid an astonishing \$9 billion in fees to do so, according to the Federal Reserve. ## Payday Loan Changes Retracted The Consumer Financial Protection Bureau introduced a series of regulation changes in 2017 that were supposed to protect borrowers by forcing the payday lenders to determine if the borrower could afford to take on a loan with a 391% interest rate. However, the Trump administration rejected the argument that consumers needed protection. The CFPB has since decided it will remove the regulation altogether, though they promised to take public comment on it through June of 2020. Here are the five changes to protect consumers that originally were approved, but now appear to be dead in the water. ### Full Payment Test Payday lenders would have to verify the borrower’s income to determine whether he/she could cover basic financial obligations (housing, food, clothing, transportation) and have enough income to repay the loan. Lenders also would have to look at the borrower’s credit report to check for other loan obligations. ### Principal Payoff Option This rule would limit the consumer to borrowing nor more than \$500 if they couldn’t pass the “Full Payment Test.” **Other restrictions include:** * Not allowing the lender to take the borrower’s car title as collateral for a loan. * Not allowing the lender to make a loan to a consumer who already has a short-term loan. * Restricting loan extensions to borrower who paid at least one-third of the principal owed on each extension. * Requiring lenders to disclose the Principal Payoff Option to all borrowers. ### Cooling Off Period When borrowers can’t repay the original loan after two weeks, they often “Roll Over” the loan and are charged fees and interest again for an increased amount. This proposal said that there must be a 30-day “cooling off period” for borrowers who have taken out a loan and rolled it over twice, before they can request another loan. ### Mandatory Reporting This regulation would have required lenders to report their loans to the three major credit reporting bureaus and update them as payments are made or not made. ### Alternate Options Lenders would have been required to offer longer-term loans that would mean considerably less risk for borrowers. That would include an option to limit interest rates to 28% (APR). Another option would be to have fixed payments over a two-year period with an interest rate no higher than 36%. Though the fate of the five changes hasn’t officially been decided, the CFPB appears to be headed in the direction of abandoning them, at least the part where payday lenders would have to do research to determine if the borrower could afford the loan. ## How Do Payday Loans Work? Payday loans are a quick-fix solution for consumers in a financial crisis, but also are budget busting expenses for families and individuals. **Here is how a payday loan works:** * Consumers fill out a registration form at a Payday lending office. Identification, a recent pay stub and bank account number are the only documents needed. * Loan amounts vary from \$50 to as much as \$1,000, depending on the law in your state. If approved, you receive cash on the spot. * Full payment is due on the borrower’s next payday, which typically is two weeks. * Borrowers either post-date a personal check to coincide with their next paycheck or give the payday lender electronic access to withdraw funds from the customer’s bank account. * Payday lenders usually charge interest of \$15-\$20 for every \$100 borrowed. Calculated on an annual percentage rate basis (APR) – the same as is used for credit cards, mortgages, auto loans, etc. – that APR ranges from 391% to more than 521% for payday loans. ## What Happens If You Can’t Repay Payday Loans? If a consumer can’t repay the loan by the two-week deadline, they can ask the lender to “roll over” the loan and an already steep price to borrow grows even higher. On a “roll over” loan, customers must pay the original loan amount and finance charge, plus an additional finance charge on the new total. For example, the average payday loan is \$375. Using the lowest finance charge available (\$15 per \$100 borrowed), the customer owes a finance charge of \$56.25 for a total loan amount of \$431.25. If they chose to “roll over” the payday loan, the new amount would be \$495.94. That is the amount borrowed \$431.25, plus finance charge of \$64.69 = \$495.94. That is how a \$375 loan becomes nearly \$500 in one month. ## How Payday Loan Finance Charges Are Calculated The average payday loan in 2020 was \$375. The average interest – or “finance charge” as payday lenders refer to it – for a \$375 loan would be between \$56.25 and \$75, depending on the terms you accept. That interest/finance charge typically is somewhere between 15% and 20%, depending on the lender, but could be higher. State laws regulate the maximum interest a payday lender may charge. The amount of interest paid is calculated by multiplying the amount borrowed by the interest charge. From a mathematical standpoint, it looks like this for a 15% loan: 375 x .15 = 56.25. If you accepted terms of \$20 per \$100 borrowed (20%), it would look like this: 375 x .20 = 75. That means you must pay \$56.25 to borrow \$375. That is an interest rate of 391% APR. If you pay \$20 per \$100 borrowed, you pay a finance charge of \$75 and an interest rate of 521% APR. ## How Payday Loan Interest Rates Are Calculated The annual percentage interest rate (APR) for payday loans is calculated by dividing the amount of interest paid by the amount borrowed; multiplying that by 365; divide that number by the length of repayment term; and multiply by 100. In mathematical terms, the APR calculations on a \$375 loan look like this: 56.25 ÷ 375 = .15 x 365 = 54.75 ÷ 14 = 3.91 x 100 = 391%. For the \$20 per \$100 borrowed (or 20%) on a \$375 loan, it looks like this: 75 ÷ 375 = .2 x 365 = 73 ÷ 14 = 5.21 x 100 = 521%. Again, those APR as astronomically higher than any other lending offered. If you used a credit card instead, even at the highest credit card rate available, you are paying less than one-tenth the amount of interest that you would on a payday loan. ## Payday Loan Alternatives Surveys suggest that 12 million American consumers get payday loans every year, despite warnings from several sources about the soaring cost of that system. There are other ways to find debt relief without resorting to payday loans. Community agencies, churches and private charities are the easiest places to try. * **Paycheck advance: **Companies across the nation are offering employees a chance to get money they earned before their paycheck is due. For example, if an employee has worked seven days and the next scheduled paycheck isn’t due for another five days, the company can pay the employee for the seven days. It is not a loan. It will be deducted when the next payday arrives. * **Borrow from family or friends: **Borrowing money from friends or family is undoubtedly the fastest solution and should be the least expensive way to dig yourself out of trouble. You would expect to pay much lower interest rate and have far more generous timeframe than two weeks to pay off a loan, but make sure this is a business deal that makes both sides happy. Draw up an agreement that makes the terms of the loan clear … and stick to it! * **Credit Counseling: **Nonprofit credit counseling organizations like InCharge Debt Solutions offer free advice on setting up an affordable monthly budget. * **Debt management plans:** The nonprofit credit counseling agencies like InCharge Debt Solutions also offer a paid service to reduce credit card debt through debt management plans. The service will reduce interest rates on your credit cards to 8% (sometimes lower) and thus free up money to pay things like rent, utilities and auto repairs. InCharge credit counselors can direct you to places in your area that offer assistance with food, clothing, rent and utility bills to help people get through a financial crisis. * **Debt Settlement:** If trying to keep pace with unsecured debt (credit cards, hospital bills, personal loans) is the reason you’re always out of money, you could choose debt settlement as a debt-relief option. Debt settlement means negotiating to pay less than what you owe, but it comes with a heavy price on your credit score. * **Local charities and churches: **If you have hit a bump in the road, there are a surprising number of charities and churches willing to lend assistance at no cost. Organizations like United Way, Salvation Army and church-sponsored ministries like the St. Vincent de Paul Society often step in when all you need is a few hundred dollars to get through a tough stretch. * **Community banks and credit unions: **The regulations allow local banks and credit unions to make smaller loans on easier repayment terms than the large regional or national banks do. Call or visit to compare interest rates, which could be as low as 10%-12% as compared to 400%-500% rates on payday loans. * **Peer-to-Peer Lending: **If you’re still having problem finding a source of money, go online and check the peer-to-peer lending sites. The interest rates could be close to 35% than the 6% rate those with great credit receive, but 35% is still a lot better than the 391% from a payday lender. ## Payday Loans Target Military, Low-Income Payday lenders prey on people in desperate economic situations, meaning low-income, minority families, members of the military and anyone else who has limited credit options. The CFPB estimates that 80% of payday loans get rolled over and 20% end up in default, which goes on your credit report for seven years and all but eliminates you from getting loans in the near future. Another penalty consumers often incur from payday loans is bounced-check charges from you bank. If you don’t have the money in your account when the payday lender tries to cash the post-dated check you wrote, there is a penalty of \$25-\$35. Default also opens you up to harassment from debt collection agencies, who either buy the loan from the payday lender or are hired to collect it. Either way, you can expect the phone to ring until you pay. There also is long-term damage to your credit score. Though some payday lenders don’t report directly to the three major credit reporting bureaus in the United States, most report to the minor agencies. If the debt goes to a collection agency, that agency almost always reports non-payment to the major credit bureaus, which ruins your credit. ### Laws and Rules of Payday Loans Payday lenders do have to abide by both federal and state laws. As required by the federal Truth in Lending Act, payday lenders are required to disclose the dollar amount of the finance charge and the corresponding APR in writing. The CFPB implements and enforces federal regulations, including the Payday Rule. The intention of the law, which has been challenged by the payday loan industry, is to impose strict restrictions on payday lenders. It requires an affordability test and limits rollovers as well as the number of times a checking account can be debited""")
                                        .replaceAll("##", '\n'),
                                    style: GoogleFonts.almarai(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff2F364D),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ScreenSize.fSize_100(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: ScreenSize.fSize_50(),
                        left: ScreenSize.horizontalBlockSize! * 63,
                        child: GestureDetector(
                          onTap: () {
                            controller.showbuttonad(
                                context, '/Home_Screen', '/Loan_Work', '');
                          },
                          child: Container(
                            width: ScreenSize.fSize_150(),
                            height: ScreenSize.fSize_55(),
                            decoration: const BoxDecoration(
                                color: Color(0xff009A73),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35),
                                    bottomLeft: Radius.circular(35),
                                    bottomRight: Radius.circular(35))),
                            child: Center(
                              child: Text(
                                'Continue',
                                style: GoogleFonts.almarai(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: ScreenSize.fSize_23()),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_50()),
                ],
              ),
            ),
            banner.getBN('/Loan_Work'),
          ],
        ),
      ),
    );
  }
}
