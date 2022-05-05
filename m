Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D339151C427
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:44:54 +0200 (CEST)
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdev-0001Ai-VA
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdcO-00075d-2c
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:42:16 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:54157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nmdcL-0004SO-DC
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651765332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=598C09uNdBApjtXM7Cut0P/EtshcEgsLtTZ+fdQ0uRY=;
 b=ZU95Bzhv2GrGC2ZBHpOWPs3RDgRIvILNPIvXf7oUryWfrMAtKnh/VHpnwO50AejGVpfXe+
 PuqkUAH41TzC/PDAuwLB2tsiD8y8Mu6FCXVAKoulpCctYQv6xjDz/jXy9KEVpupIYJ7Wgd
 LN4xhernUAssmxNatxivq6fABi2Fbmc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-yb9BF6wbMjGWm6sv0X4tgg-1; Thu, 05 May 2022 11:42:01 -0400
X-MC-Unique: yb9BF6wbMjGWm6sv0X4tgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF027800B21;
 Thu,  5 May 2022 15:42:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61FAC40D2820;
 Thu,  5 May 2022 15:42:00 +0000 (UTC)
Date: Thu, 5 May 2022 16:41:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, f4bug@amsat.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 bleal@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 07/17] vfio-user: define vfio-user-server object
Message-ID: <YnPwR4cuC0wabG9e@stefanha-x1.localdomain>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FrX8QCrg5LL1lQAx"
Content-Disposition: inline
In-Reply-To: <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.74; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--FrX8QCrg5LL1lQAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2022 at 10:16:48AM -0400, Jagannathan Raman wrote:
> Define vfio-user object which is remote process server for QEMU. Setup
> object initialization functions and properties necessary to instantiate
> the object
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  qapi/qom.json               |  20 +++-
>  include/hw/remote/machine.h |   2 +
>  hw/remote/machine.c         |  27 +++++
>  hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |   1 +
>  hw/remote/meson.build       |   1 +
>  hw/remote/trace-events      |   3 +
>  7 files changed, 262 insertions(+), 2 deletions(-)
>  create mode 100644 hw/remote/vfio-user-obj.c

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--FrX8QCrg5LL1lQAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJz8EcACgkQnKSrs4Gr
c8jD7Qf/atePvbUwQK4a5Tu8AAw7/4F1G4f8bbAd9MLCvMmgoiBVBeTJBtBGlPCf
SqQy8GN9at9+4cOkWfmQjDOxts3KzvGSWmZSoup1+l6lUBGKm+7iat9+21VdxCoO
hmzZNxIzCa8w9vFy0hFLNyv98uPusJ2P0AUlteNQ9pm9D0fDPvr3fA2hMBILzFSB
NRDm0bkh2bpedjCjhBgzaTEDqKWtS2V9UshnIYnnm7SvpAJuyL9sDiFRYSXFYfqS
SNHNAUExQGN0L9JKp9JQa0ufLJm1BAXVc/kHtqy+qvz7m4OXNGrF9ju/7kaBrpXP
bn0Wz1OMQxLnnJ8o2zt4Prrba5lE4Q==
=FrNX
-----END PGP SIGNATURE-----

--FrX8QCrg5LL1lQAx--


