Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FEA4EF37D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:26:09 +0200 (CEST)
Received: from localhost ([::1]:44654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJA7-0003HV-UY
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:26:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7c-0000yq-6s
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7Y-0000qW-KB
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648826607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mBLb78cmgOJuG4Xr50xJE+HAkXIz/zo2QX5PltG2e7w=;
 b=jRz99/2WdS/ynDnx2BkmaG6jXcg7OPVh5zBGIgS0bLT8329XQBfvRt3jc8X9bBsIJj410o
 d5OHDlVp8AoShb+rN1lokMAJJa1PPrw+MYAlUFTkKdc0GXzxmOBo3REWfUW/sahuoTej0G
 y6SiushoYTn2sibjX6eASv1mw88aFE0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-L6zDnPG1N-64z_nuGrr1Uw-1; Fri, 01 Apr 2022 11:23:26 -0400
X-MC-Unique: L6zDnPG1N-64z_nuGrr1Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B66580005D;
 Fri,  1 Apr 2022 15:23:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B74802166B4E;
 Fri,  1 Apr 2022 15:23:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Misc fixes for 7.0
Date: Fri,  1 Apr 2022 17:23:17 +0200
Message-Id: <20220401152323.52519-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9b617b1bb4056e60b39be4c33be20c10928a6a5c:

  Merge tag 'trivial-branch-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-04-01 10:23:27 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-04-01

for you to fetch changes up to e32aaa5a19e24233180042f84a0235a209de71cc:

  trace: fix compilation with lttng-ust >= 2.13 (2022-04-01 13:06:07 +0200)

----------------------------------------------------------------
* Fix some compilation issues
* Fix overflow calculation in s390x emulation
* Update location of lockdown.yml in MAINTAINERS file

----------------------------------------------------------------
Bruno Haible (2):
      target/s390x: Fix determination of overflow condition code after addition
      target/s390x: Fix determination of overflow condition code after subtraction

Marc-André Lureau (1):
      trace: fix compilation with lttng-ust >= 2.13

Thomas Huth (1):
      meson.build: Fix dependency of page-vary-common.c to config-poison.h

Will Cohen (1):
      9p: move P9_XATTR_SIZE_MAX from 9p.h to 9p.c

Yonggang Luo (1):
      misc: Fixes MAINTAINERS's path .github/workflows/lockdown.yml

 meson.build                              |  6 +++---
 hw/9pfs/9p.h                             | 18 ------------------
 hw/9pfs/9p.c                             | 28 +++++++++++++++++++++++-----
 target/s390x/tcg/cc_helper.c             |  8 ++++----
 MAINTAINERS                              |  2 +-
 scripts/tracetool/format/ust_events_h.py |  4 ++--
 6 files changed, 33 insertions(+), 33 deletions(-)


