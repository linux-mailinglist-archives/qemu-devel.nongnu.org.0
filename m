Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A531D9B6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:47:03 +0100 (CET)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMEQ-0001S8-97
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCMCU-0000tQ-O1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lCMCT-0007Kc-1p
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LdV3rLZJQcwe7yOhKJf+uyqCg3gHM0IziOlYFpxcxzE=;
 b=Deq7IRUpDeysFtzbxIaCFALGB14igunRtrsDyNrwlkw3iwXQQtQaUvfxWHa5R8iKa62DLc
 VAV4SCFiahfhE6TPaC2iHDDJQSZP4aAp8YERV7ox6hiWLvOPx25AXhpcNWpgXLk01HNlYp
 IyLkwlsmUKEMQvUK3CaixhtO+ZB1rz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-KVfYYkqnM3CpE5qnO8tlJQ-1; Wed, 17 Feb 2021 07:44:56 -0500
X-MC-Unique: KVfYYkqnM3CpE5qnO8tlJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED4B100CCC0;
 Wed, 17 Feb 2021 12:44:54 +0000 (UTC)
Received: from localhost (ovpn-115-102.ams2.redhat.com [10.36.115.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B98D10023B4;
 Wed, 17 Feb 2021 12:44:49 +0000 (UTC)
Date: Wed, 17 Feb 2021 12:44:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v2 3/7] vhost: Save masked_notifier state
Message-ID: <20210217124448.GE269203@stefanha-x1.localdomain>
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-4-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-4-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 04:37:53PM +0100, Eugenio P=E9rez wrote:
> It will be used to recover call eventfd.
>=20
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost.h | 1 +
>  hw/virtio/vhost.c         | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAtD8AACgkQnKSrs4Gr
c8j2awf/UHpk5f3tKV12AGNdVg31ydUM74AvMrV0hYGB6lTdcFDChrTUGA2CJBcO
g3f5GUVM8kfOYjbtYi7rPJw97nxZ8L65byVZgXC6nvBE/Wl7wzENysTM8a1Og/87
xquNt0Du/prug5i29Tdt5463ivuZT9vZYa7FsFfdFw1eQPOp3VrCds52eEym4AS0
zqTy0EVjB8Nk91m+IwTfyNzg3shdYSry8p0r5NK3UpxMRCQv2o3vHG1hXaDLO56/
kRx3OtHyjC0NlIePRLsyKm9ap8kJEV1F/ioqPXXKPyx7UOxjMcKY1kx6PJM8mMjv
O1wlfz6yjtOvFq/UNw5imUJ+lj8ytQ==
=rvvf
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--


