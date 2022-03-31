Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157D4EDAB0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:39:43 +0200 (CEST)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZv1a-0007zF-6Z
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:39:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZuxW-0002vI-Uq
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:35:32 -0400
Received: from [2607:f8b0:4864:20::82b] (port=35465
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZuxV-00027H-F1
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:35:30 -0400
Received: by mail-qt1-x82b.google.com with SMTP id z19so18121240qtw.2
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xcuMQNC6IrQ56TTJatplypq1x8R7rrxrvKnRLC/ubuI=;
 b=iqVzp+ADGKTwGYEzEErhWSrNDw7bzV9JV+FeLW2ftO7vwWus6EHFtXbUNljhnHZlNB
 7mw8V+98cM/havbdHHj7o5Q2qPUXDbYwwMXTEE2PnNqHMTlF2MyBM/z+CrVM6wdCr3Fg
 ei+WiGoYGZe1YlLPBT7Z1k9pz2jyvHJJqHE4EgBHYxzgP9ujF9lgvOrOnkcrVUHGU0xC
 Ie3O/uhqVlIMby9JPYe2w7bRDWKQX2RQfgYFdJatr5CAg51YDOBg/oc2uxVyU5hgGeW9
 k/HhXdHBURTFFDu15/hfiuGVf7ZdK/98ZJwh6TJTXxxz9yJLVFQCr5kEgSjSXpBDNsdg
 YaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xcuMQNC6IrQ56TTJatplypq1x8R7rrxrvKnRLC/ubuI=;
 b=WC5CUhMDZNPoULwbqZlNLZ27Z7ukSsWT8qJU1D5waCeQXsjn5ZHLOsPiWDdOdw2gsf
 6EJuOkO0ogiymXEjBwhSIh+aadkAUDY40hbKbOYzyH0EKC/xGx7A5K3PhMft3XS/qKeW
 JPvmhfnN+4A6K4sxFm2f7Il/B1yWSnL+MQyE76rAPfaoOjzfl9HzT7R+HFikxVOf1Tc0
 lpTYNPCDgXwWHbkxY5Z8pJYE5Oa+BVks6arEPKsuudwPBKt1UpH8BPJ8Px/TtgJsCxKb
 mTLc5ZPl+XpYOmPkkhUcVpXybVnQcWsfccjt5rMbWs39Yg4G8W4TuU3m4tLaJPJaCpgA
 BOuQ==
X-Gm-Message-State: AOAM532d6Lm+m8uZ2NXvyElVej0dXEj5KH8YZYBajMLpF9q4cXIKEdCV
 8ApHrGN/hHlawit9YrIY5fY=
X-Google-Smtp-Source: ABdhPJza2JERqPujUo74W4Zucta5U3A+wi//k7hEmPXZO5gFvym0vFNbb8Jtmlde9kq/DrZzs6rW1g==
X-Received: by 2002:a05:622a:178a:b0:2e1:e7b8:e52e with SMTP id
 s10-20020a05622a178a00b002e1e7b8e52emr4299625qtk.464.1648733728381; 
 Thu, 31 Mar 2022 06:35:28 -0700 (PDT)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05620a409300b00680c933fb1csm8381911qko.20.2022.03.31.06.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 06:35:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/15] qapi: fix example of BLOCK_IMAGE_CORRUPTED event 6
Date: Thu, 31 Mar 2022 09:35:04 -0400
Message-Id: <20220331133504.599150-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-qt1-x82b.google.com
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




