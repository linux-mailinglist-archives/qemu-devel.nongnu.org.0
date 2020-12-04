Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCF2CEFE8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:42:39 +0100 (CET)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klCIA-0002vL-6u
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klCGW-0001rW-N0
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:40:56 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klCGS-0000zR-7x
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:40:56 -0500
Received: by mail-ej1-x641.google.com with SMTP id n26so9002233eju.6
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XLrXOl+OXKzJtzv7IjkC1r4SVCQ7PAY3Q18A5NWuPps=;
 b=tJX2HcbpGX9ZdKCpzbJ9gtJlV3egQB7nD5J3KbmMsp95E7xkoiZ+F7UIXEv8Im8u0Y
 bUv0t4HBaHFSdvoTRBnXVKD9R73PBWTMSTNnlz0a8MH3WZQgcFcsKvwpuYZVXIadeZmg
 OpcKNKDpJ1AyLcvzKOM6z9duNsb65pEUawouisxcCpg61qCMeJ8fNPJV/1LQRBxdGSoj
 r4I/KZ0wEEQCo+WMigJPtBKkfRqj8bBXtfiNyUOiy1oeZCosUR528arHX4pQoeNwoMoM
 OCMZ4Hq/rduQJ0liLyMI41TXul1O6U3E/S2iE8uqFRwTVBNzUBx2YnBTQTqUK308nIFI
 4+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XLrXOl+OXKzJtzv7IjkC1r4SVCQ7PAY3Q18A5NWuPps=;
 b=FETAkJLKiU/WQYL1z5vzg8OXvt6OPs6vlkx9qaLchxBZvWQ08U+kmHpc/UDA2aVXJy
 0KOtcEYRyJKpu/K09piJtu53rvQUlOZE4V5s94cNAOQ1muy531GO2VVi1kIoYvPEd/Vq
 sO13f69TfsaJH5l2/2DMLhwImfRHBoX/zhPgeAc97ARbaghkF2Ez9cUO9HVgEiiYZIML
 zbQJQhFDnRznFxWHOubqf+ch0heUSD0ExkQ9ItaKULAflc6oGfj3W5M7yRW9jwf+L0dF
 CrNxvDelhiG9Y3pTwJM64Swy6e0ytDl719h9WwpgyzOWLgMQJghiRVk+7eT61lIyBLH9
 krrg==
X-Gm-Message-State: AOAM533wfOBNTegiyjzkt86tZkCNimthseGkDk2G+sKZ2ddvSpcCOSXA
 gCoO/oU1A3ivLnSO5hNpJHx8Sdusvd5F/aU6WfA=
X-Google-Smtp-Source: ABdhPJzemdaz4ZSfylISSTPddjuALK/1Hp05D7/UKLHOKHTyhv96l0zWt8grqOfnRwquy/Zex//gBp11e/ertg4YPEI=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr7470219ejx.389.1607092850973; 
 Fri, 04 Dec 2020 06:40:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <7d135ab5224ad43d0a395f31be70e20a4bd52a11.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <7d135ab5224ad43d0a395f31be70e20a4bd52a11.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 18:40:39 +0400
