Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0E3F615F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:16:17 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIY9w-0007Z0-SQ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIY8h-0006ie-F0
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIY8f-0006WX-Mi
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629818097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EvpZHvviDCz94XAPB2ZQZaHhauf9bRudr+Y7dHZ0sAY=;
 b=gKdBYKwcGAv47PRPdEwOvrK+gQqZ72EPPjDNP7A7F9Bf4pp/WZcZ6MwMp9/+SsyaoNblVH
 vmrCdn/HMJXjzsnft0Nt13b3FwpLzstTeIosGDIsUsWPNyafiQQlM4qkX6Q6tlsdK1sR2Z
 ce8KLLXh1dORWp086OooBhpkV1FZIzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-OP52OdrUNI2VIgZyyBOAXA-1; Tue, 24 Aug 2021 11:14:53 -0400
X-MC-Unique: OP52OdrUNI2VIgZyyBOAXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04228871471;
 Tue, 24 Aug 2021 15:14:52 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB71118436;
 Tue, 24 Aug 2021 15:14:48 +0000 (UTC)
Date: Tue, 24 Aug 2021 16:14:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 05/16] vfio-user: define VFIO Proxy and
 communication functions
Message-ID: <YSUM5wB+XAd/WmM0@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <3d3befd308bacb7ec9f3ccd8f99e5184261279b2.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <3d3befd308bacb7ec9f3ccd8f99e5184261279b2.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="64cOiYAwEdEZ1qci"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--64cOiYAwEdEZ1qci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:38AM -0700, Elena Ufimtseva wrote:
> @@ -62,5 +65,10 @@ typedef struct VFIOProxy {
> =20
>  VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
>  void vfio_user_disconnect(VFIOProxy *proxy);
> +void vfio_user_set_reqhandler(VFIODevice *vbasdev,

"vbasedev" for consistency?

> +                              int (*handler)(void *opaque, char *buf,
> +                                             VFIOUserFDs *fds),
> +                                             void *reqarg);

The handler callback is undocumented. What context does it run in, what
do the arguments mean, and what should the function return? Please
document it so it's easy for others to modify this code in the future
without reverse-engineering the assumptions behind it.

> +void vfio_user_recv(void *opaque)
> +{
> +    VFIODevice *vbasedev =3D opaque;
> +    VFIOProxy *proxy =3D vbasedev->proxy;
> +    VFIOUserReply *reply =3D NULL;
> +    g_autofree int *fdp =3D NULL;
> +    VFIOUserFDs reqfds =3D { 0, 0, fdp };
> +    VFIOUserHdr msg;
> +    struct iovec iov =3D {
> +        .iov_base =3D &msg,
> +        .iov_len =3D sizeof(msg),
> +    };
> +    bool isreply;
> +    int i, ret;
> +    size_t msgleft, numfds =3D 0;
> +    char *data =3D NULL;
> +    g_autofree char *buf =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    qemu_mutex_lock(&proxy->lock);
> +    if (proxy->state =3D=3D VFIO_PROXY_CLOSING) {
> +        qemu_mutex_unlock(&proxy->lock);
> +        return;
> +    }
> +
> +    ret =3D qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
> +                                 &local_err);

This is a blocking call. My understanding is that the IOThread is shared
by all vfio-user devices, so other devices will have to wait if one of
them is acting up (e.g. the device emulation process sent less than
sizeof(msg) bytes).

While we're blocked in this function the proxy device cannot be
hot-removed since proxy->lock is held.

It would more robust to use of the event loop to avoid blocking. There
could be a per-connection receiver coroutine that calls
qio_channel_readv_full_all_eof() (it yields the coroutine if reading
would block).

> +    /*
> +     * Replies signal a waiter, requests get processed by vfio code
> +     * that may assume the iothread lock is held.
> +     */
> +    if (isreply) {
> +        reply->complete =3D 1;
> +        if (!reply->nowait) {
> +            qemu_cond_signal(&reply->cv);
> +        } else {
> +            if (msg.flags & VFIO_USER_ERROR) {
> +                error_printf("vfio_user_rcv error reply on async request=
 ");
> +                error_printf("command %x error %s\n", msg.command,
> +                             strerror(msg.error_reply));
> +            }
> +            /* just free it if no one is waiting */
> +            reply->nowait =3D 0;
> +            if (proxy->last_nowait =3D=3D reply) {
> +                proxy->last_nowait =3D NULL;
> +            }
> +            g_free(reply->msg);
> +            QTAILQ_INSERT_HEAD(&proxy->free, reply, next);
> +        }
> +        qemu_mutex_unlock(&proxy->lock);
> +    } else {
> +        qemu_mutex_unlock(&proxy->lock);
> +        qemu_mutex_lock_iothread();

The fact that proxy->request() runs with the BQL suggests that VFIO
communication should take place in the main event loop thread instead of
a separate IOThread.

> +        /*
> +         * make sure proxy wasn't closed while we waited
> +         * checking state without holding the proxy lock is safe
> +         * since it's only set to CLOSING when BQL is held
> +         */
> +        if (proxy->state !=3D VFIO_PROXY_CLOSING) {
> +            ret =3D proxy->request(proxy->reqarg, buf, &reqfds);

The request() callback in an earlier patch is a noop for the client
implementation. Who frees passed fds?

> +            if (ret < 0 && !(msg.flags & VFIO_USER_NO_REPLY)) {
> +                vfio_user_send_reply(proxy, buf, ret);
> +            }
> +        }
> +        qemu_mutex_unlock_iothread();
> +    }
> +    return;
> +
> +fatal:
> +    vfio_user_shutdown(proxy);
> +    proxy->state =3D VFIO_PROXY_RECV_ERROR;
> +
> +err:
> +    for (i =3D 0; i < numfds; i++) {
> +        close(fdp[i]);
> +    }
> +    if (reply !=3D NULL) {
> +        /* force an error to keep sending thread from hanging */
> +        reply->msg->flags |=3D VFIO_USER_ERROR;
> +        reply->msg->error_reply =3D EINVAL;
> +        reply->complete =3D 1;
> +        qemu_cond_signal(&reply->cv);

What about fd passing? The actual fds have been closed already in fdp[]
but reply has a copy too.

What about the nowait case? If no one is waiting on reply->cv so this
reply will be leaked?

Stefan

--64cOiYAwEdEZ1qci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmElDOcACgkQnKSrs4Gr
c8go/wgAo1sznAYqOIoe8m5qZYO6bPJzzHljgg0Cv/GIcfSzfGY7zccUS5DNGRF5
WxmYFwRsmFrfAZZOVytL4EmLigQFuwre3W/Yw63VNRx7/7y6e0CT2HDBZu+Pvj56
AJJyiYFyh+VAUUTSHX6lW3510I3IkVRtzJNYatDJrf2elOxvzm14fPYFPQjj4qoc
JvLipPTbe5gfm7v7qZGdrtibdiSC5nnCSe52sLjsEHYuExm9Tg1+EKXxR4sxzet2
EZeitnhuriDmfJlzlPAH0VnZnu1ZNHDW40RYEt222HyeL/x1dylBXlZ8aETU6aia
EHOuxC5Xpp9yFsDjcwKKSXRUcf1zEQ==
=5V5W
-----END PGP SIGNATURE-----

--64cOiYAwEdEZ1qci--


