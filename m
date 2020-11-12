Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86EE2B07B5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:43:12 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDod-0002Ke-Sk
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmM-0000bk-Or
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:50 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmL-0003kt-3H
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:50 -0500
Received: by mail-wr1-x433.google.com with SMTP id 33so6241584wrl.7
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WO2TnVWc1Q9F5TmaPlTFZN+oBdLDREUOz0RVU/FUiHk=;
 b=Q7dUax8o74RPpb8q1tnkm9aQ9AlQAy7ESYpat2SoZ81RlLOVaTw6Rt93hbAdzHagR7
 /VTQx9r73tYIirIvuc+vt2/ZF30rk1Bm53V0s8ZilYYggd0rWll6JTam5gTAutJVxghU
 JXk8n5VZw7j+me92993h/o5GCQG1v9K5gme84SFF+NG+cAxBT5lLwkTNWe+Sr1+u4Yio
 lUk18h6smcCrT0YZY8pj+/ThF9SVxKTo5pwa8nDWjfZCyN9y+9MzkdSeCCa6+5NdhbJh
 Gl/8a4xcKB3lnBoZvi4Ib7t3opKSb8D7wS8j6v77K2x/jISxu63YJm8wqSkil9Eg+2+z
 LF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WO2TnVWc1Q9F5TmaPlTFZN+oBdLDREUOz0RVU/FUiHk=;
 b=MX3hemWEOvqWSz40Q8+ZcJsHINRJGzAImPMonbR6igkMRNybiJNe9mByK/2O2ibLOZ
 JePZ2UA89vo7s8MYrlyAONVR78XZ5kYGLl73ceSpn+tPW4OrxkiqkViI7Xle4ergkJLe
 O1KzJ4SJvMicHEkMHm+w+FNCc9+VR4TFQfk/r/2jwF/q3AW57znCpYsXDlzJqdJOxMrz
 ryel2KB4l01vB2bR/Ly4Wu9mi6JRH5DuudJUCYX/7wSYD6jqlR9SFV5zTXMhMS1BNtZ/
 W8d8RS+Ewx3QjmtUGlmq/HELY4HiZThbQCkYEZ1I0jdjNhkTbITTTV3O+AcpjHWyU1S+
 +UuA==
X-Gm-Message-State: AOAM531MB7Gp28G50z3f6qFG4aLC/1zAhgehBXbV6HsLcLqlwiJIuKC3
 RwZKp3gORlZo4fsN1mMMeexcvyGRDFBqwA==
X-Google-Smtp-Source: ABdhPJyMAlOAZzEVnxKVKO8aztdhYMM9Y2g7qEpj7xlXwU27WPEBIW+Fl8tAlP3yXJI6HRJPxKl5xg==
X-Received: by 2002:adf:a3d1:: with SMTP id m17mr25434272wrb.289.1605192047221; 
 Thu, 12 Nov 2020 06:40:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 3/9] docs: Move virtio-pmem.rst into the system manual
Date: Thu, 12 Nov 2020 14:40:35 +0000
Message-Id: <20201112144041.32278-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/index.rst             | 1 +
 docs/{ => system}/virtio-pmem.rst | 0
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/virtio-pmem.rst (100%)

diff --git a/docs/system/index.rst b/docs/system/index.rst
index 0f0f6d2e99d..2a5155c67dc 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -30,6 +30,7 @@ Contents:
    gdb
    managed-startup
    cpu-hotplug
+   virtio-pmem
    targets
    security
    deprecated
diff --git a/docs/virtio-pmem.rst b/docs/system/virtio-pmem.rst
similarity index 100%
rename from docs/virtio-pmem.rst
rename to docs/system/virtio-pmem.rst
-- 
2.20.1


