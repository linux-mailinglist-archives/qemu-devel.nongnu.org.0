Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1253530B5EE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:41:01 +0100 (CET)
Received: from localhost ([::1]:47730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mYm-0002xl-6C
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mXF-0001yR-19
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:39:25 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mXC-0005jl-Uo
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:39:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 03A7C5803E4;
 Mon,  1 Feb 2021 22:39:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=l
 QuUQoZ2tDDhL5DoU6uIq2cUJ9tp+AeQLNA8z2N6HKg=; b=OTLJTly7gEPM8KX51
 zj22I8uDsZb8Cv+uFwzRhGBQWO6dmCZPPB2YFswi/wUcAIETmRnRJsLkNU7tBYyi
 q4yOolF3q5zIqffNinS9Gw2hL5kTRvbZFBelRxjmt7Yhr3qT+gDo5rA4eivEqEqg
 uIwOr6QA4AAN1rT8947Tr2axhRWPbt7Rc1dlvn8TUYm1w5igJ35+QSgWDO2OpNyF
 f5wkG6e4dCtQT5TspR57qQSuNuPRl/CrUv2NM2WEYsNOWwG778P8+qgE4PV5FXi4
 dP/Baz4J4B7WrAkh79Y8YYFrj4s+7KMZP2Y2XzZeQrAnHZ+wReZ6wi/si7DO4Avs
 OY15w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=lQuUQoZ2tDDhL5DoU6uIq2cUJ9tp+AeQLNA8z2N6H
 Kg=; b=bvj87WUdISfV6+JH5FdZJLY5Dtb7U9vnjKQFN0WGC0rizy7yDUBE75tJu
 S8oCH6+wct8Whvb48ruJVU9Oh5xo+twETXMhTMGy7m2h/O2DNl8EeCOoSkd1BzOO
 F8sSUmq9FXaUjyu99Q410hH0CecDXYVcVNSdX9wDegOhxpuJlcheeJQnhlourKhG
 RvQaUlrEZD+z8K0BHkhYYX5H9j7BfQYRbs3d7E9Bd4gCLZfiq/vlNLhEC20pZqpj
 WW0G6TfrTZHJGDRbt0eYAcIbfFOV7jZusCgYh0NqkaTesyBNkDY/MkoaNePPv8zH
 sWrY2NA+Er/HvqzBcMAkGmTHS/qDg==
X-ME-Sender: <xms:ackYYIb_sdRFZRVRh0UaXcCdW-uYWEyIHhMDJiP05TbRWZz88iCakQ>
 <xme:ackYYDZM2oYBJ9PVqOKjqbRkY-2Tf8mGmAZ0feYf2zsExzorLNS0zNiY-42w8dX7Q
 j8o5FuycdnIfBKpfPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:ackYYC9Pk5jfwKKfvPKBWEyDF2sfmny1CqZwZnU8MzjTSxcLI6W7ag>
 <xmx:ackYYCpdFFaDXrqKldjYM-6RH-p5IgCkopRYwJZ0eXoJcZ4-22l3YA>
 <xmx:ackYYDorW32RtjMjiG4_t9TqWqU_RcRK3vZkvd2oU7p6V-x_3P_oQg>
 <xmx:ackYYEnH0lb_IrFk90SPb5pTep3OR2AGB52ILoXOUUAJXtRlXCjerQ>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C57924005D;
 Mon,  1 Feb 2021 22:39:03 -0500 (EST)
Subject: Re: [PATCH 08/13] target/mips: Let do_translate_address() take
 MMUAccessType argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-9-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c45d4b43-7d4a-33e7-228f-c067349c50a1@flygoat.com>
Date: Tue, 2 Feb 2021 11:39:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-9-f4bug@amsat.org>
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
> The single caller, HELPER_LD_ATOMIC(), passes MMUAccessType to
> do_translate_address(). Let the prototype use it as argument,
> as it is stricter than an integer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/op_helper.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
> index 9fce0194b3e..b80e8f75401 100644
> --- a/target/mips/op_helper.c
> +++ b/target/mips/op_helper.c
> @@ -288,13 +288,14 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
>   #ifndef CONFIG_USER_ONLY
>   
>   static inline hwaddr do_translate_address(CPUMIPSState *env,
> -                                                      target_ulong address,
> -                                                      int rw, uintptr_t retaddr)
> +                                          target_ulong address,
> +                                          MMUAccessType access_type,
> +                                          uintptr_t retaddr)
>   {
>       hwaddr paddr;
>       CPUState *cs = env_cpu(env);
>   
> -    paddr = cpu_mips_translate_address(env, address, rw);
> +    paddr = cpu_mips_translate_address(env, address, access_type);
>   
>       if (paddr == -1LL) {
>           cpu_loop_exit_restore(cs, retaddr);


