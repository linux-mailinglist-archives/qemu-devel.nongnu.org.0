Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF7F1A5A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 16:48:34 +0100 (CET)
Received: from localhost ([::1]:60278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSNXs-0007p3-Rv
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 10:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iSNUa-0005zC-Re
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iSNUZ-0008OD-J9
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:45:08 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43824
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iSNUZ-0008Nl-FA
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573055106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dC+xS7aTnYE1W7EMaFhprET3/XpwlsoWz5Ubsz7KU4Q=;
 b=KPGsnDu9NZTWXQWJCmlRwC+crvGl1VnFtaeWOBInFYqNBqqjgfLE9Jdsw3bGw95rBs8M7e
 noxELzFcUWo/Sh9WXEOJE3Blp8mfIVPBTM/hPgMTOQf2htRL2CbXN/cOtd/wz69LDC9vY0
 v9Md3oRlqYN2nLlnK/H00y2ucHIVNnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-CWjb3g0iOPO2Zlj0vRmOuQ-1; Wed, 06 Nov 2019 10:45:04 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 636048017E0;
 Wed,  6 Nov 2019 15:45:03 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2914660872;
 Wed,  6 Nov 2019 15:45:01 +0000 (UTC)
Message-ID: <a7a253f60f3286e9826d83c61ab540a76b356f20.camel@redhat.com>
Subject: Re: [PATCH v2 04/21] iotests: Filter refcount_order in 036
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Wed, 06 Nov 2019 17:45:01 +0200
In-Reply-To: <20191015142729.18123-5-mreitz@redhat.com>
References: <20191015142729.18123-1-mreitz@redhat.com>
 <20191015142729.18123-5-mreitz@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: CWjb3g0iOPO2Zlj0vRmOuQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-10-15 at 16:27 +0200, Max Reitz wrote:
> This test can run just fine with other values for refcount_bits, so we
> should filter the value from qcow2.py's dump-header.  In fact, we can
> filter everything but the feature bits and header extensions, because
> that is what the test is about.

>=20
> (036 currently ignores user-specified image options, but that will be
> fixed in the next patch.)
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/036     |  9 ++++---
>  tests/qemu-iotests/036.out | 48 --------------------------------------
>  2 files changed, 6 insertions(+), 51 deletions(-)
>=20
> diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
> index f06ff67408..5f929ad3be 100755
> --- a/tests/qemu-iotests/036
> +++ b/tests/qemu-iotests/036
> @@ -55,7 +55,8 @@ $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatib=
le 63
> =20
>  # Without feature table
>  $PYTHON qcow2.py "$TEST_IMG" del-header-ext 0x6803f857
> -$PYTHON qcow2.py "$TEST_IMG" dump-header
> +$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
> +$PYTHON qcow2.py "$TEST_IMG" dump-header-exts
>  _img_info
> =20
>  # With feature table containing bit 63
> @@ -103,14 +104,16 @@ echo =3D=3D=3D Create image with unknown autoclear =
feature bit =3D=3D=3D
>  echo
>  _make_test_img 64M
>  $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 63
> -$PYTHON qcow2.py "$TEST_IMG" dump-header
> +$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
> +$PYTHON qcow2.py "$TEST_IMG" dump-header-exts
> =20
>  echo
>  echo =3D=3D=3D Repair image =3D=3D=3D
>  echo
>  _check_test_img -r all
> =20
> -$PYTHON qcow2.py "$TEST_IMG" dump-header
> +$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
> +$PYTHON qcow2.py "$TEST_IMG" dump-header-exts
> =20
>  # success, all done
>  echo "*** done"
> diff --git a/tests/qemu-iotests/036.out b/tests/qemu-iotests/036.out
> index 15229a9604..0b52b934e1 100644
> --- a/tests/qemu-iotests/036.out
> +++ b/tests/qemu-iotests/036.out
> @@ -3,25 +3,9 @@ QA output created by 036
>  =3D=3D=3D Image with unknown incompatible feature bit =3D=3D=3D
> =20
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -magic                     0x514649fb
> -version                   3
> -backing_file_offset       0x0
> -backing_file_size         0x0
> -cluster_bits              16
> -size                      67108864
> -crypt_method              0
> -l1_size                   1
> -l1_table_offset           0x30000
> -refcount_table_offset     0x10000
> -refcount_table_clusters   1
> -nb_snapshots              0
> -snapshot_offset           0x0
>  incompatible_features     [63]
>  compatible_features       []
>  autoclear_features        []
> -refcount_order            4
> -header_length             104
> -
>  qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsupported IMGFMT feature=
(s): Unknown incompatible feature: 8000000000000000
>  qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsupported IMGFMT feature=
(s): Test feature
> =20
> @@ -37,25 +21,9 @@ qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsuppor=
ted IMGFMT feature(s): tes
>  =3D=3D=3D Create image with unknown autoclear feature bit =3D=3D=3D
> =20
>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
> -magic                     0x514649fb
> -version                   3
> -backing_file_offset       0x0
> -backing_file_size         0x0
> -cluster_bits              16
> -size                      67108864
> -crypt_method              0
> -l1_size                   1
> -l1_table_offset           0x30000
> -refcount_table_offset     0x10000
> -refcount_table_clusters   1
> -nb_snapshots              0
> -snapshot_offset           0x0
>  incompatible_features     []
>  compatible_features       []
>  autoclear_features        [63]
> -refcount_order            4
> -header_length             104
> -
>  Header extension:
>  magic                     0x6803f857
>  length                    192
> @@ -65,25 +33,9 @@ data                      <binary>
>  =3D=3D=3D Repair image =3D=3D=3D
> =20
>  No errors were found on the image.
> -magic                     0x514649fb
> -version                   3
> -backing_file_offset       0x0
> -backing_file_size         0x0
> -cluster_bits              16
> -size                      67108864
> -crypt_method              0
> -l1_size                   1
> -l1_table_offset           0x30000
> -refcount_table_offset     0x10000
> -refcount_table_clusters   1
> -nb_snapshots              0
> -snapshot_offset           0x0
>  incompatible_features     []
>  compatible_features       []
>  autoclear_features        []
> -refcount_order            4
> -header_length             104
> -
>  Header extension:
>  magic                     0x6803f857
>  length                    192

Great!
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
=09Maxim Levitsky


