Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532823240E1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:37:02 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwDl-0005XK-8D
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwBm-00050J-Lk
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEwBk-0000hB-CC
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614180895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fpRiwei4qP074NO39BVj0l2teiTcjxLxHLXcarFGuFc=;
 b=Oe2pWG7kRFJg5OVrY3/RjZ681jjK7JvPJu0fxFULujKEjj8dbTN6UB1xBzrf2idEwJ53WO
 hrpcREYSS+BXZ55T0nvjcqIhly3Zvx9qasDJMgTe1ich4ly5MNid95jIYdwsEUJaI6U3zk
 8acfFvEKKpEEhDK7wEUmF3tyzIUAgY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-0hc4f5ZiNeKAz9A-h7LDHw-1; Wed, 24 Feb 2021 10:34:53 -0500
X-MC-Unique: 0hc4f5ZiNeKAz9A-h7LDHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599641B0D36E;
 Wed, 24 Feb 2021 15:02:58 +0000 (UTC)
Received: from localhost (ovpn-115-137.ams2.redhat.com [10.36.115.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6DD60C5B;
 Wed, 24 Feb 2021 15:02:49 +0000 (UTC)
Date: Wed, 24 Feb 2021 15:02:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3 2/2] virtiofsd: Enable posix_acls by default if xattrs
 are enabled
Message-ID: <YDZqmFRjo7EfuSA2@stefanha-x1.localdomain>
References: <20210223225250.23945-1-vgoyal@redhat.com>
 <20210223225250.23945-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223225250.23945-3-vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qeak9ylNud5wPNaF"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, lhenriques@suse.de, miklos@szeredi.hu,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qeak9ylNud5wPNaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 05:52:50PM -0500, Vivek Goyal wrote:
> Fuse protocl wants file server to opt in for FUSE_POSIX_ACL if posix
> acls are to be enabled. Right now virtiofsd does not enable it. This
> patch opts in for FUSE_POSIX_ACL if xattr support is enabled.
>=20
> When parent directory has default acl and a file is created in that
> directory, then umask is ignored and final file permissions are
> determined using default acl instead. (man 2 umask).
>=20
> Currently, fuse applies the umask and sends modified mode in create
> request accordingly. fuse server can set FUSE_DONT_MASK and tell
> fuse client to not apply umask and fuse server will take care of
> it as needed.
>=20
> With posix acls enabled, requirement will be that we want umask
> to determine final file mode if parent directory does not have
> default acl.
>=20
> So if posix acls are enabled, opt in for FUSE_DONT_MASK. virtiofsd
> will set umask of the thread doing file creation. And host kernel
> should use that umask if parent directory does not have default
> acls, otherwise umask does not take affect.
>=20
> Miklos mentioned that we already call unshare(CLONE_FS) for
> every thread. That means umask has now become property of per
> thread and it should be ok to manipulate it in file creation path.
>=20
> So this patch also opts in for FUSE_DONT_MASK if posix acls are enabled
> and changes umask to caller umask before file creation and restores
> original umask after file creation is done.
>=20
> This should fix fstest generic/099.
>=20
> Reported-by: Luis Henriques <lhenriques@suse.de>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qeak9ylNud5wPNaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA2apgACgkQnKSrs4Gr
c8hohggArikNHhycv2EGxYGzN2/ktYvmeaDlAOhQ/xB11j26Bx3xo2QoV3Zf1MfV
nlBGEH6iCYzUcCj9jg9F1yWN2O8z1StkyIFUuccwxKoCLYt1ag4J0j8EYnNPrubE
A1Pi72Zyl8xrdTr8P/E7Sq++ybmiGmrKzUgSjsER6u3NeSQ6Ok7lOphE8gS9Z3WV
kYBu8Wqs0bclBd8XD2eKZm/kdOZWdR3VIl98XNL5pvL0Rg5Kbs+u46y86t+lPanL
yfpSfVPOtVMU0kSsYKNjx6Hky4Et4rZpRxyMIfITuH43K1y3soGfu1HJZ4FiKYD5
ZQIxRclZoYFyh4/4ddj2BXeUgwLhUQ==
=i7ub
-----END PGP SIGNATURE-----

--qeak9ylNud5wPNaF--


