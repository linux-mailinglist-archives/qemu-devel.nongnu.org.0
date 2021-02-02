Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783330B5F1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:43:19 +0100 (CET)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6mb0-00051I-0E
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mZi-0004Bh-ND
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:41:58 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mZg-0006wF-JG
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:41:58 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 160AC5802B3;
 Mon,  1 Feb 2021 22:41:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 01 Feb 2021 22:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=R
 v+qadtjSqP/wKVfMhmkksGzyN5fWgoZ14nq7TrCaIs=; b=dYQiHsdwNfg9emw04
 DQrzeMqObr0z975L/EO6meYkb1vWaasNNP/3I4tZ3psgYPKWbN6G1nmPlGhwjbfG
 S5IhcDf9G7osxuheHloDMMx/fd3PSnxxbs+j4hSSSHGdSSav9QXdFoQkYQLpd1z9
 M7dwVBLGoi1SYy7n7h/w5pXpqqBDUggHmXkfMPgjQ2SLXvKUNaEnUkv0Z2WYW1sO
 lthfe4Zq0JplFBNpIc4MBuheqzrKtR2Nco8+GL3GgpuYmcaFfl7W5BuSMwsL9fOP
 3WoqHn4xm2GutGb4APkwyhuk0/AbBJQ6ZkzGK7xIHe4zB9P8BA+4S0N045gSv3HY
 Lj0yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Rv+qadtjSqP/wKVfMhmkksGzyN5fWgoZ14nq7TrCa
 Is=; b=JLu1Og+5M49mBBygUkNArWVth2x/M6xOIlbZW1zK1VpI6iti23kizoNUo
 qpgp6UGOLjAXCMi94Qop7gw+UpJgvNwJsly//2isqQh5/xBFVhg7g9BZqATakkWe
 qy9yjRt9NsBw9O0XiWXF4x5+ceKdsyL6CrAalu4knS/SLKjMD1RcCViYkFobvCu+
 J9tS0FmGeoDl/CCJd5454k4cN6onkD2Ncr/meuxHCnapUCsPM1gzsfTlIwxq5fko
 hBBB2hhtF5OQH8LAahA41iKdzoGlIxgfbZ45EmQQ0uGmlTkLpZ0CCMwmeRg2r2/Q
 ARhG/oFmZFaQUpdLKpswwCAoW8ZLg==
X-ME-Sender: <xms:A8oYYLgHNSkVDGi3S2yEggwSQ9smdvxnKzKZ20DOA7jq-yIt1Vkcbw>
 <xme:A8oYYIC1GSZy2Uq0xEcPIdsXP-BDD4DgiD7yL4bi65zUZDEDfDv5kR0NWs-AsJyPj
 rn16PBfsv1uGuzdYIk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:A8oYYLGfY5tj8hqKXAHdCN8LaJe0aJG6Dutte7AM1eh9Co5AvHxtfg>
 <xmx:A8oYYIRw86Tjr989jAfH61ht2JvP15EQq2i9ztdZBxe6c6zN_0r_xg>
 <xmx:A8oYYIxEsWCJm0cTRcvUwEsWjveP7u7LvpUqjzStVM1gdvDbWexGjQ>
 <xmx:A8oYYCvQiy4tuvlQ2P8QBYqKS8gCXPK2KGmMyzKT5-E6OsvG-X53uA>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3A1C21080066;
 Mon,  1 Feb 2021 22:41:52 -0500 (EST)
Subject: Re: [PATCH 10/13] target/mips: Let raise_mmu_exception() take
 MMUAccessType argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
 <20210128144125.3696119-11-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <590e834b-4c32-4b3f-398b-4087840475cb@flygoat.com>
Date: Tue, 2 Feb 2021 11:41:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-11-f4bug@amsat.org>
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
> Both mips_cpu_tlb_fill() and cpu_mips_translate_address() pass
> MMUAccessType to raise_mmu_exception(). Let the prototype use it
> as argument, as it is stricter than an integer.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/tlb_helper.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index e9c3adeade6..21b7d38f11c 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -405,12 +405,12 @@ void cpu_mips_tlb_flush(CPUMIPSState *env)
>   #endif /* !CONFIG_USER_ONLY */
>   
>   static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
> -                                int rw, int tlb_error)
> +                                MMUAccessType access_type, int tlb_error)
>   {
>       CPUState *cs = env_cpu(env);
>       int exception = 0, error_code = 0;
>   
> -    if (rw == MMU_INST_FETCH) {
> +    if (access_type == MMU_INST_FETCH) {
>           error_code |= EXCP_INST_NOTAVAIL;
>       }
>   
> @@ -419,7 +419,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
>       case TLBRET_BADADDR:
>           /* Reference to kernel address from user mode or supervisor mode */
>           /* Reference to supervisor address from user mode */
> -        if (rw == MMU_DATA_STORE) {
> +        if (access_type == MMU_DATA_STORE) {
>               exception = EXCP_AdES;
>           } else {
>               exception = EXCP_AdEL;
> @@ -427,7 +427,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
>           break;
>       case TLBRET_NOMATCH:
>           /* No TLB match for a mapped address */
> -        if (rw == MMU_DATA_STORE) {
> +        if (access_type == MMU_DATA_STORE) {
>               exception = EXCP_TLBS;
>           } else {
>               exception = EXCP_TLBL;
> @@ -436,7 +436,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
>           break;
>       case TLBRET_INVALID:
>           /* TLB match with no valid bit */
> -        if (rw == MMU_DATA_STORE) {
> +        if (access_type == MMU_DATA_STORE) {
>               exception = EXCP_TLBS;
>           } else {
>               exception = EXCP_TLBL;


