Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0904EEF14
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:16:03 +0200 (CEST)
Received: from localhost ([::1]:54662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI4I-0005tg-FN
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:16:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1w-0003FK-Sy
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:36 -0400
Received: from [2a00:1450:4864:20::62e] (port=39614
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1u-0006aE-Sb
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:36 -0400
Received: by mail-ej1-x62e.google.com with SMTP id dr20so6112136ejc.6
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ciFNQq3GalLq91jVBmx+tH5RA+qEZgt2ltve9fRpsUU=;
 b=SB9HKvcAr16/YAkJhyuGn0YlLZZ/5N+W2dsPDKXU6rkNFjX4K0oujHriJQu1kEPJ8r
 AKw3WnpoVOjnMVTcYuxP7d670Q24cfAO/vDLHdO2GYx01i6ha76agxuxAzue2X7+cjCt
 y/s/7G4j54ewGo/mJpMTAh1Lv/TJF19i5rErL3G2PLr33rkFKsSE77YL4L7qPdE1OuDr
 Z0cJ1p/Kcw1z71KHx/NgPF/qL2b8g1iAsRBZCO3wQGOY3q6NVHmlMmV3ck18WFPEejXV
 h6Ef8A/mDyuRiArV7LHcR44MEa1dXluz/trdBQLJ+V4o10CYfgMarhLGJM+L4eV5wbYu
 3MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ciFNQq3GalLq91jVBmx+tH5RA+qEZgt2ltve9fRpsUU=;
 b=XG0s3DMAjc27Y+ZGqeUd3tBbxJ1lYoblXwhTMt5PgSpV3wLbrVB1gF+n9+wuWVFTun
 Rtw9LPJVykVnNS3FJfPtjPMh3DsxezkZ2hb37aO7JsCD8RCFwTJK1Z34+EvQmJBpYfgz
 j4ede2ZCoPJx8l9KGWsj8r4ZgIJOYXde8JRKScZW0ufwcLW24r+rqG2GCvxDiOLmn4sa
 ukCz/8L68Vv84xYk/qNeZytbsQmfRWWnQcZZSMX0OpEku4w9fpG55whfRdJTT26Yr1kn
 NceVoMbWKNixlryI2p+JAlY6487yIV8nCSyVr94dFV9GIbC3Vrsu/UVBPs5bodta5e/x
 jBNw==
X-Gm-Message-State: AOAM531YBJkFdkV6InJ+vk2lJEb3+IIYbcJi4/wBEyY/8UUv6XbgRSWp
 +CJMEv2ybRYqZihfetq3UDuu/neY4is=
X-Google-Smtp-Source: ABdhPJyXoY4a+8Imo2PGfxL7JUOr9HXArJpgAARLQSYt+lxB3eAa2BF9RXb5ZSu9wDeWXR/9TLshAg==
X-Received: by 2002:a17:907:a40e:b0:6e0:5c84:9ced with SMTP id
 sg14-20020a170907a40e00b006e05c849cedmr41195ejc.284.1648822413141; 
 Fri, 01 Apr 2022 07:13:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] tests/docker and tests/tcg cleanup and diet
Date: Fri,  1 Apr 2022 16:13:09 +0200
Message-Id: <20220401141326.1244422-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first eight patches simplify and clean up a bit the
tests/docker/Makefile.include file.

The rest adjust tests/Makefile.include to invoke the tests/tcg
Makefiles directly, without going through Makefile.qemu and
Makefile.prereqs.  All information is gathered at configure time,
and the config*.mak files for each TCG test target includes
the normal Makefile variables (AC, CC, LD, etc.).  tests/tcg
stops using config-host.mak, too.

This is also a first step towards moving the cross-compilation
infrastructure from tests/tcg to all of QEMU, so that it can be
used to build firmware binaries.  The next steps would be along
the lines of:

- add more binutils to the tests/tcg per-target config files

- move tests/tcg/configure.sh into the main configure script

- extract parts of configure.sh into shell functions and use
  them to generate the roms/ .mak files

Paolo

v1->v2:
- rebased
- also remove empty dockerfile [Alex]
- fixed container_cross_as [Richard]
- simplify docker-TEST@IMAGE even further
- cleanup hexagon-cross
- check that targets match one of *-softmmu, *-linux-user, *-bsd-user
- cleaner tests/tcg/configure.sh, set got_cross_cc=yes for docker case
- do not include config-host.mak at all in tests/tcg
- remove "docker.py check"

Paolo Bonzini (17):
  tests/docker: remove dead code for linux-user containers
  tests/docker: remove test targets
  tests/docker: remove dead variable
  tests/docker: remove unnecessary default definitions
  tests/docker: inline variable definitions or move close to use
  tests/docker: remove unnecessary filtering of $(DOCKER_IMAGES)
  tests/docker: simplify docker-TEST@IMAGE targets
  tests/docker: do not duplicate rules for hexagon-cross
  tests/tcg: add compiler test variables when using containers
  tests/tcg: remove CONFIG_LINUX_USER from config-target.mak
  tests/tcg: remove CONFIG_USER_ONLY from config-target.mak
  tests/tcg: prepare Makefile.prereqs at configure time
  tests/tcg: list test targets in Makefile.prereqs
  tests/tcg: invoke Makefile.target directly from QEMU's makefile
  tests/tcg: isolate from QEMU's config-host.mak
  tests/docker: remove SKIP_DOCKER_BUILD
  tests/tcg: fix non-static build

 configure                                     |   3 +-
 tests/Makefile.include                        |  55 ++++----
 tests/docker/Makefile.include                 | 115 ++++-------------
 tests/docker/docker.py                        |  57 ---------
 .../build-toolchain.sh                        |   0
 tests/docker/dockerfiles/empty.docker         |   8 --
 tests/tcg/Makefile.prereqs                    |  18 ---
 tests/tcg/Makefile.qemu                       | 121 ------------------
 tests/tcg/Makefile.target                     |  14 +-
 tests/tcg/aarch64/Makefile.softmmu-target     |   2 +-
 tests/tcg/aarch64/Makefile.target             |  10 +-
 tests/tcg/configure.sh                        |  78 +++++++----
 tests/tcg/i386/Makefile.target                |   2 +-
 tests/tcg/multiarch/Makefile.target           |   2 +-
 tests/tcg/ppc64/Makefile.target               |   4 +-
 tests/tcg/ppc64le/Makefile.target             |   4 +-
 tests/tcg/x86_64/Makefile.target              |   2 +-
 17 files changed, 123 insertions(+), 372 deletions(-)
 rename tests/docker/dockerfiles/{debian-hexagon-cross.docker.d => debian-hexagon-cross.d}/build-toolchain.sh (100%)
 delete mode 100644 tests/docker/dockerfiles/empty.docker
 delete mode 100644 tests/tcg/Makefile.prereqs
 delete mode 100644 tests/tcg/Makefile.qemu

-- 
2.35.1


