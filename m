Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F46D5F2370
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 15:51:09 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oezN4-0006nq-2A
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 09:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oezLt-00054v-5C
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 09:49:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oezLo-00008R-FW
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 09:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664718586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FpKqC49jB3dmZAiK1OQzQ0PpZa/27KRog+nRo4UibY=;
 b=FIerdbq4CJCPnNzuKLlYfqshGBUFbChp2o6/tESxPJXQb3/qKfRnKS2GemlBgB4gfzACnP
 zEA0DZ08R1kAayZI5hoKpS0zCQFSIcpbWlt9b12fdU97HUJoKCG41/WpRWBsAfp25RQqeK
 nAR+WKouNg3HytJr7Vn/1vtVdE1mGH4=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-1uO5pZzoO0GoXG6xH1YQrg-1; Sun, 02 Oct 2022 09:49:44 -0400
X-MC-Unique: 1uO5pZzoO0GoXG6xH1YQrg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-13193fb45b9so5461896fac.1
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 06:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9FpKqC49jB3dmZAiK1OQzQ0PpZa/27KRog+nRo4UibY=;
 b=P0IVIxaWEpNNb+NyPQhL+AK3vDymEqU2hrfhqwLEGNuVuSyCxXXrAqnxILXReRCQ6b
 Kgsga4oe3Q1gZUcy5gcaeZaPNV/0maXhulb4Tb2cd/xqPpBuqvfz3NO902/LbeSIkeCO
 vvjXrKn0oGoapwVl2vUYgjFxvc0X9TmM+5PzxHAdVrBzFR5vpL8Jpm0+nQeHusQnCqvv
 eQRzbuLkpYQnuz3qfvJzTJYTV2LZvNMCWm+WA2iUFRDlIX1uejgp+bD+kOykrXHyuHtQ
 1nWNbijc9dZQ4pqRwIuZasZRdNifisVzklYKLPGk8NvseSPq7hD1/1QhG21ntEqZxIhk
 1f0Q==
X-Gm-Message-State: ACrzQf3Fqc1p+7c+wvEtmW0Sk67cFOIc5V2IUJa6aQonaT2wXBRg2Noc
 RmCCYJDx1O9CEuGf2MhfXzUbGS5TbYf0ijcWko0N4Q2Oe6PRU41EjqR3VriQkLB8d2qK4uxd5W2
 HK+AJO7jyoPJTTxNtGO3D4t91jc0jhws=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr2577846oib.205.1664718584186; 
 Sun, 02 Oct 2022 06:49:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Qcdno2Pab+UEwaR/FbKz6aAg4RBgHNvmG3OHo/3NXpfqQJDDbVxsHqxR3+6e1suwo/GU3gU4dW5ARH7JFP1w=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr2577840oib.205.1664718583925; Sun, 02
 Oct 2022 06:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220929163237.1417215-1-marcandre.lureau@redhat.com>
 <2973900.g0HVWOepMQ@silver>
In-Reply-To: <2973900.g0HVWOepMQ@silver>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 2 Oct 2022 17:49:32 +0400
Message-ID: <CAMxuvawttTSHMwzaUYpmKNCh8fauR1xCgEhaQD3C2GJDKFyZ5Q@mail.gmail.com>
Subject: Re: [PATCH] net: print a more actionable error when slirp is not found
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, jb-gnumlists@wisemo.com, thuth@redhat.com, 
 jasowang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Sep 30, 2022 at 11:49 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Donnerstag, 29. September 2022 18:32:37 CEST Marc-Andr=C3=A9 Lureau wr=
ote:
> > From: Marc-Andr=C3=83=C2=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > If slirp is not found during compile-time, and not manually disabled,
> > print a friendly error message, as suggested in the "If your networking
> > is failing after updating to the latest git version of QEMU..." thread
> > by various people.
> >
> > Signed-off-by: Marc-Andr=C3=83=C2=A9 Lureau <marcandre.lureau@redhat.co=
m>
> > ---
> >  meson.build |  4 ++++
> >  net/net.c   | 19 +++++++++++++++++--
> >  2 files changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 8dc661363f..4f69d7d0b4 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -657,6 +657,10 @@ if not get_option('slirp').auto() or have_system
> >    endif
> >  endif
> >
> > +if get_option('slirp').disabled()
> > +  config_host_data.set('CONFIG_SLIRP_DISABLED', true)
> > +endif
> > +
> >  vde =3D not_found
> >  if not get_option('vde').auto() or have_system or have_tools
> >    vde =3D cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
> > diff --git a/net/net.c b/net/net.c
> > index 2db160e063..e6072a5ddd 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -990,14 +990,29 @@ static int net_init_nic(const Netdev *netdev, con=
st
> > char *name, return idx;
> >  }
> >
> > +#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
> > +static int net_init_user(const Netdev *netdev, const char *name,
> > +                         NetClientState *peer, Error **errp)
> > +{
> > +#ifdef CONFIG_SLIRP
> > +    return net_init_slirp(netdev, name, peer, errp);
> > +#else
> > +    error_setg(errp,
> > +               "Type 'user' is not a supported netdev backend by this =
QEMU
> > build " +               "because the libslirp development files were no=
t
> > found during build " +               "of QEMU.");
> > +#endif
> > +    return -1;
> > +}
> > +#endif
>
> I just tried this, but somehow it is not working for me. net_init_user() =
is
> never called and therefore I don't get the error message. That should be
> working if the user launched QEMU without any networking arg, right?
>

That's because vl.c has:
if (default_net) {
...
#ifdef CONFIG_SLIRP
        qemu_opts_parse(net, "user", true, &error_abort);
#endif

Iow, it doesn't try to use slirp by default if it's not found at
compile time. We can eventually change that, but that might break
existing users who don't build with slirp.

Alternatively, it could error out only if slirp was not explicitly
disabled at configure time.

> And still, I would find it better if there was also a clear build-time er=
ror
> if there was no libslirp and slirp feature was not explicitly disabled.

That's not the typical way we deal with dependencies, but I can try to
do that as well.

>
> >
> >  static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
> >      const Netdev *netdev,
> >      const char *name,
> >      NetClientState *peer, Error **errp) =3D {
> >          [NET_CLIENT_DRIVER_NIC]       =3D net_init_nic,
> > -#ifdef CONFIG_SLIRP
> > -        [NET_CLIENT_DRIVER_USER]      =3D net_init_slirp,
> > +#if (defined(CONFIG_SLIRP) || !defined(CONFIG_SLIRP_DISABLED))
> > +        [NET_CLIENT_DRIVER_USER]      =3D net_init_user,
> >  #endif
> >          [NET_CLIENT_DRIVER_TAP]       =3D net_init_tap,
> >          [NET_CLIENT_DRIVER_SOCKET]    =3D net_init_socket,
>
>
>
>


