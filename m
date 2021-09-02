Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A3C3FEDE1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:37:24 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLly6-0002Pg-Td
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlw5-0001Mk-PF
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLlw1-00059w-4g
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uTt3x/xaM2R9hHos/eyFaVm1lQFZgBmbGaqDIyJjHu4=;
 b=DKB3t/6RdqtDVuX2k+VjNuyNZ5kkY4nx//a+8+nT9YaNVAcacxP3IzFhwl3umKu1vhJ7Ay
 N7odgRm6EqXxsMdrBdu2JgFt4oJ8qom20irmL9shdwiXpxAYzl5vO7lFtm2ESMTbazGypJ
 WlqcNF5AcV2xtayLERiKa1LbbEmSJcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-2mYlLHdmM1qsiLJDwYbGLg-1; Thu, 02 Sep 2021 08:35:08 -0400
X-MC-Unique: 2mYlLHdmM1qsiLJDwYbGLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A130E802E61;
 Thu,  2 Sep 2021 12:35:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4D4519D9B;
 Thu,  2 Sep 2021 12:34:57 +0000 (UTC)
Date: Thu, 2 Sep 2021 13:34:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Maxim Davydov <maxim.davydov@virtuozzo.com>
Subject: Re: [PATCH v1 0/8] Virtio features acknowledged by guest
Message-ID: <YTDE8ImhsCjivlVG@stefanha-x1.localdomain>
References: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210901090804.7139-1-maxim.davydov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a90QQKCoJnxe2dAL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: fam@euphon.net, berrange@redhat.com, amit@kernel.org, mst@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, den@openvz.org,
 Jonah Palmer <jonah.palmer@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--a90QQKCoJnxe2dAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 12:07:56PM +0300, Maxim Davydov wrote:
> In some situations (for instance, debug), we want to be able to see the
> features that were confirmed by the guest. At the same time, we would lik=
e
> to do this safely, without the possibility of setting bits of guest
> features from the outside.
>=20
> Maxim Davydov (8):
>   qdev-properties: Add read-only 64 bit property
>   virtio: Add tracking of the common virtio guest features
>   virtio-gpu: Add tracking of the virtio guest feature bits
>   virtio-serial: Add tracking of the virtio guest feature bits
>   virtio-net: Add tracking of the virtio guest feature bits
>   scsi: Add tracking of the acknowledged feature bits
>   virtio-blk: Add tracking of the virtio guest feature bits
>   virtio-balloon: Add tracking of the virtio guest feature bits
>=20
>  hw/block/virtio-blk.c          |  20 ++++---
>  hw/char/virtio-serial-bus.c    |   5 +-
>  hw/core/qdev-properties.c      |  32 +++++++++++
>  hw/display/vhost-user-gpu.c    |   3 +-
>  hw/display/virtio-gpu.c        |   8 +--
>  hw/net/virtio-net.c            | 118 +++++++++++++++++++++++++----------=
------
>  hw/scsi/vhost-scsi.c           |   6 +--
>  hw/scsi/vhost-user-scsi.c      |  18 +++----
>  hw/scsi/virtio-scsi.c          |  10 ++--
>  hw/virtio/virtio-balloon.c     |  20 ++++---
>  hw/virtio/virtio.c             |   2 +-
>  include/hw/qdev-properties.h   |   5 ++
>  include/hw/virtio/virtio-gpu.h |  10 ++--
>  include/hw/virtio/virtio.h     |  39 +++++++++-----
>  14 files changed, 193 insertions(+), 103 deletions(-)

Hi Maxim,
The VIRTIO specification is designed to allow more than 64 feature bits.
Currently all feature bits fit into 64 bits but that may not be the case
in the future. Please use a representation that is capable of expanding
in the future.

The Linux guest drivers have a string sysfs attribute that is formatted
in binary ('0' and '1' characters). It's not easy for humans to read but
it is capable of growing in the future.

Also, please take a look at Jonah Palmer's patch series that adds
commands to introspect VIRTIO devices:
https://lore.kernel.org/qemu-devel/1626086137-16292-1-git-send-email-jonah.=
palmer@oracle.com/

I have CCed Jonah in case there is overlap between the two series that
you can work together on.

Stefan

--a90QQKCoJnxe2dAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEwxPAACgkQnKSrs4Gr
c8iAGQgAwYb34sK9jf5LrecKV+S5sTtRCCyq+RB9k/rRXFl9mPlb2lmQi5VzNJss
E1jbrfSe4T3VIFNSdubj2HLnUudjlGyEjJzD30dp3NePoU/jfeTrNs17XA1lh7xI
zH2yEzWZ5dH+RVhBtJMVup0fAKYP9ktH0KjQtiVi04YZhP+Bp8VCbzCcCzbkeUPs
Jm0MmZsu6feqigKhLMtCnn9sT5jBv6lvkm0//Lb+6OXgEHMf0uuVX2DKbpKCH6T3
e5pVtBPcxgF2wWg8vAahAsHY+h5o+NeWGFs1BzKjuNQthD7IMyVc5vNkvs2ylSJy
EvC/0rNdOXedIAXLEMfO1Gq5RmSrQw==
=1wvh
-----END PGP SIGNATURE-----

--a90QQKCoJnxe2dAL--


