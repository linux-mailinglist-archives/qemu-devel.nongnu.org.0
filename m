Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8056FC924
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:36:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwORx-0003g0-BC; Tue, 09 May 2023 10:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwORv-0003fJ-IE
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:36:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwORu-0007qr-47
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683642977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydSeuxOEhw3c5GtECk2kWyzzk8Ismc+GzU//pjwbHLo=;
 b=haXcCloK2j6kJqxMAQyfmp2NBd/6mLmXD83S5aaePA+0A2GTUFe5QnHkg6v6fAJd1xLdkp
 msyj0wVLed9Stu5igXqxIQwvJOO4sODTTrTHl6l8Icar+ycM9BN1tNVnyJGrkmzUGNwMIt
 DaFa8FvdxY3kDXQhiLcpp5WdmgJl/os=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-mhAx5Sj3NseGNrcpyMo2xA-1; Tue, 09 May 2023 10:36:14 -0400
X-MC-Unique: mhAx5Sj3NseGNrcpyMo2xA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5FC184AF42;
 Tue,  9 May 2023 14:36:02 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF302166B26;
 Tue,  9 May 2023 14:36:01 +0000 (UTC)
Date: Tue, 9 May 2023 10:36:00 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 03/12] simpletrace: changed naming of edict and
 idtoname to improve readability
Message-ID: <20230509143600.GF1008478@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-4-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GygqQyEs0Ip04nAi"
Content-Disposition: inline
In-Reply-To: <20230502092339.27341-4-mads@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--GygqQyEs0Ip04nAi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 11:23:30AM +0200, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> Readability is subjective, but I've expanded the naming of the variables
> and arguments, to help with understanding for new eyes on the code.
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>  scripts/simpletrace.py | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GygqQyEs0Ip04nAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaWlAACgkQnKSrs4Gr
c8gw9wf/Ukcqre+oMI6RuzzVy8S/Qv12jgW/euncittn+aUoZyZlNpxksyK1GDRu
es7KYOvRj37aAx7C1l7tyaoFaDiI7nmA0jVLxRWrTvi/hDcg7OAdC8+hmW+mYaqS
HRxc+W4UJThiAOcecnt3cVaNkHeRgSdowA1CZLX+lwyXxtLV2V5Znj53iEq+bcDH
FXee4wQ4/GM3gPF08XLHGBR1Vzcxh3QG+NYkHnZo+6XKbT7v4Lu/rG2wo5pi8THj
hfp4pdTlgIRl/Oaqc1s2uCoImfxLhEMiPJKp4GcGNypYVv5o3uVMEUjWb4MjMg2s
LaJvX51cJ17oit0S9QitJ51n6Yj0/A==
=mTzk
-----END PGP SIGNATURE-----

--GygqQyEs0Ip04nAi--


