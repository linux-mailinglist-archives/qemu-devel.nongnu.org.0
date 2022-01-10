Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4E489A0A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:35:58 +0100 (CET)
Received: from localhost ([::1]:55034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uq5-0002AA-Dz
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRK-0008M3-MM
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:23 -0500
Received: from [2a00:1450:4864:20::332] (port=54219
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRI-0008N8-3c
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id l4so8700606wmq.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F9FAq6nwbgCvDM7C2Sg9iiaLq9FrL+HtewEtG7ypUf8=;
 b=NTT7NtWWNk6WEO4Z/1SLkxfP3QwsnhbkxSqrOJEY0Zm8Qep1/RbIG0Et2SRYmIQLJO
 PodF702S+K3soNxt3xEjqjRimb6o3k88huBYE3Wh1LMKiWfVEcAZWuqf5Qj9OdWqZ3Km
 Y/MvfmxbTFIeocC+XMiaPSEj4SuzGyfVBqTHiT+iKUOQSqH06kKMrQ1XLc3TzHX3cRuV
 UrP5CQ8Xupv4UCIDEolakrzIYVf5AX5HjwJ37FHv+yIcERT0ZsYF1nelHhv7/rVLt/Qd
 pWNskPL+h0hppOcU4W3blhFjNdy9AKlDqniaUYmpnKc0AQPYJ05vmB4xcIksx2am6lY8
 rI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F9FAq6nwbgCvDM7C2Sg9iiaLq9FrL+HtewEtG7ypUf8=;
 b=pOrXZll1w18QMRYjoRpHArYRdpHtumpTBp+cSFFGv8f92nQN9laNf+DkIrHGqlK1o/
 uL7IvffHRBnfrHP70yxsQIr5h3QiQ3CB7uDr/aYGCahPpq2awhYwEZXadpQTQ/0e3jpc
 5x3FazT1sOtkJQhuyfnrZXT+58fw8OUwmPDuX/9Z59RTWH0iy+y9tQBLg2I3aPECeQWB
 umCbJgNOSOj5WntpoBL+WpGk74XjkCiwA/+OfuMV3Y4NFJBQIpb1p2HEWmsyPPBJxwBi
 9IqPwoAy3x7pFYXbdRPcGK/vunXXJ6qJRJaWEG6o3XztroZ6AbcE8EIUUQQnLEJUx+s9
 S7PQ==
X-Gm-Message-State: AOAM531s1WJVseGppVhvdJS+5um05vG/Ay/y0uqdtcxO/92Hh6HhZfyv
 7u7BYy5t4FU79NhlA0tOBs/dcMs8xaUPmg==
X-Google-Smtp-Source: ABdhPJwHuyLQVs9qiq6enIw0W0jOkkg9tJ7+g1zrzFjcIOV7/d/RzIrKP7wd8eTqQJesBV+ruk6U4Q==
X-Received: by 2002:a1c:a94e:: with SMTP id s75mr11294806wme.34.1641820218633; 
 Mon, 10 Jan 2022 05:10:18 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id n9sm7196491wmq.37.2022.01.10.05.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 3/7] hvf: Make hvf_get_segments() / hvf_put_segments()
 local
Date: Mon, 10 Jan 2022 14:09:57 +0100
Message-Id: <20220110131001.614319-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both hvf_get_segments/hvf_put_segments() functions are only
used within x86hvf.c: do not declare them as public API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86hvf.h | 2 --
 target/i386/hvf/x86hvf.c | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index 99ed8d608dd..db6003d6bda 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -26,11 +26,9 @@ void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
 void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
 void hvf_put_xsave(CPUState *cpu_state);
-void hvf_put_segments(CPUState *cpu_state);
 void hvf_put_msrs(CPUState *cpu_state);
 void hvf_get_xsave(CPUState *cpu_state);
 void hvf_get_msrs(CPUState *cpu_state);
 void vmx_clear_int_window_exiting(CPUState *cpu);
-void hvf_get_segments(CPUState *cpu_state);
 void vmx_update_tpr(CPUState *cpu);
 #endif
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 05ec1bddc4e..907f09f1b43 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -83,7 +83,7 @@ void hvf_put_xsave(CPUState *cpu_state)
     }
 }
 
-void hvf_put_segments(CPUState *cpu_state)
+static void hvf_put_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
     struct vmx_segment seg;
@@ -166,7 +166,7 @@ void hvf_get_xsave(CPUState *cpu_state)
     x86_cpu_xrstor_all_areas(X86_CPU(cpu_state), xsave, xsave_len);
 }
 
-void hvf_get_segments(CPUState *cpu_state)
+static void hvf_get_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
 
-- 
2.33.1