Message-ID: <CAJ+F1CKk-RrQY=n2SVw4M699jzQYJjZWEatHJCZT7=RtboW=OQ@mail.gmail.com>
Subject: Re: [PATCH v12 07/19] multi-process: add qio channel function to
 transmit data and fds
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000080e05005b5a47603"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000080e05005b5a47603
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> Adds QIO channel functions that transmits the input iovs as well as the
> supplied fds.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/io/channel.h | 24 ++++++++++++++++++++++++
>  io/channel.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
>
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 4d6fe45..0aa44e1 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -773,5 +773,29 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
>                                      IOHandler *io_read,
>                                      IOHandler *io_write,
>                                      void *opaque);
> +/**
> + * qio_channel_writev_full_all:
> + * @ioc: the channel object
> + * @iov: the array of memory regions to write data from
> + * @niov: the length of the @iov array
> + * @fds: an array of file handles to send
> + * @nfds: number of file handles in @fds
> + * @errp: pointer to a NULL-initialized error object
> + *
> + *
> + * Behaves like qio_channel_writev_full but will attempt
> + * to send all data passed (file handles and memory regions).
> + * The function will wait for all requested data
> + * to be written, yielding from the current coroutine
> + * if required.
> + *
> + * Returns: 0 if all bytes were written, or -1 on error
> + */
> +
> +int qio_channel_writev_full_all(QIOChannel *ioc,
> +                           const struct iovec *iov,
> +                           size_t niov,
> +                           int *fds, size_t nfds,
> +                           Error **errp);
>
>  #endif /* QIO_CHANNEL_H */
> diff --git a/io/channel.c b/io/channel.c
> index 93d449d..255dd46 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -190,6 +190,51 @@ int qio_channel_writev_all(QIOChannel *ioc,
>      return ret;
>  }
>
> +int qio_channel_writev_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int *fds, size_t nfds,
> +                                Error **errp)
> +{
>

Please make qio_channel_writev_all() call qio_channel_writev_full_all() to
avoid logic duplication.


> +    int ret =3D -1;
> +    struct iovec *local_iov =3D g_new(struct iovec, niov);
> +    struct iovec *local_iov_head =3D local_iov;
> +    unsigned int nlocal_iov =3D niov;
> +
> +    nlocal_iov =3D iov_copy(local_iov, nlocal_iov,
> +                          iov, niov,
> +                          0, iov_size(iov, niov));
> +
> +    while (nlocal_iov > 0) {
> +        ssize_t len;
> +        len =3D qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds,
> +                                      nfds, errp);
> +        if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_OUT);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_OUT);
> +            }
> +            continue;
> +        }
> +        if (len < 0) {
> +            goto cleanup;
> +        }
> +
> +        iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        if (len > 0) {
> +            fds =3D NULL;
> +            nfds =3D 0;
> +        }
> +    }
> +
> +    ret =3D 0;
> + cleanup:
> +    g_free(local_iov_head);
> +    return ret;
> +}
> +
>  ssize_t qio_channel_readv(QIOChannel *ioc,
>                            const struct iovec *iov,
>                            size_t niov,
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000080e05005b5a47603
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:23 AM Jagan=
nathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" t=
arget=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
Adds QIO channel functions that transmits the input iovs as well as the<br>
supplied fds.<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/io/channel.h | 24 ++++++++++++++++++++++++<br>
=C2=A0io/channel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 ++++++++++++++++++=
+++++++++++++++++++++++++++<br>
=C2=A02 files changed, 69 insertions(+)<br>
<br>
diff --git a/include/io/channel.h b/include/io/channel.h<br>
index 4d6fe45..0aa44e1 100644<br>
--- a/include/io/channel.h<br>
+++ b/include/io/channel.h<br>
@@ -773,5 +773,29 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOHandler *io_re=
ad,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOHandler *io_wr=
ite,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque);<b=
r>
+/**<br>
+ * qio_channel_writev_full_all:<br>
+ * @ioc: the channel object<br>
+ * @iov: the array of memory regions to write data from<br>
+ * @niov: the length of the @iov array<br>
+ * @fds: an array of file handles to send<br>
+ * @nfds: number of file handles in @fds<br>
+ * @errp: pointer to a NULL-initialized error object<br>
+ *<br>
+ *<br>
+ * Behaves like qio_channel_writev_full but will attempt<br>
+ * to send all data passed (file handles and memory regions).<br>
+ * The function will wait for all requested data<br>
+ * to be written, yielding from the current coroutine<br>
+ * if required.<br>
+ *<br>
+ * Returns: 0 if all bytes were written, or -1 on error<br>
+ */<br>
+<br>
+int qio_channel_writev_full_all(QIOChannel *ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const struct iovec *iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0size_t niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int *fds, size_t nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Error **errp);<br>
<br>
=C2=A0#endif /* QIO_CHANNEL_H */<br>
diff --git a/io/channel.c b/io/channel.c<br>
index 93d449d..255dd46 100644<br>
--- a/io/channel.c<br>
+++ b/io/channel.c<br>
@@ -190,6 +190,51 @@ int qio_channel_writev_all(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+int qio_channel_writev_full_all(QIOChannel *ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int *fds, size_t nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br></blockquote><div><br></div><div><div>Please make qio_channel_writev_=
all() call qio_channel_writev_full_all() to avoid logic duplication.</div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 int ret =3D -1;<br>
+=C2=A0 =C2=A0 struct iovec *local_iov =3D g_new(struct iovec, niov);<br>
+=C2=A0 =C2=A0 struct iovec *local_iov_head =3D local_iov;<br>
+=C2=A0 =C2=A0 unsigned int nlocal_iov =3D niov;<br>
+<br>
+=C2=A0 =C2=A0 nlocal_iov =3D iov_copy(local_iov, nlocal_iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 iov, niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0, iov_size(iov, niov));<br>
+<br>
+=C2=A0 =C2=A0 while (nlocal_iov &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qio_channel_writev_full(ioc, local_iov=
, nlocal_iov, fds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nfds, errp);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_in_coroutine()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_yield(=
ioc, G_IO_OUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_wait(i=
oc, G_IO_OUT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov_discard_front(&amp;local_iov, &amp;nlocal_=
iov, len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fds =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nfds =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D 0;<br>
+ cleanup:<br>
+=C2=A0 =C2=A0 g_free(local_iov_head);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0ssize_t qio_channel_readv(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const struct iovec *iov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0size_t niov,<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000080e05005b5a47603--

