Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F462119262
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 21:45:47 +0100 (CET)
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iemOA-0000aX-6p
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 15:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iemMo-0008DT-Np
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 15:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iemMn-0006RI-Nk
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 15:44:22 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iemMn-0006R7-Ho
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 15:44:21 -0500
Received: by mail-oi1-x241.google.com with SMTP id v140so11188753oie.0
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 12:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E6V8tIqevgVlwbTdy9dCUQL/0odOgZs4rdR5xp3G7sI=;
 b=nixYjW+/lmjwDcos1nP9S114bDWQGfseH2UInld0abLTzZ7l1mFqEoyT/LIr/hWwtZ
 KyS6nDmGZ9utrp5pcjq+PJHBVE83ves15ULoBmg1kxFdF8fUoUC6820n6m26zUE/kSse
 y+LYrjlLK6wt6TbQShsHiCRSXjYlazXIwv/va8ZpLW2Ys95IojsdZyPfjZ2DQA4I4cTG
 9oMxKnRSIgd578KcC6ayX8Qhtqs3y6aAFhVS0kJ6YwvR+VNdxe64raBcRhtz0fgTbkm2
 MEueSAIjCxozLGYODbiV4KBT5d1VDxXzbLv/ozXBZU6jhzBLP92OdyVTLc5l7JHvwd5V
 BNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6V8tIqevgVlwbTdy9dCUQL/0odOgZs4rdR5xp3G7sI=;
 b=KpCJ3Lwhha1OEimYMSc6ywYT6jYPpZU7PTtcgNYBn2N7FLXqfrzuP7QaPU8RkBzAvp
 oKlRdaTg8HyTugwXROdX6jAKTE3GUDKZ2D7jcq6uUydIr4CwHus36myVrzc3m1KUWi9q
 rFCS3qPQEze1vcwc9PoaBMNv3XfSKddSVDzE+G5I5dp7ubi8PM3oo3ILVvwL64zvEBkJ
 IGPy8nSniS4r+cyO2FCOht2+cAMVcg/syAB0kMp6VgkU8EnCfbi5/hbMHi3TwKO8OF0U
 bs2gU9uUGPojbYcPs/688dJ/GMZ4SBzPSLmAQdJFrorKfqJZBM1qh95scO1hNx3mQzSd
 ISsg==
X-Gm-Message-State: APjAAAXNrnpTuMeZqAWGJ8HQdTUUz7T7riRgNWz63I5YomdzCrwF8jS3
 EdxLw49RFOs7trIxUlpyKrrzhuPVIENRTMPeE24=
X-Google-Smtp-Source: APXvYqy43HnLk8aqlTvnLxyK6QdsdG/Ynh8gTTeW7+ZhflxiKjBU2TU9flJUnMZ0kOMVeWT9/X8w9L1xW/5+ll+oItk=
X-Received: by 2002:aca:bbc6:: with SMTP id l189mr739306oif.53.1576010660581; 
 Tue, 10 Dec 2019 12:44:20 -0800 (PST)
MIME-Version: 1.0
References: <20191208183922.13757-1-mrolnik@gmail.com>
 <20191208183922.13757-6-mrolnik@gmail.com>
In-Reply-To: <20191208183922.13757-6-mrolnik@gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 10 Dec 2019 21:44:09 +0100
Message-ID: <CAL1e-=jWz5KEma9w-MvOHf6k9vzo1_FAV39d_S=NiDUYx_-bQQ@mail.gmail.com>
Subject: Re: [PATCH v38 05/22] target/avr: Add instruction translation -
 Arithmetic and Logic Instructions
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Thomas Huth <thuth@redhat.com>, Joaquin de Andres <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 8, 2019 at 7:40 PM Michael Rolnik <mrolnik@gmail.com> wrote:

> +
> +/*
> + *  Performs the logical AND between the contents of register Rd and register
> + *  Rr and places the result in the destination register Rd.
> + */
> +static bool trans_AND(DisasContext *ctx, arg_AND *a)
> +{
> +    TCGv Rd = cpu_r[a->rd];
> +    TCGv Rr = cpu_r[a->rr];
> +    TCGv R = tcg_temp_new_i32();
> +
> +    tcg_gen_and_tl(R, Rd, Rr); /* Rd = Rd and Rr */
> +    tcg_gen_movi_tl(cpu_Vf, 0); /* Vf = 0 */
> +    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Zf, R, 0); /* Zf = R == 0 */
> +    gen_ZNSf(R);
> +    tcg_gen_mov_tl(Rd, R);
> +
> +    tcg_temp_free_i32(R);
> +
> +    return true;
> +}
> +
> +

In the v37 comment I suggested to you make "update status register"
portions more compact (but also to mark it with an one-line comment),
but you overdid it and extended this compacting all the way to the
main part of the handler. And now it is still hard to discern the core
of the handler ("and" operation) and the update-status-register
portion.

Yours,
Aleksandar

