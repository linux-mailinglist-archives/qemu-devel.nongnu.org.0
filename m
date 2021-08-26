Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389303F8F4A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:55:36 +0200 (CEST)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLTL-0005dc-8x
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOQ-0004yf-3t
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOO-0002pU-JY
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rai7h32TrTkDK/wiLtMpSewodwbvjWhnx25D5kPSBpM=;
 b=Vape+nU5EIRmNzpGxCEn6wjDu5auxD268RGcs6c768mSQVJzO4fVU2oD+nVJKuSEFiDdyH
 f5trtSl8sLkq+gpoygPqx5U4SniUbToS6HPSSz+lCzpguRlN8fiR0UASKcy4cxw3u5OeW9
 V/LgB633LFGrZ9kS+q9JL8ohb8CzAP4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-b0nJgZRJPryr4XoMIeuSKg-1; Thu, 26 Aug 2021 15:50:26 -0400
X-MC-Unique: b0nJgZRJPryr4XoMIeuSKg-1
Received: by mail-wm1-f69.google.com with SMTP id
 201-20020a1c01d2000000b002e72ba822dcso4772431wmb.6
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rai7h32TrTkDK/wiLtMpSewodwbvjWhnx25D5kPSBpM=;
 b=Zqtqj7etiYa1LMCzXWc9BdZ2gjnkcwkyoYf8/fv8tpQK1kdXim/uXQC222oBXcJq1g
 pJacoQjX7XptmsbdSHH56GbwNy8KDNcfPxfcfd7z88bOLzCletC/UeHQJ5034Ioj1TBO
 eWy/dhbxD/tMUxg/lpHQ1HCwpGYViXXqVNQF1gCnqt/mwEQVj5NhVrbpdYrd2ngsX/Yj
 u8rhyLbwzqgNJt1oQ/LmvNOlaE8Xa+wmkq7vPLtcwEInEnK00wsG3do4T/F0RzlX6ovz
 RYt5/SU1jssZ7/XO+Ceyifto8TEEPu3iTkiP4beKSKUBGCipSxU+q9jeJZYkqMNuBiZX
 uTMQ==
X-Gm-Message-State: AOAM532nVIrkj95nXXgIn11TrmxQkYbR2yXOSR+zfid4vjj1jrG1xXM0
 qgGRLtMnjBS/PXcRlZVgDckDAP30j6y6LJ5KUxShXlHb8+ByTLLiSu4S5oYmI9mFzKoYOVdJ8Mu
 adjiVQAc9fg7ZSMgllVkcW/hWDK/sjvh/2cNLc3RmtPO+gD06DRlxtGfnuCJIHnVk
X-Received: by 2002:a1c:210a:: with SMTP id h10mr7971664wmh.117.1630007425279; 
 Thu, 26 Aug 2021 12:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDRJMm/10Yb6eJeXOOXHlAhtXlhDCxZAVFiUBI3triim5kJuM2Pq0s4mOxybiUpx/CAYgyqQ==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr7971645wmh.117.1630007425097; 
 Thu, 26 Aug 2021 12:50:25 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 a10sm8817058wmj.44.2021.08.26.12.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] util/vfio-helpers: Let qemu_vfio_verify_mappings()
 use error_report()
Date: Thu, 26 Aug 2021 21:50:05 +0200
Message-Id: <20210826195014.2180369-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of displaying the error on stderr, use error_report()
which also report to the monitor.

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 911115b86e6..1d149136299 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -660,13 +660,13 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState *s)
     if (QEMU_VFIO_DEBUG) {
         for (i = 0; i < s->nr_mappings - 1; ++i) {
             if (!(s->mappings[i].host < s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d not sorted!\n", i);
+                error_report("item %d not sorted!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
             if (!(s->mappings[i].host + s->mappings[i].size <=
                   s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d overlap with next!\n", i);
+                error_report("item %d overlap with next!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
-- 
2.31.1


