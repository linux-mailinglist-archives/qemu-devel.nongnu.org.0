Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432DC4D8B68
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:10:54 +0100 (CET)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTp9h-0005XG-Bu
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:10:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTp5p-00033P-Vt
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:06:55 -0400
Received: from [2607:f8b0:4864:20::1134] (port=37804
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTp5o-0004Lc-EC
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:06:53 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e5757b57caso17975977b3.4
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgadmAQsqWPy2QMJBAdQGGwMvwUwieGyeCUC6PkyNRs=;
 b=sWATnI0/HyEyq3I5CD07t7e3Z2uYJqGjsAluDWLN3nsIR48G/FlqJ6/GjtKFPxohas
 gVJNLK9anO8AjFVz9x7RrHxUEbdgw+p48SdfBPv0YWqfGlJVVpJLaprXKwhVRODoHjwk
 g9hVWq2fS2bPV+mheLusz59X7ICXKTkHDYWZiSR/3zZwKdA0pZoCUScPE4hLvU35GQ4a
 3ti7PAk+uSZPEIoV4It187yUQnpIfO0R0eetVUfDXV3t5waW4BV2Hyd14kvYjKJWvOyp
 b1HB59EYUxUbjKQGvRSqe6ih1F7HKtF4Z21MZKfSWL2ejLnbuHHpywqxlS3qXxpyBPVm
 pN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgadmAQsqWPy2QMJBAdQGGwMvwUwieGyeCUC6PkyNRs=;
 b=jA84vSy0Dz6HbatIb6KmhdE1QeyCnY1pE65i8glRCH8c/hNrwn0XFzdZTjQcSOX2oQ
 QveJ0CeUy06G6W0jq7CqloVQHf8jUoujQ692EKQT+iMIXiYmylFURgv1q10RX6fNngh8
 fGcvUMxHjZ9UqI6Mk1grO/o5zR1lqByuG6RdoirHlp31YQxdPe2avoPw+8mRYF42JVaV
 o3c5+36rl2lTS7LBXOSD4XW7AIHceLhLM81DkLcz9W2+4Qm3Gzjw0Nni9JVAgW3MNRhR
 1y9fnL3UA+B5D0ftuu4d7tW8pYUhet29Uwq8qZPpvectdCND8BRfR1JphphWkx1tDp0w
 FU9w==
X-Gm-Message-State: AOAM532ls6iJP0DJlCDZjeG6ic9a4Nn5FYr1g3PXr7yCrg+4ClgddW4y
 6Ra044HF5K0ByJ1mK6YjUqEw4mEjhFVoX/li9SZcYsRzxT00Gw==
X-Google-Smtp-Source: ABdhPJye9kLatmydnlr3AFQK6gQmYjKcGpgRE1Tn3L9oDkp+zaH8okFZ38bsdxU3EHG9LSa1iY9bweKrTM5FwoSecis=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr20368398ywe.10.1647281211432; Mon, 14
 Mar 2022 11:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220314172508.816110-1-raj.khem@gmail.com>
 <edb07e42-fbe0-2eed-48cb-adeade84d416@gmail.com>
In-Reply-To: <edb07e42-fbe0-2eed-48cb-adeade84d416@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 18:06:40 +0000
Message-ID: <CAFEAcA8bKnYQ4KroudyEowv-7A+ru6A6RTrRVgjqbtEafrPJnQ@mail.gmail.com>
Subject: Re: [PATCH v2] ppc: Include asm/ptrace.h for pt_regs struct definition
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 17:59, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
> I am intrigued about why we didn't hit this before, especially considering that ppc64 header is just a
> pointer to this file.

It's specific to musl, which does different things with its
system includes than glibc does.

-- PMM

