Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338926FCFC7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 22:44:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwUBT-0001Di-Sg; Tue, 09 May 2023 16:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwUBS-0001DZ-0j
 for qemu-devel@nongnu.org; Tue, 09 May 2023 16:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwUBQ-0007Ni-Jk
 for qemu-devel@nongnu.org; Tue, 09 May 2023 16:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683665019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=73rXAUSbDMMD9aLijjtyw6szEUieY4YD79d0W2REdQU=;
 b=JdltbhtyPtZpUTxq+FUe7F1Pl4hU/F0+3zOkt4niyRjJ8BhDMqtnQJbZXuuEa9iY0nqSJg
 OJ7lBdq9HM6BkhBJARaQMeoHuCCGnzNNBGsmXgHpq1V2jTrYr7ksOBr3XMfXdLUigRYkhy
 FWMkqEr9j/vuxJ2OU9FUs+vSxXX5pUI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-h2450ozEN8ukawalTzR5Sg-1; Tue, 09 May 2023 16:43:36 -0400
X-MC-Unique: h2450ozEN8ukawalTzR5Sg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42C0F80C8C4;
 Tue,  9 May 2023 20:43:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 394F41121314;
 Tue,  9 May 2023 20:43:34 +0000 (UTC)
Date: Tue, 9 May 2023 16:43:32 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Peter Lieven <pl@kamp.de>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Juan Quintela <quintela@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhengui Li <lizhengui@huawei.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v5 05/21] virtio-scsi: stop using aio_disable_external()
 during unplug
Message-ID: <20230509204332.GB1165676@fedora>
References: <20230504195327.695107-1-stefanha@redhat.com>
 <20230504195327.695107-6-stefanha@redhat.com>
 <ZFqXEihzG18me26X@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pP+x37X0vy9h+g7D"
Content-Disposition: inline
In-Reply-To: <ZFqXEihzG18me26X@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--pP+x37X0vy9h+g7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 08:55:14PM +0200, Kevin Wolf wrote:
> Am 04.05.2023 um 21:53 hat Stefan Hajnoczi geschrieben:
> > This patch is part of an effort to remove the aio_disable_external()
> > API because it does not fit in a multi-queue block layer world where
> > many AioContexts may be submitting requests to the same disk.
> >=20
> > The SCSI emulation code is already in good shape to stop using
> > aio_disable_external(). It was only used by commit 9c5aad84da1c
> > ("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi
> > disk") to ensure that virtio_scsi_hotunplug() works while the guest
> > driver is submitting I/O.
> >=20
> > Ensure virtio_scsi_hotunplug() is safe as follows:
> >=20
> > 1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
> >    device_set_realized() calls qatomic_set(&dev->realized, false) so
> >    that future scsi_device_get() calls return NULL because they exclude
> >    SCSIDevices with realized=3Dfalse.
> >=20
> >    That means virtio-scsi will reject new I/O requests to this
> >    SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
> >    virtio_scsi_hotunplug() is still executing. We are protected against
> >    new requests!
> >=20
> > 2. scsi_device_unrealize() already contains a call to
>=20
> I think you mean scsi_qdev_unrealize(). Can be fixed while applying.

Yes, it should be scsi_qdev_unrealize(). I'll review your other comments
and fix this if I need to respin.

Stefan

--pP+x37X0vy9h+g7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRasHQACgkQnKSrs4Gr
c8idhggAxwT1miphed6iDRzm0lcoIB+ERb0L9uu4SUcMFT6DDuoxIYBkdVwfzFye
/+ZEEQZrR0wW4GassEZR0evyH6N86XQCcbxZieYhvMS4vOlMtn6TLPOBO1kuV7bk
P/c4/aESmuRlERwSQ2xzmc3NsVc6jZI0onjQLNuC4wmEuWszLPfVNJ/oH46QjMOd
n9/RU5gOM/yajjrNHCnCE71xPsWQaP608ibSbsCzLbq9ByeaEqivhU7knUEQFcCC
KWWLL57nVhG2Lvvrjb1NiYDxq4NmadDxVFMQNm8jcqzuxLhZOwTqn1oxQk6A8P/x
A4btIkywXTRHK/EuAXKBCrBh+/7lSw==
=776u
-----END PGP SIGNATURE-----

--pP+x37X0vy9h+g7D--


