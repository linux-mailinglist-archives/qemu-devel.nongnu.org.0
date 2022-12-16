Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A589064E990
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:39:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p686b-00066i-Od; Fri, 16 Dec 2022 05:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@shadow.tech>)
 id 1p686X-00066V-9R
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:38:13 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@shadow.tech>)
 id 1p686R-0001f2-Rz
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:38:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id o5so2073765wrm.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shadow-tech.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EvlU1AL948B7tMo/URdTCGkckNJs3XzMr5vu5pi4mgc=;
 b=iuFbfHkanNgluv09M+K1zc/eCufhQyHKbCnkAklBjyrp1L5OUfsRYXURpOaKeTcdwj
 RP8hPvfaMQwz3OrIZuJqp+iKLtxdtwKU3TkFCr6HkXnhAqoGIW7SmnOn+LF6Q6QQSYjP
 Zs0HVPuWRmAYzldj4iBPsxikXmKvzY0JxWTxMkMA37Hc0EgQ7JpPHkuaAg07fiMnYCFl
 uFvxflYMpJevC1IM4skdz16pO+E06H2sdt6ngZ338/VBGbWQn+7S+l4kWtw4dlYY1xBZ
 GItannc8vWJN0HADbYFMe3HSgdxY4l51u3EIjWvBFRtrd3ebaRdQ52cT3hUVQ190Ujt/
 JAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvlU1AL948B7tMo/URdTCGkckNJs3XzMr5vu5pi4mgc=;
 b=sazcqMnb0Qg4Rf6MGzhj3xt7XuiqgA9jIaubSHorP5Rl3PO+m5DuBb9f9y/kVSMFg2
 VsbWeAVJ4omy2/GPmjEzwFZvE+raEIqvVUYq9cmZ3dBl8Q7HKNRDj2Sy5my2VHkpJWQ6
 m390qAljzB6FSpTC4JlEApQhGWqdbTAukIICfQpfOVYRFLMGDyAzCoqZLVuWouqph/BX
 +w5n5oMHrt4K8w4Szr80uFTmzaCV9QOAtxqJcfs1kBgQq2w0FV1y3TeQtDMfWpqfC0Rk
 +a/nPuWQKXwjzHfPPm+1elZJ9I40OrJ1nRkgw3sIerQymRFAzyfvwBw9L6C6reyR8mZM
 F4Pw==
X-Gm-Message-State: ANoB5pnsioyo+T1HcxI6K6HETEF5xGLtLLUjqkDHBNKBoicVuYrhPHX4
 Gv/ELu7ANh57Qlzz8ZASk1+xlg==
X-Google-Smtp-Source: AA0mqf7Jrj8rzzUph79t6FSyxNJ9hn3D0GUVxM/aj5hYgm9nMPbLgRXYc0WE2i+jrn8Z6taSZnAQ/g==
X-Received: by 2002:a5d:564a:0:b0:24c:f1ca:b2df with SMTP id
 j10-20020a5d564a000000b0024cf1cab2dfmr17856627wrw.67.1671187084714; 
 Fri, 16 Dec 2022 02:38:04 -0800 (PST)
Received: from localhost ([185.123.26.202]) by smtp.gmail.com with ESMTPSA id
 bo28-20020a056000069c00b002415dd45320sm1906084wrb.112.2022.12.16.02.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 02:38:04 -0800 (PST)
Date: Fri, 16 Dec 2022 11:38:03 +0100
From: Antoine Damhet <antoine.damhet@shadow.tech>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, vm@shadow.tech,
 Charles Frey <charles.frey@shadow.tech>
Subject: Re: [PATCH 2/2] io/channel-tls: fix handling of bigger read buffers
Message-ID: <20221216103803.y3xse3axbqdfl7r7@cole.xdbob.net>
References: <20221115142329.92524-1-antoine.damhet@shadow.tech>
 <20221115142329.92524-3-antoine.damhet@shadow.tech>
 <Y3TA5LLIZFVHrNBM@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2vqdl7pwh7dvqaj7"
Content-Disposition: inline
In-Reply-To: <Y3TA5LLIZFVHrNBM@redhat.com>
Received-SPF: permerror client-ip=2a00:1450:4864:20::434;
 envelope-from=antoine.damhet@shadow.tech; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--2vqdl7pwh7dvqaj7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2022 at 10:52:20AM +0000, Daniel P. Berrang=E9 wrote:
> On Tue, Nov 15, 2022 at 03:23:29PM +0100, antoine.damhet@shadow.tech wrot=
e:
> > From: Antoine Damhet <antoine.damhet@shadow.tech>
> >=20
> > Since the TLS backend can read more data from the underlying QIOChannel
> > we introduce a minimal child GSource to notify if we still have more
> > data available to be read.
> >=20
> > Signed-off-by: Antoine Damhet <antoine.damhet@shadow.tech>
> > Signed-off-by: Charles Frey <charles.frey@shadow.tech>
> > ---
> >  io/channel-tls.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 65 insertions(+), 1 deletion(-)
>=20
> Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>

Thanks,

Now that the 7.2.0 is released, can we hope to get this queued ? If not
what should I do ?

Best regards,

--=20
Antoine 'xdbob' Damhet

>=20
>=20
> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20

--2vqdl7pwh7dvqaj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEArm1WbQx2GmOsfF83AmjLzzljz4FAmOcSn4ACgkQ3AmjLzzl
jz4s1AgAhxgUfSnizeS9E7gB8np1pWPNsr/XCNleNK29IjU8vdaHqjBaKMvJMBvF
DLPqouUMs8RXZsVbinB80Kl7pYJaHikUmhP3x5K2dF+MC8tt6IaDRXbMo1RcjvE8
XAj17LQHGm+og5QhPLL5hgMe0oIrAEfuPqkHhbIovTPe8qQGd7ZM8acUddqRL0Qf
xl1yA1Xr/T2qbwCPYwy7YySRnFtH03YNLHWDHqSjIO9W179Mo8mooHJaNbRoZHI0
cRdYuVdyRZEnPv7bc+cgrVREVZGdFFJ7veopgQxVQ71sWFw5fi1gnjOaXpi3R7hH
hafo32VMVgoe0LaxHNia6onbEKbikA==
=pgP6
-----END PGP SIGNATURE-----

--2vqdl7pwh7dvqaj7--

