Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EF34CE76
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:06:12 +0200 (CEST)
Received: from localhost ([::1]:53064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpif-0001R2-E5
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfp-000051-BG
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfn-0004eC-GC
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e18so12400034wrt.6
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Gu2YxXLJJYf31qeyWe5L0mHeKKxwfIboHP5BIdWRsU=;
 b=xTYGcZnauP5f6huhhkk2nz/293H0h2PTwVbKZKWBjp0W+LJsxHhm2nxzt3JVH40XCR
 p6X5fhA0afKizYj/shBSHw5tJkj7NkXoLLW+8WjWNPRWV1Cip9w+3aAFqc5Fyp1Jp/es
 d7C+K8pRQelOTCx5PMRD7NSy/EFFL40O6kLbHz3wvVfirrhF4P6K9eIOMtiE8PTBf9XM
 1tCA4+RFWBciMCgiUos+wqLKCOmC2G1WL4yoG0DXJa9vbVguMHDNGuJzYG/qgkFpr1YE
 tDttjF8sR09zGYeHAcqf8SYcXYZ/vhYc21iPKdSw5q9YGHaL5auZmLnStmCiGa0Q8F5i
 fEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Gu2YxXLJJYf31qeyWe5L0mHeKKxwfIboHP5BIdWRsU=;
 b=AOVKo1EwDUcypnuN1ylvpwhknmIFen6SpYFaZbpXUEttyXBEI9oUxPqX04GKLjhCj1
 W0n06eOEpMjVYG2PS3TlLVd42tviCCD1wnv13BV5usOzwhKHFEpE1BdIln3v2astJiqE
 e/Ua1Rt+mAltplzl17vPZ0DZfaYbhVGGfuz05htjzIMjhoBafe6thNkZiriJCj7DdJEq
 sN9QmkgvFZZSQFUY/zzAQ5PiIh6CrkU1xpw9TOd3iHOCw/FLdB6eB1BuMeHVRWIW6NYC
 N6IxObxxcXlCEZkCYtivpQxiu1x6LBNGRAB+6eKjIHysYwC4cADC19lKYLEIz1UMx44G
 Mb1g==
X-Gm-Message-State: AOAM530KwRiZ5eEGrs+v5sSqg33WpYI2IhW4sb1DbNbvwtp07LbkS0U6
 HTzeNKuT0Djb8hpBW0c4a47zLg==
X-Google-Smtp-Source: ABdhPJz3UuCM3IfVMILiK013OacRw40ELQnpNND9nlsEzukkMNf8Oj6XMB3H+iiqTZyGKm1Fkb53gA==
X-Received: by 2002:a5d:4485:: with SMTP id j5mr27443312wrq.339.1617015785238; 
 Mon, 29 Mar 2021 04:03:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 13sm24318408wmw.5.2021.03.29.04.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:03:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 735F41FF7E;
 Mon, 29 Mar 2021 12:03:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0-rc2? v1 0/6] check-tcg for non-x86 hosts
Date: Mon, 29 Mar 2021 12:02:57 +0100
Message-Id: <20210329110303.15235-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The following are broadly just expanding our testing on arm64 systems
which I think is permissible on later release candidates but it's not a
major problem if they slip into the next release.

The latest arm64 CI box has access to a fair few cross compilers for
other arches thanks to Ubuntu and the fall back of Debian containers
covers a few more. There is an outstanding problem with the inline
assembler constraints for i386 16-bit code calls which I'm hoping
someone with more asm-foo than me can figure out the right runes for
it.

Please review (and test if you have access to !(arm64/x86) developer
boxes).

Alex Bennée (6):
  tests/tcg: update the defaults for x86 compilers
  tests/docker: don't set DOCKER_REGISTRY on non-x86_64
  tests/tcg: add concept of container_hosts
  tests/tcg/configure.sh: make sure we pick up x86_64 cross compilers
  tests/tcg/i386: expand .data sections for system tests
  tests/i386/test-i386: try and correct constrain 16 bit call (WIP)

 configure                       |  2 +-
 tests/tcg/i386/test-i386.c      |  6 +++---
 tests/docker/Makefile.include   |  5 ++++-
 tests/tcg/configure.sh          | 36 +++++++++++++++++++++++++++++----
 tests/tcg/i386/system/kernel.ld |  2 +-
 5 files changed, 41 insertions(+), 10 deletions(-)

-- 
2.20.1


