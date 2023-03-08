Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF86AFF23
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 07:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZng3-0004Er-Kx; Wed, 08 Mar 2023 01:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZng0-0004EY-T1
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 01:53:28 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZnfy-0002UM-Lv
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 01:53:28 -0500
Received: by mail-lf1-x12c.google.com with SMTP id d36so16926497lfv.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 22:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678258404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXNaCd88QI+8ONHKJQ/SgSNO4n7lZ7JkAqfNL3XVBI8=;
 b=gk73HlbWvUSLIIzP8QQN+V+EQpAZ++o8wzyQw3R8jeOjcnlzNpzD0sr+7/0Q41Y3ZR
 PS98imRqsl5dV7iYBCv48NkbgMjs77Vi7C5uhQz5V+mLblQwtK4lZBRoxefe1g1+DCjg
 fts/7xqsRCj7hIpDGrcutERgIBEMiDKm32EjOswsVCcrtHnRXJpfPhg52qbbOrX8IBk/
 tM1GZEyAeAgc7tnYX+1wYSAwxvYzd3yRkpuPn8DoGLkOO90BQ4sYvgFE3QKcT9A9ZfJN
 6BLCo5BYTUNJQmFN+YNw0KE8AY3Umtpa7IHRTukIwIimd6R566m0gEIaP2JGyIP6EHIx
 519g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678258404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aXNaCd88QI+8ONHKJQ/SgSNO4n7lZ7JkAqfNL3XVBI8=;
 b=VFreGAkinqII5WniBfVfjhwzk71ai7brH0S1XXD1uU1gH3oieeczTNyQ1hgltR8GGG
 jR8YVnDXdKxgp4bgt0VZAByDcU1sew2hn3pCgH5q+8uOxIoDpcEzYTFTT3Sf9Pf7w67N
 0icg668GO0/T+aMCYTIIpYfKuFIWzap/Es4m9lGiY02ntpTh+KUe/W4KkFEyrIreG9e3
 R+SEPEDbTiMGtHnKxkSZC3SRiM6vT9GwPPhe4QUOxmVNZVMXi3u49vAt9VMiGO+/8c/k
 yWC8HmBsWtvMKRz5V2Hirff+RQO8gZTj3vc5H3a6PXnQXtP/m7KHadBVG/B/T2eYQnBL
 PJ6Q==
X-Gm-Message-State: AO0yUKUOFqtVnGh3g89VF2VFvrs+TYPFUcQ9BVBtkO+0tqNxBuxyfmeS
 vLBV0BVBEzpN7ga7w4QreobyfESKPt4RUA02O4g=
X-Google-Smtp-Source: AK7set/+cEpVz03sMZm6Pq+ZV/IAhVtRdbhJAyrhESkYervMspVv4J0eXav3k4l5vqg5C5sfFbF+8NUmRHA/+6jlIRg=
X-Received: by 2002:a19:7406:0:b0:4db:1ae1:318b with SMTP id
 v6-20020a197406000000b004db1ae1318bmr5133357lfe.5.1678258404483; Tue, 07 Mar
 2023 22:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-5-marcandre.lureau@redhat.com>
 <ZAdPHkheoRweyYzw@redhat.com>
In-Reply-To: <ZAdPHkheoRweyYzw@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 8 Mar 2023 10:53:13 +0400
Message-ID: <CAJ+F1CLjqGOWDFdW2=qKr3rocG7zOYG1nfYQsKXQNMiBhbML=Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] osdep: implement qemu_socketpair() for win32
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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

