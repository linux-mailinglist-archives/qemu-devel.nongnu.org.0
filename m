Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D102D6990
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 22:19:54 +0100 (CET)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knTLt-0004nO-9f
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 16:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1knTGT-0003jW-1X
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 16:14:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:60684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1knTGN-0004m1-3d
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 16:14:15 -0500
Date: Thu, 10 Dec 2020 13:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607634847;
 bh=WWc8b9J/0CDj07rmVANEeOfs0EQ+EKDgVkvB8wxAu+U=;
 h=From:To:cc:Subject:In-Reply-To:References:From;
 b=pwoZrwyJM43nRwASUyA1zSf1Y2J6qzveDgk2PtHkLxQCRFn8kYFVzeQSzwp/LQ0D6
 p9wkfvw85lyB1F6afEgAvp7TMMrszE3PzLA0u4McQadixPVbRR/cSz6m+qxnYIrpqu
 +52Oc5EEcFeO9nkNq3oynIUhgU5RyZsjhaBRHSr7PmG5LaoJbRLugLDZ/T3q5WzoKJ
 JEAKHnv/S3kZZUpDVQPphqmCb0N7mdMqNaH4mWDEKTqfLhALFfPDTD+GXt1Qx8UE2+
 1iRuUMo4Z2STNi/57+pm3FGpLjHbZeodGs/xEnFZs0RJVElkzE7+iwbEThX7W7RHEH
 phQcEiEiQCLAA==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH v2 1/1] security-process: update process information
In-Reply-To: <20201203142902.474883-2-ppandit@redhat.com>
Message-ID: <alpine.DEB.2.21.2012101313580.20986@sstabellini-ThinkPad-T480s>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Dec 2020, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
> 
> Update the security process web page with new mailing list address
> and triage details.
> 
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  contribute/security-process.md | 154 ++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 59 deletions(-)
> 
> Update v2: incorporate inputs from upstream reviews
>   -> https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg00568.html
>   -> https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg00584.html
> 
> diff --git a/contribute/security-process.md b/contribute/security-process.md
> index 1239967..13b6b97 100644
> --- a/contribute/security-process.md
> +++ b/contribute/security-process.md
> @@ -3,72 +3,110 @@ title: Security Process
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
> -
> -Email sent to us is read and acknowledged with a non-automated response. For
> -issues that are complicated and require significant attention, we will open an
> -investigation and keep you informed of our progress. We might take one or more
> -of the following steps:
> +Please report any suspected security issue in QEMU to the security mailing
> +list at:
> +
> +* [\<qemu-security@nongnu.org\>](https://lists.nongnu.org/mailman/listinfo/qemu-security)
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
> +* Process of handling security issues comprises following steps:
> +
> +  0) **Acknowledge:**
> +    - A non-automated response email is sent to the reporter(s) to acknowledge
> +      the reception of the report. (*60 day's counter starts here*)
> +
> +  1) **Triage:**
> +    - Examine the issue details and confirm whether the issue is genuine
> +    - Validate if it can be misused for malicious purposes
> +    - Determine its worst case impact and severity
> +      [Low/Moderate/Important/Critical]
> +
> +  2) **Response:**
> +    - Negotiate embargo timeline (if required, depending on severity)
> +    - Request a [CVE](https://cveform.mitre.org/) and open an upstream
> +      [bug](https://www.qemu.org/contribute/report-a-bug/)
> +    - Create an upstream fix patch annotated with
> +        - CVE-ID
> +        - Link to an upstream bugzilla
> +        - Reported-by, Tested-by etc. tags
> +    - Once the patch is merged, close the upstream bug with a link to the
> +      commit
> +        - Fixed in: <commit hash/link>
> +
> +* Above security lists are operated by select analysts, maintainers and/or
> +  representatives from downstream communities.
> +
> +* List members follow a **responsible disclosure** policy. Any non-public
> +  information you share about security issues, is kept confidential within
> +  members of the QEMU security team and a minimal supporting staff in their
> +  affiliated companies. Such information will not be disclosed to third party
> +  organisations/individuals without prior permission from the reporter(s).
> +
> +* We aim to process security issues within maximum of **60 days**. That is not
> +  to say that issues will remain private for 60 days, nope. After the triaging
> +  step above
> +    - If severity of the issue is sufficiently low, an upstream public bug
> +      will be created immediately.
> +    - If severity of the issue requires co-ordinated disclosure at a future
> +      date, then the embargo process below is followed, and upstream bug will
> +      be opened at the end of the embargo period.
> +
> +  This will allow upstream contributors to create, test and track fix patch(es).
>  
>  ### Publication embargo
>  
> -If a security issue is reported that is not already publicly disclosed, an
> -embargo date may be assigned and communicated to the reporter. Embargo
> -periods will be negotiated by mutual agreement between members of the security
> -team and other relevant parties to the problem. Members of the security contact
> -list agree not to publicly disclose any details of the security issue until
> -the embargo date expires.
> +* If a security issue is reported that is not already public and its severity
> +  requires coordinated disclosure, then an embargo date will be set and
> +  communicated to the reporter(s).
> +
> +* Embargo periods will be negotiated by mutual agreement between reporter(s),
> +  members of the security list and other relevant parties to the problem.
> +  The preferred embargo period is upto [2
> +  weeks](https://oss-security.openwall.org/wiki/mailing-lists/distros).
> +  However, longer embargoes may be negotiated if the severity of the issue
> +  requires it.
> +
> +* Members of the security list agree not to publicly disclose any details of
> +  an embargoed security issue until its embargo date expires.
>  
>  ### CVE allocation
>  
> -An security issue is assigned with a CVE number. The CVE numbers will usually
> -be allocated by one of the vendor security engineers on the security contact
> -list.
> +Each security issue is assigned a [CVE](https://cveform.mitre.org/) number.
> +The CVE number is allocated by one of the vendor security engineers on the
> +security list.
>  
> -## When to contact the QEMU Security Contact List
> +## When to contact the QEMU Security List
>  
> -You should contact the Security Contact List if:
> +You should contact the Security List if:
>  * You think there may be a security vulnerability in QEMU.
>  * You are unsure about how a known vulnerability affects QEMU.
>  * You can contact us in English. We are unable to respond in other languages.
>  
> -## When *not* to contact the QEMU Security Contact List
> +## When *not* to contact the QEMU Security List
>  * You need assistance in a language other than English.
>  * You require technical assistance (for example, "how do I configure QEMU?").
>  * You need help upgrading QEMU due to security alerts.
> @@ -76,6 +114,9 @@ You should contact the Security Contact List if:
>  
>  ## How impact and severity of a bug is decided
>  
> +**Security criterion:**
> +    -> [https://www.qemu.org/docs/master/system/security.html](https://www.qemu.org/docs/master/system/security.html)
> +
>  All security issues in QEMU are not equal. Based on the parts of the QEMU
>  sources wherein the bug is found, its impact and severity could vary.
>  
> @@ -122,8 +163,3 @@ used to write programs for the SoC device. In such developer environments, it
>  is generally assumed that the guest is trusted.
>  
>  And thus, this buffer overflow turned out to be a security non-issue.
> -
> -## What to Send to the QEMU Security Contact List
> -
> -Please provide as much information about your system and the issue as possible
> -when contacting the list.
> --
> 2.28.0
> 

