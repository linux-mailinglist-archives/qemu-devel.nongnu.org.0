Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006E03FFF2E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:28:37 +0200 (CEST)
Received: from localhost ([::1]:50468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7N6-00016g-1g
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74q-0001JC-Sa
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74n-0002AQ-GT
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqD7iyLbQ9DTFxBdziDoBhccB1nGTykeUMkgqm25WoQ=;
 b=Vb21pMcHoSPZwry1LiOn0Orkon7uiqaGUrrT92zfiMsVyMjmiKQAK+VCxdvwF3XafNMOQF
 oMieNzoA+o1GMs8irZkEKd/oczv8G+JTM1qbRm77Re1MMFzhP4Y5BntTh2p9wCiW6h2/qD
 B6D+F5yISnyHOe47MEcxFOUYp4fJMEE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-LGqMSfsENzqjm6UEG7Ethw-1; Fri, 03 Sep 2021 07:09:40 -0400
X-MC-Unique: LGqMSfsENzqjm6UEG7Ethw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b126-20020a1c8084000000b002f152a868a2so1708074wmd.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jqD7iyLbQ9DTFxBdziDoBhccB1nGTykeUMkgqm25WoQ=;
 b=pib1O/7I0xhOkYCoaKE4/R8WIigjPWIO6+iFMezNgHtrvMAUuwB3g+JEBwj9n+7JF2
 gEYDjAuDNE6GEDcrgqVMVA47WNAtdXd2L/W0WnG8uuJC4FOrdh2p/qvEh6eCuDavUUoB
 /oNjBo12Nd06JiH9vRaoilWmCiyHY1N+qMLjNnY9julUvGniuOV74qie9wR6a80WRhnJ
 Jgd2fKU41vzHEgBUAyuzcU0JCHPLCDhl4e8qeFkGWY/7pV3HnRGNI95Sz9V6dCbLlpk7
 gIS5v3QQPbiXLMYUItxHWdXc3nieCHD9Bq5wmCqnLmFPhbjQMTkhe8oW8NGozALBhcMF
 fMvQ==
X-Gm-Message-State: AOAM532tdRkj4U9L9jjHRNy8+s9cfTn4JV0OXSxHO1lK+lbT1dP2F/ps
 flm9J+fvcfCLGuWCeaJkzOH3ah7INIxIVQEb44AhQd/wGKKLi8BdtCYMneKVyIhaBkiS557adnl
 ZtbdUYw2sn4OsHO79ChXX8MWarNCLtTg6Kf+3gBTc7tQQZb2T29EX2EHHcV2NNE+0
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr3532015wrr.382.1630667378688; 
 Fri, 03 Sep 2021 04:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMOvBdWerfmwLS6/8RuY/Oazm/1aA8TyZs75/crfM2ZbilJZTIPESof8HJh+OnE/0lMkkuSw==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr3531951wrr.382.1630667378445; 
 Fri, 03 Sep 2021 04:09:38 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t23sm4712670wrb.71.2021.09.03.04.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/28] contrib: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:07:01 +0200
Message-Id: <20210903110702.588291-28-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 contrib/plugins/lockstep.c |  2 +-
 contrib/rdmacm-mux/main.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 7fd35eb6692..119a8054b3f 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -130,7 +130,7 @@ static void report_divergance(ExecState *us, ExecState *them)
         }
     }
     divergence_log = g_slist_prepend(divergence_log,
-                                     g_memdup(&divrec, sizeof(divrec)));
+                                     g_memdup2_qemu(&divrec, sizeof(divrec)));
 
     /* Output short log entry of going out of sync... */
     if (verbose || divrec.distance == 1 || diverged) {
diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index 771ca01e03f..d447d50f538 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -227,8 +227,8 @@ static RdmaCmMuxErrCode add_fd_ifid_pair(int fd, __be64 gid_ifid)
                            RDMACM_MUX_ERR_CODE_EACCES;
     }
 
-    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
-                        sizeof(gid_ifid)), g_memdup(&fd, sizeof(fd)));
+    g_hash_table_insert(server.umad_agent.gid2fd, g_memdup2_qemu(&gid_ifid,
+                        sizeof(gid_ifid)), g_memdup2_qemu(&fd, sizeof(fd)));
 
     pthread_rwlock_unlock(&server.lock);
 
@@ -250,7 +250,7 @@ static RdmaCmMuxErrCode delete_fd_ifid_pair(int fd, __be64 gid_ifid)
         return RDMACM_MUX_ERR_CODE_ENOTFOUND;
     }
 
-    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup(&gid_ifid,
+    g_hash_table_remove(server.umad_agent.gid2fd, g_memdup2_qemu(&gid_ifid,
                         sizeof(gid_ifid)));
     pthread_rwlock_unlock(&server.lock);
 
@@ -267,8 +267,8 @@ static void hash_tbl_save_fd_comm_id_pair(int fd, uint32_t comm_id,
 
     pthread_rwlock_wrlock(&server.lock);
     g_hash_table_insert(server.umad_agent.commid2fd,
-                        g_memdup(&comm_id, sizeof(comm_id)),
-                        g_memdup(&fde, sizeof(fde)));
+                        g_memdup2_qemu(&comm_id, sizeof(comm_id)),
+                        g_memdup2_qemu(&fde, sizeof(fde)));
     pthread_rwlock_unlock(&server.lock);
 }
 
-- 
2.31.1


