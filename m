Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AD476D84
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:36:47 +0100 (CET)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnBt-00059d-NQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxn92-0003Ak-Tf
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:33:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxn91-0005XB-I6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639647227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j22Ow4wxdJqqQ11TGkXPtt8Cm/zwrypXO4NPqYVvLfc=;
 b=F1fJGfUMszXsnVww4ocG24GdY4BtEGoNB9W2/5FYQfxHMww7OdWXLdOoiVpsMXzBYQSoJ2
 tFy3NJ2yZ2Tpw3bTU6WbS8qPTZuOsJ/olXD5evN3wzob0QYqVF+BktT2VdQcm5uLIfoZuA
 Cr9R5NpYqkuNVnOxrk80mxpS2HLx/jU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-InPHbztPN0aMezmDr46iBg-1; Thu, 16 Dec 2021 04:33:43 -0500
X-MC-Unique: InPHbztPN0aMezmDr46iBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F46802C92;
 Thu, 16 Dec 2021 09:33:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5DC784FF6;
 Thu, 16 Dec 2021 09:33:31 +0000 (UTC)
Date: Thu, 16 Dec 2021 09:33:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Message-ID: <YbsH6lrcL9RIrSxR@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NYM9Et6g6QJf0qVT"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NYM9Et6g6QJf0qVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:35:28AM -0500, Jagannathan Raman wrote:
> diff --git a/qapi/qom.json b/qapi/qom.json
> index ccd1167808..6001a9b8f0 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -703,6 +703,20 @@
>  { 'struct': 'RemoteObjectProperties',
>    'data': { 'fd': 'str', 'devid': 'str' } }
> =20
> +##
> +# @VfioUserServerProperties:
> +#
> +# Properties for x-vfio-user-server objects.
> +#
> +# @socket: socket to be used by the libvfiouser library
> +#
> +# @device: the id of the device to be emulated at the server
> +#
> +# Since: 6.2

6.2 has been released so the version number needs to be incremented.

> +struct VfuObjectClass {
> +    ObjectClass parent_class;
> +
> +    unsigned int nr_devs;
> +
> +    bool daemon;

I was wondering what this means. auto_shutdown might be a clearer name.

> +static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    VfuObject *o =3D VFU_OBJECT(obj);
> +
> +    qapi_free_SocketAddress(o->socket);
> +
> +    o->socket =3D NULL;
> +
> +    visit_type_SocketAddress(v, name, &o->socket, errp);
> +
> +    if (o->socket->type !=3D SOCKET_ADDRESS_TYPE_UNIX) {
> +        qapi_free_SocketAddress(o->socket);
> +        o->socket =3D NULL;
> +        error_setg(errp, "vfu: Unsupported socket type - %s",
> +                   o->socket->u.q_unix.path);

s/o->socket->u.q_unix.path/SocketAddressType_str(o->socket->type)/

--NYM9Et6g6QJf0qVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7B+oACgkQnKSrs4Gr
c8gzlgf+KbHDvvTTqEos/w1ZQ9eH8s+M0oC1CBP5yI3C2S2ygcb9/0jod/uARy2b
MPwTpmE2jTO40bX9wCaxMSfpKNsul7ux1eg9AdwMZKWOM0XuptLB+g2Z/AZ+6OhD
/QIG5m/im+8FXtsdLs0qsfMWBLdvL12RI+sa9WgHBplUKdweXC5tmwrv/4rrnebT
42KQzcAUNBr6G4fy0CVUStlRiwSHemAGpsyrPpfgaNE0Nw4tK75uB5STEPjevgXl
ER4VoSYwAEoAHkJMLT06vmJ6YF33wLS8egY0/c1XueOZmNx36ip+usbQRb+U5oyr
r1oypfHT8LpzZiqor0xsHce8Sbagvw==
=oBzo
-----END PGP SIGNATURE-----

--NYM9Et6g6QJf0qVT--


