Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD83321A24
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:22:13 +0100 (CET)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC6G-0008BP-4g
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEC4C-00076G-9s
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:20:04 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEC47-0002kP-Pd
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:20:03 -0500
Received: by mail-ej1-x636.google.com with SMTP id r17so3269000ejy.13
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3cwrLLT0Sx9k75ti66df7DS3UlSsbDApUDJDHCs2JTY=;
 b=V5VwBSKZE6lmk+tMck7o6JaCovm4/VrH0ZOChaO/PbwiOFp564GqEkxqbmntq08l5J
 olXmIoy9RrPPC+qWKGOxQBFMcw/MwNmwf0gNEtKBzEVMEcqnFeVni4EIysaj6skQrxPy
 HwGN3tZBU5NNIx6AcQim+1FoqWCZ2qfHIPFVOjVM3fawYQDm+vMQmmTW7sVEhP0ALUw1
 +S1opHAqFfRjosuxp5YMaYi9TQkCm7cx45G4N3zYMk8TqzYat/qXOvKyG2Pt+GzuxkAd
 5at8ox99mAyKmSBKUiBQ7bCPsoFxKmzBZoI2tUNu5bdMEiD9rIFxdpwYXeIeB7LTmCVt
 MD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3cwrLLT0Sx9k75ti66df7DS3UlSsbDApUDJDHCs2JTY=;
 b=a/CseY+kU+p0bNwms73Pmvx5nnINyik8iURB0jnroILxhSuJkB7LBH1/YXCcb2pl3o
 RTKB1yAudWrTMy+el2mwBOyoN0ja8TMlM9JXxWf6gs0bxrD/XHFXiEttPM2rqcyjuJvH
 99ki9vputNY5Z7tz22bNRUM+kjF5zuEgiUT7vEDl0XNGh7auknu+hqLCfy43LPSeXmW+
 PR5lIDyVlxZYbjlRfdhL9ZJsAFmHofECYT16QhCKE3i6i7ssYyGF5xsF/v4xEeOR7N+F
 7/QA8JmvHzygZ9ZxbQjikRBcODaoGx/WmH/GJIQ+Xb2CaCoNPJvKbiMZltpkQ88mzt4f
 B3+w==
X-Gm-Message-State: AOAM5307+cVlxRfAObsEFQjg4D134IsbWir/G/1nG92l7Pf8xHA5VGYQ
 bkQBEKJipcHZU/pOnqNFeC5ENAs5K+Omg1JdUpp1Dw==
X-Google-Smtp-Source: ABdhPJwGRfqzWnroS02Kl1/5JwUTc8Ui8Iemqh3OH0V0zMxdk6wgoaSE5X9441+U1GsU1Xx/YoeFKzfvdGvkIzlK2bw=
X-Received: by 2002:a17:906:ca58:: with SMTP id
 jx24mr18259995ejb.482.1614003569694; 
 Mon, 22 Feb 2021 06:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20210221215915.2568943-1-f4bug@amsat.org>
 <20210221215915.2568943-2-f4bug@amsat.org>
 <CAFEAcA8myJg96kdcMX+aQJm=ngPdW564=b46N=knFCO-dGkiYg@mail.gmail.com>
 <f243ee8c-39de-5b48-b329-9440594a3f2a@amsat.org>
In-Reply-To: <f243ee8c-39de-5b48-b329-9440594a3f2a@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 14:19:18 +0000
Message-ID: <CAFEAcA-dqQFR+J7+aAiT3Haajc=12xQq8kSxRHqqUzLwqbRTrA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] hw/sh4: Add missing license
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 at 14:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 2/22/21 2:55 PM, Peter Maydell wrote:
> > On Sun, 21 Feb 2021 at 21:59, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>
> >> This code was introduced in commit 27c7ca7e775,
> >> ("SHIX board emulation (Samuel Tardieu)"). Use
> >> the same license.

> > I thought it wasn't generally recommended to convert
> > a license text to a single SPDX line? The sh7750.c file
> > has a full 3-para license text.
>
> Yes you are right, sorry. I'll respin.

Also on the subject of sh4 code licenses, hw/sh4/sh7750_regs.h
has
 * The license and distribution terms for this file may be
 * found in the file LICENSE in this distribution or at
 *  http://www.rtems.com/license/LICENSE.
because it's borrowed from RTEMS.
(The license at the URL is gpl-2-or-later with a header exception).

Maybe we should expand the license in-place so we're not dependent
on a 3rd party website to stay up to tell us what the license
on the file is? In particular I assume the comment really
means "the file LICENSE in the rtems distribution"
https://git.rtems.org/rtems/tree/LICENSE (same text as web page)
and not the file LICENSE in QEMU, which is not the same thing,
so that part is actively misleading.

-- PMM

