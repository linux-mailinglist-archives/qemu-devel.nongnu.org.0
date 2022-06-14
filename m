Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8225554AA3E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 09:17:17 +0200 (CEST)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o10nb-0001IA-R1
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 03:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o10cy-0002lE-9u
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 03:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o10cv-0008TL-72
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 03:06:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655190372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F129hMIVrKnstbLSwCwjp3zPa8NdI222sd3X1onga04=;
 b=bi4OiCED2icb6JolS8WwdfBPNzVjnu2oLbsT+zwM/WmLcSBR7dP4j2fl8U9YTqxURXhfih
 7Z9iCmcSsrTyA+6aGDNNcq8WypEsrFZjpQKeAj3S/xIUmFaclOtIrVszBBh0oJa8jP79qC
 6rztMSGGmbrGP4qO/JmGHwWup7ozxsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-aUPTHD5yNwGwqKP-bkd20w-1; Tue, 14 Jun 2022 03:06:10 -0400
X-MC-Unique: aUPTHD5yNwGwqKP-bkd20w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CC59101AA45;
 Tue, 14 Jun 2022 07:06:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA12B1121314;
 Tue, 14 Jun 2022 07:06:09 +0000 (UTC)
Date: Tue, 14 Jun 2022 08:06:07 +0100
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
Subject: Re: [PATCH v12 00/14] vfio-user server in QEMU
Message-ID: <YqgzX2K9X9wLMZmC@stefanha-x1.localdomain>
References: <cover.1655151679.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k5B0Rogyopk50VRJ"
Content-Disposition: inline
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
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


--k5B0Rogyopk50VRJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2022 at 04:26:20PM -0400, Jagannathan Raman wrote:
> This is v12 of the server side changes to enable vfio-user in QEMU.
>=20
> Thanks so much for reviewing this series and sharing your feedback.
>=20
> We made the following changes in this series:
> [PATCH v12 13/14] vfio-user: handle device interrupts
>  - Renamed msi_set_irq_state() and msix_set_irq_state() as
>    msi_set_mask() and msix_set_mask() respectively
>  - Added missing return statement for error case in msi_set_mask()

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--k5B0Rogyopk50VRJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKoM18ACgkQnKSrs4Gr
c8hl6gf/f4WFu/mc13FNduG8iCGM65azJQalMFpYg629FzAH7TOj7XwP/JKILUFg
WXkJ7QXRubDXe/2A0OD5Obj0HgXs2r6Qjz1B/rZOcv59qsB7VZWCOfROEQyQpDlf
0vnfphxa1g/ESFns06IU6ysm2mTpE0iGBt+c+izR4iJQN58Kel1aCDSDlFAYrD7k
9mmwTIayF1YEC/jC6HzBeAxq7Xd5gi74v274CeSU7KLb8wI/7pQg+Yug72dsXMx9
tVgk9PvozDRuSlba+m8as7tFy0zhaoX3M9Ab4UOc/LH5wrXoepQZn0wG/nze8Kvi
kIOi5xYpf25VmWR+DCAqguXzC+gSCQ==
=gKCQ
-----END PGP SIGNATURE-----

--k5B0Rogyopk50VRJ--


