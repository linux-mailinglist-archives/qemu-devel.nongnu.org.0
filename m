Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8123B5EB4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:07:31 +0200 (CEST)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqz4-0004xT-EA
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lxqxl-0003ZR-Rk
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lxqxj-0006DR-1H
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624885565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WvqZEtziUhVXeoYJQR1fRlZ3rIPH+XJ6zN8+QG9knZw=;
 b=NaHmH3VyaDt0cB6eNdWc980gxjFx+b5W/gf1l/hxoPXa3sRU4EuX4GormEA550iXAf8SX8
 UCaFEEB1LRyUXCyhrQogwjHFCC00xAUNBwQJJ79JTaOowzPIjMJDmDtc8ZRi/dahf56PlW
 lq9ZfWS3awmgqtRzFE5vqngYdtQr/Lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-agXbyUBtO_GC2cxtM-xhcA-1; Mon, 28 Jun 2021 09:06:03 -0400
X-MC-Unique: agXbyUBtO_GC2cxtM-xhcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 714C8800C78;
 Mon, 28 Jun 2021 13:06:02 +0000 (UTC)
Received: from localhost (ovpn-112-170.ams2.redhat.com [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C0AC5D6AD;
 Mon, 28 Jun 2021 13:06:01 +0000 (UTC)
Date: Mon, 28 Jun 2021 14:06:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/2] pc: acpi: revert back to 5.2 PCI slot enumeration
Message-ID: <YNnJOWdLZc97T73L@stefanha-x1.localdomain>
References: <20210624204229.998824-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210624204229.998824-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w0T/Xs+/8/aFwX+6"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, john.sucaet@ekinops.com, mst@redhat.com,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--w0T/Xs+/8/aFwX+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 04:42:26PM -0400, Igor Mammedov wrote:
> Commit b7f23f62e40 (pci: acpi: add _DSM method to PCI devices),
> regressed network interface naming for Linux guests in some cases.
> This reverts PCI slot enumeration to its state before 6.0.
> For details see 2/3 patch.
>=20
> Thanks Stefan for troubleshooting!
>=20
> Reported-by: john.sucaet@ekinops.com =20
> CC: stefanha@redhat.com
> CC: qemu-stable@nongnu.org
> CC: mst@redhat.com
> CC: marcel.apfelbaum@gmail.com
> CC: berrange@redhat.com
>=20
> Igor Mammedov (2):
>   tests: acpi: prepare for changing DSDT tables
>   acpi: pc: revert back to v5.2 PCI slot enumeration
>=20
>  tests/qtest/bios-tables-test-allowed-diff.h | 10 ++++++++++
>  hw/i386/acpi-build.c                        |  9 +++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.27.0
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--w0T/Xs+/8/aFwX+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDZyTkACgkQnKSrs4Gr
c8h28ggAoMFeVdPUvze6lIEYGSbdWw7EowNEW5lnpWPx1UcePiDcDwxkkXU5OBaq
568fl7mrd96Hd7bUeLcfH9f57CuXqqCgz7I1Ew5N0jqIytVvoygDaLELumBBX6DQ
M5CDxAtaQaYWwm+LlEddAr9Oh67MJgV+tcjaTFy5/2cHGzBT77SPXCn5DY2HTFDT
mjtpjimLCJcH0Q+Q8UMcVelP+RzZS/5ysweDNBRV8W/gNTiqS4Ep0qI92WwUKWAR
fwP5oKUN+6WJ5yt5CMxXTk7bhLJKQfLp3kk8yfFjuBMagLdlehj/RqAdCp5ZiOAl
YPl8NULuXHPwWEmxABtVXhVdWBRAkw==
=zYb1
-----END PGP SIGNATURE-----

--w0T/Xs+/8/aFwX+6--


