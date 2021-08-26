Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3853F8B57
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:51:29 +0200 (CEST)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHf6-00043E-FF
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHdc-0002zy-J2
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:49:56 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHdV-0008Hi-NA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:49:56 -0400
Received: by mail-ed1-x532.google.com with SMTP id z10so5341611edb.6
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+KtmpkvgKr6rHxe2vptpKktK9OD8FPzyOkhkjf4J68Q=;
 b=kaK8hjglgNDIix+PkYvGzYgbimYSFN21agvMkG8NtL4Ndzt0NE6JHp0WgWtlTFAkC4
 FZPqiM6Hb+BZwaoCfBzT62aXplruAJje6v5zmG6LY/iGFSITy6btmnK7XuRbBTDGnRp9
 2CJFnwQAOM1yZsewul/Slc7g9RbSdw+pRkOfGrq6KPsnBUDNkHH6jXLWxpQ9hUU5C2Of
 qvKYUWC2n7csJO3Zw6YRUVKETr5DWtbVca/S65FgSCi7qyr1f/OCIB3JQagEb5dj0snV
 5sdY+g+90ppbP8OtpE74pPRw6NG2bKevt4C5N2y1BXSv9nNiL+1KRQieosYJ/273e+zF
 xa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+KtmpkvgKr6rHxe2vptpKktK9OD8FPzyOkhkjf4J68Q=;
 b=ZzQ6ML9O5YU5NZKVMIiEToOo6jpv9u4MR/bQaSG5/bcuGUcGyCVkTNBjzBGJrtkLvZ
 RcLLbBQcsQrso6GtJWWmdhQ8BrH+7FCHtpH3RMfCuA65u/WQiHZ6vtVtVXz+tso5279Q
 ApbN+NQO6W9yLIJUDWUX3QILOKUQlXKBp5tUeyTaxGN9jH5KfNZG9E20x3soAD5Uvc3Q
 vQG64SEakPDdn4C9qyZ4V/cVkw4k+kvomMbzkfWlqDR73UGrZOWRKzplXQY8MetsOgIP
 kWGadaifKJ+fQ+ns0ZPEkv5UZEhWaJg8FJWAVqfDezRvv9nsS4/giuaNcAqwdEnez2ta
 gerw==
X-Gm-Message-State: AOAM531jBnnqXvMgyzlTemVKkmR1/F8kA5evWf5+3u6R+OXSG8FhFkNx
 Vr1X2Ip58hhWif7ZZZPR8NQ7EVsczUQllDNoV3ivGA==
X-Google-Smtp-Source: ABdhPJwKr/8GE1pksOEawMAnKFwkdx9t8VdfVXi+upWjgFtRYOlzUjuGnx7d1G2JQeby0qffXyHFb4E/hw+rix5qQCU=
X-Received: by 2002:aa7:cc0b:: with SMTP id q11mr4800111edt.251.1629992987779; 
 Thu, 26 Aug 2021 08:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
 <CAM2a4uxp29QKMaLFOseS5dHRNuooVY6sghzD22NEtGE=3g5wVA@mail.gmail.com>
 <CAFEAcA_eQrd+Hiky+tUZSoNDkcmz5MwpM2=2RQp-gnCDTV4wvw@mail.gmail.com>
 <CAM2a4uwkY85PaPKBKbA1b_xc6LkeTkR4Me_S9d1HRi2y8TwOiw@mail.gmail.com>
In-Reply-To: <CAM2a4uwkY85PaPKBKbA1b_xc6LkeTkR4Me_S9d1HRi2y8TwOiw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 16:49:00 +0100
Message-ID: <CAFEAcA-i5RUxh9=jmz-hN+LLg6_nk3TaanUy-2DDvtfdF7wyeg@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Gautam Bhat <mindentropy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Aug 2021 at 16:46, Gautam Bhat <mindentropy@gmail.com> wrote:
>
> On Thu, Aug 26, 2021 at 1:24 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 25 Aug 2021 at 20:03, Gautam Bhat <mindentropy@gmail.com> wrote:
> >
> > If you're
> > doing this specifically because you want to look at how a
> > target frontend for a new architecture works, have fun, I guess.

> Exactly what I want to do. Since it has only 27 instructions and I
> have a lot of dev boards I felt that it is right microcontroller to
> start with.
>
> For this I want to have a proper dev setup where I can load my binary
> while I am writing my translate file.

Just create a minimal machine with some RAM in it, and use
the generic-loader to load the test binary into the RAM, then.

-- PMM

