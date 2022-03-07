Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E24D0B7D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:52:38 +0100 (CET)
Received: from localhost ([::1]:39848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMDV-0003LI-OD
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:52:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6f-0006pD-7U
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6d-0005Wk-K7
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIYTx9xMPVdCirDAB9Y8FCSD6kEXvGl7DGfbZeP6K2A=;
 b=TnfS0Q/HlR03IbD/nIuSBC+bLxoHpWBozJwBFoRSDRFtRBoWGfgJHRlw2qczKYqFJ3PC9j
 NhKVBvI1CL6xC3CX2e2xCTF/Mk85qloWOJkdTsHgTETkS2Lc7Ywla5oh8jxDNOfvcwiIhX
 fCfIvjpIQqsVUaNZBoLoE8mXxwvFhXc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-WiBOVI5cNQG66HhlUXbQxw-1; Mon, 07 Mar 2022 17:45:30 -0500
X-MC-Unique: WiBOVI5cNQG66HhlUXbQxw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso253375wmh.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xIYTx9xMPVdCirDAB9Y8FCSD6kEXvGl7DGfbZeP6K2A=;
 b=H6YR2w3Wgde2KoUgAHznMjwwi+T0O/3wvhfQm67wUIvnVfQ8ZJl7OUtaFQZryFXIue
 RLgFlN3YlD7ih7ZgRZZ1ph7cHnQqHG26XRbtr3k6maOxvwDFlIfL5lVNI8Ux5pfTz60S
 Zoepciq5/IKQV88w79DljBlKyKKF9sFWg8J+NDZizoT//6y08HmVISjMhwzkk09aE7Z0
 N7ytPJGc6l0pKhipsxOZkCEZCBUIGGjSN0R+c4UlAQLB9Shm+ESu66wl0ADn1OjmAQUt
 yc3eYaTRmRkJKfd/yyT+MT28QaA4/XhhLdFpd7/Dn/D6s0L58QGejBVJElCd8PYjudfv
 IqXg==
X-Gm-Message-State: AOAM5327guA4FvUF2oEbk4LWrPjSiiw45XYNVjcj2MpyxkT8fKpRbgkK
 pMDH2rIommedf0d6U/2e2O+pN48GzjHXlgNV1eSDUE5Hqk8qi1r7SjbmXJ1XZ2GLGdOVU3fYs01
 PwmGg4zp2IG4SpmhPG2yn8MFdV0qXWdt5eae9OVG/gKW6y3oeM7UYz2RW3a+7
X-Received: by 2002:a05:600c:35c2:b0:381:6cbc:7192 with SMTP id
 r2-20020a05600c35c200b003816cbc7192mr951580wmq.146.1646693128482; 
 Mon, 07 Mar 2022 14:45:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLZMrYquLUbkvA4xH+9Jdo8NpUQ7WKVr81Or7BxvARLeiHifTUfmd2fhD30uMd+W67/4qodg==
X-Received: by 2002:a05:600c:35c2:b0:381:6cbc:7192 with SMTP id
 r2-20020a05600c35c200b003816cbc7192mr951561wmq.146.1646693128262; 
 Mon, 07 Mar 2022 14:45:28 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 s2-20020a1cf202000000b0038977146b28sm523742wmc.18.2022.03.07.14.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:27 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 17/47] hw/i386: Replace magic number with field length
 calculation
Message-ID: <20220307224357.682101-18-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.ibm.com>

Replce the literal magic number 48 with length calculation (32 bytes at
the end of the firmware after the table footer + 16 bytes of the OVMF
table footer GUID).

No functional change intended.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Message-Id: <20220222071906.2632426-3-dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc_sysfw_ovmf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
index df15c9737b..07a4c267fa 100644
--- a/hw/i386/pc_sysfw_ovmf.c
+++ b/hw/i386/pc_sysfw_ovmf.c
@@ -30,6 +30,8 @@
 
 #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
 
+static const int bytes_after_table_footer = 32;
+
 static bool ovmf_flash_parsed;
 static uint8_t *ovmf_table;
 static int ovmf_table_len;
@@ -53,12 +55,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
 
     /*
      * if this is OVMF there will be a table footer
-     * guid 48 bytes before the end of the flash file.  If it's
-     * not found, silently abort the flash parsing.
+     * guid 48 bytes before the end of the flash file
+     * (= 32 bytes after the table + 16 bytes the GUID itself).
+     * If it's not found, silently abort the flash parsing.
      */
     qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
     guid = qemu_uuid_bswap(guid); /* guids are LE */
-    ptr = flash_ptr + flash_size - 48;
+    ptr = flash_ptr + flash_size - (bytes_after_table_footer + sizeof(guid));
     if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
         return;
     }
-- 
MST


