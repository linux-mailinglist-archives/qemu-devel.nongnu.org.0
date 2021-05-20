Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D238638AA44
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:12:15 +0200 (CEST)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgb8-0001vV-Tx
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYZ-0007ne-0q
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYX-0004Po-Er
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3/KZxEceqNBHXRRxZ4yuG2qkGWWINMUXp6C+3kJ9h4=;
 b=RpjFhsB/+8s2XK64X1eDqQPj4nT9HPRAp/2hu/CTg4Pnh/Vgn4PajRkrWMOfmgZ2lxH6ip
 swERpbVcxGDuAmsWn1bMuvxQSK3qQoW2LFn3CPxn0RAEvXF7FcUuDw0SubjWcxj0t2kBj6
 qcCzIyxWtnzc5bLIgt4W06G/2S4hwW8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-brOYqp0AObSVHJOJK4W74Q-1; Thu, 20 May 2021 07:09:31 -0400
X-MC-Unique: brOYqp0AObSVHJOJK4W74Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso1317005wmj.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z3/KZxEceqNBHXRRxZ4yuG2qkGWWINMUXp6C+3kJ9h4=;
 b=kvLXa+CUQCTQ6en/7sJaCdVELZcv6dQE3yRCLflMxpP97znCYIGOLtPFtbsLLqDt7A
 ZolkUhDUQd/CtZsiqzJFzTZmwprxw2vUqZxGqn8tk5XUU3sZ3tTrFsJLFLDnp9LLRD8m
 tcUB6HNVnaqnMilePXpLDvaexs6oOxCB+SfyYxmwtROCB0R7aq5DsCOYSrS6QvsR6ajh
 Ag/7rL6Dg6kSAyY00WgoSL6gWshfErZS5I2oBXN6NHUFY7oJrPqSiHTvYTE/aKHflI7Y
 /D4ulM6d7kuMdIYYVwaYAYeftnWeiCashoBGmLqFYlxAuooOKSYqhxNJOO2ibp1kURGH
 tfug==
X-Gm-Message-State: AOAM530WdZJ5Tp+2LHE8JlKgltsr5BeEtO7TUb42NPoGRW8EFAprEDSt
 uBaOXLTfqgiA/zzUWdXuvGkCv1qnjLUWzqArkHVOyndYDuyfBPgh8twUEXv4IuB2RU68Ow9bu90
 8LrmzDcJPiL/40DJ/UJvZHKky0EeGxTTsFdKoe1ug1UgsgBgzCcLiAimMhxVRBg6E
X-Received: by 2002:a5d:5008:: with SMTP id e8mr3641406wrt.386.1621508970233; 
 Thu, 20 May 2021 04:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOqk6hVjufnuap/b7mFO0PpMjE1Kc0WB3eAcoLpFr39pSsAkfOvHC1dpN9xEobxcRXxiycOg==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr3641385wrt.386.1621508970060; 
 Thu, 20 May 2021 04:09:30 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y137sm3081451wmc.11.2021.05.20.04.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/12] exec/memattrs: Add attribute/error for address
 alignment
Date: Thu, 20 May 2021 13:09:09 +0200
Message-Id: <20210520110919.2483190-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A bus master might specify the 'aligned' attribute to enforce
a transaction using aligned address. If the address is not
aligned, the accessor will return MEMTX_UNALIGNED_ERROR.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memattrs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55b..6fe59194e35 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -39,6 +39,8 @@ typedef struct MemTxAttrs {
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
+    /* Memory access must be aligned */
+    unsigned int aligned:1;
     /*
      * The following are target-specific page-table bits.  These are not
      * related to actual memory transactions at all.  However, this structure
@@ -66,6 +68,7 @@ typedef struct MemTxAttrs {
 #define MEMTX_OK 0
 #define MEMTX_ERROR             (1U << 0) /* device returned an error */
 #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
+#define MEMTX_UNALIGNED_ERROR   (1U << 2) /* address is not aligned */
 typedef uint32_t MemTxResult;
 
 #endif
-- 
2.26.3


