Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D7196E22
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Mar 2020 17:15:18 +0200 (CEST)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIZef-0006Wq-Vf
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 11:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jIZZm-0007rT-Ld
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 11:10:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jIZZl-0006sP-M3
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 11:10:14 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jIZZl-0006qy-G1
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 11:10:13 -0400
Received: by mail-wr1-x441.google.com with SMTP id m11so11984703wrx.10
 for <qemu-devel@nongnu.org>; Sun, 29 Mar 2020 08:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bKbcDZF4VvCdwc1Z3LgA0n0/o1l3SD8mbWQhoT1XpcI=;
 b=fejrOI5seWvIG/Q9LmOlTQjNz3G/dSKFn6twWJXwCyXxCUwoXl7pumgnVuFekVaEGJ
 ySQ0AvtB0UFcBeWm1DVEc1f/11TmrvsN8oR7Pqbbkk7poNVAyl3eJaRz0ToBR81WpMh1
 2liQcwk3QXQeIdNxWtFbI2RT4sv7nHeR6119c3ZGgorSmYDXJ6g4y/s8kiHzsWB4tTZj
 iLGKSFI3Gfn8K28m1EiKXRWBvCTyTDvaMiqlJsYUtyYyRgjWfUSQZY14Sj5uXXpbuJv9
 cxa7aBSiejZ2O1Gr5+d+/BuZRNuuZqRd5rvdKHBuTT9NyIVIpShMqSm3wG1j+KMHtvVg
 y/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bKbcDZF4VvCdwc1Z3LgA0n0/o1l3SD8mbWQhoT1XpcI=;
 b=X9vVyUn7HzgDxZpc04hAXcEyedR5UhtsdvPGvRUgWVumWYyxsU9BPRKRPOi1sfMoBa
 dJuiYnacaQjeXcPwKEJQwwJU84VIX4aloKakPz0cfAso04+kW8N4T+zCJ5rGXKEHdt3n
 lRU+6nsBj8ZQ8GjQiRM5Gv+6EwOGGQtHWTC/k/zhWLgOOzWEGyZvsjS7ZzEPfyCRgsQa
 VIhs+469DT+eZ+YoX/oxGAua6zoNeJEbCNUQ6OV+eCcVpinl5V6/Mf1eAw28WR4mnaWn
 CyO4MbaHdERemCbj/wvvR4RzNAlV3sSMFPcc55qVV0xyDCG+bzlIT7m25Ghh9l5xM/R7
 M37A==
X-Gm-Message-State: ANhLgQ3ikThochMYRi4r9Q2n60XSGZ4ky5HAwkS9Ki6WsAOWAGD9y2Xo
 jDzQMA/pOHOqGPFHyknZGWMSIkL/b5wgTA==
X-Google-Smtp-Source: ADFU+vtYJjlZauEf5fLVogYeIwgOod16FUfVvl1Nm+1FfwgzQ3xbCnSJeL8osUzC/tnsMz1iQzpLqQ==
X-Received: by 2002:a5d:5106:: with SMTP id s6mr10064485wrt.24.1585494612395; 
 Sun, 29 Mar 2020 08:10:12 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-183-67-107.red.bezeqint.net.
 [79.183.67.107])
 by smtp.gmail.com with ESMTPSA id s2sm5477874wmh.37.2020.03.29.08.10.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Mar 2020 08:10:11 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v7 6/7] vmstate.h: provide VMSTATE_VARRAY_UINT16_ALLOC macro
Date: Sun, 29 Mar 2020 18:09:52 +0300
Message-Id: <20200329150953.23812-7-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329150953.23812-1-yuri.benditovich@daynix.com>
References: <20200329150953.23812-1-yuri.benditovich@daynix.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to VMSTATE_VARRAY_UINT32_ALLOC, but the size is
16-bit field.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/migration/vmstate.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 30667631bc..baaefb6b9b 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -432,6 +432,16 @@ extern const VMStateInfo vmstate_info_qlist;
     .offset     = vmstate_offset_pointer(_state, _field, _type),     \
 }
 
+#define VMSTATE_VARRAY_UINT16_ALLOC(_field, _state, _field_num, _version, _info, _type) {\
+    .name       = (stringify(_field)),                               \
+    .version_id = (_version),                                        \
+    .num_offset = vmstate_offset_value(_state, _field_num, uint16_t),\
+    .info       = &(_info),                                          \
+    .size       = sizeof(_type),                                     \
+    .flags      = VMS_VARRAY_UINT16 | VMS_POINTER | VMS_ALLOC,       \
+    .offset     = vmstate_offset_pointer(_state, _field, _type),     \
+}
+
 #define VMSTATE_VARRAY_UINT16_UNSAFE(_field, _state, _field_num, _version, _info, _type) {\
     .name       = (stringify(_field)),                               \
     .version_id = (_version),                                        \
-- 
2.17.1


