Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED1548ED50
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:44:00 +0100 (CET)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OkB-0005gW-8s
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe3-00088I-Bc
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:42 -0500
Received: from [2a00:1450:4864:20::329] (port=41781
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8Oe2-0000cF-19
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:37:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so6451853wme.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J28a/NNVYEjFSLH7bw1vfwdi9VWF2J04rRZYQ11TvGw=;
 b=EDH06yxH2Jus/t7A1iyNwmW8E4F7XIAxP/Ee8V+VS79LyGRi+7GrSdTrKwn8loi+xL
 G2VdGhIJyvr7CY958zwEpANfywEp5e0vuxW/ZiAPuN/zpyb0tNyZOfqm9Vl4m7ywuePI
 NbT0L37Mj3mbprsR/eeB3a95QAPwLL18G7UYYfVP3IHtc2NrNt8Vu3KFH2HWnCUxDIHo
 CdGj0FazrFiHwcI3u16VVunM9/7rlLbSCU+BxHa5f8tcUVLj7sRca8T6I63EnhSppUoD
 ErFT+Ss1NGjQE3lD204Ih0CfIkTRgwUEw8wF1lPoQenjqIi+BXwhCW46I5yJvpK/Z8fb
 5hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J28a/NNVYEjFSLH7bw1vfwdi9VWF2J04rRZYQ11TvGw=;
 b=O7A6W5FhjEYYCyESQ0+2VotOzIrVUc81MfeO6eg7ROBk1wxMzMD719pf7eqJDlzFSC
 JVP58AZA6jxymoZcgIMpFPaGlgpDDtT/sjJTtnMo5twNxaUOufDikysGEKCgo3J/jHc/
 uyA6enQcoB73cpKsvG6C/jNamRHFUzYWW353bU+p34Djo5+PRurEYZlvyMu3bd/jPMfX
 iDgTg2eB5RtxnIq8zLubvfVxdA3XNh1m/zE5HOSO9NgzHvlslgHiixvXN7WUguwUdC0g
 cTrL1RAZkQIDjRd2DZikZxsSV151VXCMvuiIdVDuS7I/Ay5TXWnVXj5f2QGezZ6KQGh2
 BZhQ==
X-Gm-Message-State: AOAM532/kRmbflfB7F0d/+cTAWF6eIYI/JYz+tnjkViZYzkR0CAv4DfM
 WyLaj+ZQZxa46uXVlWaYDPAQrmcB6XHrrQ==
X-Google-Smtp-Source: ABdhPJywL5jdzSQdJtsAlabqOlVFNjbhHaT8I6zNmWoyS7OMuBQgJBGfDfBvns1iJ/HGZgCWMuT+Ug==
X-Received: by 2002:a7b:c413:: with SMTP id k19mr16264749wmi.25.1642174655929; 
 Fri, 14 Jan 2022 07:37:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v13sm6464141wro.90.2022.01.14.07.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 07:37:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user: Rename user_force_sig tracepoint to match
 function name
Date: Fri, 14 Jan 2022 15:37:31 +0000
Message-Id: <20220114153732.3767229-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114153732.3767229-1-peter.maydell@linaro.org>
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit c599d4d6d6e9bfdb64 in 2016 we renamed the old force_sig()
function to dump_core_and_abort(), but we forgot to rename the
associated tracepoint.  Rename the tracepoint to to match the
function it's called from.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/signal.c     | 2 +-
 linux-user/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index f813b4f18e4..bfbbeab9ad2 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -734,7 +734,7 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
     struct sigaction act;
 
     host_sig = target_to_host_signal(target_sig);
-    trace_user_force_sig(env, target_sig, host_sig);
+    trace_user_dump_core_and_abort(env, target_sig, host_sig);
     gdb_signalled(env, target_sig);
 
     /* dump core if supported by target binary format */
diff --git a/linux-user/trace-events b/linux-user/trace-events
index e7d2f54e940..f33717f248a 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -9,7 +9,7 @@ user_setup_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_setup_rt_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
-user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
+user_dump_core_and_abort(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
 user_handle_signal(void *env, int target_sig) "env=%p signal %d"
 user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
 user_queue_signal(void *env, int target_sig) "env=%p signal %d"
-- 
2.25.1


