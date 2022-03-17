Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E009D4DBE62
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:32:03 +0100 (CET)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUijz-0001cf-0a
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:32:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL0-0001Tb-N2
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:16 -0400
Received: from [2607:f8b0:4864:20::1031] (port=53186
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKz-0002If-AZ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:14 -0400
Received: by mail-pj1-x1031.google.com with SMTP id v4so3952607pjh.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lGnYRwLa1Sdp2FVEXMpjEqak7lSPIuu/eJVT8HDcZLI=;
 b=ioBk7+ufL/oQZT/M7W3ZiNyOKznruuv2du4Kcqs7wJ2G7FMi6u8nnsjhkWyaJXJGA/
 tDnam/bOZOD936wClukI92TE0Ot3MfFkZlQ5sSilTkEwcr38vXGQBQYM2kw1bnJpoZqP
 0U0B/dRDuu4J9CvxH9A/lafsPH7/19JP6SpX+gGuoKRyjXVXYUzYzmrGuo6KLrer6mqx
 rhSXVfdX4HXz/8eF4VGE670ap2iBpIyQRjcWkH4mNWW3EkuK1gTC8gylc7W6XPtSeBQM
 lDcOoN/XS5WecZ9FHibmxoCcjYqUZnb+5J7pqPYO/2ZwBdoRt/0PX8exIUcSpnE2xTV+
 Jvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGnYRwLa1Sdp2FVEXMpjEqak7lSPIuu/eJVT8HDcZLI=;
 b=gs7gD2FWD+UGH2FaJFeAwwqqlxGCNauMqXbZsdmTyw0v4SwKmeWQdCn/2Z4Q8euU8K
 /v80dc2ZlntgA/gDXStb2dZNlKzQZgypgdV7h6jPdgaCkPULEGBfzqm4COShST0AppBa
 PSduw0I73JTOozXI+D57INYJsfv+LOKI8jDBo/JlWcR26qU0oyE+Uu9xes5AUSYk23js
 QXL+M7/ljhXo+2jUplVbqIu/MCWV6aBHhhna6rV3P2XmVVh3CJOsDqSTPrkt6bxBNYgY
 D5+OCKIl0jVN0LRRUXqEQlCRC9tXLsXWimF0lKo3VK+a4RWlkNMN+zzWC5ytcVj6j2Ro
 Eibw==
X-Gm-Message-State: AOAM531WXsC3s1w1pof5eFDnm0675vJ0QLSONo/aK9EQcXbfNvdMSmIz
 2zl01nYDEgbPDHyG4BnCoJGb1d+YXo/4hw==
X-Google-Smtp-Source: ABdhPJwb3z4IVqM6odtJue089VAkha1R6mAWqJAc4wzKnjaC2RpKX/pWWK3hhEhpgGGegVJrCEhJQg==
X-Received: by 2002:a17:902:d643:b0:153:97c3:c8e5 with SMTP id
 y3-20020a170902d64300b0015397c3c8e5mr3301637plh.76.1647493572128; 
 Wed, 16 Mar 2022 22:06:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 33/51] target/nios2: Drop CR_STATUS_EH from
 tb->flags
Date: Wed, 16 Mar 2022 22:05:20 -0700
Message-Id: <20220317050538.924111-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's nothing about EH that affects translation,
so there's no need to include it in tb->flags.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 95079c186c..d5255e9e76 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -276,7 +276,7 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = env->ctrl[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U);
+    *flags = env->ctrl[CR_STATUS] & CR_STATUS_U;
 }
 
 #endif /* NIOS2_CPU_H */
-- 
2.25.1


