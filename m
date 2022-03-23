Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716104E576B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:26:22 +0100 (CET)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4kX-0000T1-Gk
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:26:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4d6-0003JO-KS
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:40 -0400
Received: from [2607:f8b0:4864:20::102a] (port=45737
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4d5-0004Wp-6e
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 e6-20020a17090a77c600b001c795ee41e9so1906220pjs.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bDnsp64dy23km8dL17HIpLYraoqdROmh6JM8WZ9QnxQ=;
 b=TgUmKBfMFNwRucBsohiY5JY8e9ioh62vGGPA59RsGbh//g7DqYEp6Ab52+czdRAyY8
 NP7JPeqO100BsBFOc/Ay4dhLNWNwRFNW03vJZd3riU8UJJWvYnCfPYB4pocDoGekJKUT
 EzAgZEJWkWoFt7AzL3aW+DcXjjEkdSBB2D7fwnNkzE01zFwCOgVJ7C0f1jNlgcaaL4GN
 MhaEpPpi7sWKWo2nMSg2I6MHW3HNXf4tqK4IqiAVB37OJeIwt+hp+9OnIiguj3TblBIw
 fUkPOD4SvMNhJbqs6CnecPk4971sAW1ktFQ1pBjZQ9c/VJNicw0UzYoWQqC6arJevJXa
 g6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bDnsp64dy23km8dL17HIpLYraoqdROmh6JM8WZ9QnxQ=;
 b=FD+h+kFeUIhTONhNMaf0Y0Y2kxYL0lpkw2Q5I6WoqA4/ubUu+CgrUdn0thB29Q4TR9
 W9upO1OJuemL+QZ39DHp0a9QcApDwbEBECpiGQ7PMwdDpIJ9hCPOkZM91Zh8/vJitFsa
 3+haCc2I5ZG8ZgHRTfWPU6WSwD28h9cRspUmBwwlMNdqlCXxNlra9ZslgQKj53QR31Zr
 YYOz8NsXkYNaKq8IJmtrws0tGvAFFIgHwgYmQoe5UQwI5ESKkperv7Q7wkjf+4Yhgw+j
 SPFJb3GNVVSspGJTlIgVEqlw3Fs7IIjEvikLWlVa5SCDtkCuxzOs58OPy+GVY9uTS2V4
 bQ+Q==
X-Gm-Message-State: AOAM531l1BlJXk+jyGFZUViFqGWExly14U6YbiDXqrwsl68MIkgsaHno
 XbKRfiVVI7PG7rmoOZl+kvQOkZw014I=
X-Google-Smtp-Source: ABdhPJySoRv6SjqjiKCV5e8zH/IZey9o/1x0EduXwu4cNLj3RBjr1JlgyWZQVPeGljHAEFYooB4q3Q==
X-Received: by 2002:a17:90a:19d2:b0:1be:d815:477f with SMTP id
 18-20020a17090a19d200b001bed815477fmr804349pjj.23.1648055917873; 
 Wed, 23 Mar 2022 10:18:37 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm342070pga.36.2022.03.23.10.18.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/13] target/i386/hvf: Free resources when vCPU is
 destroyed
Date: Wed, 23 Mar 2022 18:17:41 +0100
Message-Id: <20220323171751.78612-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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
 Igor Mammedov <imammedo@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Both xsave_buf and hvf_caps are allocated in hvf_arch_init_vcpu(),
free them in hvf_arch_vcpu_destroy().

Reported-by: Mark Kanda <mark.kanda@oracle.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/hvf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index fc12c02fb2..39fa4641b9 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -163,7 +163,9 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
 
+    g_free(env->xsave_buf);
     g_free(env->hvf_mmio_buf);
+    g_free(hvf_state->hvf_caps);
 }
 
 static void init_tsc_freq(CPUX86State *env)
-- 
2.35.1


