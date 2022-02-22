Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76A84BF70B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 12:16:01 +0100 (CET)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMT9E-0005DV-Ex
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 06:16:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMT4C-00023F-HL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:10:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMT4A-000593-LU
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 06:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645528244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ZkGbRi4kK4FwCzFBiH28+49ILyP5kiY7Z5lJoSCaqo=;
 b=Yg2lx0zcTvaAim1YuqANbbariU9ingrRE+whecoIIHnLlxtKAkVV6TAIEL4PbB843tTg/G
 TTO+oJqCfAAfp8rTJ0JKK50jd/3w+QsNJ4C53AZLHZhTrzwsESNq2RE1jNK04cLMnOFy4G
 h5MXspraXPgtBJHFYymwTPEhW3QceeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-hf0Qyn3CPrqI_oOt-fZobw-1; Tue, 22 Feb 2022 06:10:41 -0500
X-MC-Unique: hf0Qyn3CPrqI_oOt-fZobw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB28F80DDE2;
 Tue, 22 Feb 2022 11:10:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45A40106222F;
 Tue, 22 Feb 2022 11:09:48 +0000 (UTC)
Date: Tue, 22 Feb 2022 11:09:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 11/19] vfio-user: handle PCI config space accesses
Message-ID: <YhTEehuOC5SXXBA9@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <435dad76ebf552f1b155c8ebb2becdefdb9edd10.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fCY7jbG9t7Ez2Chj"
Content-Disposition: inline
In-Reply-To: <435dad76ebf552f1b155c8ebb2becdefdb9edd10.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fCY7jbG9t7Ez2Chj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:58AM -0500, Jagannathan Raman wrote:
> Define and register handlers for PCI config space accesses
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  2 ++
>  2 files changed, 47 insertions(+)

hw/pci/pci.c:pci_update_mappings() will unmap/map BARs when the
vfio-user client touches BARs. Please add a comment that the remote
machine type never dispatches memory accesses in the global memory address
space and therefore we don't care that multiple remote devices may set
up conflicting Memory and I/O Space BARs.

--fCY7jbG9t7Ez2Chj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIUxHoACgkQnKSrs4Gr
c8i2iQgAqxaa80M77jJaMn/sm4f5Xh1YalQp/ZQZ02IAMTsX+8c5ketMxB5ZbvOO
g0RCjjPws8KqpNaXsfXleoSSFB/sjEw3rj/wvVbLLdnGf7VwQaByBltgTWA1L85U
nY2tB7HVe4fz5wdItRMJC4OSn2tpAqcXgWYaYVA0PJcvYG9l24VA52TfrxHeZgnJ
fHl7vAf38Ap6vwyfhf4XJyAX01568WX/Bw62uh+k0yfvkvHL7hGWMvXBBnKRKRHv
WKUObMzN8o6ThW7GS0/gV+bixyLF/BhdhVgJUpHaZDMrK2GFMzpZgdOusm/hdk1+
r1GrpGfcBcvf11xLwV9Yb5rJSPBj9g==
=/D0W
-----END PGP SIGNATURE-----

--fCY7jbG9t7Ez2Chj--


