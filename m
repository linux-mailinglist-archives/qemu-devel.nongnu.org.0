Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F23421844
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:16:17 +0200 (CEST)
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUNk-0008Ci-2Y
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUGK-00066w-KI
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:08:39 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUGG-0003bE-1k
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:08:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1AA865C01B1;
 Mon,  4 Oct 2021 16:08:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 04 Oct 2021 16:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=0
 P3vA2+33AqAQ2Hz4QqLZLvOyazSqhUXbkc2h3b+xjg=; b=FMeOp6jgEGejvwvrs
 rr5GmJDY3FAWpMCUamb2aepkFlXc1HXbdiRTToagvhc+05vEoJrWZca5TByUfF0H
 3VidESwYnPuR/jKa2TE7F+L5cvqNYvl1S4mKUVwPRfoBgPFF5BDkZvSJ+/EiZo8E
 yAfhVY0jwkaDAJnNBOyCjSENory4l9ttm354Ma/kRlnvbcJJinidYj3zS+E5vYDm
 kWk4p4+cUeZ7dI+AWpmAjmyqvvKzQOGhd44HEqR8o8w1lHXG6LSxeUKRLHWGYqUb
 5i87l9ETYi/DtTMvNF+Q3eYYb7uxa/LhOPw8adQ5IB0AR7xfAB19BqEE9ypak2rr
 /99YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=0P3vA2+33AqAQ2Hz4QqLZLvOyazSqhUXbkc2h3b+x
 jg=; b=iyYzyDxe9Ycv1LyzGWG2Zk/9yAXIC/HzRmG5mmsR8qjwhrWuTkk9Oj6SN
 sNpqOUn8W/dtJzseBtZ8hjmK7wzKBnjB4ZvuToPdTGa5k+9E4cCQcafreROB9D4x
 wlV2+GozkKRTX3EAgRgQB88PZObk/N3ftHwcptGqO6Dj41I0G160PEDeaTA7xQ66
 ZoJzb7nvwUcmzsHTYWMZeTx2cXd4ItTSUgPhxnttm87NADuQ1PyI4LS3vZf6njZh
 2jGGtO9Q3qAVnRt+WH/SlYcgAtjA5H9oRx5/Wm6hfFMZr3DfVnXfU4NIeV/yJQaY
 zP2zlZHWkrfL8zTdpfpQtni3CKf4w==
X-ME-Sender: <xms:Pl9bYcxCPIWWz48aor2vUZeWZtWNAxGrx5mF5vJf17nIBMtSByDXqA>
 <xme:Pl9bYQTVsaL4hd2oBS1ZnOeBfS1UwmRu8CI0LjgJ8BecC7evdFUcFSN7T1_XF4Zkb
 YuZBPDVc3lydW7hElg>
X-ME-Received: <xmr:Pl9bYeWiKdoaP6Qu-0_PMkaUiiW8lk3mYuNc5fe6V1zwBnXRRnBJdKmMXSU4zPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepjeeftefgleduieefuefgveehieeuteeuvdekudfgheffuedu
 gefhtefhieetvdfhnecuffhomhgrihhnpehrshhtrdhinhgtnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:Pl9bYaiFE1JyKYxTvoPFTK9h8x8aRrjaZHIVAGspqmF-f1NW90_jIw>
 <xmx:Pl9bYeCciJ_Ym_t1vuovpEvXhhukSWUARK0iUQamHcVTWs3ClO0gEg>
 <xmx:Pl9bYbKnggnbfjRyA5wwMPWdGyRFqjIk9Gxe4PyHvpBf5ston60XCQ>
 <xmx:P19bYRNmNvOrumiuZdKuPz64T7a7fQs3PR_9j9bJC419hFL0puI5hQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 16:08:30 -0400 (EDT)
Message-ID: <335bad6f-36f7-c691-e110-e47876a293a3@flygoat.com>
Date: Mon, 4 Oct 2021 21:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 3/4] MAINTAINERS: Split MIPS TCG frontend vs MIPS
 machines/hardware
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211004092515.3819836-1-f4bug@amsat.org>
 <20211004092515.3819836-4-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211004092515.3819836-4-f4bug@amsat.org>
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
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Hardware emulated models don't belong to the TCG MAINTAINERS
> section. Move them to a new 'Overall MIPS Machines' section
> in the 'MIPS Machines' group.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks.
- Jiaxun
> ---
>   MAINTAINERS | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5268ad0651..f1d7279a0f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -236,11 +236,8 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>   S: Odd Fixes
>   F: target/mips/
> -F: configs/devices/mips*/*
>   F: disas/mips.c
>   F: docs/system/cpu-models-mips.rst.inc
> -F: hw/mips/
> -F: include/hw/mips/
>   F: tests/tcg/mips/
>   
>   MIPS TCG CPUs (nanoMIPS ISA)
> @@ -1168,6 +1165,13 @@ F: hw/microblaze/petalogix_ml605_mmu.c
>   
>   MIPS Machines
>   -------------
> +Overall MIPS Machines
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +S: Odd Fixes
> +F: configs/devices/mips*/*
> +F: hw/mips/
> +F: include/hw/mips/
> +
>   Jazz
>   M: Hervé Poussineau <hpoussin@reactos.org>
>   R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>


