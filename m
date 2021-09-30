Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A341DC0A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:09:52 +0200 (CEST)
Received: from localhost ([::1]:59668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwkw-0001hp-CQ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mVwJ4-0006o0-AZ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:41:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mVwJ0-0003Hh-Kx
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633009257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=99weWqUAgTfWKdGXUKGT+C8JrcE0+rjcw1+1fyEMRv8=;
 b=R/Gx8RgCUN7Ic43gmQJDJeKd4GehZuu8V28rtn9iSTZ/TZWV3sNt0Hw5ZVamrbALAD657H
 J5lPu31Uv8d9vlIZS3x/ccEgifNdKudAzQaexbAVS0B1QJf2yp/moHlBgJyczflE8Me75G
 dkuyWRl21EvxmEV9BYuTwE5XVJ4AMx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-FQU21rKIOgKL8Hvb5pM4_w-1; Thu, 30 Sep 2021 09:40:55 -0400
X-MC-Unique: FQU21rKIOgKL8Hvb5pM4_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6CB10144E0;
 Thu, 30 Sep 2021 13:40:53 +0000 (UTC)
Received: from localhost (unknown [10.39.195.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 608605D6D5;
 Thu, 30 Sep 2021 13:40:53 +0000 (UTC)
Date: Thu, 30 Sep 2021 14:40:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: michael.roth@amd.com
Subject: Moving QEMU downloads to GitLab Releases?
Message-ID: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="04NYIUabMPt5kNHt"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--04NYIUabMPt5kNHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,
QEMU downloads are currently hosted on qemu.org's Apache web server.
Paolo and I were discussing ways to reduce qemu.org network traffic to
save money and eventually turn off the qemu.org server since there is no
full-time sysadmin for it. I'd like to discuss moving QEMU downloads to
GitLab Releases.

Since you create and sign QEMU releases I wanted to see what you think
about the idea. GitLab Releases has two ways of creating release assets:
archiving a git tree and attaching arbitrary binaries. The
scripts/make-release script fetches submodules and generates version
files, so it may be necessary to treat QEMU tarballs as arbitrary
binaries instead of simply letting GitLab create git tree archives:
https://docs.gitlab.com/ee/user/project/releases/#use-a-generic-package-for-attaching-binaries

Releases can be uploaded via the GitLab API from your local machine or
deployed as a GitLab CI job. Uploading from your local machine would be
the closest to the current workflow.

In the long term we could have a CI job that automatically publishes
QEMU releases when a new qemu.git tag is pushed. The release process
could be fully automated so that manual steps are no longer necessary,
although we'd have to trust GitLab with QEMU GPG signing keys.

What do you think?

Stefan

--04NYIUabMPt5kNHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFVvmQACgkQnKSrs4Gr
c8hQ4Af/SDI0HIEbvoqD/WUOsv+s1LClXKGDHxiyKEzgScsUh19cBnnOTaAM2VN1
IFZB08s2BWxMzyW30oYwFrqFf2B2gLr8oiVi1NT8/kQ6rwTeHsrrk+rPxWxTcRLF
E8CJ/PwJyOorteFolTiKT2daZlQ3wZXFNVSlg+D9cxXdtKRrazihzIa7tdnm12lp
mDogtOm+oajpWiljubkUa5B0/zePoo+62yii+qh1jLRJVkQiYf+0134ofsXXPrq7
9FUo0EeggGsYOVOGHAXh4WOk2RKyVsPO6D6r+qvqN7V0VPyfPvthFqchymOqiEoJ
U1bZaGSdfQ/xnXaY07WGDeVcqkhFmQ==
=att1
-----END PGP SIGNATURE-----

--04NYIUabMPt5kNHt--


