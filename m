Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D292B426F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:18:26 +0100 (CET)
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecWf-0002vd-53
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kecU1-0000oi-UV
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kecU0-0003vH-3n
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ApaK5AkBqBKx+JodcELvhV+KMBGbiR+yxgABC+3SgeI=;
 b=WC2OCkXKC+Rr7fvZQNnW6mRiViM8BValhUv3QEZJNNDOBI12nHBcwZN0a+zin9ertwpvMX
 1iyEpr6p0O9sdTIWOR8k3rx0wgC8lURw9tkE9X0HdYkgneZEoIX7CjAdt1ZTbYxs0uUmQf
 UI1AnJPf/jPdbF4NiCJphQt80nfQTeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-X_M8aC6XMjiwnCPRBxOwzA-1; Mon, 16 Nov 2020 06:15:37 -0500
X-MC-Unique: X_M8aC6XMjiwnCPRBxOwzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D741F11BD341;
 Mon, 16 Nov 2020 11:15:35 +0000 (UTC)
Received: from localhost (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 658FC5D9CC;
 Mon, 16 Nov 2020 11:15:25 +0000 (UTC)
Date: Mon, 16 Nov 2020 11:15:24 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116111524.GD96297@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111154850.GG906488@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
 Yan Zhao <yan.y.zhao@intel.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 03:48:50PM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Nov 11, 2020 at 02:36:15PM +0000, Stefan Hajnoczi wrote:
> > On Tue, Nov 10, 2020 at 12:12:31PM +0100, Paolo Bonzini wrote:
> > > On 10/11/20 10:53, Stefan Hajnoczi wrote:
> > Yes, the current syntax supports sparse ranges and multiple ranges.
> >=20
> > The trade-off is that a tool cannot validate inputs beforehand. You nee=
d
> > to instantiate the device to see if it accepts your inputs. This is not
> > great for management tools because they cannot select a destination
> > device if they don't know which exact values are supported.
> >=20
> > Daniel Berrange raised this requirement in a previous revision, so I
> > wonder what his thoughts are?
>=20
> In terms of validation I can't help but feel the whole proposal is
> really very complicated.
>=20
> In validating QEMU migration compatibility we merely compare the
> versioned machine type.

Thinking more about this, maybe the big picture is:

Today the managment tool controls the variables in the migration (the
device configuration). It has knowledge of the VMM, can set a machine
type, apply a device configuration on top, and then migrate safely.

VFIO changes this model because VMMs and management tools do not have
knowledge of specific device implementations. The device implementation
is a new source of variables in the migration and the management tool no
longer has the full picture.

I'm trying to define a standard interface for exposing migration
compatibility information from device implementations to management
tools, and a general algorithm that management tools can use without
knowledge of specific device implementations.

It is possible to simplify the problem, but we'll lose freedom. For
example, hard coding knowledge of the device implementation into the
management tool eliminates the need for a general migration checking
algorithm. Or we might be able to simplify it by explicitly not
supporting cross-device implementation migration (although that would
place stricter rules on what a new version of an existing device can
change in order to preserve migration compatibility).

I have doubts that these trade-offs can be made without losing support
for use cases that are necessary.

Stefan

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+yX0wACgkQnKSrs4Gr
c8i2AQf/dGQvHjQNhgj76Wcb71VLZblPZ63Kk5z9KbiLSmiHCqXwX9st8uBc2gH2
8hw0bCHTOTwARpz2X0SV1AfxGsZzbXlvv+r+cv3+9WWDJW9PxFi2CKQTbB0ioEoZ
oXl7Ug2wnqEEeb9mTIHdROWA7gxnR3dzyXF+ijmknBYOU5TBtCg69r3naJKb5b/h
ZP7Zpyj1x9Tt0GwapV4GBgkTj+ciooimseXBu///bZeSnJZU8d8kBQscbla4tE6z
u4Tez5jilBSZYTXbKduJCBX+RgH2cDEJTVbrr2CZv4FcIMj5H5K2ojz1vGYfXXvc
XBZrFEC5Nkcs9pmAiONfeT8Pvj2n1A==
=ywDr
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--


