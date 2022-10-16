Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909C6003EB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 00:24:44 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okC3n-0006dn-3W
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 18:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1okBtQ-0000nz-GW
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1okBtN-00082q-Ih
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 18:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665958435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MesaVx7h2h5SLoQTh0KXqKxVOdVsHiL1Beoz/Z01Izk=;
 b=CeRyf5jzZCvymZjpvPVW9adJlcyl/r8moljFDiR6lr6ec6s92ftYmgRu3uN/WIUe7HRLka
 4S0/ZTWN31THDmDOtT7zS8+kSKjDUfQRa1i6hGjRrM3ajBbqkT6vBemGdkUN3XT5iJrikm
 F0Xwn6URjVwq16qpInuFD/D2BN2sZgA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-p4M0rn_lMQe-GL1U_A1N3w-1; Sun, 16 Oct 2022 18:13:53 -0400
X-MC-Unique: p4M0rn_lMQe-GL1U_A1N3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 554F6185A7AD;
 Sun, 16 Oct 2022 22:13:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2BFA2166B26;
 Sun, 16 Oct 2022 22:13:49 +0000 (UTC)
Date: Sun, 16 Oct 2022 17:52:23 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PULL 00/10] riscv-to-apply queue
Message-ID: <Y0x9F0oIr1IxgjYg@fedora>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zdkFkj933tYmKky1"
Content-Disposition: inline
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zdkFkj933tYmKky1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--zdkFkj933tYmKky1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNMfRcACgkQnKSrs4Gr
c8gk5Af/RAwx+QQlo5yVCiX7+EoqiElVQC1jvjbMUpJpOr4Pl9EoDFxdip1FRmyp
czNvjLttVMncN9kOy6nJbzqlPpKU+VmCi+Ytt4ie/iqeEsdfajsmBGyJmdA3Bzuz
y29CAvNqpZT/ZLlXOSvtZFkIBCvAqXk9NDjdrpYqwRt82T3LkNRQz/032OPR445E
UL+HEjv+3+nQBQHw+UFDChJw0RJ40vBIY005WylHBXrTi/iviasiE72MP3hDajJo
Ezi2xjxKwOHXm2Y47neBtX0w4laKOnfaDgGxoAqbsF/olJxKlZrJyOdyR8Z0BUr3
V1CngECu7gXqSAJFuUGhyM8ywKqZxw==
=x/zA
-----END PGP SIGNATURE-----

--zdkFkj933tYmKky1--


