Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B095559593
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:42:38 +0200 (CEST)
Received: from localhost ([::1]:37202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4eth-0000my-H2
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efA-0005j5-03
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4ef6-0005Mp-Hc
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9zuLzxb27Hexp30bOKDN361bTLs6dYdnocSwc3Bu4Og=;
 b=HfpVez0+THL7k/t6RKOooT4s6DzfVxD/RxeqfStcMTJ++9dGrXNQrU+ToMa1AA4zCbq9XO
 db3j1sTrakZn5WT7u2B+l5uIpSynG2eFkGQoy3/7VrbVXPPh4qeEWNgkaAqHU2wymHXU+N
 +e8jcTxV6hfZDKRt5iOfNMouqD4kv6M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-QI9FXeZoMrqBatSbo9aYTw-1; Fri, 24 Jun 2022 04:27:28 -0400
X-MC-Unique: QI9FXeZoMrqBatSbo9aYTw-1
Received: by mail-ed1-f70.google.com with SMTP id
 t14-20020a056402524e00b0043595a18b91so1354903edd.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zuLzxb27Hexp30bOKDN361bTLs6dYdnocSwc3Bu4Og=;
 b=03pyXAwftWv2JTkW6x670ViyDCSVW8IdGmiYU5rG0A7w9j1feoZgyyowiQ2+pqg3gJ
 NUJlEmEAPxftlOP+r++kzFwM/CtjC0UfW5wqp4ZHIjCDxQnv/wYgURQ4+h3O65B2Sbft
 JVE98/+ZwEpLgrNtMRSnZIX5R6A4Xu+7MDZEt/Q0QNaa1hsPw0voOf4KSLEr3XaPsdzO
 M/JFh+m+Qv4d2hXvB6dkyCuvggUxcGaCqF1eg+tOdcLCUwBpompJ5vLnhPMJPLL1acXS
 QysMKFh31zXLwbtKX4g+b+vl0HjFzzFVz6gTekPfkO8WKUy/cKJYH+8392TqivZ6GaxF
 sAcQ==
X-Gm-Message-State: AJIora/V9RwGiQTgh2dcOVyqon2V2yjuUgJnStJuSxxUalwn7mDtcfeN
 SKgWxEsWu8PXAxDZZgNKgRFoSoe9Ubt2Pvt5mHFEVDGVd2UwXJEFTWJc6DOf4ZHbiWbY4lI/bOd
 ta9QrZG4nv99zfuIPKHCaaU3bQGwsSeAbdBGK7p+7fE0HKGADgGZIekG5vmE9scu+t0s=
X-Received: by 2002:a17:906:2245:b0:715:7c81:e39d with SMTP id
 5-20020a170906224500b007157c81e39dmr12213410ejr.262.1656059247145; 
 Fri, 24 Jun 2022 01:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tqpfrPY6Yyab5AE1R8a8dOr2PiUPVGFJ2J7uGpkAzoXYS/OPWUyOXiCvOK1QNR8P8TFdjLFA==
X-Received: by 2002:a17:906:2245:b0:715:7c81:e39d with SMTP id
 5-20020a170906224500b007157c81e39dmr12213384ejr.262.1656059246754; 
 Fri, 24 Jun 2022 01:27:26 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709063fd400b00722f66fb36csm696024ejj.112.2022.06.24.01.27.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] (Mostly) build system changes for 2022-06-24
Date: Fri, 24 Jun 2022 10:27:10 +0200
Message-Id: <20220624082724.246839-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:

  Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 72da35fec9a9ba91a5b2cb9ee00843a94fa9413d:

  accel: kvm: Fix memory leak in find_stats_descriptors (2022-06-24 10:19:17 +0200)

----------------------------------------------------------------
* fuzzing fixes
* fix cross compilation CFLAGS and compiler choice
* do not specify -bios option for tests/vm
* miscellaneous fixes

----------------------------------------------------------------
Alexander Bulekov (2):
      build: improve -fsanitize-coverage-allowlist check
      fuzz: only use generic-fuzz targets on oss-fuzz

Marc-André Lureau (1):
      audio/dbus: fix building

Miaoqian Lin (1):
      accel: kvm: Fix memory leak in find_stats_descriptors

Paolo Bonzini (9):
      tests/vm: do not specify -bios option
      pc-bios/optionrom: use -m16 unconditionally
      configure, pc-bios/optionrom: pass cross CFLAGS correctly
      configure, pc-bios/s390-ccw: pass cross CFLAGS correctly
      configure, pc-bios/vof: pass cross CFLAGS correctly
      configure: allow more host/target combos to use the host compiler
      configure: write EXTRA_CFLAGS for all sub-Makefiles
      tests/tcg: compile system emulation tests as freestanding
      build: try both native and cross compilers for linux-user tests

Thomas Huth (1):
      meson.build: Require a recent version of libpng

 accel/kvm/kvm-all.c                    |   1 +
 audio/meson.build                      |   2 +-
 configure                              | 188 ++++++++++++++++++++-------------
 meson.build                            |   7 +-
 pc-bios/optionrom/Makefile             |  15 +--
 pc-bios/optionrom/code16gcc.h          |   3 -
 pc-bios/s390-ccw/Makefile              |  20 ++--
 pc-bios/s390-ccw/netboot.mak           |   6 +-
 pc-bios/vof/Makefile                   |   8 +-
 scripts/oss-fuzz/build.sh              |   4 +-
 tests/tcg/Makefile.target              |   1 +
 tests/tcg/aarch64/system/pauth-3.c     |   2 +-
 tests/tcg/aarch64/system/semiconsole.c |   2 +-
 tests/tcg/aarch64/system/semiheap.c    |   2 +-
 tests/tcg/multiarch/system/memory.c    |   2 +-
 tests/vm/fedora                        |   1 -
 tests/vm/freebsd                       |   1 -
 tests/vm/netbsd                        |   1 -
 tests/vm/openbsd                       |   1 -
 19 files changed, 143 insertions(+), 124 deletions(-)
 delete mode 100644 pc-bios/optionrom/code16gcc.h
-- 
2.36.1


