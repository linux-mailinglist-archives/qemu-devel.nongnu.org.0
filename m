Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD172AF40F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:50:55 +0100 (CET)
Received: from localhost ([::1]:60024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrSX-00030l-4u
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcrRe-0002WC-HE
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcrRb-0001su-BJ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yNNNdlK0nYMRw4WQmQ2oy9Qi8osH6OcsLF045mFaHJ0=;
 b=HplhFDEITtcoIlYwVQ1gE0LWuBs0Uj+O5yRhBnsoH+ApAC0YP68DMXI7r/GqUvkq8f0XnU
 L95clA2351B9KHRWih0kGc4nonnKVRQxfEnROPF9Vo8Ul5Drk8rilyYYG/2kCrLZk81USy
 WtGD+k2uhopMqcwQk+vk624i+0Acyb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-jYia_Ze4MnuM31JBE23c2A-1; Wed, 11 Nov 2020 09:49:48 -0500
X-MC-Unique: jYia_Ze4MnuM31JBE23c2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E994513D061
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:49:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B81C45B4C4
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 14:49:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/6] Misc fixes for QEMU 5.2-rc2
Date: Wed, 11 Nov 2020 09:49:45 -0500
Message-Id: <20201111144946.1213713-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

The following changes since commit 3493c36f0371777c62d1d72b205b0eb6117e2156:

  Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201106' into staging (2020-11-06 13:43:28 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to b1b0393c3c58c0e96c7c44e2e98baa252d6c6813:

  pvpanic: Advertise the PVPANIC_CRASHLOADED event support (2020-11-11 03:59:05 -0500)

----------------------------------------------------------------
Bug fixes

----------------------------------------------------------------
Greg Kurz (1):
      Makefile: No echoing for 'make help V=1'

Pankaj Gupta (1):
      physmem: improve ram size error messages

Paolo Bonzini (2):
      fix make clean/distclean
      pvpanic: Advertise the PVPANIC_CRASHLOADED event support

Pavel Dovgalyuk (1):
      replay: remove some dead code

Thomas Huth (1):
      meson: Clarify the confusing vhost-user vs. vhost-kernel output

 Makefile                   | 8 ++++----
 hw/core/machine.c          | 1 +
 hw/misc/pvpanic.c          | 5 ++++-
 meson.build                | 3 ++-
 replay/replay-debugging.c  | 3 ---
 softmmu/physmem.c          | 6 +++---
 tests/qtest/pvpanic-test.c | 2 +-
 7 files changed, 15 insertions(+), 13 deletions(-)
-- 
2.26.2


