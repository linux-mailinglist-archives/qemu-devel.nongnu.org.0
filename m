Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86252AF50F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:38:11 +0100 (CET)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsCI-0001OA-OP
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcsAc-00008O-AW
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcsAW-0001TJ-FF
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605108978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ck4DlLdeAJKherIPAuxnFd9VJx6ju1NpoGFYq0yJnlM=;
 b=c/UqNTs4p0h9zdFC1FBqC862haDU2Gnsdm62tcomdM/GmH9W0R63cPV4KDoHH3soegSi20
 +Zmg8BIAhQXcTBcJ6o4tdC9/wURhx5uZpmNPscrtVPppKmE3O4JFhx1TrbzismcucOG6gX
 i4EGcaCaXXOtV7X4CP+ax/3YP6c+WnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-zflh7zOuOFajbCtErTr4TA-1; Wed, 11 Nov 2020 10:36:14 -0500
X-MC-Unique: zflh7zOuOFajbCtErTr4TA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A047C86ABD0;
 Wed, 11 Nov 2020 15:36:12 +0000 (UTC)
Received: from gondolin (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52D625DA79;
 Wed, 11 Nov 2020 15:35:57 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:35:43 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111163543.2839e4c7.cohuck@redhat.com>
In-Reply-To: <20201111151449.GC1421166@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111124853.5a7fa359.cohuck@redhat.com>
 <20201111151449.GC1421166@stefanha-x1.localdomain>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; boundary="Sig_/._LWdxpmEmdb5+B5.SujERB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/._LWdxpmEmdb5+B5.SujERB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2020 15:14:49 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Nov 11, 2020 at 12:48:53PM +0100, Cornelia Huck wrote:
> > On Tue, 10 Nov 2020 13:14:04 -0700
> > Alex Williamson <alex.williamson@redhat.com> wrote: =20
> > > On Tue, 10 Nov 2020 09:53:49 +0000
> > > Stefan Hajnoczi <stefanha@redhat.com> wrote: =20
> >  =20
> > > > Device models supported by an mdev driver and their details can be =
read from
> > > > the migration_info.json attr. Each mdev type supports one device mo=
del. If a
> > > > parent device supports multiple device models then each device mode=
l has an
> > > > mdev type. There may be multiple mdev types for a single device mod=
el when they
> > > > offer different migration parameters such as resource capacity or f=
eature
> > > > availability.
> > > >=20
> > > > For example, a graphics card that supports 4 GB and 8 GB device ins=
tances would
> > > > provide gfx-4GB and gfx-8GB mdev types with memory=3D4096 and memor=
y=3D8192
> > > > migration parameters, respectively.   =20
> > >=20
> > >=20
> > > I think this example could be expanded for clarity.  I think this is
> > > suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
> > > implement some common device model, ie. com.gfx/GPU, where the
> > > migration parameter 'memory' for each defaults to a value matching th=
e
> > > type name.  But it seems like this can also lead to some combinatoria=
l
> > > challenges for management tools if these parameters are writable.  Fo=
r
> > > example, should a management tool create a gfx-4GB device and change =
to
> > > memory parameter to 8192 or a gfx-8GB device with the default paramet=
er? =20
> >=20
> > I would expect that the mdev types need to match in the first place.
> > What role would the memory=3D parameter play, then? Allowing gfx-4GB to
> > have memory=3D8192 feels wrong to me. =20
>=20
> Yes, I expected these mdev types to only accept a fixed "memory" value,
> but there's nothing stopping a driver author from making "memory" accept
> any value.

I'm wondering how useful the memory parameter is, then. The layer
checking for compatibility can filter out inconsistent settings, but
why would we need to express something that is already implied in the
mdev type separately?

>=20
> > > > An open mdev device typically does not allow migration parameters t=
o be changed
> > > > at runtime. However, certain migration/params attrs may allow write=
s at
> > > > runtime. Usually these migration parameters only affect the device =
state
> > > > representation and not the hardware interface. This makes it possib=
le to
> > > > upgrade or downgrade the device state representation at runtime so =
that
> > > > migration is possible to newer or older device implementations.   =
=20
> >=20
> > This refers to generation of device implementations, but not to dynamic
> > configuration changes. Maybe I'm just confused by this sentence, but
> > how are we supposed to get changes while the mdev is live across? =20
>=20
> This is about dynamic configuration changes. For example, if a field was
> forgotten in the device state representation then a migration parameter
> can be added to enable the fix. When the parameter is off the device
> state is incomplete but migration to old device implementations still
> works. An old device can be migrated to a new device implementation with
> the parameter turned off. And then you can safely enable the migration
> parameter at runtime without powering off the guest because it's purely
> a device state representation change, not a hardware interface change
> that would disturb the guest.
>=20
> This is kind of similar to QEMU migration subsections.

Ok, I was a bit confused here.

So, we build the stream with the then-current parameters? How is the
compat-checking layer supposed to deal with parameters changing after
the check -- is it a "you get to keep the pieces" situation?

--Sig_/._LWdxpmEmdb5+B5.SujERB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl+sBNAACgkQ3s9rk8bw
L6/VQQ/+MHIirJX3lES0i70K2OlrNpdylJ5C3ve0ymCACuCDTlFWgfyJiWQTUSOy
aolzm8K5q4tkDyqvYKihZStZKN/Y4ovjIJs9Yw8xdGs6SXNvM0xzw0uoVzURFzKj
YGaHnrFCIY74bNwtNmz3oZpTcoK9ITinibNAxfpp0soJDFPv7rqsmQy7p4vKlIDf
isJ7C3Wdy5WcEn+3Xc3+jsTOnn6mzFU6fKmbSznY1szskXQvJyUxRdIiRCXKTjHO
F5wC3ZbmJC731P41mh4VRlup0Cm0pdARWmsVtEqs5EmNhR6PIePnOWLksINzLNsR
zBZRd/R9ablRbX4KoVRuzvDRzuPT7+LDPpooJxXKvoh1a8Iplbqj8vkXBXJxY9BF
cQHJ2lj9shrNzZ+1gSz/oVzsUFV3wiYQwXXLduC0Felujmbja1c4Q2t2KgQbSOQb
WpGs77CuvQaOGjhkiDvCuup+uAxVOVi+HIAFfoinkR1sXBjlh2oUbqyLSyWwAdK4
LdLUfBvbxqqh5M/rWcKFR5vJltYffcGGipNdPt4B+te6/E7y2Br4zusqo50VUfGR
qnMyCzlzwCtlgY75QRM4bNy08MVyetiH6bTsVQvoQVgVLm8pjb9xSa3nGYZAzN/p
kieiCuk2dIE5ojl0b/PKkmrjvGkTj9yTYKBuelTb5zAA7gzcaeI=
=cHEN
-----END PGP SIGNATURE-----

--Sig_/._LWdxpmEmdb5+B5.SujERB--


