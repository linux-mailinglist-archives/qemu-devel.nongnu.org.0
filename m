Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6372394DC8
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 20:57:13 +0200 (CEST)
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln492-0004TH-B3
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 14:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ln47Y-0003B2-8t
 for qemu-devel@nongnu.org; Sat, 29 May 2021 14:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ln47V-0005SG-C1
 for qemu-devel@nongnu.org; Sat, 29 May 2021 14:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622314535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I3ihdkke5m23K6ACdCag/2Lq9Ve3RqmiKqAspnqUSZ8=;
 b=LRvt/f9KEkLnHanr29e/PIHC/1rCWARWTuWDynuW4s5PuFrwGTHzv+Fc/ym9oiOr52wUke
 CNRPQ20Cdm9cjn3juzeifN51fquWRcQom+jvIR712p3yhFmCSnM/dgoZM53srlqU9XsId7
 KU8PrNejCcZy1K4rMt7Vkrw7c2GmdBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-ksQ_AkxgMpm5Qmz1S2vhFw-1; Sat, 29 May 2021 14:55:31 -0400
X-MC-Unique: ksQ_AkxgMpm5Qmz1S2vhFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 361D5801B14;
 Sat, 29 May 2021 18:55:30 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69ED663B8C;
 Sat, 29 May 2021 18:55:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/2] Libslirp patches
Date: Sat, 29 May 2021 22:55:20 +0400
Message-Id: <20210529185522.78816-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: samuel.thibault@ens-lyon.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 62c0ac5041e9130b041adfa13a41583d3c3ddd24=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210526' =
into staging (2021-05-28 16:25:21 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@github.com:elmarco/qemu.git tags/libslirp-pull-request=0D
=0D
for you to fetch changes up to b060428091c758781acc4d42849accc036d3c816:=0D
=0D
  build-sys: make libslirp a meson subproject (2021-05-29 22:52:37 +0400)=
=0D
=0D
----------------------------------------------------------------=0D
Update libslirp & make it a subproject=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  Update libslirp to v4.5.0=0D
  build-sys: make libslirp a meson subproject=0D
=0D
 configure            |  2 +-=0D
 meson.build          | 63 +++-----------------------------------------=0D
 .gitmodules          |  4 +--=0D
 slirp                |  1 -=0D
 subprojects/libslirp |  1 +=0D
 5 files changed, 8 insertions(+), 63 deletions(-)=0D
 delete mode 160000 slirp=0D
 create mode 160000 subprojects/libslirp=0D
=0D
--=20=0D
2.29.0=0D
=0D


