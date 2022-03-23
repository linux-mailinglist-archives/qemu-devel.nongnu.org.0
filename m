Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1FB4E575E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:23:16 +0100 (CET)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4hX-0003Gw-Ez
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:23:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4e4-0005I2-HQ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:40 -0400
Received: from [2607:f8b0:4864:20::62c] (port=40889
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4e2-0004in-Av
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:39 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x2so2151046plm.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hGzoIEiqotEx27Bg+Z4eL5zpKSfKxDxE5VGRYeUpF1U=;
 b=YN2nPW6qFv/FXMaZbHoge7dvyFY38/0TL7t4FHhvZ3ROq4ndXz7aVe/WYlNC1die01
 TcD+kFy/xidXVPGx7gpqZ75SywkLL2EYPJoDBotF8TIRl44RYN5JTM1qKjZv3d6GIfqU
 jWotsaKHFfCdSkhPSpjxx+SuvENG8Rj/Mv3l0DwhQfohsPpFU6t73UPPj8CSrbQfuBkd
 9Z/VXAQWYd7J2zxrjtJ/gWD5iowxhsrQ7vwQGuFXZNP0fMUeSz4fBHXmC/cKAe6dYlVs
 NCh7inykD23K3nAQkmHK7E/YkkRS5g4L8ZmGYcKNVOwgDWWwZ2QenCCnu2L1vwreGob1
 13sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGzoIEiqotEx27Bg+Z4eL5zpKSfKxDxE5VGRYeUpF1U=;
 b=q+cKOcBHtQ55vZzG3Asl4QVWUeFx74DvFA549DH0sSELfYvT8aXPItO38BBmOtC176
 6q1Z63SxeXCZVyuu8HunIuSv7WN74ejHXycJTNqiCkEqFT3B4qlDB3GUSyvfR88/csym
 hQ8sjn7ESd/qlApfhWT01vNLjNm2rX0xwGnJHP5ABfQeNU7zLxazgPxKRgZ8a2Am8FtF
 0kWss5NB2PNnG/w+c/7ALa/htanrToXaJNPalZN2CxW8nWaItX8vtvFI9Lm8hrT6rDt5
 0lCrAZq+WIwfL12IXXvb5PfxAq8sMketPbMJLhV67igtcYMPL4Pu0ToJwHySMzMDS59E
 v3LA==
X-Gm-Message-State: AOAM5328SpwNR0WJ+d+qasiufw4H0YfXeJUj0vUlFNYTCmhm+9iVKMi7
 zPdyhFbjJZVvI+d1qbIEADP8B2ltSzg=
X-Google-Smtp-Source: ABdhPJypHL2FuS5xBRJ7IZra6e8WHCycd0JJ50I5gNrC37pYhlUHgXYCXbDEv97OJjTv0XckGdi+gQ==
X-Received: by 2002:a17:902:8543:b0:154:9588:52ab with SMTP id
 d3-20020a170902854300b00154958852abmr1177032plo.50.1648055976951; 
 Wed, 23 Mar 2022 10:19:36 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 d25-20020a639919000000b00364f999aed5sm349409pge.20.2022.03.23.10.19.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/13] accel/tcg: Extract rr_create_vcpu_thread_precheck()
Date: Wed, 23 Mar 2022 18:17:46 +0100
Message-Id: <20220323171751.78612-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to extract common pattern from rr_start_vcpu_thread().
First extract the rr_create_vcpu_thread_precheck() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-rr.c | 7 +++++++
 accel/tcg/tcg-accel-ops-rr.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index de8af32af7..3da684b8e6 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -272,6 +272,13 @@ static void *rr_cpu_thread_fn(void *arg)
     return NULL;
 }
 
+static QemuThread *single_tcg_cpu_thread;
+
+bool rr_create_vcpu_thread_precheck(CPUState *cpu)
+{
+    return !single_tcg_cpu_thread;
+}
+
 void rr_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
diff --git a/accel/tcg/tcg-accel-ops-rr.h b/accel/tcg/tcg-accel-ops-rr.h
index 54f6ae6e86..e2273b66d4 100644
--- a/accel/tcg/tcg-accel-ops-rr.h
+++ b/accel/tcg/tcg-accel-ops-rr.h
@@ -15,6 +15,7 @@
 /* Kick all RR vCPUs. */
 void rr_kick_vcpu_thread(CPUState *unused);
 
+bool rr_create_vcpu_thread_precheck(CPUState *cpu);
 /* start the round robin vcpu thread */
 void rr_start_vcpu_thread(CPUState *cpu);
 
-- 
2.35.1


