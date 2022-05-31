Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA7538B76
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 08:38:45 +0200 (CEST)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvvWd-0004u9-Vg
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 02:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvvPy-0002xK-9V
 for qemu-devel@nongnu.org; Tue, 31 May 2022 02:31:50 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:48393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvvPv-0005r8-HD
 for qemu-devel@nongnu.org; Tue, 31 May 2022 02:31:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.10])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 46FB9212DF;
 Tue, 31 May 2022 06:31:43 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 31 May
 2022 08:31:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0020d0c090d-1106-4020-9720-ce18badb13cd,
 3316B4EBA022AA703420095FA15BAC10F99B744A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a4496a43-3332-76b7-e4c5-7ab27a7b988c@kaod.org>
Date: Tue, 31 May 2022 08:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 00/25] hw/sd: Rework models for eMMC support
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, <qemu-devel@nongnu.org>
CC: Bin Meng <bin.meng@windriver.com>, <qemu-block@nongnu.org>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fc410515-0bc0-425b-b335-a0ae630c7580
X-Ovh-Tracer-Id: 13136718641791011689
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekjeevfefhfeehkeegleehkeejtdeikefhffegjefhvdekgfduveehffdttefhgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgrihdrphgrvhgrnhdrsghougguuhesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/22 21:37, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Rebase/respin of Cédric RFC:
> https://lore.kernel.org/qemu-devel/20220318132824.1134400-1-clg@kaod.org/
> (sorry it took me so long guys...)
> 
> Pushed at https://gitlab.com/philmd/qemu/-/commits/emmc-v2
> 
> I plan to queue patches 1-12 via sdmmc-next later this week.
> 
> Cédric, if you are happy with this series, it should be easy to rebase
> your other patches on top and address the comments I left on the RFC :)

Sure. I will for the first patches to be merged and I might introduce
a base class.

Thanks,

C.

> 
> Regards,
> 
> Phil.
> 
> Cédric Le Goater (6):
>    hw/sd: Add sd_emmc_cmd_SEND_OP_CMD() handler
>    hw/sd: Add sd_emmc_cmd_ALL_SEND_CID() handler
>    hw/sd: Add sd_emmc_cmd_SEND_RELATIVE_ADDR() handler
>    hw/sd: Add sd_emmc_cmd_APP_CMD() handler
>    hw/sd: add sd_emmc_cmd_SEND_TUNING_BLOCK() handler
>    hw/sd: Add sd_emmc_cmd_SEND_EXT_CSD() handler
> 
> Joel Stanley (4):
>    hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler
>    hw/sd: Support boot area in emmc image
>    hw/sd: Subtract bootarea size from blk
>    hw/sd: Add boot config support
> 
> Philippe Mathieu-Daudé (13):
>    hw/sd/sdcard: Return ILLEGAL for CMD19/CMD23 prior SD spec v3.01
>    hw/sd: When card is in wrong state, log which state it is
>    hw/sd: When card is in wrong state, log which spec version is used
>    hw/sd: Move proto_name to SDProto structure
>    hw/sd: Introduce sd_cmd_handler type
>    hw/sd: Add sd_cmd_illegal() handler
>    hw/sd: Add sd_cmd_unimplemented() handler
>    hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
>    hw/sd: Add sd_cmd_SEND_OP_CMD() handler
>    hw/sd: Add sd_cmd_ALL_SEND_CID() handler
>    hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler
>    hw/sd: Add sd_cmd_SET_BLOCK_COUNT() handler
>    hw/sd: Basis for eMMC support
> 
> Sai Pavan Boddu (2):
>    hw/sd: Add CMD21 tuning sequence
>    hw/sd: Add mmc switch function support
> 
>   hw/sd/sd.c             | 645 +++++++++++++++++++++++++++++++++--------
>   hw/sd/sdmmc-internal.c |   2 +-
>   hw/sd/sdmmc-internal.h |  97 +++++++
>   include/hw/sd/sd.h     |   7 +
>   4 files changed, 627 insertions(+), 124 deletions(-)
> 


