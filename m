Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08A33CA10
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:40:55 +0100 (CET)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwpS-0006cr-QG
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwki-0001fK-NC
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkh-000682-59
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6BBn5vssgsAAS7Wq1Lwd9IGurGqJO6B2sJ19UJyeK0Y=;
 b=gN1d27nwD3h7GPvtIauE01Zht0PDz7TLsK0o0kW4r08MbvUGJ3w7E02JV3EVjVtR2CRbSf
 qB8YVkjwawuY8uElIw6Jqv7Czlxo0wMiKWbeQDp+iupg1B/8gflwjuOFpw1FtBBu6Kml8L
 Te6rhM+FdNWxwG1Y9QE8Az2UoPWpGAk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-Qco2w47jN6C8mhJnWVA5oQ-1; Mon, 15 Mar 2021 19:35:54 -0400
X-MC-Unique: Qco2w47jN6C8mhJnWVA5oQ-1
Received: by mail-wm1-f69.google.com with SMTP id z26so8864424wml.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6BBn5vssgsAAS7Wq1Lwd9IGurGqJO6B2sJ19UJyeK0Y=;
 b=DdBod849V0EJQcgrJdnY+TJYlvMYwshG+r2k6bKZjW1ANFFExdmStXHkXH4se2WU7j
 /R/DaSk3UVPl/Zxs8ZGQYYc/bhwwNQkjRKmV0IAXnsORYWPLrvCHwCC5OljPKtXYVggi
 3zcQKWWExYi9E7pEL80EMRnc5Ooyhev50TwGRmWRC4c8dnOheRU1Zmmx1NcCBtpjYJ3v
 uLF5YKF/BrSh6j8PRe4GX27DxVVwmsO/bvRxNqr89MY8dPLbLqZsTVgPolCp6SoAqWkp
 I6P7m8pq/9DtvlNn09K5CEmk1g3F69NH+dvDj2qeiJZ2XlHNnJrOKXMPvu2Sz/qfv1nk
 P2ow==
X-Gm-Message-State: AOAM530+o5sNTDDZQYoImWwPewlHxQaKw503up4QkKA1yVZPes1sM8bF
 5NGP+HzWltrG25UsnJTXdokb77OjOGdrgpfd7Qb2V9GbFdeWYg0QoeIpbgWsD5EVAyfXaVpOGeH
 1zOrRQ3up1WO2+ZDFAECXBmPwE6A4+NL6WChvbTH/tTa0OfgSEI+WXvKF+fjIyMYz
X-Received: by 2002:adf:a406:: with SMTP id d6mr1871471wra.141.1615851353497; 
 Mon, 15 Mar 2021 16:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr6EvMnnpRd7ctI9ReQD5eZVXh0zu8D2Tp/c24fnu9aFlweSYhWUOAQepxxyE6Ow+nmnktlw==
X-Received: by 2002:adf:a406:: with SMTP id d6mr1871453wra.141.1615851353257; 
 Mon, 15 Mar 2021 16:35:53 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h62sm1255531wmf.37.2021.03.15.16.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:35:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] hw/block/pflash_cfi02: Open-code
 pflash_register_memory(rom=false)
Date: Tue, 16 Mar 2021 00:35:21 +0100
Message-Id: <20210315233527.2988483-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call to pflash_register_memory() with
rom_mode == false. As we want to modify pflash_register_memory()
in the next patch, open-code this trivial function in place for
the 'rom_mode == false' case.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210310170528.1184868-6-philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 0eb868ecd3d..897b7333222 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -467,8 +467,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     switch (pfl->wcycle) {
     case 0:
         /* Set the device in I/O access mode if required */
-        if (pfl->rom_mode)
-            pflash_register_memory(pfl, 0);
+        if (pfl->rom_mode) {
+            pfl->rom_mode = false;
+            memory_region_rom_device_set_romd(&pfl->orig_mem, false);
+        }
         pfl->read_counter = 0;
         /* We're in read mode */
     check_unlock0:
-- 
2.26.2


