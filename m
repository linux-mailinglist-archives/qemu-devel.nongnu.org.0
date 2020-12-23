Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30902E1BCF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 12:26:13 +0100 (CET)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks2HU-0004rl-Gs
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 06:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ks2Fj-0003oq-Gu
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 06:24:23 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ks2Fh-000701-AM
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 06:24:23 -0500
Received: by mail-ed1-x52f.google.com with SMTP id cw27so15904311edb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2wrP3Jypw6watrg2qN9zcy22qgi6EvbzSRUHO2CEz4g=;
 b=femQ+Vf3F11fuvdJSPsgtpxo3mnXliIJ/iYVrnGgpBsS2QLnOwhVc6C/GPTcAS1mhu
 HFQL+Jf5pn06wlR0L5xzhxrz1sqLMpcmD2qLXD+Br3PPGcTAJyoZPkI8ljZCjOwRXQ0F
 ykd5ZsKPpxoEAy6/n8tStZuTFqC/+1t3scHB+8r5BUO2Sg1D2vNuxRYCXiVBWb7x4gYQ
 6YRq0hwzGJzdUPeCd3TH7X75AMVejg43y6UbvrrHPIQFG7BH7peqd2kTJZa+SDu/nxa+
 EjhgXZjXLyPb8t9CS5js4cIeknFW4jesnnVl1623+XFWm26lJdDIp1bXsPNIOCguFklH
 dyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wrP3Jypw6watrg2qN9zcy22qgi6EvbzSRUHO2CEz4g=;
 b=cbMVkS0LAU75g4lFcZKVLuk0xqL8ler0IhiRWLdcSXpAQzpPY3cVUgt+SjY0x4JXBP
 cWR34brKX4XEgVbjzjMOf/NDDG5KBinWnBZ+SDjOJXfwFpXJ5NA91bzsRMmXzVdFXxmr
 2DGsUUZUwlqmB6UeKPvwDPZ8EXrXnAzebQayW9DxQ4yIyQ809XDH6wH3dIzefoD802Jl
 a/vcKbEGlfk7JlOQ+pEVNY3VtkLe3IKo+ROQJaFtj38YSP7dtUbGD8Num0i6Y1QbEpE+
 4fXcBx2mxUqAiM84mrboRoVazBbbwjuw8AT9fXoqv7i1Iodc8EWozKH4ROR8qEZ929rf
 7n/g==
X-Gm-Message-State: AOAM531pmzNDG38BHsjyp5T1mLwJatV/Pnf7+7WKnagKETZvXDcA6kWq
 3PtHKHauKDXYuyt8EoCeyyzoJTXH/LP8/yLor9A=
X-Google-Smtp-Source: ABdhPJzLt0jv5bWrcGzqEyrIQV5tO9Xnzu+Eme/I2N3cQ+U2OD6mLy9cYZMCinkD1dJUGuW83ZWWnRwLI603ckmp0Pk=
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr24344445edb.237.1608722659774; 
 Wed, 23 Dec 2020 03:24:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608702853.git.elena.ufimtseva@oracle.com>
 <42569c768066e334186ea8567847d96c8ebb0ad9.1608702853.git.elena.ufimtseva@oracle.com>
