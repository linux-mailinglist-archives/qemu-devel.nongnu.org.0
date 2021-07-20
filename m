Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB23D05DC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:52:52 +0200 (CEST)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zXf-0004gO-UJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zG0-0004Ri-9G
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFy-0001jE-Le
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id l6so323060wmq.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ie+/p3TrTh/Nerm8Urh8vvJTzslzpin/JxtRrKzIVBI=;
 b=qUmeyKi2/gAEM2FRnwFeTVVYgOsqCqq30FH60NmD/iwIGf8n0KozaY3YnPORIaUjOt
 UmsRNIRdguEY4LXYDfwxQIzlD3ZCshavfJpH8P5KjkpIO/TL1eBykmBql8/GiswVmF7N
 /oyNxlZyv9pmfz8v+78SS75AGwRm9EPF3QoXJyIZn5nyrVSe/WPr3BaRIF/R0pOBi1yf
 lj5RDCqIyqe7mUqJCk9Un5IHAIDLoedI5+1A+7/Q02ju5HUQFFhkVGLWHukHkjCBjgJG
 TMcsYFLkeTQkahwHAvhcRJkP7NpnVpmLB8M/vxn2w2ADlyisREI6myzes8W0ZBC9skY5
 S1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ie+/p3TrTh/Nerm8Urh8vvJTzslzpin/JxtRrKzIVBI=;
 b=kmJ8bckH3aWmwPLQt3n48ecwg/YLkPI0z/RkiJmdxc05A5cdCN98Pb0Q4umbt78/Jq
 1FzHZacbMZeAtcJTpCJtXqG0t2LxiH4aZD0paqCwOQHlUabPcMgz0oc7ABU5ZecmnJQA
 WJJoIFCA1etkWH97YvO6NeLJz9jQVWqsN554G0RDDEB67QEv+Cv2UM7/TdojxsDLKsyl
 H+3dDq8pa88XXszKpFDuuMuFIJ6wm/YAoHuoUy2k1k5E8KgKqgr0wqw43lCeIa8TjqlJ
 mbiIGiRddoD8IJQrtPponnoczofNAtwCF4HUPcT2GdKSPMgNAbUCdQofH2Qt6OEiWME9
 Lcbg==
X-Gm-Message-State: AOAM532CkBhgNzCmpWEEwn3DhyHhop4caliuSgZYsD0JYggx9M++divr
 ujL+gGvQdmTeGmire4JwolzAQQ==
X-Google-Smtp-Source: ABdhPJy+EouzsiuwAG+4KI2ZwoIiyNKHYaLsgvS4zrmmDDWhtlqaAnnTPNTQK1ZeOkocvYgGmSNtqw==
X-Received: by 2002:a05:600c:4656:: with SMTP id
 n22mr29489656wmo.37.1626824073271; 
 Tue, 20 Jul 2021 16:34:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm3704822wma.19.2021.07.20.16.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 158711FFAE;
 Wed, 21 Jul 2021 00:27:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 24/29] plugins: Fix physical address calculation for IO
 regions
Date: Wed, 21 Jul 2021 00:26:58 +0100
Message-Id: <20210720232703.10650-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Aaron Lindsay <aaron@os.amperecomputing.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aaron Lindsay <aaron@os.amperecomputing.com>

The address calculation for IO regions introduced by

commit 787148bf928a54b5cc86f5b434f9399e9737679c
Author: Aaron Lindsay <aaron@os.amperecomputing.com>
    plugins: Expose physical addresses instead of device offsets

is not always accurate. Use the more correct
MemoryRegionSection.offset_within_address_space.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/api.c b/plugins/api.c
index 78b563c5c5..2d521e6ba8 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -319,7 +319,7 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
             return block->offset + offset + block->mr->addr;
         } else {
             MemoryRegionSection *mrs = haddr->v.io.section;
-            return haddr->v.io.offset + mrs->mr->addr;
+            return mrs->offset_within_address_space + haddr->v.io.offset;
         }
     }
 #endif
-- 
2.32.0.264.g75ae10bc75


