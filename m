Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8B259985D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:19:52 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyAQ-0001Ai-UX
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oOy3o-0004wq-6P
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oOy3l-00020S-0l
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660900375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/x5zfY4Hnz2TVjAGZn9AXxE8RUrNWwBIiW31HztdEo8=;
 b=fAKlNOs0eXbtHu1Q2KT1+rBY0RWhHhi/wjIvFTdRsaxWLCMP4gE947SSPxC18qVe0y7lxn
 kNKN6ycd8Mlfv/aXkQQkk8+uDCID5k7xd7Y1artMFdZVOHAuU2No330XZI7NZUKB3vBKg7
 aon/T+13vZxavVznH0RGrjSpU3oRRwU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-T6VsFWJGPz-79adKLPOcrQ-1; Fri, 19 Aug 2022 05:12:50 -0400
X-MC-Unique: T6VsFWJGPz-79adKLPOcrQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 r12-20020a05640251cc00b00440647ec649so2540343edd.21
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 02:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=/x5zfY4Hnz2TVjAGZn9AXxE8RUrNWwBIiW31HztdEo8=;
 b=PGnaD/RFMQSa9/ED+ogl2zcCiZWBJ1WtvN09D3BnqMrVeotrGRl1YHrrUaEiXBFYE4
 kcq3XRdUQj/hY9r3sHKvvEZpBPVCrDMSxlwcuNxPuj35OGZRWE0ltqnDdgG+ODv42T+t
 CIJutML/f5exgdiG+6y5gSvv8LXs9+/A63VVMmCNDfnooL13hSiVL03ohZYStvWs6858
 yWbyfFF5V3BT/A9fXzJdt10qFq3aW4f6ERB5kwJYrYpbH4mjN3oa1BoB+nSoh3hFn5Q2
 rB9DHpg9GRYK4LygInTEDyfVZp1D+t/5JsNAnMnGM+qTMUT9KXKIRZF/PThjxd4kfe+Q
 tSQg==
X-Gm-Message-State: ACgBeo3DxI6CG5muCwzmFDOgdE1u37ORbKYusUR7hnJo20B7iygV0G4/
 AoRHkBHTU2xZ3Ea/Ht82Vu9s01RcKHpLLpnCuAfakPIjRtIz2Dg8XOCUDJ/63EAzC+QQJC/kwTL
 72qjP4BjsZ8AMIKUuN/aEmYD7xF+KwTpO0VEoswRV5bTWD25yWh8MFyH8gym+8WS1c3g=
X-Received: by 2002:a05:6402:304c:b0:440:d482:2fa6 with SMTP id
 bs12-20020a056402304c00b00440d4822fa6mr5467740edb.344.1660900369425; 
 Fri, 19 Aug 2022 02:12:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ubOj2HV8EEaHsmV6lkgfMedHte+mSDUsbU0sCuqom2CRp5iJf4mCfOJ4smMyNXim3PVx0IQ==
X-Received: by 2002:a05:6402:304c:b0:440:d482:2fa6 with SMTP id
 bs12-20020a056402304c00b00440d4822fa6mr5467727edb.344.1660900369148; 
 Fri, 19 Aug 2022 02:12:49 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 q15-20020a170906360f00b00730a73cbe08sm2052021ejb.169.2022.08.19.02.12.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 02:12:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] kvm: fix segfault with query-stats-schemas and -M none
Date: Fri, 19 Aug 2022 11:12:46 +0200
Message-Id: <20220819091246.178546-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819091246.178546-1-pbonzini@redhat.com>
References: <20220819091246.178546-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

-M none creates a guest without a vCPU, causing the following error:

$ ./qemu-system-x86_64 -qmp stdio -M none -accel kvm
{execute:qmp_capabilities}
{"return": {}}
{execute: query-stats-schemas}
Segmentation fault (core dumped)

Fix it by not querying the vCPU stats if first_cpu is NULL.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 645f0a249a..8d81ab74de 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -4131,7 +4131,9 @@ void query_stats_schemas_cb(StatsSchemaList **result, Error **errp)
     query_stats_schema(result, STATS_TARGET_VM, stats_fd, errp);
     close(stats_fd);
 
-    stats_args.result.schema = result;
-    stats_args.errp = errp;
-    run_on_cpu(first_cpu, query_stats_schema_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
+    if (first_cpu) {
+        stats_args.result.schema = result;
+        stats_args.errp = errp;
+        run_on_cpu(first_cpu, query_stats_schema_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
+    }
 }
-- 
2.37.1


