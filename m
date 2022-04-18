Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83550547D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 15:08:26 +0200 (CEST)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngR7B-0005Ng-9f
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 09:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPDT-0007Uh-SF
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:06:49 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <natalia.kuzmina@openvz.org>)
 id 1ngPDR-0005Xu-45
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 07:06:47 -0400
Received: by mail-lf1-x12d.google.com with SMTP id u7so23622376lfs.8
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 04:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c5WuC7LIBEPpZc/Qm2EzCxMC4U+NSyuBs+KpxPnHW7U=;
 b=06ALGvRb2P0hAb3x7A9F40Xm3SldNln3gsBJ1U7ZEWPkZRLK86D05xGLZ868p8Y9RV
 3RqIITTh3DOYgDAgf75Frmrjh0bPvmEIKcHNuWA3PA078A9JkX2dhLnBTwJYBy6EPbdI
 sz5eOXB0M4amdvxfhJKigOzQwthEppfj2JkBsKo1T6A1C/iDIixkhhVP8zwfAkugv78x
 HXmsuZlgW5OkKXqELA5P1vPYnt5AJQnq4gwiksFO3mCU06isbKuZP2dOu0ITDgdwn6A4
 idli3kWo5Df9S4G/FcuqPoemeovc8a2pH+1ixqgsIAn0EPCoyXsVMc8fw6Im79XA/Db2
 ZOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c5WuC7LIBEPpZc/Qm2EzCxMC4U+NSyuBs+KpxPnHW7U=;
 b=oSGpzRyMPXMyK77ZiaaP+tvdVgO+E631RkKtSgsKBxL4v2aLB+edsM+ByfL/ux9+2Y
 I1Rb/c2pU9XF5kS6CPEPAWfJBlHTrNm2/WD5NZVGR6yFV4wUqOYauqpAOoxLbbPivohA
 DaQ/SetOGq/7NqjeDu//zQk4oHLFVS9zl2aYlH2U6dGwmcDcMkzMTSX7u7ijayuZqJuV
 BoNu+ZpXis4l2rmF+GomR6nC4E+FnDWem/zKFpAvqpeiVheLdKSFUpYSmAxc9mG/8Ro2
 HnCZAUmOl1zASluoL8/AaZ1Ol4H8BGwv/RvmQw0+NXu7b8KKddUCU1YsNwXnuMob/DKd
 JRCA==
X-Gm-Message-State: AOAM531U/YreHFxJZZq1xLN4Eafn+pbjkJ0q3svllJaeQOflYiQCkHsF
 c5Dgy9V5R6N9Kf2XyivdQusrs9FpyMOu
X-Google-Smtp-Source: ABdhPJymgFbDcshJkby9omCyidZVpqX5d1VFINV31zs2Js4duWFCzu2zUA3MlmkZ6Q+jGaMAQk17fw==
X-Received: by 2002:a05:6512:11c5:b0:46f:b725:d97b with SMTP id
 h5-20020a05651211c500b0046fb725d97bmr7728536lfr.394.1650279996501; 
 Mon, 18 Apr 2022 04:06:36 -0700 (PDT)
Received: from localhost.localdomain ([93.175.7.89])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a194315000000b00471083815c8sm580041lfa.168.2022.04.18.04.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 04:06:36 -0700 (PDT)
From: Natalia Kuzmina <natalia.kuzmina@openvz.org>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 3/3] docs: parallels image format supports consistency checks
Date: Mon, 18 Apr 2022 14:04:30 +0300
Message-Id: <20220418110430.319911-4-natalia.kuzmina@openvz.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
References: <20220418110430.319911-1-natalia.kuzmina@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=natalia.kuzmina@openvz.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Apr 2022 09:01:08 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru,
 Natalia Kuzmina <natalia.kuzmina@openvz.org>, hreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add parallels to list of formats that support consistency
checks by qemu-img check.

Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
---
 docs/tools/qemu-img.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 8885ea11cf..14e98df34f 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -332,7 +332,7 @@ Command description:
   ``-r all`` fixes all kinds of errors, with a higher risk of choosing the
   wrong fix or hiding corruption that has already occurred.
 
-  Only the formats ``qcow2``, ``qed`` and ``vdi`` support
+  Only the formats ``qcow2``, ``qed``, ``vdi`` and ``parallels`` support
   consistency checks.
 
   In case the image does not have any inconsistencies, check exits with ``0``.
-- 
2.25.1


