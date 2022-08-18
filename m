Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7713E598A45
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 19:27:15 +0200 (CEST)
Received: from localhost ([::1]:48308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOjIW-0000Dq-Ug
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 13:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oOjGn-0007HA-Q5
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 13:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oOjGk-0006JG-81
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 13:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660843521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/x5zfY4Hnz2TVjAGZn9AXxE8RUrNWwBIiW31HztdEo8=;
 b=KlVNv4fyc/swZSYpk+LGgtyEm9AToHlzq04UkFPIw0MC5g3Xgb0IBuJTIwXPSErn5uBYdJ
 w0oRuoFO/+pTANvlermRzIkq/vY+4OG7EW2cCU/rXWpU1By8sAffgaVu3SWxURfBclEyS/
 wDbwh4ooPR9b2dlnicsPF0rurk5QK3c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-KKCrhw1CPT2VZI9eWfyRvA-1; Thu, 18 Aug 2022 13:25:19 -0400
X-MC-Unique: KKCrhw1CPT2VZI9eWfyRvA-1
Received: by mail-ej1-f69.google.com with SMTP id
 go15-20020a1709070d8f00b00730ab9dd8c6so893757ejc.6
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 10:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=/x5zfY4Hnz2TVjAGZn9AXxE8RUrNWwBIiW31HztdEo8=;
 b=Jqrdkl66dLo8jwW0Au5TO3ID58EI9y31Mc3SMvtT7U1gwnBCeYT9+4Av2eqpzPEuIe
 dA/w8IsAtfcHiJLEoIrKtSR6B2OBMN0B44OKcRl1NFEa1TIoPrqn7ppcH2F4e3wz0CHq
 t+gTkMqMjxpzXdJauAbNfPp/LKRcT4CUMPB5em1wfvyp8RVCtkaxF0U9AMt/saXNTtjQ
 unvVjYKjBHDNh2jZfnORJxKkm5mPCG4wH9Jq+NEfQ8x4XrnhXxMd/k3/f8XodlwgGHoL
 u75yTHpLbRblODoujOoVVDvqRWnMdu0GipYlP/GaT3gkSBxZIGlFIdozCcfH6I15vDMK
 cxjg==
X-Gm-Message-State: ACgBeo2swTBxN2QEcL2cvt6WFBVQW+xMwi9Slb3Fg+mr6Wg/kiCDq9PM
 KI9ufv8srl6mxN7wZuhBWVIBPFZzB74wt7AydaWCVYIV8ofFMmWX3mFnMhAe1zUN6VbMRMZRwf6
 ZvIqYMYTSRe4WOVsUDA86f9amh9NmsLpYK4jeWmQ1JL/qQvUnZxBj3QnX6c2ye4PxMsQ=
X-Received: by 2002:a05:6402:40c2:b0:440:4ecd:f75f with SMTP id
 z2-20020a05640240c200b004404ecdf75fmr2975963edb.405.1660843518586; 
 Thu, 18 Aug 2022 10:25:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4JHJZO6/KuUdSLYKWiP8VHTIrHvJDqBhE4c+In/7klja2pBNX7uKM3ANDNcRBLZUbm/jDmDw==
X-Received: by 2002:a05:6402:40c2:b0:440:4ecd:f75f with SMTP id
 z2-20020a05640240c200b004404ecdf75fmr2975942edb.405.1660843518228; 
 Thu, 18 Aug 2022 10:25:18 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170906398400b0073151ce7726sm1097033eje.100.2022.08.18.10.25.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 10:25:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] kvm: fix segfault with query-stats-schemas and -M none
Date: Thu, 18 Aug 2022 19:25:16 +0200
Message-Id: <20220818172516.135723-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
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


