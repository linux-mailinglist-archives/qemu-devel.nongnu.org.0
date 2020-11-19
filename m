Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7402B9711
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 16:59:47 +0100 (CET)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmLa-0005cg-VQ
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 10:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfm4g-0002CW-UK
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfm4e-0002K6-VR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 10:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605800536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JwTIH9BiFSPGD41CbNQv+QZCc0tO8/eliu4mX7EAF80=;
 b=MtDDIQamVXDb0qaypJ7kq1Fa42tt4ekIKKBjTpXI7vCLSaKEtQga1lcX8sJTNxtYbGvUg1
 0p9GMYN4n6xpu2SahxAvitTB9mN3yCf/EvXkQQPBeMBhScVonO3+xOcF/IHYZGZrkuC7Vz
 XYMCJ1g9Bm45zpowzlJ+9PywDK/VpMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-ysYGHg1ROA6RNx34zm7YwA-1; Thu, 19 Nov 2020 10:42:13 -0500
X-MC-Unique: ysYGHg1ROA6RNx34zm7YwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C06348AEA40
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 15:42:12 +0000 (UTC)
Received: from localhost (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55F6619C47;
 Thu, 19 Nov 2020 15:42:09 +0000 (UTC)
Date: Thu, 19 Nov 2020 15:42:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2 2/2] viriofsd: Add support for
 FUSE_HANDLE_KILLPRIV_V2
Message-ID: <20201119154208.GA919560@stefanha-x1.localdomain>
References: <20201112182418.25395-1-vgoyal@redhat.com>
 <20201112182418.25395-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201112182418.25395-3-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2020 at 01:24:18PM -0500, Vivek Goyal wrote:
> This patch adds basic support for FUSE_HANDLE_KILLPRIV_V2. virtiofsd
> can enable/disable this by specifying option "-o killpriv_v2/no_killpriv_=
v2".
> By default this is enabled as long as client supports it
>=20
> Enabling this option helps with performance in write path. Without this
> option, currently every write is first preceeded with a getxattr() operat=
ion
> to find out if security.capability is set. (Write is supposed to clear
> security.capability). With this option enabled, server is signing up for
> clearing security.capability on every WRITE and also clearing suid/sgid
> subject to certain rules. This gets rid of extra getxattr() call for ever=
y
> WRITE and improves performance. This is true when virtiofsd is run with
> option -o xattr.
>=20
> What does enabling FUSE_HANDLE_KILLPRIV_V2 mean for file server implement=
ation.
> It needs to adhere to following rules. Thanks to Miklos for this summary.
>=20
> - clear "security.capability" on write, truncate and chown unconditionall=
y
> - clear suid/sgid in case of following. Note, sgid is cleared only if
>   group executable bit is set.
>     o setattr has FATTR_SIZE and FATTR_KILL_SUIDGID set.
>     o setattr has FATTR_UID or FATTR_GID
>     o open has O_TRUNC and FUSE_OPEN_KILL_SUIDGID
>     o create has O_TRUNC and FUSE_OPEN_KILL_SUIDGID flag set.
>     o write has FUSE_WRITE_KILL_SUIDGID
>=20
> >From Linux VFS client perspective, here are the requirements.
>=20
> - caps are always cleared on chown/write/truncate
> - suid is always cleared on chown, while for truncate/write it is cleared
>   only if caller does not have CAP_FSETID.
> - sgid is always cleared on chown, while for truncate/write it is cleared
>   only if caller does not have CAP_FSETID as well as file has group execu=
te
>   permission.
>=20
> virtiofsd implementation has not changed much to adhere to above ruls. An=
d
> reason being that current assumption is that we are running on Linux
> and on top of filesystems like ext4/xfs which already follow above rules.
> On write, truncate, chown, seucurity.capability is cleared. And virtiofsd
> drops CAP_FSETID if need be and that will lead to clearing of suid/sgid.
>=20
> But if virtiofsd is running on top a filesystem which breaks above assump=
tions,
> then it will have to take extra actions to emulate above. That's a TODO
> for later when need arises.
>=20
> Note: create normally is supposed to be called only when file does not
>       exist. So generally there should not be any question of clearing
>       setuid/setgid. But it is possible that after client checks that
>       file is not present, some other client creates file on server
>       and this race can trigger sending FUSE_CREATE. In that case, if
>       O_TRUNC is set, we should clear suid/sgid if FUSE_OPEN_KILL_SUIDGID
>       is also set.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  include/standard-headers/linux/fuse.h |  28 ++++++-
>  tools/virtiofsd/fuse_common.h         |  15 ++++
>  tools/virtiofsd/fuse_lowlevel.c       |  11 ++-
>  tools/virtiofsd/fuse_lowlevel.h       |   1 +
>  tools/virtiofsd/passthrough_ll.c      | 108 +++++++++++++++++++++++---
>  5 files changed, 148 insertions(+), 15 deletions(-)

Looks complicated but the implementation is simple since we rely on the
host file system to honor the semantics.

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+2klAACgkQnKSrs4Gr
c8ggWgf7BgztJEmZ0GMLHiMeAwew4JmhyfF2ZR2fJhYKu1My7CypEti0MjdtrMPM
BITDHZFytuL9VagDaZCD21Oo4Ou9HK5KXUeUuHUEmI3Cth0vNYcD7RRL0Of0isvZ
c9DsPqcWftGXlBqlQSi4KG5Cc0xhd4PmoxB9egaSTBeK/mT5corGXFDTOMmDjr61
42LSVKlsGw4x2i4kUriOY8UdM0odHqMypC9Fo9KR/UsUErhjGlUGcDHT7rJ5ZjrO
+lXhzrhKJD6JQ4dA5k6l3N6IKgQmkLrE4Dl2vF8uTnz7mQP68GsVZr/TjbuAXrgV
v5umuYGEBcH7ue+zx8AWrAlfQLRvkQ==
=/wtT
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--


