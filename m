Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B6693C54
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROar-0001Ud-Gq; Sun, 12 Feb 2023 21:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROap-0001UP-9m
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROan-00032h-U4
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fijRSvjFkArAa0ryGscnf/miuX0tMpTEdiQbyj+yK9k=;
 b=eBAtsp/VFp42xU/K4CsK5onAuRsPbQr6frn0noIBNHF4Ywv8CDVCCKojSH4rmtktS3Eir6
 Q+8osQsb+NunkKXvRl8+WO+SB6AmOJ2IsJMwo9v04ZGfelMfmF69VRTou1vLXGEoljOVTN
 BNtmnyGJ3Rnl83wB1MDrmrIFBg8/rIw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-zzP_RVIWNl-qQthrvExIrQ-1; Sun, 12 Feb 2023 21:29:19 -0500
X-MC-Unique: zzP_RVIWNl-qQthrvExIrQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so8362262wmj.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fijRSvjFkArAa0ryGscnf/miuX0tMpTEdiQbyj+yK9k=;
 b=e97ZOHoxcX66Iltym4qlOtFCPYTtl2wpGBFfu7WbMdRvfAFQZoDDdKRY14Nz4L4RlV
 HO0DjlXHv/NNtxygxRd/s3X/VI6P8vcuZFfHFFYuXFATLpj44Qiz8BcL1KUHPKiqsyj0
 c3M6/By+diQ7ut+MRFtPj4md6+IIsg642EtmmAqPqwWTdL6x0N8b6/IAkW94Vd7FkVMZ
 hJER/jlW/wRI08m5tMWTfUCh+QUIwDQs3oqQnUrmPhtnDwGd785SDZTZGTaKkWdnut5E
 j66YEQ4ZAX826lfDA686sBLT8sKp7dUkE+JEc+JH3KpF1bI/j+H/u4UFXncn7uIWQWdf
 s7MA==
X-Gm-Message-State: AO0yUKU6hw+LYoJFi28ME0Z4QyFzUf8sxPehB9n0mqOQeLlXA3pGX0Fk
 Umyj0OcHC6izX67fc0XrTg8kIr+p986cjb7AGX44naHEgjJ92Vxg6aOygQ2ZPuLyUa93Iqg7hLV
 ELJ7eWqh0mjBc5UtBQpSyjRtfKFrIrWwGfwUesywllAOVG8hOZVR+ZqHWrJjWcz5KG/QugEoK
X-Received: by 2002:a05:600c:2e95:b0:3da:50b0:e96a with SMTP id
 p21-20020a05600c2e9500b003da50b0e96amr17717824wmn.29.1676255357746; 
 Sun, 12 Feb 2023 18:29:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/ePT7yZrSLaWTYTHkBPJUuVE73ZelgzSYQoSEBhGWKGcLJkV+9MQOnbGiclZ+GH13iJCa+/g==
X-Received: by 2002:a05:600c:2e95:b0:3da:50b0:e96a with SMTP id
 p21-20020a05600c2e9500b003da50b0e96amr17717809wmn.29.1676255357431; 
 Sun, 12 Feb 2023 18:29:17 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003db0ee277b2sm15824328wmq.5.2023.02.12.18.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:16 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li Zhang <lizhang@suse.de>
Subject: [PULL 03/22] multifd: Remove some redundant code
Date: Mon, 13 Feb 2023 03:28:52 +0100
Message-Id: <20230213022911.68490-4-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Li Zhang <lizhang@suse.de>

Clean up some unnecessary code

Signed-off-by: Li Zhang <lizhang@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index c8132ab7e8..7aa030fb19 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -892,19 +892,15 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
     Error *local_err = NULL;
 
     trace_multifd_new_send_channel_async(p->id);
-    if (qio_task_propagate_error(task, &local_err)) {
-        goto cleanup;
-    } else {
+    if (!qio_task_propagate_error(task, &local_err)) {
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
-        if (!multifd_channel_connect(p, sioc, local_err)) {
-            goto cleanup;
+        if (multifd_channel_connect(p, sioc, local_err)) {
+            return;
         }
-        return;
     }
 
-cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
@@ -1115,10 +1111,7 @@ static void *multifd_recv_thread(void *opaque)
 
         ret = qio_channel_read_all_eof(p->c, (void *)p->packet,
                                        p->packet_len, &local_err);
-        if (ret == 0) {   /* EOF */
-            break;
-        }
-        if (ret == -1) {   /* Error */
+        if (ret == 0 || ret == -1) {   /* 0: EOF  -1: Error */
             break;
         }
 
-- 
2.39.1


