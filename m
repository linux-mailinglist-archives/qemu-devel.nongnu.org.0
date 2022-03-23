Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBB54E575C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:23:01 +0100 (CET)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4hI-0002KI-3X
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:23:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4dI-00041q-AQ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:52 -0400
Received: from [2607:f8b0:4864:20::536] (port=34394
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4dG-0004Ya-T4
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:52 -0400
Received: by mail-pg1-x536.google.com with SMTP id i184so1682209pgc.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7g63uMCtTkVNfRXBZkshJ0Wiw4mo6s3K6WysQFVeHQ=;
 b=EMCnSQO4I48BMsxvvg3i3Lpu7MpcHIBM0VPU1LmYCuVl/RlXBQKnI+aX6Rw5+Otp1s
 8IIMhkhQPGFAd7938UkWmV4lBtqZCbG9FdGo8U8RK3KvsKQbLGAa0c0IrtuSOjDJjuSV
 QFauhI8kpDEcO0CLjjNlJcZcwM0mAHerEv/s6+nsiQVem/Cxo3XuGDnC60sV25zy8Fr3
 R6tcgTKLH53w67BvarZnpfob+GRcW9FPC96YnIAXa78jP8pjuvS3DMa/3hObSK9vvZeU
 ObQvhKX5xWReNbdvvifVE7tLNNOUGXQ9hqL23HPdi01BtJXokaAH3+6DQf7r2EYk52H9
 xHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7g63uMCtTkVNfRXBZkshJ0Wiw4mo6s3K6WysQFVeHQ=;
 b=o8I8lDy2yWDgo4r4L6mdCBbB+rmnDZEj+NSgucYOr4vi9g2P/Eir3J/RokmbBU0tMJ
 rt9EKQi6u9BpxawweBPeNkNt4mpkaWt8wcoH9QZLDOAjExXs6Yh/03K1CT0Nx1itvtce
 Ztu70Uqdl3azV1viIJAi8cs+jta6nuU6eIpN4TgDRnj6jvkg5uaSB0cH2CLLMvdDoQJq
 LahJzfksOn50qUH+g2qEArfItuJPiZPxQT+fecnyMk+c78vDprvGLQmcANIiPt1QaZk6
 40P7BIU/O1KOtgSq55CMMOSlH2oLtg/h8KA2qUmhHz58N1Wm6Lvh0jbhSRCMBZ/oDG42
 azsg==
X-Gm-Message-State: AOAM533R83cI2FfeFU+8a2Zdkqk5BYu+rXEQw/AuMLYIbfy483oJXWWD
 Jow4DxkwJKd1xWuAPJN8d5nZlyq9wjU=
X-Google-Smtp-Source: ABdhPJwsqttKPum5jvLljX6MsvisPeyZTYUskQFajfuzSlqwRvUxcgnszNBQqCwAUxI0R7csaGC+rA==
X-Received: by 2002:a05:6a00:1d85:b0:4fa:9dba:f1f2 with SMTP id
 z5-20020a056a001d8500b004fa9dbaf1f2mr956040pfw.31.1648055929515; 
 Wed, 23 Mar 2022 10:18:49 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 y9-20020a056a00180900b004faa45a2230sm455168pfa.210.2022.03.23.10.18.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/13] accel/hvf: Remove pointless assertion
Date: Wed, 23 Mar 2022 18:17:42 +0100
Message-Id: <20220323171751.78612-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
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

Both the comment and the hvf_enabled() check are duplicated
at the beginning of hvf_cpu_thread_fn(), which is the thread
callback created by hvf_start_vcpu_thread(). Remove.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/hvf/hvf-accel-ops.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 54457c76c2..5c33dc602e 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -446,12 +446,6 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    /*
-     * HVF currently does not support TCG, and only runs in
-     * unrestricted-guest mode.
-     */
-    assert(hvf_enabled());
-
     cpu->thread = g_malloc0(sizeof(QemuThread));
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
     qemu_cond_init(cpu->halt_cond);
-- 
2.35.1


