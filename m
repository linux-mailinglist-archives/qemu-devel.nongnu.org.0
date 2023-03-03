Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6DD6A9D26
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94p-0005xe-GU; Fri, 03 Mar 2023 12:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94n-0005sO-BK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94l-0003hZ-PF
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9O6fJIqlLXWdx5dHdf4NLeETtgW5YiFIfwDZxywUT0=;
 b=IPpKd8aGuHVNiZT4c9W6JyjDsbKmGweaqX+sTGoayzxAsLFI1X2VHM+FvmEEr6EDfPnVOi
 gELnzSju1sNZFapxltnDpPSBfcfmjXGbX7cvQzADt5G6hGO30wrbVvnWFUMMscaRKOQu+J
 PKhC0nPji7CDIpPIzH+m2GY1pDzOdTs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-EUsSPXWnNimNuEPm8aX0sA-1; Fri, 03 Mar 2023 12:20:09 -0500
X-MC-Unique: EUsSPXWnNimNuEPm8aX0sA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so3158902wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9O6fJIqlLXWdx5dHdf4NLeETtgW5YiFIfwDZxywUT0=;
 b=RNdny+3DwZqntG1JleDnZdK8bKq3HYbOLreuQ/8FiStqUqaIszC+7qg84yZAysqF1i
 GP26JfyzOHVBrtf4QIdtaGg0WLNJ8FkiBR3f8hDl+usCVGi7oyIZaus8uXY/pVqIHs38
 o/oEqrp4JeBD+55Bi7L8FotHFpxdCNraOzrBEQ3jPk/L9LIr6HZQgMLjouuKoh3Fjpfy
 dZSYS3VymuBpIpbF01r2sJZmXfFj5Slt0ZN64R/FSsIbaooemolWIhTDp98xxzNKeXJR
 KaVeNaZY8xKSdMlsNWaKLHZ3y3+/AGmYpY5S61VlbcPq6BnmcgCC+OoU3tGF9DMpYTuP
 xPwQ==
X-Gm-Message-State: AO0yUKWHH1rGmEPwl8LF7928jim/jf6Z02CyEr+3I5uxqtvNnhEKisY+
 twZ3jjOMREGQ7+/HikmvZmkWx+gbrjsONf4xOrLhX8jtVwwU00WFH2oBxWKI60jPgc+b5uLHaBd
 vNZoJ08cL2eTl0e6QgYht3JHOYwBDkmj1JEFDS1G2rdc/kTX0iwkA6c0XHwGbl0YTfs/Pz0Zv
X-Received: by 2002:a7b:cc10:0:b0:3eb:3104:efef with SMTP id
 f16-20020a7bcc10000000b003eb3104efefmr2262416wmh.31.1677864008200; 
 Fri, 03 Mar 2023 09:20:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9cNa09/RKZDrhfaez8DvhU6nHTsiGgKgQntJhCFLHNqVT3pVWpVaaW0RX81XdzyG8Mab4v4Q==
X-Received: by 2002:a7b:cc10:0:b0:3eb:3104:efef with SMTP id
 f16-20020a7bcc10000000b003eb3104efefmr2262397wmh.31.1677864007969; 
 Fri, 03 Mar 2023 09:20:07 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5945000000b002c3f9404c45sm2692070wri.7.2023.03.03.09.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:20:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 8/8] physmem: add missing memory barrier
Date: Fri,  3 Mar 2023 18:19:39 +0100
Message-Id: <20230303171939.237819-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303171939.237819-1-pbonzini@redhat.com>
References: <20230303171939.237819-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 47143edb4f6c..a6efd8e8dd11 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2927,6 +2927,8 @@ void cpu_register_map_client(QEMUBH *bh)
     qemu_mutex_lock(&map_client_list_lock);
     client->bh = bh;
     QLIST_INSERT_HEAD(&map_client_list, client, link);
+    /* Write map_client_list before reading in_use.  */
+    smp_mb();
     if (!qatomic_read(&bounce.in_use)) {
         cpu_notify_map_clients_locked();
     }
@@ -3116,6 +3118,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
     qemu_vfree(bounce.buffer);
     bounce.buffer = NULL;
     memory_region_unref(bounce.mr);
+    /* Clear in_use before reading map_client_list.  */
     qatomic_mb_set(&bounce.in_use, false);
     cpu_notify_map_clients();
 }
-- 
2.39.1


