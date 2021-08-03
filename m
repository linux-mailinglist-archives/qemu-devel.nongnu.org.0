Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1AB3DEB82
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:04:12 +0200 (CEST)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsDS-0007ee-Cp
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC5-0005fU-Ty
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC3-0003hv-PM
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id z4so24886601wrv.11
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OYCpl50DZxhLH3tITCk4uHDLSNKZ7wOETmWXOXhPTbA=;
 b=PvACh1OOpsu4XDud3GCerK3Vbahuh93A4Q1C9XD7McNN1sBSYn3Gu7glU9KC/nc7cU
 kBc9XUoykCwTpxcUC4fdkW6agyVqjVDYNaKxoxZy9jFWyxG3fB5TVKgaRU7Fh+3tpmwb
 ZaR75bVMih+WyFc86Q1DoULknbE0A5hpjyBidcK6Lg/C+nS7wD+vhXWBBJDo4UUF9Wck
 3aYFalRmmnKG3q04nDRX8q0UY08QZoCZNVmLdhZSwU6Kw7H2PM1GHRl1VqqYnt3pa0X6
 yDNpPEMWe0LMTZuqO6ierN+JbL0O+IGeCiu0rW0tnmtMbZY/hlTGf9/aPG14N0xcW/vu
 WMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OYCpl50DZxhLH3tITCk4uHDLSNKZ7wOETmWXOXhPTbA=;
 b=e3Lr0teyM6kBe3pB0JbW0ZQH5km3nRbe1Eps/8yA+l+FNP8T9uhyj22FSHGpixP2ZN
 nWDlq6DGdaCJKl6r84YYjxdAMFF0RIPzsQgkpzKoGL7+Z8m4TUH2GhTW9ow4/zhEMZEy
 6C9S5S4k2S4fNeggLGN9G3X05to2SAMTT7hgbCywT7/jstAjXJLDiJqPwyPfRv+1XSpo
 7C2VkQWXyez6puzgyshWAY8X6jUh5dXC01Fp5H2VUM0bdtac2EJ0I9rlyNu4XkUJ1V5w
 IVXy/PyRBxoR+tm9UGfMxowPR5bBg4Jo+yAuLxkl/XXOVjkMCsjWCq/sIpEbbv0QKz5D
 ENGw==
X-Gm-Message-State: AOAM533UwjS8glSjEptl3oBvCFUkn+QkDcZQyFf+drEDRvVFaUpPf21D
 UrQAj/cnlv4+77g18F+ih8w2Kw==
X-Google-Smtp-Source: ABdhPJyF9+/Fzh0HNNdbVGnD6rHr6WPnPBZ0V32mjqk6pgmwH2zaFYdADAPhe48T+H8RBLuqlmaJVQ==
X-Received: by 2002:a5d:4b81:: with SMTP id b1mr21790583wrt.180.1627988562443; 
 Tue, 03 Aug 2021 04:02:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z12sm12729781wml.18.2021.08.03.04.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 04:02:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D33571FF96;
 Tue,  3 Aug 2021 12:02:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  0/3] check-tcg hacks for BSD
Date: Tue,  3 Aug 2021 12:02:34 +0100
Message-Id: <20210803110237.1051032-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, imp@bsdimp.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Warner,

Here are some hacks I made to nominally get the check-tcg system
working on the BSD user builds. The first step was installing GCC as
we skip clang for x86 builds due to inline assembly issues:

  ../src/configure --disable-system --enable-user \
    --python=/usr/local/bin/python3.7 --cross-cc-x86_64=/usr/local/bin/gcc10

and then at least "gmake build-tcg" generates some binaries. You
should also be able to drop a simple helloworld.c in
tests/tcg/multiarch and have something simple to start with. At the
moment all apart from sha1 segfault when run native. None of them run
under the user mode emulation. I leave figuring that out to the BSD
experts.

Alex Bennée (3):
  configure: don't override the selected host test compiler if defined
  tests/tcg/sha1: remove endian include
  tests/tcg: commit Makefile atrocities in the name of portability

 configure                           | 7 +++++--
 tests/tcg/multiarch/sha1.c          | 1 -
 tests/tcg/multiarch/Makefile.target | 6 +++++-
 tests/tcg/x86_64/Makefile.target    | 4 ++++
 4 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.30.2


