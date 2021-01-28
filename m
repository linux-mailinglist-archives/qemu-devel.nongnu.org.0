Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AB30782B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:36:53 +0100 (CET)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58Pk-00043I-KI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l58Os-0003ap-HJ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:35:58 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l58On-0005Lk-9x
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:35:58 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r12so8072465ejb.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xsRIlucWUb5TPL5OXmVQJ2hw4nmPVPeMlUvFG0l7Gic=;
 b=gJaa/7UtW5sfreStZPlHF7QRJqYf9lC0yrwknlDqqsxPjtA8JS5sQp315//Lf6e3NX
 7q4cZ0cFFGEpDOnCJsRmc30aUOgbL8pLXAwg+1uREwwOz09i98cONZ3G1FxHP8A7R+4a
 m7lBAi9EYIeqQ4bY3l4P6dy/2HIehY3I5uMTEZKzF2/TzaH6eV7VvaQ5KOt5jozXPd0z
 lV6X37MIxHx7ZAy8BaveB+jU3qxi9KvIzTuyPROvUUYdfrLiUNwGBoO5hQYd+UHLB8mD
 I7YEhaGT2Y64v+WPVdIg5FcwC1RS3jx04kMMdTbrEL1/sq8Dcpw5MPdzvGoTNSaRZ8+z
 8hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xsRIlucWUb5TPL5OXmVQJ2hw4nmPVPeMlUvFG0l7Gic=;
 b=uQXIpYMW/PKR4nqVyMNV++9FlrgIxtBkjStgYLU5WtZGHS0Ax3b4onfv9yDcw5ul8F
 yTySOrmbwOOpfa2akpGjUqYHNfV2gictOjtPsLwIQsgbgYJ3JLpIZ0mqJImxo0uaGdqe
 Z8t+hOzH8l4ZpfhIq2pL+5Pnp/umL4KWVsUmA7ahX5ktsv4f56n9hwt5rLO3lEg1DYv/
 8rFcYymIRJ3otUi4DfB6nxQ2oNw14kU6D7PY14xN51RGYUPcqmRGJ1DpUF4Y6v7dmqTC
 fz+sb6CTqM6TnZqERMe98N6iTmDJirAAnRVHczZvUOWqvKtcx2GRnBt5KIW6Gou5OwjD
 mDVg==
X-Gm-Message-State: AOAM533ZrK0az1QdaJq/EYIAuBIluUvFK0rEEOqMvcGU/MI1EJ03WCaL
 jWgGRNHeD47JqJf0Da2S68DDVAcVE/KIV7Fvsak=
X-Google-Smtp-Source: ABdhPJzn9VpM+82r7H1RxVZjD/iV8BVLlMxs5gcBwEKcqFcARf2bmnvAeDGjq69Oyj6vXtKtaX/kYIoBvVweJ+g00Tk=
X-Received: by 2002:a17:906:4d8f:: with SMTP id
 s15mr11454951eju.389.1611844551544; 
 Thu, 28 Jan 2021 06:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
 <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
 <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
 <20210128142625.vzdrehzw6mufja3s@sirius.home.kraxel.org>
In-Reply-To: <20210128142625.vzdrehzw6mufja3s@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jan 2021 18:35:39 +0400
Message-ID: <CAJ+F1CJ0Z378KCLGDzLYOfBor7HkHM2YemRj5F-3kTSnVK7ADg@mail.gmail.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Jan 28, 2021 at 6:28 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Jan 28, 2021 at 04:00:20PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Jan 28, 2021 at 3:57 PM Marc-Andr=C3=A9 Lureau <
> > marcandre.lureau@redhat.com> wrote:
> >
> > > Hi
> > >
> > > On Thu, Jan 28, 2021 at 3:44 PM Gerd Hoffmann <kraxel@redhat.com> wro=
te:
> > >
> > >>   Hi,
> > >>
> > >> > diff --git a/ui/spice-display.c b/ui/spice-display.c
> > >> > index 0178d5766d..3d3e3bcb22 100644
> > >> > --- a/ui/spice-display.c
> > >> > +++ b/ui/spice-display.c
> > >> > @@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)
> > >> >          }
> > >> >          qemu_spice_display_init_one(con);
> > >> >      }
> > >>
> > >>        if (runstate_is_running()) {
> > >>             qemu_spice_display_start();
> > >>        }
> > >>
> > >> Isn't that enough?
> > >>
> > >
> > > That should be fine too, I'll update the patch. thanks
> > >
> >
> > Actually no, we still need to prevent the initial
> > qemu_spice_display_start(), and do a single call when everything is rea=
dy
> > (since spice server doesn't handle adding interfaces dynamically when
> > running).
>
> I still think that moving these three lines to the correct place is
> enough.  Maybe even just qemu_spice_display_start() as it keeps track
> of the state and you can safely call this twice.
>

It's not enough, since the first time qemu_spice_display_start() is
called (on vm_start) the display interfaces aren't yet registered. And
spice server doesn't automatically start the newly added interfaces.



--=20
Marc-Andr=C3=A9 Lureau

