Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DA2CBEE6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:02:03 +0100 (CET)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkShm-0002le-Vu
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkSfF-0002KS-2r
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkSfB-0000DR-Ej
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606917559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eywup0xjV6quzF+M0rHUNFf2nLFB1p4RHbDE1U0/Grs=;
 b=FKc8H7cuF3v3VuLyvRcV15EXPeok8S9i0UaP5MhH/orct1OgKNqywKxX7/ux6EpcX0lKou
 LYcT/f/p4mMcDvsXEsP7OhbBJVUjOIE9EhAs0v7eeWv7oLTvsp1iDsb0bS4dDX67a7w8pQ
 NAgEfgqBWftgQ4hjZSF57y6K3VAN05s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-wt3Uwut_MVWZ2CGQ61JYWg-1; Wed, 02 Dec 2020 08:59:17 -0500
X-MC-Unique: wt3Uwut_MVWZ2CGQ61JYWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B2D18C8C14;
 Wed,  2 Dec 2020 13:59:16 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6617B5C1BD;
 Wed,  2 Dec 2020 13:59:10 +0000 (UTC)
Date: Wed, 2 Dec 2020 13:59:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: virtiofsd-rs: A rust virtiofs daemon
Message-ID: <20201202135909.GB655829@stefanha-x1.localdomain>
References: <20201202123410.GD3226@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201202123410.GD3226@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: slp@redhat.com, Chirantan Ekbote <chirantan@chromium.org>,
 qemu-devel@nongnu.org, virtio-fs@redhat.com, ameynarkhede03@gmail.com,
 Sebastien Boeuf <sebastien.boeuf@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 12:34:10PM +0000, Dr. David Alan Gilbert wrote:
>   Sergio has been working on virtiofsd-rs, a virtiofs daemon
> written in rust, and which can be found at:
>=20
>   https://gitlab.com/virtio-fs/virtiofsd-rs
>=20
> It started life originally as part of the crosvm project, got
> ported to vhost-user as part of the Cloud Hypervisor project, and
> has now been split out.
>=20
> While the C version of virtiofsd isn't going away for now, the hope
> is to stabilise virtiofsd-rs, add some missing features and start
> preferentially adding new features and new work onto the Rust version
> rather than the C version.
>=20
> So please try it, and let the list (and Sergio!) know how you get on.

Awesome, really happy that the Rust daemon has come so far. Thanks
Chirantan, Sebastien, Sergio, and everyone else who developed it.

I talked to Sergio and he is currently looking at what's missing for
feature parity with C virtiofsd. This is an opportunity for anyone who
wants to contribute.

Stefan

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Hna0ACgkQnKSrs4Gr
c8ingAf/RKVz8Y8xO4DDt5KN5d/TtxxKOOAs5EmZzJ6GMJ9+H5vb6MMVqeddkJKg
9kv+fP2yKNtTnq6yhggF8lVNflXmpzSk+GH1yPxaunYPkaN92QHvzaLppf86b8wG
S/dZ8JhYVqdG+MunTPooor1639+R4r7cWiCd3doFshS4gvUMJ+KTZr7piuntcADQ
Pzy+lGma/jchd4tsi+oDGLdJXfkbfwZfTQn0Oofgnd70n0E1L/0cKdErAL5KpGyA
EQpcJhM9BFTMfycZbH3VyGYTHGUUe9JLkDASedcT1YrLQ94k3xMUC+K1IpRfu/oS
NWWhCiCgtR0ooeD/Tnm47lg9n1xBYA==
=x9qC
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--


