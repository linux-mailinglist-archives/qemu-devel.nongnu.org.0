Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F9950DE50
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:56:36 +0200 (CEST)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwOR-0006C8-7i
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivwq-0001NZ-Nk
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivwn-00056Y-0A
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650882479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dnY7bnAc9jCSqBpEV3Ih/HOWf6PE5fTaJQLWXbI/xjk=;
 b=Yulp1Axut7KEFmjhVptKs9hj5A2R/wzs1WeLzdTmlf+cpm64n+QPmKW2+uvil562CUX0ni
 TT+zv61/inE2woWZO8oTSy+r9XivlP/AS8xw/HCapJjLx7JNRMl5jM8NQkqGN+txXbK4Mq
 rkRrXAuMsiBYGY0JTppF3RupWXTCG98=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-lo_0FYTJPqOkQQLF_BJk4g-1; Mon, 25 Apr 2022 06:27:56 -0400
X-MC-Unique: lo_0FYTJPqOkQQLF_BJk4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB28929ABA38;
 Mon, 25 Apr 2022 10:27:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 528ED1410F3B;
 Mon, 25 Apr 2022 10:27:55 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:27:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 16/17] vfio-user: handle reset of remote device
Message-ID: <YmZ3qgZoYLai7PoL@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <9bbc332432abcf2b0a88ce04c6017a4b98f17801.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kgn47W1DIstGfI23"
Content-Disposition: inline
In-Reply-To: <9bbc332432abcf2b0a88ce04c6017a4b98f17801.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Kgn47W1DIstGfI23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 04:44:21PM -0400, Jagannathan Raman wrote:
> Adds handler to reset a remote device
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Kgn47W1DIstGfI23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmd6oACgkQnKSrs4Gr
c8j68AgAqIKGEmiC2DnZ05hx0wXkw8d2e7ZppI8d2cYcprcrTR3+VqJ8vNes+WAB
7CSQD7fNpsRdwOMokqXzbUDZWSJ+KUSsFVxjo5imtYqCfYCBQeOFpAgVqM/xiaqB
9iB6I27K9kwWtnuky3U9/OIyHMf1/Ruk3YIilcxtEwm8gh6xXGHC1sbK7QnumXTq
r5rnl5fiuJGutK1vytDlTktA0ihLtY3GWBz5N9nx7RbwgKZpyNQ8Hr9/j0mnSMty
0tG9Q0YA36+kciM/Sg6BQEVUCHDSDkNIvhcuJqdfRoIWxM4O2zodeiqePoalcySl
MYeFgibZk9+cToEK1HIrLtW2CCq76A==
=3/7e
-----END PGP SIGNATURE-----

--Kgn47W1DIstGfI23--


