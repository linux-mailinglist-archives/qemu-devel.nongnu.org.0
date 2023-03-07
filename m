Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790A86ADECC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWUI-0006Hc-Oz; Tue, 07 Mar 2023 07:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZWUF-0006Gi-VD
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:32:12 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZWUE-0001Sa-4d
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:32:11 -0500
Received: by mail-lf1-x136.google.com with SMTP id f18so16860977lfa.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678192327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHCl1SyfScu4m03cx6vP9ZH4N2i/irpvn56oGmK4udE=;
 b=eo1HzOf1eD5lUmRRYX/nLrjmjlFIqjDQZCCR+j1DK+BZzLH1p6J8SqVRFtJJlSgcoQ
 TzTQbBrfWTxo4LU4ouhWKSdxVV7KWQWl8s4/k09J0v8bf6mgzNSP/Xu/4yA0QQeRxr2m
 WMCTGVcGXQaMLB3HUOiiLtyt3xw+NLwKjHyb1ghMGjyXQwmS7pWUDORBIGTwxnEf3UV9
 Qv/zjboP4G6WYqNe7gmSdRWPI2FnbFgQaQoj0+saQ5NEzNYN8I1kQyhFerBzFFTroKEz
 pvlU+ahNUhTW5HWm/VwuNV2GxvM4L0yrvSgvCXApegsWJbDXSQsTPGyfr9uk7+sviYT1
 1dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678192327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qHCl1SyfScu4m03cx6vP9ZH4N2i/irpvn56oGmK4udE=;
 b=dQxdBqLrPHLA0QRLSXx5zzqmThZvYwvBuKi9PT///pZcbdHQRaOZPiSBWKqNz6xtUV
 83Qk1dINFNZMfE7Y167BXl5GUt873bYVIdbpD1gtqrv0Bw8l3z2JPSwiKCXSa9quRXVQ
 2fQ9UJPCGYGFfjtEuH2Qhn/Ia0G3iYwJfeah5yuUf/hrPQoM04YHBUuk4wP9udtyafGC
 3Iy9/jZ5ZHnGa0pWy3FtNSUWLRGJZz1XS7xE4m2Xv7E3e1oMQfTkuzcpBcIKIOVe0QtM
 12L34zz5eMXtyO8Cc+XEb2dbDzerGm1TwfpTjL32yf2gNHtNYTFR1IxnQD8A29EytJ/e
 XL3Q==
X-Gm-Message-State: AO0yUKWf0YsbQthHPp+/oQlUOY1fUXYOLrZOeOBokjwI1afb//PAVLXP
 +CGVX02OZ+bY8UYv9eb95WnNCYYjeQWvlC0HX0I=
X-Google-Smtp-Source: AK7set9IZuG2zCacNdHFnPGr0Kj4FA3ae5Qt8OGMj2Pese8Y7iINpQlHSXAeqFk7WBfnmh+8ve/Cz4dSymm5kGOCU3A=
X-Received: by 2002:ac2:4c2e:0:b0:4dd:a025:d8c with SMTP id
 u14-20020ac24c2e000000b004dda0250d8cmr4480281lfq.5.1678192327381; Tue, 07 Mar
 2023 04:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-9-marcandre.lureau@redhat.com>
 <871qm1j2zc.fsf@pond.sub.org>
In-Reply-To: <871qm1j2zc.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 7 Mar 2023 16:31:55 +0400
Message-ID: <CAJ+F1CJJYZcTXU7WsxufzSH2iW_-9wiK4VQjK1Qi5yx2b082UA@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] qmp: add 'get-win32-socket'
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

On Mon, Mar 6, 2023 at 7:49 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > A process with enough capabilities can duplicate a socket to QEMU. Add =
a
> > QMP command to import it and add it to the monitor fd list, so it can b=
e
> > later used by other commands.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qapi/misc.json | 30 ++++++++++++++++++++
> >  monitor/fds.c  | 76 +++++++++++++++++++++++++++++++++++++++-----------
> >  2 files changed, 90 insertions(+), 16 deletions(-)
> >
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index f0217cfba0..031c94050c 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -275,6 +275,36 @@
> >  ##
> >  { 'command': 'getfd', 'data': {'fdname': 'str'} }
> >
> > +##
> > +# @get-win32-socket:
> > +#
> > +# Add a socket that was duplicated to QEMU process with WSADuplicateSo=
cketW()
> > +# via WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name (=
the SOCKET
> > +# is associated with a CRT file descriptor)
>
> Long line.
>

Ok.. see related .editorconfig patch to make everyone's life easier.

