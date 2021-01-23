Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD1A301873
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 22:01:14 +0100 (CET)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Q1w-0007wT-Tj
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 16:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Pyo-0006i8-6w
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 15:57:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Pyk-0007Mw-9r
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 15:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611435472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1nu+kXK8lwCltOcv+dSPdAMR7G29Qifed4U6LDNun6U=;
 b=PBBRDGogXqWx+UadQoI7K3nNHduz8rlQaFT4YD8KVXZh9GLxXr9+AY/gvSCTMoNfAG1Kvl
 PQM17tuEWEk/9I/kzhs3QdufV/oBbqSL1I0KFQ6BSUSKrNL8bfZ9toRFjG6J37pPjnZfOb
 4T08Is197P6m7KekRhIo3Vb5Lt7E8bg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-nMtgdjFIM1uMOGlNemNq0g-1; Sat, 23 Jan 2021 15:57:49 -0500
X-MC-Unique: nMtgdjFIM1uMOGlNemNq0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43ECC801817
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 20:57:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11C64100AE43
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 20:57:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/30] Misc patches for 2021-01-21
Date: Sat, 23 Jan 2021 15:57:47 -0500
Message-Id: <20210123205747.1175854-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fef80ea073c4862bc9eaddb6ddb0ed970b8ad7c4:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-01-20' into staging (2021-01-21 10:44:28 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ccd3b3b8112b670fdccf8a392b8419b173ffccb4:

  qemu-option: warn for short-form boolean options (2021-01-23 15:55:08 -0500)

----------------------------------------------------------------
* Make MinGW respect --bindir (Joshua)
* Switch MinGW to a "deep" installation (Joshua + NSIS fixes by myself)
* Fix compilation errors/warnings (Qixin, Philippe)
* QemuOpts cleanups (myself)
* Consistency improvements for -action (myself)
* remove deprecated "change vnc TARGET" functionality (myself)
* meson cleanups (Marc-André, Philippe, myself)
* IDE out-of-bounds access (Prasad)
* LA57 fix for -cpu max (Weijiang)

----------------------------------------------------------------
Gan Qixin (1):
      util/cacheflush: Fix error generated by clang

Joshua Watt (1):
      configure: MinGW respect --bindir argument

Marc-André Lureau (3):
      build-sys: remove unused LIBS
      build-sys: set global arguments for cflags/ldflags
      build-sys: add libvhost-user missing dependencies

Paolo Bonzini (11):
      runstate: cleanup reboot and panic actions
      build-system: clean up TCG/TCI configury
      nsis: adjust for new MinGW paths
      meson: convert wixl detection to Meson
      acceptance: switch to QMP change-vnc-password command
      hmp: remove "change vnc TARGET" command
      qmp: remove deprecated "change" command
      vnc: support "-vnc help"
      qemu-option: clean up id vs. list->merge_lists
      qemu-option: move help handling to get_opt_name_value
      qemu-option: warn for short-form boolean options

Philippe Mathieu-Daudé (12):
      softmmu/physmem: Silence GCC 10 maybe-uninitialized error
      meson: Declare have_virtfs_proxy_helper in main meson.build
      meson: Summarize information related to directories first
      meson: Display host binaries information altogether
      meson: Summarize overall features altogether
      meson: Summarize compilation-related information altogether
      meson: Display accelerators and selected targets altogether
      meson: Display block layer information altogether
      meson: Display crypto-related information altogether
      meson: Add a section header for library dependencies
      meson.build: Declare global edk2_targets / install_edk2_blobs variables
      meson.build: Detect bzip2 program

Prasad J Pandit (1):
      ide: atapi: check logical block address and read size (CVE-2020-29443)

Yang Weijiang (1):
      x86/cpu: Use max host physical address if -cpu max option is applied

 Makefile                              |   2 -
 configure                             | 144 +++-----------
 disas/meson.build                     |   2 -
 docs/system/deprecated.rst            |  11 +-
 docs/system/removed-features.rst      |  11 ++
 fsdev/meson.build                     |   1 -
 hmp-commands.hx                       |   6 -
 hw/ide/atapi.c                        |  30 ++-
 include/ui/console.h                  |   2 +-
 meson.build                           | 346 ++++++++++++++++++++--------------
 meson_options.txt                     |   4 +
 monitor/hmp-cmds.c                    |   7 +-
 monitor/qmp-cmds.c                    |  51 -----
 pc-bios/descriptors/meson.build       |  30 +--
 pc-bios/meson.build                   |   6 +-
 qapi/misc.json                        |  49 -----
 qapi/run-state.json                   |  10 +-
 qemu-options.hx                       |   8 +-
 qemu.nsi                              |  42 +----
 qga/meson.build                       |  55 +++---
 softmmu/physmem.c                     |   2 +-
 softmmu/runstate-action.c             |   4 +-
 softmmu/runstate.c                    |   7 +-
 softmmu/vl.c                          |   8 +-
 subprojects/libvhost-user/meson.build |   3 +
 target/i386/cpu.c                     |   1 +
 tests/acceptance/vnc.py               |  18 +-
 tests/test-qemu-opts.c                |   2 +-
 ui/vnc-stubs.c                        |   7 +-
 ui/vnc.c                              |   8 +-
 util/cacheflush.c                     |   8 +-
 util/qemu-option.c                    |  86 +++++----
 32 files changed, 433 insertions(+), 538 deletions(-)
-- 
2.26.2


