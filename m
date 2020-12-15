Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809402DAB64
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:50:58 +0100 (CET)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7uz-0003Go-Jh
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kp7tk-0002SN-Ht
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:49:40 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kp7tg-0006Gi-OT
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:49:40 -0500
Received: by mail-ej1-x643.google.com with SMTP id jx16so26971253ejb.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 02:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rUpQrdaO1GQ//F95CZQQvaB/Aij8x7r6y7lpVWSODc=;
 b=GIn3uD00dwQY9D6aPfGzNBS7/LCzYrSuz41uePKPWLSlXlyQsckVGo5H8SlW7Q+JGb
 6xJJI3aKmXtPoboV6+XpfgLcn0BNhpU+1diAIHGA4KUpJqJrSits/39IYcQY029d4FkA
 eOnDa+rmA5IyUXgMUHtcuKqwzgmsrgXQLDJLpzkP+nqIDvnAY0Z2Y5Bq2WVmbNNDyk2P
 Q+fyK3XZteHffsC84IJcqEUXxpnZY6DJze5qmiaJqYt0ilQnFdNb3FjWpxQn0K8nx683
 WIkPiTy/dTYcwhkJTdtDsLOb9Ris8woRU6ckUdmclDf492BChvNWtHCCK78587PL7BP9
 tFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rUpQrdaO1GQ//F95CZQQvaB/Aij8x7r6y7lpVWSODc=;
 b=JRDj1t4cvnh714cOmq97BIEIEyLKJrRdTB+Rd0b4QuG6v0M0RT8v6Jl/mEnma31h17
 RA3EmU49/m5osxOj+pccFuBXsxBs8XqRLSYIhZXzoTo72HqTpmnm5SV9ZSfbrhoUQdth
 KiGm7AL579peJ60A/LUehN+UDQ8CCrX0ztfCp0r28eHgolQJyEKlEGnvfoF3pZAxzywR
 ROvWrPWEtbNTAciMgc+RAlBa1YmbEhA8l+RvPvklGMz4jwzccfnD5k9V8+pyfMKX4u1A
 0HNuTVP8gkp2QtyIbvs3dpnhr984/4Ip4fKfyqV2+kyyYO7g2mcH37z1EN//oWdc3d6o
 tNdw==
X-Gm-Message-State: AOAM531r1TccW+uxfpW7oa6WhK1pQNFxuVbrAtbn4awP2/l6WRB8DZTg
 id7Ql5XYjhoUpZWlBQrCko+Ap6sEKhRQOzJIL/o=
X-Google-Smtp-Source: ABdhPJzUEXKLmvnG8LfeL7CPiqT0UhcrqcToXLP6Rhxw9LMNQvTg5f5lFDFMYPrgyc6ft62rjOEdqU8/mPzHZryutQM=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr17672155ejj.105.1608029374466; 
 Tue, 15 Dec 2020 02:49:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607922214.git.jag.raman@oracle.com>
 <a366c7f80a862b4f32445f8334e2f36767b102a3.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <a366c7f80a862b4f32445f8334e2f36767b102a3.1607922214.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 15 Dec 2020 14:49:22 +0400
