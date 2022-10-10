Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7135FA2CF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:43:33 +0200 (CEST)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwoO-0003Y9-72
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaP-000840-W7
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaL-0006RJ-9T
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Utw17k59pDTuaZhHiKWHR5GCzq1rexlKpcJDjdcDlak=;
 b=R6NIjFiCyQc5dQVPvwlv3fWfoS+V0ARUiytgY76I4t/v2/k4TswDbURXl0oq64B0gHR1mF
 4Ln9UpSC5Y7W5/RbXzvoNP7sG7789rGOeepDC4Zw0zuxaChCxXALMhgXbmacVYqrMnXzj6
 z2Of4uy/FHQ8seDDylj4hjZHqI+yraA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-508-KYge1n_QN1u7K6rj4Nu1SA-1; Mon, 10 Oct 2022 13:28:59 -0400
X-MC-Unique: KYge1n_QN1u7K6rj4Nu1SA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e19-20020adfa453000000b0022e3608df56so2975819wra.10
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Utw17k59pDTuaZhHiKWHR5GCzq1rexlKpcJDjdcDlak=;
 b=XsQncWk25TDwsi8PAh6BZfH95IfMPk9PoCy6pecq2gb5JhpRYjRR4bt2pJnPGTyo7G
 XWN2hAnwPhnsaNlxV20NK1SS9luqNTcoXlcqOBolBhulcB7qoHL4ntXUYUVtbzXSgpTu
 MBBDarde5EHbMrtJmk98HWnRQbNFdJg/sfZiBamsBBuGInNJrBQ4CoDr0aGOlKPid7T+
 rMTCTCEjb1MOrBVX2iH+i8R1UcP+oIZOlYn6k1sV1b7SdvbMa4nuKgQ3XbMj6w5q2dgs
 Hq88YDhMPRj+iHkb2cflwwQYen8kQXZ/MR1Q/j7lduyoT3IGtN88VlqX2S1CESs0leO2
 HcwA==
X-Gm-Message-State: ACrzQf2UCOPsuk7nuR4+vp4VAmQsusF7/VSrXFEkEMctiCXFdG9iJwU7
 qfeqEJJOCp2PFKEeuF/pgVFYve3vaslzk6xZl4x1CCkbOdTqF7hgLv13CJDF+ey3NLmv6NcIHPH
 ulJzyJ9K8qFEwcx/h9zuzXdHUZLdTI8zbcXMzyOjnZn7P8G5cCHtqIKl4vY5q
X-Received: by 2002:a05:6000:1861:b0:22a:bb41:886d with SMTP id
 d1-20020a056000186100b0022abb41886dmr12185283wri.661.1665422937966; 
 Mon, 10 Oct 2022 10:28:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fJLi5vrlxUPeXHhF6K9HZowwWn/bhwoFgzXQC+S2B31G+2SJxpR+Q74qywCinCvfBB7/1ag==
X-Received: by 2002:a05:6000:1861:b0:22a:bb41:886d with SMTP id
 d1-20020a056000186100b0022abb41886dmr12185267wri.661.1665422937671; 
 Mon, 10 Oct 2022 10:28:57 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 k18-20020a5d5192000000b00228dbf15072sm9388945wrv.62.2022.10.10.10.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:28:57 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:28:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 04/55] hw/virtio: fix some coding style issues
Message-ID: <20221010172813.204597-5-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220802095010.3330793-8-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/virtio/vhost-user.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 0b7e41ffe8..03415b6c95 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -200,7 +200,7 @@ typedef struct {
     VhostUserRequest request;
 
 #define VHOST_USER_VERSION_MASK     (0x3)
-#define VHOST_USER_REPLY_MASK       (0x1<<2)
+#define VHOST_USER_REPLY_MASK       (0x1 << 2)
 #define VHOST_USER_NEED_REPLY_MASK  (0x1 << 3)
     uint32_t flags;
     uint32_t size; /* the following payload size */
@@ -208,7 +208,7 @@ typedef struct {
 
 typedef union {
 #define VHOST_USER_VRING_IDX_MASK   (0xff)
-#define VHOST_USER_VRING_NOFD_MASK  (0x1<<8)
+#define VHOST_USER_VRING_NOFD_MASK  (0x1 << 8)
         uint64_t u64;
         struct vhost_vring_state state;
         struct vhost_vring_addr addr;
@@ -248,7 +248,8 @@ struct vhost_user {
     size_t             region_rb_len;
     /* RAMBlock associated with a given region */
     RAMBlock         **region_rb;
-    /* The offset from the start of the RAMBlock to the start of the
+    /*
+     * The offset from the start of the RAMBlock to the start of the
      * vhost region.
      */
     ram_addr_t        *region_rb_offset;
-- 
MST


