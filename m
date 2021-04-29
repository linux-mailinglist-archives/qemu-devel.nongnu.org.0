Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09FF36ECC2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:51:07 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc80Q-0008K0-CI
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc7yx-0007m3-KK
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:49:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lc7yu-0000Ql-Ol
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619707771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0rc3Wuy8myfd+WAAAaS7nBg4EOyvnzksGfg3Qb5zljI=;
 b=S43GQ6zNf6yrGJa2gCulWeSFhPP5qobnlH3SnkaPq8ot6GeyCWoS3/EU7sNypsZQWAHNyS
 nKN2o0MzYmHWBBEjRegYQW7KaULynPC/1rLEQHKpoYhGUILdfIG6YYYgB1ri94Xg+gc7Mv
 +G0kSAuGhY8S0j/6zXiyrwXzVHSxJLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-w7LSY9VeN_6C9HaKMw80GA-1; Thu, 29 Apr 2021 10:49:18 -0400
X-MC-Unique: w7LSY9VeN_6C9HaKMw80GA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13E6F1009607;
 Thu, 29 Apr 2021 14:49:17 +0000 (UTC)
Received: from localhost (ovpn-115-28.ams2.redhat.com [10.36.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E8FA19726;
 Thu, 29 Apr 2021 14:49:15 +0000 (UTC)
Date: Thu, 29 Apr 2021 15:49:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <YIrHanNiZV0ikQ6g@stefanha-x1.localdomain>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eADlaK3KKVn08JQ/"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 dirty.ice.hu@gmail.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eADlaK3KKVn08JQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 11:59:41AM +0200, Markus Armbruster wrote:
> Stefan Hajnoczi:
>=20
>     ``-device virtio-blk,scsi=3Don|off`` (since 5.0.0)
>     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
>     The virtio-blk SCSI passthrough feature is a legacy VIRTIO feature.  =
VIRTIO 1.0
>     and later do not support it because the virtio-scsi device was introd=
uced for
>     full SCSI support.  Use virtio-scsi instead when SCSI passthrough is =
required.
>=20
>     Note this also applies to ``-device virtio-blk-pci,scsi=3Don|off``, w=
hich is an
>     alias.

Thanks for sending this reminder!

I'm writing a patch to remove this and if nothing breaks I'll send it
for QEMU 6.1.

Stefan

--eADlaK3KKVn08JQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCKx2kACgkQnKSrs4Gr
c8hLmwgAghy+wEjZjwbPFLK7R05xZAHn3h+I0RmcS/z80jmDUJ/yc9pHMf5q9HsA
wFoKPTOsCzAEcfpkrq9bcHi1ILaXwSQT2OdP7qLf/Fm9FwuDiUF3sOXZrx2WzHzH
yQfJG2Lz5uCx4P4GTR9xgvOrQFArV9mUinmf4EDzQxojBt3pZTvlEVMcBzkJeEt2
ZBWwWB9JawY6irx9vZKZ5cHYIPJIeP//Axlpz5OWAXgzgDz0R3aKDotdesVu2cNg
sPgOFTbmUPe3tdoIh2QrLUtZVEpWGC7M3Ic7r1Apty4LHEJOq/sfsFXJeB8o4gjP
6+e8rc51XFFFjYHQT/+P9b6dAHeiuw==
=gk6Q
-----END PGP SIGNATURE-----

--eADlaK3KKVn08JQ/--


