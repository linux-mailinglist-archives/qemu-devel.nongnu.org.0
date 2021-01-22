Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FEC300D76
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:13:51 +0100 (CET)
Received: from localhost ([::1]:48194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32oY-0006rS-98
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32m8-0004ls-1H
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:20 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:40933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32m6-0004ZA-8Y
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:19 -0500
Received: by mail-pf1-f182.google.com with SMTP id i63so4549721pfg.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=icc1TShvpnTe/q4K1SdRU7PBPiZumeAtW4PX7446x3w=;
 b=pwYw+3GVaWsnyMyAlHBwYmCuIMSnmsNT/f4ScuD4qf4cCaYKP2DO3d6gkk1qvlr0Dr
 nif4Q7YQFx02HhVbVs4nIw7XtenyqrP7QnPY7x22zeOwK77a3hNxHGIk7r1M2KEzWTPT
 17UB2kUNxrasF6tF3ANfoeAyLduPpjYgymDrCLc0dOzUe23EBpKpoDDU7htwvLpU8BbK
 licatFU1Kq7QmAcihtqRo4wuexLHNBZK54lFSeBKqW/VXIcT3akBUR7cg1rjWWhmi8Yk
 +bFV4155e8826KoAuc3Ar84ebrohPRVLn9/fifqSKq+zWxkfwHV6T+TWEKgYv1zh7Yye
 57Xw==
X-Gm-Message-State: AOAM531sDVeqtCrzeGSGd6n6W8xxyeSSthOkP9B4CEWmgl8asdwfWhu5
 47RDKh7Zh8Qgjz0urW1qxWJ25uHdwdw=
X-Google-Smtp-Source: ABdhPJzDZUGmCGKb2NAnZeyEpwEWdU8hNQfAXwzBxGxZSbXxF3b8R3fhj+QAvzvKADMTkhfUQZJlDw==
X-Received: by 2002:aa7:83c2:0:b029:1a5:daa9:f22f with SMTP id
 j2-20020aa783c20000b02901a5daa9f22fmr6318689pfn.48.1611346275906; 
 Fri, 22 Jan 2021 12:11:15 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:15 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/11] iOS and Apple Silicon host support
Date: Fri, 22 Jan 2021 12:11:02 -0800
Message-Id: <20210122201113.63788-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.182;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f182.google.com
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

 configure            | 125 ++++++++++++++++++++++++++++++++++++-------
 meson.build          |   4 +-
 qapi/block-core.json |  10 ++--
 include/qemu/osdep.h |  11 ++++
 block.c              |   2 +-
 block/file-posix.c   |  68 ++++++++++++++++++-----
 net/slirp.c          |  16 +++---
 7 files changed, 192 insertions(+), 44 deletions(-)

-- 
2.28.0


