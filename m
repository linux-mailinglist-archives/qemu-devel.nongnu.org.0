Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BD6296ECB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:47 +0200 (CEST)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVw6k-0005Yt-Jg
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 08:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1kVw2R-0002ul-CZ; Fri, 23 Oct 2020 08:19:19 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1kVw2P-00011g-AH; Fri, 23 Oct 2020 08:19:19 -0400
Received: by mail-pg1-x542.google.com with SMTP id b23so1114245pgb.3;
 Fri, 23 Oct 2020 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z2WuP28xT86WpPobv7ndJGF5Was6IrYab0319WrXnpU=;
 b=stkGGQDRRHEE5Yb2ANrVCfLcZYCuFOTf0JOyzbKPES0NGpt6Xrobdk2ydsCjTJqqUh
 IZDb/xB4jpfFgYvsMKaIQ9I62JBVYoW7sFQA9EPldGPRN8DqqNrNiYaX1PeC2c1MdtJB
 OGrUWc5OuIl81eY8HuidigbzVwNcJuSVu2aoyZBy1bPgN5AZ3oUNGbjY+Hk3cRZ7H2GG
 YTON8pc0yv3CwEL5oClkuFXUOCMsFMAeLVdgZECRU89omyUKrxMA3rPb7ZS4gjXJVgjR
 OMVa3fhjvGYIIrc16ZzWpCOzMjIJfPEJ/2CB/a95lKSdSISvKWGzQXGoidvbKG19QDfo
 BENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z2WuP28xT86WpPobv7ndJGF5Was6IrYab0319WrXnpU=;
 b=iixpp8TkT9cNGZkxFwihSW5LjvCRcNcTI4ln9ULusoHMW4Y9eNE6Q3YIFF0RPmYiCA
 dweuTUhmNyeOlEbCJw2yrhP/HmdAUdYOAFJsFFsAKptDo5jxvvdq7u7N6DjZMW1pKl9+
 vYsoKkkV+vjF5JwZlJ2s8U23Em4vbGmOasuGITRNFeBYvmV71lUqCNWIH9sOJEBXTHAp
 EPJ7bdlaMI7+F6Lv2MZNmgloWy5Kwl1VE9OyHyWNVT3yq7+YrA0x0P8KMD8JZmfk+OC1
 W+MfYjND6uILcLfUat8zPh/MfUU2E7SrQHpbHqBy/3lUr4HhQI4aEovWuxVA8XTHHrR1
 xNYw==
X-Gm-Message-State: AOAM530xJL8shAwqPlVRHeVdamAhZBHIkS/D/qGX/RpJaJP022qiLSPP
 TlThGvL+UEvLajslsGafmiyOYeF+VHbIOcUv
X-Google-Smtp-Source: ABdhPJwBVLRnVJk9ITf/iiacUVNF4OoIe4Pe2qX87WR53+jJ8Hts2hWr4/WFqddXDfdDw2KQo3dd+w==
X-Received: by 2002:aa7:9e05:0:b029:158:ca8c:fe36 with SMTP id
 y5-20020aa79e050000b0290158ca8cfe36mr1889357pfq.62.1603455555024; 
 Fri, 23 Oct 2020 05:19:15 -0700 (PDT)
Received: from pulp100.localdomain ([103.199.158.131])
 by smtp.gmail.com with ESMTPSA id e4sm1756237pgg.37.2020.10.23.05.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:19:14 -0700 (PDT)
From: Chetan Pant <chetan4windows@gmail.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH 10/30] microblaze tcg cpus: Fix Lesser GPL version number
Date: Fri, 23 Oct 2020 12:18:21 +0000
Message-Id: <20201023121821.19179-1-chetan4windows@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014134248.14146-1-chetan4windows@gmail.com>
References: <20201014134248.14146-1-chetan4windows@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=chetan4windows@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
 Chetan Pant <chetan4windows@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no "version 2" of the "Lesser" General Public License.
It is either "GPL version 2.0" or "Lesser GPL version 2.1".
This patch replaces all occurrences of "Lesser GPL version 2" with
"Lesser GPL version 2.1" in comment section.

Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
---
 target/microblaze/cpu.h       | 2 +-
 target/microblaze/gdbstub.c   | 2 +-
 target/microblaze/helper.c    | 2 +-
 target/microblaze/machine.c   | 2 +-
 target/microblaze/mmu.c       | 2 +-
 target/microblaze/mmu.h       | 2 +-
 target/microblaze/op_helper.c | 2 +-
 target/microblaze/translate.c | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 297b368..c1c2641 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index be39fd4..2e6e070 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 3d6ce1b..cda14a1 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/microblaze/machine.c b/target/microblaze/machine.c
index acdb8d0..c2074bb 100644
--- a/target/microblaze/machine.c
+++ b/target/microblaze/machine.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 1dbbb27..2baaef7 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index 7d0fbb8..09e4075 100644
--- a/target/microblaze/mmu.h
+++ b/target/microblaze/mmu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index 757f3ff..58d6335 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index abfcc7e..c1b13f4 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
2.17.1


