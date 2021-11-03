Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4C4443EB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:53:15 +0100 (CET)
Received: from localhost ([::1]:42924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHdZ-0000aT-2K
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHa5-0004ge-6Q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miHa0-0003Vh-1B
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635950970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=msm+32gs3wSCPFnqR/rscbTqOPPJ3IithmPph92aNME=;
 b=QxY1wGCFI1tkR1bqaeZ2LgiQ//evoxSoOymC1riH8KjM5gs9bHHrGWZs+Y0N6BytY6B+f4
 ppDTeDpkvax6EEuX3aHWMzUQHKYIn4oxywNtLfaWQC0MUQYIEf4JB3zgsqNG/ymWq30l/E
 YRXBglw1aAlja1fNK8Lx/th+fCfljyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-bCWTRdeUPfKRSF8mguHLqw-1; Wed, 03 Nov 2021 10:49:22 -0400
X-MC-Unique: bCWTRdeUPfKRSF8mguHLqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D892B9F92B;
 Wed,  3 Nov 2021 14:49:15 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE0FD19741;
 Wed,  3 Nov 2021 14:48:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] tests/docker: Update Fedora containers
Date: Wed,  3 Nov 2021 10:48:38 -0400
Message-Id: <20211103144844.1285634-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fedora 33 will be EOL before 6.2 ships; Fedora 35 was just=0D
released. Update our various containers to test on F34 and F35.=0D
=0D
Fix a minor code warning issue that surfaces in a new version of Clang,=0D
and fix a small deprecation issue for the latest version of spice.=0D
=0D
In testing, I found that oss-fuzz was more likely to time out on GitLab;=0D
it's unclear if this is a performance regression or just getting unlucky=0D
with when I test.=0D
=0D
Summary:=0D
  fedora.docker updated to F34 and then F35=0D
  fedora34.docker copied from fedora.docker, new build test added=0D
  cross-compile targets bumped from F33 to F34=0D
=0D
John Snow (6):=0D
  spice: Update QXLInterface for spice >=3D 0.15.0=0D
  ui/clipboard: Don't use g_autoptr just to free a variable=0D
  docker: update fedora container to Fedora 34=0D
  docker: update Fedora-based cross-compiler containers to Fedora 34=0D
  docker: update 'python' dockerfile to use Fedora registry=0D
  docker: Add Fedora 35 container=0D
=0D
 include/ui/qemu-spice.h                       |   6 +=0D
 hw/display/qxl.c                              |  14 ++-=0D
 ui/clipboard.c                                |   3 +-=0D
 ui/spice-display.c                            |  11 ++=0D
 .gitlab-ci.d/buildtest.yml                    |  16 +++=0D
 .gitlab-ci.d/container-core.yml               |   5 +=0D
 .../dockerfiles/fedora-cris-cross.docker      |   2 +-=0D
 .../dockerfiles/fedora-win32-cross.docker     |   2 +-=0D
 .../dockerfiles/fedora-win64-cross.docker     |   2 +-=0D
 tests/docker/dockerfiles/fedora.docker        |   2 +-=0D
 tests/docker/dockerfiles/fedora34.docker      | 117 ++++++++++++++++++=0D
 tests/docker/dockerfiles/python.docker        |   2 +-=0D
 12 files changed, 175 insertions(+), 7 deletions(-)=0D
 create mode 100644 tests/docker/dockerfiles/fedora34.docker=0D
=0D
--=20=0D
2.31.1=0D
=0D


