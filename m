Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB447556A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 10:48:29 +0100 (CET)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQtg-0003iO-IZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 04:48:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxQrV-00025w-Jp
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxQrS-0002IF-La
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639561569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7tOVKf/DYoq21pLhevp6W96nq9k4VJbxbjUYZtlNih4=;
 b=hz2JF8aWCmtsO3NDXmNKDUJ0iYrycqTbyL+W9Q8xuaMESRLq5Z2wjmBMKgGeG/JP07E1nQ
 ok6u0q3FQGypiiHX418C6y8iuk5tmJzzr4+hQitIYxmVGWunDxHuteCS21GeBEGu/rmoht
 Hj+0UACpXu88C990dU4jAQLeg0S/aw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-tVPcU7R6O0q_mIRua1z5Og-1; Wed, 15 Dec 2021 04:45:58 -0500
X-MC-Unique: tVPcU7R6O0q_mIRua1z5Og-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF2AA1006AA8;
 Wed, 15 Dec 2021 09:45:57 +0000 (UTC)
Received: from localhost (unknown [10.39.195.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E13862713;
 Wed, 15 Dec 2021 09:45:57 +0000 (UTC)
Date: Wed, 15 Dec 2021 09:45:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Subject: Re: Building QEMU as a shared library
Message-ID: <Ybm5VNnZDtPzku3m@stefanha-x1.localdomain>
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oAY86D2dV/STlk76"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--oAY86D2dV/STlk76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 08:18:53AM +0000, Amir Gonnen wrote:
> Before sending a patch, I would like to check if it's of interest to the =
community.
>=20
> My goal is to simulate a mixed architecture system.
> Today QEMU strongly assumes that the simulated system is a *single archit=
ecture*.
> Changing this assumption and supporting mixed architecture in QEMU proved=
 to be
> non-trivial and may require significant development effort. Common code s=
uch as
> TCG and others explicitly include architecture specific header files, for=
 example.

Hi Amir,
Simulating heterogenous machines comes up from periodically. So far no
one has upstreamed a solution but there is definitely interest.

I suggest going ahead and posting the code even if it's not cleaned up.

> A possible solution, discussed on https://stackoverflow.com/q/63229262/61=
9493 is to
> separate the simulation to multiple processes (as done by Xilinx) and to =
use some form
> of Interprocess Communication channel between them.
> Such solution has several disadvantages:
>=20
> - Harder to synchronize simulation between processes
> - Performance impact of Interprocess Communication
> - Harder to debug, profile and maintain
>=20
> Instead, I would like to suggest a new approach we use at Neuroblade to a=
chieve this:
> Build QEMU as a shared library that can be loaded and used directly in a =
larger simulation.
> Today we build qemu-system-nios2 shared library and load it from qemu-sys=
tem-x86_64 in order
> to simulate an x86_64 system that also consists of multiple nios2 cores.
> In our simulation, two independent "main" functions are running on differ=
ent threads, and
> simulation synchronization is reduced to synchronizing threads.
>=20
> To achieve this, I needed to do the following changes in QEMU:
>=20
> 1. Avoid Glib global context. Use a different context (g_main_context_new=
) for each QEMU instance.
> 2. Change meson.build to build QEMU as a shared library (with PIC enabled=
 for static libraries)
> 3. Define a C API for the library and export it (with a -Wl,--version-scr=
ipt)
>=20
> These changes seem enough for simulating mixed architecture system on a s=
ingle process.
>=20
> If this approach sounds useful, I'll be happy to send patches.
> I'd appreciate if you could provide your feedback!

I'm curious how much synchronization and IPC there is between the QEMU
shared libraries? I would have guessed that the pain of making
communication work efficiently between processes would be less than the
pain of solving global state bugs related to shared libraries within a
single process.

Were there issues with POSIX signal handlers?

Stefan

--oAY86D2dV/STlk76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG5uVMACgkQnKSrs4Gr
c8jzVAgAmL+Td0lx/7tkkCcDfIz7syFx25xBTlR2aOZaDEeQKNKhkYQIgJ1iVRCw
5tPH642rFFpnib0fJkwSXyz+XHcj83EghEbhd0doxsmQZbnhEaQ8U8YPxYpuQR/H
YVkffeiJzvO37VDHdCbf2oW31oKGVnsid9tRVkNyWBB692nK0B92s27EKlKIOg+K
sHDzO6yPnK8C4qMJntXg2KanCdS4aivpTy88ab7S2wsG+gMQLpzIvTvoroR5Gx2w
ePMVxb0VYgoA8CXT1Od36YPbSS6BpxFMEIYdB28VOqtFApd8HkIkBxVLiuWDQr2M
YPkCn9nA3gQsTSlDeJJ6Fj0tyqrH/A==
=OavU
-----END PGP SIGNATURE-----

--oAY86D2dV/STlk76--


