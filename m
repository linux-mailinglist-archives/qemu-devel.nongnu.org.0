Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDF4CDD00
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:54:09 +0100 (CET)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQD44-0002Mj-Hc
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:54:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1nQCvf-000496-Jw
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:45:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1nQCvc-0000n6-KS
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 13:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646419523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EmjO2s/UE4WN1n8czSG/KMxEFj+XCRHlp7UtBZB8uLs=;
 b=SfJu7L2i+FuXJoy3GTA0VNlB9XJVghUVIvRfUn8w2/Wt9O2eYsYY2Ax5ad0r7+YA7yzWLv
 L8wwL1hA5BmsraBwhyeZlDKtemn7yOHED8CexCupIegGAA6VgH+MLG7epSKPlqIG9XZ56x
 eQAG8PxviqpoXJpcpVgiGfzG7r4Ku/0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-pyb73bu6MgSl0bFZdZ8kDA-1; Fri, 04 Mar 2022 13:44:15 -0500
X-MC-Unique: pyb73bu6MgSl0bFZdZ8kDA-1
Received: by mail-qk1-f197.google.com with SMTP id
 7-20020a05620a048700b00648b76040f6so6205061qkr.9
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 10:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EmjO2s/UE4WN1n8czSG/KMxEFj+XCRHlp7UtBZB8uLs=;
 b=Vv1U38Chjr/bZIAw2O5i6HxnRvzAgh+DcW7INraXNOegy6jFaXR/C5jG+q8TqmhNaS
 Ppd//3wkdfqOW+qIm2zvTTZIFBxl0fI5sEYtlXOY8qt9Skunrfev/d9nI8Jmz5bBgqIT
 km0KqiRCNChUW3xvzfGG/JlbgKXjFqPtI5WqleqVyOojTgJXJrSQ6TLyfoxz2Y5U/z9D
 Xcv/xdG9E67Or7Ndm9yfw7UjRrSq5K+61+rvnT1xmCvQ//E5n9ljJSjFXk5JaZFWHuf9
 eOD/LcWyMx2h8fvARjj9vSQa9Y7/TdS9fzWcGmuffra0Z8sYR8MqcQXy6lcwAS6TFU0/
 d06A==
X-Gm-Message-State: AOAM5318ZjtfWXmGrC2InjsPs/x+ljfrBCGsa1QrGeGENTW9H3OmNnFn
 IxO0TV1jMslOyUQ7+y4NVSYXHTIZTcfpt+/5HATg6/836Gr3GDWKUiKxhEz7FnkywRDjqlY2aFE
 vfbpaN5Rr0cVnVaKdmM923ek8NlgfCmGfRrXJGQ1y+AFr4UnrTfZ5Yyken3zygOBcrW8=
X-Received: by 2002:ae9:ed06:0:b0:662:f250:195a with SMTP id
 c6-20020ae9ed06000000b00662f250195amr3494294qkg.471.1646419454778; 
 Fri, 04 Mar 2022 10:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlOh0MWWmR63bDrwguqRku4B7//dRqe5Ce4quEFaf6bml5LdfhTnSK3EUd5JVZsWccUdctww==
X-Received: by 2002:ae9:ed06:0:b0:662:f250:195a with SMTP id
 c6-20020ae9ed06000000b00662f250195amr3494278qkg.471.1646419454514; 
 Fri, 04 Mar 2022 10:44:14 -0800 (PST)
Received: from fedora.redhat.com (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05620a12ee00b00508b2c61482sm2725837qkl.25.2022.03.04.10.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 10:44:13 -0800 (PST)
From: Tyler Fanelli <tfanelli@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] i386/sev: Ensure attestation report length is valid before
 retrieving
Date: Fri,  4 Mar 2022 13:39:32 -0500
Message-Id: <20220304183930.502777-1-tfanelli@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=tfanelli@redhat.com;
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, kvm@vger.kernel.org,
 Tyler Fanelli <tfanelli@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The length of the attestation report buffer is never checked to be
valid before allocation is made. If the length of the report is returned
to be 0, the buffer to retrieve the attestation report is allocated with
length 0 and passed to the kernel to fill with contents of the attestation
report. Leaving this unchecked is dangerous and could lead to undefined
behavior.

Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
---
 target/i386/sev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f8..215acd7c6b 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -616,6 +616,8 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
         return NULL;
     }
 
+    input.len = 0;
+
     /* Query the report length */
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_GET_ATTESTATION_REPORT,
             &input, &err);
@@ -626,6 +628,11 @@ static SevAttestationReport *sev_get_attestation_report(const char *mnonce,
                        ret, err, fw_error_to_str(err));
             return NULL;
         }
+    } else if (input.len <= 0) {
+        error_setg(errp, "SEV: Failed to query attestation report:"
+                         " length returned=%d",
+                   input.len);
+        return NULL;
     }
 
     data = g_malloc(input.len);
-- 
2.31.1


