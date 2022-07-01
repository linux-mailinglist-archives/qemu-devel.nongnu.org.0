Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A956286B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:39:40 +0200 (CEST)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75dD-0003Ty-1T
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o75aM-0002N9-NI; Thu, 30 Jun 2022 21:36:42 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:37835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o75aG-0001wi-JH; Thu, 30 Jun 2022 21:36:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C217D2B0588C;
 Thu, 30 Jun 2022 21:36:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 21:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656639392; x=
 1656642992; bh=mJaVCOzGop0+EwoM/pCLV7nmhF4vRMY0KdW746isyYY=; b=6
 VzgwJg3T+L91OVaeFp0f/uCLRiY8zFUaFsbsHf/Y48yiPyDBphitRiawTJE1mRx+
 VvQda5//NHAiA3cRtxBI99155vo9c2yhE8xBUNLobO2F47sfWmGNaHnD38FuZPIp
 0ciAgyeez5+GZiuKYBl+PJCZ4RAjOsTxyTUpV4oMqrSnuf3YD9oijD/vd9W2DXBb
 pYNNrYzBPpCaP27uO/KtkhF/NWLDC9zAqWkg0/GNWJh0/1s8gklJCK6rKZpcQk+Q
 ZiaVmRXQBNBRbfo1hyhJ2hxnHdAlf9nYLmHUPLixzrQUWetw5+m4nWUrMi8qXIio
 LTnZBuM3Ug1wkL48+HLGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2; t=
 1656639392; x=1656642992; bh=mJaVCOzGop0+EwoM/pCLV7nmhF4vRMY0KdW
 746isyYY=; b=R7GtQydX7ns+9tg+9Oui4KdmD6epfN6Ba5i0AxpQtcPrCl+Th/U
 2x10hUnK9oHPJTaSwzuTwuQDU8qE2D7u4FLQiXnOvRAahH2yDo/iouPkEPOlh+5/
 NcFcJnFsaDLjKWN4tOt6EuDzIS3nGKjz4FVLYfNvfU+fW/pVkC6r/O3mpUBWEfMc
 FTzVgxDrELpa4BgiIh9x13sl8FEOvKr5hQbXcAM4lNomiWq55EMaKbS2j227OAlt
 DPqSnEmGbD7TqwTOEDHVpy2B93JVhIZEdG9lDW7KemJ6dHHptHxFSR2m4sdBkN23
 FOzwQJaKc6SJLngPwz2KnmqAJqiOfM6H8aQ==
X-ME-Sender: <xms:n0--YqgyBIZEL4H9JyCl8m_-w10_cNePZvOOD7V4c8e75fQH9BvJeA>
 <xme:n0--YrCdIoDmxv0-ioaRgsKl68MNNjtOcQQPCK0qkOYkpUJzCBFQvPTxlrCTjCuV-
 zq5_5Jzn2KEbw2WD-s>
X-ME-Received: <xmr:n0--YiGcCZ7nhC5ZBBOtMQcDCpfUBMvnBSJOm2yv7CCuQd_FOpwQOppUOWNU5-MXeKjR5ocJK73Sl-IwOJ1N4h5d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrthhtvg
 hrnhepfefhhfekvdekgfdtffeuudejvdffkeefvddtfeduuefhjedviefhkefgjeefuddu
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvse
 hpjhgurdguvghv
X-ME-Proxy: <xmx:n0--YjSMrL17yf76f9bYtnRgqsQhzXkW7TfM6-bmSU6YLRzxYczngw>
 <xmx:n0--YnwuolxT7X53cwweomgb4O8mvyDDoBV-dXdIULi-WE9iEa2KjA>
 <xmx:n0--Yh7PBwppQY4sQXWcd4QWRLZ_u-xgc4JPPjKJCKKVw0N3r93mMg>
 <xmx:oE--Ypsh7EXP5O_Kw-uu5GHyyKsh7aqSLJRjyZWrRIQneeUQYws3bIg3W6o>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 21:36:31 -0400 (EDT)
Date: Thu, 30 Jun 2022 18:36:29 -0700
From: Peter Delevoryas <me@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 3/3] aspeed: sbc: Allow per-machine settings
Message-ID: <Yr5Pnbh3Fbtxdpsk@pdel-mbp.dhcp.thefacebook.com>
References: <20220628154740.1117349-1-clg@kaod.org>
 <20220628154740.1117349-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628154740.1117349-4-clg@kaod.org>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=me@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, Jun 28, 2022 at 05:47:40PM +0200, Cédric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
