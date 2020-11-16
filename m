Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E42B450F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:54:36 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keexn-0002cr-Iw
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1keewX-00029Q-Qq
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:53:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1keewV-0000xm-W4
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605534795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuxhq81LLICAmN2BrYqwgAYPfgcMLBNEcLRe1Zzt3SY=;
 b=iYxHmoTYAGmF5pV6ZfY9UPq1vfGnKFWaws/BdkzuEkp++0FtPriCgcoPmGMOAdCYWU2ZRp
 xdPBNCmAvn8QyRmUSpivsDRBRa8JxrsxsVa8cDyvax4jXJBnjivV1jLs8jrB90/7engfzB
 4j7m0fP/KqXtJjZY5Ygwn3IjdrpyYD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-ZtIarDEdNdSUvfknmd-aKw-1; Mon, 16 Nov 2020 08:53:11 -0500
X-MC-Unique: ZtIarDEdNdSUvfknmd-aKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C2D803F44;
 Mon, 16 Nov 2020 13:53:09 +0000 (UTC)
Received: from gondolin (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10B2070106;
 Mon, 16 Nov 2020 13:52:49 +0000 (UTC)
Date: Mon, 16 Nov 2020 14:52:26 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116145226.57139a21.cohuck@redhat.com>
In-Reply-To: <20201116110251.GC96297@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
 <20201111124853.5a7fa359.cohuck@redhat.com>
 <20201111151449.GC1421166@stefanha-x1.localdomain>
 <20201111163543.2839e4c7.cohuck@redhat.com>
 <20201116110251.GC96297@stefanha-x1.localdomain>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; boundary="Sig_/msf5pyWXE3ZxE_pmjXx.2//";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
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

--Sig_/msf5pyWXE3ZxE_pmjXx.2//
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2020 11:02:51 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Wed, Nov 11, 2020 at 04:35:43PM +0100, Cornelia Huck wrote:
> > On Wed, 11 Nov 2020 15:14:49 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >  =20
> > > On Wed, Nov 11, 2020 at 12:48:53PM +0100, Cornelia Huck wrote: =20
> > > > On Tue, 10 Nov 2020 13:14:04 -0700
> > > > Alex Williamson <alex.williamson@redhat.com> wrote:   =20
> > > > > On Tue, 10 Nov 2020 09:53:49 +0000
> > > > > Stefan Hajnoczi <stefanha@redhat.com> wrote:   =20
> > > >    =20
> > > > > > Device models supported by an mdev driver and their details can=
 be read from
> > > > > > the migration_info.json attr. Each mdev type supports one devic=
e model. If a
> > > > > > parent device supports multiple device models then each device =
model has an
> > > > > > mdev type. There may be multiple mdev types for a single device=
 model when they
> > > > > > offer different migration parameters such as resource capacity =
or feature
> > > > > > availability.
> > > > > >=20
> > > > > > For example, a graphics card that supports 4 GB and 8 GB device=
 instances would
> > > > > > provide gfx-4GB and gfx-8GB mdev types with memory=3D4096 and m=
emory=3D8192
> > > > > > migration parameters, respectively.     =20
> > > > >=20
> > > > >=20
> > > > > I think this example could be expanded for clarity.  I think this=
 is
> > > > > suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
> > > > > implement some common device model, ie. com.gfx/GPU, where the
> > > > > migration parameter 'memory' for each defaults to a value matchin=
g the
> > > > > type name.  But it seems like this can also lead to some combinat=
orial
> > > > > challenges for management tools if these parameters are writable.=
  For
> > > > > example, should a management tool create a gfx-4GB device and cha=
nge to
> > > > > memory parameter to 8192 or a gfx-8GB device with the default par=
ameter?   =20
> > > >=20
> > > > I would expect that the mdev types need to match in the first place=
.
> > > > What role would the memory=3D parameter play, then? Allowing gfx-4G=
B to
> > > > have memory=3D8192 feels wrong to me.   =20
> > >=20
> > > Yes, I expected these mdev types to only accept a fixed "memory" valu=
e,
> > > but there's nothing stopping a driver author from making "memory" acc=
ept
> > > any value. =20
> >=20
> > I'm wondering how useful the memory parameter is, then. The layer
> > checking for compatibility can filter out inconsistent settings, but
> > why would we need to express something that is already implied in the
> > mdev type separately? =20
>=20
> To avoid tying device instances to specific mdev types. An mdev type is
> a device implementation, but the goal is to enable migration between
> device implementations (new/old or completely different
> implementations).
>=20
> Imagine a new physical device that now offers variable memory because
> users found the static mdev types too constraining.  How do you migrate
> back and forth between new and old physical devices if the migration
> parameters don't describe the memory size? Migration parameters make it
> possible. Without them the management tool needs to hard-code knowledge
> of specific mdev types that support migration.

But doesn't the management tool *still* need to keep hardcoded
information about what the value of that memory parameter was for an
existing mdev type? If we have gfx-variable with a memory parameter,
fine; but if the target is supposed to accept a gfx-4GB device, it
should simply instantiate a gfx-4GB device.

I'm getting a bit worried about the complexity of the checking that
management software is supposed to perform. Is it really that bad to
restrict the models to a few, well-defined ones? Especially in the mdev
case, where we have control about what is getting instantiated?

--Sig_/msf5pyWXE3ZxE_pmjXx.2//
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAl+yhBoACgkQ3s9rk8bw
L6/FIw//cVOaB44TqAIstVIyT+8HteZY06wD6s/LAAA2+HNbKzpu4fWRcBb4JqP3
ekBINB2yWXvpieLKCFgGYAFGGHSeXt/vy8IPmJ7LCx8A5c0C5893PWVS6bt6FWjY
syK32iiy0bXmQE289lNpscMQv03vLANQ3gJx9Z6pkC9o03EwsCcHnlOMsPIWHJY9
gqOWDmEkQz1MA1tnvoh2ZZm9Uit7ycjvACcuqYyLrx93lNdqMZ3OzT7UJv43OrVb
eKuTHz6DSovXIRIeeDqaUtZ5lmegW3QXOefKKJrotlfM27hi+FDpDCXsnzxwknPa
9+pKoQ3KB+Q3RMG4FfVDJkdUOnpQLdW0tn0t1XfDolDlsNrosRPTgk025kLTzHlg
RczP0dgqZ1FvaMhv/KKCM/QDWsl82YWo2kzNQfetlQ+9pM7NawVE1Y9UAPO2dR4g
UPQ9tjtTkkRh+4N2ZcKzmCC9VRwD2TvsFvvGVdiKEVF96FmfdpejT1neb5S007I9
lHQqtYTmuyUFh6X48S9CYlbzMLn6ugSIoBuPQgr5HC5P+mS/ItMZKPllwlRdYHbQ
rl2XoCIL8TwdgjJtHWdS+BEKJFvhapKO79TdoTgBLSvuyYkejUGk3e/Qu81j8Krq
1exmmmH4aoUo5AWFreLOpWjhX61ASUuO6uwu1ziFLH16tEVp7/E=
=U+Lh
-----END PGP SIGNATURE-----

--Sig_/msf5pyWXE3ZxE_pmjXx.2//--


