Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901D2EA34A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:23:40 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc0X-0002VO-Rg
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyA-0000mr-EW
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:10 -0500
Received: from mail-pl1-f182.google.com ([209.85.214.182]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwby3-0001x5-QB
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:08 -0500
Received: by mail-pl1-f182.google.com with SMTP id r4so15551156pls.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gzbtLxvimCjMqHa5wQM3+8F/SKklW6KNRbAOZvUSajo=;
 b=m3VALtaA1mC48R6xct4alVzVaNgMSUP9CYfkMYU9tVXmfa0a4VtFZo2gXSkCejTKC0
 HgGkYM4A/ulq2kN42uqIt5texo5ngwEHg3PVVjhlJesa75fYO6d1iBC44jfErm0OtPFc
 8Q/5NNSdfPeeSesFEdr9FiNYV/xFTnXP0XnvdjUg01i+FLy1vJqHPb9pfnU3Z0DMxRoB
 LJex7TeVxbfSUBKmg4rzsS13BZwJvwzqViwPX8oHbSDJJYL9FbJSe4FILK307HaOOzNV
 BJLAe6xrut5ukid9hnvfLfZRWMTTi0q+biHSQsBYTxPv4sCARNl9aPQ6Di7hCI813ZZE
 n96w==
X-Gm-Message-State: AOAM533gPJEJJTnfUYUHEZ1X+L4azxmITrW7IsT2kyc6ClQE80VUvwOj
 o1FQdnMuz4aQR+sKrPGUYRi7ikaY7PA=
X-Google-Smtp-Source: ABdhPJwLY9i0AHerKAChMs0+R910JUoTwnDiagZKXUtoYZl4/SglNHaGumHZxyVk2KUlOY1n3VUzPg==
X-Received: by 2002:a17:90a:8c87:: with SMTP id
 b7mr1867492pjo.158.1609813257982; 
 Mon, 04 Jan 2021 18:20:57 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.20.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:20:57 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/7] iOS and Apple Silicon host support
Date: Mon,  4 Jan 2021 18:20:48 -0800
Message-Id: <20210105022055.12113-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.182;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20201214140314.18544-1-richard.henderson@linaro.org
([PATCH v4 00/43] Mirror map JIT memory for TCG)

These set of changes brings QEMU TCG to iOS devices and future Apple Silicon
devices. They were originally developed last year and have been working in the
UTM app. Recently, we ported the changes to master, re-wrote a lot of the build
script changes for meson, and broke up the patches into more distinct units.

A summary of the changes:

* `CONFIG_IOS` defined when building for iOS and iOS specific changes (as well
  as unsupported code) are gated behind it.
* A new dependency, libucontext is added since iOS does not have native ucontext
  and broken support for sigaltstack. libucontext is available as a new option
  for coroutine backend.

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

Joelle van Dyne (7):
  configure: option to disable host block devices
  configure: cross-compiling with empty cross_prefix
  qemu: add support for iOS host
  coroutine: add libucontext as external library
  configure: cross compile should use x86_64 cpu_family
  slirp: update build flags for iOS resolv fix
  block: check availablity for preadv/pwritev on mac

 docs/devel/index.rst      |  1 +
 docs/devel/ios.rst        | 28 ++++++++++++++
 configure                 | 81 +++++++++++++++++++++++++++++++++++----
 meson.build               | 16 +++++++-
 qapi/block-core.json      | 10 +++--
 include/qemu/osdep.h      | 11 ++++++
 block.c                   |  2 +-
 block/file-posix.c        | 74 ++++++++++++++++++++++++++++-------
 net/slirp.c               | 16 ++++----
 qga/commands-posix.c      |  6 +++
 util/coroutine-ucontext.c |  9 +++++
 .gitmodules               |  3 ++
 MAINTAINERS               |  7 ++++
 meson_options.txt         |  2 +
 subprojects/libucontext   |  1 +
 tests/qtest/meson.build   |  7 ++--
 16 files changed, 236 insertions(+), 38 deletions(-)
 create mode 100644 docs/devel/ios.rst
 create mode 160000 subprojects/libucontext

-- 
2.28.0


