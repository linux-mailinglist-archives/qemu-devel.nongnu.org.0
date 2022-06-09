Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64854461A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 10:39:36 +0200 (CEST)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzDhX-0004Km-Jz
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 04:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzDdy-0002NA-Nv
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nzDdv-000141-Ly
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 04:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654763750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OwnR4jS2U4ucJ7ogPZerKe33y02jLfo+yPO7pDcCqaw=;
 b=RuHN2cm47+VNFSV+ac0C2DPlgbCdlIgtfp6HQLgCErXGN2Z/nwS/gRhD6x+vZ3WY8WcUzl
 uECSBXEx7Emi23+B9jdYxmBvBwD6aKkVTvXiLlLZCxMfttSV6AeR3IWCxRXs9a6HIUKMcT
 uKdCLg79/kI7pdERSgzZouqCoFaH8VQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-a9IqtV69Mxu7motSbR2CFg-1; Thu, 09 Jun 2022 04:35:46 -0400
X-MC-Unique: a9IqtV69Mxu7motSbR2CFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7599E85A585;
 Thu,  9 Jun 2022 08:35:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 238A540EC002;
 Thu,  9 Jun 2022 08:35:45 +0000 (UTC)
Date: Thu, 9 Jun 2022 09:35:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 resend 0/4] add generic vDPA device support
Message-ID: <YqGw4Jup0zL8oLHV@stefanha-x1.localdomain>
References: <20220514041107.1980-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bs2U6ppJ04c4rhvY"
Content-Disposition: inline
In-Reply-To: <20220514041107.1980-1-longpeng2@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bs2U6ppJ04c4rhvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 12:11:03PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
>=20
> Hi guys,
>=20
> With the generic vDPA device, QEMU won't need to touch the device
> types any more, such like vfio.
>=20
> We can use the generic vDPA device as follow:
>   -device vhost-vdpa-device-pci,vhostdev=3D/dev/vhost-vdpa-X
>   Or
>   -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
>   vhost-vdpa-device,vhostdev=3D/dev/vhost-vdpa-x
>=20
> I've done some simple tests on Huawei's offloading card (net, 0.95).

Please send a follow-up patch that adds documentation for this new
device type. Maybe in a new docs/system/devices/vhost-vdpa.rst file?

Stefan

--bs2U6ppJ04c4rhvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKhsOAACgkQnKSrs4Gr
c8hpaggAms6XGmZ6+ojg1heYHvbnafO9BtTXxcZL2AHv6dQGoOWStNBkFjnFPGHt
kulZnkZh7oQacrWT35C18NhxXBfOx6v/c7vNoVc5wX3JFQBMw98/jRiBCzoN1viT
rHEvvFtEveeyVJaFe0BOJ5C6/51FaMEIlX3MdhqBtKhcgR0eeEQo7kp9QDkh1ymi
PSOb7W5FyjJ0LydI1dnEIhZjIaVRNTIZzqauNkBry9YVQ/DVBUV8ijLNlng2vNFR
vWoxQZxJcfdawY6XanR6NWs5W3MMPDotORY9u3D/l0TDsztVl//4NNusOluF7sQY
Ec403wSMfNxmOlPiByAPOVkHRvYMuA==
=2oVl
-----END PGP SIGNATURE-----

--bs2U6ppJ04c4rhvY--


