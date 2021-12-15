Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C41A475A9D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 15:25:23 +0100 (CET)
Received: from localhost ([::1]:58950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVDd-0000Sq-S7
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 09:25:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxUGB-0000rK-1W
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:23:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxUG3-0005yc-K3
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 08:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639574626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ySVGEwelT5PiSLdcHYrwKgJhhv+l0e9RsWjQ24lEJM=;
 b=OgMMR2jJ2RfwhdNe5gDrjSnHsd1JfmO4jcWo5MkZ65wlEjU3ybQMFtLeypmRtAV0EWZcWx
 TKAlnp6EOYK8aDOpXn8n+/kZ8Chu+oiThT9h/4aPAr2t3gxvEcMgBaWXr+q2TSovo6B1am
 2CbYpPJvxnjMN9HtMSPG1I3UnAsCMM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-Cdd-9DN-PLm9FQaGjPaolQ-1; Wed, 15 Dec 2021 08:23:42 -0500
X-MC-Unique: Cdd-9DN-PLm9FQaGjPaolQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EFE0814331;
 Wed, 15 Dec 2021 13:23:41 +0000 (UTC)
Received: from localhost (unknown [10.39.195.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D84FAE2CF;
 Wed, 15 Dec 2021 13:23:40 +0000 (UTC)
Date: Wed, 15 Dec 2021 13:23:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Subject: Re: Building QEMU as a shared library
Message-ID: <YbnsWycETnVfDjJ4@stefanha-x1.localdomain>
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <Ybm5VNnZDtPzku3m@stefanha-x1.localdomain>
 <PA4PR09MB48800B35FDFF21C49D45E895EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PA4PR09MB48800B35FDFF21C49D45E895EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IIgJCC/ISAVCR3Dn"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IIgJCC/ISAVCR3Dn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 12:18:16PM +0000, Amir Gonnen wrote:
> Easier/faster synchronization is just one side of the issue.
> It's much easier to debug a single process or profile it, for example. It=
's also easier to deploy and maintain a single process.
>=20
> For now, the only "global state" problem I had to fix was Glib global con=
text.
> I didn't see an issue with posix signals. Any other global state you thin=
k I should take care of?

Signal handlers are interesting because they are per-process, not
per-thread. Luckily QEMU doesn't use signals that much. Accelerators
like KVM use SIGUSR1 while TCG doesn't rely on signals.

One example is what happens when you send SIGINT (Ctrl+C) to the
process. Only one of the shared libraries will handle the signal. The
other one will not be aware that SIGINT happened.

The signal handlers that execute in specific threads (e.g. vCPU threads)
are likely to crash or behave in weird ways. For example,
softmmu/cpus.c:

  static void sigbus_handler(int n, siginfo_t *siginfo, void *ctx)
  {
      if (siginfo->si_code !=3D BUS_MCEERR_AO && siginfo->si_code !=3D BUS_=
MCEERR_AR) {
          sigbus_reraise();
      }
 =20
      if (current_cpu) {
          ^^^^^^^^^^^

current_cpu is a thread-local variable. The problem is that the
current_cpu symbol belongs to a specific shared library (nios2 or
x86_64).

If nios2 installs this signal handler then x86_64 vCPUs will not be able
to handle SIGBUS because the current_cpu variable is trying to fetch the
thread-local storage allocated to the other library.

Global variables are also broken in the same way. If the other shared
library's version of the signal handler function is executed we'll
access the other global variable and not our own.

Stefan

--IIgJCC/ISAVCR3Dn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG57FsACgkQnKSrs4Gr
c8j3cggAs6MevnCSfdfdG0qoDKdT92peGJ9UBVZ7YcrzkK3W+LJFfoFGnS8GIVDt
ESRT8BZ1XoyuRojOf84Ave7UsIt6Rh/d5tiBoGRC//nXMeHDzOTUmDFW1d5CKMgo
DDK6f/VjJVo2ADdg0IhkKoVZ8efrSuzoaVVIsShomgtOeQD5GnSXcIRIRzyENhWK
lP99jHyE8eVFNr16QY5Xk1CUsZ+PThE/wAzsX133kRBsXzFeWpXJ9wE1AaSfGLTn
3u0S9KnWulpb/Ay2EOb9XeYMbCXG2HpjsgHxmGRZdiibVlat4sz/7r9iyDK9wqGE
bzANlAofhjp36kDWUDNqPr5an/hImA==
=qKZ7
-----END PGP SIGNATURE-----

--IIgJCC/ISAVCR3Dn--


