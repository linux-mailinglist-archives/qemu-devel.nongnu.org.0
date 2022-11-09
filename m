Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2B622F7F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:58:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnSU-0001rg-0P; Wed, 09 Nov 2022 10:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnSQ-0001pE-6p
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnS9-0005ha-Ez
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668009440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yj5ZLy7UgEu+A/BDjFAC6gOaDRncxqI9pvQtJekPyVY=;
 b=MO2xjKv5JPAEE3ESDanLMocbSOSJs01anlbMTsAImxKCozdFN0UreOs4MoHJI+/VMrPOiO
 VSnYIf58yKaOej/n/uvpz7eel0t/WlcGcmTzRG579+yiBYe5lakILCYy0fQRFbC66KRQb7
 aXJHAGBBmsOGrDJZN1QZLZ57CMPSJls=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-23CFuIQLMnmnNlMeGIxl7Q-1; Wed, 09 Nov 2022 10:57:17 -0500
X-MC-Unique: 23CFuIQLMnmnNlMeGIxl7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 232A93C32985
 for <qemu-devel@nongnu.org>; Wed,  9 Nov 2022 15:57:17 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (ovpn-193-213.brq.redhat.com
 [10.40.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64AB940C2087;
 Wed,  9 Nov 2022 15:57:16 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PATCH 1/4] rtl8139: Remove unused variable
Date: Wed,  9 Nov 2022 10:57:11 -0500
Message-Id: <15a32dd06c492216cbf27cd3ddcbe1e9afb8d8f5.1668009030.git.mrezanin@redhat.com>
In-Reply-To: <cover.1668009030.git.mrezanin@redhat.com>
References: <cover.1668009030.git.mrezanin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Miroslav Rezanina <mrezanin@redhat.com>

Variable send_count used in rtl8139_cplus_transmit_one function is only
incremented but never read. This causes 'Unused but set variable' warning
on Clang 15.0.1 compiler.

Removing the variable to prevent the warning.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 hw/net/rtl8139.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 6b65823b4b..e6643e3c9d 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2156,7 +2156,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                     ip_data_len, saved_size - ETH_HLEN, large_send_mss);
 
                 int tcp_send_offset = 0;
-                int send_count = 0;
 
                 /* maximum IP header length is 60 bytes */
                 uint8_t saved_ip_header[60];
@@ -2261,7 +2260,6 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
                     /* add transferred count to TCP sequence number */
                     stl_be_p(&p_tcp_hdr->th_seq,
                              chunk_size + ldl_be_p(&p_tcp_hdr->th_seq));
-                    ++send_count;
                 }
 
                 /* Stop sending this frame */
-- 
2.31.1


