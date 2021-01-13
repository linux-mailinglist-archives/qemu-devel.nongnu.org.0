Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B382F4180
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:06:39 +0100 (CET)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzVYU-0005du-JW
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVWw-00057P-9s
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:05:03 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:40121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVWt-0003va-EV
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:05:01 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B6D0A5806F8;
 Tue, 12 Jan 2021 21:04:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 21:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=n
 RpzCpxFL+W3hyZW6aQpHuQsl4EJKWW8sbYN4k4MDN0=; b=Vui6W4f3UltGSwqrG
 rYn3MBGo3dbjHiAJrLBi4OIQSXAnUUYNcBeONVf7DLmjbHkxWBIHusafjZ1yB9xT
 R7mJ6DPXSqNeF4bsqN3sD1meMTxIWHaZKZk1BdhaOSxQc+oSWAyagYYWaxCvNl0j
 M0DOTQAWyGk7pQDc+rDEcXSAIlGkVmztzwLc58up2VmxF4TOo/MOyvUvzGvd/rQ2
 VGj952dOWejjtFcwn6dcOhtlcXZFAN2xoV4nww0baVpnEU/iFd7QtEHjI8WBSzgc
 Nlt+Yro0C3gpubbmhllQ59PbbYIJRdzY6mE0ulpESO+ToHjW7xj837nGFfgL38qD
 Qysaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=nRpzCpxFL+W3hyZW6aQpHuQsl4EJKWW8sbYN4k4MD
 N0=; b=el+7kL2kPg8Mrif0XnYIyqRRtrvTQe0srCFX62wzMuRspYS9MF9niqWdK
 pCaXbfsRz/RYrY7xQBmb+C1taH21ixHte76y3KRZmb5cqVnaYhK24rxSnf5Z24Zf
 CwVO6yUOW6LvLlYf1+HE2vkPtSeaskcxoWd22JSMa49n70UT/rtiG4bfaHXPqxNK
 VNOP6lPsM8IfddJhny76vpG+V4eaECYIsM80EmHxRttPrjBfP0sLFUj5CtaFvter
 /vZvUxGCB6Ib9WFUG4GyFTtkmmgpjpkYLZLeE7npHQhVn1lUARou41tORw2aCGAQ
 K9law01EmpS7BjgwElVbFzAH59AMg==
X-ME-Sender: <xms:SVX-X5rFfshWNjCbRMjZ37vtEopLoQEsqkei9ab2d4i0X5yoQA8VFQ>
 <xme:SVX-X7qacEEDbh6NaAPcTrSOdVs4pF0Tx3Z1mX2aA_I2A6nOuMmRtiTj4hQfgtSf-
 CnB-cW7ZxFzEDy3ZfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:SVX-X2NVze6I4qFuCKeYCh9Bo7C2CJr82Jsv1xY15sgvlll9V4pQeQ>
 <xmx:SVX-X065S_4xtwbFeXxS7pvW1q36-1P-fiT_za-VbgLxtwKpx6TpZw>
 <xmx:SVX-X46-5QJzBeKjw_UgMeaDCufz2exJuMbZzST3hy1EAP2inu1iRA>
 <xmx:SlX-X2lJWYNAXkHU-HksIB2_SPPxPzZWNI5CYBUNDWEqYHzizktYNQ>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id A815B1080057;
 Tue, 12 Jan 2021 21:04:55 -0500 (EST)
