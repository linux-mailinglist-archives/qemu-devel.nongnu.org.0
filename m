Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD184CFA79
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:21:33 +0100 (CET)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAUe-0007R9-Iw
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAC4-0000mD-KA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAC3-0002k9-2X
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIYTx9xMPVdCirDAB9Y8FCSD6kEXvGl7DGfbZeP6K2A=;
 b=gUQaHjcC4SUmviuN7u6y6qC2yhcQXf5CnZQMH7Ro0dXQ/6i7okOeDOZE2Ub4iM5UNZggb6
 AASwS79MuEOSrersS7me+qHtiX9OjpGcYKnlP+TJwV31sP3wXj+JUUAD6KVrYD6kW+OSqf
 hOQn25p+J+We9m1TS4WxYUL+d/6myRA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-zy8YCBtvPoWszThVzUF0bg-1; Mon, 07 Mar 2022 05:02:17 -0500
X-MC-Unique: zy8YCBtvPoWszThVzUF0bg-1
Received: by mail-ej1-f69.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so6693487ejw.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xIYTx9xMPVdCirDAB9Y8FCSD6kEXvGl7DGfbZeP6K2A=;
 b=RfwLfcxZz3hkEpLdotYC3uaNAzB6oEWKt4x0Y7Riujq+12mQoe18FYOaG0L8V6evd3
 DClu/GzJjkCXyAJWF53hGQdrNKhLk8Ug5su4FQJzZr7KD2dLncxbzabwATZp3yhya44j
 Di1RX7go9wGzsB2ooxBX1aIqEslTBux/mD4rhXRseNKw0jAjTa8eDL3CcLox57OF941q
 T5E0hBbwxi5L72z2U+PuZwL1iBoNZ0utioy2253rfSBt2auIQ5j0OifCcdKLynG7Ydig
 ky40Q0twuGV3/6kXIbXF9T8heNVACNju3l7aJ/tqi+pbkWwRh0hipWoUt1Kq8ksPSe7Q
 ErAw==
X-Gm-Message-State: AOAM530/7cB2uCsVx3f3BulZAwX1woFq6eWB6aDmLC3L+Sl/EPgkFfp2
 cIqweP67X48Tj5mo5P1/KQPudVhNEwCEXmiQy+mADYQUUOpgj3DM3dF1BDskAmSm2Z0gMTum2Cx
 S8qub1uz4UBmqnKlf5N4DrhIe13EGw3zKDyY7SsxuYaRV0xf+Ts2U9QmgvsxM
X-Received: by 2002:aa7:c80b:0:b0:416:463c:309c with SMTP id
 a11-20020aa7c80b000000b00416463c309cmr4296731edt.413.1646647335961; 
 Mon, 07 Mar 2022 02:02:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5e6dBcxeNTgKBJ57jBtNFctF36uloJS2bQTdB9go52laQwxVHsdanAMkr6yewhQ2dL9/F8Q==
X-Received: by 2002:aa7:c80b:0:b0:416:463c:309c with SMTP id
 a11-20020aa7c80b000000b00416463c309cmr4296695edt.413.1646647335572; 
 Mon, 07 Mar 2022 02:02:15 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 kw5-20020a170907770500b006db075e5358sm2121288ejc.66.2022.03.07.02.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:15 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/47] hw/i386: Replace magic number with field length
 calculation
Message-ID: <20220307100058.449628-18-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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


