Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09D6338FB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:48:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPsm-0006qR-MK; Tue, 22 Nov 2022 04:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxPsW-0006pA-JG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:47:47 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxPsR-0004JG-Ru
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:47:41 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 a7-20020a056830008700b0066c82848060so8960754oto.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kMvDZJbO/+JCcssoMsIloTgv2mdXTa/EJzbhQFLszO4=;
 b=BW3nDykHqnoCLPHAPxBIDFjzLlH13PvB2MpBDO9hLJki8pYCQKaeoF5GYb2HSHAVeU
 a1Y+BhxddsQgW7b5T1mEUEeg+N9MQM8DTsDPBR+nH4PbsMSxdNaLtzCmHPVcmjz1S0a/
 P1oSlWuDmAT5SMx5OzQGCEq8QUPmWlZCD0f6bk0NOyC0kRenfPgr8hW6trtL6H4SydUs
 cCKShWh7Rawi4KcA9+Hi1fJ+1mzllPr/arjGqkgz5dTaT04wR4a7c4CrvkUsKh/StLWw
 fTGlQSGWr0Q+/vmpOOD13cUVhY17gqNseOmpRhtLqztH+voXfxqJyCZ+YHJLfpUpe7je
 +Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kMvDZJbO/+JCcssoMsIloTgv2mdXTa/EJzbhQFLszO4=;
 b=u+XREhg6qaGQliO810Nqjkky6v1VFF/yyG2JsBiwai7YZD8AypQj+IKBCuNxaMt7Rw
 MQj0iew84PYczk9wH2Xm44IjV/O++nMDDM2oldxnqzA3bNyyRa9FoY1iaJRLCqB5xBae
 asXTYoErCX1AXcSZ+96tJC+YEZEuFn18nfBW3yIQiyBF2zxKG7HGUI9xFO459KXGyMDx
 7ldv2BlclDjJcaThGa2YoEoqR/PAmDktFYboNVh2Iy956GZ/jniHfMEt7WmGS2VnUHBm
 WE1Jz54oyhI8yaIwRCtiXynPRJ/8nN5o7KBLHW74E2WsRWelRG9jancUhbTC+tU40NfN
 S+Ig==
X-Gm-Message-State: ANoB5plQFfpn9EVM85agmWk26JBsZQKPUHZ/8kiqCbhk95cNZOIHIReX
 AfqJoErnmHMX9umUs2NMeYQ=
X-Google-Smtp-Source: AA0mqf4h5Zu36rS3qOVkqcRSDo7cvNRBUpg0vUc/WB8kRcLI6bTnu/sH/WoMpea3APCLWCNvuKlu0A==
X-Received: by 2002:a9d:591a:0:b0:660:efe2:9504 with SMTP id
 t26-20020a9d591a000000b00660efe29504mr1689868oth.49.1669110458235; 
 Tue, 22 Nov 2022 01:47:38 -0800 (PST)
Received: from [192.168.10.102] ([191.19.173.155])
 by smtp.gmail.com with ESMTPSA id
 w48-20020a4a97b3000000b0049eedb106e2sm4746407ooi.15.2022.11.22.01.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 01:47:37 -0800 (PST)
