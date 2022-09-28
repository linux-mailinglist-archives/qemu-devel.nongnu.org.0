Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA075EE5A2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 21:26:13 +0200 (CEST)
Received: from localhost ([::1]:53834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odch7-0001OM-UN
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 15:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odcd2-0006X4-MF
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odccy-0003xT-5I
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664392910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZXGwIaD76gsyW1uUyOERNQ8W0Sgt0XONk2DKYuCQGcw=;
 b=CEqtQnOpklJJk2/vcKK9fmZLg7gXph3Q3U55BuYyPRR8oUQMSHBl0MMfog0zPiPa3CKJNF
 cjj66y3Fa9/Jtta/sIG/OH+4gY52frO6+/4/EpNdL7GDuC8irLGLNhEmU2GBH4fiRZD6TG
 DitYsLxomISrormp70LTrA3Sbo2xpE8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-XK8vvKTtNyW5PSAOxH4Dcg-1; Wed, 28 Sep 2022 15:21:47 -0400
X-MC-Unique: XK8vvKTtNyW5PSAOxH4Dcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8179F29AB3FB;
 Wed, 28 Sep 2022 19:21:46 +0000 (UTC)
Received: from localhost (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 599AC140EBF4;
 Wed, 28 Sep 2022 19:21:45 +0000 (UTC)
Date: Wed, 28 Sep 2022 15:21:43 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eric Blake <eblake@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, afaria@redhat.com,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Subject: Re: [PATCH v5 11/12] blkio: implement BDRV_REQ_REGISTERED_BUF
 optimization
Message-ID: <YzSex5t0UIAT+LPU@fedora>
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-12-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KbhrqS0tid5zZVUX"
Content-Disposition: inline
In-Reply-To: <20220927193431.22302-12-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KbhrqS0tid5zZVUX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 27, 2022 at 03:34:30PM -0400, Stefan Hajnoczi wrote:
> +    ret = blkio_get_bool(s->blkio,
> +                         "mem-regions-pinned",
> +                         &s->mem_regions_pinned);
> +    if (ret < 0) {
> +        /* Be conservative (assume pinning) if the property is not supported */
> +        s->mem_regions_pinned = true;

This is too conservative :). It can be changed to:

  s->mem_regions_pinned = s->needs_mem_regions;

That way we avoid ram_block_discard_disable() for libblkio drivers (like
io_uring in libblkio 1.0) that don't use memory regions and don't
support the "mem-regions-pinned" property yet.

Stefan

--KbhrqS0tid5zZVUX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM0nscACgkQnKSrs4Gr
c8g7Ogf9FCmMX4AvXRJXRuDHGr8Ahv1zO1vbug9dX/NejwEaonPno/9qg2KeNIFF
kDJITi2NT3Eq3O6WI7grrUYYwmDznkfiephfceGYOBn5XQ6cOEABiPJeyU1wGVfq
853jzJBCgsugiO1Z7m4+lBdfirpWFrsqbqjnEPzIcPg522H88HunEHmniyMd8rFe
ZQeL6VUeNSRco6KrN+dI/+z9/b30FiwO/53jjrt+yakFjobJnY4cL1XWZAujQqZe
H4O4FyBea/XeDAOtyMyXXt5lgDL1WiriOFo7IeSYLf/kBHdlHFGCyEL2Lc/BiN7T
8KXBME1N8jDrsmuw/ujRVClzhZcHig==
=jhXz
-----END PGP SIGNATURE-----

--KbhrqS0tid5zZVUX--


