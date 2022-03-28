Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB04E9224
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:58:52 +0200 (CEST)
Received: from localhost ([::1]:37926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYm9D-0003P2-PI
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:58:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nYm7l-000248-BX
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nYm7j-0005EX-MR
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648461438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AqNexRF2LwTZrwdIJ4GvKJ5EKJYre2EACu7Xb9UuK1A=;
 b=E/9M53JR2h5QAh9XOTN1vBxZLIJsbD1sU5gq1eekWItM4/yDoCXoZC7kQb2jjFcY946s79
 GbXsmTsPiCVNziJsMu32VtyKS2jPORE2cCSYYSDUkV0L9A0KVykWcjiQJPHNMyeHG+6ey6
 2K1RmsRyJUZzu8cUR4jzAwD2a3bq2SY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-TI2Z18h1N06zocpIBpuooQ-1; Mon, 28 Mar 2022 05:57:14 -0400
X-MC-Unique: TI2Z18h1N06zocpIBpuooQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CB3A2A59560;
 Mon, 28 Mar 2022 09:57:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3467D1410F3B;
 Mon, 28 Mar 2022 09:57:14 +0000 (UTC)
Date: Mon, 28 Mar 2022 10:57:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Subject: Re: Proposal for a regular upstream performance testing
Message-ID: <YkGGefZCOVn8JIz0@stefanha-x1.localdomain>
References: <3a664806-8aa3-feb4-fb30-303d303217a8@redhat.com>
 <a0f8c750-ed7b-908a-1a29-bf03004579e4@redhat.com>
 <YjhIddqwACSpoCfR@stefanha-x1.localdomain>
 <470cb0ab-137f-655c-9dcd-a480f66dac33@redhat.com>
 <Yjnlr67GOzii0Ead@stefanha-x1.localdomain>
 <f4514391-17cb-541b-a076-93fe2a95f8ab@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ln/CuGN1PhO/fJO0"
Content-Disposition: inline
In-Reply-To: <f4514391-17cb-541b-a076-93fe2a95f8ab@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Charles Shih <cheshi@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ln/CuGN1PhO/fJO0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2022 at 08:18:43AM +0200, Luk=C3=A1=C5=A1 Doktor wrote:
> Hello Stefan, folks,
>=20
> I seem to have another hit, an improvement actually and it seems to be bi=
sected all the way to you, Stefan. Let me use this as another example of ho=
w such process could look like and we can use this to hammer-out the detail=
s like via what means to submit the request, whom to notify and how to proc=
eed further.
>=20
> ---
>=20
> Last week I noticed an improvement in TunedLibvirt/fio-rot-Aj-8i/0000:./w=
rite-4KiB/throughput/iops_sec.mean (<driver name=3D"qemu" type=3D"raw" io=
=3D"native" cache=3D"none"/>, fio, rotationary disk, raw file on host xfs p=
artition, jobs=3D#cpus, iodepth=3D8, 4k writes) check and bisected it to:
>=20
> commit fc8796465c6cd4091efe6a2f8b353f07324f49c7
> Author: Stefan Hajnoczi <stefanha@redhat.com>
> Date:   Wed Feb 23 15:57:03 2022 +0000
>=20
>     aio-posix: fix spurious ->poll_ready() callbacks in main loop
>=20
> Could you please confirm that it does make sense and that it is expected?=
 (looks like it from the description).
>=20
> Note that this commit was pin pointed using 2 out of 3 commits result, th=
ere were actually some little differences between commits fc8 and cc5. The =
fc8 and 202 results scored similarly to both, good and bad commits with 2 b=
eing closer to the bad one. Since cc5 they seem to stabilize further scorin=
g slightly lower than the median fc8 result. Anyway I don't have enough dat=
a to declare anything. I can bisect it further if needed.

Yes, I can imagine that commit fc8796465c6c might improve non-IOThread
performance!

I don't know how to read the report:
- What is the difference between "Group stats" and "Failures"?
- Why are there 3 different means in "Group stats"?
- Why are there 3 "fc8" columns in "Failures"?

I don't feel confident searching git-log(1) output with 3-character
commit IDs. git itself uses 12 characters for short commit IDs with a
reasonably low chance of collisions.

Stefan

--ln/CuGN1PhO/fJO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJBhnkACgkQnKSrs4Gr
c8hX+ggArAXGI+5LuOp3aABTgqIlZ+P8o5pYMF0NYsfxp4ZUgVRJss6PUkGzQ30X
PN3Ez0eenXm/kxyKzYlMgX4/lxOm5qZMV7dZJLMLmOMHZ8/rYY2AKLsTHR7TvIXJ
rRpptb0RZ6owjVMfHzs3EESRbTDlJ+my+7ZWzkw9hj0TwXFdQxkOaKIylYx6rjP2
9ZPD3NhpzTZsMUyvoFczevpp2FjjU+M5hDMJ2W8WVhvzmm/48wJ3ZUl09vaMgW+5
PImaK5bVTd5m03HTtGOpJV3vG0obZqnvgrhhZiUtQED+N/LDXFimBLTry1hSp3hj
aFEXjXMf0/MKs82pLm5n2FLfC8tjgw==
=3qKj
-----END PGP SIGNATURE-----

--ln/CuGN1PhO/fJO0--


