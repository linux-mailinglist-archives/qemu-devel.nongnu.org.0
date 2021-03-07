Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BCB32FE5B
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 02:41:27 +0100 (CET)
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIiQA-0004E2-1r
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 20:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiNy-0002uq-1b
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:10 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiNw-0005OC-Bn
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:09 -0500
Received: by mail-pf1-x432.google.com with SMTP id y67so4915019pfb.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 17:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TzOaQNEhZG9nHHaL4HtHFYDGg58mZAA6rANqQoS3144=;
 b=q1X9G72Xl3Y/JcWWxlVKZVtjyw3aAKBLGisH505aJ1F/Gfd6SKRC6Ii5UCDRtgp2Nu
 oqKROK5BtG6I5g0Op1ewwRX/ZnqNlUDmso+uysiM+QUe2LtXLMADqTAwNARjQOaXrloL
 hMid4lNG5qr0BQ8kv+aw79e8liak0htB5nZrLgXSYgFAdmbgvJTwzbf9te/twrdLN0y4
 kRN4TjTU8SNE642mJjdbK7oqKDqNtYAZ8TEL+6LV6t9oqKQ+XM4JTZaYcTziuwhxvfue
 veGxph3SeSWqTutHcw3Oq5NOrfCenma5NqQY8xw8iYSbaWl1NYnBaubdvkng7WtRCbZ0
 8HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TzOaQNEhZG9nHHaL4HtHFYDGg58mZAA6rANqQoS3144=;
 b=IqDh20Y6Ma4O9xRztW54vqRsw5TOecvcSzOUcv5uNkd+UNlA2VONFitjBSCrkO4Aqk
 m+wX8pDmWJ0hxLdTmWNK9GmM75MubHgiGBRBuoXq2eFbRM2yoi69oZZYjwLll3QSWyz4
 hcngPEU79k/F+kMUytKHsIVKp354Y1XgVVpg6LMP82qQHp4RlrnlhYaecvuXjxgl1N/u
 7CGVJuAlqJTxA6+lovwtEKBf6PHqFANi1y/MMMS/eNIIyrSgnXdWkjgsOAV6xNcESgsp
 uTLW2EMvoWYJ7w6R/eITiDLQiTdHfdzaAKlgQEzH0eigRx9xFfKbGfpby9+GwYDgspFi
 5AIg==
X-Gm-Message-State: AOAM530BiQhRHuXFB1GILCM+7WpUkFnbsZDOJ7N6WFdXHZjNF6eJqEQ1
 W7kYRLoEEttO+ZyX4A/1fiizW3ILdKBTiA==
X-Google-Smtp-Source: ABdhPJxGJoqNZzXvneUma8+PgOG1/c5I1+23n1/JcztAOroUllTB4xK9fjAVyfRD+DGhdrm/zQLZOw==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr14717191pgk.61.1615081146688; 
 Sat, 06 Mar 2021 17:39:06 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id v14sm6518044pju.19.2021.03.06.17.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 17:39:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Hexagon patch queue
Date: Sat,  6 Mar 2021 17:39:02 -0800
Message-Id: <20210307013905.115019-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-hex-20210306

for you to fetch changes up to 2526e69efd8e386573212bf3ea05171a727a598b:

  target/hexagon/opcodes: Add missing varargs cleanup (2021-03-06 17:35:43 -0800)

----------------------------------------------------------------
Add hexagon to include/exec/poison.h
Two Coverity fixes for target/hexagon/

----------------------------------------------------------------
Philippe Mathieu-Daudé (2):
      exec: Poison Hexagon target-specific definitions
      target/hexagon/opcodes: Add missing varargs cleanup

Taylor Simpson (1):
      target/hexagon: Fix shift amount check in fASHIFTL/fLSHIFTR

 include/exec/poison.h    | 2 ++
 target/hexagon/macros.h  | 4 ++--
 target/hexagon/opcodes.c | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

