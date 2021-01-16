Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835132F8E72
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 18:50:00 +0100 (CET)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0pi3-0007QB-KK
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 12:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0pgb-0006ti-22; Sat, 16 Jan 2021 12:48:29 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:45111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0pgZ-0006rh-L0; Sat, 16 Jan 2021 12:48:28 -0500
Received: by mail-io1-xd32.google.com with SMTP id n4so24551965iow.12;
 Sat, 16 Jan 2021 09:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8BNnLYFKRlO3Xft81e3C5gsPUvxa7gYO9lm1Itd7FU=;
 b=k/lgVubWx7tq4BTL2CL8PbZ4k8b6osy+eO+GmtDGhudGLorTrhJxASFAr39xwabHyt
 dd+tn3yBW7xuMwrPrEgErfBZO92Tp/fupjOjWW9dYRYTCsrZa4j8GixfdzL0CuXVvJGi
 p+0nMsuzaqy26ldTAzzOrEXGweAQvYb0WT24jA1el55EnEA1Soj1v/mNbqAmcuYxf+5k
 SlZduica10N15r8LWcEjYTKausXHJ5pMmpnfJqB5dPTDiG8fUY+sLvzKh5SlBZhfLImT
 Rwa8Nna4ftzclBVAGwAOHShJ7mjI996T21aEBB4yrTXc3Rvw6SCsnuJvlO3mGeVGpTyh
 ok4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8BNnLYFKRlO3Xft81e3C5gsPUvxa7gYO9lm1Itd7FU=;
 b=FP4SRwQizi1hXxu+/c2pDviAzZxO5BD2cYJlgazX7mZWli03B/IoqMYsAg1cpcWnn5
 r2a9QifIzI19Xxasa5RMLo30oIXIq3SSHQlOnU5KmVl+ZfKEs8J2nO0FJ/V4mnluzVQ+
 U9rkZ+UqpRpC1X8zV/VMQDogLkCSyYPCewiTWKui7RIjRIs9FpSI67GMA39uoD2+NLng
 9jjr9Dl3Y/WI5dsC1WAeCMKYOaSMDnYa/S+weOL1avcpbv+M4cKS56lvRzNOEUGzYE8T
 wPNg/Nc8gb9BYCrslGwJZJxYqagZK61+O1RZ6nDoC2tlDbfeNSArTx+V3B1okXrNWp1+
 VWNQ==
X-Gm-Message-State: AOAM530rMERGKOB8+d6SuIbN/HqsoH3uh1EmQOvLkbyjOx1PXsTEnAJL
 YwKpu4l3cQQBaD2nT4zxh9Jj1Th5bHUDF3ite5E=
X-Google-Smtp-Source: ABdhPJy9t0NcrsUKnn95cskXs5dnq0pBcPPtpWo4nzDfQzS24+buoFDFNl+JwBMGWFdEohFOM+FCyp2P6oGQaDQes9A=
X-Received: by 2002:a92:c942:: with SMTP id i2mr15308458ilq.227.1610819306279; 
 Sat, 16 Jan 2021 09:48:26 -0800 (PST)
MIME-Version: 1.0
References: <cd52c38c-4b9-791d-fca0-87f99bb0a011@eik.bme.hu>
 <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
In-Reply-To: <5310dc77-6fa6-36b2-dd51-cd6e1bebaddb@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 16 Jan 2021 09:47:59 -0800
Message-ID: <CAKmqyKPbe9QW+3wYRb1MJ-nSaxs2xDdxBAboiJmEgLCeydOZcw@mail.gmail.com>
Subject: Re: Recent TCG commit breaks PPC
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: "open list:New World" <qemu-ppc@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 16, 2021 at 9:29 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/16/21 4:38 AM, BALATON Zoltan wrote:
> >
> > Commit 8fe35e0444be (tcg/optimize: Use tcg_constant_internal with constant
> > folding) seems to break PPC emulation for me:
> >
> > Thread 3 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
> > [Switching to Thread 0x7ffff51e7700 (LWP 22636)]
> > 0x0000555555afd4ee in ts_are_copies (ts2=0x7fff8c008f90, ts1=0x7fff8c001510) at
> > ../tcg/optimize.c:68
> > 68        return ts_info(ts)->next_copy != ts;
>
> I don't replicate this assertion.
>
> Interestingly, I replicate a different assertion:
>
> qemu-system-ppc: ../qemu/tcg/tcg.c:1210: tcg_temp_alloc: Assertion `n < 512'
> failed.
> Aborted (core dumped)
>
> What compiler version(s) are you guys using?

I'm using:

gcc (GCC) 10.2.0

Alistair

>
>
> r~
>

