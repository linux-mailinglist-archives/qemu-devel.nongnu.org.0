Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CDA2F48C4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:37:38 +0100 (CET)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdWz-0003Hc-CH
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzdW8-0002do-Ry
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzdW5-0000Rp-CO
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610534200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hixWek1z7n14iQfvd/6nuuB0FHmZW8HNsNxK5gshUd0=;
 b=Om7aefRCdBySMGiQVXtZ7m+yJU1sKDEUzPspGcKARixaJtUR19y7kG1NL1LuMz+QZG8I0C
 xtGSgX3PBeML1kejdCoCt8kv+xRanAx667/qB80MNkcN7LYuqOpjH+I8nHlRPhykhKwGqR
 Xi/rMzLiQMMQKQVCcrj0wxU8FlfaCTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-UIfUn20YPta4yKy06nt_Hw-1; Wed, 13 Jan 2021 05:36:37 -0500
X-MC-Unique: UIfUn20YPta4yKy06nt_Hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE9C8145E1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 10:36:36 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B213B5C253;
 Wed, 13 Jan 2021 10:36:30 +0000 (UTC)
Date: Wed, 13 Jan 2021 10:36:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH v2] vhost-user-fs: add the "bootindex" property
Message-ID: <20210113103629.GF250553@stefanha-x1.localdomain>
References: <20210112131603.12686-1-lersek@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210112131603.12686-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 02:16:03PM +0100, Laszlo Ersek wrote:
> virtio-fs qualifies as a bootable device minimally under OVMF, but
> currently the necessary "bootindex" property is missing. Add the property=
.
>=20
> Expose the property only in the PCI device, for now. There is no boot
> support for virtiofs on s390x (ccw) for the time being [1] [2], so leave
> the CCW device unchanged. Add the property to the base device still,
> because adding the alias to the CCW device later will be easier this way
> [3].
>=20
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01745.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01870.html
> [3] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01751.html
>=20
> Example OpenFirmware device path for the "vhost-user-fs-pci" device in th=
e
> "bootorder" fw_cfg file:
>=20
>   /pci@i0cf8/pci-bridge@1,6/pci1af4,105a@0/filesystem@0
>=20
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: J=E1n Tomko <jtomko@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: virtio-fs@redhat.com
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>=20
> Notes:
>     v2:
>     - drop "hw/s390x/vhost-user-fs-ccw.c" hunk [Christian, Cornelia]
>    =20
>     - document the same in the commit message
>    =20
>     - remove fw_cfg kernel boot reference from the commit message (somewh=
at
>       similar use case, but a comparison or even a hint doesn't necessari=
ly
>       belong in the commit message)
>    =20
>     - pick up Dave's ACK
>=20
>  include/hw/virtio/vhost-user-fs.h |  1 +
>  hw/virtio/vhost-user-fs-pci.c     |  2 ++
>  hw/virtio/vhost-user-fs.c         | 10 ++++++++++
>  3 files changed, 13 insertions(+)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/+zS0ACgkQnKSrs4Gr
c8gS9wf/TRog/kNVH/gkx/ciVGAZlq+1sMNKxVZI9R4Kv0HL3y6WZxkdTtZGZgwO
RErK34NA2jYHZllUGjqlxeByruJBrg9/yuM8FEeMy8rPHstHy8kflbC4L9nYRiJE
aF7G4nD7VsbkIoPtKV91qV38bZYoS6BWMd2DwVn4JBO+bkKsek3AQ2ZR5vlohoTB
IMRcpV3hqJvEySVJKZc1O28yKGPamfWcTS1/UPPi7kALWXCesLd8eCYU6h6Td3qE
ZS/yoX2TurpuLK62+jKsTOQBigXSuWtgiY9BUMLJtAk7BRyMwOTZNGdi9wDP/PQx
YxkHwsGykJ3MQ5GkX+7nUMqZ3SDOMg==
=EAQQ
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--


