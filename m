Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463962ECA38
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:42:51 +0100 (CET)
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxO4Q-0000Vc-3j
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0b-0004gV-Fh
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:53 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0Z-000825-Ty
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:53 -0500
Received: by mail-pj1-x1030.google.com with SMTP id l23so3078207pjg.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 21:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJcCqNbly+HuBFBx/VMoWDYh1LrAqFMypQIcCUsLO3E=;
 b=AbB54v0n6NruxVsQno+eefZ6NeRDZn0/v1sbL7S7RnTSXq0SN02wxfnyyllRWE+xJG
 cWNyxIaSubc4XVT5kv5lZiK4Ifwme9idfIqtDyYnggeViontuBLza/abghCWWmdhULlP
 NVR2LmL4gOhyEu6DR5rd75I7sdom4BVb2qAgT3o21D0QxLUoaBm92gfs5aWY9gOnJwaZ
 3DMw00AaHs3oQZpXBFrmUCpN1aPNmY2tUMBiblSYtCSfB0M6lI+jcx38fBy4+EGJb0RN
 f4ZYLI02L2Rqew9XYNlLXah0T3dqUq5Bbul+iaVvEVPtChHLisPEz3NHD/GhZs0kOzte
 6MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJcCqNbly+HuBFBx/VMoWDYh1LrAqFMypQIcCUsLO3E=;
 b=DYkhPblcD8fiJTgBXMJyUbw2pSMTySTP4VkbWPIeVrtZreoKpKKKjEpDqpoQT0rdGk
 DSAvcdsnBBXKwPRIMDicvBBaT+3AvaYYaSWhPxDHkervPESHjQCRYPs418xkwKcFXAsS
 bJ9WGGlt0DhiNe7JmKtDBOLNm+pf7dXA063MjqYtQx8BklQ3sF87KG8EKaGRSYnIrv61
 bedZIEk2gSuffZEd3UmRVQEodyyDACl14aPMmhY8f9Ux7A77hocKxkPp/Xi+xtwXHkT7
 q3Pn1egLhrrPLmv/9I7TPCPIlCBewFG8kbgHspXXj6/y+qANo5GFJ/6z8G2uDb4sAmYE
 HgUg==
X-Gm-Message-State: AOAM532JOYThd7T3tWJ3ZJU1g7jJmkkZTx0uXL5r4s9dqynFbav6qtCV
 kxnzJ7kTlwTU1fRRbyESsXRb0gtR8UDhiO0N
X-Google-Smtp-Source: ABdhPJwythTqFvocJvAyu+lnwNJ0z69dQJeEdda4GT7NdYlT5KGPwnHx7i7z9ay99apOE4RQWjMiew==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id
 cp14mr7561417pjb.96.1609997930234; 
 Wed, 06 Jan 2021 21:38:50 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id y6sm7660091pjl.0.2021.01.06.21.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 21:38:49 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] maintainers: Add me as Windows Hosted Continuous
 Integration maintainer
Date: Wed,  6 Jan 2021 21:38:25 -0800
Message-Id: <20210107053825.2010-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107053825.2010-1-luoyonggang@gmail.com>
References: <20210107053825.2010-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4be087b88e..4d9df874a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3198,6 +3198,12 @@ S: Maintained
 F: .cirrus.yml
 W: https://cirrus-ci.com/github/qemu/qemu
 
+Windows Hosted Continuous Integration
+M: Yonggang Luo <luoyonggang@gmail.com>
+S: Maintained
+F: .cirrus.yml
+W: https://cirrus-ci.com/github/qemu/qemu
+
 GitLab Continuous Integration
 M: Thomas Huth <thuth@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
-- 
2.29.2.windows.3


