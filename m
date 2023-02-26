Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15926A3464
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:08:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPAo-0002PI-AC; Sun, 26 Feb 2023 17:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3B9j7YwgKCswA46ABsxsy66y3w.u648w4C-vwDw3565y5C.69y@flex--smostafa.bounces.google.com>)
 id 1pWPAh-0002Nw-2q
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:07 -0500
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3B9j7YwgKCswA46ABsxsy66y3w.u648w4C-vwDw3565y5C.69y@flex--smostafa.bounces.google.com>)
 id 1pWPAf-0003tm-Kd
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:07:06 -0500
Received: by mail-wr1-x44a.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so197426wrz.18
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fI+RGYAGJmkK9ItOnQm3SAMT7F8JvJjN4gwby0OUI64=;
 b=M6mmnAtPssYSbaRHCy2ue6WJ/c/9BJvncXQUyDqZ02SQZM/9dBdl685KA8L4jlVxpI
 ORv/wIOkbr9IwPwiv6EhFfT9JRb7g449bKNSRiS4HdeMNQuHXINzHtE7BaVXs28V5ask
 y8cD7F/IVwKJu2rr9wbaZsoiMm7WlkYzVM/0G2wU4aLa3RsAs55JNNdoEW1CMo8+XEBx
 wYqWuCBQhGPiyVQFUcRlThP9CF0/L06ddst1QXrWvqsJGPea1qHrWdU6yfkUhXIzHGYe
 +jkEu1CRjqpDDF3X2irY65BzmdtjnA/xpo3uIyks+CsTJFGABcBetkIiVIe2DhicSI2z
 3X1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fI+RGYAGJmkK9ItOnQm3SAMT7F8JvJjN4gwby0OUI64=;
 b=nR0W0lTsqhBdPiuGJnyYsO9Nzvb6t1oYLN3R6lwPLKV4B5LAjVSgJLIeT2Ld/w/i6a
 Nf/ZVjGMSzujAmkfhXr46eiX4U7y/Zx51NdWFr62yFrr+6tgsNLI4ghWWJS07rUfYWuf
 fRbAky4LmYeL9GNGZnNtpTPgi4rDYM+nLeLd786886VcFRG24zMD/TkG1mz/41rLdQ74
 YG/Pz+ifIlIbB+W5WbmhWvJDjfFUONVCb0UrgvwSA89y+EoSPOpHlDg3xxZ4bk6bT6Eu
 yqMkaufl6G0crnEQIWwL6JSLj7etakDbds4HPkyhbSXC+0bKJfOE1Vs77yDOiE1wR1jf
 qivQ==
X-Gm-Message-State: AO0yUKV2bM/zo/rnESl1ZnCWdsLzxYUiXviFZ2Jzrg9R4k6sjg9sB8Ti
 2nV8DTcRhHtBovAWktTRXQcid2+WyRwqjpCdfvuEQHCV/DYHjievWIPfhbFMb5/Hn4subKOYvqq
 4jNAHJrR71/Si7cf8n87PMpdtUg7WEj4A5W5fyhQHckEU/rDZYkoaDJBNS4HBbMEI7w==
X-Google-Smtp-Source: AK7set/wjIXw1TqlsFeDMDJSVMsKbLtoI8b9NQQaXJisCsZxMVgzt9FJ8rfqgBcgE+UpvpR4K0fQzmdgnPSR6w==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:3481:b0:3df:97a1:75e8 with SMTP
 id a1-20020a05600c348100b003df97a175e8mr1879457wmq.0.1677449223756; Sun, 26
 Feb 2023 14:07:03 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:40 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-2-smostafa@google.com>
Subject: [RFC PATCH v2 01/11] hw/arm/smmuv3: Add missing fields for IDR0
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::44a;
 envelope-from=3B9j7YwgKCswA46ABsxsy66y3w.u648w4C-vwDw3565y5C.69y@flex--smostafa.bounces.google.com;
 helo=mail-wr1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In preparation for adding stage-2 support.
Add IDR0 fields related to stage-2.

VMID16: 16-bit VMID supported.
S2P: Stage-2 translation supported.

They are described in 6.3.1 SMMU_IDR0.

No functional change intended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
Changes in V2:
- Collected Reviewed-by tags.
---
 hw/arm/smmuv3-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e8f0ebf25e..183d5ac8dc 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -34,10 +34,12 @@ typedef enum SMMUTranslationStatus {
 /* MMIO Registers */
 
 REG32(IDR0,                0x0)
+    FIELD(IDR0, S2P,         0 , 1)
     FIELD(IDR0, S1P,         1 , 1)
     FIELD(IDR0, TTF,         2 , 2)
     FIELD(IDR0, COHACC,      4 , 1)
     FIELD(IDR0, ASID16,      12, 1)
+    FIELD(IDR0, VMID16,      18, 1)
     FIELD(IDR0, TTENDIAN,    21, 2)
     FIELD(IDR0, STALL_MODEL, 24, 2)
     FIELD(IDR0, TERM_MODEL,  26, 1)
-- 
2.39.2.637.g21b0678d19-goog


