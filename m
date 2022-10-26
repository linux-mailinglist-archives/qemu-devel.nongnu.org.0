Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0A60E2FA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 16:15:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onh6p-0006Hl-TD; Wed, 26 Oct 2022 10:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onh6o-00064Q-2f
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onh6l-0006Kn-H7
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666793408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=684qw3rbrzXYSfOulBJDdbRER53FcM8IzHiCMBuIvbs=;
 b=dvKDo3cBg/sZAt/XcwhqUwysQrFvV9iaghWZMDANPCYLvM0ds4rM5G5S2Cvlgvd8OBtNb5
 UP5YlQSDMAnTikxENfPdzRPbuH/NY1UulMC8J+2OBUl9xBwAAezEudQGOxSONloDOnbu0I
 8Pc2UzRfIXyDRa7ehjfPdEeKXSvkzcw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-E1OIvrDnOm2qFDZ0zAiqaA-1; Wed, 26 Oct 2022 10:10:05 -0400
X-MC-Unique: E1OIvrDnOm2qFDZ0zAiqaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4F1C3C0F434;
 Wed, 26 Oct 2022 14:10:01 +0000 (UTC)
Received: from localhost (unknown [10.39.195.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40BD320290A6;
 Wed, 26 Oct 2022 14:10:01 +0000 (UTC)
Date: Wed, 26 Oct 2022 10:01:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/8] Linux user for 7.2 patches
Message-ID: <Y1k9ns4U3CLwmST9@fedora>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yp1F9IUKNR34xiKV"
Content-Disposition: inline
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--yp1F9IUKNR34xiKV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--yp1F9IUKNR34xiKV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNZPZ4ACgkQnKSrs4Gr
c8jtVggAjUPBEmCPiYexfhjd0PECl0e2vLvU4M6P19LuQ+fACuHVr04Lz3+Mc1hJ
eSwgjHzNWzNOcBfHDejOHX+U+/otDdYGULtOsQRVTCdvY+Zb2OCPYmpmV9xe/Bfn
hYICQrdir7Ad0PdCVHXkabt+lXGC0j3au9MvPLwGSNGor0PmhVGE9I0c1X9FENvR
dPS/9ywlsQjU0zsmscSMO1BsNI9ovcCcM71xaDIpajdNBoGB1KAn2dtZQc8nTDfo
h8jV39LXRHZCCKE8OAybNJMi9ohJdxWUAW8vmCP1JYXPR7PCjJgfP2VNwu/u8o17
bv23auY/nPTnYxowivzBGKZ2XwNOUg==
=xQjk
-----END PGP SIGNATURE-----

--yp1F9IUKNR34xiKV--


