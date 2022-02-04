Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D394A95B2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:04:10 +0100 (CET)
Received: from localhost ([::1]:51478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuVi-0008OZ-Hy
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nFtW1-0007wG-Qt
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 03:00:22 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:55661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nFtVx-0000nr-23
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 03:00:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.134])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B175821C0B;
 Fri,  4 Feb 2022 08:00:13 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Feb
 2022 09:00:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004707009c2-91f2-4151-bed0-a3a00c0849cd,
 E02F21966AB5735DF2D4F60193DC12F1F11ACCB9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <35197e01-f2fd-0153-aede-ba06d12cb1ee@kaod.org>
Date: Fri, 4 Feb 2022 09:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/10] target/ppc: powerpc_excp improvements [7xx] (8/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220203224246.1446652-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bbf2e4d7-0863-4145-b5c8-f6181bcfeb97
X-Ovh-Tracer-Id: 15928387460745694115
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgeekgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 23:42, Fabiano Rosas wrote:
> This series handles the 7xx family: 740, 745, 750, 750cl, 750cx,
> 750fx, 750gx and 755.

What about powerpc_excp_legacy() ? Can we remove it now ?

Thanks,

C.

> Fabiano Rosas (10):
>    target/ppc: Merge 7x5 and 7x0 exception model IDs
>    target/ppc: Introduce powerpc_excp_7xx
>    target/ppc: Simplify powerpc_excp_7xx
>    target/ppc: 7xx: Machine Check exception cleanup
>    target/ppc: 7xx: External interrupt cleanup
>    target/ppc: 7xx: Program exception cleanup
>    target/ppc: 7xx: System Call exception cleanup
>    target/ppc: 7xx: System Reset cleanup
>    target/ppc: 7xx: Software TLB cleanup
>    target/ppc: 7xx: Set SRRs directly in exception code
> 
>   target/ppc/cpu-qom.h     |   6 +-
>   target/ppc/cpu_init.c    |  16 ++--
>   target/ppc/excp_helper.c | 185 ++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 194 insertions(+), 13 deletions(-)
> 


