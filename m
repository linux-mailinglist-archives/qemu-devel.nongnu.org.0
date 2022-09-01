Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848F45A988A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:27:16 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkDz-0000O7-IX
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oTk6j-0007X1-35
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oTk6e-0002bG-Tg
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662038380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0e8f+qiPRUOK/swEWKzHLgB33P7LGG1gLUcykEWXANI=;
 b=gh3BKB4AUXGmA+36onSRb/bRG93xjjeg8HrWArBAeaSFbcGI19jgK83yhHzqiioJ0V24lU
 Eim0iwe4XuGthjW4QxcaCZbDCkjsIXd0r2vi+RX4j3//e8RBKn3FrQbpGs6Osj3kEkYfc8
 S018p9366BL+DqUikDc71YxaJe44bMk=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-DPIGSoTDPXOU047BsujOPg-1; Thu, 01 Sep 2022 09:19:38 -0400
X-MC-Unique: DPIGSoTDPXOU047BsujOPg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-11eadf59e50so4943786fac.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 06:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0e8f+qiPRUOK/swEWKzHLgB33P7LGG1gLUcykEWXANI=;
 b=NwDPsyJZNRUnBrmlQQLyQQx3jGeZOZafqg4XCQZ0VpNX0Q2DYbCIFD8/iaFH4s/xfW
 V03YWI6K5U/gk5e38hsEDXBWJDau9ieG/L1KiDAQd1cClIVqvwxKu4FOevjPfDxXNyXv
 UW0Wh0B+rH94LV54EePLsXt3O0xyNjXhuIP1YpJwzZtiSU1DrIwdbjR00SV5vnMTUtl+
 iecbtdv7cTih+uHajKWkWgRngSfYRaRVrTMazCDbQ/HpuTwtGitgO3oddkoHwOEd5kGK
 H278yVkGmWY2C82NuFdPi4M1zdIAB9xA0EG+WsB7xFSPzUcaVAbfHWnD3z/a+gyq3XL6
 HboQ==
X-Gm-Message-State: ACgBeo0DsrPlvecmbANnX8aXWc+x8wJNEvSoA7kEdhN9rqSSgUl+8P5F
 eB2pbedevDXMK1BythalVcPdxfCMGCVAic3w1eDAyYIeJD3RCOX5JPHnbqF1ALTUzFC6bdXhj09
 MBz9eG7M62RBmCh5C80lSLzbfIzOlHYs=
X-Received: by 2002:a05:6870:2113:b0:122:6e63:e59a with SMTP id
 f19-20020a056870211300b001226e63e59amr899409oae.53.1662038378090; 
 Thu, 01 Sep 2022 06:19:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4SA7B17/wOaQUWgypJGgttpYMB/d9icZmHdnUJk1rOi1+8goXWBJmF+y2aRETEyDh7A6hXgkFP0A+crVG47GA=
X-Received: by 2002:a05:6870:2113:b0:122:6e63:e59a with SMTP id
 f19-20020a056870211300b001226e63e59amr899396oae.53.1662038377888; Thu, 01 Sep
 2022 06:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220901111553.2901487-1-marcandre.lureau@redhat.com>
 <YxCs7A/XmaGyGsJ+@redhat.com>
In-Reply-To: <YxCs7A/XmaGyGsJ+@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 1 Sep 2022 17:19:26 +0400
Message-ID: <CAMxuvayahS3RmEyY2=eYQ9PrGcJfcQAwDacJjJM0ERS=biASLA@mail.gmail.com>
Subject: Re: [PATCH] io/command: implement portable spawn
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Sep 1, 2022 at 5:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Sep 01, 2022 at 03:15:53PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Using GLib spawn API is both simpler and portable.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  io/channel-command.c | 115 ++++++++-----------------------------------
> >  1 file changed, 21 insertions(+), 94 deletions(-)
>
> > +    ioc =3D qio_channel_command_new_pid(stdinfd,
> > +                                      stdoutfd,
> > +#ifdef _WIN32
> > +                                      GetProcessId(pid)
> > +#else
> > +                                      pid
> > +#endif
> > +        );
>
> THe pid parameter is declared as 'pid_t' but GetProcessId returns
> DWORD - are those types guaranteed compatible.

I think pid_t is mingw specific, and is defined as int64.

(windows crt uses int, apparently)

>
> Also the pid passed into qio_channel_command_new_pid is used
> by qio_channel_command_close/abort, to kill off the process,
> but this code is stubbed out in WIN32 and this patch hasn't
> provided an impl.

ok, I'll update the patch and actually test it on win32 too ;)

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


