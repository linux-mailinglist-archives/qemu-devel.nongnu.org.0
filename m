Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C76421832
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:09:52 +0200 (CEST)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUHX-0006ac-E7
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUFH-0004kV-6J
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:07:31 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUFD-0002J8-1K
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:07:30 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4808F5C01A0;
 Mon,  4 Oct 2021 16:07:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 04 Oct 2021 16:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=9
 LVWUjr2hZrIigLqcAfoV8gqfUKbvtrSIb5rZ6/k+X4=; b=JSUSEi5nQujWVd24B
 QXxhwSZCensRDmRAHPDoRqZSPE6OLJPdO6xoGTZFUBa0fQvRFeGZF93/bWiZpceR
 Ge52QnZLuaRnlxAZeoCoHdfFqtQaULwP2UX+vG6ymicgTiXaOfmgi5rsAZ4MXh1h
 UAR9mIz/IP67oAO4LcFdEdPSfVDCMJHJbBEnlt+ny9VwYdZCEdl5bUHM665VPLRs
 CCUoBHTFjZLMKFnH0mRfW0Q4CSagnGjrPDLEAxI0IL7aw+2onBT6pcgvyskejk3P
 Sr2aKlLsZ2lJw6Mw51HJ76YwyYM/nE5DqUV2dH04GZZ79ypNN04e7IVhRl0FZgmH
 vIpiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=9LVWUjr2hZrIigLqcAfoV8gqfUKbvtrSIb5rZ6/k+
 X4=; b=SHygpMXiK8rgE3PK28iS2+bzhlY2YycnegsImPFzzbLj090zzJSjETi64
 1G43Td8de4IaiJ+ZPfWPLAloHoxUjTG0mOcR45iBcYkf89ID6va+TxKzJ+fC0cL5
 se3aI9SIugMUiE2vtD+MhTN9ETr6f4VlFmcXzqEh1JYtiMRw6KnOf9PLW7oBG8+B
 hJHzDOdOOObFH5fuObGQP+uPqxglVJQmeYJGhR0pNpSDLPERs0yfVw0vIkFqVe9o
 V/FJKhquSkM4fiusSLwScfFlDmiLwAcufxQbvmbhTXelZZbsQGfeIM/Tw/2JeKc1
 ZRBFUCRYwWFQEbMB6+QYLhZgKtqzQ==
X-ME-Sender: <xms:_V5bYbBwSU__uni71h6d_sMhe5pdFbrBmjvx5YeWNppnYtzCs3jT0g>
 <xme:_V5bYRg3uYcQt3FybILaejqe_gPzTQpuStw2Dbr0PAWdYF1HFZGfKgh7ccP-8EjlQ
 rQ-A1cM1GgiLjfnhLU>
X-ME-Received: <xmr:_V5bYWld3MKZJ9qtXMTYSWBCzKMLnl5fEAo1iFlhAiHFIu9eo8Nbl9KqFunPhpI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgudegvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepjeeftefgleduieefuefgveehieeuteeuvdekudfgheffuedu
 gefhtefhieetvdfhnecuffhomhgrihhnpehrshhtrdhinhgtnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:_l5bYdyHb2MXZmYuiXg7CZq5vMgNVFuERWO9_LTTMNMFs1h_NJRHBg>
 <xmx:_l5bYQRFoM1oHTJz1Xqy0op1oC8_po8TidbtXk-s5bn-dbt7nG2xdg>
 <xmx:_l5bYQaX1SOQSzXOAQxmxUWsW5khD5Wad7bCn3TqHFuOByteWpR20w>
 <xmx:_l5bYbdu5T4i9vWdbIaNAyy31pXON2ItBHBe2IbkgxZ8XGE3ywLhLg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 16:07:25 -0400 (EDT)
Message-ID: <bd4056df-dd19-5748-6b16-45df0010548b@flygoat.com>
Date: Mon, 4 Oct 2021 21:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 2/4] MAINTAINERS: Add entries to cover MIPS CPS / GIC
 hardware
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211004092515.3819836-1-f4bug@amsat.org>
 <20211004092515.3819836-3-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211004092515.3819836-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/10/4 10:25, Philippe Mathieu-Daudé 写道:
> MIPS CPS and GIC models are unrelated to the TCG frontend.
> Move them as new sections under the 'Devices' group.
>
> Cc: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks.
- Jiaxun
> ---
>   MAINTAINERS | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfee52a3046..a5268ad0651 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -239,14 +239,8 @@ F: target/mips/
>   F: configs/devices/mips*/*
>   F: disas/mips.c
>   F: docs/system/cpu-models-mips.rst.inc
> -F: hw/intc/mips_gic.c
>   F: hw/mips/
> -F: hw/misc/mips_*
> -F: hw/timer/mips_gictimer.c
> -F: include/hw/intc/mips_gic.h
>   F: include/hw/mips/
> -F: include/hw/misc/mips_*
> -F: include/hw/timer/mips_gictimer.h
>   F: tests/tcg/mips/
>   
>   MIPS TCG CPUs (nanoMIPS ISA)
> @@ -2271,6 +2265,22 @@ S: Odd Fixes
>   F: hw/intc/openpic.c
>   F: include/hw/ppc/openpic.h
>   
> +MIPS CPS
> +M: Paul Burton <paulburton@kernel.org>
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +S: Odd Fixes
> +F: hw/misc/mips_*
> +F: include/hw/misc/mips_*
> +
> +MIPS GIC
> +M: Paul Burton <paulburton@kernel.org>
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +S: Odd Fixes
> +F: hw/intc/mips_gic.c
> +F: hw/timer/mips_gictimer.c
> +F: include/hw/intc/mips_gic.h
> +F: include/hw/timer/mips_gictimer.h
> +
>   Subsystems
>   ----------
>   Overall Audio backends


