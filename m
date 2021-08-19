Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1D3F1F4D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:43:22 +0200 (CEST)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm4X-0006H1-7b
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm13-0003Rl-O6
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:46 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0w-0000v8-Tk
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:43 -0400
Received: by mail-pg1-x532.google.com with SMTP id o2so6574298pgr.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3Y0xnQlCQMo4Htg0UKH12TeCNltRyFFwKPt8huwMb4A=;
 b=DF6GSwJ2N66ch7ND2KTzCZ99c0n+eYrYMjKqUWEOj9r0lO/yrs2Dpaec8OxPvT0IMy
 u1NVHFM2v6zDOiLBB3gupL46h/l4jjGxLcH8z9drNGslBHmnl3cWOzrJuM8l0jTSyufP
 UmoPiLlfluGuUxax2ZlxY3n90fFROF9IrC9yV08oQBkY8Ej4/rvyt8DgNamn6fJeCauh
 Zl3tcGMqCZtisrVywL7Mydrh5iWPYk6D0vY048iZ959s6TKyvGAbMTco6H1kDg0XSzlk
 P0dZj8AN8rPaN2qSpr9CX3cX3APomgKohQOdb03NuY5OFD2O8b9fWwK3apqYrLo64qqS
 tc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3Y0xnQlCQMo4Htg0UKH12TeCNltRyFFwKPt8huwMb4A=;
 b=A3o7MboItSzRFyvNkb2zXUcHgUvSC/C9dklMGqo1jR9kQP6tQaYiZPIDN5fZlQFfxW
 GT+nhkX9LWMhd35WO0QqbRAJ8u8bM/Pm5q5pUGCq9KbEjRKb7Ko6AYvij3SzubsD8faj
 ycy67QdMtoFjd18kVkWiAKdBgVjK9DwDjOL7eQ1VXeXmhY682r3S13pqYVlEmZ/69FRA
 bKp8cgAHlwNlr6svX8AHCKA0auym7ZfY3/d/ZfIRlCnRRyiZvKsr1xnJlXDaSzWkQD1v
 +3NQog/3CvLcaZJGLHHZ3Xqe/0hvhsIekN0M/RNl2LagG9veWPFyInNaL1xMk2TAVhjo
 uH7w==
X-Gm-Message-State: AOAM531F56bght+wQS9SZ8QH7y+Wzy4Xyqq7cjJQpWyxIPH0YKkGLQPs
 xkj2hfOsyoOUAPSCRXDInszFK8qSBkM=
X-Google-Smtp-Source: ABdhPJwlCVmMiVuiGe0x93pywN2ydFN3zYjOkcnIVsFjRcnwByo3Ciy1VbO4+qcjyr7yiGst5oztWg==
X-Received: by 2002:a63:a511:: with SMTP id n17mr14916375pgf.156.1629394770493; 
 Thu, 19 Aug 2021 10:39:30 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:30 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] python: Add entry point for aqmp-tui
Date: Thu, 19 Aug 2021 23:08:28 +0530
Message-Id: <20210819173831.23515-5-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry point for aqmp-tui. This will allow it to be run from
the command line using "aqmp-tui localhost:1234"
More options available in the TUI can be found using "aqmp-tui -h"

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 1ff2b907a2..64ed0be0a7 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -66,6 +66,7 @@ console_scripts =
     qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.qmp.qemu_ga_client:main
     qmp-shell = qemu.qmp.qmp_shell:main
+    aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
-- 
2.17.1


