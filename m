Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1235EFC94
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:02:01 +0200 (CEST)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxrE-0007bU-W0
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQh-0003fC-8S
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQf-00035h-U5
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8othBN7do/fP0V1Ks4ePs6mHlPkR1/tZJO0dYZNV1j8=;
 b=Z0nAzx+BrXAbw6GfP6FDczpmwNSjDIWBpwsdhvu8gX3ZIXnaiMnc2+ZTCCExqoM+bePGjD
 hrDF8W7NJ8D/tyJbzjbDqFFrfsYd3SlZD/J99jFhWBAsnzMCmSlnNB/9TOU6TuLxip0bTN
 6iZJlATANlKoMe7elnOy6DQphVw0pdQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-4xdZ-85BPgeQNi_tUhsWCQ-1; Thu, 29 Sep 2022 12:30:27 -0400
X-MC-Unique: 4xdZ-85BPgeQNi_tUhsWCQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z2-20020a056402274200b004516734e755so1667350edd.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8othBN7do/fP0V1Ks4ePs6mHlPkR1/tZJO0dYZNV1j8=;
 b=W/r553QgE5NWVsOfP1z8aCYPaGBs/+paSPr63MAUF6CEnaqWczngonuwostXwZ+uzN
 0G7ymrbddbeNg306gcPqOMzP0I+KB1XyXQEJPvE5PoT4q1T40GiZZPCCM9zTIO5GFeiE
 7HLccU7ZOP04tVn2446pV1NfkTlBEzCMH7k4p9sLTZbkxhtef1ztEWu+SGFUtnZgJgBE
 CqAv858W7owRoKJBbqQbZsPITOFd3urwV5nfDs+/x/dN3/H50fNSNoYIwCCCHd3soyQh
 nPTVOGKNprzT5gRBC/VZ+zqZrKXTWOGpRmGkdHwzS/ijaRau0DdeB1thmYAgGfakLjNx
 yYtQ==
X-Gm-Message-State: ACrzQf3a7H7bls3gc63KtXMuLUHCLTDM7g5kkoFDsCpJUxA7NM4JPpi9
 J+jPl53yKupJGFNcmPVGi7k/F/hNbAv4s6HyUzlgbd68Ko8oMsAKyjKmjsltPBJRgOpioYA/JGh
 DycxKkZdDZT0NZxI8ccYyq4Bt7Vi4xNCbC3Hm4FpYjaYatpDfhaKp1MI/RbaxYwN0E4A=
X-Received: by 2002:a17:907:970c:b0:782:e3f1:af60 with SMTP id
 jg12-20020a170907970c00b00782e3f1af60mr3389407ejc.757.1664469026326; 
 Thu, 29 Sep 2022 09:30:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/zwcp8cOTV2D7QMT5yWyXHryLXqv4FA7jUcxVx1hpsbvD0BVqjJTrP/Amgo4Y4HjcRRuCEQ==
X-Received: by 2002:a17:907:970c:b0:782:e3f1:af60 with SMTP id
 jg12-20020a170907970c00b00782e3f1af60mr3389378ejc.757.1664469026045; 
 Thu, 29 Sep 2022 09:30:26 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 z5-20020aa7c645000000b0044f0c01196esm5583236edr.65.2022.09.29.09.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PULL 03/14] x86: reinitialize RNG seed on system reboot
Date: Thu, 29 Sep 2022 18:30:03 +0200
Message-Id: <20220929163014.16950-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Since this is read from fw_cfg on each boot, the kernel zeroing it out
alone is insufficient to prevent it from being used twice. And indeed on
reboot we always want a new seed, not the old one. So re-fill it in this
circumstance.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220921093134.2936487-3-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 1ee0b1b413..f9a4ddaa4a 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -783,6 +783,12 @@ static void reset_setup_data(void *opaque)
     stq_p(fixup->pos, fixup->orig_val);
 }
 
+static void reset_rng_seed(void *opaque)
+{
+    SetupData *setup_data = opaque;
+    qemu_guest_getrandom_nofail(setup_data->data, le32_to_cpu(setup_data->len));
+}
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -1105,6 +1111,7 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
+        qemu_register_reset(reset_rng_seed, setup_data);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-- 
2.37.3


