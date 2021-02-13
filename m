Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2527D31AE1B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 22:26:51 +0100 (CET)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB2RF-0001xO-Vl
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 16:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lB2QT-0001UM-Nf
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 16:26:02 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lB2QR-0008DK-Q8
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 16:26:01 -0500
Received: by mail-ej1-x629.google.com with SMTP id g5so1784790ejt.2
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 13:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=39VSGtm8+egHm4fvyRFtTb9UQulzZbFwljddmweqBL4=;
 b=RbwWdDkqnXpsdB629dnGmu3D6GuMta8EfkGn51o3F18jRpeXmGJiPwoedOhr4Ck6vo
 NAuRmOzg6Qh11gEDTlgnpQ+p7L9FGxhyb9DaOBzfWjx286ztgnmV8JYhRucFbAGyQJrq
 tzuxOTDnCalgp3lG19YTtgRHWqeHjkjmjtsBOdRzV0TGS5XzEkW/QZs7e27emx7N9wII
 BpRtg/cb18rBVS+6fHSk8G3uZdfJ/1ElcIe4qLGBWqVfT1vU3IwSMXokPffCfWJsjZUu
 z3KXSNRlbHv4HJrxa+Xx8e1ABu3AItJripWvOzZ19svx7sFg8HVpPV2ymqsinDFRcJX3
 Et+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39VSGtm8+egHm4fvyRFtTb9UQulzZbFwljddmweqBL4=;
 b=NVzzctW8vBTo0VhTD/fdfNZ9M7VZWj8bhHZ+bvIHvQMLos2n6tyigW6NJO+t5AfXHp
 nfP/XLu6IW1bOQRjazo8S5rGczMVZ1pV3aPs87wfCLeh4Ou3BzafErroJMSvLcN3SwgB
 AyBHEfBwRe2jl1MbMbKeEZIk7qiW45LStkgej8hIxAuq9e2q6Jy3jILUm+il2Icc0JTh
 8qKtz1aqV9VcsQgvz4BDxh/fgMKk9BSeDuH2BC0it1hGi+13FRjvCcfA+1/NM/KEdFTB
 dzz1JZpxGJkgHx1+WQuWmGTR/l73N76twGv/pl43/1BjRThMUJ6JhCA0l53ko/dvWqMY
 cQbA==
X-Gm-Message-State: AOAM531D5xyUTy4oHMHDHoCdz6wB+EwDYicC5AMLzGgp2DmTZ4lF9/MG
 iHlKt4r6tJcTVhe0qpksBR2OhJxxK6ZTcnJGAT7KnA==
X-Google-Smtp-Source: ABdhPJyrNz0lgdcuO2xnBZ5bCPV+dqkDu32CZVP/KTC7HZugzcFuXTUc2ym/g6MRJwmK4baUGfe25NAd0fq7Pt3D/+c=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr8937274ejh.85.1613251558144; 
 Sat, 13 Feb 2021 13:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20210212211448.413489-1-laurent@vivier.eu>
In-Reply-To: <20210212211448.413489-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Feb 2021 21:25:47 +0000
Message-ID: <CAFEAcA9F5NydzXf4UhMuzDQutc=i_OtJT_c2T_YPt7RcQNq-aQ@mail.gmail.com>
Subject: Re: [PULL 0/7] M68k for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 at 21:18, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab60:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205' in=
> to staging (2021-02-05 22:59:12 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request
>
> for you to fetch changes up to 382d71af7d61620ffb023962f83cc4786303c60d:
>
>   m68k: import bootinfo headers from linux (2021-02-11 21:56:42 +0100)
>
> ----------------------------------------------------------------
> Pull request m68k-20210212
>
> Move bootinfo headers to include/standard-headers/asm-m68k
> Add M68K_FEATURE_MSP, M68K_FEATURE_MOVEC, M68K_FEATURE_M68010
> Add 68060 CR BUSCR and PCR (unimplemented)
> CPU types and features cleanup


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

