Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13A55DE35
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:28:51 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BGs-0000cc-BC
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzV-0004Xr-LA
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzU-0008FB-2J
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NDsBcecXhAYFTuwMhnWSKBdFHfdV5WJYzMAIdwf7xEk=;
 b=I2TV6aK7YlYvXfQUo5oD2rRPjiHaYzXIp/cpOdP0ImbpG74OWz2MTtpq5dXqLNnywQk5e3
 F1YxBn5rhwSij1vgQihX4YQ0uY7Ceik0nvIDeQYUU0JOq0hR2CxST278vT2tngDElcEESG
 LE1//w/9pqPJc48+i+nIlIgqSGTRmcA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-XsndlytHOWe3Lb3M4XafRw-1; Tue, 28 Jun 2022 09:10:47 -0400
X-MC-Unique: XsndlytHOWe3Lb3M4XafRw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D782A85A582;
 Tue, 28 Jun 2022 13:10:46 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02770492C3B;
 Tue, 28 Jun 2022 13:10:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 11/12] pc-bios/s390-ccw/virtio: Remove "extern" keyword from
 prototypes
Date: Tue, 28 Jun 2022 15:10:31 +0200
Message-Id: <20220628131032.213986-12-thuth@redhat.com>
In-Reply-To: <20220628131032.213986-1-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

All the other protytpes in the headers here do not use the "extern"
keyword, so let's unify this by removing the "extern" from the misfits,
too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/virtio.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/pc-bios/s390-ccw/virtio.h b/pc-bios/s390-ccw/virtio.h
index 303438f159..1fa0a8e41e 100644
--- a/pc-bios/s390-ccw/virtio.h
+++ b/pc-bios/s390-ccw/virtio.h
@@ -185,12 +185,12 @@ VirtioGDN virtio_guessed_disk_nature(void);
 void virtio_assume_eckd(void);
 void virtio_assume_iso9660(void);
 
-extern bool virtio_ipl_disk_is_valid(void);
-extern int virtio_get_block_size(void);
-extern uint8_t virtio_get_heads(void);
-extern uint8_t virtio_get_sectors(void);
-extern uint64_t virtio_get_blocks(void);
-extern int virtio_read_many(ulong sector, void *load_addr, int sec_num);
+bool virtio_ipl_disk_is_valid(void);
+int virtio_get_block_size(void);
+uint8_t virtio_get_heads(void);
+uint8_t virtio_get_sectors(void);
+uint64_t virtio_get_blocks(void);
+int virtio_read_many(ulong sector, void *load_addr, int sec_num);
 
 #define VIRTIO_SECTOR_SIZE 512
 #define VIRTIO_ISO_BLOCK_SIZE 2048
-- 
2.31.1


