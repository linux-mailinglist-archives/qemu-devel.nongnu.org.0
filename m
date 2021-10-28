Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6943F21C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:57:39 +0200 (CEST)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDP0-0000hU-Fd
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mgD8g-000631-5x
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:40:47 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mgD8e-0001IG-Jo
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:40:45 -0400
Received: by mail-io1-xd30.google.com with SMTP id z144so8886489iof.0
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RzCEa6v2cxeJR5LVcCsj8sTsjJij13ORQGRZGzGW+I8=;
 b=LGa0L0mrDKqqFh5FAkmIKbcPrRx0hsGBAM7lRfBB/XAOzW1mR1yI2aURapinnMRSeS
 gDc03QTFaLyIfA0Q5RrcJ8qKWMenivb3Clk6nyfCO+HbXTR4aO+N1FbdxUPws/4Y4QA4
 RL10lElcyiFBlKOqXIMGcdpHPQ3MTlpThQuG108clN9mZbzH9ywNmmbF2ICQsDo9NKlG
 CtlNDnAWs8gAwLNAr+8WM1z6iZQ6nnHq8qHQ4ams+QsRm12yq0gRROOOXXp4I9yM+siF
 iq6cOuk9xC/xtKNto6NIcIGjcvuog8j9ZT9/hRYHLTKH/8QuINCPdZMZOFBfQLwCHUF5
 Nq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RzCEa6v2cxeJR5LVcCsj8sTsjJij13ORQGRZGzGW+I8=;
 b=JwOMP4oc5jdFPkqSOhVhTHS3AZ78h8OI7I/UjnOSHS7+1dlImOPvVZeYsR+Ym/KuOj
 kOGmrFNFJ1lYI+4lNExCm/gKMKJQctrgZfZlN0SGjgSPMLg5Uy1gGnYgdL/SxIQBFs04
 /5uH6LtgkqdSMQQXPn4wZ9izsr0tjIOyrIku1QPP9yJpPh+lJuY5rWGu6RA+S+CZYO6E
 XgPJ5MxlK5jc2qKa6KyGCSG2yytJNtA6E6sUZydun5uErrHSECe2W4u9beBYZIlDE82B
 zzOZg9rqzz25PSfPCy7DtRvc320hTPIGcS5EcFzSFvEsFHXG+mOTNn12EOU09bRDNZh7
 UgHA==
X-Gm-Message-State: AOAM533DgtVuWpnQNYS8+4q5MaFUV4C4ZtuzqaH9SFMBly1QDmRnbo7c
 r12l+9LoZHYcRYDJYzHWrkWlrsEqKVLzJcjfQDY=
X-Google-Smtp-Source: ABdhPJzlHKka2/crUrEdClhW5+4NuSNTlL+R1Ub9qHxDFacqxAhMt3I45xTtDXzo+/BaIhVZPo7ru60w0830jNqYGUg=
X-Received: by 2002:a6b:a19:: with SMTP id z25mr3323106ioi.57.1635457243414;
 Thu, 28 Oct 2021 14:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
 <20211028044342.3070385-17-alistair.francis@opensource.wdc.com>
 <CAE_xrPgiy+OrehPrzt0OZq97jkxGgnBSkEQWbKhROU+v65ac2A@mail.gmail.com>
 <CAKmqyKMHeqia5_1+VXd1+2RPq7-uqFVTfcFgDb7kVetgbXyNXQ@mail.gmail.com>
 <c6f3c1b8-c288-aef7-d478-b65f63d7e849@linaro.org>
In-Reply-To: <c6f3c1b8-c288-aef7-d478-b65f63d7e849@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 29 Oct 2021 07:40:17 +1000
Message-ID: <CAKmqyKM4Uv+71sd3+g7_HfBKHmNcGGkg8XCLzhLj4z=dvp60iw@mail.gmail.com>
Subject: Re: [PULL 16/18] target/riscv: change the api for RVF/RVD fmin/fmax
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 12:22 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/28/21 4:30 AM, Alistair Francis wrote:
> > On Thu, Oct 28, 2021 at 6:22 PM Frank Chang <frank.chang@sifive.com> wrote:
> >>
> >> On Thu, Oct 28, 2021 at 12:45 PM Alistair Francis <alistair.francis@opensource.wdc.com> wrote:
> >>>
> >>> From: Chih-Min Chao <chihmin.chao@sifive.com>
> >>>
> >>> The sNaN propagation behavior has been changed since
> >>> cd20cee7 in https://github.com/riscv/riscv-isa-manual.
> >>>
> >>> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> >>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> >>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >>> Message-id: 20211016085428.3001501-3-frank.chang@sifive.com
> >>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>> ---
> >>>   target/riscv/fpu_helper.c | 16 ++++++++++++----
> >>>   1 file changed, 12 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> >>> index 8700516a14..d62f470900 100644
> >>> --- a/target/riscv/fpu_helper.c
> >>> +++ b/target/riscv/fpu_helper.c
> >>> @@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> >>>   {
> >>>       float32 frs1 = check_nanbox_s(rs1);
> >>>       float32 frs2 = check_nanbox_s(rs2);
> >>> -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
> >>> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> >>> +                    float32_minnum(frs1, frs2, &env->fp_status) :
> >>> +                    float32_minimum_number(frs1, frs2, &env->fp_status));
> >>>   }
> >>>
> >>>   uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> >>>   {
> >>>       float32 frs1 = check_nanbox_s(rs1);
> >>>       float32 frs2 = check_nanbox_s(rs2);
> >>> -    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
> >>> +    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
> >>> +                    float32_maxnum(frs1, frs2, &env->fp_status) :
> >>> +                    float32_maximum_number(frs1, frs2, &env->fp_status));
> >>>   }
> >>>
> >>>   uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
> >>> @@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> >>>
> >>>   uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> >>>   {
> >>> -    return float64_minnum(frs1, frs2, &env->fp_status);
> >>> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> >>> +            float64_minnum(frs1, frs2, &env->fp_status) :
> >>> +            float64_minimum_number(frs1, frs2, &env->fp_status);
> >>>   }
> >>>
> >>>   uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
> >>>   {
> >>> -    return float64_maxnum(frs1, frs2, &env->fp_status);
> >>> +    return env->priv_ver < PRIV_VERSION_1_11_0 ?
> >>> +            float64_maxnum(frs1, frs2, &env->fp_status) :
> >>> +            float64_maximum_number(frs1, frs2, &env->fp_status);
> >>>   }
> >>>
> >>>   uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
> >>> --
> >>> 2.31.1
> >>>
> >>
> >> Hi Alistair,
> >>
> >> Did you pull the latest v5 patchset?
> >> https://lists.nongnu.org/archive/html/qemu-riscv/2021-10/msg00557.html
> >
> > Strange, I don't see it on the patches list. All I see is v4
>
> It was one of the cases in which the cover didn't make it to qemu-devel.
> The two patches are
>
> https://lore.kernel.org/qemu-devel/20211021160847.2748577-2-frank.chang@sifive.com/
> https://lore.kernel.org/qemu-devel/20211021160847.2748577-3-frank.chang@sifive.com/

Argh! I guess the missing cover letter means it didn't appear in
patches (at least not that I saw) and I didn't double check the
version.

Sorry about the trouble. I'll prep a v2 PULL with the v5 commit.

Alistair

>
>
> r~

