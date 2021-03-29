Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE034D60D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:30:08 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQviK-0006ql-02
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvgn-0005uJ-32
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQvgl-0004Zq-EY
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617038910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4bGFtr8WYPrTfOlLi/liGnaFv0n73Fh4O/3rhFKwko=;
 b=GX6mIifZWNOX8RDGpsQz+VoHUXdKOpjDcEHkPSLpuUuc5eF8Zz1yp5+eMp9u9jMgnSjF4A
 t+E7DFP6MZViCzF/tjdlKkFUOVybiZ8uQ+9w9WQl4+TMxL10gNnux8CNqS4eCVTsWPGYYv
 yqPiHDHmoSm3Q9pHYFJ/H+dLIby8lTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-K6ov8cY7NbWemORlaPvFFw-1; Mon, 29 Mar 2021 13:28:28 -0400
X-MC-Unique: K6ov8cY7NbWemORlaPvFFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8996A10C438E;
 Mon, 29 Mar 2021 17:28:27 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FEAB196E3;
 Mon, 29 Mar 2021 17:28:22 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:28:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 8/8] virtio-scsi: Use virtio_bus_set_host_notifiers()
Message-ID: <YGIONSfnTcEu+Vw7@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-9-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-9-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="azd4k7xOhjJ7tAYf"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--azd4k7xOhjJ7tAYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:07:35PM +0100, Greg Kurz wrote:
> This allows the virtio-scsi-pci device to batch additions and deletions
> of host notifiers. This significantly improves boot time of VMs with a
> high number of vCPUs, e.g. from 6m13.969s down to 1m4.268s for a pseries
> machine with 384 vCPUs.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/scsi/virtio-scsi-dataplane.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--azd4k7xOhjJ7tAYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiDjUACgkQnKSrs4Gr
c8hj2AgAwMU/ZuJfDL41/A0TVvUCO1QVlHw5PFE82dE1Xka9cEHD9PESPS7FyD3+
UG914GsAFoSQio9CjjcHDp14VU1MkT1e1xo8p3FHh8P4BOUoFsfx7L2oWXPvwyvd
17bTVHJt+A6EOspxQ96Etkb4IeP0M5jIiu5GulfUWJ3xO8SUboPbkh5mYUdJaSQK
h6mjU4jLHrrGdaq93pZyVuNZM58IXdD+9696ekfAmP848mBkPGKBbbeSRYn8GzVJ
TM6mh5VuHlQYDx6C2xwPBn8ZtsEvv0bUs+CTJaII47XSn0bzYe984SIyQHDPp+N2
b6YWBSxSH4HBmjFfi5Zz2yvVfG1Aww==
=OKWG
-----END PGP SIGNATURE-----

--azd4k7xOhjJ7tAYf--


