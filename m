Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C59848511E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:28:44 +0100 (CET)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53X9-0002mx-7P
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n53Ql-0006ps-Vd
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:22:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n53Qj-0007Id-Mc
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641378124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T//FDeg/dnN7pnc0GCkSCS4sd4IJyI1+y8I64lunVwE=;
 b=I9PGfdB7UsuUjn6MC4J7kEjW1cgjQAFSSSpKxx/e7j3JceL+42yujqNINX5ASMl8dGUzXw
 8p79AInVZZDMHI6seK3BNPWRymNwBhStiYe4MMED7JOEGzlnrkQrrNwVJLfFnxD6fLw7qK
 PikUFNJpxkTJT3m8Oi5Jd2NbBooKgSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-RW7yivg6Nvqp44StgXrjnA-1; Wed, 05 Jan 2022 05:22:01 -0500
X-MC-Unique: RW7yivg6Nvqp44StgXrjnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A931D100C624;
 Wed,  5 Jan 2022 10:21:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C5BD5E4B9;
 Wed,  5 Jan 2022 10:21:45 +0000 (UTC)
Date: Wed, 5 Jan 2022 10:21:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC 00/10] add generic vDPA device support
Message-ID: <YdVxN8+4FXOgxmla@stefanha-x1.localdomain>
References: <20220105005900.860-1-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220105005900.860-1-longpeng2@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x14Tw75JRbDrbZM1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, yechuan@huawei.com, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--x14Tw75JRbDrbZM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 08:58:50AM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
>=20
> Hi guys,
>=20
> This patchset tries to support the generic vDPA device, the previous
> disscussion can be found here [1].
>=20
> With the generic vDPA device, QEMU won't need to touch the device
> types any more, such like vfio.
>=20
> We can use the generic vDPA device as follow:
>   -device vhost-vdpa-device-pci,vdpa-dev=3D/dev/vhost-vdpa-X
>=20
> I've done some simple tests on Huawei's offloading card (net, 0.95)
> and vdpa_sim_blk (1.0);
>=20
> Note:
>   the kernel part does not send out yet, I'll send it as soon as possible=
.
>=20
> [1] https://lore.kernel.org/all/20211208052010.1719-1-longpeng2@huawei.co=
m/
>=20
> Longpeng (Mike) (10):
>   virtio: get class_id and pci device id by the virtio id
>   vhost: add 3 commands for vhost-vdpa
>   vdpa: add the infrastructure of vdpa-dev
>   vdpa-dev: implement the instance_init/class_init interface
>   vdpa-dev: implement the realize interface
>   vdpa-dev: implement the unrealize interface
>   vdpa-dev: implement the get_config/set_config interface
>   vdpa-dev: implement the get_features interface
>   vdpa-dev: implement the set_status interface
>   vdpa-dev: mark the device as unmigratable

Nice and small.

Stefan

--x14Tw75JRbDrbZM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVcTcACgkQnKSrs4Gr
c8jZ7wf+Ognp/gQ2OHF/aBV9Zktb8d4J6vKLZLi+zGPPB8OaBzyDOcYWqgfyMzmx
gymkX0y2gKvninC03kwxhHUtyLuBjw9RhD3VNMEU9p9GOdNrXWW4y8W9SVjpHuoR
x9LqSFLV/o18gU8t6lxNjShP1G5A+CYf3lXYhF+uIk1tuwazjMnm4WiFNMCvylqy
qem6OQsd90vUnqLB0ISTY5oI6EXg1O016qRcHGASvziXpFmTV5AuPTD1w+/pRzDX
hTuFLrf7dgT3HD4JRY9LHptUznNq3JFwiKb9rSCXBo+8hs8/RAONF9QUDUXrxA8P
EDbKJS6BQ6gvVgl2EhLtWzenDRTQQw==
=hG2y
-----END PGP SIGNATURE-----

--x14Tw75JRbDrbZM1--


