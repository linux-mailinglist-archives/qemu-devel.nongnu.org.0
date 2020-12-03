Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609622CD2F6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:54:05 +0100 (CET)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklJM-0008Fm-Eh
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kklH7-0006s4-DV
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:51:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kklH5-0004rm-JD
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606989102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AYYqymFBjPclstjRwQnTqs4yKiafz2P0dQScOf9U7pE=;
 b=LTHZZsDam8Q3mUdLDP094aWBfwIMwkaBdikV/iiDbEZRk9nP9pfIDC/FjzKOkE4Dp6LTM/
 k/WvmqEYuMaXr84PgefuxCQ5Y/Q1eR/OXogPUxO3jl6O3Zx6tVofe0CBt4Ma56T+Tb5Y1q
 b9/qlEFoNw3vIbD3jcUfnC5yEKHrcfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-OyalS82fP2CPkCr7JNqBcg-1; Thu, 03 Dec 2020 04:51:39 -0500
X-MC-Unique: OyalS82fP2CPkCr7JNqBcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDE4F1081B21;
 Thu,  3 Dec 2020 09:51:36 +0000 (UTC)
Received: from localhost (ovpn-115-46.ams2.redhat.com [10.36.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD04163BA7;
 Thu,  3 Dec 2020 09:51:20 +0000 (UTC)
Date: Thu, 3 Dec 2020 09:14:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v12 00/19] Initial support for multi-process Qemu
Message-ID: <20201203091404.GA687169@stefanha-x1.localdomain>
References: <cover.1606853298.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2020 at 03:22:35PM -0500, Jagannathan Raman wrote:
> This is the v12 of the patchset. Thank you very much for the
> review of the v11 of the series.

I'm in favor of merging this for QEMU 6.0. The command-line interface
has the x- prefix so QEMU is not committing to a stable interface.
Changes needed to support additional device types or to switch to the
vfio-user protocol can be made later.

Jag, Elena, JJ: I suggest getting your GPG key to Peter Maydell so you
can send multi-process QEMU pull requests.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/IrFwACgkQnKSrs4Gr
c8hv0Af+KcN1akvxMle7ZLS2JteTaD1ibKAAO2Ywe5asiLVEvIJ/5IrFskEIpovw
Dvzm+cxq/lk0/2azH4NVpW1c2SeAv9EvqvedpBDMS/P83h/+srrU6DsjlVLegZjx
xzYH814hkRoAIReluJHtOcXYUKI2DsQtBraLrLOibC8Buhww8zPvGTAVNCOSaTpV
Geakxmd+qaOLHXLjWl4l5DgHx2/+bo8rOQ9zjvrJ60qPZFGZ6zRZ4SwYzGF2q7Mh
KSJ//dWnz4YKTf4wg5delcU4kBmtNocPOLuQD7FmoUL8fjFk9QXdA3FbjH7xGgEv
kNV/lLuju53AvF9gm5z7HMvGgdvOiw==
=53+n
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--


