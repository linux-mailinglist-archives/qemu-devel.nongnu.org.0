Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E35A2C5F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:34:43 +0200 (CEST)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcI6-0002QQ-Dy
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRc3D-0000F3-6S; Fri, 26 Aug 2022 12:19:26 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oRc38-0007xS-Tp; Fri, 26 Aug 2022 12:19:18 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x26so1986410pfo.8;
 Fri, 26 Aug 2022 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=XbkJfo+HAgd8F3iop4vyXnpjWO69R+8zjmI9OzzoGao=;
 b=cs0CwpvqcC750IP/T1KFRH4VjiWRFjvguesvMAj0bualDr/xW7gvl6Fu6vHp6Bvl4W
 iyBjJCWsJtbJUIkHYBnsbOkqJb44AYYwqzUW3U4/s0oZNQA7Vwbh5863HLNZ0f14Jt1n
 iupOT+23NdvQ6kOdA9YpFSVzX6rd7YgojWgdA3X10eGy8PtywmJ51FVNCpjnngw7JLQ7
 FB3RsFgA6xk2P0hGex65Sc2POFGUcsqPwQUZ/cG29afCfymjmF1PrtMV89dv6pY4iJun
 DWkL65kLqUyHq3uPzXao708r76Idr7sD8thhtA8VvLEnAM74oOu1t2GX5OO3iyYRXHvt
 5T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=XbkJfo+HAgd8F3iop4vyXnpjWO69R+8zjmI9OzzoGao=;
 b=tDPmiiuIDpzMYTCxnicvStjiNX+rKRHM8gdsFGhU2Y6FgqwvxpG78NZE8YgjdjthIA
 UOo8ftWlnpOphHDanna8kE+MrMr1kvgnS57+eqhdmtr+KfU3fejRt/ZGcriKc10uLaNT
 lh5ayC42IF7PxcZng41pIkVPSqSr8X8wulDSCLpfIwBp15PotE39S+/vfDOr0IPDM+gF
 KnLBElA5ZM9DPHPkhRncOx6jNeaqKXjAR3fHvptAOK9uWsocJYoev3URLgRzuXLFCHyp
 7ShMSpGFUawfYgE7Xi7MqtN9UmPBoDOBYkxfk6bPCIiZ4CX6aKhjyQ1z196mEUkgXWkf
 a6Xg==
X-Gm-Message-State: ACgBeo1wXTCjK0SeZ4f1OHInNlSHVcs/bYluhSMnC+mm292A/1nUm1Vz
 NsRRCqEWd2E2r4dLJ0ysulfkKaDFhLLwaA==
X-Google-Smtp-Source: AA6agR7tZGX6OuReeRMdeU9+fxBzFfgmVHYH5AZbB0J/JN/9hdINyGLpFEd9U10YkvMMlNa3uE27tw==
X-Received: by 2002:a05:6a00:1784:b0:537:d623:e1cd with SMTP id
 s4-20020a056a00178400b00537d623e1cdmr1883616pfg.12.1661530751689; 
 Fri, 26 Aug 2022 09:19:11 -0700 (PDT)
Received: from roots.. ([106.84.135.2]) by smtp.gmail.com with ESMTPSA id
 a16-20020a170902ecd000b0016b90620910sm1809047plh.71.2022.08.26.09.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 09:19:11 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, damien.lemoal@opensource.wdc.com,
 Dmitry.Fomichev@wdc.com, hare@suse.de, qemu-block@nongnu.org,
 hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com, fam@euphon.net,
 kwolf@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 4/7] raw-format: add zone operations to pass through
 requests
Date: Sat, 27 Aug 2022 00:17:59 +0800
Message-Id: <20220826161759.8118-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..6b20bd22ef 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -314,6 +314,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
+static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                           unsigned int *nr_zones,
+                                           BlockZoneDescriptor *zones) {
+    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
+}
+
+static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+                                         int64_t offset, int64_t len) {
+    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
+}
+
 static int64_t raw_getlength(BlockDriverState *bs)
 {
     int64_t len;
@@ -614,6 +625,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.37.2


