Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7E42A3A2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:50:08 +0200 (CEST)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGIJ-0006I8-E3
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiW-00009a-0P
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:09 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFiU-0007Sa-BZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:07 -0400
Received: by mail-ed1-x533.google.com with SMTP id r18so79803231edv.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TE4g8Zx4S/IO/wCmPK5d4R9Har1UuxF0zo9241BU1Rg=;
 b=Aml+QrTFEFWMjID9KBEuQLVxl3WxLNmrrP+DOHGjoGXGLs1LVoIFr4+a2UognZ/VOm
 axpzD9YmIq8WHk2X3Y2V3OFkxy1bf38zjIoFNLnISJOJCZQ67ETJTu/0i3XDKxWLxaXB
 OOjGc6EGvr7zGQOkDOiB664UqRimgvscqOwYzSoG6B916pLXqGic5cOzLQjeK2mQ2nIl
 r7iwDIJH3MJMWpSErKvRdhjRHAfGw+MutJ039Dx+PpRCq8tKpkeZS6gvoQ2LNcSA2eRZ
 izuFYuXP9LggrtStGzFDq/iHMMs/wEjOxCxNdvknhdlJDXVBed4rgJGGIhI0z3gbxxs5
 4FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TE4g8Zx4S/IO/wCmPK5d4R9Har1UuxF0zo9241BU1Rg=;
 b=q1iPtAroOxUnSCOOWK5Q//yW4iUUw7rM2+5MwevxF7yFa3aIcUKgvjROKWjd3vsZD3
 FJWEciIt28FoDZWwBCB3QW6GkPJxTConUZ2Yz+1fTatGtUBLogORMeGBUdmILB4P8jm8
 Yu8snqYCEe91RHWJuATHEsxQVh004WGAaKQCBcvTfn6ifwwqMvIuRSlIEmUEJMoIgOGh
 UdUsl/SGlSbLBILeJpdo5KOcl/MbCkhKL2suBFCVI5AGSGatTxugcOITZt4e+bJAqhPQ
 aFZs0mFcLMjF1yIr6UvZOICzj22MHLR38tzaq18qYuA/MQ0T4SyH9Id+MiQR7S/lYv7C
 +O0g==
X-Gm-Message-State: AOAM533LXCxzyHQ3B1Xn86yQ1XGZIoft70szqqu7JW081K+WgQdoR+Sa
 /8OddR7RKI4YUbc5JxYrvrFC8IgalZo=
X-Google-Smtp-Source: ABdhPJzaOXSAruRKNqxMJ9ibPeuZi5tdYZSpZzDx1T8dS1oBpjFAVTzawCwEvp5elj9LcUhp/CP8SQ==
X-Received: by 2002:a05:6402:348a:: with SMTP id
 v10mr26744066edc.0.1634037184201; 
 Tue, 12 Oct 2021 04:13:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] configure->meson queue for 6.2
Date: Tue, 12 Oct 2021 13:12:38 +0200
Message-Id: <20211012111302.246627-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is my queue of test conversions to meson for 6.2.  This includes
especially:

- patches 1-5: converting audio driver detection; also adds
  --enable-* options for all audio drivers, so that they are more
  similar to other drivers

- patches 6-7: converting fuzzing configuration

- patches 8-9: converting trace backend configuration

- patches 23-24: automatically generated command line parsing
  for options in meson_options.txt

Most of these patches are months old, and I only included them now
because I had already enough issues with the version update...

v1->v2: enable netmap on non-FreeBSD [Thomas]
        fixed issue with ATOMIC64 patch ("cat" line snuck in)
        added backwards compatibility options [Marc-André]
        added "This file is generated" header [Thomas]

Marc-André Lureau (1):
  configure, meson: move Spice configure handling to meson

Paolo Bonzini (23):
  configure: remove --oss-lib
  audio: remove CONFIG_AUDIO_WIN_INT
  configure, meson: move audio driver detection to Meson
  meson: define symbols for all available audio drivers
  configure: add command line options for audio drivers
  kconfig: split CONFIG_SPARSE_MEM from fuzzing
  configure, meson: move fuzzing configuration to Meson
  trace: simple: pass trace_file unmodified to config-host.h
  trace: move configuration from configure to Meson
  configure, meson: move CONFIG_HOST_DSOSUF to Meson
  configure, meson: get HOST_WORDS_BIGENDIAN via the machine object
  configure, meson: remove CONFIG_GCOV from config-host.mak
  configure, meson: move remaining HAVE_* compiler tests to Meson
  configure, meson: move pthread_setname_np checks to Meson
  configure, meson: move libaio check to meson.build
  configure, meson: move vde detection to meson
  configure, meson: move netmap detection to meson
  configure: remove obsolete Solaris ar check
  configure, meson: move more compiler checks to Meson
  configure: remove deprecated --{enable, disable}-git-update
  configure: accept "internal" for --enable-capstone/slirp/fdt
  configure: prepare for auto-generated option parsing
  configure: automatically parse command line for meson -D options

 Kconfig.host                  |    4 +
 Makefile                      |    8 +-
 audio/meson.build             |   23 +-
 block/meson.build             |    2 +-
 chardev/meson.build           |    2 +-
 configure                     | 1263 ++-------------------------------
 docs/devel/build-system.rst   |  132 ++--
 docs/meson.build              |    2 +-
 hw/mem/Kconfig                |    3 +
 hw/mem/meson.build            |    2 +-
 meson.build                   |  421 +++++++++--
 meson_options.txt             |   46 +-
 net/meson.build               |    6 +-
 scripts/meson-buildoptions.py |  156 ++++
 scripts/meson-buildoptions.sh |  269 +++++++
 scripts/meson.build           |    2 +-
 stubs/meson.build             |    4 +-
 tests/qtest/fuzz/meson.build  |    6 +-
 trace/meson.build             |   15 +-
 trace/simple.c                |    2 +-
 ui/meson.build                |    4 +-
 util/meson.build              |    4 +-
 util/qemu-thread-posix.c      |    5 +-
 23 files changed, 1023 insertions(+), 1358 deletions(-)
 create mode 100755 scripts/meson-buildoptions.py
 create mode 100644 scripts/meson-buildoptions.sh

-- 
2.31.1


