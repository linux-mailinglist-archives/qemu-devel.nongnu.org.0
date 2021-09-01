Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2063FDDE5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:41:10 +0200 (CEST)
Received: from localhost ([::1]:39906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRQL-00082P-4Z
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLROV-0006T7-Mp
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:39:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLROU-0007Fi-2x
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:39:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id n5so4840512wro.12
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UqUMom+hY9aP42PgfH9OfcN/iVMBIIkAkLcvi9Z0DM=;
 b=pVL2VRVi/YAnbr6yK2YZuLoPh+/wX7thf7/cy1A410BseOXbsuS8253/MjLLUiURXV
 yDErxxxdFXpPwVeo54K3vX5SUPS17mVsTePC1ca9ZSTYsHD1npSGofhPlP16uIsnmiBh
 ygp1Mmlnj6fKrUmzQv2W3CucQFsfyUSvpTdQpynJYgiKz7GpG1XgJLI0bTZMoOnxFtYk
 XmkcDcethwDooGnTW+ywdHs3WZFDmbyJ6+zzPIhkUkyWWMJT1Dc8eRXc67wODPowxk2I
 kdiYlER9OK6zRjXJvY+GzUBmRz/yQYyd/6G1NlFTxTpmQxMj99NGa1+8Ke+/JBUKPmRW
 CxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1UqUMom+hY9aP42PgfH9OfcN/iVMBIIkAkLcvi9Z0DM=;
 b=ceKqgCzxbt3wABhiy5M3eZPZHXGbRgIuOfKFAJIdc1q6ma0+GIhTILLB87dk22GshT
 ZDzkEu/ILmat64cuHtiCqNfIP5qyHwWB1ypcRPdJkjfOld/v+TgO1oIYd5F1vmB6A1ye
 4zlbPeyscOB6/sSW+PQZn+Jl58SsUoFauK7oVccQTMHgEVr0TClj6n6wy+a2axFbmwP6
 oLQgX7Xpm3UX34dMIqPvhHJSNcozHEtk++Dv5NIWzp/LBo17lk4317ajjF+GYabBSs4G
 mWz8AIHxNSKeBc5h0rNTaNflEspgN6c+g0CkFjBj60BO28b1QWyQ+XC+4PrK3mXseipn
 otaA==
X-Gm-Message-State: AOAM530KoiQvcOUNjUK0ELCVotIIy7LuUJrTximJRZEsQyoUGh5CgJAv
 2g12fx5sJ0/1RDuw5sY2CBSUsSu85D/9Sw==
X-Google-Smtp-Source: ABdhPJzgeURYzeKPbNaMrYfmwbbe5FuxvRATbVjwdShMXLIokEX2lXLY+hQ4b/96R8RmfhM+ygKUsw==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr37906623wrv.87.1630507152340; 
 Wed, 01 Sep 2021 07:39:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r10sm16907461wrc.85.2021.09.01.07.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:39:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] elf2dmp: Fix minor Coverity nits
Date: Wed,  1 Sep 2021 15:39:08 +0100
Message-Id: <20210901143910.17112-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity complains about a couple of minor issues in elf2dmp:
 * we weren't checking the return value from curl_easy_setopt()
 * we might divide by zero if presented with a corrupt PDB file

This patchseries fixes those.

NB: I have only compile tested this as I don't have any
files to test it with.

thanks
-- PMM

Peter Maydell (2):
  elf2dmp: Check curl_easy_setopt() return value
  elf2dmp: Fail cleanly if PDB file specifies zero block_size

 contrib/elf2dmp/download.c | 28 +++++++++++++++++-----------
 contrib/elf2dmp/pdb.c      |  4 ++++
 2 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.20.1


