Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360D4EDAB1
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:39:54 +0200 (CEST)
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZv1l-0008R1-Kk
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:39:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZv04-00072Q-Ki
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:38:08 -0400
Received: from [2607:f8b0:4864:20::736] (port=44864
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZv02-0002bC-W2
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:38:08 -0400
Received: by mail-qk1-x736.google.com with SMTP id b189so19685872qkf.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xcuMQNC6IrQ56TTJatplypq1x8R7rrxrvKnRLC/ubuI=;
 b=OqTMWbZeTn50P7ivMy4eEtY43EXHu0UuGhbFsn0b4ujviHFsCyT2YwfelTX/3WJCZ4
 acOUsBs8soaKcrIRl6D12EPdfbfSPy83xpzsoX0p4mIWT2m+q4pwjnw/m1X8dtS/U3Yl
 0WbujX28WB0sXij7OUfsm5j80I+XOiklvyH+MAMdTrVlbKyEQ0NIKvRcC+art8nM6Qrf
 rp3XowuyhX+0oA3tDouoJu0oBK/VZjK/C1NUAPypUegNH9gpcE+DoluJOSPqoS6HcW1/
 s+OrL8xlpO0rWJE2buJUAjRs6wswNe1AdKSJuL48q9P6cDRnG8M4TxtupHjZB54d49zZ
 NtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xcuMQNC6IrQ56TTJatplypq1x8R7rrxrvKnRLC/ubuI=;
 b=Um2+Z6nuB6Oc/DhUg+x+33eN3ZnrJElRQ158tbF0QoFJs2Cj4hYqZM06/vhUUas1NE
 qE95hI4jWYjb/dU2zZbvrUA+Hn7WBNYgfAKgcC0FbDZ4WfbBNXFZtbq1Unv28N3h5cbc
 fhwcMfzYFF/fgGu6NkqMjKQzmaab//0xLl5fzknMOrNBN37Dl62Jeo9eyYkH5WBMSmIC
 WBQpAceh6XhZov9FlAZy0EZmFPLklHIMhttdxRaNZ4Oaih7z5J7yLqgBwcyaOv6uj9Wt
 BqgZ5C1KQ9DlMPpydQIPz+DMMRWCKs3VD8bmHO1g9ij0pBJ2po/8uLHSialgaA9W840Y
 RZMw==
X-Gm-Message-State: AOAM531p4671m8oSEbODQXtOMoi+lmpKN3i4v21GeicjMHougBtIDAFk
 wWbabgJTB6bZpXQP51TME1QE7yTzPiP0v9vj
X-Google-Smtp-Source: ABdhPJyC9cqj36owm6lSlCm+bs6jxqKOidvf5tQf10cnewe08nUwiUlOUem5QxbaZgc0lCiN28AIMA==
X-Received: by 2002:a37:3d5:0:b0:67b:335d:59c3 with SMTP id
 204-20020a3703d5000000b0067b335d59c3mr3303630qkd.739.1648733886003; 
 Thu, 31 Mar 2022 06:38:06 -0700 (PDT)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05622a029300b002e1a763dac1sm19869434qtw.9.2022.03.31.06.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 06:38:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: paolo.luisa@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/15] qapi: fix example of BLOCK_IMAGE_CORRUPTED event 6
Date: Thu, 31 Mar 2022 09:38:01 -0400
Message-Id: <20220331133801.599785-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example output lacks mandatory member @fatal.  Provide it.

Example output shows a value of @msg no version of the code
produces.  No big deal, but replace it anyway by one that
today's code does produce.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220328140604.41484-3-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index e89f2dfb5b..63c30a5378 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5006,10 +5006,9 @@
 # Example:
 #
 # <- { "event": "BLOCK_IMAGE_CORRUPTED",
-#      "data": { "device": "ide0-hd0", "node-name": "node0",
-#                "msg": "Prevented active L1 table overwrite", "offset": 196608,
-#                "size": 65536 },
-#      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
+#      "data": { "device": "", "node-name": "drive", "fatal": false,
+#                "msg": "L2 table offset 0x2a2a2a00 unaligned (L1 index: 0)" },
+#      "timestamp": { "seconds": 1648243240, "microseconds": 906060 } }
 #
 # Since: 1.7
 ##
-- 
2.35.1




