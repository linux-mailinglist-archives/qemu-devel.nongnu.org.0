Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE96BB7AA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 16:26:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcT0J-0008Pa-N8; Wed, 15 Mar 2023 11:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcT06-0008JH-PJ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcT04-0001UM-Qx
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 11:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678893911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZmsDWDJ1wYkb1pq/w2HSM4F9if02u6jamfytLtq8BF8=;
 b=NUeob8JbpWoRszmdP6jeEV+42tZoKOHkewHb9JX/jQ+LgtTBmxuOZiYx8NQhGNar2yjjOV
 rXB5oEH/mtFs5otYVqfXT72maapYNGAT30DRRLq1J8xK8K+yQ6J6BV1PBYx0kFKjx1jgHB
 LaOzEKwoi5HYKS5j3oxz2IDEb/PgoBQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-nlHLXK6FOqadA5943BuqQA-1; Wed, 15 Mar 2023 11:25:07 -0400
X-MC-Unique: nlHLXK6FOqadA5943BuqQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383AA280A322;
 Wed, 15 Mar 2023 15:25:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60E49C164E7;
 Wed, 15 Mar 2023 15:25:05 +0000 (UTC)
Date: Wed, 15 Mar 2023 11:25:03 -0400
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
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Message-ID: <20230315152503.GC16636@fedora>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OCgU33HjGcfce1Ev"
Content-Disposition: inline
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--OCgU33HjGcfce1Ev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 02:20:59PM +0530, Viresh Kumar wrote:
> Hello,
>=20
> This patchset tries to update the vhost-user protocol to make it support =
special
> memory mapping required in case of Xen hypervisor.
>=20
> The first patch is mostly cleanup and second one introduces a new xen spe=
cific
> feature.
>=20
> V2->V3:
> - Remove the extra message and instead update the memory regions to carry
>   additional data.
>=20
> - Drop the one region one mmap relationship and allow back-end to map onl=
y parts
>   of a region at once, required for Xen grant mappings.
>=20
> - Additional cleanup patch 1/2.
>=20
> V1->V2:
> - Make the custom mmap feature Xen specific, instead of being generic.
> - Clearly define which memory regions are impacted by this change.
> - Allow VHOST_USER_SET_XEN_MMAP to be called multiple times.
> - Additional Bit(2) property in flags.

Looks good, thanks!

Michael is the maintainer and this patch series will go through his tree.

Stefan

--OCgU33HjGcfce1Ev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQR408ACgkQnKSrs4Gr
c8gHnQf/QCidE8WSy1ka0dk9J5LPoXLVAWi2jeZa8dQXbtfkfPLQVuMD94klQw0p
ttlBsAdsyw5lvbC0fdSClu12bCgKzMDVNH/vXFNkSkDWYFX4gIgx0jtDfeYbtW75
YmWbol1fw+CM/RWkUWKm+FsyyGge8iNDf7HfM4BvpzfvdZh+4YSOEj+xBmYaq9VT
NGM5DzCy5N8LpC/oHv3sxnKLXUqML6+rdlHvcAZpDlos4UzcobtHAh7YOhumhBuw
qfCXVKjSQ7hglcFaZRTUtoPOWZR+a3GpRAhS3V6sTryjmal/wuOrKe8SAYXD9ba1
dPqU2PNw8Qq3755oaw/Haw+2cO9JXw==
=BraW
-----END PGP SIGNATURE-----

--OCgU33HjGcfce1Ev--


