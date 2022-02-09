Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A904AED83
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 10:04:05 +0100 (CET)
Received: from localhost ([::1]:36150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHitP-0001Ll-Va
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 04:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhep-0003P7-DR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:44:57 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:48053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhek-0005eu-S2
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:44:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5B5FB20F34;
 Wed,  9 Feb 2022 07:44:36 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 08:44:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006691d3ddc-5c08-425e-9d28-cbf15ef90c06,
 D657DFC387B0B0E2C5DD546C0716E11BBFCF4DEE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.223.183
Message-ID: <591aedba-0cc8-0907-f55f-1366dfb8b7d3@kaod.org>
Date: Wed, 9 Feb 2022 08:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 00/10] target/ppc: powerpc_excp improvements [7xx] (8/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220204173430.1457358-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220204173430.1457358-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7cf41642-8553-47ec-b4fe-c5e7665d1b7b
X-Ovh-Tracer-Id: 8134626827225107363
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjedtiedvueekffejtdfhvdfhhfevteefffdtteetueevuefhieekgeeuteffledtnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpnhhonhhgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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

On 2/4/22 18:34, Fabiano Rosas wrote:
> This series handles the 7xx family: 740, 745, 750, 750cl, 750cx,
> 750fx, 750gx and 755.
> 
> changes from v1:
> 
> - add back sc 1 support for pegasos2. I have opened an issue to track
>    this: https://gitlab.com/qemu-project/qemu/-/issues/859
> 
> v1:
> https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00043.html
> 
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
>   target/ppc/cpu_init.c    |  16 +--
>   target/ppc/excp_helper.c | 207 ++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 216 insertions(+), 13 deletions(-)
> 


Applied to ppc-7.0.

Thanks,

C.


