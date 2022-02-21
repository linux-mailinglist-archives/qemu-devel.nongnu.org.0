Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956234BDA99
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:40:32 +0100 (CET)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAne-0005RA-Rn
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:40:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAfE-0006nj-4y
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:31:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAfB-0006OR-UB
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:31:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645457505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KtOcl7N41sV+5yx7qGBqrtqKeHr5q0CCQLIewx7Mmqw=;
 b=Zi/UTkgrYocmTwGtxecvlNCpcks206yx2Bgn65pRJ8Ftaf3VIvku3IieGIN2zybAbbcGjW
 fZnlAHZiy7h/RIBX1fxmoCCW/FMPjJGTHZVN/xJIl5bh7IWDzfiTQksBD4a+FF2iXbWzhb
 YEWtZI4Tf4mMzLwqJZy0XXu2ITDBpps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-5deB2PpjPhKNI6dAVPBdcw-1; Mon, 21 Feb 2022 10:31:41 -0500
X-MC-Unique: 5deB2PpjPhKNI6dAVPBdcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1741091DA2;
 Mon, 21 Feb 2022 15:31:40 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DE87752B9;
 Mon, 21 Feb 2022 15:31:12 +0000 (UTC)
Date: Mon, 21 Feb 2022 15:30:57 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 04/19] remote/machine: add HotplugHandler for remote
 machine
Message-ID: <YhOwMWLPiFNzDS2H@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <aa49b99e70d4a4dc9710846a9da487edc80f4f0a.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SLHC/SOhTLTjA3aL"
Content-Disposition: inline
In-Reply-To: <aa49b99e70d4a4dc9710846a9da487edc80f4f0a.1645079934.git.jag.raman@oracle.com>
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


--SLHC/SOhTLTjA3aL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:51AM -0500, Jagannathan Raman wrote:
> Allow hotplugging of PCI(e) devices to remote machine
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/machine.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--SLHC/SOhTLTjA3aL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITsDEACgkQnKSrs4Gr
c8i0lgf/R16/HrJ4WNfEXkr9tO1FuiGbTn/4kBRtGhTdP0oPm2VEEae5jQhqadXs
3aD6bJQYf216RGN4LfKulUmd4iIBG+JX0IS2xQN+Kt97I5dAmrRG+tgmlO3uTKiz
k508vcSqzUF2lW0DqXQwnQHlEukHasZ6cKOzclqplfNhYUuWaZbz9mANGoMkESB2
amXS/yeMYlSISb5GpM+nES2k7JiP9hRE1YWF4iWZEX9Lnidg5Vn7FUhedBkXxC1G
u5DJRIPMrFs3hRsQGUk9XCsjUu7XZRgS2nJdE4EQDYtwuprBZ3THRNLjLYTjp4qo
CwbZIL9h5HaO4tv6RlMnOUTIPv5o7A==
=kTAC
-----END PGP SIGNATURE-----

--SLHC/SOhTLTjA3aL--


