Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC6F42183A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:11:40 +0200 (CEST)
Received: from localhost ([::1]:39892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUJH-0001BV-Np
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUGp-0006iQ-Sp
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:09:08 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUGn-0003y0-OM
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:09:07 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F4165C01B1;
 Mon,  4 Oct 2021 16:09:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 04 Oct 2021 16:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=i
 IpVobtAc3GKlz8S1tQVN05Zy8yzHNPzVK4V2DtOCsY=; b=yCKkYwwS5ZEDWkskY
 2nuV/lKX5qRB1AX32+KI9V4z8ZEezdP9SUxYdplLakNqoGjxANoKxi+R9e0fMhwm
 KKiKBqtxlrbLb+YekYCs4Jaad3rQiJ4DBJ05PhIiGIumJqknl3ZsL0KNV12xVzfc
 BZSU/uBCwsVtTgd7IJ1+penTMH3i3l2ltP+RPfIamOiqb6C8jqYVAFnwOihn4kfT
 WAeQsbXdKZ+DNhu90RwfWqytp6iEBC7n1sSt5mdVj9PjEgnfzEzlh1xfH8qDgxOj
 WDKaz9L+YLWZBUo1PUmRyaBNEtFQe/18B+azWAAByQNlN52EojHx2tzU/sngUYmE
 b+CPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=iIpVobtAc3GKlz8S1tQVN05Zy8yzHNPzVK4V2DtOC
 sY=; b=azwdLxmKNImvSTDs3rgFk8aE/hIwM3tC2kG2GGARefOvO8/14JzijqKDI
 jNYa5tJS+ZxoBcWCbG0Jzvz6jm+lT0x2keIc6WW4MFXQRQ1FhW00CeLdgKsL6CyM
 rkAbISy1w2w2vaImwUDfdhl9rDcansYWIKSVWjdTQrmVLwmC35/ZRT86nU3SQGgw
 HQmZSM5U8XW9hmjS3XCf6Vb2ql9w6OfXlSLyKRTASFKS90oOumQZGCo5CJq7Um/M
 lhf+Esen62vDfx8cmcagQK/B9jckiF3GCIiQa7cluza//RmnIztaKbBhKM4agbYS
 X3XYWJmTzwwniAWtEOyfb0vbyuz4g==
X-ME-Sender: <xms:YF9bYSVLewgTt2p7vQmZk6WUuCFkRn13VsW9CH1Ty6mO0WCUSJxayw>
 <xme:YF9bYelYFAawg7H4G3iuryNT1_truyAmz4BhY7CkDbcE5cpmBqrER0ZRZ5ZXLjO90
 8Nd4t7OCYbqd1Jb96s>
X-ME-Received: <xmr:YF9bYWaJt9psySx8lVVix2rAwecSj5QNZdz9H1zbKo68qQ_cZO5l3v17Ir3DDHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgudegvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepgefgtddvfeejhfevjeehueehledtfefhheeitdeljeefheel
 vdfhvdfhfeekvdeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdprhhsthdrihhntg
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
 gihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:YF9bYZWQgmgBOePtyJKQ32XlaSKIEsJ0OJGwkkl02ID5y1KKF8c-aA>
 <xmx:YF9bYckxHYkuc26Sxn7BZXNir9HjMkqQ3MQLAbzCTyr2pmnLdzqXaQ>
 <xmx:YF9bYedkW1BVHEupBRoPS6_6t_hljroKLdjXkjwJPZ86Sqack7xS-Q>
 <xmx:YV9bYRxPh5S7FFrsHSf0qaVQbU0sgKkGdKMiDaA_Qojip_Ql2_R6CQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 16:09:04 -0400 (EDT)
Message-ID: <82956a55-18f3-c220-ced9-0eb0e76a30ae@flygoat.com>
Date: Mon, 4 Oct 2021 21:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 4/4] MAINTAINERS: Agree to maintain nanoMIPS TCG frontend
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211004092515.3819836-1-f4bug@amsat.org>
 <20211004092515.3819836-5-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211004092515.3819836-5-f4bug@amsat.org>
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
> As of this commit, the nanoMIPS toolchains haven't been merged
> in mainstream projects. However MediaTek provides a toolchain:
> https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01
>
> Since I now have spent more time with the ISA, I agree to maintain
> it along with the other MIPS ISA.
>
> For historical notes, see commit a60442eb8 ("Deprecate nanoMIPS ISA").
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Probably it's worthy to ask MTK folks if they are willing to maintain QEMU?

Thanks.
- Jiaxun
> ---
>   MAINTAINERS | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1d7279a0f2..8ce47417eff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -237,14 +237,10 @@ R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>   S: Odd Fixes
>   F: target/mips/
>   F: disas/mips.c
> +X: disas/nanomips.*
>   F: docs/system/cpu-models-mips.rst.inc
>   F: tests/tcg/mips/
>   
> -MIPS TCG CPUs (nanoMIPS ISA)
> -S: Orphan
> -F: disas/nanomips.*
> -F: target/mips/tcg/*nanomips*
> -
>   NiosII TCG CPUs
>   M: Chris Wulff <crwulff@gmail.com>
>   M: Marek Vasut <marex@denx.de>


