Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D173FFEBC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:11:58 +0200 (CEST)
Received: from localhost ([::1]:33652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM76z-0004EG-SZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72p-0005GC-NH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72n-0000It-IZ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZHOag7nyoHENtq9LgEUpVfsjfcHne0EwT0c8I8en8s=;
 b=CY21na76qJ/M4LaKX2ShO4OLJlII9GtO9kWqFiYSYWXDTLRdAguZy/uymVjeyXc8uwuyg5
 ZF9d5a284c9Zf5uB6Ywe33+y/Y3I9g97c9PXfj+/+Yr6JxWjrzBynNI14N9jh4R101DuyD
 HmyBye6AxHGlAiejdrQan8c4nhBwvcU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-9X848af9MoW8zDjFw1st-A-1; Fri, 03 Sep 2021 07:07:36 -0400
X-MC-Unique: 9X848af9MoW8zDjFw1st-A-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so1457956wrr.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZHOag7nyoHENtq9LgEUpVfsjfcHne0EwT0c8I8en8s=;
 b=MZ+Pp5OreW7/3i/Wr8wAT86mMTblcEDyaHcIDXonSGxAarpYMzd7TSg4Hrv9fgIC0O
 0zcjuhs4i87NXo8gXK752RB9TosIvMyAZiDruS1dLwzb27QXrHaIfjvXLTt7ADdi7Yfv
 t1qFdQudJENchBIP//p1LoSQmyB7fyZq+0iESCMCehPcUnvXsUHHvy2bRiw/Zp1hoxVB
 2Y/yv3uAqFvyGbiAwindYRrmELNI8d1EEbxlaQj1NBs7j78AlXpHcWTRCKQaAbovQAb/
 DmLTQZDx4Rl+0pWT9H1TV2+pOpo7bzR9kXC6tZCh2XoAwQlio/MZw62I0fj4kzFIAb1F
 dVsA==
X-Gm-Message-State: AOAM533FsoaHVWvwtMwVz85c9O+SYGZ/eveFWSPXelBVpEDe92P7E/D1
 oLOGS6Hhnif3SdONfTZjgxWshfiHK6zVvVR58NZpbM2X451UUsaUK1myyGUXbVwv5N99fExxymt
 n/Duxvhss92vfpoDGWVpBHZ1Zq3pyeeqLPsf5iK5cmWHDXuFSTOR2xZ3ubLiBUBss
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr3345307wrq.282.1630667254435; 
 Fri, 03 Sep 2021 04:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoB5TMIuInAl2n/PRtQj2iipmUHWUxT2HqaGZ7Zes9XsQggaJR678emY6uLRnPMCNKGATEww==
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr3345238wrq.282.1630667254198; 
 Fri, 03 Sep 2021 04:07:34 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 w1sm3983986wmc.19.2021.09.03.04.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/28] block/qcow2-bitmap: Replace g_memdup() by
 g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:39 +0200
Message-Id: <20210903110702.588291-6-philmd@redhat.com>
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
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8fb47315515..ec303acb46b 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1599,7 +1599,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                            name);
                 goto fail;
             }
-            tb = g_memdup(&bm->table, sizeof(bm->table));
+            tb = g_memdup2_qemu(&bm->table, sizeof(bm->table));
             bm->table.offset = 0;
             bm->table.size = 0;
             QSIMPLEQ_INSERT_TAIL(&drop_tables, tb, entry);
-- 
2.31.1


