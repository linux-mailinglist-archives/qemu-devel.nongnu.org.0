Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C62597797
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:12:26 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPOr-0005mj-IB
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJ3-00035y-Up
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJ2-0000In-G4
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k2ZpeeYKQErXhazsoSi6NbKbSpJUbceXzvANU3WD8iY=;
 b=UIESwbus61MLrC2tqVJJNxHXHJeI9RYJxNyqTKXj2s2t+UCsB/5z3yXSqriiOl0WzcjwKO
 vEhY50YrI8PGRre85OzBTAct+lcy4eronaP98JJqwKMITUrh+g2aG9QpPy1F0/vqDcm7Pw
 VyVPN/4/wPUpqRsATItGpUXqVMW6ARQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-lytPjezzMpmE41zIteNBbw-1; Wed, 17 Aug 2022 16:06:22 -0400
X-MC-Unique: lytPjezzMpmE41zIteNBbw-1
Received: by mail-wm1-f71.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so1547984wmc.2
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=k2ZpeeYKQErXhazsoSi6NbKbSpJUbceXzvANU3WD8iY=;
 b=Xeyy3tmR4O1ab0jALlLH25qU2muUBICa563qGx6hlf3fjvzQhTg+miDWm6yt3xUH1n
 oM8Mpv4cPFrhIQnH9fNgtYfdx1tDD6NlBM76Oe5w5tBCUHhlnbZv6DzzJWX8w2J2APhO
 Agyj0FQvNK2I+NGuw0JJxqPch0SSCfl34FjICzFaV66c2EHNUFu9MS+QMstuiQ8fp0Zh
 IPlk4Ypus8l38EDFGBFnWC18e6FxxtkiG2nahARXOG9jQ0aKfxj5ybAHapnfzT1xFV+I
 mf0Pn4VORty+wrpFpivdfozav0xzCYB6HM58Lq9h6KlTeHi2B3fX/vVqOEWxekMIyRMt
 RfAA==
X-Gm-Message-State: ACgBeo00yDu/dH5H0W0bNw15f29HJ9PITCyPujTNF3+9bchCrexn62uG
 dzy5Nv4g/hbxv8M6BE32USBJc5tuZiLuRAMJNBZCGnflkEqJ8uO7lkAeUprGsKTMLGVr9Bg99pX
 Is1OXs7iyIXNpmWGqIH7v1IrlMq6A4SpYkJr+kJkCCxX9tUoRUP929EuPRuv/
X-Received: by 2002:a7b:c5c5:0:b0:3a5:3e42:fa18 with SMTP id
 n5-20020a7bc5c5000000b003a53e42fa18mr3026228wmk.178.1660766781259; 
 Wed, 17 Aug 2022 13:06:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7i2BOD6HaZeZ0j18q5sfQqJb2hcNGZ92TRqD7+yX6pePq8Fx2fSSK0Th8x+n3seH81n0RzTA==
X-Received: by 2002:a7b:c5c5:0:b0:3a5:3e42:fa18 with SMTP id
 n5-20020a7bc5c5000000b003a53e42fa18mr3026213wmk.178.1660766780978; 
 Wed, 17 Aug 2022 13:06:20 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 d11-20020adffbcb000000b00224f7c1328dsm463251wrs.67.2022.08.17.13.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:20 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bobo WL <lmw.bobo@gmail.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 08/12] hw/cxl: Add stub write function for RO MemoryRegionOps
 entries.
Message-ID: <20220817200536.350795-9-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

There is no checking on the availability of a write callback.
Hence QEMU crashes if a write does occur to one of these regions.

Discovered whilst chasing a Linux kernel bug that incorrectly
wrote into one of these regions.

Fixes: 6364adacdf ("hw/cxl/device: Implement the CAP array (8.2.8.1-2)")
Reported-by: Bobo WL <lmw.bobo@gmail.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220817145759.32603-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-device-utils.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 687759b301..83ce7a8270 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -141,9 +141,15 @@ static uint64_t mdev_reg_read(void *opaque, hwaddr offset, unsigned size)
     return retval;
 }
 
+static void ro_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    /* Many register sets are read only */
+}
+
 static const MemoryRegionOps mdev_ops = {
     .read = mdev_reg_read,
-    .write = NULL, /* memory device register is read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -173,7 +179,7 @@ static const MemoryRegionOps mailbox_ops = {
 
 static const MemoryRegionOps dev_ops = {
     .read = dev_reg_read,
-    .write = NULL, /* status register is read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -188,7 +194,7 @@ static const MemoryRegionOps dev_ops = {
 
 static const MemoryRegionOps caps_ops = {
     .read = caps_reg_read,
-    .write = NULL, /* caps registers are read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-- 
MST


