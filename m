Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1659AB31
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 06:21:30 +0200 (CEST)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPFzF-0005Ei-CT
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 00:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oPFxi-0003k5-1H
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 00:19:54 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:35421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oPFxg-0004M9-Cd
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 00:19:53 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-33365a01f29so168461047b3.2
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 21:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gcd2JxaszvhZPnTlMM/td0/i9eu/14VCTbHiMDbl7q8=;
 b=Y6lfxeDLPvG6kI7vKFIUY7VH3avJPJXq4PSXEbT8YJHM39RlqGzZMy/+I6tlbUa3Ma
 ErnzGnfkerCISCi+rGaULlD/5PGVHJYp4gecDjPcsBEEHzcP157KNfFilqvRvV+cra2R
 OBDyGHXX1NKamMxKV0fGSCuhbX27du9JG1wRnObF7ZCaiCIhqDQkvYoNl9+xcnllki1h
 4V7zLLCiaiAlEqN0SljFVGNuZNt+5//WFiLFZu/bFrjFBFzFGVw8Z3L1RgC2TmHIJkev
 EwirXbBCoKvY8viY0+WU6LC/L4NpjXMdAHppQWBmm67aZ3R48FirZkfpF13AYiuPyUbr
 B6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gcd2JxaszvhZPnTlMM/td0/i9eu/14VCTbHiMDbl7q8=;
 b=fhpp6vwwJ3XHwDgaO0rhPLcXuN+5s35MIzklcm7hUIYmGDEsGBgQeU32johPG5YB6a
 4SBOng2LGxSuj29As6sMaS0CXInLCkAMOPiKh0RgPpVQvUX9Gim3iMSKXPvGmOOkGd+2
 y2oH0weVxLYxvl5fvhmODSSSLJo2L5M5PC4N4zxYcX81wX5Tr+h+G8QjInlm2T2fqpxw
 c45jMwpunHzdMnb3poN46Q1oGHRC1IBf6/Qdi38uj0eClj/AFnzFGBgnBsTWOcGBPOrE
 xxX6Lgq0Vwh/SFlnJtn2p4TUc8AYk+HBBi8PqfYgrbDPSB5vjdNLdA+UgXOyfzS97bxS
 W5jg==
X-Gm-Message-State: ACgBeo3ASl2AyXB+CGh0qY3vXwZYBKz9vNT3Mk7cFqZcrVRQEJNn83b4
 c7nRMT1sm0Qg3G8eEzYyEhTRoECUSA6iGsdFkinq3w==
X-Google-Smtp-Source: AA6agR5Ue5f8imEdFMBI67NUYZ+t4VYCA8hcvlDfZjpGBZ2B6yWlGlJdcKuGSOhVZio1rezFOx6haKMsbF8acLY5NH4=
X-Received: by 2002:a05:6902:919:b0:671:2b80:4b3e with SMTP id
 bu25-20020a056902091900b006712b804b3emr10641892ybb.180.1660969190914; Fri, 19
 Aug 2022 21:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220819073147.174790-1-apatel@ventanamicro.com>
 <787bcb91-c20c-3b33-b052-95453cf6827c@linaro.org>
In-Reply-To: <787bcb91-c20c-3b33-b052-95453cf6827c@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Aug 2022 09:49:13 +0530
Message-ID: <CAAhSdy1apCOYPj9eCO-EbcuTeDZZZF+8eJ3p_H2LMLEpJLHsWg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Use official extension names for AIA CSRs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::1134;
 envelope-from=anup@brainfault.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Aug 19, 2022 at 8:40 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/19/22 00:31, Anup Patel wrote:
> >   static int aia_hmode(CPURISCVState *env, int csrno)
> >   {
> > -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
>
> Better as
>
>      RISCVCPU *cpu = env_archcpu(env);

Okay, I will update.

Thanks,
Anup

>
>
> r~

