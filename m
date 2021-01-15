Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB272F7F7B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:27:44 +0100 (CET)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0R0p-00015N-IZ
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Qzw-0000WH-DN
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:26:48 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0Qzt-0007eD-Kc
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:26:48 -0500
Received: by mail-ej1-x62a.google.com with SMTP id q22so13850773eja.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vkTwUS1pzOPfdYWHbl5l+J9VhUMgQvfPJafp3ztSIkA=;
 b=L0yst5ccYkakkptlG0p1ADLh5L9axnoyO7rd90hbsPkAc6urQoCM/QaENlk5P5cgqs
 PvTI8RpjgYfRKoBHTckq5/ArsMKA8YbSg00NutkmcmYDmkzP++Mj23qWTTjvHAo3i/Pm
 4s1N1NudKvPNe8cp/XELUN5wTldrcIoBKmFfwkV4w0g4fn1jrFU/LjcDnyEHvGv/J81u
 SYols8XPoi2OIb5nfBWKAa+GxS4Ey35AJWpOnBds4XYWfhy1Ef4qHhG3S8FYygPUshtq
 0DGT465yHw1BYUr3wRCGO7ixS6EUNvkXvcOzP3RYcXyROjlKG7QrwJKc/S/hUcLelGr9
 IzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vkTwUS1pzOPfdYWHbl5l+J9VhUMgQvfPJafp3ztSIkA=;
 b=FJJhrKKB5i1mPA6R2lTyXy+bPJ1hGdimj3B4JW5K3YWjwmcszHpxAne4TFD9CZCG70
 16DHS4e7VFmRTf6e5B0PJGT35rKkyj7Jphs5RnZa1x+Q7+QyPkEa4yEk0VxC6cZSn0H8
 udR1e0jgAOMIlp53KSLhZGERr1nSf7Ce2CgpOzqwFU46Y0C4FLl4Z2cygxAeR+pf1MGg
 UFypLM7L3VTlrdC8wU2sYNkheZWhcAfkNEgIRggY6keQgF5OasGjx2++Nz4cgpr9axSW
 0HlCpzAVUfzUTAcK+6ZKkdxuxNcVfMmyeGbzs3juroz+X2r3kYc87+kZOvxkczQVpOWq
 ZyUg==
X-Gm-Message-State: AOAM533IChiJ7Mo0HrH7DELsCxrF+w5+O34HG1+5uussM9ShkLHVGr7M
 VvIm55h2u1o25Jmt3gPjt6MPlvXmf7r+7EeHBIOAB/j9dcE=
X-Google-Smtp-Source: ABdhPJwNGpziDRQmzsq10BEhNIeiELzQiDb6YdEBn3WZD+BfgK93XrmI/l70rXtVpzOpfqIOlo8kcg1wdiMFKn4SYDM=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr9089795ejf.407.1610724404344; 
 Fri, 15 Jan 2021 07:26:44 -0800 (PST)
MIME-Version: 1.0
References: <20210114162016.2901557-1-f4bug@amsat.org>
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 15:26:33 +0000
Message-ID: <CAFEAcA_iTcYw+doMT+RmHm6CBTbggBriw9UY25=B_cw2tmoT+w@mail.gmail.com>
Subject: Re: [PULL v2 00/69] MIPS patches for 2021-01-14
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 at 16:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Resending the MIPS pull request from MIPS patches from last week
> (2021-01-07) now than the "decodetree: Open files with encoding=3D'utf-8'=
"
> patch got merged (commit 4cacecaaa2b).
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Simplify CPU/ISA definitions
> - Various maintenance code movements in translate.c
> - Convert part of the MSA ASE instructions to decodetree
> - Convert some instructions removed from Release 6 to decodetree
> - Remove deprecated 'fulong2e' machine alias
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

