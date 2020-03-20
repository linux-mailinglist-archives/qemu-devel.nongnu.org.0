Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69818CD68
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 13:02:48 +0100 (CET)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFGMR-0005cs-PP
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 08:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jFGHw-0007lc-Qw
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jFGHv-0000LC-Ts
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:58:08 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jFGHv-0000KY-O6
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:58:07 -0400
Received: by mail-wm1-x341.google.com with SMTP id d1so5987226wmb.2
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 04:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bKbcDZF4VvCdwc1Z3LgA0n0/o1l3SD8mbWQhoT1XpcI=;
 b=KUfOlH05cZMFhpAA+7tZvez+zR989Mxvm2TMXdK/iXYrhe4m2bAdFgT8LeAq6Jbdwi
 gncQmGBRVg+oHp2BCaAmkenyHYIaBh+Idvgen2SL0Ed+XEqb3gsi3rTnHkEJgcPCSHt1
 5+YHku7BFU2oVqraq3eLhleJ3PmGer5KFE6xkl0yOO+mW7PkiLlmiweBFal7ymWYLti0
 OPprc9NG7+D4fQO9Dk4FLtQyJU/pNjFH0+5ck9wJLESVr2pvqzLvXrdqYvAM+CoYi57d
 7oYte8SXdDYtyPIng+y28I/dzkGdRFZdbMclM6cxIzUnuqNs0tnvM56VosBLwBZvez5B
 i42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bKbcDZF4VvCdwc1Z3LgA0n0/o1l3SD8mbWQhoT1XpcI=;
 b=TG6iskAH+SWjLlE2B7WbTcTvnvs/66f/UGymN9QnaAIdWzu9Aeut1msXODpz8vAAxM
 XNW5VXMqUYd+785lY/GoGy6gDpU0NHNi93zwo76Uy6kijNz46ub6AiOfUmyW98B20fIa
 DIrpA5EZeNLBHypoVyufJlhXXNP22kJDWtgwh/TfK4I9JRb/VTXhx7L+WmlspbvzSYGD
 6ygEgymPScNQntSXHUn/9eQnJ75jCA1Xs+nSAklkNYX4H5B46unjpA3ahwfV4YdMu/d9
 HRrvzUSlhdR3mqLzIdqwlItneZDVosanzjsK1FGw1nd4boLIf5mzLsxMJ34aMes+76si
 EDNg==
X-Gm-Message-State: ANhLgQ2mFCxcsQ3p8wLPjfvW4qgWV1GxCuVXbVacZQU7x/+97niCAAzb
 XQi3HSljF3blQkrZc3SIm7okSxsuNklDkA==
X-Google-Smtp-Source: ADFU+vuu9lTd6iZFTm0b7Asl0ZbQhcg72oVB41DSOFTcaGKm5Fnd7aJHW3zCnv0FTMrNM/bC1uKHLg==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr9664567wmm.3.1584705486512; 
 Fri, 20 Mar 2020 04:58:06 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-179-79-224.red.bezeqint.net.
 [79.179.79.224])
 by smtp.gmail.com with ESMTPSA id c18sm6637645wrx.5.2020.03.20.04.58.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 04:58:06 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH v6 6/7] vmstate.h: provide VMSTATE_VARRAY_UINT16_ALLOC macro
Date: Fri, 20 Mar 2020 13:57:50 +0200
Message-Id: <20200320115751.19446-7-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320115751.19446-1-yuri.benditovich@daynix.com>
References: <20200320115751.19446-1-yuri.benditovich@daynix.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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


