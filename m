Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EBE2C5707
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 15:24:29 +0100 (CET)
Received: from localhost ([::1]:36484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiICC-0006Al-Qv
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 09:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAH-0004WC-4X
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAD-0005mj-0d
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606400543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h5ROIBYB6eKLXY4zShSMAzpTSYTH7Ph1hUnnK7WWPC0=;
 b=hS5YRyNcqCWjirzP+vSu2fnDvXYeoU4OfKvMSy/q59ESm8+rrE0uiOAusGVijU7u5QySgo
 tNudJQfzBgmdDfhCAiButSYtOOE8CtostWg9wq22R0iCrkluu+v0XClO+QodaAEq13Ez9M
 sL2Gbw/QtxiDaa9i/TvG4/VW2ZIDKT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-p1TnDX6dMaKZ-LBj-DTHjw-1; Thu, 26 Nov 2020 09:22:20 -0500
X-MC-Unique: p1TnDX6dMaKZ-LBj-DTHjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7988156C33
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 14:22:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45DE810021B3
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 14:22:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/4] Final (?) batch of misc patches for QEMU 5.2
Date: Thu, 26 Nov 2020 09:22:14 -0500
Message-Id: <20201126142218.3121595-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 24bdcc9608fad3dce2bcf3362722493f1ba0f3eb:

  nsis: Fix build for 64 bit installer (2020-11-26 09:20:48 -0500)

v1->v2: dropped i386 patch

----------------------------------------------------------------
Remove obsolete setuptools dependency and fix Stefan's
Win32 builds.

----------------------------------------------------------------
Olaf Hering (1):
      configure: remove python pkg_resources check

Paolo Bonzini (2):
      meson: use dependency() to find libjpeg
      tests/docker, tests/vm: remove setuptools from images

Stefan Weil (1):
      nsis: Fix build for 64 bit installer

 .cirrus.yml                                        | 1 -
 configure                                          | 3 ---
 meson.build                                        | 7 +++----
 tests/docker/dockerfiles/debian10.docker           | 1 -
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 -
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 -
 tests/vm/freebsd                                   | 1 -
 tests/vm/haiku.x86_64                              | 1 -
 tests/vm/netbsd                                    | 1 -
 tests/vm/openbsd                                   | 1 -
 10 files changed, 3 insertions(+), 15 deletions(-)
-- 
2.26.2


