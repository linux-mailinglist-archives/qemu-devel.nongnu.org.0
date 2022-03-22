Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330654E467E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:09:22 +0100 (CET)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjsf-0004b5-0W
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:09:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWjrH-0003EA-98
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:07:55 -0400
Received: from [2607:f8b0:4864:20::533] (port=43967
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWjrF-0001Mo-GI
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 15:07:54 -0400
Received: by mail-pg1-x533.google.com with SMTP id c2so13283920pga.10
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDnsp64dy23km8dL17HIpLYraoqdROmh6JM8WZ9QnxQ=;
 b=L4jnThfAX6weorw+rTlovTZzOlJLVdJXPWMdd3Os2Fui5Gdriw/AU2CtdIsPGfYdO9
 Bg5uqOH2mVDdVb/hJ2QHF2RSitPHirOUBg7CRM3YjvQCxh3R4LkUVEDe9Sqdb1/uSpzV
 DlY3v/IhkdivpRBGHKxHldSV0WFV8cHuHgcigVbiSkZcwtYqGnvdB0hhczC+bJGD5oXK
 8P6S/eXWSqTDwMoMk8nN3rKO73nSQ1FRukri9Rt13MjJFNcZDMt5PmVoxvjiwcSe3iGT
 lyqtp8YyXh3o+z/8R6woWP0gAKPml4/fieyC+fTHXW0MEKIypdCwxKXlYJss1tO3dzba
 7aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bDnsp64dy23km8dL17HIpLYraoqdROmh6JM8WZ9QnxQ=;
 b=Jo9+UM+gQGM5enY8B3hURM/hRX80bvYw4MNCOe+SXwK2lAqjI9ixVnxiqE3vO/uE3Y
 PkQKb37xEvObJY4UBl3Q/tkF3HvGJNTImRO+VMf41n+yJLnGWA7qqqQPrfRLbqRjx2f/
 46SQ5MSpYAgb58y0d8X3u2TTmA8R4y679CwPSxTwBXZ036zXmTSDbGbL2PCj/KRuwO94
 nWte6dCi1Tk5PcQ6nqdO6UH4NCDy/Yzej7UfvQLsLAyLhZOvZFd8RxMF6gGBUzLEyLJ+
 FT4A0nqhkpIoTgepIU578leU+IUmrVLcx6/CTbWezLJKfkmodUhSaJ5qqiT/e2fW5QK9
 UJRg==
X-Gm-Message-State: AOAM532IWJ3RBck+k2hHg4GOBYwtEmah/kLhd7hmKO0tFHngRF8p9KxD
 wKL2tTVLQ9E1KUagStVbrpQcYV4z62I=
X-Google-Smtp-Source: ABdhPJw+VIm8AGR2iezhWtd3f3hdyMkowLMXgSIkRs3pOvfAUuxeRAHxVjOZVNMv1sfbsIQrts7cbA==
X-Received: by 2002:a65:53cc:0:b0:382:8506:f1a6 with SMTP id
 z12-20020a6553cc000000b003828506f1a6mr8642804pgr.44.1647976071990; 
 Tue, 22 Mar 2022 12:07:51 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056a00162a00b004f6fc39c081sm21921009pfc.211.2022.03.22.12.07.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Mar 2022 12:07:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0] target/i386/hvf: Free ressources when vCPU is
 destroyed
Date: Tue, 22 Mar 2022 20:07:45 +0100
Message-Id: <20220322190745.37727-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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


