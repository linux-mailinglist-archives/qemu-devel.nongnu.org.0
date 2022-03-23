Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D4F4E577E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:29:15 +0100 (CET)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4nK-0005mx-8P
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:29:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4dg-0004xo-2d
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:17 -0400
Received: from [2607:f8b0:4864:20::62a] (port=36836
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4de-0004eh-Lr
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:15 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q5so2162566plg.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ARhouW8OXYXIRPQjyAafjquDP6FUc0ZjucITbhHVg5E=;
 b=qrmYjLiXax41wynkldUk46+CTEMhEwNtecSEajm0opdutnFDwZFnb5R/0qKYGW240d
 Xfip76+lUKk9ny0xZ6YhE00J4TKeGUMnJ8SoGN13GNg0qwOnowPKMtRWHdotb/gtDf5D
 MtRHQsTElQmEIKX9ZZdHDbTe5WtCrvk7tdOYhyQM3qFOeBHzl9lmse0tjqCeQBy7UGAO
 ybhOz4GI6Y3MO4ukQmThEULFFMRC2oMeKASkkcCP/dzLf46Qozna5NyY8TjPqJE1DQEs
 GnXGhPd1I7iqkj+/YcGjrCQJ3XokcBCDvDTZ5EW8eBPnuLOf/HAk1jK7Hlg+t8pJiPz7
 v+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ARhouW8OXYXIRPQjyAafjquDP6FUc0ZjucITbhHVg5E=;
 b=24ZaUM9MMMSPC6XmzJcYkL/8caZ2bMusbGihRKiiOujwIcVTsFrpGjlmIocS7gl+63
 dreSevM+w1mL3x8BVVZzfA1ESWtQvixvONKwM+sQV/Q+SEpeqbeMjImYyUREp6QW8sFB
 p61VOEQBhrqe8aBndcwWh1ixMaSjMhsxYF930kGWkH1N+XpwWO7yyLnn80teyitwBteK
 6zjz3fg0ESwcxmNUiX/oVxi3oBUfYexY6+l2bBLePltgy5j2xhV6Bawb7ehXNYNnBLbE
 pgKbdZKvrgeiAQC1l9iMh45SZ5G/lSFS/+hkASsCUXoQAn8rczkT+SvP1ghDOinMLPSX
 Yiiw==
X-Gm-Message-State: AOAM532Yh8HBl9kDmO6og0DvHDEusJs3VsB4GhHchxbsv8iC3pbzBPsJ
 YkHzfSdMFxZiDeuYzTMxlkBuLSoySXI=
X-Google-Smtp-Source: ABdhPJzLdZtFm+tMEOoscqkjQAgJQZm9yuu7A4C9NQT5lLkj2BUY8yeJrCTrFbO4ucEGmuTjUPWoUA==
X-Received: by 2002:a17:902:bf07:b0:14f:a3a7:97a0 with SMTP id
 bi7-20020a170902bf0700b0014fa3a797a0mr1005569plb.105.1648055953255; 
 Wed, 23 Mar 2022 10:19:13 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 5-20020a17090a1a4500b001c54dc9061esm266865pjl.51.2022.03.23.10.19.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/13] accel/tcg: Reorganize tcg_accel_ops_init()
Date: Wed, 23 Mar 2022 18:17:44 +0100
Message-Id: <20220323171751.78612-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reorg TCG AccelOpsClass initialization to emphasis icount
mode share more code with single-threaded TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ea7dcad674..d2181ea1e5 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -98,16 +98,17 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
-    } else if (icount_enabled()) {
-        ops->create_vcpu_thread = rr_start_vcpu_thread;
-        ops->kick_vcpu_thread = rr_kick_vcpu_thread;
-        ops->handle_interrupt = icount_handle_interrupt;
-        ops->get_virtual_clock = icount_get;
-        ops->get_elapsed_ticks = icount_get;
     } else {
         ops->create_vcpu_thread = rr_start_vcpu_thread;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
-        ops->handle_interrupt = tcg_handle_interrupt;
+
+        if (icount_enabled()) {
+            ops->handle_interrupt = icount_handle_interrupt;
+            ops->get_virtual_clock = icount_get;
+            ops->get_elapsed_ticks = icount_get;
+        } else {
+            ops->handle_interrupt = tcg_handle_interrupt;
+        }
     }
 }
 
-- 
2.35.1


