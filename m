Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633702F4E71
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:24:36 +0100 (CET)
Received: from localhost ([::1]:36524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi0h-0005ry-Eb
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzhuh-0001dZ-Di
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:18:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzhuf-00024A-Cg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610551100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zkUiFlO/nJXpnvriu/i42N3099DysBt194WS//HtZZY=;
 b=D8dHA/fAdRjgzi85QjuoK/v1OeOsPjSB8qRiyxoO8hFrqkEj8Pf9IeBRsEB3bwuAI8t9Tk
 vkgh9D5TNMT2vdTcvUQl9Eq73hi6/qWDLlwRx4BE9sYslzbDFHQwywM5UrMTYaZtwHGD3X
 aKx4YPxf4oSyLJgnjycg/YhFfYmiOng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-vAXRcca8PruUuQdGJmnelQ-1; Wed, 13 Jan 2021 10:18:18 -0500
X-MC-Unique: vAXRcca8PruUuQdGJmnelQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D569806660
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:18:17 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B87E55D9EF;
 Wed, 13 Jan 2021 15:18:16 +0000 (UTC)
Date: Wed, 13 Jan 2021 15:18:15 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] tracetool: also strip %l and %ll from systemtap
 format strings
Message-ID: <20210113151815.GH255928@stefanha-x1.localdomain>
References: <20210106130239.1004729-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210106130239.1004729-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, William Cohen <wcohen@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 01:02:39PM +0000, Daniel P. Berrang=E9 wrote:
> All variables are 64-bit and so %l / %ll are not required, and the
> latter is actually invalid:
>=20
>   $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
>   parse error: invalid or missing conversion specifier
>           saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
>        source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x=
%x size: %llu
> refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, =
refcnt, fd, log)
>=20
>                        ^
>=20
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> ---
>  scripts/tracetool/format/log_stap.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> In v2:
>=20
>  - Change existing logic that stripped %z to handle %l/%ll too

Thanks, applied to my tracing tree with Laurent's typo fix:
https://gitlab.com/stefanha/qemu/commits/tracing

Stefan

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl//DzcACgkQnKSrs4Gr
c8hHxwgAh2qFOe29ZVBjKspGZbXHBYaQyhScDJeUXaacZkFXvm0rMjQcPtQLcVry
3jR9GEi97ASnvSg1xy/JxGcFdnxmMqpE1DyIP6D8u8NCiLis6T0JEFfyUH/Q3qw3
0g0RxE1pYjD2rCSsmQmHRg9ZebHRKXtPXmk6ZOlpvP1G+wvgQr1MqKkEV5bX26OE
CZ3fniPKjGaE1tgNhoph+Haldqi0oCisic7THi0ezBVGlG1+08MqemoQo8u1NJph
/9SoYr4ZCk7Ab8nxviN//8vWKkuxA98frnELst62tCn5mjxTuUfhoCDbviuao1LA
UKCUpJOyBpUIj/BfV2EIWUvnO1AOww==
=dcG8
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--


