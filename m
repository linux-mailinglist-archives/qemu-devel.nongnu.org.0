Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DBA489D88
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:28:56 +0100 (CET)
Received: from localhost ([::1]:49262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xXT-0002t5-L1
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:28:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6xUM-0001YP-VP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:25:43 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:58869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6xUK-0000LN-H3
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 11:25:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 654AF21E05;
 Mon, 10 Jan 2022 16:25:37 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 17:25:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040016cf79-eeaf-4919-b74c-f7f42259b134,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e48e7e1b-d498-ae70-1fcb-8249500793af@kaod.org>
Date: Mon, 10 Jan 2022 17:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/10] user creatable pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220110143346.455901-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 795d29b2-d7ba-4852-8b57-1ddb90b1f35a
X-Ovh-Tracer-Id: 6773695314889903072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteevleduueffffelveelheekuedtveehkedutefffffhkedutdehgfdtjefhtdffnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 15:33, Daniel Henrique Barboza wrote:
> Hi,
> 
> This v3 contains new versions of pnv-phb4 exclusive patches from
> version 2. Patches 1-10 are already accepted.
> 
> I changed how patch 9 (v2 patch 17) works by doing everything possible
> in extra patches/cleanups beforehand, and then using patch 9 to flip the
> switch in a single step. This means that handling the default initialization
> of pnv-phb4s is done at the same time we enable user creatable pnv-phb4s.
> 
> There's also a change in how XSCOM initializion is being handled. We're not
> using a flag to do a partial XSCOM initialization during phb4_realize() anymore.
> Intead, we moved XSCOM initialization code, as less intrusive as we could, to
> phb4_realize().
> 
> This time I also took the precaution of testing the default case
> (i.e. running without -nodefaults) in every patch. v2 was breaking
> this default run between some patches.
> 
> changes from v2:
> - former patch 16: removed
> - patch 10 (v2 18): unchanged
> - patches 4,5,7,8: new
> - patch 9 (former 17):
>    * added g_assert() if stack == NULL
>    * added a comment explaining why we shouldn't assert on user error
> with wrong chip-id/index values
> - minor changes across the patches due to the design changes
> - v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00671.html
> 
> Daniel Henrique Barboza (10):
>    pnv_phb4.c: introduce pnv_phb4_set_stack_phb_props()
>    pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
>    pnv_phb4_pec: use pnv_phb4_pec_get_phb_id() in pnv_pec_dt_xscom()
>    pnv_phb4_pec.c: remove stack 'phb-id' alias
>    pnv_phb4_pec.c: move phb4 properties setup to pec_realize()
>    ppc/pnv: turn 'phb' into a pointer in struct PnvPhb4PecStack
>    ppc/pnv: move PHB4 related XSCOM init to phb4_realize()
>    pnv_phb4.c: check stack->phb not NULL in phb4_update_regions()
>    ppc/pnv: Introduce user creatable pnv-phb4 devices
>    pnv_phb4.c: change TYPE_PNV_PHB4_ROOT_BUS name

I have taken Patches 10, 2, 3 in this order. There is still some PHB4
code outside the PHB4 realize routine and this is making the code too
complex. We are getting closer !

Could you use the 'ppc/pnv:' prefix ?

Thanks,

C.

