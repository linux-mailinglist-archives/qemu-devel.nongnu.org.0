Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45C3C7971
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:12:52 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qe3-0001Zr-MD
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZI-0001R6-OT
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:57 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZG-0006BZ-3H
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c15so126939pls.13
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A7NQ0ep9pW2suRHd8fMyEP5903fARm1EdM1W099gVSk=;
 b=YrEsiC9OBdak0qCOuFVbRFEwZbbKG9kK179z/6a2NUNoSetYcMn1Ifl/YSpJb04DhS
 rTX10tI0P7jbKW6eQ+ei9NkDLdDh0QQcL8swupXEEcXRV86EEYZZlBYjmqAugB/h95bM
 UZWSk+b1EZqxqRyLmvExvaMOPb1na693HKWZ0Ee/t0OHgJ+MofzzjpoPQtcRaLeDMYJA
 kJpYOrLBUVq7qVQgbQZC+jsVATr/WcPyQiGFLsztWG59QpalSSI+H3ge4PgsrSzHp0ol
 cYxPZTtxy3RL5gVFKptDB0s3vGr9tBRr5CdVyu5bclZJOnGHphZeGmfsFp8fpFEchuDJ
 lOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A7NQ0ep9pW2suRHd8fMyEP5903fARm1EdM1W099gVSk=;
 b=SoxS4gMXMB/MRWBmbmfG+yMorGfK4Pt8nSOPEJXcy/urdiCIqD9V2bKlyHevxzIucS
 9PQr8Qxpbl+z+yM8XBfNM38kg2ufLNTjLVF6i4jh5VXG1xOi7jAiju9hvk2wAxru55Kv
 XMvLZbGCGz7CGEtbpCqr46YGJPJGvwqnyPyBIVoLZ6I3io0SHsn9sAUOiUMtn5hpPrkH
 XECdPCJgQSsbVBFbIERlqXfZO5CIVrN/QK0ZKUTpTteDJWNVwnXEWBT8czhKxDtEPpPd
 aldNYek9+MnnBATkgzaepA6mlP5uM8Gyi/O1ZI9zkeM+UZJT6lVj52eM3n3G7x2yXJ57
 vibg==
X-Gm-Message-State: AOAM530YgzO98Z0AuhquPh6wXUenljeom/F9A4VVmHOEWTTDz6+65wU2
 xr4uU9UdFQUnvcYZZ90CUELnWXVu0DuPdQ==
X-Google-Smtp-Source: ABdhPJwL0sT3REGRyGgvZ27RxO6rJjbE5wsVkl+EUODwj9ra69g8tqpUdglB/YhfAQQb+wMFh0+pZQ==
X-Received: by 2002:a17:90b:3757:: with SMTP id
 ne23mr417400pjb.72.1626214072066; 
 Tue, 13 Jul 2021 15:07:52 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.183])
 by smtp.gmail.com with ESMTPSA id w16sm94678pgi.41.2021.07.13.15.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:07:51 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] python: add entry point for aqmp-tui
Date: Wed, 14 Jul 2021 03:37:34 +0530
Message-Id: <20210713220734.26302-7-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713220734.26302-1-niteesh.gs@gmail.com>
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x62e.google.com
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
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
index 63f5156c03..082bb6d68b 100644
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


