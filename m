Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C66126297B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 10:04:18 +0200 (CEST)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFv5V-0004TY-12
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 04:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kFv4X-0003M8-8S
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 04:03:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49748
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kFv4U-0001sW-4r
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 04:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599638593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=vojAXZqxzal26D3to2jpE2dl3HFaIX4ffZoU3EcxXYc=;
 b=Ca+Dsr40zks9y/VOsHn2Hs0XXht80HIwq4ktPc+8dna8P+dqh/wqc7KvylZ9lSuRwGEbjR
 GBeqSm8kKOE3PXQfOW+Hv0YEq+y458s6u4w7KihtZIcHcwfPaxRB7G5SQpU/SKcsK81Dlq
 cw++qGsC+S6/hd8EhiL2kyPKMa2NKx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-wKQLvlmJOdOq2EO8NgmnZA-1; Wed, 09 Sep 2020 04:03:11 -0400
X-MC-Unique: wKQLvlmJOdOq2EO8NgmnZA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2C78730A8;
 Wed,  9 Sep 2020 08:03:10 +0000 (UTC)
Received: from thuth.com (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DA761002D54;
 Wed,  9 Sep 2020 08:03:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2] Simplify the .gitignore file
Date: Wed,  9 Sep 2020 10:03:05 +0200
Message-Id: <20200909080305.258961-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 02:43:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we always do out-of-tree builds (and the in-tree builds are
faked via a "build" directory), we can simplify out .gitignore file
quite a bit.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Do not delete the .sdk, stgit and coccinelle lines 

 .gitignore | 152 -----------------------------------------------------
 1 file changed, 152 deletions(-)

diff --git a/.gitignore b/.gitignore
index b6fdd34ddf..5515f595e6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,163 +1,11 @@
 /GNUmakefile
 /build/
-/.doctrees
-/config-devices.*
-/config-host.*
-/config-target.*
-/config.status
-/config-temp
-/tools/virtiofsd/50-qemu-virtiofsd.json
-/elf2dmp
-/trace-events-all
-/trace/generated-events.h
-/trace/generated-events.c
-/trace/generated-helpers-wrappers.h
-/trace/generated-helpers.h
-/trace/generated-helpers.c
-/trace/generated-tcg-tracers.h
-/ui/shader/texture-blit-frag.h
-/ui/shader/texture-blit-vert.h
-/ui/shader/texture-blit-flip-vert.h
-/ui/input-keymap-*.c.inc
-*-timestamp
-/*-softmmu
-/*-darwin-user
-/*-linux-user
-/*-bsd-user
-/ivshmem-client
-/ivshmem-server
-/libdis*
-/libuser
-/linux-headers/asm
-/qga/qapi-generated
-/qapi-gen-timestamp
-/qapi/qapi-builtin-types.[ch]
-/qapi/qapi-builtin-visit.[ch]
-/qapi/qapi-commands-*.[ch]
-**/qapi/qapi-commands.[ch]
-**/qapi/qapi-emit-events.[ch]
-/qapi/qapi-events-*.[ch]
-**/qapi/qapi-events.[ch]
-**/qapi/qapi-init-commands.[ch]
-**/qapi/qapi-introspect.[ch]
-/qapi/qapi-types-*.[ch]
-**/qapi/qapi-types.[ch]
-/qapi/qapi-visit-*.[ch]
-!/qapi/qapi-visit-core.c
-**/qapi/qapi-visit.[ch]
-**/qapi/qapi-doc.texi
-/qemu-edid
-/qemu-img
-/qemu-nbd
-/qemu-options.def
-/qemu-options.texi
-/qemu-img-cmds.texi
-/qemu-img-cmds.h
-/qemu-io
-/qemu-ga
-/qemu-bridge-helper
-/qemu-keymap
-/qemu-monitor.texi
-/qemu-monitor-info.texi
-/qemu-storage-daemon
-/qemu-version.h
-/qemu-version.h.tmp
-/module_block.h
-/scsi/qemu-pr-helper
-/vhost-user-scsi
-/vhost-user-blk
-/vhost-user-gpu
-/vhost-user-input
-/fsdev/virtfs-proxy-helper
-*.tmp
-*.[1-9]
-*.a
-*.aux
-*.cp
-*.exe
-*.msi
-*.dll
-*.so
-*.fn
-*.ky
-*.log
-*.pdf
-*.pod
-*.cps
-*.fns
-*.kys
-*.pg
-*.pyc
-*.toc
-*.tp
-*.vr
-*.d
-!/.gitlab-ci.d
-!/scripts/qemu-guest-agent/fsfreeze-hook.d
-*.o
 .sdk
-*.gcda
-*.gcno
-*.gcov
-/pc-bios/bios-pq/status
-/pc-bios/edk2-*.fd
-/pc-bios/vgabios-pq/status
-/pc-bios/optionrom/linuxboot.asm
-/pc-bios/optionrom/linuxboot.bin
-/pc-bios/optionrom/linuxboot.raw
-/pc-bios/optionrom/linuxboot.img
-/pc-bios/optionrom/linuxboot_dma.asm
-/pc-bios/optionrom/linuxboot_dma.bin
-/pc-bios/optionrom/linuxboot_dma.raw
-/pc-bios/optionrom/linuxboot_dma.img
-/pc-bios/optionrom/pvh.asm
-/pc-bios/optionrom/pvh.bin
-/pc-bios/optionrom/pvh.raw
-/pc-bios/optionrom/pvh.img
-/pc-bios/optionrom/multiboot.asm
-/pc-bios/optionrom/multiboot.bin
-/pc-bios/optionrom/multiboot.raw
-/pc-bios/optionrom/multiboot.img
-/pc-bios/optionrom/kvmvapic.asm
-/pc-bios/optionrom/kvmvapic.bin
-/pc-bios/optionrom/kvmvapic.raw
-/pc-bios/optionrom/kvmvapic.img
-/pc-bios/s390-ccw/s390-ccw.elf
-/pc-bios/s390-ccw/s390-ccw.img
-/docs/built
-/docs/interop/qemu-ga-qapi.texi
-/docs/interop/qemu-ga-ref.html
-/docs/interop/qemu-ga-ref.info*
-/docs/interop/qemu-ga-ref.txt
-/docs/interop/qemu-qmp-qapi.texi
-/docs/interop/qemu-qmp-ref.html
-/docs/interop/qemu-qmp-ref.info*
-/docs/interop/qemu-qmp-ref.txt
-/docs/version.texi
-/contrib/vhost-user-gpu/50-qemu-gpu.json
-*.tps
 .stgit-*
 .git-submodule-status
 cscope.*
 tags
 TAGS
-docker-src.*
 *~
 *.ast_raw
 *.depend_raw
-trace.c
-trace-ust.h
-trace-ust.h
-trace-dtrace.h
-trace-dtrace.dtrace
-trace-root.h
-trace-root.c
-trace-ust-root.h
-trace-ust-root.h
-trace-ust-all.h
-trace-ust-all.c
-trace-dtrace-root.h
-trace-dtrace-root.dtrace
-trace-ust-all.h
-trace-ust-all.c
-/target/arm/decode-sve.c.inc
-- 
2.18.2


