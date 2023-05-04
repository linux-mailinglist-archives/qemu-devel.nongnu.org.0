Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09BA6F68C3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:58:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVi0-0002HH-P8; Thu, 04 May 2023 05:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVhy-0002H0-SW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVhx-00070o-3a
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683194224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aAJnSEFfRZvR8S0Dv7xPPSfeYqbWeMoVdYWFNxIwT3s=;
 b=ZA8KBATvvO+opvR41J5MomOZb554MsSAircNJT4dldXkxe91T1na37g/s4o3OUP25pqRUQ
 AWTwZz9otGn8IWw59cOckpS9JOAqENPwbobhWVBPlU+fQFmXJiIIMI8GEQJoVSgYQFMqcx
 06aDj+EikXbDgDfvjU00H+vDs7YKLk4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-T9mZ5HrjN_mD4pYEi5fhpg-1; Thu, 04 May 2023 05:57:00 -0400
X-MC-Unique: T9mZ5HrjN_mD4pYEi5fhpg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F008811E7E;
 Thu,  4 May 2023 09:57:00 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.225.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A650B492C13;
 Thu,  4 May 2023 09:56:59 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/6] Misc QGA patches
Date: Thu,  4 May 2023 12:56:51 +0300
Message-Id: <20230504095657.239048-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Kostiantyn Kostiuk <kostyanf14@live.com>


The following changes since commit 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a:

  Merge tag 'migration-20230428-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-03 10:29:30 +0100)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-pull-2023-05-04

for you to fetch changes up to 86dcb6ab9b603450eb6d896cdc95286de2c7d561:

  qga: Fix suspend on Linux guests without systemd (2023-05-04 09:30:01 +0000)

----------------------------------------------------------------
qga-pull-2023-05-04

----------------------------------------------------------------
Daniel Xu (3):
      qga: Refactor guest-exec capture-output to take enum
      qga: Add `merged` variant to GuestExecCaptureOutputMode
      qga: test: Add tests for `merged` flag

Kfir Manor (1):
      qga/linux: add usb support to guest-get-fsinfo

Mark Somerville (1):
      qga: Fix suspend on Linux guests without systemd

Thomas Huth (1):
      qga/commands-win32.c: Drop the check for _WIN32_WINNT >= 0x0601

 qga/commands-posix.c  |  18 +++---
 qga/commands-win32.c  |   2 -
 qga/commands.c        |  62 ++++++++++++++++++--
 qga/qapi-schema.json  |  36 +++++++++++-
 tests/unit/test-qga.c | 158 ++++++++++++++++++++++++++++++++++++++++++++------
 5 files changed, 244 insertions(+), 32 deletions(-)


--
2.25.1


