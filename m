Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D537387A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:19:29 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEcr-0007iG-2t
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEbF-0006T4-EW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEb9-0004CW-Sj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TX/jLS6vGuxNeDUBmR9mkC2ASGcg+sEeBy6p974tAow=;
 b=ehnYJqur37XqKzPiuqSzq/vVMCvNYwDnBCfybKgdwwCciNcUoZkeFqAf3a2rfkudpaarZL
 B0uS7XAOOlG0iQW6fKuIAI4OdX0DvoAo2E24/9vNSErWU5tBDRYDMe5oncaqHAjSlRh+ZR
 BgYTwRBGR5J87ynRdsInQ7ioBWRH5dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-F3NSbiKvNDuQmcn2L1v0_g-1; Wed, 05 May 2021 06:17:39 -0400
X-MC-Unique: F3NSbiKvNDuQmcn2L1v0_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744A51006C80;
 Wed,  5 May 2021 10:17:38 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE2431001901;
 Wed,  5 May 2021 10:17:34 +0000 (UTC)
Date: Wed, 5 May 2021 11:17:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 4/4] virtio-scsi: Configure all host notifiers in a
 single MR transaction
Message-ID: <YJJwvchnvh0uws5t@stefanha-x1.localdomain>
References: <20210407143501.244343-1-groug@kaod.org>
 <20210407143501.244343-5-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210407143501.244343-5-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qsgzKSs+vVe8UR0z"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qsgzKSs+vVe8UR0z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 04:35:01PM +0200, Greg Kurz wrote:
> This allows the virtio-scsi-pci device to batch the setup of all its
> host notifiers. This significantly improves boot time of VMs with a
> high number of vCPUs, e.g. from 6m5.563s down to 1m2.884s for a
> pseries machine with 384 vCPUs.
>=20
> Note that memory_region_transaction_commit() must be called before
> virtio_bus_cleanup_host_notifier() because the latter might close
> ioeventfds that the transaction still assumes to be around when it
> commits.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/scsi/virtio-scsi-dataplane.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qsgzKSs+vVe8UR0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCScL0ACgkQnKSrs4Gr
c8gdTQf+Jh9BxAQdA1vHKs3wqvmrf6yG0oGGpHgcl6bt3zIbpg3lbkLPxfjaQjdD
soR184UmzCPTMc7yQCwx/k5DqG77/jiQxXnXBB1KsR6GiU72N8hrqHaeLDmdNluW
ZYxaBNleaDklNX/mGpt07E94H8sJutrPCrqFYTk9FeTqTGJQfyDkC/6ncfoNhwEQ
RH6j/sCwhA9Ejao/o3FVoCxFDoYbrnjoZP4tZcVdc3mAnY79+xW4Lf9WDrgYb6d7
k3lwpWapq6UuJjhwEmasFI/3sQhTVjGwZ1m/sgKf7fPyosu+WKu/dMMCha+7kqHq
iCx66WTLYP7yfZXfoVb+rcgTh68uJg==
=JS7p
-----END PGP SIGNATURE-----

--qsgzKSs+vVe8UR0z--


