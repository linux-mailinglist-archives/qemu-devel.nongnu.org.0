Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986864209C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 00:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1ykT-0001tf-Gu; Sun, 04 Dec 2022 18:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1ykM-0001sm-Tt
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:50:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p1ykK-0001lK-Uk
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 18:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670197808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjlngK3gmu3UgRQXfp/JcjuZtaAiobAMBhWPxRDkb/I=;
 b=dvYzs7kcCmOFNncG3wjudjI4mKCHmQ9JfBRuTKQvD5k2jhfBBXTaSI4rWVHfOOcBMnOhV7
 yV0cZJcSJ4cMSh7ZJEI1PpmzZf57ZgQ+Cbiudp+GDrp981jPegHFAGJcFvbM8ZLavLQpq9
 rfGZatZz619enC1D7/1I7VYB+RIHSD4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-J8AYi1N3OGCXpc9ikZxhGw-1; Sun, 04 Dec 2022 18:50:03 -0500
X-MC-Unique: J8AYi1N3OGCXpc9ikZxhGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84CA685A588;
 Sun,  4 Dec 2022 23:50:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16EFB140EBF3;
 Sun,  4 Dec 2022 23:50:02 +0000 (UTC)
Date: Sun, 4 Dec 2022 18:47:00 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
Message-ID: <Y40xdEL14Tbw0B/2@fedora>
References: <20221202102550.4107344-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VdNXhegYDy5MV65g"
Content-Disposition: inline
In-Reply-To: <20221202102550.4107344-1-gaosong@loongson.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--VdNXhegYDy5MV65g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--VdNXhegYDy5MV65g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmONMXQACgkQnKSrs4Gr
c8jZnAf9Eld6IyHRPcVkCZC3/E8fkyjyGAY4LHNbGSwWW6bJA0TF9l+E3kATVu3v
JBByaax0vNP1ALNOOL4L0yrh3Ek19jNqTUlAUmZKUPNZtpypUnDBIygTbtd63A6F
aD4HRAFGjOAhlKWPoukPCP76Lp3+4JchDChrA/khXHNTT9uktafui3dt13+qIfnY
gV+R88Ow7pIz0QMbETljQ8yLYFTFPWn7Skz6jguF1sXH07FQ9Acpeei5E6AhDFbQ
X7fm6C7vOjertR08e5EUGCBWtBg3mhqIvxfbEJ2WNBUSVmfW0dxIygu8i8kSPtNb
GTc8E3yQTLloaEpYxchjRUw0zvLQ5g==
=1oth
-----END PGP SIGNATURE-----

--VdNXhegYDy5MV65g--


