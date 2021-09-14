Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41D40AFA9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:53:04 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8rv-00025n-K5
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mQ8j2-0006ub-Ab
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mQ8Xr-0002qg-UP
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631626338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5erqOm03G9NHKJ9YABxsEDOBfDLnRXOdIJxTjLjrZo=;
 b=TukunLFLwMyNsJIlbMpdqcaXc2ZZp/jh9XByUkJOcM9dPwr55hefzvcJe4c75j9441PecM
 2CXUBtjXO06GWNeM1eo9ngTPaJ4H8fThj4oRqSDGsse/H7GAr4YDdePBTjOEUs3UJYBL3+
 zTGM4CDlrKTabazaV0lHEjZl23gpWg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-ZivxND_dNBCXgEnKqt02PA-1; Tue, 14 Sep 2021 09:32:17 -0400
X-MC-Unique: ZivxND_dNBCXgEnKqt02PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E8A9100CCC7;
 Tue, 14 Sep 2021 13:32:16 +0000 (UTC)
Received: from localhost (unknown [10.33.36.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1929F6A907;
 Tue, 14 Sep 2021 13:32:09 +0000 (UTC)
Date: Tue, 14 Sep 2021 15:32:09 +0200
From: Sergio Lopez <slp@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] tools/virtiofsd: Add fstatfs64 syscall to
 the seccomp allowlist
Message-ID: <20210914133106.jfbulec3pd23cfvv@mhamilton>
References: <20210914123214.181885-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210914123214.181885-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6mcs2kfyiq275vhm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6mcs2kfyiq275vhm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 02:32:14PM +0200, Thomas Huth wrote:
> The virtiofsd currently crashes on s390x when doing something like
> this in the guest:
>=20
>  mkdir -p /mnt/myfs
>  mount -t virtiofs myfs /mnt/myfs
>  touch /mnt/myfs/foo.txt
>  stat -f /mnt/myfs/foo.txt
>=20
> The problem is that the fstatfs64 syscall is called in this case
> from the virtiofsd. We have to put it on the seccomp allowlist to
> avoid that the daemon gets killed in this case.
>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001728
> Suggested-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Sergio Lopez <slp@redhat.com>

> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/pass=
through_seccomp.c
> index f49ed94b5e..a3ce9f898d 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -51,6 +51,7 @@ static const int syscall_allowlist[] =3D {
>      SCMP_SYS(fsetxattr),
>      SCMP_SYS(fstat),
>      SCMP_SYS(fstatfs),
> +    SCMP_SYS(fstatfs64),
>      SCMP_SYS(fsync),
>      SCMP_SYS(ftruncate),
>      SCMP_SYS(futex),
> --=20
> 2.27.0
>=20
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
>=20

--6mcs2kfyiq275vhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmFApFgACgkQ9GknjS8M
AjXT6g//cEMLHGOs3/OAieTxXi8mdIl8rDfO8mS4f+VrhnXDpiIgwtejQXDFyXdt
iUEsMmm6DNq43gNhLVo52mSxaAfDjipaoO/2tc6ANF/K8QulvQnoabI2+lPS0ilt
KmcVhzDSSoIxv8xyIKIHbcKiEgX2ZtsI9DIg1sHInZwkNp2CKv71Qe6xIIaSDgkr
BbZ+aeqMf7jZqulNxob/uvchg11K2Aq8gwS6PEQsaCGsf/cQX3xNgaf8gPIblr7X
SZnNxu/oCQlOwdxNDNN2HagEqeGfl10XzN05m4QasizcwpC9Xbsr8jOKwmfxkTT5
cQAidjTfBCZChpkLLyqG7Bv2MVPTTpRylEpQIe2wT9vDNK8aHh7qOEk5rwxQO0/P
cnUk4MBR0zfe9k/4jQZcVTzsPClKhqlZJh7kzB/m31Mo8Iun4Pf1HfXXBoXMmVXX
DbBn+uau3ZyNfMWFIapCZbLS2ZReHuILt1fNomsGmhCBmb/+5NawUYNaubGYZVBw
2UZCsdlPr74C+jxUZOgfwgxNVEhIQqiTZsFVvmE/j0F//uTM41k4d5GVq154Yviy
+Sm8POceEHDh6AEfdedUg2H3CV8hcxlTQfSxijguOs+AP4q0lB4vORRu1GI0D919
TDSvcNIJYRHw8VjGClIygE/6ubEzE4Ven9+ADfQMC+asaNHs/gI=
=OFEB
-----END PGP SIGNATURE-----

--6mcs2kfyiq275vhm--


