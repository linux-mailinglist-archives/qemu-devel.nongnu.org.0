Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B62CEFDE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:41:28 +0100 (CET)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klCH1-0001yL-Eo
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klCFk-0001RL-1n
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:40:08 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1klCFi-0000cT-7F
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:40:07 -0500
Received: by mail-ed1-x541.google.com with SMTP id c7so6054001edv.6
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 06:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7L+cOp7Rr28XgH3I9u8syuq6ZvKSAZla9VJhW1pFxyU=;
 b=ofLcaKR9e1tai1R018QvJMouNjWgj+0s19JKuMjlQJFeyniBX/gRBrhPonJwGCI03g
 RSr9ULJjqHkvF2PKqEkbVtLpUUvb13G4R/Y5XBPeugteIjew9A2P2eZlGdu0SeF1w3OF
 FVcjLHaA6Vr28xwhPYDfrpMBGR9r4eBILvZa3Pa5Xia1p+e6FIygNdiLxgmyWmv96JoL
 hxqIk3KDY9wzUoQ9ZV9yHtmz+2XB+6p1LIsGDgqVOvFR9SnYXZ8scksdK0md0hqpB0Mp
 PBED6ZOUXU9qDzqJpSPOdfHsjPHhws3ZxJDHyjTIM/3uuYB1mCmrKnrsVlWAOHCB62Pz
 bbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7L+cOp7Rr28XgH3I9u8syuq6ZvKSAZla9VJhW1pFxyU=;
 b=AjjWxIDVSvVcrPtDXQMpwbKsHqXWZ9jsK+bFwn0PRW7kC0sqEhkILnVLawlcG9p+mi
 4SWz7jXEluHHJ+if2OkDeMH0RQ4r/7CI2snYsP+V3cQjwBnLxTAoSvPlxJ7LJqnz0mFC
 1I4GCu9B7VYUX7/HjnHSCklu9MXwAwLDX02FKUeXsi1i0HQdw3Hz/9E5aKMUSv98DKu3
 Je6Dp7XT2vLs4PFsrfy+BakDTv7pyXs+Vd4mo41JlVPAeAuwv+jsTAzyJT5SvE1RkM4M
 lhAgRe7u/c1AdleXXVgJBKnjCneCakdHNxSzMNmpL/yobiceU9mrjqdX2zYWhe9+btf8
 u5lA==
X-Gm-Message-State: AOAM532jHrI2+81QPCTkciPcfUT30EDgFpJqo9IrUKzAcrFJkcXV+5zx
 EFcxrt4y/wB1IXIr+8Q9zWYAp9Br5HujYCk+U+g=
X-Google-Smtp-Source: ABdhPJwSdg+Y+JJdyW3p5odh0kUcBS3r/bN1se6azrvWoMD+FJjiAEDESSUTNJ/dvDtCBhn6dCIDdjkQwb+cjlfjOBU=
X-Received: by 2002:aa7:c558:: with SMTP id s24mr7905967edr.257.1607092804291; 
 Fri, 04 Dec 2020 06:40:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602784930.git.jag.raman@oracle.com>
 <599c6eb3f07b3ef16f29ad8fda005ddecc038566.1602784930.git.jag.raman@oracle.com>
In-Reply-To: <599c6eb3f07b3ef16f29ad8fda005ddecc038566.1602784930.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 18:39:52 +0400
Message-ID: <CAJ+F1CJVShip-9Vr2JSy3PYKKxwZB7uJ_6ckCbO+TpjTa2csMw@mail.gmail.com>
Subject: Re: [PATCH v11 05/19] multi-process: add qio channel function to
 transmit
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000b8924b05b5a4736f"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x541.google.com
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

--000000000000b8924b05b5a4736f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 10:05 PM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> The entire array of the memory regions and file handlers.
> Will be used in the next patch.
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
> index 3c04f0e..6807506 100644
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
> index e4376eb..22c10c5 100644
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

thanks

+    int ret =3D -1;
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

--000000000000b8924b05b5a4736f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 15, 2020 at 10:05 PM Jaga=
nnathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" =
target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
The entire array of the memory regions and file handlers.<br>
Will be used in the next patch.<br>
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
index 3c04f0e..6807506 100644<br>
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
index e4376eb..22c10c5 100644<br>
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
+{<br></blockquote><div><br></div><div>Please make qio_channel_writev_all()=
 call qio_channel_writev_full_all() to avoid logic duplication.</div><div><=
br></div><div>thanks</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
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

--000000000000b8924b05b5a4736f--

