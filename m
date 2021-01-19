Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C642FBE89
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:07:19 +0100 (CET)
Received: from localhost ([::1]:34740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vPS-0001QP-1X
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAv-000109-Hb
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:19 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:47092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAr-0003mV-9B
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d13so20563977wrc.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oabRyjConZxGU70eYF6gGyXf77dUSxyMRnQPLVZKUQ=;
 b=qcGregE9SADL56W5SnPVeUDsTLF0ts8ywmfbO5j5yeSVx0KIEK64kEgqlvb929TISI
 /XLRpbRn+jmrTl0Vs4dyHeheBzEmxltGIDafcQ+7JXwSeEzBprVzPs1rx2nlNU2En7fZ
 PJ7ibpPlZxJEIQ6OIshwgimMzhghknF3iFrTJYwOh47GQWjreSrhMb7AxNOIQ1YI9zGg
 sI/7G8o8dd6bqL+qZex9C08+JCBD0pmtqnl2NKXYebgGSH3UOsIInfCrrmG7N/JMaUck
 ge+AtdxnAfNnP/bG2ySHQacyHFuxqeCQi2DZKoO46buua1akS+WPxuQJ1IdZ30ABiWyN
 OgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oabRyjConZxGU70eYF6gGyXf77dUSxyMRnQPLVZKUQ=;
 b=pmtTc3yUopZLLB1kIXSm7fPhz4j5MAXOFcOrny3F8fgi3/tWJDGoJ9FoNGFzGDtKbm
 WaGh15j/vwfRSpe+KiZp+4ttyXJbe8k1clwRc14dUl80DP725q11aZRD46yOYU9zIob+
 O0qspoee1Oc3h1i8tcAMcqj5G3KhzIcYc1A3cJIC7Yutg3+dHG/om+r6tYu6BIz1XsZG
 7tQuf4tEn9ngI/JKEPia4FE8O/5SDhG4R8iWjmPfFbbT03Acsc2Fhd4tRImMmAU6kjZa
 Jj0w7YTZtKQ33i7zWOQDapCg+5W6vEEPzaRXwa5VRtokNj5WmsvOHKyQBChiAdKOMpCt
 SbpA==
X-Gm-Message-State: AOAM5322Da5dSw+Fsr+Qvw8E5O9nZGjedfuqhRUatGdDklFiwDaeAUWg
 xx2aCphqiKzeKpzWhaQ13kp0iQ==
X-Google-Smtp-Source: ABdhPJzIp47jyyK0DwHV7nRBYhxaC3Z+gJcdunPRDRe1i+xnAixnxIRPKIzCjioGpGtPB0md2CnSRw==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr5445291wrw.386.1611078729894; 
 Tue, 19 Jan 2021 09:52:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm38380971wrw.58.2021.01.19.09.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:52:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BE841FF7E;
 Tue, 19 Jan 2021 17:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/6] testing/next (docker binfmt tests)
Date: Tue, 19 Jan 2021 17:52:01 +0000
Message-Id: <20210119175208.763-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The testing updates keep on rolling. Promoted by some fixes from
Phillipe I decided to expand the testing of the binfmt code. This at
least ensures that any binary copied into the docker container has
enough bits to be functional.

The following need review:

 - tests/docker: add a docker-exec-copy-test
 - tests/docker: alias docker-help target for consistency
 - tests/docker: preserve original name when copying libs
 - tests/docker: make _copy_with_mkdir accept missing files

Alex Bennée (4):
  tests/docker: make _copy_with_mkdir accept missing files
  tests/docker: preserve original name when copying libs
  tests/docker: alias docker-help target for consistency
  tests/docker: add a docker-exec-copy-test

Philippe Mathieu-Daudé (2):
  tests/docker: Fix _get_so_libs() for docker-binfmt-image
  tests/docker: Fix typo in help message

 tests/docker/Makefile.include         | 26 +++++++++++++++++++++++---
 tests/docker/docker.py                | 23 +++++++++++++++++------
 tests/docker/dockerfiles/empty.docker |  8 ++++++++
 3 files changed, 48 insertions(+), 9 deletions(-)
 create mode 100644 tests/docker/dockerfiles/empty.docker

-- 
2.20.1


