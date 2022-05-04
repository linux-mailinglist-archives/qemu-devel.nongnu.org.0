Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01C851ADB4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:24:36 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKbz-0002Rz-QS
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXo-0006He-79
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXm-0005A8-4h
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651692013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKIqzXZ0u4hsOAjTKtMqbZ1MW0BdUgNP96TObuznd/M=;
 b=I8LUODbBo0+J9veo8a0sT0gFEPiA8WlTKhamP9Cp2JUtGiWu3JnCaVt4xu8UI9S6rWuyno
 ju++aY2LbrGl003D7yPOZTOi5+/BkDvB578nsA2v+bYKL56ZnJtwX1WGakLP6IpKy5ARNt
 sytIu2o6UE8rsT463N056L2ppiLpLUI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-yBL-TrItMN2ixitwUgCYaQ-1; Wed, 04 May 2022 15:20:12 -0400
X-MC-Unique: yBL-TrItMN2ixitwUgCYaQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 v65-20020a1f6144000000b0034e3eda8020so260254vkb.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 12:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nKIqzXZ0u4hsOAjTKtMqbZ1MW0BdUgNP96TObuznd/M=;
 b=y3ZcYrcBCiAUoeKa0yG9S3Cg1q5dlI20CqYKOwX5YoWXVu69iYzhQ4QhLhLXBsBqWh
 /ZcXn1KePIGS2i37K/qOl6uXxofu6C4KqpI9b+Hy1MJ1RbQBik/p4D635zvr40C8GROD
 n+IB0l0vnC6o8x/FLMNuLrDeKZ+JnBytKqKxdCgskND9RZlVpvxnlc37KrzOY3yQc0DJ
 IfEQScTwNp2LixIoVcUqNk6+oNTB2B07PqfxVtJDUVOWDGrtxIPu++bR3Gn1tJIsAqfS
 2mOSDz6NDP2q3qBmqYSQUJww8l/JKZxH6TnMsieR+VDOrpTlztz8tQu0i3LrbWGh6vxp
 zumw==
X-Gm-Message-State: AOAM530ONuc8OT35klN26It4nCE7JX1GOvXxknol4op+HpbxvLaYyqo2
 aRIEqKOPBCdyHunBtfltf6SGV6Ix/1C/DNUtErqIXBBUL8hdtZTt+zyZcNcQleWkgqP3rlKNkl5
 p5QhPpoGOva+z9So=
X-Received: by 2002:a05:6102:23ec:b0:327:a6d3:533e with SMTP id
 p12-20020a05610223ec00b00327a6d3533emr8476723vsc.34.1651692011798; 
 Wed, 04 May 2022 12:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLGIF1O/68tMwvo5znnqWjSIYk6sY5b2c+vLl5Us3+O/CQ6lZ831VuvTHHC1RbPolhIOqlLw==
X-Received: by 2002:a05:6102:23ec:b0:327:a6d3:533e with SMTP id
 p12-20020a05610223ec00b00327a6d3533emr8476702vsc.34.1651692011558; 
 Wed, 04 May 2022 12:20:11 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:1312:73ed:3343:f316:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o80-20020a1fa553000000b0034e6f1fd04esm1647302vke.24.2022.05.04.12.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:20:11 -0700 (PDT)
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
Subject: [PATCH v11 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
Date: Wed,  4 May 2022 16:18:35 -0300
Message-Id: <20220504191835.791580-7-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504191835.791580-1-leobras@redhat.com>
References: <20220504191835.791580-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


