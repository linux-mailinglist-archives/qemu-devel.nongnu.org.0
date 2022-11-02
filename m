Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5518D616F51
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 22:02:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqKs3-0000th-Bx; Wed, 02 Nov 2022 17:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqKrz-0000tV-PC
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 17:01:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqKry-0006b0-EB
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 17:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667422912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fE/uK9YVa0lqZcXskrvJnBlpJ2TM3Ko2Zcdn5YcoaY4=;
 b=FOeQeB/CeitY7ypHsa5PvziN79d51RB57346kQIuIhiXrzOiWAlZymI8cGbDicbAQCeVeo
 qWEenF/DPCR5giTJ8v1Dlh+/b1MSNRRbJ1cHBS1ZNrZiO5OvlwU7dkm8xiVHeAsKtajIXB
 wXJaRdhdu4kTARMWX/04tV0Z2uDuvTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-39fE6OHAOVGegOFhQ4aQgw-1; Wed, 02 Nov 2022 17:01:51 -0400
X-MC-Unique: 39fE6OHAOVGegOFhQ4aQgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91AAB185A78F;
 Wed,  2 Nov 2022 21:01:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E844140EBF5;
 Wed,  2 Nov 2022 21:01:49 +0000 (UTC)
Date: Wed, 2 Nov 2022 17:01:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 damien.lemoal@opensource.wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com
Subject: Re: [RFC v4 3/3] virtio-blk: add some trace events for zoned emulation
Message-ID: <Y2LavMbOVFGtNVwV@fedora>
References: <20221030093242.208839-1-faithilikerun@gmail.com>
 <20221030093242.208839-4-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u/s2TzErVuQ03hgm"
Content-Disposition: inline
In-Reply-To: <20221030093242.208839-4-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--u/s2TzErVuQ03hgm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 30, 2022 at 05:32:42AM -0400, Sam Li wrote:
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  hw/block/trace-events |  7 +++++++
>  hw/block/virtio-blk.c | 12 ++++++++++++
>  2 files changed, 19 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--u/s2TzErVuQ03hgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNi2rwACgkQnKSrs4Gr
c8gQ9ggAuJLvoTCEGyukQ3HuihsXZ4XDQY/oQCsRy1AT3a7wXAlgaNWmenOQ77j+
utBdYCG7HfI+VS6tj/wilZqmtXGhauaJbjoVbpkrZU0ZWedqZQx28oatLQdVbS+V
9IvKuRLSFKfEjEOWrZdwCKCMCla/rGPjs7a5Ne8XyYOK63pRCN/mqphmOg9Omrc4
zreNsX48t+ES3hxmhfYCWkQHzC/LaX45yf+IVWet8t73301Y7KzOvyKOdAkVfvEv
TDBF/VOEtmrf0qgzYJg9bBNDq/CavXaYkEuU7hvAKIR0+I/RUprSmu1IVzmed1tz
rEekTxSkHWBnYlOuscrA4sidlcTE5Q==
=aX/J
-----END PGP SIGNATURE-----

--u/s2TzErVuQ03hgm--


