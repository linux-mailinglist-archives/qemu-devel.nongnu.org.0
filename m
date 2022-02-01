Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600D4A6708
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:25:28 +0100 (CET)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0eV-0006se-Cs
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:25:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nEutf-0005Rh-VO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:16:44 -0500
Received: from [2a00:1450:4864:20::634] (port=41495
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nEute-0002RS-DF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:16:43 -0500
Received: by mail-ej1-x634.google.com with SMTP id a8so55060056ejc.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 07:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJZbBbyEcRGbD8drClEZ+Gp+Jm9BpyB9RWuPE0Ie6bc=;
 b=SStTGfCYmwY2uSSMhxx3P1P9mdqhHiQFZuqmA2pIUqrRYwKuvTI/48a5DF5kc04UC7
 LgawzEWOOdRdUaYo9scyKe9AIiLPAYd1c+yCvkNeOZMey58dkNi1qCFO+C3DXZlI7Bd3
 J1ttKmB0lvawa0a5VgN7mPH9m6lbOnkaQzIkfSpg0QoaG0qgDPoqS2rW4bdHKIMUW/sX
 aq9/pbT0XlbchQuiclGB15mVVeanwwas9aqu43u/ijqPUmYnaEKuOOvR6fUz5j2V2X+L
 8XCkhyBrYIFK51MJCrT6ZyPwH7q7Mkz8i2GyYSzF0OU4d/7NnvGJOqhuSwtFHh5FIz34
 MGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nJZbBbyEcRGbD8drClEZ+Gp+Jm9BpyB9RWuPE0Ie6bc=;
 b=wsjeMT5vNbo6zDv6EH2tcNr47Cu47tPk0AT6dl0BSHZnRyHYX+LOWCNE/BqTQZmqlp
 CzUMUMWSZ1nNIhbpufzWnMeKO6s29TX8oyBNGCjRSlHSgJl28VIjuudW0yJ46Qc25t9r
 QTBB+FX/onr/7qwDhgAWFMqElj5zmvCnbH+HgQ5K6fmCJemBde9HL3V+fQmRbp5aCXcG
 9cp3cYCWDhcyEjqxSwgkR/BOEtzWKDMa8u9kuzP0F1WTlHV4LX8GY8vnNwA2NpZHyIwJ
 LVthVWjmTvk4T2pTkhAdRiDQb0kF9rRo04WYGdsIlzwNiuTmgW+B3obVpu96IQ82af6Y
 alnA==
X-Gm-Message-State: AOAM532AJQW6HQd+k+6DAywMa4yOmmj0CJy/socBJq6YGrqi2scQCHbY
 LvfQvrFUOo6ldwSvm5dYcYXuuXLNT0GAvg==
X-Google-Smtp-Source: ABdhPJwDUIGkc//FiD0zkFGkzQb5J0AoN6t9QEznQmXbCh2GdSoDdScaa5zFJI9zL9AwrJ3pF86Bqw==
X-Received: by 2002:a17:906:fb19:: with SMTP id
 lz25mr15633574ejb.19.1643728297152; 
 Tue, 01 Feb 2022 07:11:37 -0800 (PST)
Received: from jwang-Latitude-5491.fkb.profitbricks.net
 (200116b845f5be00b5688dd60ec5628d.dip.versatel-1u1.de.
 [2001:16b8:45f5:be00:b568:8dd6:ec5:628d])
 by smtp.gmail.com with ESMTPSA id m22sm13444793ejn.194.2022.02.01.07.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:11:36 -0800 (PST)
From: Jack Wang <jinpu.wang@ionos.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/2] migration/rdma: Increase the backlog from 5 to 128
Date: Tue,  1 Feb 2022 16:11:35 +0100
Message-Id: <20220201151136.52157-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::634;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 01 Feb 2022 13:49:44 -0500
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
Cc: qemu-devel@nongnu.org, pankaj.gupta@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So it can handle more incoming requests.

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 migration/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index c7c7a384875b..2e223170d06d 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4238,7 +4238,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
 
     trace_rdma_start_incoming_migration_after_dest_init();
 
-    ret = rdma_listen(rdma->listen_id, 5);
+    ret = rdma_listen(rdma->listen_id, 128);
 
     if (ret) {
         ERROR(errp, "listening on socket!");
-- 
2.25.1


