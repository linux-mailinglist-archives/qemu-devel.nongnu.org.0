Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C939A16C372
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 15:09:28 +0100 (CET)
Received: from localhost ([::1]:57188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6atr-0005w4-QB
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 09:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6a6f-0006Ts-Kh
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:18:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6a6e-0003ac-Ce
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:18:37 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6a6e-0003aH-6l
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 08:18:36 -0500
Received: by mail-oi1-x243.google.com with SMTP id v19so12471647oic.12
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R0ZHLlWySBg8qPOi6/AiA6dMUpTtq4vQOt8BzQt+4L0=;
 b=kmuukNCEPOnqN/h7Rgw5P1WHZf1l3vtbEDmZ4sdQhK45L0XDeXFA7wm4IL3TuDd05A
 u5baXUVZNaCE/4liiSHjpTJaPFKXGGnUSTf2ufCFkn/oMZTr0CoVd8nBPgODUJN954Ik
 8zLWERI9ufDLbbq8HYqJs8e26W448eSrXxZmu+iKrOrru3AKuTzPGRj1MmGsBL8zcUd/
 yf4EGT95CcS9+QE0Hro8r3gSj+rQrtIVsx0+utJOILLx/DAAoN9EXup27ETSthrS7BlD
 KTGlAh+UHp6Y/sFenSpn+LefmcnlZb/sb55IMoXViZcVxfQ4c9Wk71TH5Un2DQ5Q3jN8
 l5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R0ZHLlWySBg8qPOi6/AiA6dMUpTtq4vQOt8BzQt+4L0=;
 b=G1xrlaOp9qnSSU0yxpArJ6V4YokknVeGtuBulgXROOVwNjM19xyW2H9xSm8r4tZWiF
 YusS3c2S3gsSVwnYqIGn0z8qlVBJ3ZZOcEh0DyFb6woRDWkF8Rf1TwJL3AZ3PsEJUS1U
 wWxPZyc50pBXwwS8ZaUSSJYyDesaOGJg4OJFY+vdu8r13oJgh9lcmuQvXBi3G1y8XgpT
 vSHm9cbsrxzlSuGLv7ODR/IXrtIIaGYDucXWJYucYiWQMctbJxTIaEnd7KGCn/0lVmEn
 McB7eAdsD34RSUVm9FA6reMKV4jTvdJaBsNE6iJes5AiVKIICV6n/L+a7c698iLHdSjb
 rGsg==
X-Gm-Message-State: APjAAAVR46qsuNmm4iU9/7vNDXmkl0Vd9DTVQZY2Kua8Z7fKolXWU9q5
 aZP9aBLg/IuadS4EVX3am+OE31D5PRapq4g5e59EkA==
X-Google-Smtp-Source: APXvYqxJiwjtotRiQ5WFMZTxnTkacRasj/9XZWy9t0phxbSNRKiNYRwcsabrPVLaYtlHyTeTR4PWqWZBM4DSDDOUCFM=
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr3451522oif.163.1582636715173; 
 Tue, 25 Feb 2020 05:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-2-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 13:18:23 +0000
Message-ID: <CAFEAcA9xPy2=aT-=RQfWiQRQrMc0c_MS8zrQEfpMrH7W9YwgxQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] target/arm: Add isar_feature_aa32_vfp_simd
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
> Use this in the places that were checking ARM_FEATURE_VFP, and
> are obviously testing for the existance of the register set
> as opposed to testing for some particular instruction extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h        |  9 +++++++++
>  hw/intc/armv7m_nvic.c   | 20 ++++++++++----------
>  linux-user/arm/signal.c |  4 ++--
>  target/arm/arch_dump.c  | 11 ++++++-----
>  target/arm/cpu.c        |  4 ++--
>  target/arm/helper.c     |  4 ++--
>  target/arm/m_helper.c   | 11 ++++++-----
>  7 files changed, 37 insertions(+), 26 deletions(-)
>

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 79db169e04..8841cc7fde 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -894,7 +894,7 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>           * ASEDIS [31] and D32DIS [30] are both UNK/SBZP without VFP.
>           * TRCDIS [28] is RAZ/WI since we do not implement a trace macrocell.
>           */
> -        if (arm_feature(env, ARM_FEATURE_VFP)) {
> +        if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
>              /* VFP coprocessor: cp10 & cp11 [23:20] */
>              mask |= (1 << 31) | (1 << 30) | (0xf << 20);

This use in cpacr_write() is ok but it prompted me to have
a look at the whole function, which is used also for AArch64
CPACR_EL1. Currently we have an odd setup where for a pre-v8
core we carefully check and enforce the RAZ/WI bits, but
for v8 we allow any random bits to be set. Anyway, that's
I guess architecturally valid and not an issue related to
this patchset, so:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

