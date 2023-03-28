Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D76CC724
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 17:53:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBbT-0002Y0-Gq; Tue, 28 Mar 2023 11:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1phBb9-0002V9-CW
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1phBb7-0001A7-SS
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680018656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=KIIgTfUmYMsN3oXMtChNBA5eClLg3Q7WA81b0n5l5Pw=;
 b=VGF45QNMP0rbZNHHzMfr3stBCUN8na2EKT/JOc+vyGuAH+auCp+kR4O6Q15F66OzFsCZB5
 a5sBR24XXSxICtxFC5R+wSFay227VVgl8yJZraFtBeOmz0hVmolqmv/7HMG0wtfHgepzVc
 1UCzHp62bh0Qj3sFSm3yT3e8JieiIRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ptMjq_0MNDmTmHeDsMdvjw-1; Tue, 28 Mar 2023 11:50:52 -0400
X-MC-Unique: ptMjq_0MNDmTmHeDsMdvjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 213A53C0C887;
 Tue, 28 Mar 2023 15:50:52 +0000 (UTC)
Received: from localhost (unknown [10.39.195.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D65FD6E;
 Tue, 28 Mar 2023 15:50:51 +0000 (UTC)
Date: Tue, 28 Mar 2023 11:50:50 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <pdurrant@amazon.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: aio_set_event_notifier(is_external=true) in Xen code?
Message-ID: <20230328155050.GA1632689@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f6gUQ4S3t7TEC8fk"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--f6gUQ4S3t7TEC8fk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
I'm removing the aio_disable_external() API from QEMU and noticed that
Xen code calls aio_set_fd_handler(is_external=true) in hw/xen/xen-bus.c
and hw/i386/kvm/xen_xenstore.c.

It wasn't clear to me whether is_external=true is necessary here.
is_external=true is mainly used to temporarily pause I/O submission in
the QEMU block layer. Maybe is_external=true was chosen out of caution
but actually has no effect in this code.

Does the Xen code rely on is_external=true?

Thanks,
Stefan

--f6gUQ4S3t7TEC8fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQjDNoACgkQnKSrs4Gr
c8gNXQf/fC953Xa1eKe14eIys5OzTGEsPivI5xy7/TYPOKSPtMr4XBse/JW2wme+
eh+lzPx8kZnzSkAT+uvvNPeCAQZ7f1a5z/P2WRRPaRqSAY5NSFKpJuq0c/1xtgo8
vgDZLaXY7+KTFupgX1Auo32Zw/nBBv3PxvMSM2B+wIdpBASDGN8qz+hv0nugGJQB
RmixWUuotWdnwz7Jz95TPZkgIw0D4EtSkT6hVJqgca4nWocU+7gFcp1xqdPSkBA9
gZYhvIMmVV2cmgtGN/B6s9HEiz0J87Z27XLwWJP6t9Y81TOciHmItbMtiOYUs0gN
pNu8/Pb51ruCv+XpeN4Z0XBfuCj/Dg==
=HkeW
-----END PGP SIGNATURE-----

--f6gUQ4S3t7TEC8fk--


