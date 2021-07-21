Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF43D1541
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:41:56 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GEF-0002vj-UR
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GBD-0001wV-6S
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:38:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6GB9-0002Vr-QE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:38:46 -0400
Received: by mail-wm1-x332.google.com with SMTP id n4so1801854wms.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6fTPJcHVhTRggLAKqUQHrliBX8x0yh4pnQqTFBABytk=;
 b=QJLBPzqrltsQzL3aVlvsfdIeU8a/UWi/xll2ijLZH86G73x7IUs0iGkjL7LWaOFCIo
 Kip+Q55fbvCF8yJIHZwBpQx65m+mZS/UkuSKb6ilvUvJIUNDsPG9n4UQzTviAT7l+yWi
 407hu+tgqgiTy+k1O4CFQiLNwptLNs24ZR5S+qf18PLIOd0upZDZacgb6N6ANbZ31Au2
 M6NXV3tyvLQPcGxwrUbqqkHA2aERD2p4a91MJca0j1AC1yPVU96sId5c5OF9FWh1Rl48
 sp6jtmcxEd32CLS2meu8U4slAc3VI0p5t/IwktSdMkAeWQ5QGi36MtjK2CA9d2YjdMEX
 VRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6fTPJcHVhTRggLAKqUQHrliBX8x0yh4pnQqTFBABytk=;
 b=rbWawwn0S3tcoK2F905C2DLeIK3sGjdGgptrRU2cBVpmSQKtKyZIZZgzN42fq0jf76
 1FJxfxaknJqN7kgcc10CzLWFi2R/0Y2fIwNvNEGGzc5nQv3xERuEi8rHQKqlsWy+7yGK
 h9H76jhCMn0jEyn45iBfP5/7LCxH9DWKGiOkZ2K2h4HzuP9i9Im9QAOtJyHW/piuBsOF
 sBxK4ATi/hW8dCIhE+B+/PyH7PlyXpdGbtvK6aPHMGh8O1MrMbgtrzLWYe/8i6l3VTzc
 Z1jjczsJeSrOmCsbtg7x81uC3d3JpThhvlzZ1MAhM0bKGmPsbDUQrFTW9Vh0PKnmiSfr
 Zd9Q==
X-Gm-Message-State: AOAM532H2efbkTSbTjUwdX6sUVXKUmHknQArDdW4kg0sjgFdDNPVDojY
 zpYzJU17Y6zU8BTZAVZ6gm4=
X-Google-Smtp-Source: ABdhPJzi8OfGYm3xCP3DrmHaQwXbybqkdCK3c3rceIu3m/1ycaYFapxW5QQXiUexOW5RI34+zddMqw==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr5176422wmo.91.1626889121324; 
 Wed, 21 Jul 2021 10:38:41 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f82sm497235wmf.25.2021.07.21.10.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:38:40 -0700 (PDT)
Subject: Re: [PATCH v2 07/22] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b004b8e6-c0c1-d13d-fae0-81c1ee22a95b@amsat.org>
Date: Wed, 21 Jul 2021 19:38:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-8-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.117,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, laurent@vivier.eu, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 11:53 AM, Song Gao wrote:
> This patch implement fixed point arithemtic instruction translation.
> 
> This includes:
> - ADD.{W/D}, SUB.{W/D}
> - ADDI.{W/D}, ADDU16ID
> - ALSL.{W[U]/D}
> - LU12I.W, LU32I.D LU52I.D
> - SLT[U], SLT[U]I
> - PCADDI, PCADDU12I, PCADDU18I, PCALAU12I
> - AND, OR, NOR, XOR, ANDN, ORN
> - MUL.{W/D}, MULH.{W[U]/D[U]}
> - MULW.D.W[U]
> - DIV.{W[U]/D[U]}, MOD.{W[U]/D[U]}
> - ANDI, ORI, XORI
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  target/loongarch/insns.decode |   89 ++++
>  target/loongarch/trans.inc.c  | 1090 +++++++++++++++++++++++++++++++++++++++++
>  target/loongarch/translate.c  |   12 +
>  target/loongarch/translate.h  |    1 +
>  4 files changed, 1192 insertions(+)
>  create mode 100644 target/loongarch/insns.decode
>  create mode 100644 target/loongarch/trans.inc.c

Please don't include all .inc.c in one big translate.c...

> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index 531f7e1..b60bdc2 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -57,6 +57,15 @@ void gen_load_gpr(TCGv t, int reg)
>      }
>  }
>  
> +TCGv get_gpr(int regno)
> +{
> +    if (regno == 0) {
> +        return tcg_constant_tl(0);
> +    } else {
> +        return cpu_gpr[regno];
> +    }
> +}
> +
>  static inline void gen_save_pc(target_ulong pc)

... expose this one ...

>  {
>      tcg_gen_movi_tl(cpu_PC, pc);
> @@ -287,6 +296,9 @@ static bool loongarch_tr_breakpoint_check(DisasContextBase *dcbase,
>      return true;
>  }
>  
> +#include "decode-insns.c.inc"

... and move this include to "trans.c".

> +#include "trans.inc.c"

removing this include.

>  static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>  {
>      CPULoongArchState *env = cs->env_ptr;
> diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
> index 333c3bf..ef4d4e7 100644
> --- a/target/loongarch/translate.h
> +++ b/target/loongarch/translate.h
> @@ -35,6 +35,7 @@ void check_fpu_enabled(DisasContext *ctx);
>  
>  void gen_base_offset_addr(TCGv addr, int base, int offset);
>  void gen_load_gpr(TCGv t, int reg);
> +TCGv get_gpr(int regno);
>  void gen_load_fpr32(TCGv_i32 t, int reg);
>  void gen_load_fpr64(TCGv_i64 t, int reg);
>  void gen_store_fpr32(TCGv_i32 t, int reg);
> 