Message-ID: <CAJ+F1CJLKJR5UirK106zKn5bM8rr1cDZyQwZ66QdMJLS-k_zBA@mail.gmail.com>
Subject: Re: [PATCH v13 07/19] multi-process: add qio channel function to
 transmit data and fds
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000a74fd505b67e8345"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
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
 Thanos Makatos <thanos.makatos@nutanix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a74fd505b67e8345
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Dec 14, 2020 at 9:15 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> Adds QIO channel functions that transmit and receive iovs along with fds.
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/io/channel.h | 50 +++++++++++++++++++++++++++++++++++++++++
>  io/channel.c         | 63
> +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 112 insertions(+), 1 deletion(-)
>
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 4d6fe45..c2d9836 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -774,4 +774,54 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,
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
> + * Behaves like qio_channel_readvv_full but will attempt
> + * to read all data specified (file handles and memory regions).
> + * The function will wait for all requested data
> + * to be read, yielding from the current coroutine
> + * if required.
> + *
> + * Returns: 0 if all bytes were read, or -1 on error
> + */
> +
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp);
> +
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
> +
>  #endif /* QIO_CHANNEL_H */
> diff --git a/io/channel.c b/io/channel.c
> index 93d449d..13b0e7a 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -152,15 +152,72 @@ int qio_channel_readv_all(QIOChannel *ioc,
>      return ret;
>  }
>
> +int qio_channel_readv_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int **fds, size_t *nfds,
> +                                Error **errp)
> +{
> +    int ret =3D -1;
> +    struct iovec *local_iov =3D g_new(struct iovec, niov);
> +    struct iovec *local_iov_head =3D local_iov;
> +    unsigned int nlocal_iov =3D niov;
> +    int **local_fds =3D fds;
> +    size_t *local_nfds =3D nfds;
> +
> +    nlocal_iov =3D iov_copy(local_iov, nlocal_iov,
> +                          iov, niov,
> +                          0, iov_size(iov, niov));
> +
> +    while (nlocal_iov > 0) {
> +        ssize_t len;
> +        len =3D qio_channel_readv_full(ioc, local_iov, nlocal_iov,
> local_fds,
> +                                     local_nfds, errp);
> +        if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(ioc, G_IO_OUT);
> +            } else {
> +                qio_channel_wait(ioc, G_IO_OUT);
> +            }
> +            continue;
> +        }
> +        if (len <=3D 0) {
> +            ret =3D len;
> +            goto cleanup;
> +        }
> +
> +        iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        local_fds =3D NULL;
> +        local_nfds =3D 0;
> +    }
> +
> +    ret =3D 1;
> + cleanup:
> +    g_free(local_iov_head);
> +    return ret;
> +}
> +
>

I suggest to adapt the code so qio_channel_readv_all_eof() calls
qio_channel_readv_full_all().

You may want to split this patch in 2 parts: the read and write parts.


