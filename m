Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16063BA50F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:32:32 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQlz-0003U6-PT
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQg6-0002QV-Vz
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:27 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQg5-0001Uo-95
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id o18so10352878pgu.10
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fCsZAk9ohgJJAMt1uczKgBPiMIgmfeEDdbzZxu6hJsk=;
 b=SzX6BGi+slZ8SuMaQpHX7b3F+ePSSk1c0CMdYmOS6aCCThKqtal4gwy/fXzFhzoup3
 tG5AtQYKVXu1KAKvv7TE8p9R5dQaqmWAiBsLC3T26bq1vWLRMi8xCEM3sVrlquq2kIoK
 eAiaZwo++lPg/ElTubMHTY/17lWrqIUblV2OBxpdpOuZMN7H254eXQdA9aTOAppVHX7I
 QaRtZKtD+raArP/x1XWcfduztY8BaTVZZcBDr3BQo7cshYpmZYsgyY9DZ4Mz0MLTSikk
 OCl/ZvhhSZeVgEH/zXD2Ra3KY/bU9GNFCT/IuPB2Lz+cG/T1qBpSJjnEpYFYKORfTXTZ
 Ty0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fCsZAk9ohgJJAMt1uczKgBPiMIgmfeEDdbzZxu6hJsk=;
 b=g9rgEmx2M2eCjG8baSWr1bpAVwZyBhTjf/Wg1hHoRxkKjUxTX15PVoNX6Lhq4nhorB
 cy7LhrPH1LLBya2FMowxx3VkLJBkKr+xVgtFCkndqE3RvPTAo4MQ0vaKwyLSkGjxt5H9
 F2ze4ZdVmk46iYoYxwjlhKlwpbB3PGZqLb5OVHKDfkc1nCr485sm7KMoWqkfBcLTeco2
 OaQIuCU77W+s59gvCJgVBIeqS/S0rzU2PCcGbtoZ1QWWxJ6/Oo7oaYBwAlWMid1uyxNi
 T8ZKpWA4rFvVqVFYZxgXt+3RZgZEHra8cYmFSFVm2tUPz2hE/ep7ow9fFPmwSORYHuQo
 46Zg==
X-Gm-Message-State: AOAM531D3Xswtg8kQgpYj5LCklgMu8SHYzdyBumbem8z6NiI1dJx/vku
 mzTQ+lDMPaOCO5oU0CJ/DX0=
X-Google-Smtp-Source: ABdhPJx1JpDWyOZxsyqVAsgnUeQS/p6lGfC9ybOo2/NbH8HzGT1lcqsIaBISXl2v1Lu8V3vgbttyTw==
X-Received: by 2002:a63:1c0e:: with SMTP id c14mr1910902pgc.11.1625261184158; 
 Fri, 02 Jul 2021 14:26:24 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.1])
 by smtp.gmail.com with ESMTPSA id o16sm71563pjw.51.2021.07.02.14.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:26:23 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: jsnow@redhat.com
Subject: [PATCH 6/6] python: add entry point for aqmp-tui
Date: Sat,  3 Jul 2021 02:56:03 +0530
Message-Id: <20210702212603.26465-7-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702212603.26465-1-niteesh.gs@gmail.com>
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pg1-x533.google.com
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry point for aqmp-tui. This will allow it to be run from
the command line using "aqmp-tui -a localhost:1234"

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 4782fe5241..23e30185f4 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -68,6 +68,7 @@ console_scripts =
     qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.qmp.qemu_ga_client:main
     qmp-shell = qemu.qmp.qmp_shell:main
+    aqmp-tui = qemu.aqmp.aqmp_tui:main
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
-- 
2.17.1


