Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C253FBDDD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:04:40 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKoSD-0005Tr-IE
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKoO4-0003va-0P
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:00:12 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKoO2-0001KL-9F
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:00:11 -0400
Received: by mail-ej1-x62d.google.com with SMTP id a25so33962408ejv.6
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fiVQdDuMquEr+oSOTLqmh2Dzjenr1jhFOjw2E388dU0=;
 b=q5xl0lgTrc017T2dMjdirFmL+/j7YgeMwuSPT2p/wp+C1xNz3GgMDT0IH6cwDzk+yc
 BaTYqCWiPVXrM6SnN1C7eh2IA+7OpUhRrky/RQDGr5s6vYaYHacTgeoc8Vunzkz+vq2z
 Jyn38CvAHiblsEPfKaXBywpkI0HanshZ8jXUbKddPyHWzIKdPb0WKkwLOezQXSRHkCzr
 jUgXd7NrAdoxtSaULaMZybVqOzjm109xctAMl7HCuOTm5mVAfQ3UJY0Uvm1vu4lxciwR
 UsDzVqeJVVlUwdnE8RpolhMJSOzUDQ5rYfLN17W+4sGsKuixD1bfQEgydFApJES0YJRe
 Gb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fiVQdDuMquEr+oSOTLqmh2Dzjenr1jhFOjw2E388dU0=;
 b=kr/LmcfBTRd7D9Q7b2nUxlJbibFR7wW6G50pPLLrIT3EOoysbUzVflWaTtNLTXgUeY
 hxswqs7rx4xf0aMpiJ6epcqN1FALQX+Lt99dVt4oKQNBarGBrFaB5Nff4JTCnoF9HzKK
 Mto728H8pY/eINMbAJ9uUCO/wzEo2KxjOU1SZZAfRq0k5iGBwFanW+0uYUvo1e61lpNJ
 UANYQCKDJPtUpvlvJjw13I4z7Wdl5vruEj6StNTTF68G5/SLr5TlLtoRhgbKoMJqUeI4
 UPXPyCBUjGD8WpBio+TNHB4PYrZgaRimAarNlG9QZHK4dF5LqZGiIwGikR76IIAPw+U1
 GvaQ==
X-Gm-Message-State: AOAM532IaZmrPqidfXv3VIlTgosbx4DlKbBXuUMoHdhg1TEQJZ8s0qM/
 5WyV8kzTVbAAFntWn2cPYnHtLi7MKGeMkOUDOSZeIg==
X-Google-Smtp-Source: ABdhPJxez9QKnFJpD3oOCqowGXUp+JkHo52KFP3D5OfdDzGE0Q5fe9mWiiRkEN9Zy8EvcmIi8urOag0fULsjViD7oRM=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr27515859ejn.56.1630357208394; 
 Mon, 30 Aug 2021 14:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
In-Reply-To: <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 21:59:20 +0100
Message-ID: <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 at 21:29, Programmingkid <programmingkidx@gmail.com> wrote:
> I found out that there are two pc-bios folders. One in the root directory
> and one in the build directory. QEMU is looking in the pc-bios folder
> located inside the build folder. The qemu_vga.ndrv file is only located
> in the root directory pc-bios folder. I think a good solution to this
> issue is to first remove one of the pc-bios folders. I'm not sure if it
> is just me who has two pc-bios folders or if everyone does.

Having two pc-bios folders is expected. The one in the source tree is
the one which has the files we actually carry around in git. The one
in the build tree is created by 'configure' and populated with symbolic
links back to the files in the source tree. We need this one because
the QEMU executable doesn't (and shouldn't) know where the source tree is:
when it is looking for files it will look in places relative to the
location of the executable itself (ie relative to the build tree)
as well as places set by configure (used when you install QEMU and
its various supporting files).

The reason qemu_vga.ndrv is not in the pc-bios folder in the build
tree is because when that file was added we forgot to add handling
for it in configure. I'm not sure why nobody else has fallen over
this in the intervening 3 years: running QEMU from the build tree
will never find the file, and it will not be installed via
'make install' either.

(The pc-bios symlink stuff is a bit of a mess, as the comment about
it in configure notes. Perhaps meson now offers a cleaner way to
handle this? In particular pc-bios/meson.build already has to carry
around a complete list of all the bios blobs, so it could probably
create the symlink farm itself.)

thanks
-- PMM

