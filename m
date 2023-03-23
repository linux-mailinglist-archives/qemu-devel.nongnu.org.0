Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8236C7113
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 20:32:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfQel-0007Vc-Ju; Thu, 23 Mar 2023 15:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfQej-0007VC-SA
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pfQef-0000mk-OU
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679599873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TNg8wQqx2tLTiMQRuPjRVgD4DBw83R6n1w94eD8HgDY=;
 b=EA/IvolZmHIV1hMFDWYxfv3a9kBAJaE2vobRWYBinNJLOWyuiy1ezLYErFleSj9QSfCjkY
 EtU3L4o3FH3+cpcKBAEyh/Fpaqpf8shPhA065aCzvvTMcP0Sxfz/6xEwicTYRn42atCRng
 y4Z5yBgt15BAcVD4IqvRf966AU9Y6/I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-YIa1p2TqPMuj2Cie_YC5TQ-1; Thu, 23 Mar 2023 15:31:09 -0400
X-MC-Unique: YIa1p2TqPMuj2Cie_YC5TQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDFD2281294F;
 Thu, 23 Mar 2023 19:31:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22F22440D6;
 Thu, 23 Mar 2023 19:31:07 +0000 (UTC)
Date: Thu, 23 Mar 2023 15:31:06 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, hare@suse.de, dmitry.fomichev@wdc.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v17 6/8] qemu-iotests: test new zone operations
Message-ID: <20230323193106.GD1459474@fedora>
References: <20230323050834.5199-1-faithilikerun@gmail.com>
 <20230323050834.5199-7-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ygUYHVY//Jidmlqy"
Content-Disposition: inline
In-Reply-To: <20230323050834.5199-7-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--ygUYHVY//Jidmlqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:08:32PM +0800, Sam Li wrote:
> The new block layer APIs of zoned block devices can be tested by:
> $ tests/qemu-iotests/check zoned
> Run each zone operation on a newly created null_blk device
> and see whether it outputs the same zone information.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/qemu-iotests/tests/zoned     | 86 ++++++++++++++++++++++++++++++
>  tests/qemu-iotests/tests/zoned.out | 53 ++++++++++++++++++
>  2 files changed, 139 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/zoned
>  create mode 100644 tests/qemu-iotests/tests/zoned.out
>=20
> diff --git a/tests/qemu-iotests/tests/zoned b/tests/qemu-iotests/tests/zo=
ned
> new file mode 100755
> index 0000000000..53097e44d9
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/zoned
> @@ -0,0 +1,86 @@
> +#!/usr/bin/env bash
> +#
> +# Test zone management operations.
> +#
> +
> +seq=3D"$(basename $0)"
> +echo "QA output created by $seq"
> +status=3D1 # failure is the default!
> +
> +_cleanup()
> +{
> +  _cleanup_test_img
> +  sudo rmmod null_blk
> +}
> +trap "_cleanup; exit \$status" 0 1 2 3 15
> +
> +# get standard environment, filters and checks
> +. ../common.rc
> +. ../common.filter
> +. ../common.qemu
> +
> +# This test only runs on Linux hosts with raw image files.
> +_supported_fmt raw
> +_supported_proto file
> +_supported_os Linux
> +
> +IMG=3D"--image-opts -n driver=3Dhost_device,filename=3D/dev/nullb0"
> +QEMU_IO_OPTIONS=3D$QEMU_IO_OPTIONS_NO_FMT
> +
> +echo "Testing a null_blk device:"
> +echo "case 1: if the operations work"
> +sudo modprobe null_blk nr_devices=3D1 zoned=3D1

I took a look at how existing qemu-iotests use sudo. The run it in
non-interactive mode and skip the test if sudo is unavailable.

Please do something like this to check for sudo support:

  sudo -n true || _notrun 'Password-less sudo required'

Then always use "sudo -n ...".


