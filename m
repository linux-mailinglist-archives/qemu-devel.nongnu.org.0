Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F066ACE6
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 18:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGk0G-0003qG-2r; Sat, 14 Jan 2023 12:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGk0E-0003pU-09; Sat, 14 Jan 2023 12:07:34 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGk0C-0006IF-AR; Sat, 14 Jan 2023 12:07:33 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 100B75C00ED;
 Sat, 14 Jan 2023 12:07:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 14 Jan 2023 12:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1673716051; x=1673802451; bh=xHAR4dj5s0
 zWF/rLLxJBPBX6N/CzkRTUdheh7+Xx3Fk=; b=NV1nqovBVVvNs2aWGar3Vvy4gL
 VT1A+5a3uEFp7+MNWAwARE2PSOKm4PDuKwBxLgPvZpkicXvhW2GHBBYzgymJcE09
 rTsnBCjOY37WteBIkKBU8KFctZYHckK9fXB1RA5Cc6pNLfYLtdbpwY/hElDWbgE7
 7E9Q1ckqOkr8SvuTjpOzrNTAsnnEOSBywUAzdCce/QNs3Q3iuTqDsXnJieOwCG/n
 sHhse4Nb0aCQERPv8OimvKSvCoxbDOPTYjx6Z2Qis/+rzeyqHzlC3zeA6lXWkI0Z
 azr3zCA8tPSjbF4Zd3bxTa5B4Erhb8CjbHbsPPZH2vkzfkTAQFaggiiglFXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673716051; x=1673802451; bh=xHAR4dj5s0zWF/rLLxJBPBX6N/Cz
 kRTUdheh7+Xx3Fk=; b=aIvGQLBH3ojr8geg7HkwlM0j85RSipbyFQaJt5+zYlFt
 Mv1vybdxPRpzUPvX/z+7dgCraZ+13Pn8nDH0x47JIxGkendHqI4lq6L2ybtdPJgJ
 AkvymWKrP2+D1Cf4HCSZ0G2JJq26Sm/zcBRGHWy0r4ThC88fLBKRPosPoKnNMkbV
 fIKrcP09nwb8dRWp3ts1rJi2M/9pYm0ub3DgdkIfhmPuBocN9heZnl/M9WfZcXXC
 6JzwBti3K48eMm0f4KM2qZu7qzdOECBQ6rPha1wBGjqnVDt2fa4UNYcKbCWwct8Z
 b2t4z3ycixw+8yG9f5w0jLmhpiSuGDImufQr7FORhQ==
X-ME-Sender: <xms:UuHCY0Y-kQbbR3RVX1d5wWVnorHutHyLiMUujRRNopnn7cUP_8TjEQ>
 <xme:UuHCY_aDSK7ADmTEvYWpTc5fri7HQURAMm3hC2HtoZCSs6BD_BiMYiBOahxb7RMLK
 y9noq0UeRKC6kKZ1HQ>
X-ME-Received: <xmr:UuHCY--Ll00OIGrN1M4ejSwdQ_3wFrMZyk8cgICfQ1eH7UgHRfV9aYdiPzbYBpadaQN3SPLtYyoAwPWwaGIYGtq6wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhes
 phhjugdruggvvheqnecuggftrfgrthhtvghrnhepieehheejheeiveetvdfhkeevgeeiff
 dvieetuedtheekteegkeeijeeffeduheelnecuffhomhgrihhnpehgihhthhhusgdrtgho
 mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvg
 htvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:UuHCY-q6drjl4Z0riOZ5lLSmJIguUbxwuA_aL_nFjKDosSHyPGjojA>
 <xmx:UuHCY_qVd66zkfQXawLIRdVdjIWqAPhCjSJ52gqjhiE98flBfWYM_g>
 <xmx:UuHCY8QTCEm7YmJQRqJ5htSybwcaTOH-Yg64_H6CpdPTXYPFBK0-Cw>
 <xmx:U-HCYwfBgvCcyvoUyVOHeie9Gqcbo8vmyj7eFT8_NZoQkfAExOtV_g>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:07:29 -0500 (EST)
Date: Sat, 14 Jan 2023 09:07:27 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/6] hw/nvram/eeprom_at24c: Cleanup + FRUID EEPROM init
 example
Message-ID: <Y8LhT0sinfZdMmHu@pdel-mbp>
References: <20230114170151.87833-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230114170151.87833-1-peter@pjd.dev>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Jan 14, 2023 at 09:01:45AM -0800, Peter Delevoryas wrote:
> This cleans up some of the code we have creating at24c-eeprom objects in the
> Aspeed and Nuvoton files, and adds an example of how to initialize a FRUID
> EEPROM with static data using I2C transfers.
> 
> Initially I was going to propose a patch to update the at24c-eeprom realize
> function to incorporate static data, but then I realized I could just
> accomplish the same thing using i2c_send in board reset. The patch at the end
> demonstrates this.

1. I messed up Joel's email on this thread, sorry about that.
2. I forgot to post the output of the test I used to verify this:

qemu-system-aarch64 -machine fby35-bmc -nographic -mtdblock flash-fby35
...
root@bmc-oob:~# fruid-util bmc

FRU Information           : BMC
---------------           : ------------------
Board Mfg Date            : Mon Jan 10 21:42:00 2022
Board Mfg                 : XXXXXX
Board Product             : BMC Storage Module
Board Serial              : XXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXX
Board FRU ID              : 1.0
Board Custom Data 1       : XXXXXXXXX
Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
Product Manufacturer      : XXXXXX
Product Name              : Yosemite V3.5 EVT2
Product Part Number       : XXXXXXXXXXXXXX
Product Version           : EVT2
Product Serial            : XXXXXXXXXXXXX
Product Asset Tag         : XXXXXXX
Product FRU ID            : 1.0
Product Custom Data 1     : XXXXXXXXX
Product Custom Data 2     : Config A

A reference flash-fby35 image can be found here:

https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd

> 
> Thanks,
> Peter
> 
> Peter Delevoryas (6):
>   hw/nvram/eeprom_at24c: Add header w/ init helper
>   hw/arm/aspeed: Remove local copy of at24c_eeprom_init
>   hw/arm/aspeed: Replace aspeed_eeprom_init with at24c_eeprom_init
>   hw/arm/npcm7xx: Remove local copy of at24c_eeprom_init
>   hw/nvram/eeprom_at24c: Add I2C write helper
>   hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
> 
>  hw/arm/aspeed.c                 | 154 +++++++++++++++++++-------------
>  hw/arm/npcm7xx_boards.c         |  20 ++---
>  hw/nvram/eeprom_at24c.c         |  25 ++++++
>  include/hw/nvram/eeprom_at24c.h |  12 +++
>  4 files changed, 135 insertions(+), 76 deletions(-)
>  create mode 100644 include/hw/nvram/eeprom_at24c.h
> 
> -- 
> 2.39.0
> 
> 

