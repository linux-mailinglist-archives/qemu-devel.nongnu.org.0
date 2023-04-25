Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9CC6EE346
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:40:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prItB-00035t-9p; Tue, 25 Apr 2023 09:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prIsq-00033g-Rl
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prIsp-0003Iq-03
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682429940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/JQC2SNAoo2qBqEYHrT5xvcbRg6Ocbbtm/EcVrCbLE=;
 b=gzQNB6v9rKs1UlC5tTNubLOJtMxr6Ph+vieEjb4tAR115y4AHfg2p+OUdtqfPwLVt5OnyO
 +xhRXGlsLLYmaGKeUu5ZrbediJ8mVX8pZGiIkc3FygQfFRssJfltrU6kkp8+QBaV+s2HC/
 T6FoWHvMsXVe+StGdCTyc9QaXtBeYxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-JYP1ZESfNoebBFkYLallNA-1; Tue, 25 Apr 2023 09:38:59 -0400
X-MC-Unique: JYP1ZESfNoebBFkYLallNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B55E823F66;
 Tue, 25 Apr 2023 13:38:56 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B25F41121318;
 Tue, 25 Apr 2023 13:38:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Date: Tue, 25 Apr 2023 15:38:48 +0200
Message-Id: <20230425133851.489283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Allow running qemu-system-x86_64 in 32-bit-only mode (by renaming
or symlinking the binary to "qemu-system-i386"). After doing this,
qemu-system-x86_64 should be a proper superset of qemu-system-i386
(apart from 32-bit KVM support, which however is not really required
anymore, see https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/ ).
Thus we can finally deprecate the qemu-system-i386 binary. This will
help to avoid that we have to compile a lot of the x86 stuff twice
once we'll finally be able to drop qemu-system-i386.

Marked as RFC since there are likely still a bunch of spots around
that need attention, e.g.:

- CPU types have different suffixes between the -x86_64 and -i386
  variant (see TYPE_X86_CPU in cpu-qom.h) ... do we need to care
  about this in the new qemu-system-i386 symlink run mode?

- The code in target/i386/tcg/sysemu/smm_helper.c looks like it
  maybe needs a runtime switch, too ... or is it ok to leave this
  hard-coded to the x86_64 version?

Anyway, I'd like to get some feedback on this idea here... What
do you think of the idea of getting rid of the qemu-system-i386
binary this way in the future?

Thomas Huth (3):
  cpu: Add a way to detect 32-bit mode from argv0
  target/i386/cpu: Allow to limit the 64-bit binary to 32-bit mode only
  docs/about/deprecated: Deprecate the qemu-system-i386 binary

 docs/about/deprecated.rst | 16 ++++++++++++++++
 include/hw/core/cpu.h     | 10 ++++++++++
 target/i386/cpu.h         |  4 ++--
 cpu.c                     | 13 +++++++++++++
 softmmu/vl.c              |  1 +
 target/i386/cpu.c         | 28 +++++++++++++---------------
 target/i386/gdbstub.c     |  8 +-------
 7 files changed, 56 insertions(+), 24 deletions(-)

-- 
2.31.1


