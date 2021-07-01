Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B523F3B8E18
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:16:42 +0200 (CEST)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyqwD-0000Va-QU
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <otubo@redhat.com>) id 1lyqv2-00087A-Ok
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:15:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <otubo@redhat.com>) id 1lyquz-0003A4-MA
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625123718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AsEW0WsWZsUK371OezQnHduAuVfbObe9PwSboZG444s=;
 b=e/47GoTINdhD6xfBfn29Se9U/+7Yqymiqjv6Wt0d0nPOVbj5qXwDXUU9WY+W9Mry11aWju
 WCm44yTimuUX6iTTe0GmgIUQ2ACx6OcKuHnUg8zc7YCOjfbZBv0b7JNIhrkklOYRdnXaiz
 49Q1tQXbfNy3lRWqJ0IyxWzOEbM+PcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-5hU6HmHVOIWkFbFKNDLhVA-1; Thu, 01 Jul 2021 03:15:15 -0400
X-MC-Unique: 5hU6HmHVOIWkFbFKNDLhVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C96EA804141
 for <qemu-devel@nongnu.org>; Thu,  1 Jul 2021 07:15:14 +0000 (UTC)
Received: from genji (ovpn-112-223.ams2.redhat.com [10.36.112.223])
 by smtp.corp.redhat.com (Postfix) with SMTP id AD07460C17;
 Thu,  1 Jul 2021 07:15:02 +0000 (UTC)
Date: Thu, 1 Jul 2021 09:15:01 +0200
From: Eduardo Otubo <otubo@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] seccomp: don't block getters for resource control syscalls
Message-ID: <20210701071501.GA60305@genji>
References: <20210630160526.977225-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210630160526.977225-1-berrange@redhat.com>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=otubo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=otubo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Florian Weimer <fweimer@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30/06/2021 - 17:05:26, Daniel P. Berrange wrote:
> Recent GLibC calls sched_getaffinity in code paths related to malloc and
> when QEMU blocks access, it sends it off into a bad codepath resulting
> in stack exhaustion[1]. The GLibC bug is being fixed[2], but none the
> less, GLibC has valid reasons to want to use sched_getaffinity.
>=20
> It is not unreasonable for code to want to run many resource syscalls
> for information gathering, so it is a bit too harsh for QEMU to block
> them.
>=20
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=3D1975693
> [2] https://sourceware.org/pipermail/libc-alpha/2021-June/128271.html
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  softmmu/qemu-seccomp.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
> index 9c29d9cf00..f50026778c 100644
> --- a/softmmu/qemu-seccomp.c
> +++ b/softmmu/qemu-seccomp.c
> @@ -97,17 +97,11 @@ static const struct QemuSeccompSyscall denylist[] =3D=
 {
>      { SCMP_SYS(vfork),                  QEMU_SECCOMP_SET_SPAWN },
>      { SCMP_SYS(execve),                 QEMU_SECCOMP_SET_SPAWN },
>      /* resource control */
> -    { SCMP_SYS(getpriority),            QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(setpriority),            QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(sched_setparam),         QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_getparam),         QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(sched_setscheduler),     QEMU_SECCOMP_SET_RESOURCECTL,
>        ARRAY_SIZE(sched_setscheduler_arg), sched_setscheduler_arg },
> -    { SCMP_SYS(sched_getscheduler),     QEMU_SECCOMP_SET_RESOURCECTL },
>      { SCMP_SYS(sched_setaffinity),      QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_getaffinity),      QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_get_priority_max), QEMU_SECCOMP_SET_RESOURCECTL },
> -    { SCMP_SYS(sched_get_priority_min), QEMU_SECCOMP_SET_RESOURCECTL },
>  };
> =20
>  static inline __attribute__((unused)) int
> --=20
> 2.31.1
>=20

Acked-by: Eduardo Otubo <otubo@redhat.com>

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE1n4bUJN0hrQHI9ur3zLnwPD/+aIFAmDda3UACgkQ3zLnwPD/
+aL0rQgAm8Qnw7HW8NZaNaYfeKJ1OwLbTNroEL9iWu1nQHnXKHOC6xau3IWTi5hA
ZpBhMDoh3G20WjDJdMBtOSzOk31EK+7UKp/yWMqvg6wuJN8E7RilPuw7pmfNGmhf
HRLQCLXuVJqe2lMragNsTyxSrL1z55pJO1NV2cq8uKWttzHjVTyhCbn/Pd2LxVVI
iIUbWfHd8bfgpcp3KYWqx0N6a/LGC/QsPq899F/EkTbb6NWm+erI43PF/896KLV4
WqmQ22V5eo7D35DNRBv9iQpqSKH1NzOF4N48KHDlCySA5OmJNq7wdh7gBT5V1emO
KHaL+W9TCy952MEUssFox7BP/5nVLw==
=U0cL
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--


