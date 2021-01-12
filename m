Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC54B2F3711
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:28:17 +0100 (CET)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNSq-0002DB-TY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFw-0003XA-Ja
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:14:58 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFu-0004q8-BV
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:14:55 -0500
Received: by mail-ed1-x533.google.com with SMTP id by27so2935378edb.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=18sPMynKkOtU4L2paxwQnr/WWSKuGv1Nncftn33NL/o=;
 b=Ph5/ltTZucqfY1FOiw7uZP2KTN50dGTAKhsAEJbZIh3FrzfJD7faulGE/Ag/Phct1i
 a3NIPc6ONn5uu2af1QXjJYvAsBi67yDQX/Dd/clKWaERkOFlc/fKp3spQPkqRTMpB8Cx
 XnGYukXTspb67X/4MKsV8w7ooBMiZIuoSOQAulVUwDMO0DDUwX1vWD9oDpbUB9gCZTgS
 u0ixWbyXHRMQOTdd7KY0ZQyL0acynZp9BOL9A+FmffN4x0+Zh7ObQR6CM+x54Xhsy3Ux
 G4XFr+IZO8WWD0/q1L2q8UtMQFkeXpsXOuE+m/KR0J6GjumpEFcTtw67MVlRjiXY9oB8
 Hzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=18sPMynKkOtU4L2paxwQnr/WWSKuGv1Nncftn33NL/o=;
 b=bvJC5g82wIP2ft5shufBBFFmafwu0dGTPEQkWUmHZ9FUrdSiR/PRejq/p+uZCuLbWC
 ZI1mvTD5mTzSOj2G+85IYTpAdVrkIvNdI8wOPNJ0dprM3IoZAvM6HxAxbTlxZjoKRFN0
 yXmey50eMVm/T+BZRLgfWrNWI69wKxHDXFyPlQji29lhYZenmEEPHXZGUHzj3BIFYdZp
 9t9eMrr+m/pkaLh/JcxLLwuTEJo0P2sSwubAWC71bcUgXgdyaLKBEQbapHB0X8vpYlmF
 WUzFmiIGWkMXDk9WFED1+wNSqCmIZb8TQ/R0EATEo92WgJ6tlnGAiJRR0MP3VNWe6Hvg
 AoIw==
X-Gm-Message-State: AOAM531cTrr/y6sYjuZZB8KGsfLYRU1ynzu4CMGnnz81VmAuz/TkDaIV
 JNEFf62SwUvTJ0yLzSR2mjluAc8Y/ekz2g==
X-Google-Smtp-Source: ABdhPJwQcXNNHokZ+aW7tq9+cY96ebDNnbOZX1ZrmJZzUUuoNBbRrB8i3a3LdXPkyS0HUKk0vtWymw==
X-Received: by 2002:a50:d757:: with SMTP id i23mr149701edj.116.1610471692508; 
 Tue, 12 Jan 2021 09:14:52 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] Misc patches for 2021-01-12
Date: Tue, 12 Jan 2021 18:14:30 +0100
Message-Id: <20210112171450.791427-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit b3f846c59d8405bb87c551187721fc92ff2f1b92:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2021-01-11v2' into staging (2021-01-11 15:15:35 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to c117e5b11a21598205f1701a15965e825959d59f:

  target/i386: Use X86Seg enum for segment registers (2021-01-12 17:05:10 +0100)

----------------------------------------------------------------
* UI configury cleanups and Meson conversion
* scripts/gdb improvements
* WHPX cleanups and fixes
* cirrus win32 CI improvements
* meson gnutls workaround

----------------------------------------------------------------
Chris Hofstaedtler (1):
      meson: fix Cocoa option in summary

Hannes Reinecke (1):
      virtio-scsi: trace events

Keqian Zhu (1):
      Docs/RCU: Correct sample code of qatomic_rcu_set

Maxim Levitsky (2):
      scripts/gdb: fix 'qemu coroutine' when users selects a non topmost stack frame
      scripts/gdb: implement 'qemu bt'

Paolo Bonzini (9):
      meson: do not use CONFIG_VIRTFS
      whpx: rename whp-dispatch to whpx-internal.h
      whpx: move internal definitions to whpx-internal.h
      cocoa: do not enable coreaudio automatically
      gtk: remove CONFIG_GTK_GL
      configure: move X11 detection to Meson
      configure: move GTK+ detection to Meson
      configure: move Cocoa incompatibility checks to Meson
      configure: quote command line arguments in config.status

Philippe Mathieu-Daudé (1):
      target/i386: Use X86Seg enum for segment registers

Roman Bolshakov (1):
      meson: Propagate gnutls dependency

Yonggang Luo (4):
      cirrus/msys2: Exit powershell with $LastExitCode
      cirrus/msys2: Cache msys2 mingw in a better way.
      maintainers: Add me as Windows Hosted Continuous Integration maintainer
      whpx: move whpx_lapic_state from header to c file

 .cirrus.yml                                        | 119 ++++++++++++---------
 MAINTAINERS                                        |   6 ++
 block/meson.build                                  |   2 +-
 configure                                          |  93 ++--------------
 docs/devel/rcu.txt                                 |   2 +-
 fsdev/meson.build                                  |   2 +-
 hw/scsi/trace-events                               |   9 ++
 hw/scsi/virtio-scsi.c                              |  30 +++++-
 include/sysemu/whpx.h                              |  22 +---
 io/meson.build                                     |   2 +-
 meson.build                                        |  57 ++++++----
 meson_options.txt                                  |   2 +
 scripts/qemu-gdb.py                                |   1 +
 scripts/qemugdb/coroutine.py                       |  35 +++++-
 storage-daemon/meson.build                         |   2 +-
 target/i386/cpu.h                                  |   4 +-
 target/i386/gdbstub.c                              |   2 +-
 target/i386/tcg/seg_helper.c                       |   8 +-
 target/i386/tcg/translate.c                        |   6 +-
 target/i386/whpx/whpx-all.c                        |   9 +-
 target/i386/whpx/whpx-apic.c                       |   9 +-
 target/i386/whpx/whpx-cpus.c                       |   4 +-
 .../i386/whpx/{whp-dispatch.h => whpx-internal.h}  |  17 ++-
 tests/meson.build                                  |   6 +-
 tests/qtest/meson.build                            |   4 +-
 ui/gtk.c                                           |  16 +--
 ui/meson.build                                     |  11 +-
 27 files changed, 261 insertions(+), 219 deletions(-)
 rename target/i386/whpx/{whp-dispatch.h => whpx-internal.h} (93%)
-- 
2.29.2


