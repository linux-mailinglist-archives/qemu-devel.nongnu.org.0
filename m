Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C424D3ABA93
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:21:09 +0200 (CEST)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltvhU-0007CZ-DR
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltvgX-00060B-8X
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:20:09 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltvgU-00039R-Rp
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:20:09 -0400
Received: by mail-pf1-x433.google.com with SMTP id u18so189131pfk.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yzj8l7qKtSA6Ie4sjH8umke0+4FuqtQ79lkD+X7lNkw=;
 b=TeXwir7UWNlALie64af6E1dM/3ekbS4LCg3xUVG4StF/Ly9kgx9BIlglpoEzLSBnU/
 FDfutSnahDGawjKGJlQnQQIuCIxJyuKrPm2HsKiTTORTsgppsNgZUprxwMwAdrGRcERv
 BtbpF9f7Tq6cdcOmIhSEfB+pINqOBO7NMo02j3NktAw5TPtRz0n6Twoi/DW+0eGK5BRq
 SyDEilViV3pfhLVWjSNtnS5125R9aV4WYT9Zyo/AXNi5MQgUYobD2aIReJZGWRZOkTnA
 XSly+dow9e/M+13VeN+KJtyyaM88v/xxPu8M8lgjqOiWeOyP7a99VMJ9cS11UCpH/eP1
 MPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yzj8l7qKtSA6Ie4sjH8umke0+4FuqtQ79lkD+X7lNkw=;
 b=Hrcn6IeSiKQx7L4JLFavoLFrCLzX6fabSyoWSwQ0ZBLhtiYtcyqFOIjRw5ZPJUU4Sw
 vBycxjBnfglBAYHZzcuigDXyLHFDiQp8CzaJd6xSCNRixV2gaVyDwDMWv1rrBMH0rWP4
 SGZaM9djjLhcfrL7qJo1WBWqWj+qaMuSUSYCkFZnkG5lRGEaMuSTHn2b0m/aUVfqgi9G
 BW65r0y2urtY4W7WlmzZsIsFfdXrKijFf6eIaf6ZIcvjnSQ3sCYx3wrYQk5HBb/xtWna
 7ss2yvMU+c84f88iOMLKX9FdM5A2IClfdIcPqaTIqkKVbUfa15+wkOYfpLko1aJo68WG
 8GJA==
X-Gm-Message-State: AOAM530BmB0mi9w89DKuxlhb3r7ldySrB2rcADrZS2CC2vpbkMhVn+3R
 XygKPrRw1sEtfoKX5l7G0tlaT5qoOdFLvA==
X-Google-Smtp-Source: ABdhPJytkXLEx0vfTXyPK20X2xE9MPLlw+KoSc5V7FXeo6JIB33500Al9zPvNYvEiXMt+Rt8jVWh1g==
X-Received: by 2002:a63:181f:: with SMTP id y31mr5865226pgl.145.1623950405242; 
 Thu, 17 Jun 2021 10:20:05 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:c6b:ce89:81f5:958c])
 by smtp.gmail.com with ESMTPSA id z18sm5351903pfe.214.2021.06.17.10.20.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 10:20:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] meson: Add gnutls as a dependency to libmigration
Date: Fri, 18 Jun 2021 02:19:58 +0900
Message-Id: <20210617171958.34606-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-file-channel.c may depend on GnuTLS.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index a2311eda6ec..29d854699ca 100644
--- a/meson.build
+++ b/meson.build
@@ -2090,6 +2090,7 @@ libio = static_library('io', io_ss.sources() + genh,
 io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
 
 libmigration = static_library('migration', sources: migration_files + genh,
+                              dependencies: [gnutls],
                               name_suffix: 'fa',
                               build_by_default: false)
 migration = declare_dependency(link_with: libmigration,
-- 
2.30.1 (Apple Git-130)


