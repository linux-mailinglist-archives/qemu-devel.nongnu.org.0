Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A60301320
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 05:58:18 +0100 (CET)
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B05-0008Or-D1
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 23:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3AyU-0006ow-HU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:38 -0500
Received: from mail-pj1-f49.google.com ([209.85.216.49]:39713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3AyS-0005nn-TN
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:38 -0500
Received: by mail-pj1-f49.google.com with SMTP id u4so5146126pjn.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GfmN8+k8bpalQAFt/BzjipX2jw4rkS8kDrDJdSzb0Pg=;
 b=cxl3h5zEDfTVWzr69jJTlTf1Uj9oXE+EE8gdRPFu4udBe99WB42hbALp9+NR3F8ymV
 AF/kDabr9vGU3OKNJi+Wwhcerhna3ou01jvblIZ33AbCzDRUJHEFI9bB2bE7LYBeJfRW
 cQmGfgrYaNx15T7HP9h7JRZMUYJh9DZOQP+8Au8RXtsG6l4wskDpygrI2KtJrMNiNZ7D
 gkcOTPRYclrDQ8nAbX65YqxUu1LudV27haN6+MuirFOSdUk4SkUZ463XEf9h87TyEWgJ
 6yLzYnomUOx3OU6EZ+0J0+rQMNQBanNk6NUukxTWxwqATRn8OcMLPECrRr002hSD+95/
 LEwg==
X-Gm-Message-State: AOAM531e/7aSSeCJJ1yaxiqiQhJSi9j1imChqjhy+XHivOv9eFS+xbBw
 TYkDFgGrmMm9lWtfEnxSddZcF+UoLyI=
X-Google-Smtp-Source: ABdhPJx8/eX2gwYfUZa/1oR/kFaQIhutDyeq+ZwK7TLfIjQOFoV9twBnkdbNk3wqZcE0RVUlo682Ng==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr9196000pjo.85.1611377795002; 
 Fri, 22 Jan 2021 20:56:35 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:34 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/11] iOS and Apple Silicon host support
Date: Fri, 22 Jan 2021 20:56:21 -0800
Message-Id: <20210123045632.18482-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.49; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

These set of changes brings QEMU TCG to iOS devices and future Apple Silicon
devices. They were originally developed last year and have been working in the
UTM app. Recently, we ported the changes to master, re-wrote a lot of the build
script changes for meson, and broke up the patches into more distinct units.

The bulk of the changes allow for cross-compiling for both iOS and macOS running
Apple Silicon and adds feature detection for parts of QEMU that are not
compatible with iOS.

Since v8:

* Moved some feature checks to meson.build
* system() stub return error instead of assertion

Since v7:

* Removed libucontext (will be submitted in another patchset)
* Removed slirp build flags update (superseded by subproject patchset)
* Reworked all patches to use feature detection instead of #ifdef CONFIG_IOS
* Added feature detection for CoreAudio
* Fix various cross compiling issues on macOS

Since v6:

* Dropped the Apple Silicon JIT support patch (superseded by another patchset)
* Changed libucontext to be a Meson subproject
* Cache availablity check for preadv/pwritev on macOS 11 and iOS 14

Since v5:

* Fixed some more instances of QAPI define of CONFIG_HOST_BLOCK_DEVICE
* Fixed libucontext build on newer version of GCC

Since v4:

* Updated QAPI schema for CONFIG_HOST_BLOCK_DEVICE
* Updated maintainers file for iOS host support
* Moved system() changes to osdep.h
* Fixed typo in libucontext meson.build change

Since v3:

* Moved mirror JIT support to a different patch set.
* Removed dependency on `pthread_jit_write_protect_np` because it was redundent
  and also crashes if called on a non-jailbroken iOS device.
* Removed `--enable-cross-compile` option
* Fixed checkpatch errors
* Fixed iOS build on master due to new test recently added which calls system()

Since v2:

* Changed getting mirror pointer from a macro to inline functions
* Split constification of TCG code pointers to separate patch
* Removed slirp updates (will send future patch once slirp changes are in)
* Removed shared library patch (will send future patch)

-j

Joelle van Dyne (11):
  block: feature detection for host block support
  configure: cross-compiling with empty cross_prefix
  configure: check for sys/disk.h
  slirp: feature detection for smbd
  osdep: build with non-working system() function
  darwin: remove redundant dependency declaration
  darwin: fix cross-compiling for Darwin
  configure: cross compile should use x86_64 cpu_family
  block: check availablity for preadv/pwritev on mac
  darwin: detect CoreAudio for build
  darwin: remove 64-bit build detection on 32-bit OS

 configure            | 104 +++++++++++++++++++++++++++++++++++--------
 meson.build          |   9 +++-
 qapi/block-core.json |  10 +++--
 include/qemu/osdep.h |  12 +++++
 block.c              |   2 +-
 block/file-posix.c   |  68 +++++++++++++++++++++++-----
 net/slirp.c          |  16 +++----
 7 files changed, 177 insertions(+), 44 deletions(-)

-- 
2.28.0


