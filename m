Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01E64383A7
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 14:33:44 +0200 (CEST)
Received: from localhost ([::1]:38388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meGDX-0003IE-C3
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 08:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1meGBH-0002UR-EW
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 08:31:23 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:57499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1meGBF-0004B1-5X
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 08:31:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 461E85C0080;
 Sat, 23 Oct 2021 08:31:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 23 Oct 2021 08:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=b
 a3jojt7d7UL1bDNERt5OvvcQSZT2cCSsLVPpvXiRoo=; b=H9fZOXIMTqAsDbP3p
 B4IosEYp/UKishWLlFmbqWlKBdyIgFil4oCnEttafADEQvT1X3uKGWSN8duESvEY
 CtlD5ItWFHFd47zKBcFklCxXldb1/s+VfPdaQzVrHMpqIGsQ7uRMYMYrh0x4t2N9
 bgXKMstPCb8PTcPtOcmkw3edw3McBs2inaGHtYQKO43aFbZ+UEqCFQgTFLdeCu+m
 gWX85USby1CyQkY3IQ38IFlqRZBXwLhsrS6MRxYJxmN3SFrSb0gMw0ZxlseDxplF
 JL+7cog/ZrtRfrotdjVN28c4iHzMlyojml4g6BJ07mCXM430Jtz5k2YvTuM8UzAr
 7rP1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ba3jojt7d7UL1bDNERt5OvvcQSZT2cCSsLVPpvXiR
 oo=; b=livVXnqpij+bhX5iBBae46Og8oFndSwmMOrt0o0bFp9IhckR5C2NGVqAc
 SAmeWg/rlOFPRzf/W6ib58aMnlD8/8XNyjqAV6bOa1Q/j7QF+6tLO7n1WVt/8EXk
 pY7waS9T9nPS0TT+/5e5s1yMGtrtMsiqrd1ZnWEYDPOjRVc3Q1XB0kCzPgMRZseq
 Zsnu2wx3XIzj91wb86KzJOCO05sI4J/8l5hp51MYp5/y4ZCzYoQF/ch4b36m19Fb
 QMV6OLlDktvVFreZjKhIv3QwHiC59akjVaWJ1SHDmjk9Er57v8tUWK874qZZ/q4H
 /tOJz9U8Wd1cOlA+sW7FtF58ye53g==
X-ME-Sender: <xms:kgB0YVVx4yrRoWl8MQSQfwoQnIJVK6HEB7lGSeBmmvT33oB0wW-MxQ>
 <xme:kgB0YVm7-xKoW3EuhFcEQ7lvM8kxNtkt8pT-AtwZEP2YZnea3d9v8mMK4M8EMBeVz
 BXIgX4dMan16rzG5Ao>
X-ME-Received: <xmr:kgB0YRYT7RqBR459nlgKReCNlPIcmZEoZc5F-el75LhVQRID3TvuYl2sLTDIjSs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeftddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
 jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:kgB0YYVQQmdQXvM-0HXoYHmNaXr4CMJLHLNnDL1aUL2g2fOxWJxgMA>
 <xmx:kgB0YfmKc1gAZDatWxudqLEvLM2IN7LqoUHkJIiQkZkBr_cKDScuRg>
 <xmx:kgB0YVd-gAQKJrCSFdmvFDP0MN8fhglxeM8Mi-oF_LdtyAoMHJBM-A>
 <xmx:lAB0YYD2tJsI2wixR2bEsdYGyO4Xlw8Yo4V0rBPxVlYiJ3MnascsMg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Oct 2021 08:31:13 -0400 (EDT)
Message-ID: <ab829c73-2a67-c383-12a9-dcfb4148ca8d@flygoat.com>
Date: Sat, 23 Oct 2021 13:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] target/mips: Fix Loongson-3A4000 MSAIR config register
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211022174550.36937-1-f4bug@amsat.org>
 <20211022174550.36937-4-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211022174550.36937-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/22 18:45, Philippe Mathieu-Daudé 写道:
> When using the Loongson-3A4000 CPU, the MSAIR is returned with a
> zero value (because unimplemented). Checking on real hardware,
> this value appears incorrect:
>
>    $ cat /proc/cpuinfo
>    system type     : generic-loongson-machine
>    machine         : loongson,generic
>    cpu model       : Loongson-3 V0.4  FPU V0.1
>    model name      : Loongson-3A R4 (Loongson-3A4000) @ 1800MHz
>    isa             : mips1 mips2 mips3 mips4 mips5 mips32r1 mips32r2 mips64r1 mips64r2
>    ASEs implemented        : vz msa loongson-mmi loongson-cam loongson-ext loongson-ext2
>    ...
>
> Checking the CFCMSA opcode result with gdb we get 0x60140:
>
>    Breakpoint 1, 0x00000001200037c4 in main ()
>    1: x/i $pc
>    => 0x1200037c4 <main+52>:  cfcmsa       v0,msa_ir
>    (gdb) si
>    0x00000001200037c8 in main ()
>    (gdb) i r v0
>    v0: 0x60140
>
> So set MSAIR=0x60140 for the Loongson-3A4000 CPU model added in
> commit af868995e1b ("target/mips: Add Loongson-3 CPU definition").
>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/cpu-defs.c.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index cbc45fcb0e8..f43a8e7c9d9 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -886,6 +886,7 @@ const mips_def_t mips_defs[] =
>                       (0x1 << FCR0_D) | (0x1 << FCR0_S),
>           .CP1_fcr31 = 0,
>           .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
> +        .MSAIR = (0x601 << MSAIR_ProcID) | (0x40 << MSAIR_Rev),
>           .SEGBITS = 48,
>           .PABITS = 48,
>           .insn_flags = CPU_MIPS64R2 | INSN_LOONGSON3A |