Subject: Re: [PATCH 1/6] target/mips: Re-introduce OPC_ADDUH_QB_DSP and
 OPC_MUL_PH_DSP
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-2-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ad19c6f5-d97f-71a3-d5ad-1ed4d4879683@flygoat.com>
Date: Wed, 13 Jan 2021 10:04:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/13 上午5:54, Philippe Mathieu-Daudé 写道:
> There is no issue having multiple enum declarations with
> the same value. As we are going to remove the OPC_MULT_G_2E
> definition in few commits, restore the OPC_ADDUH_QB_DSP and
> OPC_MUL_PH_DSP definitions and use them where they belong.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>   target/mips/translate.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index a2b3026132d..cbd152eff50 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -399,16 +399,14 @@ enum {
>       OPC_ADDU_OB_DSP    = 0x14 | OPC_SPECIAL3,
>       OPC_ABSQ_S_PH_DSP  = 0x12 | OPC_SPECIAL3,
>       OPC_ABSQ_S_QH_DSP  = 0x16 | OPC_SPECIAL3,
> -    /* OPC_ADDUH_QB_DSP is same as OPC_MULT_G_2E.  */
> -    /* OPC_ADDUH_QB_DSP   = 0x18 | OPC_SPECIAL3,  */
> +    OPC_ADDUH_QB_DSP   = 0x18 | OPC_SPECIAL3,
>       OPC_CMPU_EQ_QB_DSP = 0x11 | OPC_SPECIAL3,
>       OPC_CMPU_EQ_OB_DSP = 0x15 | OPC_SPECIAL3,
>       /* MIPS DSP GPR-Based Shift Sub-class */
>       OPC_SHLL_QB_DSP    = 0x13 | OPC_SPECIAL3,
>       OPC_SHLL_OB_DSP    = 0x17 | OPC_SPECIAL3,
>       /* MIPS DSP Multiply Sub-class insns */
> -    /* OPC_MUL_PH_DSP is same as OPC_ADDUH_QB_DSP.  */
> -    /* OPC_MUL_PH_DSP     = 0x18 | OPC_SPECIAL3,  */
> +    OPC_MUL_PH_DSP     = 0x18 | OPC_SPECIAL3,
>       OPC_DPA_W_PH_DSP   = 0x30 | OPC_SPECIAL3,
>       OPC_DPAQ_W_QH_DSP  = 0x34 | OPC_SPECIAL3,
>       /* DSP Bit/Manipulation Sub-class */
> @@ -566,7 +564,6 @@ enum {
>       OPC_MULQ_S_PH      = (0x1E << 6) | OPC_ADDU_QB_DSP,
>   };
>   
> -#define OPC_ADDUH_QB_DSP OPC_MULT_G_2E
>   #define MASK_ADDUH_QB(op)           (MASK_SPECIAL3(op) | (op & (0x1F << 6)))
>   enum {
>       /* MIPS DSP Arithmetic Sub-class */
> @@ -22681,8 +22678,7 @@ static void gen_mipsdsp_arith(DisasContext *ctx, uint32_t op1, uint32_t op2,
>       gen_load_gpr(v2_t, v2);
>   
>       switch (op1) {
> -    /* OPC_MULT_G_2E is equal OPC_ADDUH_QB_DSP */
> -    case OPC_MULT_G_2E:
> +    case OPC_ADDUH_QB_DSP:
>           check_dsp_r2(ctx);
>           switch (op2) {
>           case OPC_ADDUH_QB:
> @@ -23376,11 +23372,7 @@ static void gen_mipsdsp_multiply(DisasContext *ctx, uint32_t op1, uint32_t op2,
>       gen_load_gpr(v2_t, v2);
>   
>       switch (op1) {
> -    /*
> -     * OPC_MULT_G_2E, OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
> -     * the same mask and op1.
> -     */
> -    case OPC_MULT_G_2E:
> +    case OPC_MUL_PH_DSP:
>           check_dsp_r2(ctx);
>           switch (op2) {
>           case  OPC_MUL_PH:
> @@ -27337,7 +27329,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
>            * OPC_MULT_G_2E, OPC_ADDUH_QB_DSP, OPC_MUL_PH_DSP have
>            * the same mask and op1.
>            */
> -        if ((ctx->insn_flags & ASE_DSP_R2) && (op1 == OPC_MULT_G_2E)) {
> +        if ((ctx->insn_flags & ASE_DSP_R2) && (op1 == OPC_MUL_PH_DSP)) {
>               op2 = MASK_ADDUH_QB(ctx->opcode);
>               switch (op2) {
>               case OPC_ADDUH_QB:


