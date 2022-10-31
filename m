Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B51B613783
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:11:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUV2-000153-Ie; Mon, 31 Oct 2022 09:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTX-00088p-Bx
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opUTV-0007iF-Rg
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=KJNdc/JzlCr2GNbG9p1BGdaFKxGf2++5k1HnnhzszpY=;
 b=d6yr+Tna2cMMo1IWThErUrxo5fur4d0Mwipt/JfeiZMAZEmAPvbjCDnKYwOO8HtSVf0Bk0
 cTYtBY+65Ok8/Tge9aV8pC781FDc5JbBAsaXyhW1dCAcaDSVQvNS8O1utqhoSfNUGXtunm
 zXQt6NlRLfKZyPcJWtcfqhc2x/LBrks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-nZMPcjaPNDKzDMUSAjqY0A-1; Mon, 31 Oct 2022 09:05:07 -0400
X-MC-Unique: nZMPcjaPNDKzDMUSAjqY0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0007D1012462
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:05:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8661AC2C8C7;
 Mon, 31 Oct 2022 13:05:06 +0000 (UTC)
Date: Mon, 31 Oct 2022 06:13:04 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/20] Crypto and I/O patches
Message-ID: <Y1+fsGoBhpXZCtPB@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sLuYTfGIglxijXty"
Content-Disposition: inline
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--sLuYTfGIglxijXty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--sLuYTfGIglxijXty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNfn7AACgkQnKSrs4Gr
c8hIPwf/awLyMMp6/pW1ASuzfXDV5z0tn9KXFvDPFj20dm1OfHWu9S38WyejZ1/v
CJvlLn+9uulysHAdu5sFtRY647UnU8Tg9otUi44k/l7n+MW+6OFew5Cx9jrdKZMI
mE3QlqUbqOE9o2owsZG8B8T0ts3DpbK+1Sp+3mFXI4Z0SBaArsNY2wOS4LxA2hv9
Evtt7z4UFAttrJ8A1cEP621CtLpxynN6WpWHjc0F4iACS2aPl/8EaI6t2UnEVkzC
2NrsKRy8RFiBbP96bdflIYv3qrI0yzlZ31K2ehHoR9OMDBLXjLLlCRGBeOhcMr8j
KwR9aQvNg5DMqgdg4+DP+ThNFrF0KQ==
=BAWd
-----END PGP SIGNATURE-----

--sLuYTfGIglxijXty--


