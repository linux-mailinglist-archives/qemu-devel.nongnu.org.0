Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C880554AA01
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 09:06:32 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o10dD-00026l-AO
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 03:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o10U4-0005H2-BH
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o10U1-0006wO-Uu
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655189821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CXrbpevZNPaXtXC8HyrwgahUgr8nzGzepH2xYb3pXts=;
 b=AzJnXtzdERsKJRZozg0+vkxzRWU2l2oVMZ5CaIYpCYlRfehoBTILsIRI5L69YqG8cE0dXm
 KcN9dWPtE81eA5XZXBuVDRgySK7R+D3WTn9troJkNhZnHlsUaOgjcqVb4mxiR0Buy7qVg9
 TJVXLd2Uuycg8DuC4vAcJFykhP29Kq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-zAM2wJOjOeWeL8-qo1U7gg-1; Tue, 14 Jun 2022 02:56:57 -0400
X-MC-Unique: zAM2wJOjOeWeL8-qo1U7gg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22D00800124;
 Tue, 14 Jun 2022 06:56:57 +0000 (UTC)
Received: from localhost (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 816621121314;
 Tue, 14 Jun 2022 06:56:56 +0000 (UTC)
Date: Tue, 14 Jun 2022 07:56:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v12 13/14] vfio-user: handle device interrupts
Message-ID: <YqgxNtPZVBTxkn/h@stefanha-x1.localdomain>
References: <cover.1655151679.git.jag.raman@oracle.com>
 <9523479eaafe050677f4de2af5dd0df18c27cfd9.1655151679.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RXgHxg79jrrCsO0e"
Content-Disposition: inline
In-Reply-To: <9523479eaafe050677f4de2af5dd0df18c27cfd9.1655151679.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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


--RXgHxg79jrrCsO0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2022 at 04:26:33PM -0400, Jagannathan Raman wrote:
> Forward remote device's interrupts to the guest
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/msi.h              |   1 +
>  include/hw/pci/msix.h             |   1 +
>  include/hw/pci/pci.h              |  13 +++
>  include/hw/remote/vfio-user-obj.h |   6 ++
>  hw/pci/msi.c                      |  49 +++++++--
>  hw/pci/msix.c                     |  35 ++++++-
>  hw/pci/pci.c                      |  13 +++
>  hw/remote/machine.c               |  14 ++-
>  hw/remote/vfio-user-obj.c         | 167 ++++++++++++++++++++++++++++++
>  stubs/vfio-user-obj.c             |   6 ++
>  MAINTAINERS                       |   1 +
>  hw/remote/trace-events            |   1 +
>  stubs/meson.build                 |   1 +
>  13 files changed, 297 insertions(+), 11 deletions(-)
>  create mode 100644 include/hw/remote/vfio-user-obj.h
>  create mode 100644 stubs/vfio-user-obj.c

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--RXgHxg79jrrCsO0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKoMTYACgkQnKSrs4Gr
c8gqtwgAljxoUzoZg0WoiudMIry4V8zEAKgKWATPE/ttNOHch7gA78SNmwqPWpIu
eJrjJRHuVKsEdhP4RU/mj3B4KWRXAehch8jnnTvQOuu2Re+Quzz29Xr4qbpZMRNS
MDauYJiSh884g2NXFkpHDiJSNgd93n+64KxoqHeu3HvjAH3/sOfyzGpo6ahaJsE7
p30Taacm8LojpHSye3DsNsszMQ59Q7mDl0MOixePSTwlNeY4exjkZIkcn68IbAfe
DH5/NB/B4uTBU6oSQDYwccx1MzZlMSNLfA4XZGrCjAQPWVMfio7EmxRv5Aq9bSbd
VC0ZAml7fgU1frgLsa8Yynlda/w8rg==
=lnnc
-----END PGP SIGNATURE-----

--RXgHxg79jrrCsO0e--


