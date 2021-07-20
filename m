Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9A3CF959
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:06:40 +0200 (CEST)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oWF-0002A0-D9
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7T-0005O2-6i
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5o7R-0008DS-DI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 07:41:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id g12so12087150wme.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Q5LaEPrsl7nBYBKATWI/nXMQAEGNFKa7UPtM3D08ug=;
 b=qx47qGVbN4s2/sljzPh61gi0yfntXQtX5803EdUGXKpFvYn7RcIA4OECo182F+dy8d
 CwLc21YloSOBIpKKU3DI2WXDTpTPPk7bHs7/zo9UgbkoKzoFMlZrN+UgIV3WrY594kAC
 kiTbS1EmUnNikzT/llPaVJG5oNGqQpDumkbtKKr5bOSKCmIFARvfs5Wq8/B1Qis3O2gu
 ppv3lhr4yamtzZRIxs2y6FmDH6EtlSnPeqLU1kloIGhITLxfIUciZDnWWtBYhllAQVFh
 DI6Z1TVct1/yhdKILTt+5yofd+b0ileNdKLrvwx/5GnA+48w5ZmLmyrS9ZCsSnEUKV8g
 VojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Q5LaEPrsl7nBYBKATWI/nXMQAEGNFKa7UPtM3D08ug=;
 b=VUa/A+ArBNKas8cHS5qTXWmuvP3aDSmVxlMJucS7hSj33irPNtG4Fk+rCnwfM746rS
 8P+Oh/KoaZM6jhXvBgcFWL9QaQMnlRFVjdY1a4EdC+B0+qFuHttvICpQCYidsFn9nYze
 cUot0r/nfeubCaJgIPrDc5Vu2PamE062SvagXMbnFUcwKkIHrocsmQB+vNrlo1eYf1UB
 oSLIudH2UyQWsWVFavYYmegX8Gku+fZTgs6f++jwDo2ocNeHvprvKQgcPpYzGmwBdFjq
 CS1TLmIXEoXofz6fTrhIF5HQEanaE6Ql/iZjq07gxdrxtouruWYKCYl6WFCgrFKnA9CA
 3nmg==
X-Gm-Message-State: AOAM532FORA6ahY53U/q2oZkwbUmd8PR5I8FjUvCCAJ6XfXrK3MTT9Zf
 7aduI+TtUoE0n65kjF+PSBupZ0aoN7S+wA==
X-Google-Smtp-Source: ABdhPJzWRf+jHSjHon6JWqkW5wA+oGGk9TZGBbWr6N1BL57WjziltWlk0LrjLMwT6atW4ek/mWHPsg==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr36621760wmq.38.1626781259603; 
 Tue, 20 Jul 2021 04:40:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d8sm24426383wra.41.2021.07.20.04.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 04:40:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 647BF1FF7E;
 Tue, 20 Jul 2021 12:40:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1 v3 0/3] tricore fixes
Date: Tue, 20 Jul 2021 12:40:54 +0100
Message-Id: <20210720114057.32053-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This fixes check-tcg for tricore and adds a test to the gitlab matrix
so we don't miss it breaking again.

v3
  - added new patch for configure.sh
  - changed symbol for board

The following need review:

 - gitlab: enable a very minimal build with the tricore container
 - tests/tcg/configure.sh: add handling for assembler only builds


Alex Bennée (3):
  hw/tricore: fix inclusion of tricore_testboard
  tests/tcg/configure.sh: add handling for assembler only builds
  gitlab: enable a very minimal build with the tricore container

 configs/devices/tricore-softmmu/default.mak   |  1 +
 .gitlab-ci.d/buildtest.yml                    | 11 ++++++
 hw/tricore/Kconfig                            |  3 +-
 hw/tricore/meson.build                        |  4 +--
 .../dockerfiles/debian-tricore-cross.docker   | 34 ++++++++++++++++---
 tests/tcg/configure.sh                        | 18 ++++++++++
 6 files changed, 62 insertions(+), 9 deletions(-)

-- 
2.32.0.264.g75ae10bc75


