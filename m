Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9F36E1BE0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:45:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCF2-0004ee-3J; Fri, 14 Apr 2023 01:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCF0-0004eP-Ga
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:44:58 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnCEl-0006eo-11
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:44:58 -0400
Received: by mail-qt1-x833.google.com with SMTP id l11so18571617qtj.4
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 22:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681451082; x=1684043082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+aI+kCm09jqxGbMEP19lLoE7AUCU3TMctPqTWpfrJ8=;
 b=FNvLSiqUhFYoGwfMfto2QgdeYp/vphH0XgZ7UfQwd7+2bc3ya5N0Rr7bIcbJ+DqGlK
 auNmsDEez4sggnMaDXI6IlSUnn3lDeYPVOi+vS5sAOyiIrAnZKuemPih7tX9GB/IyB+B
 IF2MQVaUrxond+GfPrYgr+AGyLQpBF3zo+t8zB7tPhIi4DMTfTVMVW2kvHRjrAjtSERu
 +wKdcR4Lq+WvXep0bRqFzyMQ/Z+Cu3uIWliIghr6lYxq0blfmnlf2DdUYNbiBdbPN/8t
 Y2huYFdyaggG69CUOA5CU26iQu7AB1gcrhB2COa8Hl3CLmCWM+B3C1rYDfptWTgf4vlg
 OH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681451082; x=1684043082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+aI+kCm09jqxGbMEP19lLoE7AUCU3TMctPqTWpfrJ8=;
 b=gFxZBz1Q8D6Q+eDe+tJSGpp6X5nPGpGiv3qVR6GI9dl2VBE5Dy3seC/LBbCnOCEU7t
 aZTe1SDmPFzQU8lB40rhAd6mAsIkyS7NacrD6Gp1W1MCouM7Q9V/BntrguNt5u3L82Ta
 ineYWfQF/JPiNj6TXVyI/aY+EendYbIGyeTUb6VOaDVoSEH8KtPRHOcvDV94HoKy3QC7
 /48Upst5UTaCL1ZhnNMwXHaUautb3BIpTh403JOu2JLCPEFy+Q9GtWJxDZWN6YLCJn/W
 dqZ2OjC/RfPpBjY77TcGTAzAzhguOfO2H9lX+zyw38tFGIFAqJ81wAcuCePoeuFZiOk3
 SKTQ==
X-Gm-Message-State: AAQBX9eoiiw4gOYCigHtxPlXfKUZN/xgZDuRyqAamSrkkHEEgT8rgjDx
 oqni7H8uMYl61UNhkswOLqNeCd0YW3X12aNoLpNbIA==
X-Google-Smtp-Source: AKy350auFSjt/zrhcvBb6mALImdI+6KQYlVcs0CHhjrAW5vDuFLkfK87bNMaTe4zi0JBcuDIBXh5skNgPQqRGmT8gO4=
X-Received: by 2002:ac8:5714:0:b0:3e4:de7a:d532 with SMTP id
 20-20020ac85714000000b003e4de7ad532mr1491774qtw.13.1681451081859; Thu, 13 Apr
 2023 22:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-4-mchitale@ventanamicro.com>
 <9592dac6-2ba7-533a-1d70-2244ecc59761@linaro.org>
In-Reply-To: <9592dac6-2ba7-533a-1d70-2244ecc59761@linaro.org>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 14 Apr 2023 11:14:04 +0530
Message-ID: <CAN37VV4cUptywft_pAdfkyr=jo2iM=nr0++o92khCmVw02Oa5A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] target/riscv: check smstateen fcsr flag
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=mchitale@ventanamicro.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 11, 2023 at 7:23=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/10/23 07:13, Mayuresh Chitale wrote:
> > +#ifndef CONFIG_USER_ONLY
> > +#define smstateen_fcsr_check(ctx) do { \
> > +    if (!ctx->smstateen_fcsr_ok) { \
> > +        if (ctx->virt_enabled) { \
> > +            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT)=
; \
> > +        } else { \
> > +            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST); \
> > +        } \
> > +        return true; \
> > +    } \
> > +} while (0)
> > +#else
> > +#define smstateen_fcsr_check(ctx)
> > +#endif
> > +
> > +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> > +    if (!has_ext(ctx, RVF)) { \
> > +        if (!ctx->cfg_ptr->ext_zfinx) { \
> > +            return false; \
> > +        } \
> > +        smstateen_fcsr_check(ctx); \
> >       } \
> >   } while (0)
>
> As a matter of style, I strongly object to a *nested* macro returning fro=
m the calling
> function.  These should all be changed to normal functions of the form
>
>      if (!require_xyz(ctx) || !require_abc(ctx)) {
>          return something;
>      }
>
> etc.  insn_trans/trans_rvv.c.inc is much much cleaner in this respect.
Ok. I will change smstateen_fcsr_check to a function.
>
>
> r~