>  int qio_channel_writev_all(QIOChannel *ioc,
>                             const struct iovec *iov,
>                             size_t niov,
>                             Error **errp)
>  {
> +    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
> +}
> +
> +int qio_channel_writev_full_all(QIOChannel *ioc,
> +                                const struct iovec *iov,
> +                                size_t niov,
> +                                int *fds, size_t nfds,
> +                                Error **errp)
> +{
>      int ret =3D -1;
>      struct iovec *local_iov =3D g_new(struct iovec, niov);
>      struct iovec *local_iov_head =3D local_iov;
>      unsigned int nlocal_iov =3D niov;
> +    int *local_fds =3D fds;
> +    size_t local_nfds =3D nfds;
>
>      nlocal_iov =3D iov_copy(local_iov, nlocal_iov,
>                            iov, niov,
> @@ -168,7 +225,8 @@ int qio_channel_writev_all(QIOChannel *ioc,
>
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len =3D qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
> +        len =3D qio_channel_writev_full(ioc, local_iov, nlocal_iov,
> local_fds,
> +                                      local_nfds, errp);
>          if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_OUT);
> @@ -182,6 +240,9 @@ int qio_channel_writev_all(QIOChannel *ioc,
>          }
>
>          iov_discard_front(&local_iov, &nlocal_iov, len);
> +
> +        local_fds =3D NULL;
> +        local_nfds =3D 0;
>      }
>
>      ret =3D 0;
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a74fd505b67e8345
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 2020 at 9:15 AM Jagannathan R=
aman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" target=3D=
"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
Adds QIO channel functions that transmit and receive iovs along with fds.<b=
r>
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
=C2=A0include/io/channel.h | 50 +++++++++++++++++++++++++++++++++++++++++<b=
r>
=C2=A0io/channel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 63 ++++++++++++++++++=
+++++++++++++++++++++++++++++++++-<br>
=C2=A02 files changed, 112 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/io/channel.h b/include/io/channel.h<br>
index 4d6fe45..c2d9836 100644<br>
--- a/include/io/channel.h<br>
+++ b/include/io/channel.h<br>
@@ -774,4 +774,54 @@ void qio_channel_set_aio_fd_handler(QIOChannel *ioc,<b=
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
+ * Behaves like qio_channel_readvv_full but will attempt<br>
+ * to read all data specified (file handles and memory regions).<br>
+ * The function will wait for all requested data<br>
+ * to be read, yielding from the current coroutine<br>
+ * if required.<br>
+ *<br>
+ * Returns: 0 if all bytes were read, or -1 on error<br>
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
+<br>
=C2=A0#endif /* QIO_CHANNEL_H */<br>
diff --git a/io/channel.c b/io/channel.c<br>
index 93d449d..13b0e7a 100644<br>
--- a/io/channel.c<br>
+++ b/io/channel.c<br>
@@ -152,15 +152,72 @@ int qio_channel_readv_all(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+int qio_channel_readv_full_all(QIOChannel *ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int **fds, size_t *nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret =3D -1;<br>
+=C2=A0 =C2=A0 struct iovec *local_iov =3D g_new(struct iovec, niov);<br>
+=C2=A0 =C2=A0 struct iovec *local_iov_head =3D local_iov;<br>
+=C2=A0 =C2=A0 unsigned int nlocal_iov =3D niov;<br>
+=C2=A0 =C2=A0 int **local_fds =3D fds;<br>
+=C2=A0 =C2=A0 size_t *local_nfds =3D nfds;<br>
+<br>
+=C2=A0 =C2=A0 nlocal_iov =3D iov_copy(local_iov, nlocal_iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 iov, niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0, iov_size(iov, niov));<br>
+<br>
+=C2=A0 =C2=A0 while (nlocal_iov &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssize_t len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qio_channel_readv_full(ioc, local_iov,=
 nlocal_iov, local_fds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_nfds, errp=
);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov_discard_front(&amp;local_iov, &amp;nlocal_=
iov, len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_fds =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_nfds =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D 1;<br>
+ cleanup:<br>
+=C2=A0 =C2=A0 g_free(local_iov_head);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br></blockquote><div><br></div><div>I suggest to adapt the code so qio_ch=
annel_readv_all_eof() calls qio_channel_readv_full_all(). <br></div><div><b=
r></div><div>You may want to split this patch in 2 parts: the read and writ=
e parts.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0int qio_channel_writev_all(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 size_t niov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, =
errp);<br>
+}<br>
+<br>
+int qio_channel_writev_full_all(QIOChannel *ioc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t niov,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int *fds, size_t nfds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0struct iovec *local_iov =3D g_new(struct iovec, niov);<=
br>
=C2=A0 =C2=A0 =C2=A0struct iovec *local_iov_head =3D local_iov;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int nlocal_iov =3D niov;<br>
+=C2=A0 =C2=A0 int *local_fds =3D fds;<br>
+=C2=A0 =C2=A0 size_t local_nfds =3D nfds;<br>
<br>
=C2=A0 =C2=A0 =C2=A0nlocal_iov =3D iov_copy(local_iov, nlocal_iov,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0iov, niov,<br>
@@ -168,7 +225,8 @@ int qio_channel_writev_all(QIOChannel *ioc,<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (nlocal_iov &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qio_channel_writev(ioc, local_iov, nlo=
cal_iov, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qio_channel_writev_full(ioc, local_iov=
, nlocal_iov, local_fds,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_nfds, err=
p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D QIO_CHANNEL_ERR_BLOCK) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (qemu_in_coroutine()) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qio_channel_y=
ield(ioc, G_IO_OUT);<br>
@@ -182,6 +240,9 @@ int qio_channel_writev_all(QIOChannel *ioc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iov_discard_front(&amp;local_iov, &amp;nl=
ocal_iov, len);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_fds =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_nfds =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a74fd505b67e8345--

