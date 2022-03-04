Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E956F4CDD72
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:54:42 +0100 (CET)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQE0g-0001wC-0e
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1nQDmz-0000YK-3l
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:40:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1nQDmx-0004vT-HY
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V4hj5evNOGl+Lr6CX2G+YtA5FLa2dyLPNNnS8TcyC4w=;
 b=gTRWHdf/SvkvYEfpum8nYvjrPlan3PC3FLPnKLhddKApoyM72xpsoVdUl9aekLSYeIabxo
 KAwcSCBlX7MYyKdzlGgmnb40b6s9kJhEXLiKR6ymvjpoajmQmHWKY0JpJfc1L+VKfdqiFh
 VUN/o8b07ewAF9Q5O4q/R8stbtO3EIM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-rThGqzSWPCKu3T_RUsdEiw-1; Fri, 04 Mar 2022 14:40:28 -0500
X-MC-Unique: rThGqzSWPCKu3T_RUsdEiw-1
Received: by mail-qt1-f199.google.com with SMTP id
 t14-20020ac8760e000000b002e049ff9638so3479752qtq.10
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 11:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V4hj5evNOGl+Lr6CX2G+YtA5FLa2dyLPNNnS8TcyC4w=;
 b=cC3p3MTnLqxFnbJ6GLf4jC0iQTuXLsv49nVmWZ5BYSZGiQyIx8q8YDjKZbUAfeugeo
 /6WGTpG1fwC+HEQp12AghtKNWxrtqHgfivBeq2sj/BUyBH62X9uljrPJVPNClQWp5NxH
 M+bt2e8K0GUN3kDEzitdTdZ05zAUjT1N5JQ/QyF5vo0IQyxaF/tvKj0OzMnnVP/33IlD
 a+5aTX+yvQL0N/K7bGml4k0UXOf1wReT+g33WZoS2zZAVpM/2puOld/Cn+zOawKIHuJr
 q8K9bvOZ3SOLkAONXmFvNt1iVjOox7w2iM491PfNTFF5cwGf4JJFa+01fV5+EnlkVmNe
 ePVQ==
X-Gm-Message-State: AOAM531Ms8NJukKYhj/THBlcL0kOE7rky+3WnveNqY4nm04GKoBGcQze
 qZ6TPlnW+e8xGU/oRNAJUuIo37F50HJTdydEW3lA2jLuxHObxmdrD5U5MuGoRB2gK6PYwZffFIo
 uvsSvH1KyfKD0Gc/BhIye3oIj8rVpxj6m6ixX92Mkomy66NrBYsVGiVN19FrfxAWBHlk=
X-Received: by 2002:ae9:e005:0:b0:46d:cfe5:993 with SMTP id
 m5-20020ae9e005000000b0046dcfe50993mr170979qkk.138.1646422827834; 
 Fri, 04 Mar 2022 11:40:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygvWtWn+RjVpGiJotLiISijesaD60G1Vf7am9ZqIc0E8NnuEV/HvqRRlj6ouPh7aR/F9g2tQ==
X-Received: by 2002:ae9:e005:0:b0:46d:cfe5:993 with SMTP id
 m5-20020ae9e005000000b0046dcfe50993mr170960qkk.138.1646422827466; 
 Fri, 04 Mar 2022 11:40:27 -0800 (PST)
Received: from fedora.redhat.com (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221]) by smtp.gmail.com with ESMTPSA id
 e9-20020a05620a014900b005084ce66b44sm2824636qkn.88.2022.03.04.11.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 11:40:26 -0800 (PST)
From: Tyler Fanelli <tfanelli@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] i386/sev: Ensure attestation report length is valid before
 retrieving
Date: Fri,  4 Mar 2022 14:37:43 -0500
Message-Id: <20220304193742.506703-1-tfanelli@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=tfanelli@redhat.com;
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
to be 0, the buffer to retrieve the attestation buffer is allocated with
length 0 and passed to the kernel to fill with contents of the attestation
report. Leaving this unchecked is dangerous and could lead to undefined
behavior.

Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
---
 target/i386/sev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f8..80d958369b 100644
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
+    } else if (input.len == 0) {
+        error_setg(errp, "SEV: Failed to query attestation report:"
+                         " length returned=%d",
+                   input.len);
+        return NULL;
     }
 
     data = g_malloc(input.len);
-- 
2.31.1


