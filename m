Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D15A1C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:30:55 +0200 (CEST)
Received: from localhost ([::1]:47008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLNF-0007ON-UB
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKN-0001y9-Nr
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKJ-0004Wm-JI
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pyDyFf6t6enHsmUtXGqcI+Alx2e1yEOJDueoCBIpXlk=;
 b=YXGChP2S8OxGQUdizWDiSxwKCxgs3MxWBFkj+D1CqRu+UYRY9egKY7xgV8a2pMA/mSE/lt
 cJuGqy5+F05E5zu/C1oj1j/DTYTEHHDssSLRc0/LFOVulJSwNEvQK4ihfCKYKNMHZ1sFJf
 6UeKC42JI3X6dL9NRC8ZkUeK9vm3uYk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-vGxQb6_EMLaMZWyfl1LLFQ-1; Thu, 25 Aug 2022 18:27:48 -0400
X-MC-Unique: vGxQb6_EMLaMZWyfl1LLFQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so3052497wma.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=pyDyFf6t6enHsmUtXGqcI+Alx2e1yEOJDueoCBIpXlk=;
 b=e5vf/qVsouHIGD/hhdjQXIBoYjMql0elPSp7dySKOcmOxmG4VY+WGKsv8HJYmshZOf
 VDepAjEcjp06GLI/HxfOXRSdnRvcgm36sRpKMecl9xEIJ2bgMXP3DdTKOEhIOiC7SbJo
 sKt0F8dDUU0sVo0phPeNbVDfTnYLoAWlqK5tnnWG+6FbFPh3+g1sHvxuKQw6BzOF67jR
 wqEbSjoYtqOZlvAMkJ2iYdj9nnPk5fO5RfYuozVsOhvdF/ysUr3fHZV7HrIP5WnU3VUP
 uQPClTpS1QJDi0RSmxrt9Xb0P7K/nGFyMfsBiFAJHvlcU/X8e4GmZaCjzGKukE/AcVUW
 /T+A==
X-Gm-Message-State: ACgBeo2QLMHZLh7/QkkR4mgGzwRtTdCEZizxgxHpI4cUSQkollHHobfO
 ErDerbcGbTTznfowfCmnpITEDoijzRGxfJmrLxN/b+iwaqC5mV529wi4uVcdv3T5APAksDf86mo
 oGMOs5cbyBqEmQUmlrHS87E47+020rWMZeLaokr8Qm/8EllAq1vyTawd+5Iuw83rSFpI=
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr3347536wry.549.1661466466673; 
 Thu, 25 Aug 2022 15:27:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4WVbzVVUZzOHmny02Anc5ZYqx0LjzuD4lr4gLSCOjr3By6W5Z4U2qI52Ygvv/vyRV5b0+cAg==
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr3347527wry.549.1661466466407; 
 Thu, 25 Aug 2022 15:27:46 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a056000055200b002252cb35184sm344594wrf.25.2022.08.25.15.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 00/20] Cross compilation changes for 7.2
Date: Fri, 26 Aug 2022 00:27:25 +0200
Message-Id: <20220825222745.38779-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bunch of related changes leading up to building ROMs
with container-based cross compilers:

- detect pc-bios/ CC options just once instead of using make's $(shell)
  function

- move CC option detection to tests/tcg Makefiles from QEMU's root
  configure

- put all configuration of tests/tcg in config files instead of using
  $(MAKE) VAR=value

- mostly unrelated, change pc-bios/ Make output to look like Meson's
  "Compiling foo.o".

Paolo Bonzini (20):
  configure: do not invoke as/ld directly for pc-bios/optionrom
  pc-bios/optionrom: detect CC options just once
  pc-bios/s390-ccw: detect CC options just once
  vof: add distclean target
  build: add recursive distclean rules
  configure: return status code from probe_target_compiler
  configure: store container engine in config-host.mak
  tests: simplify Makefile invocation for tests/tcg
  tests/tcg: remove -f from Makefile invocation
  tests/tcg: add distclean rule
  tests/tcg: unify ppc64 and ppc64le Makefiles
  tests/tcg: clean up calls to run-test
  tests/tcg: move compiler tests to Makefiles
  configure: move tests/tcg/Makefile.prereqs to root build directory
  configure: unify creation of cross-compilation Makefiles
  configure: cleanup creation of tests/tcg target config
  configure: build ROMs with container-based cross compilers
  pc-bios/optionrom: Adopt meson style Make output
  pc-bios/s390-ccw: Adopt meson style Make output
  pc-bios/vof: Adopt meson style Make output

 Makefile                                      |  12 +-
 configure                                     | 251 +++++++-----------
 meson.build                                   |   2 +-
 pc-bios/optionrom/Makefile                    |  51 ++--
 pc-bios/s390-ccw/Makefile                     |  43 ++-
 pc-bios/s390-ccw/netboot.mak                  |  27 +-
 pc-bios/vof/Makefile                          |  19 +-
 tests/Makefile.include                        |  24 +-
 tests/docker/Makefile.include                 |   2 +-
 tests/tcg/Makefile.target                     |  34 ++-
 tests/tcg/aarch64/Makefile.softmmu-target     |  11 +-
 tests/tcg/aarch64/Makefile.target             |  15 +-
 tests/tcg/arm/Makefile.target                 |   9 +-
 tests/tcg/cris/Makefile.target                |   2 +-
 tests/tcg/i386/Makefile.softmmu-target        |   3 +-
 tests/tcg/i386/Makefile.target                |  11 +-
 tests/tcg/multiarch/Makefile.target           |  18 +-
 .../multiarch/system/Makefile.softmmu-target  |   2 +-
 tests/tcg/ppc64/Makefile.target               |   8 +-
 tests/tcg/{ppc64le => ppc64}/bcdsub.c         |   0
 tests/tcg/{ppc64le => ppc64}/byte_reverse.c   |   0
 tests/tcg/{ppc64le => ppc64}/mffsce.c         |   0
 tests/tcg/{ppc64le => ppc64}/mtfsf.c          |   0
 .../{ppc64le => ppc64}/non_signalling_xscv.c  |   0
 .../signal_save_restore_xer.c                 |   0
 tests/tcg/{ppc64le => ppc64}/xxspltw.c        |   0
 tests/tcg/ppc64le/Makefile.target             |  26 +-
 tests/tcg/s390x/Makefile.target               |   2 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |   3 +-
 29 files changed, 275 insertions(+), 300 deletions(-)
 rename tests/tcg/{ppc64le => ppc64}/bcdsub.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/byte_reverse.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mffsce.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mtfsf.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/non_signalling_xscv.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/signal_save_restore_xer.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/xxspltw.c (100%)

-- 
2.37.1


