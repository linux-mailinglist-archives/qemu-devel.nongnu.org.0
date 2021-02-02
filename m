Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9B30B607
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:47:35 +0100 (CET)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mf8-00083S-Cf
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mbj-0005vb-Cj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:44:03 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:50643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mbh-0007oL-Q1
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:44:03 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 476515803E8;
 Mon,  1 Feb 2021 22:44:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=8
 QkT5R4cZv9IZTNTMBmljXqNIAQMFJEEkC1UpNY8L84=; b=nAI5WaTR6m1l+bkQe
 1GqkJjH0Wls3oV/kRUhRHaFKa4dlJEe39kZlTd0k9YMGM5zsFjVF1ofhW4tOwWHn
 xqJC1KpK9bEsoDBoIGosTeG/V/PU5bWUiL2oZcWKgLCKOuDzlTCqE4Cqne0W+YTD
 1GrxL24i4gNjI6saHvcm3e1FTDAWXM2AgmUk9yb1kZOP7G1LdHe7kc3d0tFfHuy0
 0rtaK7zAPG4yaEE0jvBHXIoomUt4jMnFmij6ZW8BSaEpnf6d0boxjUO28ti5cdZb
 45NmgH6dV31j/AhEuServX8tDe14ansAV6mlBIyl5taSA7rs/CiYeuSo1Si5NLHk
 XutjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=8QkT5R4cZv9IZTNTMBmljXqNIAQMFJEEkC1UpNY8L
 84=; b=I6iAlYFd0jps1qAG0388Bp8Ncb6CFUt5YiZJfI6t41MCAxzf1vpwDWb0K
 /d1L16hcXxllICF8/kZkmkcI50ikUMrrBwUsiwFQPQ6LWnRe8ZMXmvYRgD94bomI
 hhy2d18jFe8EQMT48ThZR8MkFX48WnP+iwJnCllAN3NoObrbZDSEbIR8Jna0lWui
 QExVg1RkvnIyFzYZjk05fF00Y5z4LKO+jIlanJOnrhe2M0YiPnghIUu1H0zfyhDk
 TvVZGtbfkYeLgqwXSp6EyiCZipooLoCc+iBT3k114D9Lp0sDLLCxTlQE8RppiAsO
 bquw/Kao1RE5kd1Ee7f+O6j7YKVPQ==
X-ME-Sender: <xms:gMoYYHCEGobwKl5nVAnaHtpIB1RuEHRPQ_RZEYQ2Drmvt0xONzEznw>
 <xme:gMoYYNgffWvZM6Et_tTMP_JCtBlh7u7eIhe9VIRmWcj0hR84IG5bgpKdt-9oMWFof
 pGM8cVNxDBzarFJv10>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:gMoYYCn3YtF8BPWojda5WxvzOd-6AB2_rTi22SsHLw5acEtjAUOO3g>
 <xmx:gMoYYJx-4b1q_PA0iTBEo_dHFb3p5q14eZMQfpE9751YnOW0H05xww>
 <xmx:gMoYYMTU1qzaAGfmX8Pp9v0RBnVdfpjc-ub8GtVeu85MkJICEs4zug>
 <xmx:gMoYYCMOvV11l9is4IYZdl1LM8M1D7S-c73pLkcV5J8NwtdqzreLgg>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3D260108005B;
 Mon,  1 Feb 2021 22:43:57 -0500 (EST)
Subject: Re: [PATCH 12/13] target/mips: Let get_seg*_physical_address() take
 MMUAccessType arg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-13-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <4616eba7-7687-34e0-1412-9c84ab2c202e@flygoat.com>
Date: Tue, 2 Feb 2021 11:43:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-13-f4bug@amsat.org>
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
> get_physical_address() calls get_seg_physical_address() and
> get_segctl_physical_address() passing a MMUAccessType type.
> Let the prototypes use it as argument, as it is stricter than
> an integer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/tlb_helper.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 64e89591abc..14f5b1a0a9c 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -222,7 +222,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
>   
>   static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
>                                       int *prot, target_ulong real_address,
> -                                    int rw, int mmu_idx,
> +                                    MMUAccessType access_type, int mmu_idx,
>                                       unsigned int am, bool eu,
>                                       target_ulong segmask,
>                                       hwaddr physical_base)
> @@ -234,7 +234,8 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
>           return mapped;
>       } else if (mapped) {
>           /* The segment is TLB mapped */
> -        return env->tlb->map_address(env, physical, prot, real_address, rw);
> +        return env->tlb->map_address(env, physical, prot, real_address,
> +                                     access_type);
>       } else {
>           /* The segment is unmapped */
>           *physical = physical_base | (real_address & segmask);
> @@ -245,15 +246,15 @@ static int get_seg_physical_address(CPUMIPSState *env, hwaddr *physical,
>   
>   static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
>                                          int *prot, target_ulong real_address,
> -                                       int rw, int mmu_idx,
> +                                       MMUAccessType access_type, int mmu_idx,
>                                          uint16_t segctl, target_ulong segmask)
>   {
>       unsigned int am = (segctl & CP0SC_AM_MASK) >> CP0SC_AM;
>       bool eu = (segctl >> CP0SC_EU) & 1;
>       hwaddr pa = ((hwaddr)segctl & CP0SC_PA_MASK) << 20;
>   
> -    return get_seg_physical_address(env, physical, prot, real_address, rw,
> -                                    mmu_idx, am, eu, segmask,
> +    return get_seg_physical_address(env, physical, prot, real_address,
> +                                    access_type, mmu_idx, am, eu, segmask,
>                                       pa & ~(hwaddr)segmask);
>   }
>   


