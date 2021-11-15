Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763C450A41
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:55:43 +0100 (CET)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfGg-0000wj-Lr
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:55:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmf46-00040B-Tu
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:42:43 -0500
Received: from [2a00:1450:4864:20::431] (port=35462
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmf44-000619-NN
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:42:42 -0500
Received: by mail-wr1-x431.google.com with SMTP id i5so31992867wrb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=12DpytWwjDVn6vQ4CTNZbM0o9T6fzPDHcaSd+k2vdC0=;
 b=J8WhDUUIwPp9A2Vr88zkazXrHcPwGDtYx/sbGn+qhYlW6ODWkW5ViEfVWG1oGpXnhf
 IasTAVie+9uCZkIUTbENrFcIEXPBgKIyHu4T1jMGdkZy5FEq0zcQYYWUthJs5dqc4SYJ
 wvlORELXL+x6JiqlaGDDt+pMTHd63cTp0QcmRn971EypHuK60r+4+PeexM2eEOferRsM
 Ft9VKkMgtP+UjpgA8Bl00xKZwNf1z/G132xVwGKjiTy9Mnew2r1NAqIhk1V+d0LTthni
 RiJAYatgzW9Rb92ZKC3M1oe7A5R+w9+6ArFbm9dbM8QmNweevwu9iAGZ+pK9TEH5tsmF
 c5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=12DpytWwjDVn6vQ4CTNZbM0o9T6fzPDHcaSd+k2vdC0=;
 b=CWmSj7FILmY4rtTpkrpy/AMZ+GAfh9u8VPfhI1KwkdecHlrxkh5uQZ0vUtaXyU77Rt
 IwOp7zdBzZEln+GHZrQf0TPontI3TjmUYrlG/Cl8V/svfxaRte3sIwM3yX9/q+eVC9GJ
 OtTX+3v0bnbu+zjqnbZ2ZkyJxr2eJZTs3Fk6/KEe9ODPR4BZwj99KUYYXx0IjTWiybcr
 v4CJifP3q43GC0srLZGunilIIdFsKvkQcohHuT7Xq7tDqcBijYtbE//K2APeemTVRKXw
 pSWwYhZyF9uofHZ92AUesyno/ymgIGrEv1/WJ6DW3OXQLeys5jgMuUIGpP/z/9krGhWk
 N8+A==
X-Gm-Message-State: AOAM533ibJgxNaKQtjMcGIUO/vYCtw9hvjkD7aNFJ7fFH90cFXf8l9oo
 ib6qctOseebTe/pYMuzQmo1e6qGXiU2KBpuDly6T6Q==
X-Google-Smtp-Source: ABdhPJyq2c2YUai22i/Rk7kRKE2wsCmYmtXhQwrM7Re6IVClxMvvjSHCL2jh3YDaeXj4wL+EmcvDnEkz+ozMeOQ/Jho=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr448610wri.376.1636994558519; 
 Mon, 15 Nov 2021 08:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20211014162938.430211-1-pbonzini@redhat.com>
 <20211014162938.430211-22-pbonzini@redhat.com>
 <CAFEAcA8dxLqx4uXGRmhdWmP2aRXChk6gqO3t_RY54UVMHPEjWQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8dxLqx4uXGRmhdWmP2aRXChk6gqO3t_RY54UVMHPEjWQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 16:42:27 +0000
Message-ID: <CAFEAcA9HoX9riUjU_N6erkLu0r5gRawDTKSJgwjNb+2Mcn+0=g@mail.gmail.com>
Subject: Re: [PULL 21/26] configure, meson: move more compiler checks to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 16:36, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 14 Oct 2021 at 17:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Message-Id: <20211007130829.632254-15-pbonzini@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  configure        | 91 ------------------------------------------------
> >  meson.build      | 44 +++++++++++++++++++++++
> >  util/meson.build |  4 ++-
> >  3 files changed, 47 insertions(+), 92 deletions(-)
>
>
> > diff --git a/meson.build b/meson.build
> > index 6bf43e6d30..6b7487b725 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1550,6 +1550,8 @@ config_host_data.set('CONFIG_INOTIFY',
> >                       cc.has_header_symbol('sys/inotify.h', 'inotify_in=
it'))
> >  config_host_data.set('CONFIG_INOTIFY1',
> >                       cc.has_header_symbol('sys/inotify.h', 'inotify_in=
it1'))
> > +config_host_data.set('CONFIG_IOVEC',
> > +                     cc.has_header_symbol('sys/uio.h', 'struct iovec')=
)
> >  config_host_data.set('CONFIG_MACHINE_BSWAP_H',
> >                       cc.has_header_symbol('machine/bswap.h', 'bswap32'=
,
> >                                            prefix: '''#include <sys/end=
ian.h>
>
> Hi -- I've just noticed that this change breaks compilation for me,
> because this test incorrectly fails to set CONFIG_IOVEC on a system
> where the header defines 'struct iovec'. This seems to be because
> "struct iovec" isn't a valid thing to test with has_header_symbol,
> because it provokes a compiler error from clang.

https://github.com/mesonbuild/meson/issues/1975 says that for gcc
it's actually going to be wrong the other way (always setting CONFIG_IOVEC
whether the system header has the struct or not), because "struct wombat;"
is syntactically OK as a *declaration*, not a use.

Maybe we can work around this by testing for the presence of something else=
,
eg IOV_MAX or the readv or writev functions ?

-- PMM

