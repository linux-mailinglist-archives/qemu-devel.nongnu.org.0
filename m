Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133D47701C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 12:22:08 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxopq-0005Im-C2
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 06:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxomZ-0004aI-EV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxomS-00018H-N6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 06:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639653513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XQOtMifrjCg1yoewPhzF8CvkzGgyTKglFXsCWcXu9bg=;
 b=dyDql/XxUMiF+a8Sci3FtXHg+RDZkT4KpMsHbPNa1wQ4pmQoQA3YtAymahzMGDuq+tpPDP
 fwtVuPUWBRVYvLmUeNl92F+qFMaffbzIv+m0zf0pWs+2jQZQK43Y6AVXk/JBOf8voLl27L
 7U+EDEpp3mvQyirEr9RnbKOE8R7tAaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-Kw7vL798OqySNre8bzL_ag-1; Thu, 16 Dec 2021 06:18:29 -0500
X-MC-Unique: Kw7vL798OqySNre8bzL_ag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B89814316;
 Thu, 16 Dec 2021 11:18:27 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35B8777457;
 Thu, 16 Dec 2021 11:17:57 +0000 (UTC)
Date: Thu, 16 Dec 2021 11:17:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Message-ID: <YbsgZDU06gcanadE@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Eb3Jnr2hq9wah9SK"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Eb3Jnr2hq9wah9SK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:35:31AM -0500, Jagannathan Raman wrote:
> @@ -114,6 +118,62 @@ static void vfu_object_set_device(Object *obj, const=
 char *str, Error **errp)
>      vfu_object_init_ctx(o, errp);
>  }
> =20
> +static void vfu_object_ctx_run(void *opaque)
> +{
> +    VfuObject *o =3D opaque;
> +    int ret =3D -1;
> +
> +    while (ret !=3D 0) {
> +        ret =3D vfu_run_ctx(o->vfu_ctx);
> +        if (ret < 0) {
> +            if (errno =3D=3D EINTR) {
> +                continue;
> +            } else if (errno =3D=3D ENOTCONN) {
> +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> +                o->vfu_poll_fd =3D -1;
> +                object_unparent(OBJECT(o));
> +                break;

If nothing else logs a message then I think that should be done here so
users know why their vfio-user server object disappeared.

> +            } else {
> +                error_setg(&error_abort, "vfu: Failed to run device %s -=
 %s",
> +                           o->device, strerror(errno));

error_abort is equivalent to assuming !o->daemon. In the case where the
user doesn't want to automatically shut down the process we need to log
a message without aborting.

> +                 break;

Indentation is off.

> +            }
> +        }
> +    }
> +}
> +
> +static void vfu_object_attach_ctx(void *opaque)
> +{
> +    VfuObject *o =3D opaque;
> +    GPollFD pfds[1];
> +    int ret;
> +
> +    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> +
> +    pfds[0].fd =3D o->vfu_poll_fd;
> +    pfds[0].events =3D G_IO_IN | G_IO_HUP | G_IO_ERR;
> +
> +retry_attach:
> +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK)) {
> +        qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
> +        goto retry_attach;

This can block the thread indefinitely. Other events like monitor
commands are not handled in this loop. Please make this asynchronous
(set an fd handler and return from this function so we can try again
later).

The vfu_attach_ctx() implementation synchronously negotiates the
vfio-user connection :(. That's a shame because even if accept(2) is
handled asynchronously, the negotiation can still block. It would be
cleanest to have a fully async libvfio-user's vfu_attach_ctx() API to
avoid blocking. Is that possible?

If libvfio-user can't make vfu_attach_ctx() fully async then it may be
possible to spawn a thread just for the blocking vfu_attach_ctx() call
and report the result back to the event loop (e.g. using EventNotifier).
That adds a bunch of code to work around a blocking API though, so I
guess we can leave the blocking part if necessary.

At the very minimum, please make EAGAIN/EWOULDBLOCK async as mentioned
above and add a comment explaining the situation with the
partially-async vfu_attach_ctx() API so it's clear that this can block
(that way it's clear that you're aware of the issue and this isn't by
accident).

> +    } else if (ret < 0) {
> +        error_setg(&error_abort,
> +                   "vfu: Failed to attach device %s to context - %s",
> +                   o->device, strerror(errno));

error_abort assumes !o->daemon. Please handle the o->daemon =3D=3D true
case by logging an error without aborting.

> +        return;
> +    }
> +
> +    o->vfu_poll_fd =3D vfu_get_poll_fd(o->vfu_ctx);
> +    if (o->vfu_poll_fd < 0) {
> +        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->dev=
ice);

Same here.

> @@ -208,6 +284,8 @@ static void vfu_object_init(Object *obj)
>                     TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
>          return;
>      }
> +
> +    o->vfu_poll_fd =3D -1;
>  }

This must call qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL)
when o->vfu_poll_fd !=3D -1 to avoid leaving a dangling fd handler
callback registered.

--Eb3Jnr2hq9wah9SK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7IGQACgkQnKSrs4Gr
c8h8XAf9GoJkngrnznwTGWoHrMzmsqwD1YXvP4B2BM9aiqR4QHjb/NPzXaD5FKv2
FdFadg0wDe5wRd8Tak5vW7FCdCD6FS+pUTrhFqhNjRZcKx1XNWpv0PVVu2hbfoDG
mKxdgAnxZLOy5+6itAQ21Fw7eFEI38lW1j/3RDzfBL5R/vhWTDfoYP1ONH9pGzvw
4uKZWDzGCe7mFRYweYlRYigagoRU15FSoRUJX/8wKhXDyGEOMjJz3MgSIHTCGX0d
u25SvqSxrMkqd+a7jwwEHAfLlMld73kvvPAlEYPQFbLRdwEpeosZTuNuhXFh1Vlh
5h1nEif6Q5bwk29fjsHGZDOtWgDDqw==
=LfAH
-----END PGP SIGNATURE-----

--Eb3Jnr2hq9wah9SK--


