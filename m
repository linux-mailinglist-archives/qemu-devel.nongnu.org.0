Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECF4EDABA
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:42:00 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZv3n-0002Ty-Am
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:41:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZv24-0001Nw-E6
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:40:12 -0400
Received: from [2607:f8b0:4864:20::f31] (port=45773
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZv1z-00032S-S2
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:40:09 -0400
Received: by mail-qv1-xf31.google.com with SMTP id b17so10077625qvf.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xcuMQNC6IrQ56TTJatplypq1x8R7rrxrvKnRLC/ubuI=;
 b=Lh7W5Q2zirbkreBBnSVRuJJlmPf+Aiekt4neGQVQhsU6glFk/yFxsHzzOCvnIn7gL9
 j3t/iYC1UumK8ijnTRqERxCkWPlkBvynosOR7FMRUt0RwV5+QGyYpIPEC1WrFuey58ro
 Kof6SrGhSSqIvxg6rQMjTA4hmwIKIva5HWip6q+InQK7W9JDmhGDEJFPmvYblGlpM5Ta
 1RuG8K9M2b4pvULpJjxRJZ0xksB9gfNOPo/N7+5oF6CTm+jYHtniEgkqmNLqoyrxsPAT
 uKqlzVaWHKTEPV/Iw4P2/zWtxJkRzOnxcef9lJgH4PTG3cRqVfEkvJtwfW8QOVnvn+WI
 Iiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xcuMQNC6IrQ56TTJatplypq1x8R7rrxrvKnRLC/ubuI=;
 b=sZyzoGZEdyQJW5Xt0m76PkcuxPGbdgrHqW7Qh3WSpVicLBwc0IBDvV980x60LVfRug
 07GK8433A+9M30KCF0gN3yWZfWL2eDXqE8xC8JCLMHz61BgZK/XP9VZMXY+5rAZncZt3
 L1wYiXr9TeMFruRmVNcoUe8En299KN3f0PhDGH2OTXegY5Q8pUVFYl/23jHBcVHmmmyu
 FvCL6fN+OfLdfNfqYrxrkcIfEHm0JX0BIv1n69o+wvvnYAUnrz+PCHZ0jIzFV9rAm+Kf
 dWqNwEhs1HoyQSdj+KbdigGqfGeMx9XcIh23b3cWYykSHYrSOo4w7jMLEBLjOI5yKc2g
 THaw==
X-Gm-Message-State: AOAM531aZ2W5R3AJgue5bTtATiXgkxuu7SboFto0MTHgqT6wElpcckq8
 M9fX4TbZxlny2v3nSVg3mUy516qN/q5oWocI
X-Google-Smtp-Source: ABdhPJxG3HiNoxrgUorG/35bZ7x0/6u6bcRKDGxECKOaN7WT0GMszopuyCul3tfT6DMxa+g/sNtsEQ==
X-Received: by 2002:ad4:5de3:0:b0:441:659a:74c2 with SMTP id
 jn3-20020ad45de3000000b00441659a74c2mr3701005qvb.97.1648734007027; 
 Thu, 31 Mar 2022 06:40:07 -0700 (PDT)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a05622a060f00b002e2070bf899sm18830513qta.90.2022.03.31.06.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 06:40:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: paolo.luisa@gmail.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/15] qapi: fix example of BLOCK_IMAGE_CORRUPTED event 6
Date: Thu, 31 Mar 2022 09:40:00 -0400
Message-Id: <20220331134000.600242-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-qv1-xf31.google.com
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




