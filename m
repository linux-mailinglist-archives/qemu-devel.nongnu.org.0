Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876946359D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 14:37:54 +0100 (CET)
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms3KS-0001ZC-OS
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 08:37:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ms3Ex-0005jX-8g; Tue, 30 Nov 2021 08:32:11 -0500
Received: from [2607:f8b0:4864:20::92b] (port=39440
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ms3Et-0000Og-NM; Tue, 30 Nov 2021 08:32:09 -0500
Received: by mail-ua1-x92b.google.com with SMTP id i6so41310290uae.6;
 Tue, 30 Nov 2021 05:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYuTC43W2iZaFiptKigyn4rV0HBJzyK8EzcOeFqI8x4=;
 b=jeMAELey2oZDTfHkTi4qkdeoq1RPZWLJCngHcY/iu1sVOvbGNT9NvxXlSL0j8xwrJx
 Oaf6+pzLmBSF0/quwCmSWngewlvG+hC9M6TfWILNCaEAqHj9OGNdbPAxkfMjwpiutYPE
 +wRBg8SI6nbQm6GUKdKEkNZekRRPYIgJhNDNBFbV1NAQyeHfnjl4SwBrYyt7AwZq2e7j
 JFk92k5PJKnhF8xZR77sxT0KpvcepwAm8OUtt3Mm8+FwS+UcdWgsB+pPi4UBCb/LgGVg
 E91WWBjDkiNPKApQSbyQPoCdf+YvImXJBe/HdP6vGuB0t6YSb8hw823Dw7e2YKDn6g6j
 k/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYuTC43W2iZaFiptKigyn4rV0HBJzyK8EzcOeFqI8x4=;
 b=lUsZMZGE3CE7H7jYgu3t1LjN5MX6fmocKOT9pRlJQA4wDXvZTValB7JXqIgISFYEEQ
 0Bw+Psf9ycSYKXbOnaOKVxgoI0oHIRO+LUHD2GI5V2ZwApU3O+VgAduysHtEvnBo3w0D
 MeiA9OZ88xQ7/Ur03MuGP03oF6Ef8i9cyHGm/j9rgSSK1sGG37bCzpG49QvgG5Tctar4
 WdVQngFt03vLiJ7SisZeSTb/FNS1QuOfgVlGsZZwd2um3g0b1xc6/9yJYoUDr7RnHCfI
 Y4TAjipB8k7F6kEvbRUlfDXlImZAaIKqRyKJwNQicwHzBea9dGf1GCJTNclToWN75KpX
 h5Pg==
X-Gm-Message-State: AOAM533WCdFOkwMfqlIIGCXhhz8gLPuI6vMal1XRaGr1TLdCRPkMG8cH
 /Bfqpgt1xP29p/0JlpOeYLYNg7dU2lg=
X-Google-Smtp-Source: ABdhPJxlUTtaLS+4l+RwEm9UgPsoJ6BioH8Jx/gyl9UfaZ+4OUv5z1IIBjA+iXjl1FOQj6/ta/niDw==
X-Received: by 2002:a67:a409:: with SMTP id n9mr40001547vse.74.1638279126353; 
 Tue, 30 Nov 2021 05:32:06 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id h22sm2058071vsu.0.2021.11.30.05.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:32:06 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] docs/system/ppc/powernv.rst: document KVM support
 status
Date: Tue, 30 Nov 2021 10:31:53 -0300
Message-Id: <20211130133153.444601-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211130133153.444601-1-danielhb413@gmail.com>
References: <20211130133153.444601-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put in a more accessible place the reasoning behind our decision
to officially drop KVM support in the powernv machine.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/system/ppc/powernv.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
index 86186b7d2c..8304e85c51 100644
--- a/docs/system/ppc/powernv.rst
+++ b/docs/system/ppc/powernv.rst
@@ -58,6 +58,19 @@ Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the `OpenPO
 QEMU includes a prebuilt image of ``skiboot`` which is updated when a
 more recent version is required by the models.
 
+Current acceleration status
+---------------------------
+
+KVM acceleration in Linux Power hosts is provided by the kvm-hv and
+kvm-pr modules. kvm-hv is adherent to PAPR and it's not compliant with
+powernv. kvm-pr in theory could be used as a valid accel option but
+this isn't supported by kvm-pr at this moment.
+
+To spare users from dealing with not so informative errors when attempting
+to use accel=kvm, the powernv machine will throw an error informing that
+KVM is not supported. This can be revisited in the future if kvm-pr (or
+any other KVM alternative) is usable as KVM accel for this machine.
+
 Boot options
 ------------
 
-- 
2.31.1


