Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1F616D2E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIog-0000sQ-Em; Wed, 02 Nov 2022 14:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqIoe-0000rz-DT
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 14:50:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqIoc-0005fC-QX
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 14:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667415017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bLAQQbKDXBnSKaaWEC021/hd8nSdnKcAmWKnTNj8rjk=;
 b=eVMB+E+PIBxWw8IQcO0rmVgeQi1FvbFdEZx//RlsndmtaV411La1nqNTcZCuS80rRi/Fl2
 ZemLYAmw8rfXTEW0LY/l7/NWQJdYB6ysGVfDUdsKHfe7Zx8XStn9muyk+9AJbexAn48jio
 Y1gtVR0KFKtnxSHZXcJ7c5PIyigoLas=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-KKhiCZFHO-6cUeFZcx7d8A-1; Wed, 02 Nov 2022 14:50:14 -0400
X-MC-Unique: KKhiCZFHO-6cUeFZcx7d8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40E51101A52A;
 Wed,  2 Nov 2022 18:50:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C269A140EBF5;
 Wed,  2 Nov 2022 18:50:13 +0000 (UTC)
Date: Wed, 2 Nov 2022 14:50:12 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, nsoffer@redhat.com
Subject: Re: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Message-ID: <Y2K75B3BNbd+Y8x/@fedora>
References: <20221101190031.6766-1-stefanha@redhat.com>
 <20221101190031.6766-2-stefanha@redhat.com>
 <Y2HVgnwAPdTIaZR6@sol.localdomain>
 <Y2HasGvN6qMFq29A@sol.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vNS9r1/gMVB27YPS"
Content-Disposition: inline
In-Reply-To: <Y2HasGvN6qMFq29A@sol.localdomain>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--vNS9r1/gMVB27YPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 07:49:20PM -0700, Eric Biggers wrote:
> On Tue, Nov 01, 2022 at 07:27:16PM -0700, Eric Biggers wrote:
> > On Tue, Nov 01, 2022 at 03:00:30PM -0400, Stefan Hajnoczi wrote:
> > > Linux dm-crypt returns errno EIO from unaligned O_DIRECT pread(2) cal=
ls.
> >=20
> > Citation needed.  For direct I/O to block devices, the kernel's block l=
ayer
> > checks the alignment before the I/O is actually submitted to the underl=
ying
> > block device.  See
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/block/fops.c?h=3Dv6.1-rc3#n306
> >=20
> > > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290
> >=20
> > That "bug" seems to be based on a misunderstanding of the kernel source=
 code,
> > and not any actual testing.
> >=20
> > I just tested it, and the error code is EINVAL.
> >=20
>=20
> I think I see what's happening.  The kernel code was broken just a few mo=
nths
> ago, in v6.0 by the commit "block: relax direct io memory alignment"
> (https://git.kernel.org/linus/b1a000d3b8ec582d).  Now the block layer let=
s DIO
> through when the user buffer is only aligned to the device's dma_alignmen=
t.  But
> a dm-crypt device has a dma_alignment of 512 even when the crypto sector =
size
> (and thus also the logical block size) is 4096.  So there is now a case w=
here
> misaligned DIO can reach dm-crypt, when that shouldn't be possible.
>=20
> It also means that STATX_DIOALIGN will give the wrong value for
> stx_dio_mem_align in the above case, 512 instead of 4096.  This is because
> STATX_DIOALIGN for block devices relies on the dma_alignment.
>=20
> I'll raise this on the linux-block and dm-devel mailing lists.  It would =
be nice
> if people reported kernel bugs instead of silently working around them...

Thanks! You have completed the picture of what's going on here.

Stefan

--vNS9r1/gMVB27YPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNiu+QACgkQnKSrs4Gr
c8iTFQgAtFHovWXTK2kSe0yvvVahwPWv6nyEY/RjoiP0J48w+CpCIFh/s2OlNyNQ
Zfc+6BcJpabjy0VSZLGUvxV0HXMaji2w8/fjJEoC74REIlIssN7Ro/DX7F4SKxTy
qkSiMQtlxIE3hIVktTWf2Yhug4zPDlAPnwl89E7Bwhoh2bPuG97Z+LnqJdvthp46
GSuSC23CFkOYvO1AJDUCz3RqAQRWugTIWLMk3P+oCHHGy106A/jYv5L0XqDB5o/t
mj1uJGW48r5KhftOjewuK+rR38y12xJEjDZaJA3M3E3V4/chYC5Cg7ucAUIrpMDr
avo6UMNufNoUi3+/Q/qWS+BxcUf0eA==
=CTKZ
-----END PGP SIGNATURE-----

--vNS9r1/gMVB27YPS--


