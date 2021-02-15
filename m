Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00EF31B7B1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:56:50 +0100 (CET)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbYf-0000D2-Ur
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lBbWF-0007vW-JY
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:54:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lBbWB-0002Z4-Nb
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613386453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b1XEmvdMYIG0wEbi4O+0SrHJJcXwE/2eWuD1hYHHRpc=;
 b=LzDwu7TXpayPtNzCJvhETc+HXCjh6Nd+elbdV/Kd8ZgJv/01NvkV1JyOXACOROfEIsdmiK
 lNWxAW2ZI8ObBg5vlnGj9poE8F15nx8kSqekQn6Lef7TSHNiVwWDAkAFg0WV4fsDxRCmm2
 QY3Ns1zkTOC3lNsJlk/qjLznmRTMs8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-VOl4HaLRPMmFTdchxNjf5Q-1; Mon, 15 Feb 2021 05:54:10 -0500
X-MC-Unique: VOl4HaLRPMmFTdchxNjf5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76733107ACC7;
 Mon, 15 Feb 2021 10:54:09 +0000 (UTC)
Received: from localhost (ovpn-113-245.ams2.redhat.com [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04CDF60C5F;
 Mon, 15 Feb 2021 10:54:08 +0000 (UTC)
Date: Mon, 15 Feb 2021 10:54:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: libvfio-user library in QEMU
Message-ID: <20210215105407.GA87159@stefanha-x1.localdomain>
References: <AA81A6EE-4CF6-435E-9FB3-7A560CA4D491@oracle.com>
MIME-Version: 1.0
In-Reply-To: <AA81A6EE-4CF6-435E-9FB3-7A560CA4D491@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Felipe Franciosi <felipe@nutanix.com>, QEMU Developers <qemu-devel@nongnu.org>,
 John Johnson <john.g.johnson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 12, 2021 at 12:08:11PM +0000, Jag Raman wrote:
> If we have to use libvfio-user library in QEMU, could we link the library with the QEMU binary based on some config options?

Yes, meson_options.txt can be used.

> Secondly, the remote process in multi-process QEMU uses the same QEMU binary for the remote process as well. Is this OK with libvfio-user, to start with? Or do you think a separate binary is preferred for the remote process?

For now the extra library dependency doesn't seem like a big problem.

The long term question is how to build with vfio-user device backends:

1. Single-device binaries. For example "make qemu-vfio-user-e1000" would
   build a vfio-user-e1000 binary from hw/net/e1000.c.

2. Multi-device binaries. For example "make qemu-vfio-user-backend"
   would build a vfio-user-backend binary with certain devices enabled.
   The set of devices could be specified via Kconfig or maybe on the
   command-line E1000=y VIRTIO_NET_PCI=y.

Build system support for this should minimize duplication with
monolithic QEMU's meson and Kconfig scripts.

It would also be great to avoid boilerplate. It should not be necessary
to write a lot of code to build a new device type as a vfio-user device
backend.

> From previous discussions, I recall that libvfio-user would be git submodule in QEMU repo. Is this still the preferred approach?

Yes, I haven't heard anything else since that discussion so I think the
plan is to use a git submodule.

Maybe later when the libvfio-user interface is stable and it's shipped
as a package by distributions the submodule will be replaced by a
traditional external library dependency.

Stefan

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAqUs0ACgkQnKSrs4Gr
c8j8OQf+KuLgYiHLI/TZ+fU+/Qpl1wFmSWu1CVW++n4RKVeXMdws/m77Gn79LhC5
EdFENF/FKedwnDD8du6d/78yNMd7Qm+FHvWE21uMSj+jw7/nVrIzWefNu96z9/KG
fT8YCCsfLuOtgX/D5dBLLtEtIaO6nAggn02aamjkpWvRpDEr+qDghCZHUbKTw9CQ
ZN8hbTEmz81vnxbkgqzJ8Yi2LeUp+pHoIftdq0PGxrWIC7oq45k1XKG6PLxTH1iS
tuZwwYXRXsWWNec8e6Rk0GDs1VI5NgQt1QI8staJh0hHcPkbfX7xU4iuUvizqIp1
OL/Oow35pC29JKksu2kkqZ21y4QP2g==
=4UJn
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--


