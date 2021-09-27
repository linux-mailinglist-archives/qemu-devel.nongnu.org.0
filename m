Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF64191E7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:58:47 +0200 (CEST)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnPK-0002JE-S3
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnLh-0007ov-Mv
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:55:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUnLf-0005pR-Ny
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:55:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id g16so50762720wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 02:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jhw/SVDuUwd/aFiSKD2igaFIywXAwoWZZ37t7zIoWm0=;
 b=gmsglJ2oHZHlId005mxc7vcHYg6S6hldqL2bogvCPHEBhUdu3uEam2EANS/5Ln6i5H
 y+2IARo4sFgo2qkamqLbIggdDPFCwUz+MBOS+Rz1kM295DMUoP/QK96tEWDDlC3ahqod
 xC4cc8YjhS7hYv3wAYaEwMJJgYCS507DQqNxezS9ZRzcrwosE53jjNE5oiDRXpn+/ZXn
 4lDCjUFtZnUvEQE5siSO23HHVf0uVtpFu5jGjETYSncqLa5ZaQqkMpjALXANCpdCrRhz
 SjbgOIHfmJvqNphCRMJ64lI43iX66EjnoUuhf4Q/OY7XKuihz/TSWU5srW0XhVVSPHba
 aJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jhw/SVDuUwd/aFiSKD2igaFIywXAwoWZZ37t7zIoWm0=;
 b=0lGZWFeIczVSQ7B1Z/29RFVyaCnqJk4sVkbECP+2z/nBYTDZ7mV1ajtH1uxL3LzZ6l
 BDGX+g/ZTtcOooCDCXmQycpCevQjDZYPRUXsjrkM8/v6hk34PHjQYa6M+XF9gpt8va+S
 I1u+1OLynEn27ZbS8J9h6Zzd0XAZHyXlHrSS7QKnJ76X8Z+cN/2KEieEDxl5jyzWEgru
 OixFIc7MJMIWBv0iOz/pHxP7WIgiPrmkpaumefAz1YR91WMGqKxc1S+DjE7fdxJgXQki
 b657AjOEL04FJYaX4+k3/lSYDzbHuGNDqhSimkPGAregH+UZRG9TgYxEta//JQyeb1Ui
 Lj7w==
X-Gm-Message-State: AOAM533ZLJ5t/PVu82ZzSvV5it20UmlCmPYYyeAMv27HV+36zdDPdU8k
 rweXMFSVpzOmZK/6eCT9PAoNPqUl8eIfP/LOQJhrmg==
X-Google-Smtp-Source: ABdhPJyFkhD+x0oFNbwhQuU5NTd917l/eEfev2dH3pM2XFO8bRf6LZ+NaKqjF/xS8tXmHlAn4Agz2fk8rqeaqCWrrHE=
X-Received: by 2002:adf:f185:: with SMTP id h5mr27448151wro.302.1632736495977; 
 Mon, 27 Sep 2021 02:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
 <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
In-Reply-To: <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 10:54:02 +0100
Message-ID: <CAFEAcA-+VJgRJjBCaVQak0kq4ruku64riNOESFAse3+ZJdWq0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 10:40, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On Mon, Sep 27, 2021 at 11:15 AM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
> > On Sun, 26 Sept 2021 at 23:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> > > Reported-by: Warner Losh <imp@bsdimp.com>
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >  bsd-user/meson.build | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> > > index 03695493408..a7607e1c884 100644
> > > --- a/bsd-user/meson.build
> > > +++ b/bsd-user/meson.build
> > > @@ -1,3 +1,7 @@
> > > +if not config_host.has_key('CONFIG_BSD')
> > > +  subdir_done()
> > > +endif
> > > +
> > >  bsd_user_ss.add(files(
> > >    'bsdload.c',
> > >    'elfload.c',
> >
> >
> > So, what's the reason for this change?
>
> https://lore.kernel.org/qemu-devel/CANCZdfprC16ezJQCWJmYEApX6eym9nxSOqAtB=
AGr+cziS4r2qw@mail.gmail.com/
>
> linux-user/meson.build is evaluated on bsd, and bsd-user/meson.build on L=
inux.

True, but "meson.build is evaluated but just does nothing or
adds files to a sourceset that isn't used" is pretty common
(hw/pci/meson.build is evaluated even if we're not building
a system with PCI support, for example). If there's a reason
why bsd-user and linux-user are special we should explain it,
I think.

thanks
-- PMM