On Tue, Mar 7, 2023 at 6:50 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Mon, Mar 06, 2023 at 04:27:44PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Manually implement a socketpair() function, using UNIX sockets and
> > simple peer credential checking.
> >
> > QEMU doesn't make much use of socketpair, beside vhost-user which is no=
t
> > available for win32 at this point. However, I intend to use it for
> > writing some new portable tests.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/sockets.h |   2 -
> >  util/oslib-win32.c     | 110 +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 110 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> > index 2b0698a7c9..d935fd80da 100644
> > --- a/include/qemu/sockets.h
> > +++ b/include/qemu/sockets.h
> > @@ -15,7 +15,6 @@ int inet_aton(const char *cp, struct in_addr *ia);
> >  bool fd_is_socket(int fd);
> >  int qemu_socket(int domain, int type, int protocol);
> >
> > -#ifndef WIN32
> >  /**
> >   * qemu_socketpair:
> >   * @domain: specifies a communication domain, such as PF_UNIX
> > @@ -30,7 +29,6 @@ int qemu_socket(int domain, int type, int protocol);
> >   * Return 0 on success.
> >   */
> >  int qemu_socketpair(int domain, int type, int protocol, int sv[2]);
> > -#endif
> >
> >  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
> >  /*
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index 29a667ae3d..16f8a67f7e 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -310,6 +310,116 @@ bool qemu_socket_unselect(int sockfd, Error **err=
p)
> >      return qemu_socket_select(sockfd, NULL, 0, errp);
> >  }
> >
> > +int qemu_socketpair(int domain, int type, int protocol, int sv[2])
> > +{
> > +    struct sockaddr_un addr =3D {
> > +        0,
> > +    };
> > +    socklen_t socklen;
> > +    int listener =3D -1;
> > +    int client =3D -1;
> > +    int server =3D -1;
> > +    g_autofree char *path =3D NULL;
> > +    int tmpfd;
> > +    u_long arg;
> > +    int ret =3D -1;
> > +
> > +    g_return_val_if_fail(sv !=3D NULL, -1);
> > +
> > +    addr.sun_family =3D AF_UNIX;
> > +    socklen =3D sizeof(addr);
> > +
> > +    tmpfd =3D g_file_open_tmp(NULL, &path, NULL);
> > +    if (tmpfd =3D=3D -1 || !path) {
> > +        errno =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    close(tmpfd);
> > +
> > +    if (strlen(path) >=3D sizeof(addr.sun_path)) {
> > +        errno =3D EINVAL;
> > +        goto out;
> > +    }
> > +
> > +    strncpy(addr.sun_path, path, sizeof(addr.sun_path) - 1);
> > +
> > +    listener =3D socket(domain, type, protocol);
> > +    if (listener =3D=3D -1) {
> > +        goto out;
> > +    }
> > +
> > +    if (DeleteFile(path) =3D=3D 0 && GetLastError() !=3D ERROR_FILE_NO=
T_FOUND) {
> > +        errno =3D EACCES;
> > +        goto out;
> > +    }
> > +    g_clear_pointer(&path, g_free);
> > +
> > +    if (bind(listener, (struct sockaddr *)&addr, socklen) =3D=3D -1) {
> > +        goto out;
> > +    }
> > +
> > +    if (listen(listener, 1) =3D=3D -1) {
> > +        goto out;
> > +    }
> > +
> > +    client =3D socket(domain, type, protocol);
> > +    if (client =3D=3D -1) {
> > +        goto out;
> > +    }
> > +
> > +    arg =3D 1;
> > +    if (ioctlsocket(client, FIONBIO, &arg) !=3D NO_ERROR) {
> > +        goto out;
> > +    }
> > +
> > +    if (connect(client, (struct sockaddr *)&addr, socklen) =3D=3D -1 &=
&
> > +        WSAGetLastError() !=3D WSAEWOULDBLOCK) {
> > +        goto out;
> > +    }
> > +
> > +    server =3D accept(listener, NULL, NULL);
> > +    if (server =3D=3D -1) {
> > +        goto out;
> > +    }
>
> In theory at this point 'client' if connect() returned WSAEWOULDBLOCK,
> then at this point it should be fully connected. I wonder if that is
> actually guaranteed though, or should we do something to validate
> there's no race condition ?
>
> > +
> > +    arg =3D 0;
> > +    if (ioctlsocket(client, FIONBIO, &arg) !=3D NO_ERROR) {
> > +        goto out;
> > +    }
> > +
> > +    arg =3D 0;
> > +    if (ioctlsocket(client, SIO_AF_UNIX_GETPEERPID, &arg) !=3D NO_ERRO=
R) {
> > +        goto out;
> > +    }
>
> Maybe this will force a synchronization point ?

yeah, I guess switching back to sync and getting the peer pid,

I assume the unix socket pair to be ready at this point.

>
> Alteratively select() + getsockopt(SO_ERROR) is what we used to
> do to check for connect() completion (logic removed now but can
> be seen in b2587932582333197c88bf663785b19f441989d7)
>

That's hopefully not necessary.

thanks

>
>
> > +
> > +    if (arg !=3D GetCurrentProcessId()) {
> > +        errno =3D EPERM;
> > +        goto out;
> > +    }
> > +
> > +    sv[0] =3D server;
> > +    server =3D -1;
> > +    sv[1] =3D client;
> > +    client =3D -1;
> > +    ret =3D 0;
> > +
> > +out:
> > +    if (listener !=3D -1) {
> > +        close(listener);
> > +    }
> > +    if (client !=3D -1) {
> > +        close(client);
> > +    }
> > +    if (server !=3D -1) {
> > +        close(server);
> > +    }
> > +    if (path) {
> > +        DeleteFile(path);
> > +    }
> > +    return ret;
> > +}
> > +
> >  #undef connect
> >  int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
> >                        socklen_t addrlen)
> > --
> > 2.39.2
> >
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
>


--=20
Marc-Andr=C3=A9 Lureau

