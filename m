Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E590228010
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 14:37:44 +0200 (CEST)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxrWh-000866-8k
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 08:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jxrTR-0002H0-4y
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:34:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41157
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jxrTP-0003gn-4g
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 08:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595334858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eq5j8HsHr4Y+WwK8l2O7GM8djP6l3T3JDiPoHiQZXxU=;
 b=AIPYAyqPrQC14fiMUH/QM8HDR3TaOR445KvFmMc62J6jJ5hzkpDtay7Oj4jX5NGvDfH+ym
 zWr9oDx/mXUM59nshy6rukKDGCqXuwKzxQJ1B9+L89MwHcmRuNDRhYAhqGR7US3nujefDM
 UCFoKFpBuqWKSVYRTIqn0FerT+kNNPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-xCMD_hJFOS2bSF8HsUqiGQ-1; Tue, 21 Jul 2020 08:34:12 -0400
X-MC-Unique: xCMD_hJFOS2bSF8HsUqiGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F1F818FF667;
 Tue, 21 Jul 2020 12:34:11 +0000 (UTC)
Received: from localhost (ovpn-114-133.ams2.redhat.com [10.36.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9577F72688;
 Tue, 21 Jul 2020 12:34:10 +0000 (UTC)
Date: Tue, 21 Jul 2020 13:34:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2 3/4] build: Don't make object files for dtrace on macOS
Message-ID: <20200721123405.GD183198@stefanha-x1.localdomain>
References: <20200717093517.73397-1-r.bolshakov@yadro.com>
 <20200717093517.73397-4-r.bolshakov@yadro.com>
MIME-Version: 1.0
In-Reply-To: <20200717093517.73397-4-r.bolshakov@yadro.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 01:46:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 12:35:16PM +0300, Roman Bolshakov wrote:
> dtrace on macOS uses unresolved symbols with a special prefix to define
> probes [1], only headers should be generated for USDT (dtrace(1)). But
> it doesn't support backwards compatible no-op -G flag [2] and implicit
> build rules fail.
>=20
> 1. https://markmail.org/message/6grq2ygr5nwdwsnb
> 2. https://markmail.org/message/5xrxt2w5m42nojkz
>=20
> Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> Cc: Cameron Esfahani <dirty@apple.com>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  Makefile.objs | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8W4L0ACgkQnKSrs4Gr
c8ji2Qf/YOaeVTFm1EU0T1SDysohJ6SbGr8Ux61dHVpICD9qj5vuy29Audvm/s9H
hQ+O/Brt9UG5cm0T+MWXyg5rBPwdW/uwQDRrIp+TVF5jah/dT440vtDe3zJvBbJ8
jwx0LELMuIYLDz/I34CGCB+C+wxh+WR3oM2M56iDrZCRSv1tx+IUEo3MGG/PZCF+
lw4SdDWEeS967gCUOTPYsQLvzgZmJ7/og4UqaZ5rLaF4E4TobJP92WXTwGOsy8t4
q/i3QVKbh+hi1r5TUOaLsFR8qrGVcVEadClN78G2cL3ZCHBCI/wGGEtP5M/Q0Zg2
9ERVSBf978zdBtzcmVzQVO9V/IWo7g==
=XjV5
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--


