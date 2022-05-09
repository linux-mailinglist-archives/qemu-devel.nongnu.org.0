Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2D51FAC8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:05:57 +0200 (CEST)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1DA-0008U5-5s
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fT-00058R-Pi
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fS-0002pw-Aa
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7C8lG6R8RX27Fo+XJU6Uqyin0IHJd8cGVFwfHkJe4Q=;
 b=ATY1F5sFmmh3a4HOS83yYvErbRTP1fOuUtPAF/x3saXP3H/Ahn8dggFPWyGm99OLB/bkrN
 Qc6dfwqRsu0IiHUogwzEyXwL8nqcrNaAdcWw1F1/kwwZqnyI2z7sqf4Fy8BmnVkW/Bzdl/
 BYzTHmHGVO2wmXbtn7zpVrwMpuDGbN4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-DP01cA3NOIe6kOwPKR5z7w-1; Mon, 09 May 2022 06:31:04 -0400
X-MC-Unique: DP01cA3NOIe6kOwPKR5z7w-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so4565749wrb.18
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7C8lG6R8RX27Fo+XJU6Uqyin0IHJd8cGVFwfHkJe4Q=;
 b=a6d8U8KAC7VbkAkaw9XTRtfSf3NBVzMrnCkeWQKvYbz/Ahpuz0GBJ98m15kohOrcnf
 SfEqv7Cj0600dbD89vAbZQdV2YRDWMUXY9Y+Xj31FI0zo8lWVl8YSNjKpkzURfd2Cqv5
 Hk44Wd9s9E3eIYHb+BDBM5o0MiLWBCMRUifwJKEf9WBzvfBY+lLBBKz71np1C1ImPlPZ
 xAR8xt8l3rLJF6P4chbxwNflNPzqTwaQ55vOkq/fy2y4B+guqEVDUQAnGdt2MFrUqcMR
 b6j49Qx/oFNiSY1I++h+xx81xKvj2hwoXsCtf6S/N0yjmllw4WLdy+vZu+TMfnOKubX3
 sNzw==
X-Gm-Message-State: AOAM532ntayQQD20CGwqfZv8AcQ/QRCToo/4jGT5INceF+BFWB3YnDwc
 9XAlRoGj4bZ+fZXLatuzCsmHMYcqA6iV81QbiI0g3Brflw5RtByZJR8lgufStqqVn7JbHFJw/TG
 726ECb79MSHEA6iKmXZBrXoBqZoz9ZE5Sqg6OC17lwd8of5AxynRKs/vIGwn+n2qYBcE=
X-Received: by 2002:a5d:4d8c:0:b0:20c:57b6:3319 with SMTP id
 b12-20020a5d4d8c000000b0020c57b63319mr12932542wru.536.1652092262678; 
 Mon, 09 May 2022 03:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzXH+INZo9eTEiw5jZ7o5TjurTp5JzMeurw0Wyt5nZpKnj3vAQ89hMT4UNtYIstenec9VWhQ==
X-Received: by 2002:a5d:4d8c:0:b0:20c:57b6:3319 with SMTP id
 b12-20020a5d4d8c000000b0020c57b63319mr12932521wru.536.1652092262291; 
 Mon, 09 May 2022 03:31:02 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003942a244f3dsm12299246wms.22.2022.05.09.03.31.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/26] qed: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:10 +0200
Message-Id: <20220509103019.215041-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/qed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index f34d9a3ac1..208128d679 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -259,7 +259,7 @@ static CachedL2Table *qed_new_l2_table(BDRVQEDState *s)
     return l2_table;
 }
 
-static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
+static bool coroutine_fn qed_plug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
 
@@ -278,7 +278,7 @@ static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
     return true;
 }
 
-static void qed_unplug_allocating_write_reqs(BDRVQEDState *s)
+static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
     assert(s->allocating_write_reqs_plugged);
-- 
2.35.1


