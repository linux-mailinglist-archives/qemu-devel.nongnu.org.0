Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD52CACC2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:52:37 +0100 (CET)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBhU-0003hN-36
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.wilk@oracle.com>)
 id 1kkBfa-0002uu-KW
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:50:38 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:41734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.wilk@oracle.com>)
 id 1kkBfY-0005Cr-19
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:50:38 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1JnYVl007915;
 Tue, 1 Dec 2020 19:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Q69Ey424+law/0j+BNXvZou9sOTw+IUOj+AXbRiJUio=;
 b=a3wLzYnCzH6xEwPOLC7OArH+5g8Y6clzLah49FgLGeXyQA3xHr2eajypfuKXBlSCO7wm
 5cxOJnS3Oy/KHSxaxYDHOGZ5+WF9I3KpeVPNypQI6YqR823QWQe1hsA3GjTBcox6yBND
 NrKOuRPqT89lP3Tttzn54zkPb3Gm+92jklefMBhGi0Osj7vpd9S46Adn2C6tUT1BzHl4
 vjbS7fVHK9B1K9AmwZYcqVGBODeu3xMvIyZzV9bkpU4X+ldca522DAc2oonkEihzotFy
 okbfEoGFkNekQEJXhaugq8DXy9uKAFdogSd3zdP/KH8sfJlKb29IgAJLIIw5QPAzaI2Y Dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 353dyqmgwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 19:49:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1Jk6mS192892;
 Tue, 1 Dec 2020 19:47:53 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 3540eydtut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 19:47:53 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B1Jlk7f008260;
 Tue, 1 Dec 2020 19:47:46 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 11:47:46 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 0492E6A00D6; Tue,  1 Dec 2020 14:49:44 -0500 (EST)
Date: Tue, 1 Dec 2020 14:49:44 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
Message-ID: <20201201194944.GC2246@char.us.oracle.com>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130134907.348505-2-ppandit@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010120
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=konrad.wilk@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 URI_DOTEDU=1.999 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 07:19:07PM +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
> 
> Update the QEMU security process web page with new mailing list
> and triage details.
> 
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Thank you for doing it!

Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

with one change below.

> ---
>  contribute/security-process.md | 134 ++++++++++++++++++++-------------
>  1 file changed, 80 insertions(+), 54 deletions(-)
> 
> Update v1: incorporate feedback from review to include more details
>   -> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg06234.html
> 
> diff --git a/contribute/security-process.md b/contribute/security-process.md
> index 1239967..fe1bc8b 100644
> --- a/contribute/security-process.md
> +++ b/contribute/security-process.md
> @@ -3,43 +3,70 @@ title: Security Process
>  permalink: /contribute/security-process/
>  ---
>  
> -QEMU takes security very seriously, and we aim to take immediate action to
> -address serious security-related problems that involve our product.
> -
> -Please report any suspected security vulnerability in QEMU to the following
> -addresses. You can use GPG keys for respective receipients to communicate with
> -us securely. If you do, please upload your GPG public key or supply it to us
> -in some other way, so that we can communicate to you in a secure way, too!
> -Please include the tag **\[QEMU-SECURITY\]** on the subject line to help us
> -identify your message as security-related. 
> -
> -## QEMU Security Contact List
> -
> -Please copy everyone on this list:
> -
> - Contact Person(s)	| Contact Address		| Company	|  GPG Key  | GPG key fingerprint
> -:-----------------------|:------------------------------|:--------------|:---------:|:--------------------
> - Michael S. Tsirkin	| mst@redhat.com		| Red Hat Inc.	| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0xC3503912AFBE8E67) | 0270 606B 6F3C DF3D 0B17 0970 C350 3912 AFBE 8E67
> - Petr Matousek		| pmatouse@redhat.com		| Red Hat Inc.	| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3E786F42C44977CA) | 8107 AF16 A416 F9AF 18F3 D874 3E78 6F42 C449 77CA
> - Stefano Stabellini	| sstabellini@kernel.org 	| Independent	| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x894F8F4870E1AE90) | D04E 33AB A51F 67BA 07D3 0AEA 894F 8F48 70E1 AE90
> - Security Response Team | secalert@redhat.com		| Red Hat Inc.	| [&#x1f511;](https://access.redhat.com/site/security/team/contact/#contact) |
> - Michael Roth		| michael.roth@amd.com	| AMD		| [&#x1f511;](https://pgp.mit.edu/pks/lookup?op=vindex&search=0x3353C9CEF108B584) | CEAC C9E1 5534 EBAB B82D 3FA0 3353 C9CE F108 B584
> - Prasad J Pandit 	| pjp@redhat.com		| Red Hat Inc.	| [&#x1f511;](http://pool.sks-keyservers.net/pks/lookup?op=vindex&search=0xE2858B5AF050DE8D) | 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D 
> -
> -## How to Contact Us Securely
> -
> -We use GNU Privacy Guard (GnuPG or GPG) keys to secure communications. Mail
> -sent to members of the list can be encrypted with public keys of all members
> -of the list. We expect to change some of the keys we use from time to time.
> -Should a key change, the previous one will be revoked.
> -
> -## How we respond
> -
> -Maintainers listed on the security reporting list operate a policy of
> -responsible disclosure. As such they agree that any information you share with
> -them about security issues that are not public knowledge is kept confidential
> -within respective affiliated companies. It is not passed on to any third-party,
> -including Xen Security Project, without your permission.
> +Please report any suspected security issue in QEMU to the security mailing
> +list at:
> +
> +* [\<qemu-security@nongnu.org\>](https://lists.gnu.org/archive/html/qemu-security/)
> +
> +To report an issue via [GPG](https://gnupg.org/) encrypted email, please send
> +it to the Red Hat Product Security team at:
> +
> +* [\<secalert@redhat.com\>](https://access.redhat.com/security/team/contact/#contact)
> +
> +**Note:** after the triage, encrypted issue details shall be sent to the upstream
> +'qemu-security' mailing list for archival purposes.
> +
> +## How to report an issue:
> +
> +* Please include as many details as possible in the issue report.
> +  Ex:
> +    - QEMU version, upstream commit/tag
> +    - Host & Guest architecture x86/Arm/PPC, 32/64 bit etc.
> +    - Affected code area/snippets
> +    - Stack traces, crash details
> +    - Malicious inputs/reproducer steps etc.
> +    - Any configurations/settings required to trigger the issue.
> +
> +* Please share the QEMU command line used to invoke a guest VM.
> +
> +* Please specify whom to acknowledge for reporting this issue.
> +
> +## How we respond:
> +
> +* Process of handling security issues can be divided in two halves.
> +
> +  1) **Triage:**
> +    - Examine the issue details and confirm whether the issue is genuine
> +    - Validate if it can be misused for malicious purposes
> +    - Determine its worst case impact and severity
> +      [Low/Moderate/Important/Critical]
> +
> +  2) **Response:**
> +    - Negotiate embargo timeline (if required, depending on severity)
> +    - Request a CVE and open an upstream
> +      [bug](https://bugs.launchpad.net/qemu/+bug/)
> +      or a [GitLab](https://gitlab.com/groups/qemu-project/-/issues) issue

You may want to clarify that this step in the process will not disclose the details of the
issue to the public. 

