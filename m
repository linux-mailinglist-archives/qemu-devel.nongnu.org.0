Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327906ED2D2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:48:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqzLa-0001sI-WC; Mon, 24 Apr 2023 12:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pqzLX-0001s7-SD
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pqzLV-00018g-VD
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682354840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8lzJmEJDLpDNshbYtCRbfmNfdpp6eUdH2wXALMbX9uU=;
 b=QK5k8UqVoOJDbMe7b+xh3bx5OjDlvEAstXb2BSc+v9DQ7ARdWA61aEhUg5yZ2ROB2H9Fa4
 0r5oBYTOq3RKBzhTlUwovzP7vRPw7oHJWxH/gNu6pu6WCdwJIKkyFTM3aYtdh6UkKgplE1
 AE5sS+SikwRq4nwuKw1a/xoQy/jLqiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-gzS7CbRyNleKMB0NzQhNnA-1; Mon, 24 Apr 2023 12:47:16 -0400
X-MC-Unique: gzS7CbRyNleKMB0NzQhNnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63490A0F380;
 Mon, 24 Apr 2023 16:47:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDB7E49AF0;
 Mon, 24 Apr 2023 16:47:15 +0000 (UTC)
Date: Mon, 24 Apr 2023 12:47:13 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/20] Block patches
Message-ID: <20230424164713.GD235740@fedora>
References: <20230420120948.436661-1-stefanha@redhat.com>
 <e7775d5f-292c-2a88-afaa-5731ee1bc897@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="66n3fNYzr/92iT1z"
Content-Disposition: inline
In-Reply-To: <e7775d5f-292c-2a88-afaa-5731ee1bc897@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--66n3fNYzr/92iT1z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 08:01:56PM +0100, Richard Henderson wrote:
> On 4/20/23 13:09, Stefan Hajnoczi wrote:
> > The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9=
d6b4:
> >=20
> >    Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >=20
> > for you to fetch changes up to 36e5e9b22abe56aa00ca067851555ad8127a7966:
> >=20
> >    tracing: install trace events file only if necessary (2023-04-20 07:=
39:43 -0400)
> >=20
> > ----------------------------------------------------------------
> > Pull request
> >=20
> > Sam Li's zoned storage work and fixes I collected during the 8.0 freeze.
> >=20
> > ----------------------------------------------------------------
> >=20
> > Carlos Santos (1):
> >    tracing: install trace events file only if necessary
> >=20
> > Philippe Mathieu-Daud=E9 (1):
> >    block/dmg: Declare a type definition for DMG uncompress function
> >=20
> > Sam Li (17):
> >    block/block-common: add zoned device structs
> >    block/file-posix: introduce helper functions for sysfs attributes
> >    block/block-backend: add block layer APIs resembling Linux
> >      ZonedBlockDevice ioctls
> >    block/raw-format: add zone operations to pass through requests
> >    block: add zoned BlockDriver check to block layer
> >    iotests: test new zone operations
> >    block: add some trace events for new block layer APIs
> >    docs/zoned-storage: add zoned device documentation
> >    file-posix: add tracking of the zone write pointers
> >    block: introduce zone append write for zoned devices
> >    qemu-iotests: test zone append operation
> >    block: add some trace events for zone append
> >    include: update virtio_blk headers to v6.3-rc1
> >    virtio-blk: add zoned storage emulation for zoned devices
> >    block: add accounting for zone append operation
> >    virtio-blk: add some trace events for zoned emulation
> >    docs/zoned-storage:add zoned emulation use case
> >=20
> > Thomas De Schampheleire (1):
> >    tracetool: use relative paths for '#line' preprocessor directives
>=20
> 32 failed CI jobs:
> https://gitlab.com/qemu-project/qemu/-/pipelines/844927626/failures

Thanks for letting me know. I will resend without the zoned storage
patches that are failing CI.

Stefan

--66n3fNYzr/92iT1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRGspEACgkQnKSrs4Gr
c8jpDgf/SLS+/dWWw88oXY/Kkqng8ref5PHlz2NL1nHlyyrZwtQHSrB18qLDoYx0
MmLHNIbWJq3ZHJL4EColcMxrWAkHR8BKi+IYktGHCid2ZLyzE7LEygSH0xlAQf2Q
Qiu9UUkSzpNbWb/Q+0gJOzwwQqmpuZ89DEppf8y5MWoWB7V0B3zcgXSr0CIRd7ot
yvy5OPUlATqGAuLmBH08tZF0MO+SMUvT0jZO4Ka7jIB/PHJNXdyUYVF5ouzjYZED
njRIbqTqEDHZb1QlHYC0dQ+Bv9ZomUw+OCPBCwAIPoXfaBMyatDrU6H6/NwrePMH
lfx9g8TwJM87KPVA3LSJg7Rm4Y4Y1w==
=TmD1
-----END PGP SIGNATURE-----

--66n3fNYzr/92iT1z--


