Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A4373776
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:26:27 +0200 (CEST)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDnW-0002Ux-A4
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkR-0000sk-Cz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkJ-00056l-Jp
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so691975wmh.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ydPT0ztE2Bw0rnFw4k7WbHBh286HstrN5c/fEJLUTGA=;
 b=lw51i2KQmYSfL0VWNhGU3wOMQBgyQFZX0BgQM/hi01D5Y8+JpKHa0w1gxyt4Zt49YV
 FAMmIx/3na9aLo8darGgFiQCkHHPKy+ccM8ZrKsPPdYO6WqA8+2Bm3hRjTyEPECEQX+V
 9Jh37+oraB6WniA23aTExmbQhqWe2Ejodaq+0sIuriQPsxxrzcFigGZvmL82G3siZHjB
 Blf2jNP6CbInfZPSOs0AuP9c4/2h9MyYR2AB9eHWpi4qVuQY6BNZvy3AN2oy2/pfp9UB
 0RkBzmnJCAbd/DXZD9KXc4M2Zs+WQuEcPqJrJtdrYvGOsrZOvvX7gGdRuiWuvjKYPjIe
 rscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydPT0ztE2Bw0rnFw4k7WbHBh286HstrN5c/fEJLUTGA=;
 b=tyxcjE+j8GnWIWNd5UVF6nDIYLjrddD0/2EkPhplIYSBdpOho49fU+h6Yie5jpFsY1
 aPlqENTdJItAR1EQgbcn7iVYliDDJFKZAp1irZO80VVQ2027LDPMFO6RLjoMRlYCSHxl
 D/p4w5FAqSdeIspcYk9YisuG3Hd50vhpPgw/ix72gCG9CnccZi0NR9Xr5h87MbdGTwmr
 hqkjeELrX7QWD26HibD6FEDFIqSd5//VcCL1RSLbnyPkYFjo8YH+CoNKgOeQWR/BjUL3
 MaA2XjR+Zjudo5cLwQhgFuVVNEqbxmD+f3TtkP1tZP0WG/UGcUnyz8Ls8SNOj3k7XFLl
 XP/A==
X-Gm-Message-State: AOAM532ZvmGvs/5ktCx59if1q3j/nsCjVZMILdYCW6Ff5A5bPaYy/ftg
 kfuFbpOxjPEuoX7xgwKA2DJ3LQ==
X-Google-Smtp-Source: ABdhPJyCwdVIrdEerNQtPOGB5ST68y8ICf2cJFHLN2yY5rYVbYlen8oa8SXRtgGzTZvEBwdFZR+xIw==
X-Received: by 2002:a1c:4302:: with SMTP id q2mr8887749wma.1.1620206581890;
 Wed, 05 May 2021 02:23:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f11sm5363048wmq.41.2021.05.05.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 149DE1FF8F;
 Wed,  5 May 2021 10:23:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/7] plugins/hotblocks: Properly freed the hash table values
Date: Wed,  5 May 2021 10:22:55 +0100
Message-Id: <20210505092259.8202-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505092259.8202-1-alex.bennee@linaro.org>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Freed the values stored in the hash table ``hotblocks``
returned by ``g_hash_table_get_values()`` by freeing the sorted
list and destroyed the hash table afterward.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422005043.3569-2-ma.mandourr@gmail.com>
---
 contrib/plugins/hotblocks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 4b08340143..64692c0670 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -68,10 +68,11 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                    rec->insns, rec->exec_count);
         }
 
-        g_list_free(it);
+        g_list_free_full(it, g_free);
         g_mutex_unlock(&lock);
     }
 
+    g_hash_table_destroy(hotblocks);
     qemu_plugin_outs(report->str);
 }
 
-- 
2.20.1


