Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BA5BD3F1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:40:15 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKkf-0000BZ-So
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfb-0002qM-3M
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfZ-0002pw-9j
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OEPn4sd0P7K+Sa+aEogB1qv2lOlPjUWxfZ630vNTJKY=;
 b=J0u1T6hTK/unE0wzFLS0QP3477hcwD4chHXLMwAaCaY0dmy6KWYuSnxNiyTnq0rFOvDK8I
 0BZCr2WWZStD4Pad9NH/fcw7wkjmhtOzswe/5J80iFAzxkZ824yPDCSJYPCg4HuAM9sm2S
 nnDtVKU1xYRF8aPO32mTXUIO7ainl9o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-_6nJsfZ4Phu_wJYp5nqgfA-1; Mon, 19 Sep 2022 13:34:54 -0400
X-MC-Unique: _6nJsfZ4Phu_wJYp5nqgfA-1
Received: by mail-wr1-f72.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so39172wrg.13
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=OEPn4sd0P7K+Sa+aEogB1qv2lOlPjUWxfZ630vNTJKY=;
 b=7Rn+MXvt9vTXDgXb5jcTXtvovIVtKo4hhjYSBPir3w4UIIVfUaIasTN1vTD7em+ZLl
 NZCyCHKwnO/hRvAoX567HcJi91FPAPzT9yQO0Osmrlmlzng9gwHYt/4UuSH0Tn2dNqtn
 uUtHicpsmgjOg+jx7fI6Dg8T/BGzsHg/6u/fg3mcV0AmZmtumkV87gVmFFmTqhYjQ2Jx
 NdOOz5xWDgd3NGJte+FnjXmLQ04InAZlwEkMWJKnZzOwP9+f/tMupUlwBal9bW6jgiBZ
 W6bBoO0j36XUEEcZV7Xo5eH2SM8mt+3O6Y3nDv93mmuUeWYnBv9iBDc/k2nTgjAGf1Fr
 R1LQ==
X-Gm-Message-State: ACrzQf3IQgY4NIHAyrugo9eYRs53li3CfkuMdzIEGOXdOoKo13jBh/dC
 L/S/27fE0fPvl9gyP/GtYp1GXzgfwGZB04a2UWRFmyp4OxFKvdot17q531mBOvX4NY3cBqyKMgz
 FLYRR0B6vdth0SW5zKGJFaOe0ctChhKwn3a3puUuNKMRxNu0FHFr75Rf8IeB8nDThwLI=
X-Received: by 2002:adf:d0d2:0:b0:22a:daf4:87e8 with SMTP id
 z18-20020adfd0d2000000b0022adaf487e8mr11376964wrh.167.1663608893127; 
 Mon, 19 Sep 2022 10:34:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42W1N4+g+305BAzW+PYraOF6mK+LstD4DnIkhY0LDuvPxw+8qBUhaq9WlSjRdEquQUltB1OA==
X-Received: by 2002:adf:d0d2:0:b0:22a:daf4:87e8 with SMTP id
 z18-20020adfd0d2000000b0022adaf487e8mr11376945wrh.167.1663608892559; 
 Mon, 19 Sep 2022 10:34:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r203-20020a1c44d4000000b003a840690609sm17398408wma.36.2022.09.19.10.34.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:34:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] Misc patches for 2022-09-19
Date: Mon, 19 Sep 2022 19:34:28 +0200
Message-Id: <20220919173449.5864-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d29201ff34a135cdfc197f4413c1c5047e4f58bb:

  Merge tag 'pull-hmp-20220915a' of https://gitlab.com/dagrh/qemu into staging (2022-09-17 10:31:11 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to df22fbb751dc72f321218c3fb192730a47ad59a9:

  qboot: update to latest submodule (2022-09-19 15:40:51 +0200)

----------------------------------------------------------------
* add help option for -audio and -audiodev
* another missing memory barrier for dirty pages
* target/i386: Raise #GP on unaligned m128 accesses
* coverity fixes + improvements to components
* add MMX and 3DNow! tests
* SSE4a fixes
* target/i386: TCG translation cleanups
* update qboot submodule

----------------------------------------------------------------
Claudio Fontana (1):
      audio: add help option for -audio and -audiodev

Paolo Bonzini (20):
      KVM: use store-release to mark dirty pages as harvested
      target/i386: Raise #GP on unaligned m128 accesses when required.
      kvm: fix memory leak on failure to read stats descriptors
      spapr_pci: fix leak in spapr_phb_vfio_get_loc_code
      coverity: add new RISC-V component
      coverity: put NUBus under m68k component
      smbios: sanitize type from external type before checking have_fields_bitmap
      tests: unit: simplify test-visitor-serialization list tests
      tests: test-qga: close socket on failure to connect
      tests: unit: add NULL-pointer check
      tests/tcg: i386: fix typos in 3DNow! instructions
      tests/tcg: i386: add MMX and 3DNow! tests
      tests/tcg: refine MMX support in SSE tests
      tests/tcg: remove old SSE tests
      target/i386: correctly mask SSE4a bit indices in register operands
      target/i386: fix INSERTQ implementation
      target/i386: REPZ and REPNZ are mutually exclusive
      target/i386: introduce insn_get_addr
      build: remove extra parentheses causing missing rebuilds
      qboot: update to latest submodule

 Makefile                                |   2 +-
 accel/kvm/kvm-all.c                     |  27 +-
 audio/audio.c                           |  19 ++
 audio/audio.h                           |   1 +
 hw/ppc/spapr_pci.c                      |   1 +
 hw/smbios/smbios.c                      |  14 +-
 qemu-options.hx                         |  10 +-
 roms/qboot                              |   2 +-
 scripts/coverity-scan/COMPONENTS.md     |   5 +-
 softmmu/vl.c                            |   9 +-
 target/i386/ops_sse.h                   |  12 +-
 target/i386/ops_sse_header.h            |   2 +-
 target/i386/tcg/excp_helper.c           |  13 +
 target/i386/tcg/helper-tcg.h            |  28 +-
 target/i386/tcg/sysemu/excp_helper.c    |   8 +
 target/i386/tcg/tcg-cpu.c               |   2 +
 target/i386/tcg/translate.c             |  95 ++++--
 target/i386/tcg/user/excp_helper.c      |   7 +
 tests/tcg/i386/Makefile.target          |  24 +-
 tests/tcg/i386/test-3dnow.c             |   3 +
 tests/tcg/i386/test-avx.py              |  33 +-
 tests/tcg/i386/test-i386.c              | 573 --------------------------------
 tests/tcg/i386/test-mmx.c               | 315 ++++++++++++++++++
 tests/tcg/i386/test-mmx.py              | 244 ++++++++++++++
 tests/tcg/i386/x86.csv                  |   4 +-
 tests/tcg/x86_64/Makefile.target        |   1 -
 tests/unit/check-block-qdict.c          |   2 +-
 tests/unit/test-qga.c                   |   1 +
 tests/unit/test-visitor-serialization.c | 157 ++++-----
 29 files changed, 870 insertions(+), 744 deletions(-)
 create mode 100644 tests/tcg/i386/test-3dnow.c
 create mode 100644 tests/tcg/i386/test-mmx.c
 create mode 100755 tests/tcg/i386/test-mmx.py
-- 
2.37.2


