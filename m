Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3D5ECC50
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 20:44:42 +0200 (CEST)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odFZR-0003pY-QZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 14:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odFVT-0007ln-Et
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1odFVR-0004ct-R2
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664304032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hy/mBMCDTc7y+Hc4KLHcQGh1ZLd0GnK/0g+vUraWQVI=;
 b=KCeKAxMjfdxzqmL0BbAyT0yeOQRUgrF8vhI4ZRA/FVMHkFL4iy3S4WdFX4GW/L+TFJntbr
 TZiDOvADo7xPIEr20rjVbStq7D5fQQ84h4YHbCKkyjkXjuNlx2j3BfFDyCMXucMPL3D4Sn
 aT7m+imh2FRCipjSvZSu04BTPYh+MbE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-1Lq6m4qrNb6URwLhx8yJYw-1; Tue, 27 Sep 2022 14:40:28 -0400
X-MC-Unique: 1Lq6m4qrNb6URwLhx8yJYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BA3D185A78F;
 Tue, 27 Sep 2022 18:40:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB4F31402BDB;
 Tue, 27 Sep 2022 18:40:27 +0000 (UTC)
Date: Tue, 27 Sep 2022 14:40:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PULL 00/14] s390x patches and slirp submodule removal
Message-ID: <YzNDmlMbGDZ1cBjL@fedora>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VdHLfBKiYSreY5FA"
Content-Disposition: inline
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


--VdHLfBKiYSreY5FA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--VdHLfBKiYSreY5FA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMzQ5oACgkQnKSrs4Gr
c8gDLggAi+T+0ztao+yq2RVLTGoKqR0Y0R6VGNAxX8nvg6NN0P60MyhrMHiDTuhf
GYk/33fXKayuCFLWuDZc2+in5C0dZQ/94xukgFIcPOc883h2SiUwz2lfkS6tqAtj
QyszmoyYRM2LaMFJATsfXQLB1Se5pABz1Xu/TmyeRVVT0Ztsgb31sLuw8hhfN90e
/J+DQnrK/v5p9cXtgvyPNBmsI/zgIOF6NfLWDdpiycjK608zaIx+7N+zJg5WH6Ts
+VkCOyb48YBSqYJtMo8S64Bh37pd8dCJf7vgDFVQqy2faqikmlCZ5hdPfQYQTntP
gxjTWifMdBxOL0BOY7/XWzuz/OVpog==
=gPaO
-----END PGP SIGNATURE-----

--VdHLfBKiYSreY5FA--