> > +#
> > +# @info: the WSAPROTOCOL_INFOW structure (encoded in base64)
> > +#
> > +# @fdname: file descriptor name
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 8.0
> > +#
> > +# Notes: If @fdname already exists, the file descriptor assigned to
> > +#        it will be closed and replaced by the received file
> > +#        descriptor.
> > +#
> > +#        The 'closefd' command can be used to explicitly close the
> > +#        file descriptor when it is no longer needed.
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "get-win32-socket", "arguments": { "info": "abcd123.=
.", fdname": "skclient" } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'get-win32-socket', 'data': {'info': 'str', 'fdname': 'st=
r'}, 'if': 'CONFIG_WIN32' }
> > +
> >  ##
> >  # @closefd:
> >  #
> > diff --git a/monitor/fds.c b/monitor/fds.c
> > index 7daf1064e1..9ed4197358 100644
> > --- a/monitor/fds.c
> > +++ b/monitor/fds.c
> > @@ -61,46 +61,55 @@ struct MonFdset {
> >  static QemuMutex mon_fdsets_lock;
> >  static QLIST_HEAD(, MonFdset) mon_fdsets;
> >
> > -void qmp_getfd(const char *fdname, Error **errp)
> > +static bool monitor_add_fd(Monitor *mon, int fd, const char *fdname, E=
rror **errp)
> >  {
> > -    Monitor *cur_mon =3D monitor_cur();
> >      mon_fd_t *monfd;
> > -    int fd, tmp_fd;
> > -
> > -    fd =3D qemu_chr_fe_get_msgfd(&cur_mon->chr);
> > -    if (fd =3D=3D -1) {
> > -        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS")=
;
> > -        return;
> > -    }
> >
> >      if (qemu_isdigit(fdname[0])) {
> >          close(fd);
> >          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdname",
> >                     "a name not starting with a digit");
> > -        return;
> > +        return false;
> >      }
> >
> >      /* See close() call below. */
> > -    qemu_mutex_lock(&cur_mon->mon_lock);
> > -    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
> > +    qemu_mutex_lock(&mon->mon_lock);
> > +    QLIST_FOREACH(monfd, &mon->fds, next) {
> > +        int tmp_fd;
> > +
> >          if (strcmp(monfd->name, fdname) !=3D 0) {
> >              continue;
> >          }
> >
> >          tmp_fd =3D monfd->fd;
> >          monfd->fd =3D fd;
> > -        qemu_mutex_unlock(&cur_mon->mon_lock);
> > +        qemu_mutex_unlock(&mon->mon_lock);
> >          /* Make sure close() is outside critical section */
> >          close(tmp_fd);
> > -        return;
> > +        return true;
> >      }
>
> Have you considered factoring out the loop searching ->fds?

Not really, it doesn't look trivial at first sight because they do
different things.

>
> >
> >      monfd =3D g_new0(mon_fd_t, 1);
> >      monfd->name =3D g_strdup(fdname);
> >      monfd->fd =3D fd;
> >
> > -    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> > -    qemu_mutex_unlock(&cur_mon->mon_lock);
> > +    QLIST_INSERT_HEAD(&mon->fds, monfd, next);
> > +    qemu_mutex_unlock(&mon->mon_lock);
> > +    return true;
> > +}
> > +
> > +void qmp_getfd(const char *fdname, Error **errp)
> > +{
> > +    Monitor *cur_mon =3D monitor_cur();
> > +    int fd;
> > +
> > +    fd =3D qemu_chr_fe_get_msgfd(&cur_mon->chr);
> > +    if (fd =3D=3D -1) {
> > +        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS")=
;
> > +        return;
> > +    }
> > +
> > +    monitor_add_fd(cur_mon, fd, fdname, errp);
> >  }
> >
> >  void qmp_closefd(const char *fdname, Error **errp)
> > @@ -214,6 +223,41 @@ error:
> >      return NULL;
> >  }
>
> With the doc comment tidied up:
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
> The remainder is greek to me :)

ok, thanks

>
> >
> > +#ifdef WIN32
> > +void qmp_get_win32_socket(const char *infos, const char *fdname, Error=
 **errp)
> > +{
> > +    g_autofree WSAPROTOCOL_INFOW *info =3D NULL;
> > +    gsize len;
> > +    SOCKET sk;
> > +    int fd;
> > +
> > +    info =3D (void *)g_base64_decode(infos, &len);
> > +    if (len !=3D sizeof(*info)) {
> > +        error_setg(errp, "Invalid WSAPROTOCOL_INFOW value");
> > +        return;
> > +    }
> > +
> > +    sk =3D WSASocketW(FROM_PROTOCOL_INFO,
> > +                    FROM_PROTOCOL_INFO,
> > +                    FROM_PROTOCOL_INFO,
> > +                    info, 0, 0);
> > +    if (sk =3D=3D INVALID_SOCKET) {
> > +        error_setg_win32(errp, WSAGetLastError(), "Couldn't import soc=
ket");
> > +        return;
> > +    }
> > +
> > +    fd =3D _open_osfhandle(sk, _O_BINARY);
> > +    if (fd < 0) {
> > +        error_setg_errno(errp, errno, "Failed to associate a FD with t=
he SOCKET");
> > +        closesocket(sk);
> > +        return;
> > +    }
> > +
> > +    monitor_add_fd(monitor_cur(), fd, fdname, errp);
> > +}
> > +#endif
> > +
> > +
> >  void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **=
errp)
> >  {
> >      MonFdset *mon_fdset;
>
>


--=20
Marc-Andr=C3=A9 Lureau