Message-ID: <acd628ff-f6af-6714-5976-70b80b6bf210@gmail.com>
Date: Tue, 22 Nov 2022 06:47:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 v3 40/45] tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-41-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221111074101.2069454-41-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 11/11/22 04:40, Richard Henderson wrote:
> Fill in the parameters for the host ABI for Int128 for
> those backends which require no extra modification.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/aarch64/tcg-target.h     | 2 ++
>   tcg/arm/tcg-target.h         | 2 ++
>   tcg/loongarch64/tcg-target.h | 2 ++
>   tcg/mips/tcg-target.h        | 2 ++
>   tcg/riscv/tcg-target.h       | 3 +++
>   tcg/s390x/tcg-target.h       | 2 ++
>   tcg/sparc64/tcg-target.h     | 2 ++
>   tcg/tcg.c                    | 6 +++---
>   tcg/ppc/tcg-target.c.inc     | 3 +++
>   9 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 413a5410c5..0dff5807f6 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -54,6 +54,8 @@ typedef enum {
>   #define TCG_TARGET_CALL_STACK_OFFSET    0
>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>   
>   /* optional instructions */
>   #define TCG_TARGET_HAS_div_i32          1
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index b7843d2d54..6613d3d791 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -91,6 +91,8 @@ extern bool use_neon_instructions;
>   #define TCG_TARGET_CALL_STACK_OFFSET	0
>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
> +#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
> +#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
>   
>   /* optional instructions */
>   #define TCG_TARGET_HAS_ext8s_i32        1
> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> index e5f7a1f09d..9d0db8fdfe 100644
> --- a/tcg/loongarch64/tcg-target.h
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -95,6 +95,8 @@ typedef enum {
>   #define TCG_TARGET_CALL_STACK_OFFSET    0
>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>   
>   /* optional instructions */
>   #define TCG_TARGET_HAS_movcond_i32      0
> diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
> index 15721c3e42..b235cba8ba 100644
> --- a/tcg/mips/tcg-target.h
> +++ b/tcg/mips/tcg-target.h
> @@ -89,6 +89,8 @@ typedef enum {
>   # define TCG_TARGET_CALL_ARG_I64      TCG_CALL_ARG_NORMAL
>   #endif
>   #define TCG_TARGET_CALL_ARG_I32       TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_ARG_I128      TCG_CALL_ARG_EVEN
> +#define TCG_TARGET_CALL_RET_I128      TCG_CALL_RET_NORMAL
>   
>   /* MOVN/MOVZ instructions detection */
>   #if (defined(__mips_isa_rev) && (__mips_isa_rev >= 1)) || \
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 232537ccea..d61ca902d3 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -85,9 +85,12 @@ typedef enum {
>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
>   #if TCG_TARGET_REG_BITS == 32
>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_EVEN
> +#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
>   #else
>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
>   #endif
> +#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>   
>   /* optional instructions */
>   #define TCG_TARGET_HAS_movcond_i32      0
> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> index db5665c375..9a3856f0b3 100644
> --- a/tcg/s390x/tcg-target.h
> +++ b/tcg/s390x/tcg-target.h
> @@ -168,6 +168,8 @@ extern uint64_t s390_facilities[3];
>   #define TCG_TARGET_CALL_STACK_OFFSET	160
>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_RET_NORMAL
> +#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_BY_REF
> +#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_BY_REF
>   
>   #define TCG_TARGET_HAS_MEMORY_BSWAP   1
>   
> diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
> index 0044ac8d78..53cfa843da 100644
> --- a/tcg/sparc64/tcg-target.h
> +++ b/tcg/sparc64/tcg-target.h
> @@ -73,6 +73,8 @@ typedef enum {
>   #define TCG_TARGET_CALL_STACK_OFFSET    (128 + 6*8 + TCG_TARGET_STACK_BIAS)
>   #define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_EXTEND
>   #define TCG_TARGET_CALL_ARG_I64         TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>   
>   #if defined(__VIS__) && __VIS__ >= 0x300
>   #define use_vis3_instructions  1
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 9dd194a2f2..5465297495 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -743,8 +743,8 @@ static void init_call_layout(TCGHelperInfo *info)
>           break;
>       case dh_typecode_i128:
>           info->nr_out = 128 / TCG_TARGET_REG_BITS;
> -        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
> -        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
> +        info->out_kind = TCG_TARGET_CALL_RET_I128;
> +        switch (TCG_TARGET_CALL_RET_I128) {
>           case TCG_CALL_RET_NORMAL:
>               /* Query the last register now to trigger any assert early. */
>               tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
> @@ -815,7 +815,7 @@ static void init_call_layout(TCGHelperInfo *info)
>               layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
>               break;
>           case dh_typecode_i128:
> -            switch (/* TODO */ TCG_CALL_ARG_NORMAL) {
> +            switch (TCG_TARGET_CALL_ARG_I128) {
>               case TCG_CALL_ARG_EVEN:
>                   layout_arg_even(&cum);
>                   /* fall through */
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 781ecfe161..e86d4a5e78 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -54,6 +54,9 @@
>   #else
>   # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
>   #endif
> +/* Note sysv arg alignment applies only to 2-word types, not more. */
> +#define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
> +#define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
>   
>   /* For some memory operations, we need a scratch that isn't R0.  For the AIX
>      calling convention, we can re-use the TOC register since we'll be reloading

