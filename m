Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7FD5ADBEE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 01:44:18 +0200 (CEST)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVLlI-00080x-Qp
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 19:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVLiV-000623-Be
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 19:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oVLiR-0006nw-ND
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 19:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662421278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFfKWgywJFbioeLAhuiHEair9Ne9S1P0+6xTQAPQaR8=;
 b=D0gfe0IG1En6zwznYcY99hHIZRSl9zZ+3F+jiV9RBeReKO0CcbFRm/GFfO/cT477DwEcbz
 fBUG4evbMyvPfKUs8TeJ4kctEuvCXb8yCpTBEwjP+22pYrFCI9GMBruW7e/JucYzlcFZ1L
 pJQ9rBYKOkq2tb6misIqJvNEpD3ztfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-yQk96nNAMoegP9S3tesI_A-1; Mon, 05 Sep 2022 19:41:17 -0400
X-MC-Unique: yQk96nNAMoegP9S3tesI_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A307138041C0;
 Mon,  5 Sep 2022 23:41:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 226FB1415137;
 Mon,  5 Sep 2022 23:41:15 +0000 (UTC)
Date: Mon, 5 Sep 2022 19:40:42 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stafford Horne <shorne@gmail.com>
Cc: qemu-devel@nongnu.org, openrisc@lists.librecores.org,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PULL 00/11] OpenRISC updates for 7.2.0
Message-ID: <YxaI+n/mn3yw5prq@fedora>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WLtjUio9Vs+QpEBQ"
Content-Disposition: inline
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WLtjUio9Vs+QpEBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--WLtjUio9Vs+QpEBQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMWiPoACgkQnKSrs4Gr
c8ig6Af/RIfNBXrarBvWj6BRP+y3U9YMpzlme9olxdRmsf2XkmWCxTqSfw3QzWIk
bwaREHU9fdLTKEuDyi5sFnDNrfWVU5TRacYnxUJUmr964YPvRUwR4j6HBf6Nh4yu
kWNBOmSlLgaTE7T0T6IjkBSC871Ym20lvqXHxQuigzYZd85qZ7kdC+SWBb3fDbn9
uFd0sdudr+WKi/2LNZT0JE+ge2lF59SqR2HogHo1NbMxHGAJlip+eYYRmgEt7Pnj
6k6b9E5FCVakaxdhoyI5fWcfAU5Rr1k3LL0co9HS15Jjrc5PBAbegB/DOb6l3zVl
yB2zguFftcYjsj2CsuIz/bVuS2NmvQ==
=WV2Q
-----END PGP SIGNATURE-----

--WLtjUio9Vs+QpEBQ--


