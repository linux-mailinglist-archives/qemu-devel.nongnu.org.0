Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E932C4257
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 15:46:08 +0100 (CET)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khw3b-0004cs-Qz
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 09:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1khw2R-000460-UZ
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 09:44:57 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:42608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1khw2O-0003Zc-Uq
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 09:44:55 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0APEiZLp058832;
 Wed, 25 Nov 2020 14:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=BbTWFrI0oPy6jB3yg/rWXSpGQmF1NWnPJBcXGxpnfJA=;
 b=HyU/PWnYdGgqGOjn8KGgharghXsitWpvR1qY/aX/7KWBeiOEHL5HxatlgIwW9k+vaVA+
 XJQdeTo6GzxHndmzMsYHS5hnkiPcYVp6rnWyzbG3SWKSLQBIS/gRB4SQRC7wtiGz5qET
 mbZ61a72obtpyhSJX7opZGOk7mQxqnY6FwvW3cK4tnnqDrilq7ovsSlw7rn1dt+IauRA
 6JYX4LCmRoF0Q+a9czgpx3H42v5U1s0HDjSpXKHgXEzLHDSzmHcL3WIZjEzbMliGEz+y
 7lg0NM6c6XsKtpvzQE7g+aivL/htMdB4Tw+TaI44O6A1Dd5Xk1TbF/jhd3STfou+alG5 sQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 351kwh9nsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Nov 2020 14:44:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0APEfh3b182944;
 Wed, 25 Nov 2020 14:44:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 351kwecp5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 14:44:46 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0APEij6o005232;
 Wed, 25 Nov 2020 14:44:45 GMT
Received: from starbug-mbp.localdomain (/79.97.215.145)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 25 Nov 2020 06:44:44 -0800
Received: by starbug-mbp.localdomain (Postfix, from userid 501)
 id 1944C23EB1E7; Wed, 25 Nov 2020 14:44:43 +0000 (GMT)
From: Darren Kenny <darren.kenny@oracle.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [RFC 1/1] security-process: update process information
In-Reply-To: <88q0r796-9s48-103n-po28-2o60o9q29499@erqung.pbz>
References: <20201124142238.225417-1-ppandit@redhat.com>
 <20201124142238.225417-2-ppandit@redhat.com> <m2r1oi9117.fsf@oracle.com>
 <88q0r796-9s48-103n-po28-2o60o9q29499@erqung.pbz>
Date: Wed, 25 Nov 2020 14:44:42 +0000
Message-ID: <m2pn41ijhh.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=1
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9815
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 lowpriorityscore=0 suspectscore=1 adultscore=0 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250093
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=darren.kenny@oracle.com; helo=aserp2120.oracle.com
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
 Petr Matousek <pmatouse@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2020-11-25 at 18:18:56 +0530, P J P wrote:
>   Hello Darren, all
>
> +-- On Tue, 24 Nov 2020, Darren Kenny wrote --+
> | I always understood triage to be the initial steps in assessing a bug:
> | 
> | - determining if it is a security bug, in this case
> | - then deciding on the severity of it
> |
> | I would not expect triage to include seeing it through to the point
> | where there is a fix as in the steps above and as such that definition
> | of triage should probably have a shorter time frame.
>
> * Yes, initial triage is to determine if a given issue is a security one and 
>   its impact if so.

Sounds good.

>
> * After above step, an upstream bug (or GitLab issue) shall be filed if the
>   issue can be made public readily and does not need an embargo period.

OK

> * Following step about creating a patch is needed considering the influx of 
>   these issues. If such a patch is not proposed at this time, we risk having 
>   numerous CVE bugs open and unfixed without a patch.
>
> * Sometimes proposed patches take long time to get merged upstream. Hence the 
>   60 days time frame.

Absolutely understand that.

>
> * It does not mean issue report will remain private for 60 days, nope.

OK, it is not the embargo period then, got it.

>
>
> | But, if it is a security bug - then that is when the next steps would be
> | taken, to (not necessarily in this order):
> | 
> | - negotiate an embargo (should the predefined 60 days be insufficient)
> |
> |   - don't know if you need to mention that this would include downstream
> |     in this too, since they will be the ones most likely to need the
> |     time to distribute a fix
>
> * Embargo period is negotiated for important/critical issues. Such embargo 
>   period is generally not more than 2 weeks.

I always thought that the purpose of an embargo period was to enable
downstream to have patches available and ready for distribution, and
preferably distributed already if its something a malicious guest could
use. In that case 2 weeks seems like a pretty short time-frame for all
of that to be completed, especially if it is something that could be
exploitable as soon as the patch lands and is thus visible in upstream
code.

But I guess the negotiation would iron that out at the time, so it's
probably OK to default to 2 weeks.

> * Yes, embargo process includes notifying various downstream communities about 
>   the issue, its fix(es) and co-ordinating disclosure.

OK.

> | - request a CVE
> | - create a fix for upstream
> |   - distros can work on bringing that back into downstream as needed,
> |     within the embargo period
> | 
> | I do feel that it is worth separating the 2 phases of triage and beyond,
> | but of course that is only my thoughts on it, I'm sure others will have
> | theirs.
>
> * Yes, I appreciate it, thanks so much for sharing.
>
> * This patch is to get the qemu-security list up and running. I'll refine the 
>   process further with above/more details as we start using it. Hope that's 
>   okay.

OK, since it was an RFC I didn't think it was the actual patch yet, just
looking for comments ;-)

I'm alright if it gets ironed out more after...

Thanks,

Darren.

>
>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D

