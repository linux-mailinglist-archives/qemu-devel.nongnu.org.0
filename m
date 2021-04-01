Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97907351378
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:28:41 +0200 (CEST)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuZ6-0005Un-Kf
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWD-0002eK-5j
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:43 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuW6-0001iB-Gy
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b9so1269720wrt.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXbcsxg/LkOYXWCS8QBEz2Cjpji+r/sSYoUyIZXDDHw=;
 b=vYtGvNPdWcG+WIOsmw4ntWGwUqZU0D62zViYJFaBUP5jru9qWREQjr5K0t+J/VrbRk
 RXwjgfIPYxFuuehbQv+oPZInmLpcT9mktEIzMxDEY+teRV30AfZjNDgxd4v7UKAS8+ew
 EpjyG1T/5+/dIkRdWE56mrgWEJfcr5+7lr14DC6zkIa+6dPxlHOU1rY2MaHjE4XPjNLe
 z9cI/xRKFjrQ03W3QAapit3r0jcV35i2LJDnjZH301U8SFjmoIVmHKiD+K+0X4r4+EvX
 LFBM3p7HFeKNN2izrV6skx97jxnOyJS7jdFabVEeOMhGWlQMyjH/ZjIK13AMY9h4vdZR
 CuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXbcsxg/LkOYXWCS8QBEz2Cjpji+r/sSYoUyIZXDDHw=;
 b=iAQIkQsN8CvGiEvozgZD9EKiwqi3YT+cNgnEJFkwzmNFGS6y8Wt2cgfDQtJilB4QtS
 AJdUMPugAP886jp/vg+mR1riUTX2pvw22aQDs3pyzawUSwP2GlUGc3fdSeO76Qdi1ZgA
 bOgRCuYqc7DqM7wZv4SRwShS5R7woa/QrJmUI2HsS4qCsZGPSnyAdTpDFP3SsRYweZ6x
 Uql5+8tFOKkMG+SE9UpsHK9u0RGnuud7EoZT6gcYthZ86l9v4/du7WznzoAk6CKyW06r
 MVO3hmmF0p/CywJv634dY4Qi1BlwZjH1oAXqkmqju5PUFrKScfD0YoBEykIIqta1n9jT
 WeYg==
X-Gm-Message-State: AOAM531CcbEG3FS5wP8znBCWu3GDiEArtF+G4bqXuYANfHfc51lCqoVO
 LkuW06nCdCAC9ZRm3G9Q8WGGyA==
X-Google-Smtp-Source: ABdhPJwNRnm1j3OeUQNaIh3rc91fwRnwaBNj5edU5mpLU7dVBq4YXZcUle/NRXzTVgdFhjd3appTpA==
X-Received: by 2002:a5d:5641:: with SMTP id j1mr8946566wrw.100.1617272732191; 
 Thu, 01 Apr 2021 03:25:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j9sm7430500wmi.24.2021.04.01.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FF7E1FF7E;
 Thu,  1 Apr 2021 11:25:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0-rc2 v2 00/11] various fixes, pre-PR (check-tcg, gdbstub,
 gitlab)
Date: Thu,  1 Apr 2021 11:25:19 +0100
Message-Id: <20210401102530.12030-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

A few more patches have been added:

  - gdbstub documentation
  - tweak the gdbstub sha1 test
  - tweaks for gitlab

as well as fixing the i386-linux-user cross compile case (including
detecting the support for -no-pie for cross compilers). Other than
that it's just review tags. I plan to cut the PR from this post on the
morning of the 6th in time for rc2.

The following remain un-reviewed:

 - tests/tcg: relax the next step precision of the gdb sha1 test
 - tests/tcg/i386: force -fno-pie for test-i386
 - tests/tcg/configure.sh: make sure we pick up x86_64 cross compilers
 - tests/tcg: add concept of container_hosts

Alex Bennée (7):
  tests/tcg: update the defaults for x86 compilers
  tests/docker: don't set DOCKER_REGISTRY on non-x86_64
  tests/tcg: add concept of container_hosts
  tests/tcg/configure.sh: make sure we pick up x86_64 cross compilers
  tests/tcg/i386: expand .data sections for system tests
  tests/tcg/i386: force -fno-pie for test-i386
  tests/tcg: relax the next step precision of the gdb sha1 test

Peter Maydell (2):
  docs/system/gdb.rst: Add some more heading structure
  docs/system/gdb.rst: Document how to debug multicore machines

Thomas Huth (2):
  gitlab-ci.yml: Fix the filtering for the git submodules
  gitlab-ci.yml: Test the dtrace backend in one of the jobs

 docs/system/gdb.rst                     | 63 ++++++++++++++++++++++++-
 configure                               |  2 +-
 .gitlab-ci.yml                          |  4 +-
 tests/docker/Makefile.include           |  5 +-
 tests/docker/dockerfiles/centos8.docker |  1 +
 tests/tcg/configure.sh                  | 42 +++++++++++++++--
 tests/tcg/i386/Makefile.target          | 16 +++++--
 tests/tcg/i386/system/kernel.ld         |  2 +-
 tests/tcg/multiarch/gdbstub/sha1.py     |  5 +-
 9 files changed, 126 insertions(+), 14 deletions(-)

-- 
2.20.1


