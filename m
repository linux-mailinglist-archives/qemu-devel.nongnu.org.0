Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D136B623
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:50:30 +0200 (CEST)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3VF-0001v7-CT
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb3Tj-0001WA-BI
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lb3Tg-0007aV-QV
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619452131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IIC0tEJIu3wd9TSdN+mnEZ+9oiABiW/tmbdDLHt2kxU=;
 b=HLSEKodnnvdwnRmy0nhmqm0H9iqMW51pTEc2hpadG6Ns/oJRv1grHZ1oHC63eNSyytbYxI
 UxywZ1fR4+lt6sYu5k0i6+8UuOADmY344mTszQSUz3vVa/m1mc83qmmD9+RRk0TOuzOWe8
 rgRBjTloWc/w7VnHwOyhFR8nFmFyiNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-1Ogx7CHzNLW8lJ2MM_uSDQ-1; Mon, 26 Apr 2021 11:48:46 -0400
X-MC-Unique: 1Ogx7CHzNLW8lJ2MM_uSDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D344B876E1B;
 Mon, 26 Apr 2021 15:48:38 +0000 (UTC)
Received: from localhost (ovpn-114-158.ams2.redhat.com [10.36.114.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62EA417A92;
 Mon, 26 Apr 2021 15:48:07 +0000 (UTC)
Date: Mon, 26 Apr 2021 16:48:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YIbgtbUJxtuQ5PoM@stefanha-x1.localdomain>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20210414114122.236193-1-thanos.makatos@nutanix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FT2XBjJNKXNzK3ND"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: benjamin.walker@intel.com, John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, John Levon <levon@movementarian.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 tina.zhang@intel.com, jag.raman@oracle.com, james.r.harris@intel.com,
 John Levon <john.levon@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Kanth.Ghatraju@oracle.com,
 Felipe Franciosi <felipe@nutanix.com>, marcandre.lureau@redhat.com,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 konrad.wilk@oracle.com, yuvalkashtan@gmail.com, dgilbert@redhat.com,
 ismael@linux.com, changpeng.liu@intel.com, tomassetti.andrea@gmail.com,
 mpiszczek@ddn.com, Cornelia Huck <cohuck@redhat.com>,
 alex.williamson@redhat.com, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 xiuchun.lu@intel.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FT2XBjJNKXNzK3ND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> This patch introduces the vfio-user protocol specification (formerly
> known as VFIO-over-socket), which is designed to allow devices to be
> emulated outside QEMU, in a separate process. vfio-user reuses the
> existing VFIO defines, structs and concepts.
>=20
> It has been earlier discussed as an RFC in:
> "RFC: use VFIO over a UNIX domain socket to implement device offloading"
>=20
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Thanos Makatos <thanos.makatos@nutanix.com>
> Signed-off-by: John Levon <john.levon@nutanix.com>

No review yet but I wanted to agree on the next steps once the spec has
been reviewed.

One or more of you would be added to ./MAINTAINERS and handle future
patch review and pull requests for the spec.

The spec will be unstable/experimental at least until QEMU vfio-user
implementation has landed. Otherwise it's hard to know whether the
protocol really works.

Does this sound good?

Stefan

--FT2XBjJNKXNzK3ND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCG4LUACgkQnKSrs4Gr
c8ibBQf8DEi5Md/MhxgJwS5EE8TSFtKAGMhFrtcQ7fcG0ljLe2pu315Ix02UEdch
M5PTDNDl+muRq34ZE3ENTdTLMyJDAKKg9hYvYk32EjeDkhqquIJcGY2S7R8ovzO4
Z8XOxWCFCXLYZ3P3LwGm2rTE0l5oO821D+8XzQHNPT7l7PW9J1Dn5mmG8qx8emHZ
aFInU7boiUfC8fsOInuAxyuv1dYErsq0UodVaOHxsY/Q4BPBQRw28zzzJrzWYO3L
tc6sOZLywP/+L8VmlpOTWnvQXW6ZuGbtDw8fVsSwNUmbct2vQPpoIu6yfmSZZb88
W1Mk/ZfLlMhJEMwRmJWIYruIBvc2gA==
=4uaO
-----END PGP SIGNATURE-----

--FT2XBjJNKXNzK3ND--


