Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7EA624CF7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otF3V-0003Jp-SI; Thu, 10 Nov 2022 16:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otF3T-0003Iy-J0
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:25:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otF3R-0000Xb-MX
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668115543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=BRFzIBTwKBsrygTQfWiCPFt/A/uK9Yaa5VqjTEoY3fU=;
 b=VYG56fjpOzFTbGmqZuZiLvTGtdDY/xCTd3Pudn2LpeS5sdnwDOUHu2/KwdJt8aIMgOzxNb
 k4u/UMQ79OvOWibASIkFF0PKvwDoRG10GaYt1SU10zZVor2IElDpujUuOdiYwrfu8cshBY
 RgO8yptUqQxcInIdNUS/J4wgjJ5yTeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-I79hic_TPyOxX0Ld7bJchQ-1; Thu, 10 Nov 2022 16:25:39 -0500
X-MC-Unique: I79hic_TPyOxX0Ld7bJchQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F46F185A7AA;
 Thu, 10 Nov 2022 21:25:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E90811400C30;
 Thu, 10 Nov 2022 21:25:37 +0000 (UTC)
Date: Thu, 10 Nov 2022 16:25:36 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Is bdrv_poll_co() IO_CODE()?
Message-ID: <Y21sUJMNc/I8iCzg@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zq/Ap4cB2X1s+fmx"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--Zq/Ap4cB2X1s+fmx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
bdrv_coroutine_enter() is IO_CODE but is called from any coroutine
wrapper function. When there is an IOThread and main loop code calls a
coroutine wrapper function then I think bdrv_coroutine_enter() is called
=66rom outside IO_CODE?

Thanks,
Stefan

--Zq/Ap4cB2X1s+fmx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNtbE8ACgkQnKSrs4Gr
c8jeqwgAnzp0guwo/vi62Pfrcpx5qvZWiOxVgl9FtHZJ7JTsumFK0cwiRltVQVaZ
cVSe+8CxL8Jm76803RWBDnB6ZBIQzmCwoOoQtbsq1vljmmDXN8lwtPwW+NvUIz/I
VAIOPmzg/UeSuH6As5Nb2kQPJ+9QE2OkNsXktJCFA2dPpu3TH7160RP0raHXevMG
xk8BtaqBDebBUibHymsO0Sd0ak6K6KDK6EPt9zBSY6fVcYmBw7yI+C/iAkiWDP2f
1E01ZuVGMrmmBLOarLU7LgwCFnhT/tgFcJb64xzDP3bzDfS38gPqbHsSOpBuZVKB
klW5Vl0rPQkXHIQ/n6URb6QqEEDRJA==
=cfQ+
-----END PGP SIGNATURE-----

--Zq/Ap4cB2X1s+fmx--