> +sudo chmod 0666 /dev/nullb0
> +
> +echo "(1) report the first zone:"
> +$QEMU_IO $IMG -c "zrp 0 1"
> +echo
> +echo "report the first 10 zones"
> +$QEMU_IO $IMG -c "zrp 0 10"
> +echo
> +echo "report the last zone:"
> +$QEMU_IO $IMG -c "zrp 0x3e70000000 2" # 0x3e70000000 / 512 =3D 0x1f380000
> +echo
> +echo
> +echo "(2) opening the first zone"
> +$QEMU_IO $IMG -c "zo 0 268435456"  # 268435456 / 512 =3D 524288
> +echo "report after:"
> +$QEMU_IO $IMG -c "zrp 0 1"
> +echo
> +echo "opening the second zone"
> +$QEMU_IO $IMG -c "zo 268435456 268435456" #
> +echo "report after:"
> +$QEMU_IO $IMG -c "zrp 268435456 1"
> +echo
> +echo "opening the last zone"
> +$QEMU_IO $IMG -c "zo 0x3e70000000 268435456"
> +echo "report after:"
> +$QEMU_IO $IMG -c "zrp 0x3e70000000 2"
> +echo
> +echo
> +echo "(3) closing the first zone"
> +$QEMU_IO $IMG -c "zc 0 268435456"
> +echo "report after:"
> +$QEMU_IO $IMG -c "zrp 0 1"
> +echo
> +echo "closing the last zone"
> +$QEMU_IO $IMG -c "zc 0x3e70000000 268435456"
> +echo "report after:"
> +$QEMU_IO $IMG -c "zrp 0x3e70000000 2"
> +echo
> +echo
> +echo "(4) finishing the second zone"
> +$QEMU_IO $IMG -c "zf 268435456 268435456"
> +echo "After finishing a zone:"
> +$QEMU_IO $IMG -c "zrp 268435456 1"
> +echo
> +echo
> +echo "(5) resetting the second zone"
> +$QEMU_IO $IMG -c "zrs 268435456 268435456"
> +echo "After resetting a zone:"
> +$QEMU_IO $IMG -c "zrp 268435456 1"
> +
> +# success, all done
> +echo "*** done"
> +rm -f $seq.full
> +status=3D0
> diff --git a/tests/qemu-iotests/tests/zoned.out b/tests/qemu-iotests/test=
s/zoned.out
> new file mode 100644
> index 0000000000..b2d061da49
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/zoned.out
> @@ -0,0 +1,53 @@
> +QA output created by zoned
> +Testing a null_blk device:
> +case 1: if the operations work
> +(1) report the first zone:
> +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
> +
> +report the first 10 zones
> +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
> +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: =
2]
> +start: 0x100000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:1, [type=
: 2]
> +start: 0x180000, len 0x80000, cap 0x80000, wptr 0x180000, zcond:1, [type=
: 2]
> +start: 0x200000, len 0x80000, cap 0x80000, wptr 0x200000, zcond:1, [type=
: 2]
> +start: 0x280000, len 0x80000, cap 0x80000, wptr 0x280000, zcond:1, [type=
: 2]
> +start: 0x300000, len 0x80000, cap 0x80000, wptr 0x300000, zcond:1, [type=
: 2]
> +start: 0x380000, len 0x80000, cap 0x80000, wptr 0x380000, zcond:1, [type=
: 2]
> +start: 0x400000, len 0x80000, cap 0x80000, wptr 0x400000, zcond:1, [type=
: 2]
> +start: 0x480000, len 0x80000, cap 0x80000, wptr 0x480000, zcond:1, [type=
: 2]
> +
> +report the last zone:
> +start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1, [=
type: 2]
> +
> +
> +(2) opening the first zone
> +report after:
> +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:3, [type: 2]
> +
> +opening the second zone
> +report after:
> +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:3, [type: =
2]
> +
> +opening the last zone
> +report after:
> +start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:3, [=
type: 2]
> +
> +
> +(3) closing the first zone
> +report after:
> +start: 0x0, len 0x80000, cap 0x80000, wptr 0x0, zcond:1, [type: 2]
> +
> +closing the last zone
> +report after:
> +start: 0x1f380000, len 0x80000, cap 0x80000, wptr 0x1f380000, zcond:1, [=
type: 2]
> +
> +
> +(4) finishing the second zone
> +After finishing a zone:
> +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x100000, zcond:14, [type=
: 2]
> +
> +
> +(5) resetting the second zone
> +After resetting a zone:
> +start: 0x80000, len 0x80000, cap 0x80000, wptr 0x80000, zcond:1, [type: =
2]
> +*** done
> --=20
> 2.39.2
>=20

--ygUYHVY//Jidmlqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQcqPoACgkQnKSrs4Gr
c8gF8Af/W1bhhShFF+fbD/8XVR+v97PgqG54fRBlYmaeQ6JEZ6Gm0VTtIO8wc0nd
o35mXfzcS9A7jlstrCIYHlJ6XQYCF8fvBggprEEJ8TeRmSTxyQsh+b0wwXJgNaC4
C5srgefurhaoKB4ZfWLUFWySkklZ3/DZ4d5IAUIYeRKbDWgKtrU3Pio83PF9Hxtr
Jx8BtHMNR0WM2nS3uR+l+MqZp6oAy3/TNUYhyuFyOjmQV6H0famIChSeovjKl3ES
kbKzza00ll1YFYo2p6/RTzy3l5FpdVxFFVZTmGvLWWXPnpYMGvjv+lpJBFGDwBeo
urReOvu6XPUSd3EJFxTef/SQjAAgBA==
=2h3m
-----END PGP SIGNATURE-----

--ygUYHVY//Jidmlqy--