> 
> In order to correctly report secure boot running firmware the values
> of certain registers must be set.
> 
> We don't yet have documentation from ASPEED on what they mean. The
> meaning is inferred from u-boot's use of them.
> 
> Introduce properties so the settings can be configured per-machine.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/misc/aspeed_sbc.h | 13 ++++++++++++
>  hw/misc/aspeed_sbc.c         | 41 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
> index 67e43b53ecc3..405e6782b97a 100644
> --- a/include/hw/misc/aspeed_sbc.h
> +++ b/include/hw/misc/aspeed_sbc.h
> @@ -17,9 +17,22 @@ OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
>  
>  #define ASPEED_SBC_NR_REGS (0x93c >> 2)
>  
> +#define QSR_AES                     BIT(27)
> +#define QSR_RSA1024                 (0x0 << 12)
> +#define QSR_RSA2048                 (0x1 << 12)
> +#define QSR_RSA3072                 (0x2 << 12)
> +#define QSR_RSA4096                 (0x3 << 12)
> +#define QSR_SHA224                  (0x0 << 10)
> +#define QSR_SHA256                  (0x1 << 10)
> +#define QSR_SHA384                  (0x2 << 10)
> +#define QSR_SHA512                  (0x3 << 10)
> +
>  struct AspeedSBCState {
>      SysBusDevice parent;
>  
> +    bool emmc_abr;
> +    uint32_t signing_settings;
> +
>      MemoryRegion iomem;
>  
>      uint32_t regs[ASPEED_SBC_NR_REGS];
> diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
> index bfa8b81d01c7..3946e6179bdd 100644
> --- a/hw/misc/aspeed_sbc.c
> +++ b/hw/misc/aspeed_sbc.c
> @@ -11,6 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/misc/aspeed_sbc.h"
>  #include "qapi/error.h"
>  #include "migration/vmstate.h"
> @@ -19,6 +20,27 @@
>  #define R_STATUS        (0x014 / 4)
>  #define R_QSR           (0x040 / 4)
>  
> +/* R_STATUS */
> +#define ABR_EN                  BIT(14) /* Mirrors SCU510[11] */
> +#define ABR_IMAGE_SOURCE        BIT(13)
> +#define SPI_ABR_IMAGE_SOURCE    BIT(12)
> +#define SB_CRYPTO_KEY_EXP_DONE  BIT(11)
> +#define SB_CRYPTO_BUSY          BIT(10)
> +#define OTP_WP_EN               BIT(9)
> +#define OTP_ADDR_WP_EN          BIT(8)
> +#define LOW_SEC_KEY_EN          BIT(7)
> +#define SECURE_BOOT_EN          BIT(6)
> +#define UART_BOOT_EN            BIT(5)
> +/* bit 4 reserved*/
> +#define OTP_CHARGE_PUMP_READY   BIT(3)
> +#define OTP_IDLE                BIT(2)
> +#define OTP_MEM_IDLE            BIT(1)
> +#define OTP_COMPARE_STATUS      BIT(0)
> +
> +/* QSR */
> +#define QSR_RSA_MASK           (0x3 << 12)
> +#define QSR_HASH_MASK          (0x3 << 10)
> +
>  static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
>  {
>      AspeedSBCState *s = ASPEED_SBC(opaque);
> @@ -80,8 +102,17 @@ static void aspeed_sbc_reset(DeviceState *dev)
>      memset(s->regs, 0, sizeof(s->regs));
>  
>      /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
> -    s->regs[R_STATUS] = 0x000044C6;
> -    s->regs[R_QSR] = 0x07C07C89;
> +    s->regs[R_STATUS] = OTP_IDLE | OTP_MEM_IDLE;
> +
> +    if (s->emmc_abr) {
> +        s->regs[R_STATUS] &= ABR_EN;
> +    }
> +
> +    if (s->signing_settings) {
> +        s->regs[R_STATUS] &= SECURE_BOOT_EN;
> +    }
> +
> +    s->regs[R_QSR] = s->signing_settings;
>  }
>  
>  static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
> @@ -105,6 +136,11 @@ static const VMStateDescription vmstate_aspeed_sbc = {
>      }
>  };
>  
> +static Property aspeed_sbc_properties[] = {
> +    DEFINE_PROP_BOOL("emmc-abr", AspeedSBCState, emmc_abr, 0),
> +    DEFINE_PROP_UINT32("signing-settings", AspeedSBCState, signing_settings, 0),
> +};

This needs a DEFINE_PROP_END_OF_LIST(), I bisected to this commit in Cedric's
aspeed-7.1 branch.

Reviewed-by: Peter Delevoryas <pdel@fb.com>
Tested-by: Peter Delevoryas <pdel@fb.com>

> +
>  static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -112,6 +148,7 @@ static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
>      dc->realize = aspeed_sbc_realize;
>      dc->reset = aspeed_sbc_reset;
>      dc->vmsd = &vmstate_aspeed_sbc;
> +    device_class_set_props(dc, aspeed_sbc_properties);
>  }
>  
>  static const TypeInfo aspeed_sbc_info = {
> -- 
> 2.35.3
> 
> 

