Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4249B7D0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:42:26 +0100 (CET)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNxh-0005w3-7X
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:42:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCNiJ-0000C7-3P
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCNi9-0000mi-HE
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643124331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZXE7zHDoPtBSP3efAkoFradYRG/hPaYf3kQ7Bf20x/w=;
 b=UC6S2pNEnc50zU59zirF6eF7Jk2JZVcDSXwl2f2KszvAJSa/XfF5zpYjz1SbUtrQWVyeFP
 naz0fe3SOigYiOrd2IBd+iP8L2oxs9DRB91D6JS9YPFsvCyP6CmCJ/meUK1rO812Zr753v
 4AMrOw8KU6fZ8HqElzvg0eAnQxcPblU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-gOOm7r2ZNA2bt-mS57TJew-1; Tue, 25 Jan 2022 10:25:27 -0500
X-MC-Unique: gOOm7r2ZNA2bt-mS57TJew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBA3101511F;
 Tue, 25 Jan 2022 15:25:25 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1433070D20;
 Tue, 25 Jan 2022 15:25:10 +0000 (UTC)
Date: Tue, 25 Jan 2022 15:25:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 16/18] vfio-user: handle device interrupts
Message-ID: <YfAWVYtpxNqtf4lf@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <bc2c2c117aa72cc5d619ecfe549a252303ae539d.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4GzAi0jX0QLm2Ppp"
Content-Disposition: inline
In-Reply-To: <bc2c2c117aa72cc5d619ecfe549a252303ae539d.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4GzAi0jX0QLm2Ppp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:42:05PM -0500, Jagannathan Raman wrote:
> Forward remote device's interrupts to the guest
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/pci/pci.h      |  6 +++
>  hw/pci/msi.c              | 13 +++++-
>  hw/pci/msix.c             | 12 +++++-
>  hw/remote/vfio-user-obj.c | 89 +++++++++++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  1 +
>  5 files changed, 119 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--4GzAi0jX0QLm2Ppp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwFlUACgkQnKSrs4Gr
c8hIaAf+L5p0insvP0whUI7J2GS+zW3zazAWzAu4aFZp0o2h7omsxo0c/t7mChfv
FiV/bX2Vyf9bDiXGrEe3IeGKW5ir6jm2mLNKB747yW0uuFc5UgarYgZwipWnHyeN
/6F+ryOndVSlRE8Qb4QETo6C5X9ss6HNMkyo6HrihWVVyzg8Uo3AM8NJSN9UPcml
F35KPqsO1otg4QkNQfw0lRVqxV1aG1B/tpm1m6A7O1+9h1B9sYWl5NuKmRkLTlqm
MFR3FY6+k+n6yF+RZQQ5qs0s94BkUEbohEq3BYMVcFRkIrOM8xMz4U+b6JpIXMRx
v6AVNz+Qn8kzSeISM1yaFGF8bQ9tYw==
=d0yv
-----END PGP SIGNATURE-----

--4GzAi0jX0QLm2Ppp--


