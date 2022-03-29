Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB234EAB8C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:45:09 +0200 (CEST)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9LY-00036i-B2
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:45:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9Cx-0003iq-3N
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:15 -0400
Received: from [2a00:1450:4864:20::432] (port=35728
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9Cv-00017i-Ik
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:14 -0400
Received: by mail-wr1-x432.google.com with SMTP id w21so19572842wra.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wY7O/mESzSiqaHBUJ4K2Tv3anipr4OYB2btHaa8SA7o=;
 b=lzzT7PS+SHTP4dmFjHlXgzwkmurTnNUlIqzs/44Lx6TK07u09OKLtm2Kstt/1w/p3m
 6qoChV64iqLWHeT0OfMBgHCy6/zyCdwIiiR2xEifxotgqfTf3XkXLOJocqGTjWUVwAC0
 D7atGA/SqV6vKYyer7yAReI32FSaj2T98tvfQcp90aWjUr5Jml82TST/YiF4iJHDsaw5
 xIP+NYio24nqADrGXd5JplMwO6jaL7wuqbTGwgk7sPdMnTMU38gpFaQUjOzvAT49In0+
 b0VmA9N4t5fZh2F1/zHWZa0W5O6I4pgczuR4U+gqssYeoJXEZjNKXRrsE6U15IW6j8MI
 KbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wY7O/mESzSiqaHBUJ4K2Tv3anipr4OYB2btHaa8SA7o=;
 b=ABYAdtelvkh0/QvNrOPj9wUqg/eNF/dFIO2oKQ/mYrligUKRR3yo2urx/2XfA+CUKh
 56C4Gpg/cNThMOUlS8QUgTAlrcgk3+NssimJpB0dXAzuU4D43MaiMuDKNxYKE3Q5PR4G
 BrmBxsU2EMLjvChV/h7R2sEfJztGYfufmBSMEZFhfhfVdLtuw4rwKgXdmLEHQS62zXZ2
 zCCzcMKIPKTZ6A9I265+no37KWO+XYyPUW5sFTzRCNThSG7+8hNjYm1d3u8tMUDbYimF
 jfqsiYS5rSrcgN+MjYQsPB9N1ixDP+ifTEjuCCzFaAcMqMK+M2dR/qM1s2o2U3CCtVhJ
 GubA==
X-Gm-Message-State: AOAM533q/AmjT5zQDyW3NqGDa0fUD/5LqiYrnmnVyYT+HGUz+dLI9GYT
 LcrJGdb2LODO7D+bPng7dWXPn3GbLN8aVg==
X-Google-Smtp-Source: ABdhPJxJCQJM+PqxADMT3uouKFfyO0TWBArr6R2tq6C5Tq4lyrxLp6/ubqI+luCZWz5GiBSUGWhd6w==
X-Received: by 2002:a05:6000:1566:b0:204:20d9:a5b0 with SMTP id
 6-20020a056000156600b0020420d9a5b0mr31050906wrz.207.1648550172090; 
 Tue, 29 Mar 2022 03:36:12 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm1868323wma.21.2022.03.29.03.36.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Mar 2022 03:36:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] memory: Make memory_region_readd_subregion() properly
 handle mapped aliases
Date: Tue, 29 Mar 2022 12:36:02 +0200
Message-Id: <20220329103604.41208-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
References: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

memory_region_readd_subregion() wants to readd a region by first
removing it and then readding it. For readding, it doesn't use one of
the memory_region_add_*() variants, which is why fail to re-increment the
mr->mapped_via_alias counters, resulting in the
assert(alias->mapped_via_alias >= 0) in memory_region_del_subregion()
triggering the next time we call memory_region_readd_subregion().

Fix it by using memory_region_add_subregion_common() for readding the
region.

Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Fixes: 5ead62185d23 ("memory: Make memory_region_is_mapped() succeed when mapped via an alias")
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220201100940.47788-1-david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 8060c6de78..bfa5d5178c 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2626,8 +2626,7 @@ static void memory_region_readd_subregion(MemoryRegion *mr)
         memory_region_transaction_begin();
         memory_region_ref(mr);
         memory_region_del_subregion(container, mr);
-        mr->container = container;
-        memory_region_update_container_subregions(mr);
+        memory_region_add_subregion_common(container, mr->addr, mr);
         memory_region_unref(mr);
         memory_region_transaction_commit();
     }
-- 
2.35.1


