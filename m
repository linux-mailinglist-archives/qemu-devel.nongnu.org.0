Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3C4574FF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:03:11 +0100 (CET)
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7I6-0008EO-7k
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:03:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EN-0005L8-3Y
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EE-00036n-W7
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rYdjt1Fquz/o/MTD7skzHN1tkIhl+DVJLQUz2RjsO8=;
 b=Jl2kRKw8GYBcIzA9b/rH1bA777NXVGy7Vh7Zc3k8W0VRTkiuQ37wdox+iMxauS/vIgZw1S
 +ilEMPww2XUp20ysQZB6NJkwXTWhe4uM80K1PfSPuo701no60FCUVlZd8A3OqkGY0L8HG/
 8tum6ZEQaZ5D73KadLOJchQ21kV/L2w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-EUNFxqAwMYGxjdn75kbd5A-1; Fri, 19 Nov 2021 11:59:09 -0500
X-MC-Unique: EUNFxqAwMYGxjdn75kbd5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so1902101wro.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rYdjt1Fquz/o/MTD7skzHN1tkIhl+DVJLQUz2RjsO8=;
 b=fPVmHADNcI+bXYQ8fw9yhnQWD8orCj91rE3y03U7Ls20Gyta3lvmJxGvS8EC1vqr68
 wBRWG3y49qc5TCZ+r8ArcsJJPOmQwuZglwEJ01FY4falPaRF9j1FuU9ROlKZ9d/cFtF7
 ewQ7+1DtmRw92yiQDWYp39NFn5EwtZF+kGCzHp21eLgctIEgCBN5YsNnO04NhhjdfDZG
 CmNjFkpD6SvyqhLQSDxAaSEsTcV0DjZv6SVlF9IKXyKM5kRUQZqKJvsOsonjDLARnk4c
 zEdVRECGRqX9Cun2uCw2IhkYxTZSFzSu8hebwUlw7TuefxtN7kroTwrS3xZkodClxNYY
 x1KA==
X-Gm-Message-State: AOAM531g1hGfLOWldJMI9mXQ8BEFD9uSviZ5ogApRUZMOuMSvoccYGqj
 4VEqIoH0PRNIl638LFgUKHVR6oOk4/b843RP4gQy2cExAWYarKsHM07eZZG7IhfN3Nk2KzlfAsB
 fwuO3xd5TwYLvKpvLn5OS+15kfYQ3hK30aYvbkGKjsIpopKgjckT6OP2l2xq8S6ug4+8=
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr9121411wrj.84.1637341147332; 
 Fri, 19 Nov 2021 08:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWNgw+l/lA0vDSaZ1GRpmEPis1XcvpP+ZZ1cZ9CpCzx1NWa9qB4NTW7vwiKP/b+G+msmS9RA==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr9121383wrj.84.1637341147128; 
 Fri, 19 Nov 2021 08:59:07 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id n2sm13079142wmi.36.2021.11.19.08.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] dump: Remove is_zero_page()
Date: Fri, 19 Nov 2021 17:58:54 +0100
Message-Id: <20211119165903.18813-3-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119165903.18813-1-quintela@redhat.com>
References: <20211119165903.18813-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It just calls buffer_is_zero().  Just change the callers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 dump/dump.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 662d0a62cd..a84d8b1598 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1293,14 +1293,6 @@ static size_t get_len_buf_out(size_t page_size, uint32_t flag_compress)
     return 0;
 }
 
-/*
- * check if the page is all 0
- */
-static inline bool is_zero_page(const uint8_t *buf, size_t page_size)
-{
-    return buffer_is_zero(buf, page_size);
-}
-
 static void write_dump_pages(DumpState *s, Error **errp)
 {
     int ret = 0;
@@ -1357,7 +1349,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
      */
     while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
         /* check zero page */
-        if (is_zero_page(buf, s->dump_info.page_size)) {
+        if (buffer_is_zero(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
                               false);
             if (ret < 0) {
-- 
2.33.1


