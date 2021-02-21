Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6144320DB6
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:50:55 +0100 (CET)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvgs-0007gi-Uv
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvfN-0006fX-0Y
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:49:21 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvfK-0003HQ-9m
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:49:20 -0500
Received: by mail-ej1-x633.google.com with SMTP id u20so25283296ejb.7
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pju0vZkKOIsuTdvnuZzQpVZJICXYt3+e/BMtV78P5yI=;
 b=atbEzvh9SOPpT8oJmKWqdmNCvzzT9wRiklUgHmRhYkBj4VrofnsuzyZHDWs+8r1Q4q
 NjQeGuxCYmsMUNgjjzLm2VPd2W4Pf2jpTdZVPHnDnK0qzR9HCB2+pEd+gQ7E51XxKw0U
 6SdxBVM0x3Rc8eyRpsUX7xURaFhsm97uwZkaAW14khBIzKtj51EaoqvV0smJ3hYBmn10
 BxgG24V7A5Py2XXyv8gcCmwcoDf8XcKJZ6N7CCpvNIm9L568loAMU1iaB9kTH05tQjsQ
 3qsC77LPqgkenz7zPQF3JdY7P9eNttR1v9PMS8ePMh1EKlOnDrzjQaO0Q405LdYkrZ+M
 kzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pju0vZkKOIsuTdvnuZzQpVZJICXYt3+e/BMtV78P5yI=;
 b=JKid01CmBw19E9nbIHKh9SgL7QcfRc/JSVAofUbwkFo9QzQfqYrgJ7EqmvbGu34R0l
 Wogq+KDcTj+Z2h9A/tpZXMGXpoC8+Z3NlzoudLY/oRfpVL8oxG+cjG4D6AANnxvKyYoq
 AAsUBYpwtLX+/OMDSBFL4jSKfWwZkNZEkjqMJdUqUC0CbouB8/ZfoEui7SKQ6CzwxDHk
 bLIaavYwvOOw7wWqv0Dceg4tdLjdl4ayvZ492ss61ASGt82SxOHjkNOnUouAnfb6mSB9
 d1aGJDPQ2HEqbX5YL80bHIBcNS2NKIHhl+4MxSktBC8XJigR4HXNO//5IRYdUH+UFcW7
 Dn3A==
X-Gm-Message-State: AOAM531ipG9tf2dQxlSaEKGGD5AasPXJdNmlPGRKk6h9PwZT5VOoBPso
 mB8B6TiN9pncFQ110mXzxheQeEeKC85o8Q1F3xxUoA==
X-Google-Smtp-Source: ABdhPJxsM7jAW1oadmeswlbX4oPRk/10htkJECvG874LJSzxK1K/2kWNDGKlitmnGQ+EzPcH7yK8waW5klIf9/ZmODc=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr1825334ejp.382.1613940556920; 
 Sun, 21 Feb 2021 12:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-8-f4bug@amsat.org>
In-Reply-To: <20210221200249.2536247-8-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:49:05 +0000
Message-ID: <CAFEAcA-2z7uVVyes4v76DvoG9ZjOzngZMt96obpNo9xAHKOzEQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hw/pci-host: Introduce SH_PCI Kconfig entry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We want to be able to use the 'SH4' config for architecture
> specific features. Add more fine-grained selection by adding
> a CONFIG_SH_PCI selector for the SH4 PCI controller.
> Move the file with the other PCI host devices in hw/pci-host
> and add its missing MAINTAINERS entries.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/{sh4 =3D> pci-host}/sh_pci.c | 0
>  MAINTAINERS                   | 1 +
>  hw/pci-host/meson.build       | 1 +
>  hw/sh4/Kconfig                | 1 +
>  hw/sh4/meson.build            | 1 -
>  5 files changed, 3 insertions(+), 1 deletion(-)
>  rename hw/{sh4 =3D> pci-host}/sh_pci.c (100%)

Don't we need a hw/pci-host/Kconfig change to add
the "config SH_PCI" section ?

thanks
-- PMM

