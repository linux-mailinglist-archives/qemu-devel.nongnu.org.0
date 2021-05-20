Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EBC38B567
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:45:19 +0200 (CEST)
Received: from localhost ([::1]:46262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmjQ-0005hE-P2
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhR-00038r-8U
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljmhO-00012w-R1
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:43:08 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so5942877wmk.1
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wXw6RxksYVynvFyLhUEmU5JolFWz3vEepVAN7VDbCFs=;
 b=uIo5aovn82Uos0u3ufbwB4q0opKVM068zT6vW+OrjsuOiwQdoalzxDECB66nR08zN2
 ibDvRQFeiM32EBw7pTw+49bcvEtaB5FciiOtsIJsvh6CCP4BfoTp0JXxotMvQLEnXdnD
 yGQeixJ4WSvNv2HOGM/aYzNZhCqDFMCTLkGIMfcntQK42GV30nPlpw/14pIelmLic9ca
 2wme/tcbcitHSJVzLuThOHATDYLIMphU3LU8ew50t20twEJJMVIRZsKBVozj+RXJIxfK
 Ob1JcAmpikMC3miEz/x7kZ5z1K4y0wqlNXTQoWzn/wWHtKToO5wnlPKSZQMDjcVEy56T
 cH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wXw6RxksYVynvFyLhUEmU5JolFWz3vEepVAN7VDbCFs=;
 b=OMs7tS7rMiVLmcdzSbXxnPB/dg0SWWqLNS/hAnWlEcjGAnFr3wLFfnPrYNROWBj6g2
 FDBDykPYedB4vU5Ie8m0lKNL/vP3tx2Js2zpk1Pix0ueWC+DVCnuSiKTEKbPUUYIESHG
 xv5bLry0nM43LcW/87RiEJDgumW5AEQeD1naeC26szJQUlH324pBE0X8VZHYKduW8C9E
 i4Lxrym8QZpGiBH8gagJX68qryBNd5pUtrSOMfnYz+rFP+WS/K7CKy4NtXDYHr5Xwvuu
 m947eunmyCVJrFuQnFUlKD3IAv2ugLYFrN+vTV39qc5YcxivmF+cpeHvjoFKuVuGV0T7
 52Dw==
X-Gm-Message-State: AOAM5313g+JBVc5NnHJMQ8yxBHOdJO4QMA0iKN+JqzbsAL5Lx5hGkgUK
 ltDtknKfIMQNgIqKJmDsxKZhLw==
X-Google-Smtp-Source: ABdhPJwx9PkPlvN9P9obcNGEXnu8JjhGTe7UShgIu4q6X2olOQYJ1zvUaj/isSAqryevmbthR8ae+Q==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr5257208wmc.1.1621532585134;
 Thu, 20 May 2021 10:43:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x16sm4306004wrp.6.2021.05.20.10.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 10:43:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E63A1FF7E;
 Thu, 20 May 2021 18:43:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/8] various misc fixes (gitlab, gdbstub, plugins)
Date: Thu, 20 May 2021 18:42:55 +0100
Message-Id: <20210520174303.12310-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

My various maintenance trees each had a few fixes that are fairly
uncontroversial and ready to go, including a recently baked fix for
hexagon-user tests. I thought I'd better collect them together and get
ready for a fairly quick merge so they don't get held up behind other
stuff that's still cooking.

The following need review:

 - gdbstub: tidy away reverse debugging check into function
 - gdbstub: Replace GdbCmdContext with plain g_array()
 - gitlab: explicitly reference the upstream registry
 - tests/tcg: add a multiarch signals test to stress test signal delivery

Alex Bennée (5):
  tests/tcg: add a multiarch signals test to stress test signal delivery
  gitlab: explicitly reference the upstream registry
  gitlab: add special rule for the hexagon container
  hmp-commands: expand type of icount to "l" in replay commands
  gdbstub: tidy away reverse debugging check into function

Mahmoud Mandour (1):
  plugins/syscall: Added a table-like summary output

Philippe Mathieu-Daudé (2):
  gdbstub: Constify GdbCmdParseEntry
  gdbstub: Replace GdbCmdContext with plain g_array()

 gdbstub.c                           | 343 ++++++++++++++--------------
 tests/plugin/syscall.c              |  98 +++++++-
 tests/tcg/multiarch/signals.c       | 149 ++++++++++++
 .gitlab-ci.d/containers.yml         |  30 ++-
 .gitlab-ci.yml                      |   2 +
 hmp-commands.hx                     |   4 +-
 tests/tcg/alpha/Makefile.target     |   7 +
 tests/tcg/multiarch/Makefile.target |   2 +
 tests/tcg/sparc64/Makefile.target   |   7 +
 9 files changed, 459 insertions(+), 183 deletions(-)
 create mode 100644 tests/tcg/multiarch/signals.c

-- 
2.20.1


