Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444E16C272
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 14:35:51 +0100 (CET)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6aNK-00035d-6V
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 08:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6a90-0002g7-PR
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:21:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6a8y-0004V2-7F
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:21:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39462)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6a8x-0004UM-BL
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:20:59 -0500
Received: by mail-ot1-x343.google.com with SMTP id 77so12028258oty.6
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 05:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CtEMsHBDkcHsELBZP6EN0gh6y5RoeXlZuqtlqlC8x/Y=;
 b=J6+7oWhSTxn+le2NO7qF/9xo9yKFmD//y4tx1qttHmljCru6rK9BzMi7DeshcE/BHI
 +riMPjH9o9kLGlPYPT02LenJJoQ9Eb7VoTBo1PGJ8f7mQQCLPCEB2Wm+4nX9eusxHjl8
 F81SdbaxojaXjV2mktHxWOFExYUzg6G4qZoEmo6Wy0No3fOpWpYy+fP8yoJM5Aabm1Vp
 jQUvvec3v0hZ2KfDs/mgJpMJRD2jAWeDrho0/H1KnfKIDQbMXKfjRE51po9O55YZacZX
 sT7BKw7r0eaks/Q80XGrZ1Ol9cj16FIbQ/FCgngTboPUi01lA4HLNXqvQa4TCSoDSJsO
 imFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CtEMsHBDkcHsELBZP6EN0gh6y5RoeXlZuqtlqlC8x/Y=;
 b=q1PHOaXzCxoFveJw5wrWNV2RIxpChHV9PiY24YWn13lcgWNG90UPevcJWNW4Z9HtPL
 m1t+1GPo+20ODshQ+QelgagmspvZFMHwFVtRucSpazAw7eScN9aqfmuEmF9CUCaJQ/nT
 y2imwm2i1vLt6+JSYe9eOImUqtdFfcf0aLGLKkiled4zCdN03YoTz9+sLJFW/aSMhwl0
 J8PQUEXg/cURZFBdJxVTNO30j6GCWUqvQZmmODuf9g1bBfatQee/JtII9HXPY6hYtulj
 2O/xSWqItUwfhwO8mb3+DcQKBJi0AxQG8eZ26JGrjRZVWJHl8LSPeaAWVIxQ8aHOPGcu
 zVCA==
X-Gm-Message-State: APjAAAXi42e/ETokhCKBl+kyEtKtQ7tsMJDTQgh9BR+uaQGVHIOGYmXv
 +5u4H+Z4dMc1RQXh1qGvykdWeKz/MOfcky/sqA/kgw==
X-Google-Smtp-Source: APXvYqy56smFg/JHnYqTFfaE8NPH9smWNNEqfmGOOH864uGNGtK3fr56f4SpZav5Avhkolq+ry7hwio8Qkh/H3jXJOM=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr44891573otd.91.1582636856070; 
 Tue, 25 Feb 2020 05:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-5-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:20:45 +0000
Message-ID: <CAFEAcA_Oo2FQ_2BNKgcUHOS5AzHHOahvYq0ZnZ+3_5668MYMtA@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] target/arm: Add isar_feature_aa64_fp_simd,
 isar_feature_aa32_vfp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We cannot easily create "any" functions for these, because the
> ID_AA64PFR0 fields for FP and SIMD signal "enabled" with zero.
> Which means that an aarch32-only cpu will return incorrect results
> when testing the aarch64 registers.
>
> To use these, we must either have context or additionally test
> vs ARM_FEATURE_AARCH64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     | 11 +++++++++++
>  target/arm/cpu.c     |  9 ++++++---
>  target/arm/machine.c |  5 +++--
>  3 files changed, 20 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

