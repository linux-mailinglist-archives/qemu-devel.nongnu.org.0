Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE150DE6E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 13:04:23 +0200 (CEST)
Received: from localhost ([::1]:47334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niwVy-0003nk-FA
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 07:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niw1l-0005ix-LD
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:33:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niw1j-0005tU-LF
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650882786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+dIFcigO5A4MJ0ZukNKDusYu71xF9+ppE0N/y1PnwTo=;
 b=G6NaAyT9NVdZA+OmdHtE56QoxuD1+MgJ7Iy4gXm4Xrn6XiRNyWqAOQChYzyV2BcOF/gDuW
 YoBRIA7Tq4RkK00pvoW+rO6o6uNAacTMFugEsI0oeclto0ulpvF4ggovNPnQU1wWpN4XZz
 CruW97dKAecEimADdg4HWJnWUdoUYP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-0Qx8toldMTiU8QZ0lgBJbw-1; Mon, 25 Apr 2022 06:32:55 -0400
X-MC-Unique: 0Qx8toldMTiU8QZ0lgBJbw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E7D6185A79C;
 Mon, 25 Apr 2022 10:32:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC7E940CFD01;
 Mon, 25 Apr 2022 10:32:54 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:32:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 00/17] vfio-user server in QEMU
Message-ID: <YmZ41Z4nO7xv3n6X@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1Xvh630IjN202/vd"
Content-Disposition: inline
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1Xvh630IjN202/vd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2022 at 04:44:05PM -0400, Jagannathan Raman wrote:
> This is v8 of the server side changes to enable vfio-user in QEMU.
>=20
> Thank you very much for reviewing the last revision of this series!

I posted some minor comments. I hope the next revision or the one after
it will be merged because the code will benefit from being in-tree where
more people can easily try it out.

Stefan

--1Xvh630IjN202/vd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmeNUACgkQnKSrs4Gr
c8hJnwgAhWKi9n0dlJDmzhRSnF5gUHy1+GsM3opFByhyo1BnWYZqdqK5L6j3BQef
gJEtfI6Jgig8pgLGbtwNR9TSpC0N+LUUYa2jlTwMAypN+CWDtd0m1XXrSgNhqWUi
Lf+s9ljq3y82nE+Rfi+VBLAR5DpeIueIfCdr4Ioymyl1Allo1JuvszrIJt/eTwpC
GvBn/iYlwlpJ5nyezxFXNAlYFgvnKcjHs6KHomVzMDSopjp/tZ/lXhrklcyzG5Fg
D2onB9Qey7bi1TldUFAIqRrcrpabTCsMgN+BhzEewWlwzedfGNCIQcwYTPIMpBD1
AzIcHue7xk5OOihJIHV9XKr4bcV3xw==
=G5K+
-----END PGP SIGNATURE-----

--1Xvh630IjN202/vd--


