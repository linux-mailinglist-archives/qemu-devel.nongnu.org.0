Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C2571AA1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:58:09 +0200 (CEST)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFSq-00068f-O5
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLF-000373-TF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL7-0001Qw-OA
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gHygSK+6+NNh3UJy9c+v7SWR6sNBV/G9iEqB9FThl5w=;
 b=XalPcDVQR1bWDhPniavMuO5KMI0bOmHwy7wPk8jDU/KH4TONAIhjQIB/T6pSGHbLanO1UU
 YkCg1a3b0XbKvgtuqYeMYoYWdve4LQjszT/znbbSeh/a/m0a0IAhEcohSQAvdhKjM37Tp4
 Tssnt1kTJwzJ3XhQCOOJEVE9hU65wro=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-TV_c9o1hPSqyNoZ2mV0aFg-1; Tue, 12 Jul 2022 08:50:01 -0400
X-MC-Unique: TV_c9o1hPSqyNoZ2mV0aFg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y21-20020a056402359500b0043adf65d1a0so2805824edc.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHygSK+6+NNh3UJy9c+v7SWR6sNBV/G9iEqB9FThl5w=;
 b=IQnWoAS7Xqf1X4/jOdWRyLDol9RVZCao8zDEsGslX9zx5rj+nymVddPWgxC6PEA8wJ
 LyebaHzpJ//Ok7cyBujUu5MZFp2c95HryVv+0/PApEF8uZzlwWFHmftWPbBokydoqZv4
 pA1eHIwQDWpwlb/fVMIaRs23aZ8SiQq/y878F2+mXiLliPTDBLzzH7Zyqaq0FXLPExtK
 0w9H/eIG159Ftu6wnhH64Jor7ykzJ+wDT7rswO61jyuzll9eNW/rPIBQjLQQmoQ1EE7Z
 6obTwsaxMYfdOGFJnsl7GBFXpELZFxSE3XF/Kmkfbv3nA7diK6PvyntvlnSVY/FcJJwX
 M2vQ==
X-Gm-Message-State: AJIora8NSyxAheU8ONR9aUK+R3iouHCNzHjH7Vk5iayiPM13JB7/ASi2
 ipEcg67qgP2scWZdlSzzZBGOYKvrfmVpcxr65I86j7azdASDAtTeJUZODB98cXG40z+UlQyIzmn
 zWWDz6sNdGXbnVhtzA1AxFWVZNF7l0cZdECoxjlJ5d5otN6ycFnIe/eDK/whKYzBKHNQ=
X-Received: by 2002:a05:6402:c44:b0:431:52cc:f933 with SMTP id
 cs4-20020a0564020c4400b0043152ccf933mr31987909edb.41.1657630199846; 
 Tue, 12 Jul 2022 05:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tLbjv1x1Y/o0281z67QdPzNYfbG3Dzn+8OXsSZYaJj9IFLytdDJ8ZhXeSrbBZ3dnZmyP99vw==
X-Received: by 2002:a05:6402:c44:b0:431:52cc:f933 with SMTP id
 cs4-20020a0564020c4400b0043152ccf933mr31987861edb.41.1657630199404; 
 Tue, 12 Jul 2022 05:49:59 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 cb1-20020a0564020b6100b0043a6dc3c4b0sm5988260edb.41.2022.07.12.05.49.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:49:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] Misc patches for 2022-07-12
Date: Tue, 12 Jul 2022 14:49:38 +0200
Message-Id: <20220712124956.150451-1-pbonzini@redhat.com>
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

The following changes since commit 180c2f24d5e8eada41e012a3899d29bb695aae06:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-06 10:41:34 +0530)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 9fb6d8a9b2fc0e150b56a0ff4341494dcd8360b8:

  meson: place default firmware path under .../share (2022-07-12 14:46:58 +0200)

----------------------------------------------------------------
* fuzzing fixes (Alexander)
* fix cross compilation CFLAGS and compiler choice
* do not specify -bios option for tests/vm
* miscellaneous fixes
* preparation for pre-install tree in the build directory (Akihiko)

----------------------------------------------------------------
Akihiko Odaki (2):
      build: Do not depend on pc-bios for config-host.mak
      qga: Relocate a path emitted in the help text

Alexander Bulekov (2):
      build: improve -fsanitize-coverage-allowlist check
      fuzz: only use generic-fuzz targets on oss-fuzz

Marc-André Lureau (1):
      audio/dbus: fix building

Mauro Matteo Cascella (1):
      scsi/lsi53c895a: fix use-after-free in lsi_do_msgout (CVE-2022-0216)

Miaoqian Lin (1):
      accel: kvm: Fix memory leak in find_stats_descriptors

Paolo Bonzini (11):
      tests/vm: do not specify -bios option
      pc-bios/optionrom: use -m16 unconditionally
      configure, pc-bios/optionrom: pass cross CFLAGS correctly
      configure, pc-bios/s390-ccw: pass cross CFLAGS correctly
      configure, pc-bios/vof: pass cross CFLAGS correctly
      configure: allow more host/target combos to use the host compiler
      configure: write EXTRA_CFLAGS for all sub-Makefiles
      tests/tcg: compile system emulation tests as freestanding
      configure: pass whole target name to probe_target_compiler
      build: try both native and cross compilers
      meson: place default firmware path under .../share

 Makefile                               |   2 +-
 accel/kvm/kvm-all.c                    |   1 +
 audio/meson.build                      |   2 +-
 configure                              | 201 ++++++++++++++++++++-------------
 hw/scsi/lsi53c895a.c                   |   3 +-
 meson.build                            |   5 +-
 meson_options.txt                      |   2 +-
 pc-bios/optionrom/Makefile             |  15 +--
 pc-bios/optionrom/code16gcc.h          |   3 -
 pc-bios/s390-ccw/Makefile              |  20 ++--
 pc-bios/s390-ccw/netboot.mak           |   6 +-
 pc-bios/vof/Makefile                   |   8 +-
 qga/main.c                             |   6 +-
 scripts/meson-buildoptions.sh          |   2 +-
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
 24 files changed, 163 insertions(+), 130 deletions(-)
 delete mode 100644 pc-bios/optionrom/code16gcc.h
-- 
2.36.1


