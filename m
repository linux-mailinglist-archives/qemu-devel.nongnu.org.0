Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ACC2C2D26
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:42:11 +0100 (CET)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khbOM-0001av-5q
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1khb74-0000OZ-D3
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:24:18 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1khb72-0001tF-2B
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:24:17 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AOGESu4182827;
 Tue, 24 Nov 2020 16:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=74aB0HwoLbebVtOpcJXYrRNScTts15WDk/rp/kEvIgw=;
 b=CR8ViMuaxfPEFQia2qr0FfPAEHMDdpjg9bqFStIKP1B+PANEqAxDPtOtrnj6G81F9aGU
 /JIMn+O/NT6wj+lqdsbH34YNZJ2hFc3rU0rVxz537rQcCdAx/dfMgETSdjM0ZvmV0CtY
 D5e8RFJPxvnwwVByEzzGSkSAQDKMzQokCtU3ENA2nYQD3x4AoMfn5tv51ab6/bLCv0nZ
 wYKlJJl2RsPTjbRH/+e6DcInnsB9M2GjDlZBfwSjELag+wboBU+dQGwDcNKnT6MAst8z
 4TgsJiG7FeRJa0dXKDzf6FZAizsf+PBO8d5viAaOTpqNrHXJPl1/rPDLfMpXUn2dizl+ qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3514q8gbb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 16:23:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AOGFgsl127102;
 Tue, 24 Nov 2020 16:23:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34yx8k2u3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 16:23:40 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AOGNbfX029480;
 Tue, 24 Nov 2020 16:23:38 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 24 Nov 2020 08:23:37 -0800
Received: by starbug-mbp.localdomain (Postfix, from userid 501)
 id D37DF23C48F5; Tue, 24 Nov 2020 16:23:32 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: P J P <ppandit@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [RFC 1/1] security-process: update process information
In-Reply-To: <20201124142238.225417-2-ppandit@redhat.com>
References: <20201124142238.225417-1-ppandit@redhat.com>
 <20201124142238.225417-2-ppandit@redhat.com>
Date: Tue, 24 Nov 2020 16:23:32 +0000
Message-ID: <m2r1oi9117.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=2
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 clxscore=1011
 impostorscore=0 mlxscore=0 suspectscore=2 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240101
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=darren.kenny@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, secalert@redhat.com,
 Michael Roth <michael.roth@amd.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad,

Thanks for writing this up.

I have some comments below on the response steps.

On Tuesday, 2020-11-24 at 19:52:38 +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> We are about to introduce a qemu-security mailing list to report
> and triage QEMU security issues.
>
> Update the QEMU security process web page with new mailing list
> and triage details.
>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  contribute/security-process.md | 105 +++++++++++++++++----------------
>  1 file changed, 55 insertions(+), 50 deletions(-)
>
> diff --git a/contribute/security-process.md b/contribute/security-process.md
> index 1239967..a03092c 100644
> --- a/contribute/security-process.md
> +++ b/contribute/security-process.md

...

> +## How we respond:
> +
> +* Steps to triage:
> +    - Examine and validate the issue details to confirm whether the
> +      issue is genuine and can be misused for malicious purposes.
> +    - Determine its worst case impact and severity(Low/M/I/Critical)
> +    - Negotiate embargo timeline (if required)
> +    - Request a CVE and open an upstream bug
> +    - Create an upstream fix patch
> +
> +* Above security lists are operated by select analysts, maintainers and/or
> +  representatives from downstream communities.
> +
> +* List members follow a **responsible disclosure** policy. Any non-public
> +  information you share about security issues, is kept confidential within the
> +  respective affiliated companies. Such information shall not be passed on to
> +  any third parties, including Xen Security Project, without your prior
> +  permission.
> +
> +* We aim to triage security issues within maximum of 60 days.

I always understood triage to be the initial steps in assessing a bug:

- determining if it is a security bug, in this case

- then deciding on the severity of it

I would not expect triage to include seeing it through to the point
where there is a fix as in the steps above and as such that definition
of triage should probably have a shorter time frame.

At this point, if it is not a security bug, then it should just be
logged as any other bug in Qemu, which goes on to qemu-devel then.

But, if it is a security bug - then that is when the next steps would be
taken, to (not necessarily in this order):

- negotiate an embargo (should the predefined 60 days be insufficient)

  - don't know if you need to mention that this would include downstream
    in this too, since they will be the ones most likely to need the
    time to distribute a fix

- request a CVE

- create a fix for upstream

  - distros can work on bringing that back into downstream as needed,
    within the embargo period

I do feel that it is worth separating the 2 phases of triage and beyond,
but of course that is only my thoughts on it, I'm sure others will have
theirs.

Thanks,

Darren.



