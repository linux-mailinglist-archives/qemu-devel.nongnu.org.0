Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FAB6BB774
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:20:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSur-0004Zy-1j; Wed, 15 Mar 2023 11:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcSuj-0004Yu-6X
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcSuh-0008Nn-Iw
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678893577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcTfM44RSuru962OZIvDWU0ncftfq86SRtNTtDSqztY=;
 b=PSIuK9xTP3Zdx8BmsrKmVmqZEpESUGamaXBGA8fdoyj+BvKNKbojtM/aIjkwPsmH4XYzkZ
 xa06vVsUi885pcg7j6PKc9AVFD4bGkg3ca+YEMPGkRs8QytNo3BJM3dqEKvSzxLxfR/vVI
 aAx999qIqVtSxW1yGLqzfIIg4ouzhSo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-Y1iB8-ULMEmIOBRp7xXAWQ-1; Wed, 15 Mar 2023 11:19:31 -0400
X-MC-Unique: Y1iB8-ULMEmIOBRp7xXAWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7AD88028B3;
 Wed, 15 Mar 2023 15:19:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B1CA140E95F;
 Wed, 15 Mar 2023 15:19:28 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:19:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 1/2] docs: vhost-user: Define memory region separately
Message-ID: <20230315151926.GA16636@fedora>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O6Z1j1jWA1rh9Wk0"
Content-Disposition: inline
In-Reply-To: <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--O6Z1j1jWA1rh9Wk0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 02:21:00PM +0530, Viresh Kumar wrote:
> The same layout is defined twice, once in "single memory region
> description" and then in "memory regions description".
>=20
> Separate out details of memory region from these two and reuse the same
> definition later on.
>=20
> While at it, also rename "memory regions description" to "multiple
> memory regions description", to avoid potential confusion around similar
> names. And define single region before multiple ones.
>=20
> This is just a documentation optimization, the protocol remains the same.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  docs/interop/vhost-user.rst | 39 +++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--O6Z1j1jWA1rh9Wk0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQR4f4ACgkQnKSrs4Gr
c8hxuAgAp4tv1RvL4VEQf8h2eNofdFyh5KtzUUn3Q8+eRtHJ3diMD9MshFHl+4JC
5M+4rQoODTICf0bgn659wYs5D2fF0cSYSAsqJx0594lLJknX0LX+YvRGWycVz/8l
81+iNJPaGsPU5k32TGorK5F3ZoxrnzgH6f8BPnVkACmABhyOZcVd+ZLHZZdatiLr
4En+5Ngv9Fd7eq66UO3JilZJZTTai0zWGU+enR8CmTGoD8olqx9gJvUOJjpEPkcK
3Muq52sLH3DaiK1/KUaz9g6j0TYlHwu+65YGRXE4vNM4Po8bY8GeRZRrnBZFcLmA
OPu6eaIIlskeujoEmUZ0StMCy0BT4w==
=GWpD
-----END PGP SIGNATURE-----

--O6Z1j1jWA1rh9Wk0--


