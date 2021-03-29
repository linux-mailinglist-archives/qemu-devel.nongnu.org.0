Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED134D605
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 19:27:47 +0200 (CEST)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQvg2-0004Xj-FA
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 13:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQveY-00038P-Op
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQveX-0003QE-6C
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 13:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617038772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RMPJG0OAcrq5Q7J7uxo0xY5EsYBQlgaVN7LY55TFqbU=;
 b=NaOGrBZEg/OS9pR97fcmWRE2f0kvRkXVX/lcmipt5VStCNeg8ExwqThH9/XjaEnt+xKFax
 96n4B1kPPWFgOMqr+Aw1iWYuqVF4TtpxFodl8PJXVB3P/r69ipH5fS+d6mbgy2ep3xrCDI
 1AicNRkaJFR+FBuwUplsqEPK3w8lD+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-F2nxlgcpMWeiJOI8WfIpug-1; Mon, 29 Mar 2021 13:26:08 -0400
X-MC-Unique: F2nxlgcpMWeiJOI8WfIpug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6843D96E540;
 Mon, 29 Mar 2021 17:26:07 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8E105C582;
 Mon, 29 Mar 2021 17:26:03 +0000 (UTC)
Date: Mon, 29 Mar 2021 18:26:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC 6/8] virtio-blk: Use virtio_bus_set_host_notifiers()
Message-ID: <YGINqjXy/rxJ+9a3@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-7-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210325150735.1098387-7-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9wHZFhXVQcxhUY+b"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--9wHZFhXVQcxhUY+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:07:33PM +0100, Greg Kurz wrote:
> This allows the virtio-blk-pci device to batch additions and deletions
> of host notifiers. This significantly improves boot time of VMs with a
> high number of vCPUs, e.g. from 3m26.408s down to 0m59.923s for a pseries
> machine with 384 vCPUs.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/block/dataplane/virtio-blk.c | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--9wHZFhXVQcxhUY+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBiDaoACgkQnKSrs4Gr
c8hS/gf/WYPxFv6NMxHFUg5PP8TBezAHKGcN4GInxk9h+CPITj61zVUtPq5Wnh4r
xnJsSAnxmuNzG8K0EWNzx5U4gFX6hF7r3yfZykZusoSqdqcVxBoPCqTmlrkxas8b
1GiL3vmf5I5C+l/pIOe6T6HF+/uSvkv2sgzzi9FWMzMxcLXSGczJPcYO+EsHTjrw
LaI/W/iLWEFfPHHfbdUB9DXGEUaR36uM23nZABoC3qSLGwM0Nz0GaRQtYhe+92q/
fa+U3M2iKtjIq3MA4v+Gye612xeDUaIx6bfbtoNPrBP4m6Ecu3eIL1o8QCSWGY0b
ZNBhvEmCMoF34rRTrsNNxOhPueLQGw==
=V+mu
-----END PGP SIGNATURE-----

--9wHZFhXVQcxhUY+b--


