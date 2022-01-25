Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D58449B0C5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:55:37 +0100 (CET)
Received: from localhost ([::1]:37066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIY4-00022k-9N
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:55:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCILg-00083U-Rl
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCILZ-0006K2-Sf
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643103657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4TFFGBMDIIKg7qNHX2kJ6MVrW7E+V5J6mt7FYY8uSY=;
 b=QKM77XwrDVN/QAS4BU+vOMNAODFqwasvswM3NW6d1q1uXKcZHJmix5Z//MJd6SPHavxTWS
 aSuO0aEMwkukJN009+v4iT1JIXhuqNQZ77lkVw5qj90dPN4siB744uRqU62EXiqF689Q6d
 +rGoBGiCPGJwRcErXWLFUoZS1FUnugw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-r2UPA86zP5aoc2Gx83RJEA-1; Tue, 25 Jan 2022 04:40:53 -0500
X-MC-Unique: r2UPA86zP5aoc2Gx83RJEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E851853022;
 Tue, 25 Jan 2022 09:40:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9813F7B9E1;
 Tue, 25 Jan 2022 09:40:50 +0000 (UTC)
Date: Tue, 25 Jan 2022 09:40:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 02/18] tests/avocado: Specify target VM argument to
 helper routines
Message-ID: <Ye/FoYAKD4gW2AwJ@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <5ae7da5979b3f83bcf2ec620f5bbd7d4c15b5d80.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VnNT7/o9LJ2mQBnt"
Content-Disposition: inline
In-Reply-To: <5ae7da5979b3f83bcf2ec620f5bbd7d4c15b5d80.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VnNT7/o9LJ2mQBnt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:41:51PM -0500, Jagannathan Raman wrote:
> Specify target VM for exec_command and
> exec_command_and_wait_for_pattern routines
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--VnNT7/o9LJ2mQBnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHvxaEACgkQnKSrs4Gr
c8il4wf/dDip7xQtjQQAb0xv2XXeHWtW6Z2ko8NutgbgYofluKQZr4cxexCP7mpt
4ZAyDG7YAJBPhD3+6eaMWed512ZVEvm2fWOLlAAtCaKKK/GIz8e4yabnRi7X3Yzy
8GTbwdIZhnh/LvIrwpbShFQ5Y0l8bdciw4k8IvXlyqLsi9EscHHqMcVaxTmMSUJI
2jKaiPwprp4QhlWvBvBLSCDfu/2Rl1BVKhFE0lCBLKzU/xY1Yxkxj/WamINKd5s2
SzE16FYP2ZvL50/6ptKlmkVO0Me3cGNND6HqPEwoDAN4xmz5t7zZl+VzuHnTbQx8
Dgj5UaiDA/dXOYYcUQRlpb2A0Cyu8w==
=yxjD
-----END PGP SIGNATURE-----

--VnNT7/o9LJ2mQBnt--


