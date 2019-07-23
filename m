Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED3718EA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 15:11:13 +0200 (CEST)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpuZU-0004WQ-AX
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 09:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hpuZH-00042F-2c
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 09:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hpuZF-0002Vv-8P
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 09:10:58 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55780)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hpuZE-0002VH-Qj
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 09:10:57 -0400
Received: by mail-wm1-x341.google.com with SMTP id a15so38480032wmj.5
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 06:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nJZOj6JRsYLd90cITgMahz7iyL5LaVYIDd6FHQ68suI=;
 b=c5Vavl5STQlONX87SQJ4/LqLHRQwK+gwEoGieTSBru4yYpF27plBd7GUbtDSjtAeIu
 z4brxqgxBR710fFFPYXVFdFmBagADj4zyzJBnRGY6mzqFc2QyUoYc8eLiyysbiPE8thL
 VjY3gigiq+B4TnWAFUXHrIhKLpeiaFT4CJXKI7iawMCnzwI4uBHdstvd+fb3LuATu0ja
 8FXkkW10mlR3/zmIS1cbwwYuYgG4oUM86Eq02gdAako909VmNF18KR82I5QXZIjZw3H3
 mpPjQcZI/kFh/drWXAIEtMw6EhGTNO3yo2UDnlCgM52t7lBIH03FikNe+Qc91mqBsdwo
 w03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nJZOj6JRsYLd90cITgMahz7iyL5LaVYIDd6FHQ68suI=;
 b=Qut7No2zESm+vmyfOaNLo4qFyzo0EaCQo3KgwUR7LKa57msLvxkFLohDKMsV4S8DYu
 M+RRDfS/oTusW4ZsOFn3puf3t1m4vuCQkH39QM2jkMjk84gvdzZ0bn6GvxXnQR2NWS4X
 xDKT7KAlj1u4HjByq/GaL8PEAOWTCkCIFQvXt2rQDu10j1Z7jr2VDDCvao6YSDHgESnH
 CW4dTxB1GnymSfau2oqDrtYZQTCRwYpjvk6y3LgP4+RQ/h2XdkDEMJPOHzDy71/b+DW8
 2Cw61XIgIRKGaiKWRHcz9SQ2uiplBsllOlLyqMOU4ZhMF+s7+YRY4eThf7cOPW3JcZE3
 LkhQ==
X-Gm-Message-State: APjAAAVzez1e9fo8oVNxXfj15bb7dhNNNtCxI7acp3wZH0m/1itQfrOb
 cv/3lAx26fMguc7mqJzvzv0=
X-Google-Smtp-Source: APXvYqyStnXTjCFRj5xw3MBpmGx7q/s29bjcs4YyORW60cxod/Pys/Ee52ns6yjQu/HG3Qjaz22tZw==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr71246465wmg.6.1563887455025; 
 Tue, 23 Jul 2019 06:10:55 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id z25sm48231603wmf.38.2019.07.23.06.10.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 06:10:54 -0700 (PDT)
Date: Tue, 23 Jul 2019 14:10:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: P J P <ppandit@redhat.com>
Message-ID: <20190723131052.GD5445@stefanha-x1.localdomain>
References: <20190723104754.29324-1-ppandit@redhat.com>
 <20190723104754.29324-2-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline
In-Reply-To: <20190723104754.29324-2-ppandit@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v4 1/3] qemu-bridge-helper: restrict
 interface name to IFNAMSIZ
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
Cc: Riccardo Schirone <rschiron@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2019 at 04:17:52PM +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>=20
> The network interface name in Linux is defined to be of size
> IFNAMSIZ(=3D16), including the terminating null('\0') byte.
> The same is applied to interface names read from 'bridge.conf'
> file to form ACL rules. If user supplied '--br=3Dbridge' name
> is not restricted to the same length, it could lead to ACL bypass
> issue. Restrict interface name to IFNAMSIZ, including null byte.
>=20
> Reported-by: Riccardo Schirone <rschiron@redhat.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  qemu-bridge-helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> Reviewed v3
>   -> https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg00245.ht=
ml

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl03B1wACgkQnKSrs4Gr
c8g/lAf/RRKHrOgQR3bui2Jdylhfayxchmx8Xe9mPIsP1L2vTS4jGZvCGOVTZ1KA
h5BiyhsjG/NV3QWsUwVoP4ejKp/g5uYo6Dc1GKXSDglMTJGU1dU7rxDvMJi/kYCh
1LOhGUTNZiXhbFZSwzoyU4v8BxXbOlWisB301xeyrc14Z7CrKP+BtB7O8jd/cmNm
WEqpctpm6W8uitl+wjjiq958a4KqYtaH0nGXTO47+aJlxuX3kVL51kxcBiqJ/qCz
6bEy18qK+NXv1aK+q7m7VlyZ1qY/SBYd2QY3dItvAodc0Yacr2wk1QzTr+4tXbmT
PUn6CgwyUPbKxVSih5vYCkdUlRvxYQ==
=uWaT
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--

