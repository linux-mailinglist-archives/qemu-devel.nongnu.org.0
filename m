Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186733EEC48
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:19:07 +0200 (CEST)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFy3d-0006Vu-Qq
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFy0y-0004w5-TL
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:16:37 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFy0t-0000DO-SG
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:16:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id b7so31334401edu.3
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TqZxfJti8Mw36BvMInAO6++1AAQk02x/kM1fBmTMKck=;
 b=e2mEfuVpxwNwfFCJJsG6EmKwOHY3DwlJUDp7u3tOAuoHgYBiJULrwzB/DPSWAly470
 oqGAU8XDLe9JGHZiGHKpe2YEehzsm7iS9Yzf5gjzWsb3U3XR3Kr8d16KD2caNLzQ2IDK
 I/+MS5O37A34r1YFMQwAFVN9qp50pbWYjCHQQ1G028KF1BfsPdYacuZDinOTdU2cw5F9
 EGY97zAdij+7hgn7NuXt0MQZoz9hKztQtRwn7VfPaFleOH8819z2BPu+OSJ4gAkkYjdl
 rXSVrtHvgo2jh8YQXfJe33kop1Qha2cGYpO/N3+DQvV8RJrLq2VuciVT9aK3IW0fRrnd
 +ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TqZxfJti8Mw36BvMInAO6++1AAQk02x/kM1fBmTMKck=;
 b=Ev6JK752yCfcKwn2nqekF2TAijH6K7qnzcyz5l+JSVRt8AgHSV17aWBbBv63xlpngO
 h4yyy+Fe6TbV3OddwBfgNlKzMscGaTjkrZURup2vAamAzTRDirN4OI10NrVZtXlhPgJv
 LaNI8+Wy9SVx30GijYXmCoLKEpNlBeirgHGh6Rzpp/34yCDDNFVJrYjFYdz1tctfGX3l
 /U76PejEJYwvyue0Za6SzWE+E0r5K3vpC1kdF7RH1rycWnJoDNckmpiZ51CQGAGrl6k2
 1lZZTESvCdYDLXcY4ZB3pO8RFM7jqaRwuAmwrddq9HckhKXPYpX1NgC8L0fScUBJvrp9
 Cwaw==
X-Gm-Message-State: AOAM532aNrlFapbOHMNuhazwslYfMgrH9iT9Nl5tJUbazA9TiXVwjKlV
 biYRgaYBRMZRZD97FJOxOJRAP2Y8/4DWVys5tQoLCA==
X-Google-Smtp-Source: ABdhPJwILTlfGHD/hKwHZhXHIGceKtJt67Mk48iBJV9LDJkwZAplyTYOiVhCndi57cfun53O8qjfY+215q1L4RhJM68=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr3823488edc.204.1629202573413; 
 Tue, 17 Aug 2021 05:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210816191316.1163622-1-matheus.ferst@eldorado.org.br>
 <20210816191316.1163622-2-matheus.ferst@eldorado.org.br>
 <b5b5ca02-aac5-4bc3-3898-b45c53c8b5a6@redhat.com>
 <a0b41585-27d1-aeaf-be03-f14935c1b8c9@eldorado.org.br>
In-Reply-To: <a0b41585-27d1-aeaf-be03-f14935c1b8c9@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 13:15:27 +0100
Message-ID: <CAFEAcA-eOerMaWW60hwq8-QRFND5SZDoC0PRoNy-zC-wdUwW_g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 1/2] include/qemu/int128.h: introduce bswap128s
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 13:09, Matheus K. Ferst
<matheus.ferst@eldorado.org.br> wrote:
>
> On 17/08/2021 06:27, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 8/16/21 9:13 PM, matheus.ferst@eldorado.org.br wrote:
> >> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> >> -static inline Int128 bswap128(Int128 a)
> >> -{
> >> -    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_ge=
tlo(a)));
> >> -}
> >
> > Personally I'd move this one to the other #ifdef side,
> > and implement here with __builtin_bswap128().
> >
>
> I saw this builtin, but I couldn't test it on my system. It seems that
> Clang doesn't implement it, and it's only available on GCC 11:
> https://godbolt.org/z/T6vhd5a38 . I think we can use it, but I'd need to
> figure how to add a test for it in the configure script.

You should be able to get away without a configure script test --
#if __has_builtin(__builtin_bswap128)
/* version with the builtin here */
#else
/* fallback */
#endif

ought to work. (Any gcc new enough to have the builtin also has
__has_builtin; clang has had __has_builtin for ages; our compiler.h
defines a fallback "always 0" __has_builtin for older compilers.)

-- PMM

