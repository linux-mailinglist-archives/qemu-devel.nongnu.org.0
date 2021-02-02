Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2E30B5E7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:39:28 +0100 (CET)
Received: from localhost ([::1]:43840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mXH-0001Nc-6I
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mVa-0000VI-GH
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:37:42 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mVV-00050Z-Pp
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:37:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2F1665803BE;
 Mon,  1 Feb 2021 22:37:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 22:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=V
 70Q2N2KA32eSnwxwigmAKSsSvqKxVMsm8YccbBgJuM=; b=ub0pwig5dz2Oh5qjY
 7EWDhuu52/Cn84RCl5+R3omKnQDWsdV5lZjwK3vEk0kiRNJBzSomILf1wsCyERFo
 fyaUVO0jDIN1YLiW6bf03QrGeQkGkiH2aYkDFihHDoY+Q7qEHjKdm7HHY1bBY0Hz
 krzsLpkWAPO1JlRe8T/NHGtsWyNkUfbcIyvUiH+m8syrFUnZZv3n6pSr24zZvdgk
 R/cVPeOkQQeE2OuO5n3H2I+F20oBEMfYKTQjp7ybJsLHUUivhGaXuHTb7Hd2iMIO
 R0L3LN5TrDeg8RaLnyoSrUxw2vwkYIUMBU9mO+H7vINNHEDPUXg3FxhgMxwLtuO6
 aZoxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=V70Q2N2KA32eSnwxwigmAKSsSvqKxVMsm8YccbBgJ
 uM=; b=UQWFkknFnBWDYTUONp4pCTYpzbqZeOaBZBaAnh7ocQJzrADnoNV0IQBtS
 Ou0wGl9Q+dESpPdQFvY99nSiZnwRpORC4HO6sedoARk3JDr+9VCrjLjcEzi5W18Q
 rEbHYTBAjajzCtR7tJjN6rfBr1Bxt43wuqZntZLc8haDYsY9H+zLG7/vZof4Dmom
 9WrSC+BONoKJNrIZg4UQ9Ex2h/DB+mkudMzlMCVuOCcsSZH1WCWpECksn4s8dvDG
 eO9yLjrlpB8qBDo1uPWWLTjhXAG8VYC1A+sKn5iG1X2g31Vfxo/6YoHoAboX6VjA
 4H1450QGMu0+90nKkM8zooSkeSm+A==
X-ME-Sender: <xms:AMkYYNoESUYWoP7ulWzSdj4VJepAD06UUUBjmkV3ixUP1e87eQ9NJQ>
 <xme:AMkYYPlt4HT9xfzwuyNUvLeWOCKJxfdMkxf9xDcXERxPp2yhm-2E-9utWPFHc_m1r
 9FZzUiwHW8F-Nuztb4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:AMkYYHF-DVd76Oy_jnVQuJeHmiQ0HlBRHZAgWjx95kPXvN-h1RGq0A>
 <xmx:AMkYYApJL4CY_eg3MfyPG2JH1xeivo2kt0L4zNHxWcvc9clQ5f6Ewg>
 <xmx:AMkYYL4e-B8V7HxFPnSHHiIQdQBuKlfpAht8hvkymPdusAzc85_JsA>
 <xmx:AMkYYK83Q6xEj25GchaZkF_KUXH3YL33nAx7zJ7-qGofT4xxE9yHIA>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97EFB108005B;
 Mon,  1 Feb 2021 22:37:34 -0500 (EST)
Subject: Re: [PATCH 06/13] target/mips: Replace magic value by MMU_DATA_LOAD
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-7-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7d23ec5e-c0b3-ecb9-e86f-a4c31d6415ec@flygoat.com>
Date: Tue, 2 Feb 2021 11:37:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/28 下午10:41, Philippe Mathieu-Daudé 写道:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/op_helper.c  | 2 +-
>   target/mips/tlb_helper.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
> index 89c7d4556a0..9fce0194b3e 100644
> --- a/target/mips/op_helper.c
> +++ b/target/mips/op_helper.c
> @@ -312,7 +312,7 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
>           }                                                                     \
>           do_raise_exception(env, EXCP_AdEL, GETPC());                          \
>       }                                                                         \
> -    env->CP0_LLAddr = do_translate_address(env, arg, 0, GETPC());             \
> +    env->CP0_LLAddr = do_translate_address(env, arg, MMU_DATA_LOAD, GETPC()); \
>       env->lladdr = arg;                                                        \
>       env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
>       return env->llval;                                                        \
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index c9535b7f72f..9216c7a91b3 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -492,7 +492,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>       hwaddr phys_addr;
>       int prot;
>   
> -    if (get_physical_address(env, &phys_addr, &prot, addr, 0,
> +    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
>                                cpu_mmu_index(env, false)) != 0) {
>           return -1;
>       }


