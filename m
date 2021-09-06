Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E24015FF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 07:48:51 +0200 (CEST)
Received: from localhost ([::1]:57570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN7Uv-0007ol-Vq
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 01:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7Ri-0004q6-JL
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 01:45:33 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7Rg-0003Pf-P4
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 01:45:29 -0400
Received: by mail-io1-xd2a.google.com with SMTP id q3so7260470iot.3
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 22:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8lrXbQ/Qm+oE1JxyhYpTTy+cNpLwl3haNoe6X20koaA=;
 b=Do7zxRCxUw+oHocx52SMc29PvCeBFNC500zu1bTvq5cCXX7ByxdvoS+SHVUl7z4eZ7
 WZnFzPUFs36YSL2vfK9SRdnAzE30I2NACPTck1I9FBoOxKe1YT+ucbN6qT7h0qTvHjO+
 jywYQWwbokwuz2ZKgza8O+FXIFhHtbm84TYYEJIefDIBZr+w1ZdmOZ8ZlB6xzfzCj/kS
 UaMpfA502jwJGqfRpV/m3abr4mYgk+8Y2zo5thrJlIW6n8OZ2Dz53CbiRVs50zkn3eaP
 TU7cOvIQQB66M6bFaXhCxgz1ePWGbEDNymU5+sIo+dfY0Nn7p/yZPzXTo9uNcGAUscTx
 aTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8lrXbQ/Qm+oE1JxyhYpTTy+cNpLwl3haNoe6X20koaA=;
 b=Glr1m9ec9BlGZ5+5urY8L7duadbH0vRYHCaKe7QpcI+5wpYZpP86Po1TQCTAGBIrC5
 +agD3xXAlR5gz//+rYmzN75Bst9Wkk9xO0PtwJhKlEvgw20arFVkQYWmSDoeeL7/V/2h
 QnMJwICVcEux150FzNC9s0HtJbjmTor9MFRdD88h0EVk0jztTA24QsZRDEGDd3zX5JQr
 9hxmCN7J253B+3l5uPtcBhkUrGZFFdAuxL+Gx7YBVd2uxBYsW9Q0EKqRSaDux0Pe6EjT
 jZ8Vq71iwNuE8gFXZp/XGyIdqc3z0ATaV4uf3FI35FauCWFNzg51YqWru2eRY1r+w5/b
 2rUQ==
X-Gm-Message-State: AOAM533iB61tBR4aL1xvt1EF5mMEL4GaYIAXtUh2ohZF/6I4tNClCekn
 brDPBEmRpgVhnwhwkohFKjrvRpu+7+RrO8B/HzI=
X-Google-Smtp-Source: ABdhPJxtsxdSDXpR2At0o/det/CEeZ8eGtyK5w+jQp3OYyaO6bpYNO0qBRAUx1XIBaRd/RVyeQyeNMcqDNALvPT+p4Q=
X-Received: by 2002:a05:6638:d11:: with SMTP id
 q17mr9234774jaj.63.1630907127713; 
 Sun, 05 Sep 2021 22:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Sep 2021 15:45:01 +1000
Message-ID: <CAKmqyKOzLMstYDMfEeVOZGZAcR_-Tx32w=LPS6jMTtT=k6y=pA@mail.gmail.com>
Subject: Re: [PATCH v10 01/16] target/riscv: Introduce temporary in
 gen_add_uw()
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 6:40 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> Following the recent changes in translate.c, gen_add_uw() causes
> failures on CF3 and SPEC2017 due to the reuse of arg1.  Fix these
> regressions by introducing a temporary.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v10:
> - new patch
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index b72e76255c..c0a6e25826 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -624,8 +624,10 @@ GEN_TRANS_SHADD_UW(3)
>
>  static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
>  {
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    tcg_gen_add_tl(ret, arg1, arg2);
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_ext32u_tl(t, arg1);
> +    tcg_gen_add_tl(ret, t, arg2);
> +    tcg_temp_free(t);
>  }
>
>  static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
> --
> 2.25.1
>
>

