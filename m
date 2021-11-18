Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BA3455DC4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:16:10 +0100 (CET)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mniCv-00018Q-EM
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:16:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mniBq-0000Rb-DY
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mniBm-0001Y8-5C
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637244897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBPFlFc/3T6JfMtasRGJFRCY/+yudPvrxOqVxUvgP3Q=;
 b=WNs6+JkyYtp639p2AO+FbvuVCb91Rf6AlX5ogwbsCWXmFI4y7u0QAdvuG7llYpojrJS/pG
 Ad0XCxKs91NzR61044xcBg3n8tfF2BQ76N39T8mDwn3F2xLPB7bwAS60Unahlq4SxBEJu3
 fzxVfI/Awxg0lXIcgOJTECJbQpgJY7k=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-cJ4pZoQIOTys9kQ6Vwz0yw-1; Thu, 18 Nov 2021 09:14:54 -0500
X-MC-Unique: cJ4pZoQIOTys9kQ6Vwz0yw-1
Received: by mail-pf1-f197.google.com with SMTP id
 w2-20020a627b02000000b0049fa951281fso3721325pfc.9
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RBPFlFc/3T6JfMtasRGJFRCY/+yudPvrxOqVxUvgP3Q=;
 b=sqI1bf5kcPyHlTYjdqF+TntQEjhvHqgrI2uwiLYj1WVX3WWtv0Wr2tI1DAPzYqlBlk
 wCyV1pdvTpzM7hpUA+ZHk5nmegapIcuYnqFVrAF907nYDSgmCAJXM3pJQ7TJi6WMAIsP
 CgTewqEubuWmt98gkH4FrxCeW1cNiI9jubi1yRjvDzK2rll9im/S21vrrRHLCIEG1TAp
 DEC1M34F5hnxqM9DVgojtH3IU2W5LAeQjaM7Xo0Gzpoe2comusQ2K6H/UiLmZ4iS477W
 oidNIy9v5flk04OMqLuixdGWAzba0b2AOYzDSQPggYHa2kIpTaPHjKX5q/NefkSvRHUn
 Oi3A==
X-Gm-Message-State: AOAM531iQdmQeoPg72kFs+L+h6jeE+fSXJq5vwb/+srcqkX5fvinM/jc
 P8+rAr1bRbV4AMHzmXHqa/8tBwiK3fJjQB9QulNEvo17RrVbWnGWlm6rJDWzgfLbcDy2Uw/LnNe
 if2z0jcGRXecyUujgQMe+Oua6IMce5MI=
X-Received: by 2002:a63:778c:: with SMTP id s134mr742476pgc.289.1637244892888; 
 Thu, 18 Nov 2021 06:14:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4z+KyUmutBUmqR3Nr3+Ee8zUj7Hg9V+vhDxi5UlKFpX09QRZVpfqyB1NFhLxPVvhWPbk0CkKti4FvgoVyIsA=
X-Received: by 2002:a63:778c:: with SMTP id s134mr742431pgc.289.1637244892467; 
 Thu, 18 Nov 2021 06:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20211115080312.64692-1-marcandre.lureau@redhat.com>
 <20211115080312.64692-2-marcandre.lureau@redhat.com>
 <87czmxwu8s.fsf@dusky.pond.sub.org>
In-Reply-To: <87czmxwu8s.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 18 Nov 2021 18:14:40 +0400
Message-ID: <CAMxuvazADhGLKeN2aV=RM6wtWEVp4Xw2NuGPzog4ht4YsZ_XTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] qemu-options: define -spice only #ifdef
 CONFIG_SPICE
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "P. Berrange,
 Daniel" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Nov 18, 2021 at 3:58 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Fixes:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1982600
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  softmmu/vl.c    | 2 ++
> >  qemu-options.hx | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index 1159a64bce4e..385465fbeb6d 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -3538,6 +3538,7 @@ void qemu_init(int argc, char **argv, char **envp=
)
> >              case QEMU_OPTION_readconfig:
> >                  qemu_read_config_file(optarg, qemu_parse_config_group,=
 &error_fatal);
> >                  break;
> > +#ifdef CONFIG_SPICE
> >              case QEMU_OPTION_spice:
> >                  olist =3D qemu_find_opts_err("spice", NULL);
> >                  if (!olist) {
>                        error_report("spice support is disabled");
>                        exit(1);
>                    }
>
> Is this error still reachable?

I wonder if module loading failed, it's non fatal and will report this erro=
r.

>
> > @@ -3550,6 +3551,7 @@ void qemu_init(int argc, char **argv, char **envp=
)
> >                  }
> >                  display_remote++;
> >                  break;
> > +#endif
> >              case QEMU_OPTION_writeconfig:
> >                  {
> >                      FILE *fp;
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 7749f59300b5..323913945a5d 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -2017,6 +2017,7 @@ SRST
> >      Enable SDL.
> >  ERST
> >
> > +#ifdef CONFIG_SPICE
> >  DEF("spice", HAS_ARG, QEMU_OPTION_spice,
> >      "-spice [port=3Dport][,tls-port=3Dsecured-port][,x509-dir=3D<dir>]=
\n"
> >      "       [,x509-key-file=3D<file>][,x509-key-password=3D<file>]\n"
> > @@ -2038,6 +2039,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
> >      "   enable spice\n"
> >      "   at least one of {port, tls-port} is mandatory\n",
> >      QEMU_ARCH_ALL)
> > +#endif
> >  SRST
> >  ``-spice option[,option[,...]]``
> >      Enable the spice remote desktop protocol. Valid options are
>


