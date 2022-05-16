Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC9528433
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:29:48 +0200 (CEST)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZr9-0000M3-BQ
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9X-0002pH-57
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9V-0005oB-EG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bx3yjI8J96Ow3fL/flNwsTWaDHNvQ6trt+wn+Q4QM50=;
 b=R/voJTnxkO3u76j9thRqgwEGzr1V8E/iLZd5QKlFIRUvJCXUBcXKrEOfyiMg2GfmcxrwE8
 ugjWKc02fHlVyaPXY7QdLLuxhbaI2lbiouIymRwRBosoA7u6AvdMBHenTF1cVC+3SnZn4C
 V81gxfUS4NVSjSpInE5C0T3jlYixDpI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-JmMrW4KBNnSEf1gpVpHqxw-1; Mon, 16 May 2022 06:40:35 -0400
X-MC-Unique: JmMrW4KBNnSEf1gpVpHqxw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso5453335wml.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bx3yjI8J96Ow3fL/flNwsTWaDHNvQ6trt+wn+Q4QM50=;
 b=OrB+d0WG8GXiAfrRnhDXm71Pdc/gNJkL1BR4RSbiJRY6HWVrNt9vIH5h0HTz1oVEE6
 xAF6uuLWWEoyix1NiEZR0YCP89wxuGTPoZxdlZS9AWgLHiAyHmKJsRxHEhUkz1qkUc2M
 xNRixfSCb02RL2yCSit14HJ/YJFIGo1uyNpVNyfPbzUmqQBOafd69SlpTNUJYG7VDSMA
 xVoY70OW5n/ceDxJkddnNkLhz7zQeeb8R/+qLuPUrDM+LpUjCf6WCgqcc+4KJ2BCtLsq
 s5WA6lW/5Lau24lnxdy4e8BTW2I624cAk6faB8R0e/VULVoTHzye6JDH47uaxro2gjWN
 YPqQ==
X-Gm-Message-State: AOAM5300GD0dg9xayg04eI7sGUJbwIqepOkyEFNQj2ozwIkJlyPvOl1p
 cOSobNoTSQcliBpd01+xFqgFxM0KgIUBODCD92yaq03bDWuRJE3ecBKJsbY/MWW7B6aFE/Gsg6N
 JoXmE+tUS7/mY7H4UQCYaKnJWpkgxZ4ifIISNEDctx0kX9NiM+TjsCDc+5L1B
X-Received: by 2002:a05:600c:224a:b0:394:8ec:3d37 with SMTP id
 a10-20020a05600c224a00b0039408ec3d37mr15902227wmm.19.1652697634229; 
 Mon, 16 May 2022 03:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQeopmkJXbicFB+Pvk1zsVDEB6Kg0gneB5SUoc7eDhqHaR10ln1gmhyWTsy7Q4HXBn68SyyQ==
X-Received: by 2002:a05:600c:224a:b0:394:8ec:3d37 with SMTP id
 a10-20020a05600c224a00b0039408ec3d37mr15902197wmm.19.1652697633906; 
 Mon, 16 May 2022 03:40:33 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 l9-20020adfc789000000b0020cd8f1d25csm9699969wrg.8.2022.05.16.03.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:33 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wei Huang <wei.huang2@amd.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 84/91] hw/i386/amd_iommu: Fix IOMMU event log encoding errors
Message-ID: <20220516095448.507876-85-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Wei Huang <wei.huang2@amd.com>

Coverity issues several UNINIT warnings against amd_iommu.c [1]. This
patch fixes them by clearing evt before encoding. On top of it, this
patch changes the event log size to 16 bytes per IOMMU specification,
and fixes the event log entry format in amdvi_encode_event().

[1] CID 1487116/1487200/1487190/1487232/1487115/1487258

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Wei Huang <wei.huang2@amd.com>
Message-Id: <20220422055146.3312226-1-wei.huang2@amd.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index ea8eaeb330..725f69095b 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -201,15 +201,18 @@ static void amdvi_setevent_bits(uint64_t *buffer, uint64_t value, int start,
 /*
  * AMDVi event structure
  *    0:15   -> DeviceID
- *    55:63  -> event type + miscellaneous info
- *    63:127 -> related address
+ *    48:63  -> event type + miscellaneous info
+ *    64:127 -> related address
  */
 static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
                                uint16_t info)
 {
+    evt[0] = 0;
+    evt[1] = 0;
+
     amdvi_setevent_bits(evt, devid, 0, 16);
-    amdvi_setevent_bits(evt, info, 55, 8);
-    amdvi_setevent_bits(evt, addr, 63, 64);
+    amdvi_setevent_bits(evt, info, 48, 16);
+    amdvi_setevent_bits(evt, addr, 64, 64);
 }
 /* log an error encountered during a page walk
  *
@@ -218,7 +221,7 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
 static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
                              hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_IOPF_I | AMDVI_EVENT_IOPF;
     amdvi_encode_event(evt, devid, addr, info);
@@ -234,7 +237,7 @@ static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
 static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
                                    hwaddr devtab, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_DEV_TAB_HW_ERROR;
 
@@ -248,7 +251,8 @@ static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
  */
 static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 {
-    uint64_t evt[4], info = AMDVI_EVENT_COMMAND_HW_ERROR;
+    uint64_t evt[2];
+    uint16_t info = AMDVI_EVENT_COMMAND_HW_ERROR;
 
     amdvi_encode_event(evt, 0, addr, info);
     amdvi_log_event(s, evt);
@@ -261,7 +265,7 @@ static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
                                        hwaddr addr)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_ILLEGAL_COMMAND_ERROR;
     amdvi_encode_event(evt, 0, addr, info);
@@ -276,7 +280,7 @@ static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
 static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
                                           hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY;
     amdvi_encode_event(evt, devid, addr, info);
@@ -288,7 +292,7 @@ static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
 static void amdvi_log_pagetab_error(AMDVIState *s, uint16_t devid,
                                     hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_PAGE_TAB_HW_ERROR;
     amdvi_encode_event(evt, devid, addr, info);
-- 
MST


