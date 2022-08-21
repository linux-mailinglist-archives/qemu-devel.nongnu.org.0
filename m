Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394E59B6D0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:46:08 +0200 (CEST)
Received: from localhost ([::1]:46270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPudq-0005Io-VE
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuZa-0008Ib-As
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:41:42 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuZY-00031u-Ph
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:41:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id e19so8157487pju.1
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gWndzogJpU+pcS+RQCwGSaNKETH5CjbeVsa8y9XNt8M=;
 b=YRy7BmGtQP32O2KWG5gGiOR5MFhXNw8l5n6QjUgQFDmuaAcgXd08lEB44iz/JPYG8j
 jcS1h47nisJwJA/xMtZ/3eX+eYxODbrQ3+ooLnvX+Fxk/y3vTcsrdS16oBHOVV+QPxYs
 SJaAdGx+Z43zCbbUXdohnEew4QgU+lStieca3Y41he8UEDmf8z22JFTremvk+NemiR+r
 06tTX1sWBJussLLaveAU5mCr5Tk+EOaH8FPRTBqCO4/cYyNDQd4vqYIEOn2Y56LRHI+I
 LGzZUrPZAP49cyDYI4zX/wSm9onQGBf+cgWGdmY9pyearg7ddsVdHiywZttDBasdI5+B
 O4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gWndzogJpU+pcS+RQCwGSaNKETH5CjbeVsa8y9XNt8M=;
 b=lBtDNnPYK/D3hcw0zdKiuhKwx1qCS2VLNuC0XGSes5YwjPvSP5n289ysTnnXLvX68J
 g89RoAKTU+MiPU3BiZuEmqwrvJ3/CV90dEp8Qr1Ft08DWfzTVXrk23gg8yRVMnqD0v3h
 NMYfbSex2DA1y1yK0W7FbBXzyGPQhDY+N3H42Og15/wLLVdhCmxdF/jrpOkwoiwe3Vxt
 Q1btKWuoFOH8N5QG8WdvZj0ZJQ1dIvYlTwhpXPFSnhn2dcrins1I+CX1b2jPX3bP2YRl
 ghNIeqVcbKRyojhrgCpK2KV9EPGmi4cut2Rg66CDzXVEzDsg9a7MO3/Tmfhq+15KPLfB
 F2GQ==
X-Gm-Message-State: ACgBeo1Z7rkZ+Odv96uUf8oiyXLyPgfsDIhfc0WfaHek5sANlA5QBNi3
 dzEJjd8OZwwGw74KgSyO6DH1Q/J1mAZ7TKE7F5w=
X-Google-Smtp-Source: AA6agR5jSLUoHvlAe8cMI0WnQlXVuCBCku9OwAnczpKIafqA1BlMF4lg/VFblKhlqZdkpvrgHjFdYoVEEaTmm6NJx54=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr20086162pjb.129.1661125299491; Sun, 21
 Aug 2022 16:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-16-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-16-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:41:13 +1000
Message-ID: <CAKmqyKPYTiseWJSTYs7GROCn+3fOvZVTkonL0PZiXO_y5-3GsA@mail.gmail.com>
Subject: Re: [PATCH v6 15/21] accel/tcg: Remove translator_ldsw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 1:36 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only user can easily use translator_lduw and
> adjust the type to signed during the return.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/translator.h   | 1 -
>  target/i386/tcg/translate.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 0d0bf3a31e..45b9268ca4 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -178,7 +178,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
>
>  #define FOR_EACH_TRANSLATOR_LD(F)                                       \
>      F(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)           \
> -    F(translator_ldsw, int16_t, cpu_ldsw_code, bswap16)                 \
>      F(translator_lduw, uint16_t, cpu_lduw_code, bswap16)                \
>      F(translator_ldl, uint32_t, cpu_ldl_code, bswap32)                  \
>      F(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index b7972f0ff5..a23417d058 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2033,7 +2033,7 @@ static inline uint8_t x86_ldub_code(CPUX86State *env, DisasContext *s)
>
>  static inline int16_t x86_ldsw_code(CPUX86State *env, DisasContext *s)
>  {
> -    return translator_ldsw(env, &s->base, advance_pc(env, s, 2));
> +    return translator_lduw(env, &s->base, advance_pc(env, s, 2));
>  }
>
>  static inline uint16_t x86_lduw_code(CPUX86State *env, DisasContext *s)
> --
> 2.34.1
>
>

