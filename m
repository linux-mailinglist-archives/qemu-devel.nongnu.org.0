Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7314EAFA0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 16:51:01 +0200 (CEST)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDBT-0000PW-Ui
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 10:50:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZD7U-00066A-01
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZD7S-0001Io-Ib
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648565209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3D3oRGp1u8Xoj0GnY9Yl0s6gajfxlyzsanf+6DL2Bxo=;
 b=Ox8fE0UuRyUIYQOhKoe/C/1133i4hEjM3xFiqrcCEVy3EStlzuDiLse9PTPQw/h1r5+izU
 eOsBWFog+aRQVUBeRRI7Y3aQr6qB38Zij2Z0isx3sqExiElFPVir2vPl10nD0eGyTrMhvM
 mPhNxJVItb+r2LtYgpd9HYEem87oNZk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-Eqv7drmSM6qiTkBmu_yjpQ-1; Tue, 29 Mar 2022 10:46:48 -0400
X-MC-Unique: Eqv7drmSM6qiTkBmu_yjpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 520433800E94;
 Tue, 29 Mar 2022 14:46:46 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9652E2027EB3;
 Tue, 29 Mar 2022 14:46:19 +0000 (UTC)
Date: Tue, 29 Mar 2022 15:46:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 16/17] vfio-user: handle reset of remote device
Message-ID: <YkMbukC+7qe+FCzm@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <adcfac67f710d8ed447531a58b799792f7a8e492.1648234157.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QFg53epw7n31sNxx"
Content-Disposition: inline
In-Reply-To: <adcfac67f710d8ed447531a58b799792f7a8e492.1648234157.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--QFg53epw7n31sNxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 03:19:45PM -0400, Jagannathan Raman wrote:
> Adds handler to reset a remote device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--QFg53epw7n31sNxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJDG7oACgkQnKSrs4Gr
c8i5eggAu0PAfk+n7nODi0E5b/fAuTmGNvHcvd0rOIMfM+e7bTSZ10ZMCTbZ2B/O
TBPBjtu5p5+1N4pvlyid6JlWC/O2l3bop/81g0ljwQrbqCPWh7KISyDs3YMgFo4v
7LA8eiCuVyQwm970aImc+ZkcBLjC7xOouF7Y1ZGsIqbDq4gTIU4AQdMCveXasUBF
hgqt0Fsw9nQC8d+wE6uEwOGV89qEcmLMq7RpSfhVRXAQoEihuIZlCOTnLfUy9H+w
5p6fYrJv1LmIPFcq6NdeGCW0tPorEp6zRT6nV09iH7ayvkU1nCINK4MUQ4NaLIEH
GUj+GXQ4gXf74kZPZMpv2KfGPPsrkg==
=8HZL
-----END PGP SIGNATURE-----

--QFg53epw7n31sNxx--


