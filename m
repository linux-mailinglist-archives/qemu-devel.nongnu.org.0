Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE04BF592
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 11:15:33 +0100 (CET)
Received: from localhost ([::1]:53626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMSCi-0003yP-6V
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 05:15:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMSBA-0003K7-H0
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:13:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMSB8-0003my-Bz
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645524833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=awaZpykW2YHJbXiTXJcWi/UnI9HQmCVJJRmiZQVjVB8=;
 b=Nt8YaI0rNMLH2NdGUcy8g0Est+1QQUjzaAcmg2kh9HbDUlQ8LwAAgc3DJTEmq50PlKD4hV
 npnMtsy19UyD77/Io/XCUV9imjN30x1EmNOcUTPLx30VW3+2lUMaHL9VKkY+np2ExvCg2d
 6dUOy+kGHee7JG3uLnZ4v+fIFYz1c60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-QpMdO6q3PC6K_O7nqzLp6w-1; Tue, 22 Feb 2022 05:13:50 -0500
X-MC-Unique: QpMdO6q3PC6K_O7nqzLp6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9F0B1800D50;
 Tue, 22 Feb 2022 10:13:48 +0000 (UTC)
Received: from localhost (unknown [10.39.195.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81BD675558;
 Tue, 22 Feb 2022 10:13:18 +0000 (UTC)
Date: Tue, 22 Feb 2022 10:13:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 10/19] vfio-user: run vfio-user context
Message-ID: <YhS3PdNA/JfhWvBj@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <1735f90d6a5784a93cad5e46ebc6bb1a40ba1f5f.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GLAmXPh295T7A30+"
Content-Disposition: inline
In-Reply-To: <1735f90d6a5784a93cad5e46ebc6bb1a40ba1f5f.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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


--GLAmXPh295T7A30+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:57AM -0500, Jagannathan Raman wrote:
> Setup a handler to run vfio-user context. The context is driven by
> messages to the file descriptor associated with it - get the fd for
> the context and hook up the handler with it
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  qapi/misc.json            | 23 ++++++++++
>  hw/remote/vfio-user-obj.c | 96 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 118 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GLAmXPh295T7A30+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIUtzwACgkQnKSrs4Gr
c8hqjAf/bqW3h3NdaPpICab+n2vFhmv7P1E/z///bnpAoMspuUMMXkkOR2c2ZpFN
4TGHu19u9DPrUV3kWOJUvTCkx9wMeZ0hAhfMBNJQS2uYEkSrlK5D/QrPlyHwreFt
CY9AdXlzwa+IlVvFke6dnIYlqN/92S01wULSCVQkQfd+SMVWvwv7GxCAgudjk6yv
BrVEaJjbsMCWh59IkpR4I/xvriLlkFvib2ekiBqdigYjRIWA2tr26mcVwpQk9wdt
lDOVV+UpeSzFKJLnycg49/X3Ti5Vgrdqvosaobp833fU1Ui5AMqEcctjxaKdVbH9
fgi10is2mazugSnE/XqY8WxvuJ6amQ==
=s0ad
-----END PGP SIGNATURE-----

--GLAmXPh295T7A30+--