In-Reply-To: <42569c768066e334186ea8567847d96c8ebb0ad9.1608702853.git.elena.ufimtseva@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 23 Dec 2020 15:24:07 +0400
Message-ID: <CAJ+F1CK_Jn5EKnzrPrGMZ4sJruyq34UDpSdV0aAji53JbLh=nQ@mail.gmail.com>
Subject: Re: [PATCH v15 08/20] multi-process: add qio channel read function
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ad960f05b71fee32"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ad960f05b71fee32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 23, 2020 at 10:17 AM <elena.ufimtseva@oracle.com> wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> Adds qio_channel_readv_full_all() to read both data and FDs.
> Refactors existing code to use this function.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/io/channel.h | 25 +++++++++++++
>  io/channel.c         | 85 +++++++++++++++++++++++++++++++-------------
>  2 files changed, 85 insertions(+), 25 deletions(-)
>
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 2378567d4b..429ece9a05 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -774,6 +774,31 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
>                                      IOHandler *io_write,
>                                      void *opaque);
>
> +/**
> + * qio_channel_readv_full_all:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to read data to
> + * @niov: the length of the @iov array
> + * @fds: an array of file handles to read
> + * @nfds: number of file handles in @fds
> + * @errp: pointer to a NULL-initialized error object
> + *
> + *
> + * Behaves like qio_channel_readv_full but will attempt
> + * to read all data specified (file handles and memory regions).
> + * The function will wait for all requested data
> + * to be read, yielding from the current coroutine
> + * if required.
> + *
> + * Returns: 0 if all bytes were read, or -1 on error
>

It may also returns -ECANCEL. I am not sure it's a good idea.

+ */
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp);
> +
>  /**
>   * qio_channel_writev_full_all:
>   * @ioc: the channel object
> diff --git a/io/channel.c b/io/channel.c
> index bde1f6d0f4..5edaea1fac 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -91,11 +91,49 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                                const struct iovec *iov,
>                                size_t niov,
>                                Error **errp)
> +{
> +    int ret =3D qio_channel_readv_full_all(ioc, iov, niov, NULL, NULL,
> errp);
> +
>
+    if (ret =3D=3D -ECANCELED) {
>

 No io/ functions use -errno return values so far.

Maybe the simplest is to use the same return values as read_all_eof:
 * Returns: 1 if all bytes were read, 0 if end-of-file occurs
 *          without data, or -1 on error

+        error_prepend(errp,
> +                      "Unexpected end-of-file before all bytes were read=
:
> ");
> +        ret =3D -1;
> +    }
> +
> +    return ret;
> +}
> +
> +int qio_channel_readv_all(QIOChannel *ioc,
> +                          const struct iovec *iov,
> +                          size_t niov,
> +                          Error **errp)
> +{
> +    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
>
+
>

It looks like it would make more sense to call readv_full_all directly
instead now.

+    if (ret =3D=3D 0) {
> +        error_setg(errp,
> +                   "Unexpected end-of-file before all bytes were read");
> +        return -1;
> +    }
> +    if (ret =3D=3D 1) {
> +        return 0;
> +    }
> +
> +    return ret;
> +}
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp)
>  {
>      int ret =3D -1;
>      struct iovec *local_iov =3D g_new(struct iovec, niov);
>      struct iovec *local_iov_head =3D local_iov;
>      unsigned int nlocal_iov =3D niov;
> +    int **local_fds =3D fds;
> +    size_t *local_nfds =3D nfds;
>      bool partial =3D false;
>
>      nlocal_iov =3D iov_copy(local_iov, nlocal_iov,
> @@ -104,7 +142,8 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len =3D qio_channel_readv(ioc, local_iov, nlocal_iov, errp);
> +        len =3D qio_channel_readv_full(ioc, local_iov, nlocal_iov,
> local_fds,
> +                                     local_nfds, errp);
>          if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_IN);
> @@ -112,20 +151,33 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>                  qio_channel_wait(ioc, G_IO_IN);
>              }
>              continue;
> -        } else if (len < 0) {
> -            goto cleanup;
> -        } else if (len =3D=3D 0) {
> -            if (partial) {
> -                error_setg(errp,
> -                           "Unexpected end-of-file before all bytes were
> read");
> +        }
> +
> +        if (len <=3D 0) {
> +            size_t fd_idx =3D nfds ? *nfds : 0;
> +            if (partial && (len =3D=3D 0)) {
> +                ret =3D -ECANCELED;
>              } else {
> -                ret =3D 0;
> +                ret =3D len;
> +            }
> +
> +            while (fds && fd_idx) {
> +                close(*fds[fd_idx - 1]);
> +                fd_idx--;
> +            }
> +
> +            if (fds) {
> +                g_free(*fds);
>              }
> +
>              goto cleanup;
>          }
>
>          partial =3D true;
>          iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        local_fds =3D NULL;
> +        local_nfds =3D 0;
>      }
>
>      ret =3D 1;
> @@ -135,23 +187,6 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
>      return ret;
>  }
>
> -int qio_channel_readv_all(QIOChannel *ioc,
> -                          const struct iovec *iov,
> -                          size_t niov,
> -                          Error **errp)
> -{
> -    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
> -
> -    if (ret =3D=3D 0) {
> -        ret =3D -1;
> -        error_setg(errp,
> -                   "Unexpected end-of-file before all bytes were read");
> -    } else if (ret =3D=3D 1) {
> -        ret =3D 0;
> -    }
> -    return ret;
> -}
> -
>  int qio_channel_writev_all(QIOChannel *ioc,
>                             const struct iovec *iov,
>                             size_t niov,
> --
> 2.25.GIT
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ad960f05b71fee32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 23, 2020 at 10:17 AM &l=
t;<a href=3D"mailto:elena.ufimtseva@oracle.com">elena.ufimtseva@oracle.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" targ=
et=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
Adds qio_channel_readv_full_all() to read both data and FDs.<br>
Refactors existing code to use this function.<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/io/channel.h | 25 +++++++++++++<br>
=C2=A0io/channel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 85 ++++++++++++++++++=
+++++++++++++-------------<br>
=C2=A02 files changed, 85 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/include/io/channel.h b/include/io/channel.h<br>
index 2378567d4b..429ece9a05 100644<br>
--- a/include/io/channel.h<br>
+++ b/include/io/channel.h<br>
@@ -774,6 +774,31 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOHandler *io_wr=
ite,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque);<b=
r>
<br>
+/**<br>
+ * qio_channel_readv_full_all:<br>
+ * @ioc: the channel object<br>
+ * @iov: the array of memory regions to read data to<br>
+ * @niov: the length of the @iov array<br>
+ * @fds: an array of file handles to read<br>
+ * @nfds: number of file handles in @fds<br>
+ * @errp: pointer to a NULL-initialized error object<br>
+ *<br>
+ *<br>
+ * Behaves like qio_channel_readv_full but will attempt<br>
+ * to read all data specified (file handles and memory regions).<br>
+ * The function will wait for all requested data<br>
+ * to be read, yielding from the current coroutine<br>
+ * if required.<br>
+ *<br>
+ * Returns: 0 if all bytes were read, or -1 on error<br></blockquote><div>=
<br></div><div>It may also returns -ECANCEL. I am not sure it&#39;s a good =
idea. <br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+ */<br>
+<br>
+int qio_channel_readv_full_all(QIOChannel *ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int **fds, size_t *nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * qio_channel_writev_full_all:<br>
=C2=A0 * @ioc: the channel object<br>
diff --git a/io/channel.c b/io/channel.c<br>
index bde1f6d0f4..5edaea1fac 100644<br>
--- a/io/channel.c<br>
+++ b/io/channel.c<br>
@@ -91,11 +91,49 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct iovec *iov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t niov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret =3D qio_channel_readv_full_all(ioc, iov, niov, NULL,=
 NULL, errp);<br>
+<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if (ret =3D=3D -ECANCELED) {<br></blockquote><div><br></div>=
<div>=C2=A0No io/ functions use -errno return values so far.</div><div><br>=
</div><div>Maybe the simplest is to use the same return values as read_all_=
eof:</div><div>=C2=A0* Returns: 1 if all bytes were read, 0 if end-of-file =
occurs<br>=C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0without data, or -1 on =
error</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_prepend(errp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Unexpected end-of-file before all bytes were read: &quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+int qio_channel_readv_all(QIOChannel *ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 size_t niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);=
 <br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br></blockquote><div><br></div><div>It looks like it would make more sens=
e to call readv_full_all directly instead now.</div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Unexpected end-of-file before all bytes were read&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (ret =3D=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+int qio_channel_readv_full_all(QIOChannel *ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int **fds, size_t *nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0struct iovec *local_iov =3D g_new(struct iovec, niov);<=
br>
=C2=A0 =C2=A0 =C2=A0struct iovec *local_iov_head =3D local_iov;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int nlocal_iov =3D niov;<br>
+=C2=A0 =C2=A0 int **local_fds =3D fds;<br>
+=C2=A0 =C2=A0 size_t *local_nfds =3D nfds;<br>
=C2=A0 =C2=A0 =C2=A0bool partial =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0nlocal_iov =3D iov_copy(local_iov, nlocal_iov,<br>
@@ -104,7 +142,8 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (nlocal_iov &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qio_channel_readv(ioc, local_iov, nloc=
al_iov, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qio_channel_readv_full(ioc, local_iov,=
 nlocal_iov, local_fds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_nfds, errp=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qemu_in_coroutine()) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_channel_y=
ield(ioc, G_IO_IN);<br>
@@ -112,20 +151,33 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_channel_w=
ait(ioc, G_IO_IN);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (len &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (len =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (partial) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unexpected end-of-file before all bytes were =
read&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t fd_idx =3D nfds ? *nfds :=
 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (partial &amp;&amp; (len =3D=
=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ECANCELED=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (fds &amp;&amp; fd_idx) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(*fds[fd_idx =
- 1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd_idx--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fds) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(*fds);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partial =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iov_discard_front(&amp;local_iov, &amp;nl=
ocal_iov, len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_fds =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_nfds =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 1;<br>
@@ -135,23 +187,6 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-int qio_channel_readv_all(QIOChannel *ioc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 size_t niov,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Error **errp)<br>
-{<br>
-=C2=A0 =C2=A0 int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);=
<br>
-<br>
-=C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Unexpected end-of-file before all bytes were read&quot;);<br>
-=C2=A0 =C2=A0 } else if (ret =3D=3D 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
=C2=A0int qio_channel_writev_all(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 size_t niov,<br>
-- <br>
2.25.GIT<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000ad960f05b71fee32--

