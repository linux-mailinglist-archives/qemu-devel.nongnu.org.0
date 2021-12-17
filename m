Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AFC478630
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 09:29:48 +0100 (CET)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my8cd-0005qi-8e
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 03:29:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1my8bC-0004QP-3Q
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:28:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1my8b9-0003mp-6V
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:28:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639729694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VmLK7BUmWePxm+v4o6uX2iVSKJ5svdeatNecJhZbHOY=;
 b=C61PQvPjYbUMttbTX08FoyaB9cDLBdzdfDNJ2fBM5Skz9obrzxh9oA5r9ey1wJg5W6jEDg
 ppAMr2VFleQ7oiMYb12rJEiBJDYoADnjICWDbwjq2KpT58mhbVwyXY9dxjBKBYXPe/Rdom
 zM93H56T++p5KyoGBi5b5oqfEDLPFyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-kXbVNQTPOIqBPMbIxWs6Fg-1; Fri, 17 Dec 2021 03:28:11 -0500
X-MC-Unique: kXbVNQTPOIqBPMbIxWs6Fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C28A180E49D;
 Fri, 17 Dec 2021 08:28:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A362B70D33;
 Fri, 17 Dec 2021 08:28:08 +0000 (UTC)
Date: Fri, 17 Dec 2021 08:28:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Message-ID: <YbxKF/W94Z6bzlEY@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
 <YbsN3CLL827zMvna@stefanha-x1.localdomain>
 <62537D98-BE2F-446C-9596-34266EC3D535@oracle.com>
MIME-Version: 1.0
In-Reply-To: <62537D98-BE2F-446C-9596-34266EC3D535@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pJqlSp+RmSWdx1HP"
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pJqlSp+RmSWdx1HP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 02:31:14AM +0000, Jag Raman wrote:
>=20
>=20
> > On Dec 16, 2021, at 4:58 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Dec 15, 2021 at 10:35:28AM -0500, Jagannathan Raman wrote:
> >> +static void vfu_object_set_socket(Object *obj, Visitor *v, const char=
 *name,
> >> +                                  void *opaque, Error **errp)
> >> +{
> >> +    VfuObject *o =3D VFU_OBJECT(obj);
> >> +
> >> +    qapi_free_SocketAddress(o->socket);
> >> +
> >> +    o->socket =3D NULL;
> >> +
> >> +    visit_type_SocketAddress(v, name, &o->socket, errp);
> >> +
> >> +    if (o->socket->type !=3D SOCKET_ADDRESS_TYPE_UNIX) {
> >> +        qapi_free_SocketAddress(o->socket);
> >> +        o->socket =3D NULL;
> >> +        error_setg(errp, "vfu: Unsupported socket type - %s",
> >> +                   o->socket->u.q_unix.path);
> >> +        return;
> >> +    }
> >> +
> >> +    trace_vfu_prop("socket", o->socket->u.q_unix.path);
> >> +}
> >> +
> >> +static void vfu_object_set_device(Object *obj, const char *str, Error=
 **errp)
> >> +{
> >> +    VfuObject *o =3D VFU_OBJECT(obj);
> >> +
> >> +    g_free(o->device);
> >> +
> >> +    o->device =3D g_strdup(str);
> >> +
> >> +    trace_vfu_prop("device", str);
> >> +}
> >=20
> > It appears "socket" and "device" can be changed after the
> > vfio-user server has started. In the best case it just means the
> > properties contain values that do not reflect the actual socket/device
> > currently in use, which is confusing.
>=20
> I=E2=80=99m not sure about the scenario in which that would occur, but wi=
ll add that check.

Properties can be modified using the qom-set monitor command. This can
happen any time.

Stefan

--pJqlSp+RmSWdx1HP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG8ShcACgkQnKSrs4Gr
c8gzJwf8Dc/6pcQ2mk4iVMyV+8JjJn3cSep1KFZQPAd1z6He0+yO+b9lcbsrhK5Y
C4noJ7E01FzxIvoTLI1+RUZDd3bks6GEMIRWyaTboiJANZII8Wiyro42odn1SY53
+msEb31GN1M3qCYiamQNCOZTYdxMNPtFxRPYQxTceiQGUYx/nfFF0GRzR7fvJDuz
BvyUJ4DoFGqs41e/SUBJtaDyOc9brJCwzzN5CRp3AdRHeMGQSKGd5aZdXf+H5PSX
fznhHMK5FLFZvaWrrd1f/iFhWnyVuB+KtJAtUTMvE0NaLpsYsrdCW2U3pMLJ7G4a
puis5L+qbG6nCqnjjK+9IP5DGO/fgg==
=jaHI
-----END PGP SIGNATURE-----

--pJqlSp+RmSWdx1HP--


