Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5AF5FDA07
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:12:30 +0200 (CEST)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiy0j-00026e-UU
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTx-0001ie-Gf
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixTf-0004Ge-4G
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJh2BL3IR22mbnk+Z3jlS1vS+H+ZczONctJzx8EUobw=;
 b=S2SWSzOKBFt2H7X17tRlJooqt6F6by+O++EpLuCfi3sNzaOytPwcF4WK/nW+nD+ej2/vHt
 7jFUlprVi56KBK5lUqqw4mRgc0iRTeStHDQkiIAe+ydFG1ZBtlFRa2ME7fGqmMoqkU8MVI
 bcycXQlcYs42+QBY19iPgRO9DJf3SGA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-O3ZTidLUOSaZ5JqvhsqE2w-1; Thu, 13 Oct 2022 08:38:05 -0400
X-MC-Unique: O3ZTidLUOSaZ5JqvhsqE2w-1
Received: by mail-ed1-f72.google.com with SMTP id
 b8-20020a056402278800b0045c948cc65fso1414486ede.9
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJh2BL3IR22mbnk+Z3jlS1vS+H+ZczONctJzx8EUobw=;
 b=ysOEG8PqwDOADPf7UgQoHD6p6VyTsdAtSfKdO0IAVMVp3kTmrtVJDatvOQ5p4eB9xe
 7JdfhU+orWQTa1FZ8xHS4MjKF6J0Ozr9q6HPq1O+r1VVkbDDVTLt4Kv6mNTjIGoQhkjq
 1O6WiFq+4An5MET5k+Xd61tqYd6SbJykJq/WuesCRQJDjzOTFWdyI3Ou+JokuO8N8+ya
 JlCdbu5WXeqUPZVtuDOr7AKlDz2QtrB+9rpu7ABiphJ9UV8oOlSkZLFHbCD1IKBLWXyz
 f5XdzC2gNf0f6c4HbtA6yHk1Mnn/RcLLYoxF76+s/jINh+Tr1Er0pzvohzfau6mLXr15
 0lZg==
X-Gm-Message-State: ACrzQf0RWMcUvNftp1k0vctNBsiHoZsaNlUJ1iWL+H9B6lo98GSukXG6
 zOO+ppqOIN8qOAYj/WAyM6l5iEehlSpWWamfSbpDOMcLgx0NAnRPbh3kShS/5e0IygQymT7X05m
 0Rt6KM704FLuGrMqqkUAmWXjr7o48dvf3TnH/7PjMOeQ1X4dXXxt/4SeD+OafjbF/0QI=
X-Received: by 2002:a17:907:7e93:b0:782:d87a:b6d7 with SMTP id
 qb19-20020a1709077e9300b00782d87ab6d7mr26441764ejc.326.1665664683400; 
 Thu, 13 Oct 2022 05:38:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rFNS87jdlNPEZ7WWEJn89+rZPTqyjsGziZMcVfRvKDYgX1uwgV+7XDpfrIn9JeOPCcqAeyg==
X-Received: by 2002:a17:907:7e93:b0:782:d87a:b6d7 with SMTP id
 qb19-20020a1709077e9300b00782d87ab6d7mr26441739ejc.326.1665664683125; 
 Thu, 13 Oct 2022 05:38:03 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d41-20020a056402402900b0045bef7cf489sm9587178eda.89.2022.10.13.05.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 17/24] parallels: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:04 +0200
Message-Id: <20221013123711.620631-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/parallels.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index c1523e7dab..7f2c1a335d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -205,18 +205,18 @@ static coroutine_fn int64_t allocate_clusters(BlockDriverState *bs,
          * force the safer-but-slower fallocate.
          */
         if (s->prealloc_mode == PRL_PREALLOC_MODE_TRUNCATE) {
-            ret = bdrv_truncate(bs->file,
-                                (s->data_end + space) << BDRV_SECTOR_BITS,
-                                false, PREALLOC_MODE_OFF, BDRV_REQ_ZERO_WRITE,
-                                NULL);
+            ret = bdrv_co_truncate(bs->file,
+                                   (s->data_end + space) << BDRV_SECTOR_BITS,
+                                   false, PREALLOC_MODE_OFF,
+                                   BDRV_REQ_ZERO_WRITE, NULL);
             if (ret == -ENOTSUP) {
                 s->prealloc_mode = PRL_PREALLOC_MODE_FALLOCATE;
             }
         }
         if (s->prealloc_mode == PRL_PREALLOC_MODE_FALLOCATE) {
-            ret = bdrv_pwrite_zeroes(bs->file,
-                                     s->data_end << BDRV_SECTOR_BITS,
-                                     space << BDRV_SECTOR_BITS, 0);
+            ret = bdrv_co_pwrite_zeroes(bs->file,
+                                        s->data_end << BDRV_SECTOR_BITS,
+                                        space << BDRV_SECTOR_BITS, 0);
         }
         if (ret < 0) {
             return ret;
@@ -278,8 +278,8 @@ static coroutine_fn int parallels_co_flush_to_os(BlockDriverState *bs)
         if (off + to_write > s->header_size) {
             to_write = s->header_size - off;
         }
-        ret = bdrv_pwrite(bs->file, off, to_write, (uint8_t *)s->header + off,
-                          0);
+        ret = bdrv_co_pwrite(bs->file, off, to_write,
+                             (uint8_t *)s->header + off, 0);
         if (ret < 0) {
             qemu_co_mutex_unlock(&s->lock);
             return ret;
@@ -504,8 +504,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
              * In order to really repair the image, we must shrink it.
              * That means we have to pass exact=true.
              */
-            ret = bdrv_truncate(bs->file, res->image_end_offset, true,
-                                PREALLOC_MODE_OFF, 0, &local_err);
+            ret = bdrv_co_truncate(bs->file, res->image_end_offset, true,
+                                   PREALLOC_MODE_OFF, 0, &local_err);
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
@@ -600,12 +600,12 @@ static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
     memset(tmp, 0, sizeof(tmp));
     memcpy(tmp, &header, sizeof(header));
 
-    ret = blk_pwrite(blk, 0, BDRV_SECTOR_SIZE, tmp, 0);
+    ret = blk_co_pwrite(blk, 0, BDRV_SECTOR_SIZE, tmp, 0);
     if (ret < 0) {
         goto exit;
     }
-    ret = blk_pwrite_zeroes(blk, BDRV_SECTOR_SIZE,
-                            (bat_sectors - 1) << BDRV_SECTOR_BITS, 0);
+    ret = blk_co_pwrite_zeroes(blk, BDRV_SECTOR_SIZE,
+                               (bat_sectors - 1) << BDRV_SECTOR_BITS, 0);
     if (ret < 0) {
         goto exit;
     }
-- 
2.37.3


