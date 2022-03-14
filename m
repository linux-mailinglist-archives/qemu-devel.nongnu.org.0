Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF6B4D8B28
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:55:23 +0100 (CET)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToug-00064Y-VN
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:55:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToc9-0006pY-TM
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:13 -0400
Received: from [2607:f8b0:4864:20::102b] (port=55913
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToc7-0007ru-DU
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:13 -0400
Received: by mail-pj1-x102b.google.com with SMTP id e3so15262066pjm.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePqS7KcCYRI+zbSFNBRyzeiobZ1cBNiMLYdZj0WPOf0=;
 b=QdzK122z1HpLlzJdnyP//LwwA8xrctrqtU5NS3nv2rIyGeA7nodSrgAkS4tAJlQU0c
 ZVL9Fa9fvbgoimDVJVn7JOER5E+WGrHmpUsLIUOnBNaNJwzM2ZwFfDxvyYYL+N2XfGe3
 M7+ZAgr24oTxp1gMBGDRj3YhDkQ4M6ojmsCRo5fl6WyDm28rOAzPFlP6qDzEZg1ch30f
 uoJgxQOwKL1gjTQbU7YjfGGH06+AZD/PGOQlvldizB6BbDuptaDzTfMR2O+NPg63leTz
 0xcG+qN2QPl6T3OsaJQciLZ4uZlSKiJAHP0d69BM+qVL+f2KpQ5ThR7xHRva2P5GsAlP
 HjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ePqS7KcCYRI+zbSFNBRyzeiobZ1cBNiMLYdZj0WPOf0=;
 b=t7PBzuXVyy2ZTMnU1LPnWIZRmaLT/Si8fhuINXoolLy/Vryx5hw+x90xSaKHcG4Pi7
 Dkpe51AfK6Wd7Zy8MPHJvS5aZwyYKn1sYRk19+Mtg5fxxHN17gK9vE161AdFAdhybhQN
 b9tbMAL/vUlTyt++N5QQQ7O9KcqlEdK+tdVHgW1ceFVBjgu7cqAIpgZRl+3qLu1qOrmh
 Vjl9obRY566iGmh8rhOsiSKk90RogYV1kRJyk3uVYVL+Z5AA2/aIwEAsdrdwE8H0UdH4
 GgfVLjtSvdEgWyYPY2c+DoD1Uc+Om+Iz0JykOgJQIsoVKo/jcaPkk586bYCNkAdrF+Vo
 +xqw==
X-Gm-Message-State: AOAM531ANqt0w+2w/GLOGy26a/8VH10VqCBzx6BjlFtN59GP7pvUMP+P
 4oSBvTUNGLfBEHSA8t33ZMZUUhxrvbGy+Q==
X-Google-Smtp-Source: ABdhPJxzbNOeooGZ8iykqIBH6tHMTsiyblpgw3cd11JfOfObVsU0o3sFTQwt4Jw7JMAAQbrDTMTyFQ==
X-Received: by 2002:a17:90b:3a8c:b0:1bf:c2be:b4b3 with SMTP id
 om12-20020a17090b3a8c00b001bfc2beb4b3mr359587pjb.68.1647279368634; 
 Mon, 14 Mar 2022 10:36:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g24-20020a17090a579800b001c60f919656sm113847pji.18.2022.03.14.10.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:36:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] tcg patch queue
Date: Mon, 14 Mar 2022 10:36:03 -0700
Message-Id: <20220314173607.145630-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The following changes since commit 15df33ceb73cb6bb3c6736cf4d2cff51129ed4b4:

  Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20220312-1' into staging (2022-03-13 17:29:18 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220314

for you to fetch changes up to 76cff100beeae8d3676bb658cccd45ef5ced8aa9:

  tcg/arm: Don't emit UNPREDICTABLE LDRD with Rm == Rt or Rt+1 (2022-03-14 10:31:51 -0700)

----------------------------------------------------------------
Fixes for s390x host vectors
Fix for arm ldrd unpredictable case

----------------------------------------------------------------
Richard Henderson (4):
      tcg/s390x: Fix tcg_out_dupi_vec vs VGM
      tcg/s390x: Fix INDEX_op_bitsel_vec vs VSEL
      tcg/s390x: Fix tcg_out_dup_vec vs general registers
      tcg/arm: Don't emit UNPREDICTABLE LDRD with Rm == Rt or Rt+1

 tcg/arm/tcg-target.c.inc   | 17 +++++++++++++++--
 tcg/s390x/tcg-target.c.inc |  7 ++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

