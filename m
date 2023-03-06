Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CE46AB74C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5fw-0000D9-6K; Mon, 06 Mar 2023 02:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZ5fo-0000CO-9p; Mon, 06 Mar 2023 02:54:20 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZ5fm-0004MD-EM; Mon, 06 Mar 2023 02:54:20 -0500
Received: by mail-lf1-x135.google.com with SMTP id bi9so11550934lfb.2;
 Sun, 05 Mar 2023 23:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678089252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzD6qMEyq8hZq2ESBnNL1thF2Z44BuYyiJq16XkZ6Tk=;
 b=p7tyabevdeB2xs9h1APL4adoHDI4rip/U2tsnF9Q1yMLdPUVdiGdLtMiF1EzpinLih
 q9FAh/J3juq/FilF1TuCXnNoW2bbnfOAX6FhvE8Y+QQRMTo0mWh/N5e8b1wUnkfbfFC9
 vEyfTffxrCD+mB8RiOlg2d/fcverwY4hafs1xfQ86APcwOCyJvMFp7a/y0HIHj2sPQLE
 MKJXKiWjZJkNo+dLrIOuVR5CJc1BnaKM+aTO0BgSnBUZuWLihdMHiE8Ri8iQzc6stceU
 U1J6Rgl1lgOkgglWEHSoz6HpwRcvTViDGQmnuHVm4qkPk9mGPeqbcdngpMaucV4a+Tfu
 +fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678089252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzD6qMEyq8hZq2ESBnNL1thF2Z44BuYyiJq16XkZ6Tk=;
 b=sH8sRGsfd+4m9sB3z9TY3tYf+ALXiSxZCvlihs+xP9ZJi4JxyEViUV6rHCTCTMja+/
 GtW+miIdVtO6QS0SHrqcONAt2C1aaFDSwHqASgEj/Q0zgqhDBC/A35yx4Itbxo6n1IqN
 mAUJchSUiIYsNQz0A/UULivB741B5lsn8v3/wgCGljqja3DcSH6i+L7bbE4yVZi40G0l
 2KUTEJhgSEzuz7vmaAJYKA7+bJHJ1fRMPMRhGZN6pwlIvtTZSNNwdErif+eq6c/KfQii
 4pJ3bHghVKuXhWNEeF86K7uGNRsTBS5vthP2mtT5uCR1aDf1Bm9RilMwZCfkv8LtcLpm
 dgtg==
X-Gm-Message-State: AO0yUKU0eeLKlFKcoydt3ZdG5DAmEQOCJabPI9Jh3xXkua34w8HICjhD
 nUFTavbwDDus3KbMjLynlfJCYpjpi8kDZfQEB0E=
X-Google-Smtp-Source: AK7set+M2CgklzYkGyQmAxpbO+3NxrsNOjhD7w4diz17Mj4kT8couFYtfRtg8IBItiUNkXmfGA4f5UCs7FMO3t7WGdk=
X-Received: by 2002:a19:7406:0:b0:4db:1ae1:318b with SMTP id
 v6-20020a197406000000b004db1ae1318bmr2855582lfe.5.1678089252551; Sun, 05 Mar
 2023 23:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-15-marcandre.lureau@redhat.com>
 <df7f2500-4f0a-91cb-961a-d2737ec66e78@linux.ibm.com>
In-Reply-To: <df7f2500-4f0a-91cb-961a-d2737ec66e78@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 6 Mar 2023 11:54:00 +0400
Message-ID: <CAJ+F1C+jZrdgzhv2DEs14KCaz_AQihrfGkpRnov5307N7S7pgg@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] win32: avoid mixing SOCKET and file descriptor
 space
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Fri, Mar 3, 2023 at 12:54 AM Stefan Berger <stefanb@linux.ibm.com> wrote=
:
>
>
>
> On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Until now, a win32 SOCKET handle is often cast to an int file
> > descriptor, as this is what other OS use for sockets. When necessary,
> > QEMU eventually queries whether it's a socket with the help of
> > fd_is_socket(). However, there is no guarantee of conflict between the
> > fd and SOCKET space. Such conflict would have surprising consequences,
> > we shouldn't mix them.
> >
> > Also, it is often forgotten that SOCKET must be closed with
> > closesocket(), and not close().
> >
> > Instead, let's make the win32 socket wrapper functions return and take =
a
> > file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
> > necessary. A bit of adaptation is necessary in io/ as well.
> >
> > Unfortunately, we can't drop closesocket() usage, despite
> > _open_osfhandle() documentation claiming transfer of ownership, testing
> > shows bad behaviour if you forget to call closesocket().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   include/sysemu/os-win32.h |   4 +-
> >   io/channel-watch.c        |   6 +-
> >   util/aio-win32.c          |   9 +-
> >   util/oslib-win32.c        | 219 ++++++++++++++++++++++++++++++++-----=
-
> >   4 files changed, 197 insertions(+), 41 deletions(-)
>
> >   #undef connect
> > @@ -308,7 +315,13 @@ int qemu_connect_wrap(int sockfd, const struct soc=
kaddr *addr,
> >                         socklen_t addrlen)
> >   {
> >       int ret;
> > -    ret =3D connect(sockfd, addr, addrlen);
> > +    SOCKET s =3D _get_osfhandle(sockfd);
> > +
> > +    if (s =3D=3D INVALID_SOCKET) {
> > +        return -1;
> > +    }
> > +
> > +    ret =3D connect(s, addr, addrlen);
>
>
> Previously you passed int sockfd and now you convert this sockfd to a SOC=
KET s and you can pass this as an alternative? Or was sockfd before this pa=
tch a SOCKET??

yes, sockfd was in fact a SOCKET.

Previous to this patch, a SOCKET is cast to int, as a fake fd, and
back to SOCKET as necessary. The whole point of this patch is to avoid
mixing SOCKET & fd space, instead a SOCKET is associated with a real
CRT fd.

thanks

--=20
Marc-Andr=C3=A9 Lureau

