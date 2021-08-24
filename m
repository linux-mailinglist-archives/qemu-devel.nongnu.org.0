Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F213F6011
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:20:00 +0200 (CEST)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXHN-00017s-RJ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIXDD-00070M-TG
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIXD9-0007Tk-LQ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xDv5ejb+W/XTZVyCou+qADyMe4qItRqsroYUvQY1OUk=;
 b=FbQJGrDCdPEluGEOyIegHdD9VeRG9+5MNekkOP9M21GmKJFHpUggyFEe4m2wrWb6hRI0ML
 9kdkb0Q8pQWlIxQmY2uZGcraIwvh8bkcAgFxd8BsMpSLyIR7q4ygMV5/sZS8mzDggZZhBa
 6uKy1Dven61I0gI1IWEBhluOI90ULo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-tWAtrZVyMpClk6b5HuSWiQ-1; Tue, 24 Aug 2021 10:15:27 -0400
X-MC-Unique: tWAtrZVyMpClk6b5HuSWiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A9878015C7;
 Tue, 24 Aug 2021 14:15:26 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF4560C0F;
 Tue, 24 Aug 2021 14:15:21 +0000 (UTC)
Date: Tue, 24 Aug 2021 15:15:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote
 server
Message-ID: <YST++FLqV02TlusW@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YUiGnoI7gfDcO6kH"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--YUiGnoI7gfDcO6kH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:37AM -0700, Elena Ufimtseva wrote:
> @@ -3361,13 +3362,35 @@ static void vfio_user_pci_realize(PCIDevice *pdev=
, Error **errp)
>      VFIOUserPCIDevice *udev =3D VFIO_USER_PCI(pdev);
>      VFIOPCIDevice *vdev =3D VFIO_PCI_BASE(pdev);
>      VFIODevice *vbasedev =3D &vdev->vbasedev;
> +    SocketAddress addr;
> +    VFIOProxy *proxy;
> +    Error *err =3D NULL;
> =20
> +    /*
> +     * TODO: make option parser understand SocketAddress
> +     * and use that instead of having scaler options

s/scaler/scalar/

> +VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
> +{
> +    VFIOProxy *proxy;
> +    QIOChannelSocket *sioc;
> +    QIOChannel *ioc;
> +    char *sockname;
> +
> +    if (addr->type !=3D SOCKET_ADDRESS_TYPE_UNIX) {
> +        error_setg(errp, "vfio_user_connect - bad address family");
> +        return NULL;
> +    }
> +    sockname =3D addr->u.q_unix.path;
> +
> +    sioc =3D qio_channel_socket_new();
> +    ioc =3D QIO_CHANNEL(sioc);
> +    if (qio_channel_socket_connect_sync(sioc, addr, errp)) {
> +        object_unref(OBJECT(ioc));
> +        return NULL;
> +    }
> +    qio_channel_set_blocking(ioc, true, NULL);
> +
> +    proxy =3D g_malloc0(sizeof(VFIOProxy));
> +    proxy->sockname =3D sockname;

sockname is addr->u.q_unix.path, so there's an assumption that the
lifetime of the addr argument is at least as long as the proxy object's
lifetime. This doesn't seem to be the case in vfio_user_pci_realize()
since the SocketAddress variable is declared on the stack.

I suggest making SocketAddress *addr const so it's obvious that this
function just reads it (doesn't take ownership of the pointer) and
copying the UNIX domain socket path with g_strdup() to avoid the
dangling pointer.

> +    proxy->ioc =3D ioc;
> +    proxy->flags =3D VFIO_PROXY_CLIENT;
> +    proxy->state =3D VFIO_PROXY_CONNECTED;
> +    qemu_cond_init(&proxy->close_cv);
> +
> +    if (vfio_user_iothread =3D=3D NULL) {
> +        vfio_user_iothread =3D iothread_create("VFIO user", errp);
> +    }

Why is a dedicated IOThread needed for VFIO user?

> +
> +    qemu_mutex_init(&proxy->lock);
> +    QTAILQ_INIT(&proxy->free);
> +    QTAILQ_INIT(&proxy->pending);
> +    QLIST_INSERT_HEAD(&vfio_user_sockets, proxy, next);
> +
> +    return proxy;
> +}
> +

/* Called with the BQL */
> +void vfio_user_disconnect(VFIOProxy *proxy)
> +{
> +    VFIOUserReply *r1, *r2;
> +
> +    qemu_mutex_lock(&proxy->lock);
> +
> +    /* our side is quitting */
> +    if (proxy->state =3D=3D VFIO_PROXY_CONNECTED) {
> +        vfio_user_shutdown(proxy);
> +        if (!QTAILQ_EMPTY(&proxy->pending)) {
> +            error_printf("vfio_user_disconnect: outstanding requests\n")=
;
> +        }
> +    }
> +    object_unref(OBJECT(proxy->ioc));
> +    proxy->ioc =3D NULL;
> +
> +    proxy->state =3D VFIO_PROXY_CLOSING;
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->pending, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->pending, r1, next);
> +        g_free(r1);
> +    }
> +    QTAILQ_FOREACH_SAFE(r1, &proxy->free, next, r2) {
> +        qemu_cond_destroy(&r1->cv);
> +        QTAILQ_REMOVE(&proxy->free, r1, next);
> +        g_free(r1);
> +    }
> +
> +    /*
> +     * Make sure the iothread isn't blocking anywhere
> +     * with a ref to this proxy by waiting for a BH
> +     * handler to run after the proxy fd handlers were
> +     * deleted above.
> +     */
> +    proxy->close_wait =3D 1;

Please use true. '1' is shorter but it's less obvious to the reader (I
had to jump to the definition to check whether this field was bool or
int).

> +    aio_bh_schedule_oneshot(iothread_get_aio_context(vfio_user_iothread)=
,
> +                            vfio_user_cb, proxy);
> +
> +    /* drop locks so the iothread can make progress */
> +    qemu_mutex_unlock_iothread();

Why does the BQL needs to be dropped so vfio_user_iothread can make
progress?

> +    qemu_cond_wait(&proxy->close_cv, &proxy->lock);

--YUiGnoI7gfDcO6kH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk/vgACgkQnKSrs4Gr
c8glAwf+OxUQcbbnLFnIsJ08X4QpruGPnh43bwDEsJjhc/IhIA/mw4w2MzgCADZS
JHop7szbZjNlvVI7cpDlGY3DU4mn6HScZrcKky6Xih8O4GeClfV0d9gUptynlvwl
3MXAba66z9qOiOtqZvajSPyqU/jv5S7Bo9KwHrCQh0vdRzs5IZ/31GgugUQ6NJ2q
7IPqFAhhTwUtqWzIa4g7xGpww+W+54McKk9iAKM7jNytLvudR++0GIpGVzZLJeZd
4dxPGAtQfjM35ZVmUxx8SMnT9/01WNMqcV0lVOf/5Zp4lg5lBFR57tvQ7ZroQWdM
ke8tbxmpoZPlMnpEputYGvaBap9/UQ==
=3Mco
-----END PGP SIGNATURE-----

--YUiGnoI7gfDcO6kH--


