Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9608062586F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:33:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRJK-0007Tw-AG; Fri, 11 Nov 2022 05:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJI-0007PH-Ae
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJF-0000eh-T4
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668162653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDTAMSk827dOTAQ9bUd5tW46d8l8Z95h+cAITqQ7Ffw=;
 b=SmAq7YzZqiZduRi+rPXQeAAbHPeB638OK2eXaC/88xi8yUdUQrk/Pn8Qx0Uxrn/xdKCQFo
 6yNwoVIcaeSs0ggMrq+Zi2FDxmlaYtu4p7NNLkPGyArWIyeu4qlEZLVn228PASN+bKgjfV
 arzkTUyZaG872aLwAfGyczse9L0BO3Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-C6_HY4nwNteOn7-N6h9X3A-1; Fri, 11 Nov 2022 05:30:51 -0500
X-MC-Unique: C6_HY4nwNteOn7-N6h9X3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88F881C05EAF
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:30:51 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 066B2207B344;
 Fri, 11 Nov 2022 10:30:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PULL 1/8] rtl8139: Remove unused variable
Date: Fri, 11 Nov 2022 11:30:41 +0100
Message-Id: <20221111103048.202519-2-thuth@redhat.com>
In-Reply-To: <20221111103048.202519-1-thuth@redhat.com>
References: <20221111103048.202519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Miroslav Rezanina <mrezanin@redhat.com>

Variable send_count used in rtl8139_cplus_transmit_one function is only
incremented but never read. This causes 'Unused but set variable' warning
on Clang 15.0.1 compiler.

Removing the variable to prevent the warning.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <15a32dd06c492216cbf27cd3ddcbe1e9afb8d8f5.1668009030.git.mrezanin@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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


