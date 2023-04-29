Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EE16F2498
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVz-000737-TY; Sat, 29 Apr 2023 08:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVr-0006Y7-Lp
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVp-0004y8-5H
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEcIm3ncOAoTM5gXAT+mpmQYieCKspPnGHdQEd9rYu4=;
 b=bGLa76nVr9CCPZUnagnM6guaPZvojsyuP9AblWDCWPbG31HoZPPdBuRmAWSS0g3rxcLw/H
 NIxLwvhPa0bEqu8whG5W6F396WkblZFl+8H8XAYpbSKylE4LRnOgJ87eHWau8RC3XeohG0
 SSvEKWnen9ZIL8y6A1KeO8r580tWjkw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-rgo2YUdEOSOO5CWLDjLRKQ-1; Sat, 29 Apr 2023 08:17:10 -0400
X-MC-Unique: rgo2YUdEOSOO5CWLDjLRKQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50b87b70324so445366a12.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770629; x=1685362629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEcIm3ncOAoTM5gXAT+mpmQYieCKspPnGHdQEd9rYu4=;
 b=Ce7a+tfzzsNY1f2HASelMmM9tN7Da/A2F2ZxKDtMcK5P1hI/zbFndeHlfU2oJZOZa4
 ZmguoCiZamDoOf4a+2FqXNEFGNrQt3SUWg6h8E3RoNuDHE/xU4UT0scXBwjpmQGBL0nu
 rDrbTja9D2W5GQsdA7t6SaRobFTxBBZmzaN9SAu7gQE4MNBmizgYbiIFPXFjAdFj1FYA
 8Ohgg4ahus/JSJlwtzH9tTH7i2F7/dgUW8S7GJdI0kgEeMfUqUA5PbAf1f2Vck5/qIN2
 enQkX8SYMBPmhSyxz/HVQUGtOvrwoQyA6VWS4597uxh7JFUVr5M1UkEwmWn1vK/sYVj4
 IJwg==
X-Gm-Message-State: AC+VfDx12YOs7a4bFICWpcPzMKS9Rvr0rs5MZ5YXJgGZ9I0g3D7321mS
 2F68iVuJKZhyQc9fVjcM2tKmq2+nS+SMLtCrgNodhueQi4EJnDgc/FB+s4vWdkfwgMKuJ0wGeEK
 Y1SqkhrDhiIs0D6vED8R8cTTGEirs7RWBdSNkgzX05e7xDybT/vNssBmAfPeMBDLcDrhgP/GPns
 w=
X-Received: by 2002:a17:906:3a8f:b0:953:37d9:282f with SMTP id
 y15-20020a1709063a8f00b0095337d9282fmr9582129ejd.38.1682770629407; 
 Sat, 29 Apr 2023 05:17:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dZCdbj2/CUyOAnF1aCo5g7R0qxzOqg5E2KhVoZ5yy4+wF3l/m1Jh9ui9lSjoP1C+0UsUCMA==
X-Received: by 2002:a17:906:3a8f:b0:953:37d9:282f with SMTP id
 y15-20020a1709063a8f00b0095337d9282fmr9582117ejd.38.1682770629189; 
 Sat, 29 Apr 2023 05:17:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a170906795600b0094f25ae0821sm12343280ejo.31.2023.04.29.05.17.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:17:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] cpus-common: stop using mb_set/mb_read
Date: Sat, 29 Apr 2023 14:16:36 +0200
Message-Id: <20230429121636.230934-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use a store-release at the end of the work item, and a load-acquire when
waiting for the item to be completed.  This is the standard message passing
pattern and is both enough and clearer than mb_read/mb_set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpus-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cpus-common.c b/cpus-common.c
index b0047e456f93..a53716deb437 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -157,7 +157,7 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
     wi.exclusive = false;
 
     queue_work_on_cpu(cpu, &wi);
-    while (!qatomic_mb_read(&wi.done)) {
+    while (!qatomic_load_acquire(&wi.done)) {
         CPUState *self_cpu = current_cpu;
 
         qemu_cond_wait(&qemu_work_cond, mutex);
@@ -363,7 +363,7 @@ void process_queued_cpu_work(CPUState *cpu)
         if (wi->free) {
             g_free(wi);
         } else {
-            qatomic_mb_set(&wi->done, true);
+            qatomic_store_release(&wi->done, true);
         }
     }
     qemu_mutex_unlock(&cpu->work_mutex);
-- 
2.40.0


