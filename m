Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A4849C70D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 11:06:03 +0100 (CET)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCfBi-0000nT-8X
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 05:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCf9n-00005H-Qy
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCf9l-00064F-GX
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643191436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YYy5Z5parlbUWxPPiurwFsyJu7qhcgIEaN1TqKFxUCU=;
 b=OS9BaoIPoeMQz8W0hHQ/dpJavtHCrpDoI8BVy/MUtw/ea6jKRRCe9zdi2i5v48j+EphTpg
 rVjULkeDwZQTQlxtK7GZ2EU2jd4xni2EAX/hatKgN8B7YHbCUrm2uA/SA4VVYOJvEVRTH9
 JnjleECsuj9YwhFPp86LqHwjLk7fTWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-6bf8iQsCMm-cuWnARXfsJA-1; Wed, 26 Jan 2022 05:03:53 -0500
X-MC-Unique: 6bf8iQsCMm-cuWnARXfsJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4BB881424A;
 Wed, 26 Jan 2022 10:03:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18B4D78DDC;
 Wed, 26 Jan 2022 10:03:35 +0000 (UTC)
Date: Wed, 26 Jan 2022 10:03:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: Drop membership of all supplementary groups
 (CVE-2022-0358)
Message-ID: <YfEcdsTdIBc9nIdN@stefanha-x1.localdomain>
References: <YfBGoriS38eBQrAb@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jSvtBYRQZ+4qrsEh"
Content-Disposition: inline
In-Reply-To: <YfBGoriS38eBQrAb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: JIETAO XIAO <shawtao1125@gmail.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Miklos Szeredi <mszeredi@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, P J P <pj.pandit@yahoo.co.in>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jSvtBYRQZ+4qrsEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 01:51:14PM -0500, Vivek Goyal wrote:
> At the start, drop membership of all supplementary groups. This is
> not required.
>=20
> If we have membership of "root" supplementary group and when we switch
> uid/gid using setresuid/setsgid, we still retain membership of existing
> supplemntary groups. And that can allow some operations which are not
> normally allowed.
>=20
> For example, if root in guest creates a dir as follows.
>=20
> $ mkdir -m 03777 test_dir
>=20
> This sets SGID on dir as well as allows unprivileged users to write into
> this dir.=20
>=20
> And now as unprivileged user open file as follows.
>=20
> $ su test
> $ fd =3D open("test_dir/priviledge_id", O_RDWR|O_CREAT|O_EXCL, 02755);
>=20
> This will create SGID set executable in test_dir/.
>=20
> And that's a problem because now an unpriviliged user can execute it,
> get egid=3D0 and get access to resources owned by "root" group. This is
> privilege escalation.
>=20
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2044863
> Fixes: CVE-2022-0358
> Reported-by: JIETAO XIAO <shawtao1125@gmail.com>
> Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2022-01-25 13:38:=
59.349534531 -0500
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2022-01-25 13:39:10.14=
0177868 -0500
> @@ -54,6 +54,7 @@
>  #include <sys/wait.h>
>  #include <sys/xattr.h>
>  #include <syslog.h>
> +#include <grp.h>
> =20
>  #include "qemu/cutils.h"
>  #include "passthrough_helpers.h"
> @@ -1161,6 +1162,29 @@ static void lo_lookup(fuse_req_t req, fu
>  #define OURSYS_setresuid SYS_setresuid
>  #endif
> =20
> +static void drop_supplementary_groups(void)
> +{
> +    int ret;
> +
> +    ret =3D getgroups(0, NULL);
> +    if (ret =3D=3D -1) {
> +        fuse_log(FUSE_LOG_ERR, "getgroups() failed with error=3D%d:%s\n",
> +                 errno, strerror(errno));
> +        exit(1);
> +    }
> +
> +    if (!ret)
> +        return;
> +
> +    /* Drop all supplementary groups. We should not need it */
> +    ret =3D setgroups(0, NULL);
> +    if (ret =3D=3D -1) {
> +        fuse_log(FUSE_LOG_ERR, "setgroups() failed with error=3D%d:%s\n",
> +                 errno, strerror(errno));
> +        exit(1);
> +    }
> +}
> +
>  /*
>   * Change to uid/gid of caller so that file is created with
>   * ownership of caller.
> @@ -3926,6 +3950,8 @@ int main(int argc, char *argv[])
> =20
>      qemu_init_exec_dir(argv[0]);
> =20
> +    drop_supplementary_groups();
> +
>      pthread_mutex_init(&lo.mutex, NULL);
>      lo.inodes =3D g_hash_table_new(lo_key_hash, lo_key_equal);
>      lo.root.fd =3D -1;
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--jSvtBYRQZ+4qrsEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxHHYACgkQnKSrs4Gr
c8jbUggAh+7Be0D4ZOGQInjB24fvp2LnX7kIXpz5dDjsiII+PRgLdpGR+7I/qSnn
td4RDMFfmrroRD2wUqBs6btnnIYfYh6H1c6K3Nd7Ntc1ARiTJ1E5/fQZFtcHIKFK
lq6NSoDAzhGijIr0LOHuzwhdJjI3EGsWyPtp36qGXTijCVxOBHwNMexPIDtpfue6
YnvnN8WSK9wfdIIVqeCtg2PhKMtK7qs2TChyXhvIv6huxUNSF5rHcuLrEqfSHSVC
dD3XLP37eKdQMCmIaFk3PF8xNbX5gw3RpEYrB0Ujpcbs2w2PBn5qiZduDlBq1oTV
Nav1bJ9JL0OOt2dylN4rhZaCe2hMPQ==
=6Trd
-----END PGP SIGNATURE-----

--jSvtBYRQZ+4qrsEh--


