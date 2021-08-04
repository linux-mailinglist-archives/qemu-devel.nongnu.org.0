Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DCD3DFC7A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:08:46 +0200 (CEST)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBBxE-0003ac-RQ
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1mBBvi-0002M0-VC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eterrell@redhat.com>)
 id 1mBBvb-0006Dj-UK
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628064422;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nvvvzg8evBwxJieV2CjswcoyCSPvhCw62Yr6Le3pYAI=;
 b=MJs43oOawGtcrPEVM1iwLcLgiw1KytQKzLMRfzPELLfSDirAO/C3EiHklwCVsiEUAZ05Ha
 46GMf0NxZeWSBOlQOvMUmm0LmeVg5Vk3vFmSvU9kUJX1Rp/6lJToufeLRc90x36X9/A68y
 zgivMN2MmpluUuNOlgRpXwUUto/RNK4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-IXmV54zsNRehugLy6IwSFg-1; Wed, 04 Aug 2021 04:05:41 -0400
X-MC-Unique: IXmV54zsNRehugLy6IwSFg-1
Received: by mail-wm1-f69.google.com with SMTP id
 d72-20020a1c1d4b0000b029025164ff3ebfso1706087wmd.7
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version;
 bh=hsjA8OpP/8xFhpE1tX756fY8zJeahAeA/gZYmFqW5LM=;
 b=QwhdthAl3EfCeb/x9zwZGJnD+ODtjX5lMvll32yGpndHc3R9LtJ6O/tW3x1CEVO+u2
 MUbJJUUiL5FcLCFKhqRbWou7rb4falLzAMzFZI44W75pTdXk/Sb8pC+RhfE3pWoo3LwP
 XpghuNm5I6GioMu8wcPzPeEqZZIetN7y7FD7kITyQUxnn7c5abqidBMNCeb/M4GZmTaN
 +yXg2/1YY49kvDCNAzCTHMpm0TsF4i9ftwO2axDIMwFMQ+Zef9/czzOwPanaAx66Vuvh
 d5bCYzCEl+dhXrpR8DUs8xDipftTayvQcvP14mms9d5yZUQQ9zTS8ANJkRY/vCavfRwf
 MW7Q==
X-Gm-Message-State: AOAM532l3FtYrEmxHr2ZREvEUWpLTYvFkgQTLpCVrhiL7/Pweecx+fPE
 /b1lbCAAOhs2UL3DV1wP/+SU6VGJwJ9/+Tzqwc86fgWo+U1Jf3YbDd0+eWp9z0DudDVhBdwTYbr
 19STBwN2Z+q8ej9A=
X-Received: by 2002:a1c:6245:: with SMTP id w66mr8369146wmb.143.1628064340128; 
 Wed, 04 Aug 2021 01:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0OT91vnQMDsAWO5u8d8Kcw9TUdRHnVn7AcB+DT4zikRpv3lfoFn5wazrF+80vfF2qBncQAQ==
X-Received: by 2002:a1c:6245:: with SMTP id w66mr8369123wmb.143.1628064339834; 
 Wed, 04 Aug 2021 01:05:39 -0700 (PDT)
Received: from [192.168.1.116]
 (dynamic-078-055-046-234.78.55.pool.telefonica.de. [78.55.46.234])
 by smtp.gmail.com with ESMTPSA id i7sm1604043wre.64.2021.08.04.01.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:05:39 -0700 (PDT)
Message-ID: <008bee58061405c8f9fe36d8c40a62d360bd4547.camel@redhat.com>
Subject: Re: [PATCH 0/5] seccomp: fix hole in blocking forks
From: Eduardo Terrell Ferrari Otubo <eterrell@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org
Date: Wed, 04 Aug 2021 10:05:38 +0200
In-Reply-To: <20210802130303.3300108-1-berrange@redhat.com>
References: <20210802130303.3300108-1-berrange@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.40.3 (by Flathub.org)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eterrell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-YBdojBSeI3cTw3OmqMN7"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eterrell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eterrell@redhat.com
Cc: Eduardo Otubo <otubo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-YBdojBSeI3cTw3OmqMN7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-08-02 at 14:02 +0100, Daniel P. Berrang=C3=A9 wrote:
> Blocking the 'fork' syscall on Linux is not sufficient to block the
> 'fork' C library function, because the latter is essentially always
> implemented using the 'clone' syscall these days.
>=20
> Blocking 'clone' is difficult as that also blocks pthread creation,
> so it needs careful filtering.
>=20
> Daniel P. Berrang=C3=A9 (5):
> =C2=A0 seccomp: allow action to be customized per syscall
> =C2=A0 seccomp: add unit test for seccomp filtering
> =C2=A0 seccomp: fix blocking of process spawning
> =C2=A0 seccomp: block use of clone3 syscall
> =C2=A0 seccomp: block setns, unshare and execveat syscalls
>=20
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0softmmu/qemu-seccomp.c=C2=A0=C2=A0=C2=A0 | 282 ++++++++++++++++++++=
+++++++++-------
> --
> =C2=A0tests/unit/meson.build=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A0tests/unit/test-seccomp.c | 269 +++++++++++++++++++++++++++++++++++=
+
> =C2=A04 files changed, 490 insertions(+), 66 deletions(-)
> =C2=A0create mode 100644 tests/unit/test-seccomp.c
>=20
> --=20
> 2.31.1
>=20
>=20

Acked-by: Eduardo Otubo <otubo@redhat.com>

--=20
Eduardo Otubo



--=-YBdojBSeI3cTw3OmqMN7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQFIBAABCAAyFiEE1n4bUJN0hrQHI9ur3zLnwPD/+aIFAmEKSlIUHGV0ZXJyZWxs
QHJlZGhhdC5jb20ACgkQ3zLnwPD/+aKV9AgAm4GHqu0tZ2w04Emhn5pLD0yoF1lR
pGFNXlh4MkxsY34894bGuka9RoH/VC/3csQSO6yHuv2o4DEdSKCfOFCoIUKXLVqn
LcHEasVwIKasCjWNUwULnsbLmhzrhNyMVHUwYPVWgIThigMg6H2bOrCbeZBWpsXJ
yqytQSZ/tdPY/lXv4mPqo5UfYvGRXOuFJdDWuHUHKoSbFT1Fk+anJLp6q3aKfhfI
6ZQlnkVmQrp1WXBEf72mF6fgPmdMWXGuu7/UiL5qrrQhzRoyQkOz5NVpV/grL7lR
9x3xEtl2QZooq0ceZAfhntSieO/mJgGyraDqf1RG+Co8pKsvVywrzk3YRA==
=M+LU
-----END PGP SIGNATURE-----

--=-YBdojBSeI3cTw3OmqMN7--


