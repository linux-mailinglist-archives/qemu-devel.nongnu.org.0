Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DCF64F41B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:28:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6ImW-0005u0-8m; Fri, 16 Dec 2022 17:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ImS-0005pl-SP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6ImQ-0004Wv-HM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:11 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ud5so9283021ejc.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smV2boftcCtD6CrVI7POMK9nIWSGbQbv5KmjP5LYN6w=;
 b=DaOMyhZ6fNpFrNXIfIEA8BNfsz9USKx8GXatFrOF1pclTTG+TpoggCFuWgJqA9c+5t
 bN+M/B8rT57GHfUBvghHx3yQqQZkBwRtb1hMQMxW/mfPFIx2UOxpeXWNAeGvU0c9vFKV
 3drdogBgH9zKwQWF9Dg7UZxaQtL/Kb5BL7f2NPKorzyglxJ8iKDHbayQU0fOswWg+dbn
 dqbNx5uLMeS0oXSZaBa4L+jMcJPaigEzdULoZvILY3cKOjkoiG5+SeVCWr3Y4yDVgVOc
 DM9G+tLJ3XUUpin2EftSnBSZjjXZliG0kWgzHNbY1A0ImjHl0zWlzgxuM2wwUfe/uvYj
 MFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=smV2boftcCtD6CrVI7POMK9nIWSGbQbv5KmjP5LYN6w=;
 b=Yv9fVIzZG/JlHZco4Wdys5rBR1Vn3TUXvLfGyXLpbJLUdTrZ59YuSfiJkj9+Tvjhd7
 D6Q+u/apILciS0QYTnB05XV0gVks3DswNBCxZraBsWflZZbw5QaG9XR1n9rjGSErWP04
 kl09pZSYSkayNEayU3HZtERqmHPkRZnk9IZ0oE1uDSsRAlRY/BHtsZ5fGL5VtaAzO7dN
 xOCRVbbrLUNslYPtB6HHr/UxDBkFqJ5mQAER5MZYsEY6eO2vUClJXAFxmzgVc73Tv0hx
 PiMtf2jdrXYl11tSPzOw4J87Sg+F8MKALFgwRKBTH1BFZdo4Dn/dbiDjyL0c5pml6+ZZ
 JPpQ==
X-Gm-Message-State: ANoB5pliG6UHhqqEnJrsmwvcPU6YesHLQbue76RdyQWHrxkEEFDuNNvW
 DEMr90n8C4vEKsdZzYUF9zNNbe4vVNDzVn/ALkc=
X-Google-Smtp-Source: AA0mqf7QAqCiH23adcIdxw8c57oTXKYq6VQ4tdsquZy5PRXss98D1c1irVpoc52DsP192AYwLK2G2g==
X-Received: by 2002:a17:906:1805:b0:78d:f454:3855 with SMTP id
 v5-20020a170906180500b0078df4543855mr28504506eje.18.1671228128414; 
 Fri, 16 Dec 2022 14:02:08 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a170906539900b00738795e7d9bsm1299629ejo.2.2022.12.16.14.02.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:02:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] target/i386: Remove NEED_CPU_H guard from target-specific
 headers
Date: Fri, 16 Dec 2022 23:01:54 +0100
Message-Id: <20221216220158.6317-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220158.6317-1-philmd@linaro.org>
References: <20221216220158.6317-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

NEED_CPU_H is always defined for these target-specific headers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hax/hax-i386.h | 2 --
 target/i386/hvf/hvf-i386.h | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
index efbb346238..409ebdb4af 100644
--- a/target/i386/hax/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -49,7 +49,6 @@ struct hax_vm {
     struct hax_vcpu_state **vcpus;
 };
 
-#ifdef NEED_CPU_H
 /* Functions exported to host specific mode */
 hax_fd hax_vcpu_get_fd(CPUArchState *env);
 int valid_hax_tunnel_size(uint16_t size);
@@ -66,7 +65,6 @@ int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state,
                         int set);
 int hax_sync_msr(CPUArchState *env, struct hax_msr_data *msrs, int set);
 int hax_sync_fpu(CPUArchState *env, struct fx_layout *fl, int set);
-#endif
 
 int hax_vm_destroy(struct hax_vm *vm);
 int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap);
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 76e9235524..95b47c1c2e 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -24,11 +24,7 @@
 
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
 
-#ifdef NEED_CPU_H
-/* Functions exported to host specific mode */
-
 /* Host specific functions */
 int hvf_inject_interrupt(CPUArchState *env, int vector);
-#endif
 
 #endif
-- 
2.38.1


