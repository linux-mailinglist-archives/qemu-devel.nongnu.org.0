Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89142B07C7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:48:46 +0100 (CET)
Received: from localhost ([::1]:51554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDu1-00016S-OB
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmT-0000sM-IH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:57 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmR-0003nW-Pw
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id b8so6277424wrn.0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j9ihxds/2HDlaiV5N2nhzW+drU76gxcV4Dtdhkb6rXg=;
 b=qyHIIIw8fy5CfBzhfHH61KPTh+uhQYh43cql4FPjhVmIGvhGgXxJPJQRSwy6/XDt3s
 seCaeWUEKCyJPvqqKz/t6PNNMIEQHy56JdkPp6pPvdJTDze0zjCDWEDtcyT0GMwMhn1u
 jN87zRXIMfTYnj3MygdC/HSb2fiKJrSaM3HPXtmOiZt3eR0nYn+AfTVIObcBvyQHkPIi
 xKa41L8fRn6ZUBwSVrL3C+nFT+bhuV7OeooLDVjLTbRp/2kkFsFLy2mJ1x57aKE5vU6Y
 whr2SUf7Op3HgErkUuZ5eFbp3JXZjp3vd/wRr0uBbJ6r4tS/xYAmTAH1BlrA2fVZMy1O
 0gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j9ihxds/2HDlaiV5N2nhzW+drU76gxcV4Dtdhkb6rXg=;
 b=h9he8TWFh4v5hcFVxpe0Uu3iBNeFWY4TC9qZwPd4LkBS6NAEFTdWXMdcNY+OR2M999
 QXjJkDpV8kv/8JwW4aIjn9up3wFbz7pT1woxBVyHzDhmp3T1//uHOEKEbxDSFT2zlAAC
 YpS/88o4fUnVcdAaYypnOi5Styh/Wb3J91xq1Jux3slX/aEWlo5Q9oSftMJ7ddxyYnOw
 ksK9Ue4llOUP0RNd5i2ZokUNlZaOrZD54KDawRn0AotCR2wMksDI4v0uL5gr3y7RRrox
 eVi+QmQ4s/VjjBOaLSZTSFu6Gj2VWVe4fpGmGzJHw7epy3kzQT4/odAw/I2iqFVuPEyr
 b0kg==
X-Gm-Message-State: AOAM5330eeYWt3kvelSUU7L2lQ5na/xFxaGrGQDC1MLGU/+OrIcON3T8
 mzbWrm92JQn20LlcB1eScC9xG5y2ytFwPw==
X-Google-Smtp-Source: ABdhPJxpF0ldTJb7kfMnGihbjee/nJV/AGvdQjv8hA1ORLzjZx4J9lToOq3SyaWrVgzrpW6kKYfxaw==
X-Received: by 2002:adf:e992:: with SMTP id h18mr26732791wrm.356.1605192054150; 
 Thu, 12 Nov 2020 06:40:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 9/9] docs/system/pr-manager.rst: Fix minor docs nits
Date: Thu, 12 Nov 2020 14:40:41 +0000
Message-Id: <20201112144041.32278-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a couple of nits in pr-manager.rst:
 * the title marker for the top level heading is overlength
 * stray capital 'R' in the middle of a sentence

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/pr-manager.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/pr-manager.rst b/docs/system/pr-manager.rst
index 3f5b9f94dcd..b19a0c15e66 100644
--- a/docs/system/pr-manager.rst
+++ b/docs/system/pr-manager.rst
@@ -1,8 +1,8 @@
-======================================
+===============================
 Persistent reservation managers
-======================================
+===============================
 
-SCSI persistent Reservations allow restricting access to block devices
+SCSI persistent reservations allow restricting access to block devices
 to specific initiators in a shared storage setup.  When implementing
 clustering of virtual machines, it is a common requirement for virtual
 machines to send persistent reservation SCSI commands.  However,
-- 
2.20.1


