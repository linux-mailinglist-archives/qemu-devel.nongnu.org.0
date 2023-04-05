Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26846D8781
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 21:58:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk9Fp-0001aG-7P; Wed, 05 Apr 2023 15:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk9Fh-0001Yh-2T
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk9Fe-0005PD-UJ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680724621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rfXJHCzdtI9vrh74BrZUIzJrzFoqWYPsfco+7CESfpM=;
 b=WsSJt8bTk0VZFpUf4GNm0JpCS8NXJleCQWfMvp75HBW0/9e+wFLqG+SDyB/7q5XZN2Fkj0
 zJj4CghmTQ2HM8acTLX7maPYZf+XHk57U76SNi5FXzYfimeJFoj0TOHszrciWeBDPZNFDw
 YYjM6DWnBz+QdmRNlXcOmTHANvr1CjU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-E5t3Hu94N8ahW7PikFNJ0Q-1; Wed, 05 Apr 2023 15:56:59 -0400
X-MC-Unique: E5t3Hu94N8ahW7PikFNJ0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49C0F3C0D1A7;
 Wed,  5 Apr 2023 19:56:59 +0000 (UTC)
Received: from localhost (unknown [10.39.194.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A294CC158BA;
 Wed,  5 Apr 2023 19:56:58 +0000 (UTC)
Date: Wed, 5 Apr 2023 15:56:56 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH-for-8.1] block/dmg: Declare a type definition for DMG
 uncompress function
Message-ID: <20230405195656.GA679142@fedora>
References: <20230320152610.32052-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cV5UHNRVckcL+zSy"
Content-Disposition: inline
In-Reply-To: <20230320152610.32052-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--cV5UHNRVckcL+zSy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 04:26:10PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Introduce the BdrvDmgUncompressFunc type defintion. To emphasis
> dmg_uncompress_bz2 and dmg_uncompress_lzfse are pointer to functions,
> declare them using this new typedef.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
> ---
>  block/dmg.h | 8 ++++----
>  block/dmg.c | 7 ++-----
>  2 files changed, 6 insertions(+), 9 deletions(-)

Sorry for the delay, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--cV5UHNRVckcL+zSy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQt0ogACgkQnKSrs4Gr
c8j05Af9GCUj8XxeWtqHGRCN3nmyS37IL+N+GkFbX2YHCfsO8ivAm+zApXeEyGzF
AcYxEOijVVptX7TBfEm+dYTNgRC48zZyGDlkxMuHJuiPxBPvMMbN0RhEosqheXIC
stKWwbM7K6+1AMHG54qMO0x+QZ7wl3JCWrFmvMSqeT7F4RScZEuS/9pZUXp664dT
2WXQnN48KhYi1bi7r6ldldIZvycL5HBLFMPwcXXLFX3XaAkyYxiy5aDZaBtgLAwj
JKiMoRUzAIxrxero+G0XJVRxLnNpVRyyBQwCV/aSY17sS6rOP1yv4u0/3DiDMfIv
jgtYxU9eq6j+ROC20p8fwG/BDPKDpQ==
=9pJ+
-----END PGP SIGNATURE-----

--cV5UHNRVckcL+zSy--


