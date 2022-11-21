Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A76321EE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:28:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5th-0008MM-Uj; Mon, 21 Nov 2022 07:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1ox5tf-0008Kz-TO
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:27:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1ox5te-0000Ds-DJ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669033653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jIyed4V9IsIqKEyOfeiiPbWvlTBrGyFTdz62cwvHt5A=;
 b=S0ndpDzmHWPt7q0EKTLqt+kXqaJvfBisa2AhtSKocyajMWTf5UlKohYPjBGut2fAsfKdF1
 40lBY8GgtR2xMf2Jn5nA2zhReQqUZB/rcTxruOjRVMh51YzMqsXB34q0/vrE+E3gwZLz+O
 Yn3jZp0JmI3b5jE5rdeWGDLNQk6pCo8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-DlWDr741PPu4GbUq5Y0kKg-1; Mon, 21 Nov 2022 07:26:28 -0500
X-MC-Unique: DlWDr741PPu4GbUq5Y0kKg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C721C08787;
 Mon, 21 Nov 2022 12:26:28 +0000 (UTC)
Received: from fedora (unknown [10.43.2.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E0C492B16;
 Mon, 21 Nov 2022 12:26:27 +0000 (UTC)
Date: Mon, 21 Nov 2022 13:26:25 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 victortoso@redhat.com
Subject: Re: [PATCH 1/3] Revert "usbredir: avoid queuing hello packet on
 snapshot restore"
Message-ID: <Y3tucQ4YtMuMXkkC@fedora>
References: <20220813011031.3744-1-j@getutm.app>
 <20220813011031.3744-2-j@getutm.app>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JJitQgevw98T25s3"
Content-Disposition: inline
In-Reply-To: <20220813011031.3744-2-j@getutm.app>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jtomko@redhat.com;
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


--JJitQgevw98T25s3
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Friday in 2022, Joelle van Dyne wrote:
>Run state is also in RUN_STATE_PRELAUNCH while "-S" is used.
>
>This reverts commit 12d182898a4866e4be418e2abac286b497cfa1b2.
>
>Signed-off-by: Joelle van Dyne <j@getutm.app>
>---
> hw/usb/redirect.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)


Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

This fixes usb redirect on VM startup for VMs started by libvirt, which
uses -S:
https://bugzilla.redhat.com/show_bug.cgi?id=3D2144436

Jano

--JJitQgevw98T25s3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQT+Rn5j0qdK2hQgnuAU0rOr/y4PvAUCY3tubAAKCRAU0rOr/y4P
vI6GAQCn3bhzcdUryMYYpaYmrFLAImMBIEHhISuqPSi2Yh/FOAEAoMAgnTx+/eer
NuYN2ZzvQmUHBGVL1GyXoJ6rNpEBEAw=
=OblB
-----END PGP SIGNATURE-----

--JJitQgevw98T25s3--


