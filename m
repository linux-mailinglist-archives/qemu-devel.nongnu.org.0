Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A44A555B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 03:49:51 +0100 (CET)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEjEs-0005fy-4w
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 21:49:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjDx-0004nM-C2
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 21:48:53 -0500
Received: from [2607:f8b0:4864:20::d30] (port=43970
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjDv-0002UL-Ly
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 21:48:52 -0500
Received: by mail-io1-xd30.google.com with SMTP id z199so19469034iof.10
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 18:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EJj4+IOOJv9spZXKqCKGmZ754veLowzhtGw+rtrZ/Do=;
 b=hY8EETnOKqEIdBA+3ZiO459muDSeOUJ+bw91pG64mY7wnNwtYALkp/3zuN0i2UwhDl
 ZVHVg2Rlmmr/wBFyb6oYK1pd7s22BowxIkjASi3b9sVvXQRrcWYgj50hYgGWcsGHSgjA
 CgNknTE1IZ3jxIGDfypEas3jlWMjvbCk8B54v+3MAdpc0VsXdmIew4Tcjn1SocZe9Tr/
 EvB46p2uNqK2OxjM0PGirkq/D/8nZPwHBxCZSJMmt5tlaI8hW5W0jy8jqpk+cmpfsOcI
 mzB7c+hqGECbzgNo3HuUOrqpRlZIWTGa0Q9f1vocxC1lluUehwUzRe35uU9BZKNv6mcl
 FmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EJj4+IOOJv9spZXKqCKGmZ754veLowzhtGw+rtrZ/Do=;
 b=O4yxh1LJkmCnLuXbIbcmv4Gq/TamVQGXPErKAoP6tBUhrmUPh69ghQlb8siWQKatgI
 jSgPXi7qoFjLsi9qL2nYdk8NLPXqJpmUONDPaTLGKBGJj1uUEcpk7XvsJUNxMIeXrUsw
 xxX0Bmh690agw+K3g18T6pKadC/ZFHSwTTBbOwlE7FaGHiLDv4pnbrbrvn8Mz+AlaUrW
 MADJ2pTe+Juzy1+dzXcqsWROXuEbLBkmtM7n3aZ0nh2aJlk5WZGjFZ4cawr/gQQDmdp3
 rkMRphGQJdPLyhNWhDdcHOlfG3S1996bLopIVGRb7gpkag/JXP2oayC4ul2phL9wehGr
 i/Ow==
X-Gm-Message-State: AOAM530jvdDNQxWriV9dMbe1aqHz0LoS2o7tSgyI7+z2AN9YgHntqAKd
 /DTnMYx2V/bp5GKQaG87ySnr1qvMO1+4KO7z2L8=
X-Google-Smtp-Source: ABdhPJzQsjxKTIRslVVTboOGlQDx8xTima/21VMtQeDkgY8oaW6CMzS56wD1oPeFojPYJA6jeHqHrUmBZpK/ImUSe3w=
X-Received: by 2002:a5e:da47:: with SMTP id o7mr12571625iop.91.1643683730615; 
 Mon, 31 Jan 2022 18:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-3-philipp.tomsich@vrull.eu>
In-Reply-To: <20220131110201.2303275-3-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 12:48:24 +1000
Message-ID: <CAKmqyKNhN1qHMLOXXeFubyMWPmbWsWP-wr3-_AWvxwP0amZ0KQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 9:03 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> As the number of extensions is growing, copying them individiually
> into the DisasContext will scale less and less... instead we populate
> a pointer to the RISCVCPUConfig structure in the DisasContext.
>
> This adds an extra indirection when checking for the availability of
> an extension (compared to copying the fields into DisasContext).
> While not a performance problem today, we can always (shallow) copy
> the entire structure into the DisasContext (instead of putting a
> pointer to it) if this is ever deemed necessary.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v5:
> - use the typedef in DisasContext instead of the naked struct
>   for RISCVCPUConfig
>
> Changes in v3:
> - (new patch) copy pointer to element cfg into DisasContext
>
>  target/riscv/translate.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f0bbe80875..49e40735ce 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -76,6 +76,7 @@ typedef struct DisasContext {
>      int frm;
>      RISCVMXL ol;
>      bool virt_enabled;
> +    const RISCVCPUConfig *cfg_ptr;
>      bool ext_ifencei;
>      bool ext_zfh;
>      bool ext_zfhmin;
> @@ -908,6 +909,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>  #endif
>      ctx->misa_ext = env->misa_ext;
>      ctx->frm = -1;  /* unknown rounding mode */
> +    ctx->cfg_ptr = &(cpu->cfg);
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
>      ctx->ext_zfh = cpu->cfg.ext_zfh;
>      ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
> --
> 2.33.1
>
>

