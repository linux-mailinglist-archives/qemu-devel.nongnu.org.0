Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6D453017
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:17:41 +0100 (CET)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwT6-0000gO-8f
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:17:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmwPJ-0004Rd-A4
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:13:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mmwPG-00065k-QL
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637061222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F6tvwZSfjT/wcE20ndg4MqLxYJK9FrbzcLuSlFpR77Y=;
 b=N/m/AtZzP9NIPCh+9p5IWrwzjPA8g5nIooKMMvirya2U2ZnkCJrDwOnuINFHDZGCeQh3Wn
 TR0q0RFG8XHKfBPhrs0YE1AqFbmwm0zEXdhn/OCZSVFWvgjkIsl8YKT/rXYSywDuenqOiS
 xb8nJ/nYgJ3KOZZs4U0roi6MEeebdQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-BXIJUm5xNdyBvreyrRiH0Q-1; Tue, 16 Nov 2021 06:13:39 -0500
X-MC-Unique: BXIJUm5xNdyBvreyrRiH0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DBF980A5C3;
 Tue, 16 Nov 2021 11:13:37 +0000 (UTC)
Received: from localhost (unknown [10.39.195.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ADF35D6BA;
 Tue, 16 Nov 2021 11:13:18 +0000 (UTC)
Date: Tue, 16 Nov 2021 11:13:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <YZOSTYBUde8hz2OW@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <2186445.RDNOEBgitd@silver>
 <YZJKeNOxcm3ZxHj6@stefanha-x1.localdomain>
 <2888852.ZcFpDoVWxJ@silver>
MIME-Version: 1.0
In-Reply-To: <2888852.ZcFpDoVWxJ@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nTmdJO8CHBrmpor9"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nTmdJO8CHBrmpor9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 03:32:46PM +0100, Christian Schoenebeck wrote:
> I would appreciate if you'd let me know whether I should suggest the disc=
ussed=20
> two virtio capabilities as official virtio ones, or whether I should dire=
ctly=20
> go for 9p device specific ones instead.

Please propose changes for increasing the maximum descriptor chain
length in the common virtqueue section of the spec.

Stefan

--nTmdJO8CHBrmpor9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGTkk0ACgkQnKSrs4Gr
c8g8dwf+NKjImrISNDFd0MQBdcOG6HbhAqP0j+Hs0u+aeU0LOf8nAvW1ZapOaenF
xFlKRSsVnQh8OfXiCyQpnnXm+L9vaCiMVE/BJ2aqBtvgqsnWh7LJIzTXvCl7E+37
daJ+NnYnSL19Z7CYIgp5Jj5SLDNMuc5YeV9MizvkQjrqugRQUtgwNNH4JpKksW4V
a1q+u66jcX3J+t+VEeluJ2DpqEX7EYg7oJoOuVq2rsGZ4qCHNwUc8J+fOH6tcWKT
fOHWj4EV4MPXuutJ62aH5wM0ppnIePOBaYfnBeebL359/5G/ZAOqw7rAfsqIp3Q0
tSpSm29hftrbWKH7bDTIFHX4BQMDcw==
=JRXa
-----END PGP SIGNATURE-----

--nTmdJO8CHBrmpor9--


