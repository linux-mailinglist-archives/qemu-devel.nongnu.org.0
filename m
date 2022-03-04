Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C64CD623
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:16:06 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8iz-0002jq-F3
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:16:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8AF-0002aq-AX
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8AD-0000pA-Qj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIYTx9xMPVdCirDAB9Y8FCSD6kEXvGl7DGfbZeP6K2A=;
 b=LVNvZ1STfU2LAP9Lw4voBUV5KoOvQnNcOdj5rK5q/IdgVXidb7eletzb97jRofvD0nT7GG
 0jSNkjef0t4FijpaIOINjziOk5Vf99lZr2Q5gqp6C7awOqV2OOJs4D/GFp11G2xuUYa395
 xyofD/IBvUVhOEc4g3CM7VtVmQoD5Ak=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-ES0K21uRO2aTVimzzlo5nQ-1; Fri, 04 Mar 2022 08:40:08 -0500
X-MC-Unique: ES0K21uRO2aTVimzzlo5nQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so4172570wme.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xIYTx9xMPVdCirDAB9Y8FCSD6kEXvGl7DGfbZeP6K2A=;
 b=vflyF6HuQp2IAK8ossmHs0Cim+tHb8suERscz6sE8e7tWWsBXpJtil9tOcXbS5kCQp
 WBgk6HmoT/ABQ6bPaBxX9spiNkRtEoALih1iTA9cPALFV7Y5uyqAxt7CCbAt6haN8S+q
 eqpWsWK9XacxAFUNFN/WmaEngk9HnLt1Fs4/AMJuYf0GwkQRt44Brp0qKZnyzv9Y7RA4
 S1kCF8rKxSftWInSyQ5AFwvsz+FQzn35yvwHaTjbRh9g69rvZXc+itPgOvChCb2bqntr
 3/1l9lKCNq7R/d7oD51+9mfzocNjq22qSgDBnCkFfYgqEuIuFFJt7P8IE0ONTZAqSmzg
 XOtw==
X-Gm-Message-State: AOAM5335BLy1spptzWxtPeKiaDqzxaHz/JSjZLWza1EuWcds2OYEscDt
 klXDApTUt6RhzabWjWBTT6nJYTUrOTutCyvtGDqQ7V/6UPJm40qy0CeGqeRq3kA23lEs+w4SMkf
 /9BsbIqV58YwbvIawDTEJpvRXyWWgQDCWMqAPP1S9NfM9bzsSMgdqd9S6cx3p
X-Received: by 2002:adf:fa48:0:b0:1f0:d71:f9a with SMTP id
 y8-20020adffa48000000b001f00d710f9amr12541233wrr.50.1646401206503; 
 Fri, 04 Mar 2022 05:40:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxu9V4c1xFsmpIACsTVMgvmDUeC9RZN4LNi5L98FJ0edM9zVEekf6LaEDW5RqsHGm440ZPDnA==
X-Received: by 2002:adf:fa48:0:b0:1f0:d71:f9a with SMTP id
 y8-20020adffa48000000b001f00d710f9amr12541210wrr.50.1646401206212; 
 Fri, 04 Mar 2022 05:40:06 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm11749494wme.29.2022.03.04.05.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:04 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/45] hw/i386: Replace magic number with field length
 calculation
Message-ID: <20220304133556.233983-22-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


