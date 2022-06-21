Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B75532D9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:04:10 +0200 (CEST)
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dY9-0000w9-3J
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3dTc-00078U-SS
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:28 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3dTZ-0005EM-UC
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:28 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id v81so24370575ybe.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aHz7WQMmw7+ThFbAIB4Woi8phD9N9vPuPlC2jZ+3T3M=;
 b=aQVsgVvTLfFp0PW/1Af8bqeCbl8MNn2lnyIfqoGwZl97om+uLuxggk9UhMNvrjZNfn
 tqNGRhhcqq1+PL0bHecPyI4jSSYSDCXdyqXc2+BMeB+12XmsxOSEhUGGoG9UP+G4pZbf
 wluxe12DsGrFCCJTfqI96s3eMDoLMJbY5fY9UySI+4MaPn1I3ZMhIUZANlvtTwy2dFsD
 hC+sx4NH0iqTrhE25gsm6857UlrB15qDi9lmIZzpgzESq+Pfn7XFR/zrZw2vigRYxNti
 YKsI8Rchta52ihMQ5zaFsti/mqO3YP5Sta9uiPR7rJP4u5aQgwoeXnunJlm/f3Z4Fo7T
 eWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHz7WQMmw7+ThFbAIB4Woi8phD9N9vPuPlC2jZ+3T3M=;
 b=fmWsUGWHphcXs8px8/SjxbJ707gP+vj322VwiaKlMdiDrnaBO1EVL4Q9RUbUZOw2Qm
 SVFGbzg3ZC8Qtot5fgfcZyVWjMU9gVbwlsFBT8BRPWIJ/UzIJ2Sh6Js4ynfjTRL512ck
 4HHNck+h28m26GvQS6ZaxXWVGsq48nRY/XPfe1W9fjN9QowXVsn9r117rsjb9NoDKFof
 NO2Nbh1rXCXwwhS0/UosNGD3Y/5hARpg8b+Z+Gff9LbgBzHoiSufIlC5blTLgy266UuA
 AOkh4tl/oA0IsgbG8LUcWmJyzazw7gfg1CTMRhz5Gtdk71l0xuaJQ+I3ZWFCgi+EgQ09
 q7TA==
X-Gm-Message-State: AJIora9rr28f0cDf0/SwbQgs1h9ffqnG0irfR8+YwBdji6lTPYaiXXXX
 uW/hXWVODm6wwoiATtlIlLvgnNVRmuVHFEXGLhp1BA==
X-Google-Smtp-Source: AGRyM1tZrhgYWoQwvDubuiFdJn69cOPGClbUNZGsIEM0SQWyyFNmklatJr0vXObfCfvTi3h4nXf40jzXVL2Sfyx4UN8=
X-Received: by 2002:a25:bcc7:0:b0:668:eb41:ddbc with SMTP id
 l7-20020a25bcc7000000b00668eb41ddbcmr15785368ybm.67.1655816364803; Tue, 21
 Jun 2022 05:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220617060703.951747-1-aik@ozlabs.ru>
 <20220617060703.951747-2-aik@ozlabs.ru>
In-Reply-To: <20220617060703.951747-2-aik@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 13:59:14 +0100
Message-ID: <CAFEAcA9oBEH0CxQ0VnLSynscXXhDZk=XW29anpCOHGa-XqN3Wg@mail.gmail.com>
Subject: Re: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 17 Jun 2022 at 07:20, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> It keeps repeating, move it to the header. This uses __builtin_ctzl() to
> allow using the macros in #define.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  include/hw/pci-host/pnv_phb3_regs.h | 16 ----------------
>  target/ppc/cpu.h                    |  5 +++++
>  hw/intc/pnv_xive.c                  | 20 --------------------
>  hw/intc/pnv_xive2.c                 | 20 --------------------
>  hw/pci-host/pnv_phb4.c              | 16 ----------------
>  5 files changed, 5 insertions(+), 72 deletions(-)
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 6d78078f379d..9a1f1e9999a3 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -47,6 +47,11 @@
>                                   PPC_BIT32(bs))
>  #define PPC_BITMASK8(bs, be)    ((PPC_BIT8(bs) - PPC_BIT8(be)) | PPC_BIT8(bs))
>
> +#define GETFIELD(mask, word)   \
> +    (((word) & (mask)) >> __builtin_ctzl(mask))
> +#define SETFIELD(mask, word, val)   \
> +    (((word) & ~(mask)) | (((uint64_t)(val) << __builtin_ctzl(mask)) & (mask)))

Can we retain the explanatory comment that says why we don't
use the standard QEMU mechanism for field extraction
(ie the FIELD_EX*/FIELD_DP* macros and the extract64()/deposit64()
functions) ?

> -/*
> - * QEMU version of the GETFIELD/SETFIELD macros
> - *
> - * TODO: It might be better to use the existing extract64() and
> - * deposit64() but this means that all the register definitions will
> - * change and become incompatible with the ones found in skiboot.
> - *
> - * Keep it as it is for now until we find a common ground.
> - */

thanks
-- PMM

