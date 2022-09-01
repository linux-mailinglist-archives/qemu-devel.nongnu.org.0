Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7D5AA0E5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 22:28:51 +0200 (CEST)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTqny-0005uO-Bz
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 16:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTqlS-0003Az-Sf
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oTqlR-0000GP-Bk
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662063972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xB+C7vxvO8AjTVloMttA64QuMOwIn8+meFfdqsqz8yo=;
 b=P71L90w4JMY09w8jkpPej93s+IZiJ0cd0zVL1CGa/RZPq36wRLQmpH+GbpYeGweMz0qNUm
 Jk0pdolwaKRwIxlssgKZUDBAbRXbSQ3afRCPlTd6J5W+x2HrDVpEBtN6wbqYp90QRGKr5l
 t/crrJHJ9TQNkltRNsVjYdbgdAW+wmw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-M2ItMx7hNPueONPg7rPkpg-1; Thu, 01 Sep 2022 16:26:08 -0400
X-MC-Unique: M2ItMx7hNPueONPg7rPkpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 795481C05147;
 Thu,  1 Sep 2022 20:26:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0C70C15BB3;
 Thu,  1 Sep 2022 20:26:07 +0000 (UTC)
Date: Thu, 1 Sep 2022 16:26:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, danielhb413@gmail.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org
Subject: Re: [PULL v2 00/60] ppc queue
Message-ID: <YxEVXeFomrDrLHOx@fedora>
References: <20220831202818.7630-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="husGFZElWeFGTzmZ"
Content-Disposition: inline
In-Reply-To: <20220831202818.7630-1-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--husGFZElWeFGTzmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--husGFZElWeFGTzmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMRFV0ACgkQnKSrs4Gr
c8jXuAf/eFfaV0lzZEQGPC0ojcwGzLASeA/XZlw0jtNShN3PEiQPhpXkzhGD88ge
8ij5MytCIiJ2c74OupoJrNhiIhEvj1mtDW2ZKVgl/YUo1neEwfwV9OwEfnFb9fEe
Yior3T2uk/yz1GF9fSQ1n9TUHpenXEvNEykAbxRt7VpwtTdrSK7WVZjX4ihhjx8Y
nvFsUZpsmhIRYWeg8QtYXbCHqt6g6ENtSmZg7nw80LIklfVgocau/spwFfxMSQiR
Xqh/hLJozBaBchrxiKQbSk9zO4T14FvozwkhpOZQG/dTRW1Fe3FaovTqoCoNA6Vr
J85OB+ajfIxSju8aY0Iz7/fFuvhFbw==
=fu5C
-----END PGP SIGNATURE-----

--husGFZElWeFGTzmZ--


