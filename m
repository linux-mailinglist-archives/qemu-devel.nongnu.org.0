Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F532988D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:53:37 +0100 (CET)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1ih-0004Vi-VI
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lH1ht-00040N-6W; Tue, 02 Mar 2021 04:52:45 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:59871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lH1hr-00043F-7c; Tue, 02 Mar 2021 04:52:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 626588C46C98;
 Tue,  2 Mar 2021 10:52:38 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Mar 2021
 10:52:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00242b04459-82aa-45bf-8416-f0443c9f31cf,
 EADD5358444B4E8CC3FCA0863879143292018689) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 00/21] eMMC support
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Bin Meng <bin.meng@windriver.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d6a5132a-6158-b7ee-b1cb-c7ae5e5fdd6a@kaod.org>
Date: Tue, 2 Mar 2021 10:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 59dfe598-80d1-498f-9cdb-c86dff296651
X-Ovh-Tracer-Id: 785315187835636691
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshgrihdrphgrvhgrnhdrsghougguuhesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Adding the SD maintainers for more feedback. 

Thanks,

C.

On 2/28/21 8:33 PM, Sai Pavan Boddu wrote:
> Hi,
> 
> This patch series add support for eMMC cards. This work was previosly
> submitted by Vincent, rebased few changes on top.
> 
> Cedric & Joel has helped to added boot partition access support. I
> expect them to make a follow-up series to use it with aspeed machines.> 
> Present series adds eMMC support to Versal SOC.
> 
> Initial patch series version is RFC
> Changes for V2:
> 	Split Patch 1
> 	Add comments for eMMC Erase commands
> 	Added documentation about eMMC and Versal-virt board.
> 	Make eMMC optional for xlnx-versal-virt machines
> Changes for V3:
> 	Revome addition of EMMC drive flag
> 	Add TYPE_EMMC device
> 	Add id strings for shci instances
> 	Update versal doc with eMMC example
> 	Fix signed-off-by lines for few patches
> 
> Cédric Le Goater (1):
>   sd: sdmmc-internal: Add command string for SEND_OP_CMD
> 
> Joel Stanley (2):
>   sd: emmc: Support boot area in emmc image
>   sd: emmc: Subtract bootarea size from blk
> 
> Sai Pavan Boddu (14):
>   sd: sd: Remove usage of tabs in the file
>   sd: emmc: Add support for eMMC cards
>   sd: emmc: Dont not update CARD_CAPACITY for eMMC cards
>   sd: emmc: Update CMD1 definition for eMMC
>   sd: emmc: support idle state in CMD2
>   sd: emmc: Add mmc switch function support
>   sd: emmc: add CMD21 tuning sequence
>   sd: emmc: Make ACMD41 illegal for mmc
>   sd: emmc: Add support for emmc erase
>   sd: emmc: Update CID structure for eMMC
>   sd: sdhci: Support eMMC devices
>   arm: xlnx-versal: Add emmc to versal
>   docs: devel: emmc: Add a doc for emmc card emulation
>   docs: arm: xlnx-versal-virt: Add eMMC support documentation
> 
> Vincent Palatin (4):
>   sd: emmc: Update SET_RELATIVE_ADDR command
>   sd: emmc: update OCR fields for eMMC
>   sd: emmc: Add support for EXT_CSD & CSD for eMMC
>   sd: emmc: Update CMD8 to send EXT_CSD register
> 
>  docs/devel/emmc.txt                  |  16 +
>  docs/system/arm/xlnx-versal-virt.rst |  14 +
>  hw/sd/sdmmc-internal.h               |  97 ++++++
>  include/hw/arm/xlnx-versal.h         |   1 +
>  include/hw/sd/sd.h                   |   2 +
>  hw/arm/xlnx-versal-virt.c            |  29 +-
>  hw/arm/xlnx-versal.c                 |  14 +-
>  hw/sd/sd.c                           | 563 ++++++++++++++++++++++++++---------
>  hw/sd/sdhci.c                        |   4 -
>  hw/sd/sdmmc-internal.c               |   2 +-
>  10 files changed, 594 insertions(+), 148 deletions(-)
>  create mode 100644 docs/devel/emmc.txt
> 


