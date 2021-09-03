Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB23FFF5B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:47:02 +0200 (CEST)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7ev-00035V-4H
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74f-0000l8-MF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74c-00023V-UC
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TRLuEzHEF/4g6uAMMisPruZyA4xzKhXkVqPhmG3sbs=;
 b=aGfRIL2442+7+Q8sPvWQSeR678VaGFP3O4nd/Ht2Jw4mbQIGoETLxkx7jWryDhCH1F1rQz
 HfrzdXIViJCufz7vmNAk7ZrVC94iJr5jdmDiGQYIhC5s1vYAmyZvONOGwkyP7k2CWLT2jp
 df+xVV+17nHsgyvTWtwZhWoKQQnEYqQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-QhLcD8nNPm6H4OLYbWyl4w-1; Fri, 03 Sep 2021 07:09:29 -0400
X-MC-Unique: QhLcD8nNPm6H4OLYbWyl4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 b126-20020a1c8084000000b002f152a868a2so1707929wmd.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1TRLuEzHEF/4g6uAMMisPruZyA4xzKhXkVqPhmG3sbs=;
 b=lddYwR+ppjzsR3zsip3Gok6xbj/3UV3JntuVSaemGzmFfBKBzC4668AUY1FaOmbR0E
 MGWASW0IGDXlNAXYiYIVHVTdLiU271ICMRrx7KI0S6BHXJxDYyzc6C9WyyCFYwySobC9
 4NFaY3dzqtHuni43JVvCn4jevov6ANFNY7jGqboXHToadx98ChnTxr+BF08nAIBaW8RV
 vCvHlPzpfrJViTShMBJHd+NVqVFnIfMhaCpkf9nJm8MMV/JsIq9lFfwI8zU7hQ8BBoeT
 SjTz3TJdYTKC6yKCU/12O6AGqSwQKuw/7jjWymZ014TV6EThBin4mg4ZoFH1cHdG0QQC
 ucTA==
X-Gm-Message-State: AOAM533l+xSroDkHdDuH7SixALUdhzZ3y+YRNvzf/55X+IkRqcBiyQac
 UqJ+9KJJlDj/6z/ivcBIpX9TJvqLD0LidwgvLtYvogL9evoCZNXfoqbbB3EyXoe0URaTrNA52EN
 EJw+1QXuU66/Qp3SLUn6akMuV8yUSRzM1x1gpqwvGfDJnFSiartPXPHCwPoUsHzzE
X-Received: by 2002:adf:eac3:: with SMTP id o3mr3437748wrn.60.1630667367374;
 Fri, 03 Sep 2021 04:09:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx66CtwoDGpHiwwHLDTWFbbSa3lc4biNGGpcp8z6UWY/Npax4D9p0PpnTBANuSDcT5pc6KZ7g==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr3437691wrn.60.1630667367173;
 Fri, 03 Sep 2021 04:09:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q195sm4179375wme.37.2021.09.03.04.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/28] target/arm: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:59 +0200
Message-Id: <20210903110702.588291-26-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 target/arm/helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d4..f3aeff399b9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6242,8 +6242,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
         /* Create alias before redirection so we dup the right data. */
         if (a->new_key) {
-            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
+            ARMCPRegInfo *new_reg = g_memdup2_qemu(src_reg,
+                                                   sizeof(ARMCPRegInfo));
+            uint32_t *new_key = g_memdup2_qemu(&a->new_key, sizeof(uint32_t));
             bool ok;
 
             new_reg->name = a->new_name;
@@ -8818,7 +8819,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * add a single reginfo struct to the hash table.
      */
     uint32_t *key = g_new(uint32_t, 1);
-    ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
+    ARMCPRegInfo *r2 = g_memdup2_qemu(r, sizeof(ARMCPRegInfo));
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
 
-- 
2.31.1


