Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B87A372C15
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:34:50 +0200 (CEST)
Received: from localhost ([::1]:55440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldw8P-00016r-Gv
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldw6l-00008b-JF
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldw6i-0003Tm-R1
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620138783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yg5zKWrpfCOjGW5Bi+IEOGEz5BWuMDqZQwi1uqrSLGA=;
 b=A+tZ2wH9zK9ux3RqHxJYGImpH7wKpxQyalNm35oZ+m4R2Dl36hXgBs0jSETM7CG7F3E8hd
 T4sj3QOaI5Rd5JBzv+dlsRq3RUv9aa3RLoIUn+wgdrkC5u2AdQmHExTB8XGGKk1qw0EXY3
 wsBhnUP/ruC/Qv60p23V+g0BjF9eQr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-9zJvMQsPM-Wg2q9jSpqnkw-1; Tue, 04 May 2021 10:33:01 -0400
X-MC-Unique: 9zJvMQsPM-Wg2q9jSpqnkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA74D803622;
 Tue,  4 May 2021 14:33:00 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8190360C4A;
 Tue,  4 May 2021 14:32:56 +0000 (UTC)
Date: Tue, 4 May 2021 15:32:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
Message-ID: <YJFbFztA61itLoR2@stefanha-x1.localdomain>
References: <20210429155221.1226561-1-stefanha@redhat.com>
 <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rhGLXT0N2wes2YIy"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--rhGLXT0N2wes2YIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 02:03:52PM -0400, Eduardo Habkost wrote:
> On Thu, Apr 29, 2021 at 04:52:21PM +0100, Stefan Hajnoczi wrote:
> > Live migrating old guests from an old QEMU with the SCSI feature bit
> > enabled will fail with "Features 0x... unsupported. Allowed features:
> > 0x...". We've followed the QEMU deprecation policy so users have been
> > warned...
> >=20
>=20
> Were they really warned, though?  People running
> "-machine pc-i440fx-2.4" might be completely unaware that it was
> silently enabling a deprecated feature.
>=20
> Can we have this documented in a more explicit way?  Maybe just a
> comment at hw_compat_2_4 would be enough, to warn people doing
> backports and rebases downstream.
>=20
> Can we make QEMU refuse to start if using pc-2.4 + virtio-blk
> together, just to be sure?

On second thought, do we really want to break pc-2.4 user's QEMU
command-lines if they have a virtio-blk device?

BTW Peter mentioned libvirt avoids the unnecessary scsi=3Doff:
https://gitlab.com/libvirt/libvirt/-/commit/ec69f0190be731d12faeac08dbf6332=
5836509a9

Stefan

--rhGLXT0N2wes2YIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRWxcACgkQnKSrs4Gr
c8g6Wgf/Qba4BIigN/W55AuDa+MEJYQ1rpN1XsU85tiC0CQvbQ1oZGG0W2nTH2TL
xSY+2T9C5PBtsvyjjzO5SOMho3M4hFq+kqgPHkOMVn/rFf+unlq6KfLPyOQJDNKU
CNEOZYEnYdf+XskK0LvfaKjbEosbeLUgZEhhSgdcYsU9eJxNBiwStFoYzl3Wz4sr
cAVoqLfvAhufRMvOBmUVfigQPrPcRKS53I8yRA/62mPh3IStcS5OuU2u70acw9s8
bgwWrfA2D01hynvkOU+tgnJydqiG79Hh9M05QrxuyGge8Sr7sIauSzJJuCgtHv/p
ieZJFOnh0EOtCnqh9st3i4RuFeFnjg==
=CKjU
-----END PGP SIGNATURE-----

--rhGLXT0N2wes2YIy--


