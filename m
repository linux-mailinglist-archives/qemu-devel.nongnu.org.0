Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E495ECC3D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 20:43:11 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odFXy-0002KA-OI
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 14:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odFVS-0007jv-2s
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odFVL-0004c8-5j
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664304020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zv8zmb4q3JJPI6aUbYK5OpCYnc38nHsNwZwgGQW/VJo=;
 b=SR1KzNmbPIUjWJjWwB+FYC1x2dcbRcJcxrTmxr9YWeVN/Ph58J1GDC1lTlmEvp0fe0iyWk
 YQzFGorYlVgm1BmmUsVFqxqzFfkdLb77CQvLvouBNUk+I6zudBIzj8firtod25CE3Mpssw
 GvOoHfkIMziRIashmQ03sL//05mwII8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-nV2VLUpsO52O334EP1e7iQ-1; Tue, 27 Sep 2022 14:40:16 -0400
X-MC-Unique: nV2VLUpsO52O334EP1e7iQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73027800186;
 Tue, 27 Sep 2022 18:40:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E46802027062;
 Tue, 27 Sep 2022 18:40:15 +0000 (UTC)
Date: Tue, 27 Sep 2022 14:40:14 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, stefanha@redhat.com,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PULL 0/8] Net patches
Message-ID: <YzNDjp8Put95/7JF@fedora>
References: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pJPUSFoY1PVEwO9t"
Content-Disposition: inline
In-Reply-To: <20220927073022.28378-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pJPUSFoY1PVEwO9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--pJPUSFoY1PVEwO9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMzQ44ACgkQnKSrs4Gr
c8hwQAgAxNz2XcdH3pIUlNX9sDJGTbEXgcTIcpoeMYtorB0mGmAQ5XrTtEwZXnjA
B+rBRFOZmrIIKE0nAWY/mox9q5d0FWTSTDTiCAyxZYQELlNOGv1tP2W+Gkregr7T
8FyIu3PdoShIa+OHCLOwXY9Lysavv04+8q/EQr1ZFKhl1cK4OKABxPTmimrwoFVH
g/2dEOhAiRncUSI1DImHX58gtLxnlosQRrVX53Q+Kn3949CC3n20+n1a2jujC1S/
6NFOtuZiasuzup9Zil0iejYFAOw5+sE+Z4FNUj1WlZjCnYVP2xxnt0216Y85gFsS
NUErVp9thZgbbnEoQqy/U5S6UHXh5A==
=4Rcr
-----END PGP SIGNATURE-----

--pJPUSFoY1PVEwO9t--


