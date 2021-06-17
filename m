Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222E13AAFFA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:41:45 +0200 (CEST)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoWu-0005vX-55
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNG-0002hw-RL
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:48 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNE-00066C-Nu
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:46 -0400
Received: by mail-ed1-x536.google.com with SMTP id w21so3070033edv.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s80JSWWhXUaW8VPewNLASzQ/RLf7bfO/1fOwopy2TkA=;
 b=d61nTB0fIt1eXIJ73/+FsvAHFY4QHvtuSZISCJS0UQLf6DDg+u1hKUptLvKVKj1wzc
 Kbvm8b8bglpTsEvOT98UuFLvuosjLMRmdMxPuIwxZ4ElcRceEp3SY4PEUJP72kcLS9qD
 vKQtFEVsWj7LlTKAULMKjHZj8aukRTjgS1ycPivHA3hhnDtalkWGynbGRlfmq9adjNO3
 lefmKygHUOpd8MA9rBj+qBFyrZfAlUFVDmpHZPf77578seAtJN32o00pg5sKezboxVJM
 UNP+nmiads84yktjtMj39FIgYoYfXSTeJahgk9+UbtgIwdb1NsTW+6f8F5ixN9bFAvZe
 Kfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s80JSWWhXUaW8VPewNLASzQ/RLf7bfO/1fOwopy2TkA=;
 b=iUHmnQXE1/PVQOhYYQVlaz1pI7Eoa2+6wD9Lde6dgiI+oib9r5JFX4T4qcdGBL4njs
 Fqqyq+v94P1zt2MHK+mMyoH33C5iRZVz5S0TlNqn+LEBBvWnfU5T6P7ObUnzS0iPa9Si
 tY9GkdhFA6mOyQfTpFNewBCW0q41p2Y9QzW7kAQBg99XdoYeQL8NkvAyYod9Wj8quJg/
 VC3LP1lf52AfLNLE34OFlTavOA4tcuWKT4zXVGBNmT/bmyiCdci2LCt1e2AiaFkIPHEs
 s6l2e7J/0qMZGqZGZOltWg6g2vLLimr433tLv+dMqajYZKJYeKZoSQkZr3KdHwSTnNRf
 KOQw==
X-Gm-Message-State: AOAM530LH0sEyXMlVy8xk+TyT7UkSJ5Pgs2DZZKA9rF5orv7sQRC2r+i
 N1SsoEIVh1PJ7sL1VKAiRS+Zqpvxzks=
X-Google-Smtp-Source: ABdhPJz+9o2KyZYgxVgzriY/gR2KS1iYhoZhDPSBlG/ygsFN5Gl+rr1cXszEDm9hcNg57fFKXgk5WA==
X-Received: by 2002:a05:6402:2742:: with SMTP id
 z2mr5280719edd.66.1623922302830; 
 Thu, 17 Jun 2021 02:31:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/45] esp: revert 75ef849696 "esp: correctly fill bus id with
 requested lun"
Date: Thu, 17 Jun 2021 11:31:00 +0200
Message-Id: <20210617093134.900014-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This commit from nearly 10 years ago is now broken due to the improvements
in esp emulation (or perhaps was never correct).  It shows up as a bug
in detecting the CDROM drive under MacOS. The error is caused by the
MacOS CDROM driver sending this CDB with an "S without ATN" command and
without DMA:

    0x12 0x00 0x00 0x00 0x05 0x00 (INQUIRY)

This is a valid INQUIRY command, however with this logic present the 3rd
byte (0x0) is copied over the 1st byte (0x12) which silently converts the
INQUIRY command to a TEST UNIT READY command before passing it to the
QEMU SCSI layer.  Since the TEST UNIT READY command has a zero length
response the MacOS CDROM driver never receives a response and assumes
the CDROM is not present.

The logic was to ignore the IDENTIFY byte and copy the LUN over from
the CDB, which did store the LUN in bits 5-7 of the second byte in
olden times.  This however is all obsolete, so just drop the code.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
[Tweaked commit message. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 8e314ef156..16e4b7ead6 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -260,9 +260,6 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
             return 0;
         }
         n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
-        if (n >= 3) {
-            buf[0] = buf[2] >> 5;
-        }
         n = MIN(fifo8_num_free(&s->cmdfifo), n);
         fifo8_push_all(&s->cmdfifo, buf, n);
     }
-- 
2.31.1



