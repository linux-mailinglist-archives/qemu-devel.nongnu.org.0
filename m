Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA41613DD6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZty-000108-8c; Mon, 31 Oct 2022 14:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtn-0000mp-Ca
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtl-0003b0-Os
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E9pvOrrl07yJaidqm1xhbHL5IoFYKWAXolvnfxVNFTc=;
 b=arnnuYQtv5XIszqYc1fwwXLA65FZm5f4CD1/3wInWznZNwOxHT6LJSL3mbkRIlJavaNoDk
 luXsw1anndUMTpltXqVd54x8lHeXsBEMzOVSplXsOkx+sS647/wuMfirEwB51NqMdJk4TS
 eHmsd2F4suFYRNfy+2fYi3fTgDXSo6s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-vDSHubuANYarrfjAIr_ljA-1; Mon, 31 Oct 2022 14:52:32 -0400
X-MC-Unique: vDSHubuANYarrfjAIr_ljA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 736F91C0879B;
 Mon, 31 Oct 2022 18:52:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB89D2024CB7;
 Mon, 31 Oct 2022 18:52:31 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:24:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] block/blkio: Add virtio-blk-vfio-pci BlockDriver
Message-ID: <Y2AS6ZheNQSoO9kn@fedora>
References: <20221028131635.710267-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y7OcOiI5WkuTV+X1"
Content-Disposition: inline
In-Reply-To: <20221028131635.710267-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--y7OcOiI5WkuTV+X1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 02:16:35PM +0100, Alberto Faria wrote:
> libblkio 1.1.0 [1] introduces a virtio-blk-vfio-pci driver, which
> accesses a virtio-blk PCI device using VFIO. Add a corresponding
> BlockDriver.
>=20
> [1] https://gitlab.com/libblkio/libblkio/-/tree/v1.1.0
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>=20
> This is dependent on a pending libblkio fix [2], so we may want to wait
> for a new libblkio release before queueing this.
>=20
> [2] https://gitlab.com/libblkio/libblkio/-/merge_requests/140
>=20
>  block/blkio.c        |  8 ++++++++
>  qapi/block-core.json | 18 ++++++++++++++++++
>  2 files changed, 26 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--y7OcOiI5WkuTV+X1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgEukACgkQnKSrs4Gr
c8hxEgf6A2KrTFtXeiTU20u4H1/CCMtoZubqTYI1wYQcddMQmnq/fq1ai1OvxnLA
6qAJTIDIhGCYa53DcXbEYaR3aOi41m5q7E6qxVubN/q0+cguCh8Shz/mQfzstNOs
9lQtqi+TdXyrfnZLvEwAIOE+GjdDB1f5/lDF+GqsUfLjeqkAxFLJqyPSvZmiUVoa
KF/YAKQF1zCh8lQvvpwmoXlV23uX+SuchPGL8uLE7hZnj5Snc7ZnRrfaeFKarAes
UFogSoOFJJrBDxD0QDSy0jwSHfDz8YK3aw6rGw2IIjOM/MbqEaCACdEQtd2za02u
MesnOea+88dkkuuEquTtf/t2Fxv2sQ==
=/8m+
-----END PGP SIGNATURE-----

--y7OcOiI5WkuTV+X1--


