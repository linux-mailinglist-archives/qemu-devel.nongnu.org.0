Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32983387FFB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:53:51 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4qk-0007za-67
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cI-0003Ka-HA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cE-0000KL-KM
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOncN2JUxXwt1CB1ePQ1qklSQzQ266j0ti3lLzidXpQ=;
 b=B5Jmk2hfxvOMPZHH3FRSt7DTidW9xgtuQYxUNgUMRJEHmiU+0CKyHc7ynqiGuOJE4NzSBX
 2Sf943gNXOxW/Z9zDDWBwbsJ1C/5Q20yRaOvHU5d1gsMSre/ujrj4+i22IDvj/QnWf5IUO
 n0Jrl9Dulawne3v1WU539wv67cbZy+0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-ICVu2M9LM7WhJVzK-pZKXw-1; Tue, 18 May 2021 14:38:44 -0400
X-MC-Unique: ICVu2M9LM7WhJVzK-pZKXw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a50cc920000b029038cf491864cso6244146edi.14
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOncN2JUxXwt1CB1ePQ1qklSQzQ266j0ti3lLzidXpQ=;
 b=Ipa2cwxv7ydQnYXf87igC7PAsn80u8ejGCSrMNJi/M7/veoEJSMussekYPhYfDfgo7
 lBNPLZNwoBFdGu8CtlMtn63THo9fwreSuAr24naCYSaWx9EbbShIBLtFkXl7Q68xpN0x
 77MnX3bkoak7qi33KND35A6V0xRFJ2ITufh5d4SQlVmmEk7nSjY2St7tLzp3ZbG6zyuE
 NxxnhYr5Ne/vwwnypr+b9roFG9mIhSaip73zp0bZtm3cn/FaxbXoAfOahRUrV5ILNd9K
 GWDIl9D3YuGA2/iiMvFsTUxUac1Yam57dXlXt1QkJoemUwXtHrI1GQcmSgETEp8QAPNl
 yptA==
X-Gm-Message-State: AOAM530rkEv57sCTMZYXVWU2/LHM9EK0/FtUMNW1IDlrIA3eR+nS8z9Q
 gobbevF71Bwe533Ixt4GyZNfyFNE3zRHW38oj0kesTGv67g1wuFJ3r4+G2RAxSItcMkH9HPuC3P
 TcEgodYbzGjs1Jb0/0zKB6vjl9r55uqz2IkXsm1nl7pZrEDxSQDOHjd/HPGRXE7tQ
X-Received: by 2002:a05:6402:354b:: with SMTP id
 f11mr8811437edd.139.1621363123424; 
 Tue, 18 May 2021 11:38:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPCKgxMyNR+YYL8pCHqk3egdpog5i3vlSZjgcwjLaqLCNd+qZW54mkRkwHArI09gscqZKOIA==
X-Received: by 2002:a05:6402:354b:: with SMTP id
 f11mr8811418edd.139.1621363123253; 
 Tue, 18 May 2021 11:38:43 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i2sm7008863edc.96.2021.05.18.11.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 21/25] hw/virtio: Use ST_CONVERT() macro to emit 16-bit
 load/store functions
Date: Tue, 18 May 2021 20:36:51 +0200
Message-Id: <20210518183655.1711377-22-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 33 +------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index a86819ef2fe..4341af9cb0f 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -101,6 +101,7 @@ static inline void virtio_st ## size ## _phys_cached(VirtIODevice *vdev,\
 }
 
 VIRTIO_LD_CONVERT(uw, uint16_t)
+VIRTIO_ST_CONVERT(w, uint16_t)
 
 static inline uint32_t virtio_ldl_phys(VirtIODevice *vdev, hwaddr pa)
 {
@@ -122,18 +123,6 @@ static inline uint64_t virtio_ldq_phys(VirtIODevice *vdev, hwaddr pa)
     return ldq_le_phys(dma_as, pa);
 }
 
-static inline void virtio_stw_phys(VirtIODevice *vdev, hwaddr pa,
-                                   uint16_t value)
-{
-    AddressSpace *dma_as = vdev->dma_as;
-
-    if (virtio_access_is_big_endian(vdev)) {
-        stw_be_phys(dma_as, pa, value);
-    } else {
-        stw_le_phys(dma_as, pa, value);
-    }
-}
-
 static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
                                    uint32_t value)
 {
@@ -146,15 +135,6 @@ static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
     }
 }
 
-static inline void virtio_stw_p(VirtIODevice *vdev, void *ptr, uint16_t v)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        stw_be_p(ptr, v);
-    } else {
-        stw_le_p(ptr, v);
-    }
-}
-
 static inline void virtio_stl_p(VirtIODevice *vdev, void *ptr, uint32_t v)
 {
     if (virtio_access_is_big_endian(vdev)) {
@@ -220,17 +200,6 @@ static inline uint64_t virtio_ldq_phys_cached(VirtIODevice *vdev,
     return ldq_le_phys_cached(cache, pa);
 }
 
-static inline void virtio_stw_phys_cached(VirtIODevice *vdev,
-                                          MemoryRegionCache *cache,
-                                          hwaddr pa, uint16_t value)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        stw_be_phys_cached(cache, pa, value);
-    } else {
-        stw_le_phys_cached(cache, pa, value);
-    }
-}
-
 static inline void virtio_stl_phys_cached(VirtIODevice *vdev,
                                           MemoryRegionCache *cache,
                                           hwaddr pa, uint32_t value)
-- 
2.26.3


