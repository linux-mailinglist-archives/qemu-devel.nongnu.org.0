Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30843041E8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:13:59 +0100 (CET)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Q2Y-0006tQ-Re
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4PjQ-0005lo-Eu
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:54:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4PjG-00007M-Jw
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:54:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id g10so16802289wrx.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cm03RQiSEYDXV8VHX0ya1Lkfi4cY5HAbPrZ7w3Q7r6k=;
 b=nzoC/x/Y/GJ3qBdw4tqSwIYZdZLTyPm2x1mHbLTJ1GmYV8JlbAeYFukx/teGdamEc5
 RZLvd95VSNtWwo4OQ7pLTjSy+AK0ZVlou8EVXkktBCPP94YI/886LdHV4w9x9iKvjaM2
 MeF5r3cXWX6IjL5dD/0+ftcInySuFucrwPcRwc77LcgL263/8i9gzJ4kqx/wmx3Ql1oL
 SPnvnVrc04wigoxUUYrEpwqdMcm7q6KkqTLt9dwA8guNXwGO5nJhupGznyqaRN32snbu
 ykVH0sTVAGKwdtAO5L1u175byGJw9w2yaQL8UgQtp9Rru3hI8kG0Ph21u6W64ZEyj820
 ulJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cm03RQiSEYDXV8VHX0ya1Lkfi4cY5HAbPrZ7w3Q7r6k=;
 b=Bw4fHKHp6m4/EHEKYCvFFxV5xr35dkFXYijlqYOyveokJ4oWCxzIQvXXQG/mORtxjM
 Tjd1fJuK1wBUziG4ew0JbW86LW6FjpkZLLZY9lYAFMix3YWLjqF/luFb7UvSwt55pRpC
 1eU/7fmDR5m7JSKlxxsYnpoeV8R7tOWnQI+fOYwTsBNuR+a+iLprOgIvJfHw0s/lLEgw
 w7DW4F0nL1wlJ+hpf28EKjnHrY+Untdge+jNhppQtEmM6/6vnfEk8Obkta2X0Fm69Myj
 Jv4jnxbuxbSYANwHU+uquP5gjTNcBsSL/3beniinMAh8bH+Tohme2HNWYmFTD2xxwRv7
 q7gA==
X-Gm-Message-State: AOAM532RNMNkvwni6yVI3ZhtkZ3NvzaiHM58aE2AsPTikxcHbVBksZ9H
 8uwaU85aTbbf6HuBQwPYe6xwbw==
X-Google-Smtp-Source: ABdhPJw+1oA/Grhhykf1whh83pGvuE5XPZpDHolBcjPEqlxRJt++Pr8ZD/Mux9uemE7Tnnf8b/2RGQ==
X-Received: by 2002:adf:dc89:: with SMTP id r9mr6487741wrj.52.1611672840047;
 Tue, 26 Jan 2021 06:54:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm3537711wmd.15.2021.01.26.06.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:53:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08A8E1FF7E;
 Tue, 26 Jan 2021 14:53:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/2] meson fixups for check-tcg/softfloat
Date: Tue, 26 Jan 2021 14:53:54 +0000
Message-Id: <20210126145356.7860-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These 2 patches build on Phillipe's meson clean-ups to stop breakage
occurring with --disable-tcg builds.

Based-on: 20210122204441.2145197-1-philmd@redhat.com

Alex Bennée (2):
  scripts/mtest2make.py: export all-%s-targets variable and use it
  tests/Makefile.include: don't use TARGET_DIRS for check-tcg

 Makefile               | 3 +++
 scripts/mtest2make.py  | 1 +
 tests/Makefile.include | 9 ++++-----
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.20.1


