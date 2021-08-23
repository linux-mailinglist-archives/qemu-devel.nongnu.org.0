Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B6B3F5371
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:40:14 +0200 (CEST)
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIbw-0004mf-J7
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIaV-0003M4-F3
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:38:39 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIaT-0007IU-RI
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:38:39 -0400
Received: by mail-pf1-x436.google.com with SMTP id 7so16641426pfl.10
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9YhbKwcUIZlKjGGWVi9LMyqnGm4JxOOty0zVYcxDAZE=;
 b=qoXxe7aS8KGwN5axf9JYFakx+SsSeOKou40/nw4F+8mwi1YIkLVCfASGzIfgnbSzXN
 ShXoPlrdghgKGbALTPesTH6xTmCa0lAk1x4iR64J6bOCUa5s7MjOVAOqh7VnGlnyj21y
 X9GbfeuWZL+CI+Ku4dPhFhxsYOaIycRMZlEhfa4xk65fpTRtOirG7urGOrmkYxXa7n8I
 fIOYG0g77PfRQfoROroXXLlNU30rbvbzP38/hspHLnRJxOy1im6QUtNpzV57PiPKsmX8
 G9gATGw3qKOSXZB81PZtQm5vd8iDLw1SFUCyQ0AXSvJ/+yIvYiUuuALkYpbMbHjKTJQ9
 TgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9YhbKwcUIZlKjGGWVi9LMyqnGm4JxOOty0zVYcxDAZE=;
 b=SaYlZuzBk7t3JDGvqDRhzGaE0vdvZMaZODx12H+69hYNFu4vv5HfsORgry4xUb/SVg
 rnjcKbp4z7wCKLMcOn/vSV6/L1ahixoi40z4HCb6poml6tbUUWWQEwQHADprrIqrWYm7
 l2Wyv6GjaPjUJdnC5/hYxpSOaD4miVHCVPJyWnlhkd+pGyHiM+byiJVG/rdpPDa5ur6B
 qPjM1GudX788jsiGDty8OMroxPP4lKD5mwqasbV0bEON8L3UA8csdV23reizaIowJC+0
 bsZk8vH1/rEjsJfJ+2by2jOO7xENT0n1P6b5r1SWan5+uB9NkmgrgwQTs3h1rPqQieB2
 jsBw==
X-Gm-Message-State: AOAM533Ws47Q97pyz5ATHEost/aLc+2emJTPW7Q2gcFB9h1eCp9dkxUX
 MAAc0Ab7EyXkW/cq5rTnWosNyLyK348=
X-Google-Smtp-Source: ABdhPJyB+k+E1/hwGh/s24dEG0E2+0GMIoNZqfTfyQDtIAa5MHeRRxPIYm1cBoQryvT50ri5jVCOZA==
X-Received: by 2002:a63:6ca:: with SMTP id 193mr33710577pgg.265.1629756488857; 
 Mon, 23 Aug 2021 15:08:08 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id j21sm16217454pfj.66.2021.08.23.15.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:08:08 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/5] python: Add entry point for aqmp-tui
Date: Tue, 24 Aug 2021 03:37:44 +0530
Message-Id: <20210823220746.28295-4-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823220746.28295-1-niteesh.gs@gmail.com>
References: <20210823220746.28295-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x436.google.com
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
index e9ceaea637..0850c7a10f 100644
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


