Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35EC45444A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:56:09 +0100 (CET)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnHfl-0001hw-0n
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnHec-0000uu-Vx
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:54:59 -0500
Received: from [2a00:1450:4864:20::331] (port=38460
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnHeb-0005ZR-JQ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:54:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso4263227wms.3
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 01:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=005IHjqRWRJJaQave6epZYUIKBv/Z2a1tVz3K5hRNcs=;
 b=cW7SzRhaaaTvVQlfluA8TtpFKrluJMShKsjH/KbbF0k31giSW1lqSSjN8FHF3y+xV5
 0ViMA2ZWKTzckvjdTALMscDQT2/ZggRYWeRoe3g4rz0sFCfu7gfsz9Ewg3f04dK4Vk4D
 OTW0ej62F2IgE1x6atbvgmAzdgb0wO7E4rdN3NXDpTzWMcSR3VkImR9TCFoFbkqSDT8X
 /X0pU0mE01d7qUIj6jbqkSolpg4bIYktfX1W6bJ17e30Ro+QVx0s0z7pjdzWqsgmPCts
 lRzi7tyj5W6qHTn3XFDAwlggzX1qM0ApSrpCo3EGta1xje8mLEB/mtXI9CFNZCJ3p454
 4mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=005IHjqRWRJJaQave6epZYUIKBv/Z2a1tVz3K5hRNcs=;
 b=yHyL9ZOJgG6r/KofNFAm0OepQxpFTA4RqTUtyqgXE0XedNv88myHtijXLk3az2TC6O
 uFhH0M/yg8wlKmrUmNJ+gAhEc6XzPDH0VKxQ8Ci2nRFmMQNweEqEFqqRwJNkAcRfta4n
 wADxD3VwCeL5Xq9DWLn/aEljehWlxOowyan+5YBj/3nGdJr0niWrHX/DTgL3pVYgF8tw
 7CvMmu+2MujFQkQtfScpqihWmyJBlowYN2ejrle6B8kB61ryjIaQH+UXYY1zx7Vfz/JT
 EVPOJ7lO+JHHea3+sBve9gHXUwxVplpjkv0EHkgUrYGxhJT2fqFmQjJcVYHRn0O9OJ+0
 38Rg==
X-Gm-Message-State: AOAM531uZVAcPJFRFV5EoOhF/XgqTTwrPYscpuZ2PxDdrGayIVKR4NFv
 IwUh+sZq4EYV9wWyZPg/ZI1Ljw==
X-Google-Smtp-Source: ABdhPJx48Y87Hlee/yq71PJMxAixMXsZta2YWF6TrmZ3s80gp8vNUV7cONgEIOFlup8Jmt+azVPwcQ==
X-Received: by 2002:a1c:488:: with SMTP id 130mr16351953wme.157.1637142896000; 
 Wed, 17 Nov 2021 01:54:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 4sm26189370wrz.90.2021.11.17.01.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 01:54:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C6721FF96;
 Wed, 17 Nov 2021 09:54:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/avocado: fix tcg_plugin mem access count test
Date: Wed, 17 Nov 2021 09:54:48 +0000
Message-Id: <20211117095448.136558-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we cleaned up argument handling the test was missed.

Fixes: 5ae589faad ("tests/plugins/mem: introduce "track" arg and make args not positional")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/tcg_plugins.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 9ca1515c3b..642d2e49e3 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -131,7 +131,7 @@ def test_aarch64_virt_mem_icount(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libmem.so,arg=both", plugin_log.name,
+                    "tests/plugin/libmem.so,inline=true,callback=true", plugin_log.name,
                     console_pattern,
                     args=('-icount', 'shift=1'))
 
-- 
2.30.2


