Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0EE51E36C
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:04:24 +0200 (CEST)
Received: from localhost ([::1]:56366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn9o0-0005o5-15
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9if-0005gM-NO
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9ie-0006jp-4c
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651888731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKIqzXZ0u4hsOAjTKtMqbZ1MW0BdUgNP96TObuznd/M=;
 b=a1QBn6YpnL6oQEI+EimjkrcgFXoChYEHdEsQMkxEzwG7KXEdbll8uGk5zG7thE59A7dUtZ
 VTuXisZzbgYJYiyaQRuC6/nUDWdFR6ufXV9Ys7qGNef+pTw2GWCMSxgX9Bm6aH5QrbGC39
 rgw7ZKbgLgyuEUhTcaYjsPUSwvm01Yc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-YgHpQPoGMcmo04wUD_CukA-1; Fri, 06 May 2022 21:58:50 -0400
X-MC-Unique: YgHpQPoGMcmo04wUD_CukA-1
Received: by mail-ot1-f69.google.com with SMTP id
 64-20020a9d0346000000b00605ddf8273aso3592851otv.11
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 18:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKIqzXZ0u4hsOAjTKtMqbZ1MW0BdUgNP96TObuznd/M=;
 b=itVTlZuKi3fHN9ZX/mJHtayo5YL5pmXl9T2qQU8am5be2o/donfa6MRE3gEDTJpxsw
 f2gzaKdQDolC71RpQSJv47q8huzZOFJFvMhf909DcY3BhS0OpmDtBmkYmu5PSY0YqouX
 QaTtzt5P3AHQIjUtoKtj2EwxM31dh+GMc6sz6iK8MB25tIWFPMCAwyIuPDgSCm92+lyu
 4rU8H/wJYz6lrObt4OWVV4ymU8gojOoBtjDhzhU3G9adTzS1Laen8XqPt5t/o5O3gPxY
 Nln8AmWQ1QbUlp0a7JraYJ7UCz/sU1hw8LD37vl+DDDQsw2n26Rh/KwHH7+8e9/Ad1+Z
 E96Q==
X-Gm-Message-State: AOAM53356QydaNEtQUH7OUqroHR/clg9aqelWM7LvTtWfx51mzeIzXCY
 mVRl1JtoIrbHI5//lzaXAvys+v+H9quKKuolMgSI0yBfDG7jixL/xEuu/RZacXLrFNvilXgXVYi
 v4lC+GvF1zsmcdmQ=
X-Received: by 2002:a05:6808:3082:b0:326:9043:a8de with SMTP id
 bl2-20020a056808308200b003269043a8demr2611870oib.239.1651888729449; 
 Fri, 06 May 2022 18:58:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGL543lnXlG54bZrxgkuDbHQCaPlwDSw19nuVu+6969squx3fijvvPnWEVPe9WF8PpjSjYyw==
X-Received: by 2002:a05:6808:3082:b0:326:9043:a8de with SMTP id
 bl2-20020a056808308200b003269043a8demr2611864oib.239.1651888729242; 
 Fri, 06 May 2022 18:58:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a056830141200b0060603221281sm2218124otp.81.2022.05.06.18.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:58:48 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v12 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
Date: Fri,  6 May 2022 22:57:58 -0300
Message-Id: <20220507015759.840466-7-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220507015759.840466-1-leobras@redhat.com>
References: <20220507015759.840466-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Since d48c3a0445 ("multifd: Use a single writev on the send side"),
sending the header packet and the memory pages happens in the same
writev, which can potentially make the migration faster.

Using channel-socket as example, this works well with the default copying
mechanism of sendmsg(), but with zero-copy-send=true, it will cause
the migration to often break.

This happens because the header packet buffer gets reused quite often,
and there is a high chance that by the time the MSG_ZEROCOPY mechanism get
to send the buffer, it has already changed, sending the wrong data and
causing the migration to abort.

It means that, as it is, the buffer for the header packet is not suitable
for sending with MSG_ZEROCOPY.

In order to enable zero copy for multifd, send the header packet on an
individual write(), without any flags, and the remanining pages with a
writev(), as it was happening before. This only changes how a migration
with zero-copy-send=true works, not changing any current behavior for
migrations with zero-copy-send=false.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/multifd.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 15fb668e64..2541cd2322 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -617,6 +617,7 @@ static void *multifd_send_thread(void *opaque)
     MultiFDSendParams *p = opaque;
     Error *local_err = NULL;
     int ret = 0;
+    bool use_zero_copy_send = migrate_use_zero_copy_send();
 
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
@@ -639,9 +640,14 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
-            p->iovs_num = 1;
             p->normal_num = 0;
 
+            if (use_zero_copy_send) {
+                p->iovs_num = 0;
+            } else {
+                p->iovs_num = 1;
+            }
+
             for (int i = 0; i < p->pages->num; i++) {
                 p->normal[p->normal_num] = p->pages->offset[i];
                 p->normal_num++;
@@ -665,8 +671,18 @@ static void *multifd_send_thread(void *opaque)
             trace_multifd_send(p->id, packet_num, p->normal_num, flags,
                                p->next_packet_size);
 
-            p->iov[0].iov_len = p->packet_len;
-            p->iov[0].iov_base = p->packet;
+            if (use_zero_copy_send) {
+                /* Send header first, without zerocopy */
+                ret = qio_channel_write_all(p->c, (void *)p->packet,
+                                            p->packet_len, &local_err);
+                if (ret != 0) {
+                    break;
+                }
+            } else {
+                /* Send header using the same writev call */
+                p->iov[0].iov_len = p->packet_len;
+                p->iov[0].iov_base = p->packet;
+            }
 
             ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
                                          &local_err);
-- 
2.36.0


