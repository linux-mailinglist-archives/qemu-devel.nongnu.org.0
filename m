Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5563D5EC3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:54:53 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82wO-0006B1-CM
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m82uX-0003fE-Br
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m82uU-0002re-0R
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627314772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1na1ObOSgMN/hDCCm8Al/er/jEks3B1X3LPopU74bkU=;
 b=Rc3uyShKyFw51lfbnQthl6csV/ulWN2D3rP6bwMMPxiFpQBqZwu7ES7sCOY7vRQKK5ok2p
 bLv478epqjhTl0TawceMbS7DOJSzwE+WLfH7Zfi95yokaSvvaHV1raiKVxPHr1Qh52z94W
 zt/brMVSexLtyzNBfQrO6w2iF7tY8Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-JQb6Tln_OHi98ZKvP6vJJg-1; Mon, 26 Jul 2021 11:52:49 -0400
X-MC-Unique: JQb6Tln_OHi98ZKvP6vJJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 104BDEC1A1;
 Mon, 26 Jul 2021 15:52:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EABD010016DB;
 Mon, 26 Jul 2021 15:52:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6525618003A4; Mon, 26 Jul 2021 17:52:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] build windows installers in ci
Date: Mon, 26 Jul 2021 17:52:32 +0200
Message-Id: <20210726155235.2249878-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With 8619b5ddb56f ("ci: build & store windows installer") merged at=0D
least patch 1/3 should go into 6.1 too so the installers created by=0D
CI do actually work.=0D
=0D
Patches 2+3 are for the guest agent installer.=0D
=0D
Gerd Hoffmann (3):=0D
  nsis.py: create dlldir automatically=0D
  ci: build & store guest agent msi=0D
  qemu-ga/msi: fix w32 libgcc name=0D
=0D
 scripts/nsis.py                               | 27 ++++++++++++++++---=0D
 .gitlab-ci.d/crossbuild-template.yml          |  3 ++-=0D
 .gitlab-ci.d/crossbuilds.yml                  |  2 ++=0D
 meson.build                                   |  1 +=0D
 qga/installer/qemu-ga.wxs                     |  2 +-=0D
 .../dockerfiles/fedora-win32-cross.docker     |  1 +=0D
 .../dockerfiles/fedora-win64-cross.docker     |  1 +=0D
 7 files changed, 31 insertions(+), 6 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


