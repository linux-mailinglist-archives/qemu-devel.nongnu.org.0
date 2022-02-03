Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC14A8A38
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:38:00 +0100 (CET)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg3T-0007ZI-GP
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:37:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzi-0004kr-0m
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:06 -0500
Received: from [2a00:1450:4864:20::630] (port=36660
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzf-0008ES-Nq
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:05 -0500
Received: by mail-ej1-x630.google.com with SMTP id s13so11053468ejy.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9H9N+kG5pGxpKToPpsJsYrzR0IHZRGFKYL0I7BIFRw=;
 b=Q1x6E6Rl+AXaSXPodb3+ayLHXT3RpMSy+FXav2YEh4OgbVmmpWAbHnP0Dll3k9KQdv
 KjLqTAmQ0drgC7w9ai6F6BCkYWmlduVa13ZCfhu9MUfQVLSCpahd49jMzyKPwO1S2f4Z
 cgJMkyVyoU6ksQYZlP/xyJ7FWJXGZGFA182HNpNKcLqamCE+A3BMk/SUTe8Qnt9UYqw0
 B7F5+8kngHpigZ/CZiHR6QH1QxCbhrXoO7Z285AQvkgAFyUZC9W6kBtTMz6ng8TutV0O
 Ku4wMMh1OPHzVJRhv5ivOkT1cjnknIFqmvpIRowOfPvvL0c25I/fYqEl59BHkGp9WAe7
 XyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H9H9N+kG5pGxpKToPpsJsYrzR0IHZRGFKYL0I7BIFRw=;
 b=zBwtqdPYo/sqrler8rvamsLZ+4XNpiwwbbC9xdABj1dZ61DLCGHDqVubptBHNhBevU
 V+IckxqoNDkgFGWWSKu255RjbGqra3/1BFvnn2IvZ7uV23BydckJMYq18OUCQrFeerHC
 joGfjSdWbFrn3+Fyqg8CqnptWKVeONZJ5v56FV1VANjMEVTjP9HKib6920tOXyoSEi5n
 fP/zyTZzKv70WnjCX0H4X701OlwwXxQCVqc1694jTQA8QhSa2YSTV3P34FoymmmdY+na
 qzkLqV/nyfIzMB/RpKpSNXVxl0NcOuHcruk2wsugDPC8sN6k7IjHV9Vjon+d5MWZpmv2
 mtjQ==
X-Gm-Message-State: AOAM530/0L2dAaFGtAGxdwFn0nrhrKFnXGN8T5qrjbnsyKc7D1o7iNM2
 I8rnb9H25T7zN45xJeTZRU2FP4Pb9QU=
X-Google-Smtp-Source: ABdhPJxT72XUsn4BOGAYWwh5EvGFVMx4AGZIldcvrtW8hrybOs2nnzJvtwNwTjcVvtfxv4inFCC7aA==
X-Received: by 2002:a17:906:4acf:: with SMTP id
 u15mr29776295ejt.469.1643909641547; 
 Thu, 03 Feb 2022 09:34:01 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/27] Next batch of Meson cleanups and conversions
Date: Thu,  3 Feb 2022 18:33:32 +0100
Message-Id: <20220203173359.292068-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main news here are the usage of .allowed() and .require() methods for
features.  These simplify a lot the generation of errors when features
depend on the results of compile or OS tests.  The reduction in LoC is
smaller than past conversions, but still not bad.

There aren't many tests left in configure; the most complicated ones
are for Xen and sanitizers.  The plan for configure is to host detection
logic for cross compilers, which would enable cross-compilation of pc-bios
etc. just like we do for TCG tests.

Paolo

Based-on: <20220121154134.315047-1-f4bug@amsat.org>

Marc-André Lureau (9):
  qga/vss-win32: fix midl arguments
  meson: drop --with-win-sdk
  qga/vss-win32: use widl if available
  qga/vss: use standard windows headers location
  configure, meson: replace VSS SDK checks and options with
    --enable-vss-sdk
  meson: do not make qga/vss-win32/meson.build conditional on C++
    presence
  qga/vss-win32: require widl/midl, remove pre-built TLB file
  meson: require dynamic linking for VSS support
  meson, configure: move ntddscsi API check to meson

Paolo Bonzini (18):
  meson: use .allowed() method for features
  meson: use .require() and .disable_auto_if() method for features
  configure, meson: move AVX tests to meson
  configure, meson: move membarrier test to meson
  configure, meson: move AF_ALG test to meson
  configure, meson: move libnuma detection to meson
  configure, meson: move TPM check to meson
  configure, meson: cleanup qemu-ga libraries
  configure, meson: move image format options to meson_options.txt
  configure, meson: move block layer options to meson_options.txt
  meson: define qemu_cflags/qemu_ldflags
  configure, meson: move some default-disabled options to
    meson_options.txt
  configure, meson: move coroutine options to meson_options.txt
  configure, meson: move smbd options to meson_options.txt
  configure, meson: move guest-agent, tools to meson
  meson: refine check for whether to look for virglrenderer
  configure, meson: move OpenGL check to meson
  configure, meson: move CONFIG_IASL to a Meson option

 backends/tpm/meson.build           |  14 +-
 block/meson.build                  |  51 ++-
 configure                          | 638 +----------------------------
 contrib/vhost-user-gpu/meson.build |   3 +-
 crypto/meson.build                 |   6 +-
 docs/devel/kconfig.rst             |   2 +-
 docs/meson.build                   |   2 -
 hw/acpi/meson.build                |   4 +-
 meson.build                        | 445 +++++++++++++-------
 meson_options.txt                  |  66 +++
 migration/meson.build              |   4 +-
 net/slirp.c                        |  16 +-
 qga/commands-win32.c               |   6 +-
 qga/meson.build                    |  55 ++-
 qga/vss-win32/install.cpp          |   2 +-
 qga/vss-win32/meson.build          |  52 +--
 qga/vss-win32/provider.cpp         |   4 +-
 qga/vss-win32/qga-vss.tlb          | Bin 1528 -> 0 bytes
 qga/vss-win32/requester.cpp        |   4 +-
 qga/vss-win32/vss-common.h         |   6 +-
 scripts/meson-buildoptions.py      |   2 +
 scripts/meson-buildoptions.sh      |  92 +++++
 softmmu/meson.build                |   5 +-
 tests/Makefile.include             |   2 +-
 tests/check-block.sh               |   4 -
 tests/meson.build                  |   2 +-
 tests/qemu-iotests/meson.build     |   2 +-
 tests/unit/meson.build             |   6 +-
 tools/meson.build                  |  31 +-
 ui/meson.build                     |  16 +-
 util/meson.build                   |   4 +-
 31 files changed, 637 insertions(+), 909 deletions(-)
 delete mode 100644 qga/vss-win32/qga-vss.tlb

-- 
2.34.1


