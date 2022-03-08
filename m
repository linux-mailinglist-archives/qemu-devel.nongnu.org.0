Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D112B4D2286
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 21:26:18 +0100 (CET)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRgPR-0005NO-Fq
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 15:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRgNm-0004GQ-3B
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 15:24:37 -0500
Received: from [2607:f8b0:4864:20::112b] (port=42548
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRgNj-00063z-C4
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 15:24:33 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso347657b3.9
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jYIurjCufGA7DItahGd/qsBDYqH+/JFUxfwXCjvCZew=;
 b=bWRZyw11gprFTHljxaPmCSQfVRcgPqyx6F2r3uGtkKLP8HQ4jB1FdEYjQZyqsouwz1
 4XW1ShBoCJlTZNCxEkh+Gw4Czp8YKPL2VkM4XqAe8PlnPCxdxT5uwzYdfK6sUuV25vLa
 HKsEVN0+1MOKTIsJuONhsOOXaOcwjuuMgGQkRBACiZI4uonZP57Vcq7RkELmsXbM/9VG
 UXKnOSlghE2pBj5n3adIPVidgSnMmvI/g89Cmf98bN7ld2mHQ0OgdRKdpBzsbOKZSp12
 +iDAoM1ny9yfcqV91gekYaMFifwRY71K1uKZ7IUNqQ6Y2v7uxLmfKSVlsYTRMGYxsXAR
 eanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jYIurjCufGA7DItahGd/qsBDYqH+/JFUxfwXCjvCZew=;
 b=ak4bOq82Vtds07ZKCeIyudjNqt43P9ZNWnB+nCg6JtC1FtqNqRzDj+WVK7Up4CoEIL
 cQA7mIHVjiXe5znEeN4kzrQosiYzgrPACPsVHhZYOS3FwmXL/jyKhbzvv7sqAyuTo5ek
 EfSMJ20dSK1m6JZKyPekfXmiQHgBm00E2sK0jrKNi2CnpEoKg0qO1lVqb0kC6RCLuCvA
 Das2cdLHFrVE7QdWVQn4NNWKVbs8mBckJdhed9re5XbKB0cMKP75ckt/JSaCyXOisOW3
 HCRRnsMKgreL9R2tLWFMDw/kw3hAFH3iRise2+oyS+xzemJooMX01/tZ7VuPRWRaWV9V
 cMew==
X-Gm-Message-State: AOAM532pLSe3zPdc5Yd5OkC72gMexYXbD4xYAfaWrFsxtwUaFyTWVH2a
 SoDNkw832CquyA1B7C3g2W/zqnd+o/ZzJ00EA7nJvA==
X-Google-Smtp-Source: ABdhPJwevtidr8yfqNsBw+GOVhg0XYbBayPqikcqTXbbtSESSBYDyzIFnFsEYnr9lKSn69TWbYQIP66wn2LvhcnT3hY=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr14201801yww.64.1646771069930; Tue, 08
 Mar 2022 12:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-18-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 20:24:18 +0000
Message-ID: <CAFEAcA-y3H1GP9TFDoUsLTMNWMe0SnVAXHyM2scaRyCafD=Y=w@mail.gmail.com>
Subject: Re: [PATCH v4 17/33] target/nios2: Prevent writes to read-only or
 reserved control fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create an array of masks which detail the writable and readonly
> bits for each control register.  Apply them when writing to
> control registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index f2813d3b47..189adf111c 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -88,6 +88,55 @@ static void nios2_cpu_initfn(Object *obj)
>
>      cpu_set_cpustate_pointers(cpu);
>
> +    /* Begin with all fields of all registers are reserved. */
> +    memset(cpu->cr_state, 0, sizeof(cpu->cr_state));
> +
> +    /*
> +     * The combination of writable and readonly is the set of all
> +     * non-reserved fields.  We apply writable as a mask to bits,
> +     * and merge in existing readonly bits, before storing.
> +     */
> +#define WR_REG(C)       cpu->cr_state[C].writable = -1
> +#define RO_REG(C)       cpu->cr_state[C].readonly = -1
> +#define WR_FIELD(C, F)  cpu->cr_state[C].writable |= R_##C##_##F##_MASK
> +#define RO_FIELD(C, F)  cpu->cr_state[C].readonly |= R_##C##_##F##_MASK
> +
> +    WR_FIELD(CR_STATUS, PIE);

I think you need to claim (CR_STATUS, RSIE) is a RO bit, because without
EIC it's should-be-one.

> +    WR_REG(CR_ESTATUS);
> +    WR_REG(CR_BSTATUS);
> +    RO_REG(CR_CPUID);
> +    WR_FIELD(CR_EXCEPTION, CAUSE);
> +    WR_REG(CR_BADADDR);
> +
> +    /* TODO: These control registers are not present with the EIC. */
> +    WR_REG(CR_IENABLE);
> +    RO_REG(CR_IPENDING);

Missing CR_CONFIG register ?

> +
> +    if (cpu->mmu_present) {
> +        WR_FIELD(CR_STATUS, U);
> +        WR_FIELD(CR_STATUS, EH);

True by the documentation, but we don't seem to prevent EH from
being set to 1 when we take an exception on the no-MMU config...

> +
> +        WR_FIELD(CR_PTEADDR, VPN);
> +        WR_FIELD(CR_PTEADDR, PTBASE);
> +
> +        RO_FIELD(CR_TLBMISC, D);
> +        RO_FIELD(CR_TLBMISC, PERM);
> +        RO_FIELD(CR_TLBMISC, BAD);
> +        RO_FIELD(CR_TLBMISC, DBL);
> +        WR_FIELD(CR_TLBMISC, WR);

(the docs call this field 'WE', incidentally)

> +        WR_FIELD(CR_TLBMISC, RD);

If you claim this bit to be writable you'll allow the gdbstub
to set it, which is probably not what you want. (Actual writes to
this register are handled via the helper function.)

> +        WR_FIELD(CR_TLBMISC, WAY);

Missing PID field ?

> +
> +        WR_REG(CR_TLBACC);

> +    }

You don't enforce the reserved/readonly bits on status when
we copy it from estatus during eret. (That change appears later,
in patch 26.)

The same *ought* to apply for bret, except that we have a bug in
our implementation of it, where we fail to copy bstatus into status...

The machinery itself looks OK.

thanks
-- PMM

