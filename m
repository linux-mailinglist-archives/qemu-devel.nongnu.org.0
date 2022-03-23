Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2487F4E577C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:29:09 +0100 (CET)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4nE-0005SA-6i
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:29:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4ep-0007Pi-Uc
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:28 -0400
Received: from [2607:f8b0:4864:20::1035] (port=53035
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4eo-0005LC-DI
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id v4so2382485pjh.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ed6iY8pMEzMkAOvdT6TEMCudwvjmYJcGMMpCaTIv/yU=;
 b=RyKgoe5HgJCJpFJvPNUJVGX9nExg70mZzCcSsKHkmRw2HUwXJBO+ViJY8Cg1JFjM2H
 G0OgG2uMd3kfN/cqwIfkckDdV0ro4mD03PEFsBMGgIFVHwNisdMFtViW7UEW0QokyJ18
 /1sVuSemm0/QC9FQEH4gtz9xLl3QWzTjGmS6U6thAkmdoZhRJ3tRO1ZYnvykNZfNtAY7
 hsT8RrSJ2JYd++oXi25BCbjpyRPtyPQS4TfqKZj1OE2g3DX3iSvXB/fb6naDgvDbxoVg
 v/pUtMjxZ1idxkWkbRDhcEj5lEdEAR20mwKPOE/HmsGKZUkhhIAWrUbX6M9OiZDfFKNS
 ulEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ed6iY8pMEzMkAOvdT6TEMCudwvjmYJcGMMpCaTIv/yU=;
 b=eCso+Glf8Wzw/I+a5qZx806bfhPRU0EX5F4SFRCgPl7vMEJNEFIkyCtG0ZmOQ3bNUE
 boGxu/DsScuXSeiXo1o4b6DKfp8BLjCOxZv8njkUI/oG2obKufe4KOnk2ok/kwrRRSzl
 7e/bh4IqGusDqPwx2Lj/z4L7gcxnuAqRE8orpbUQJAeFUOOQC57HBJoExuU1XvZnc6nA
 MeyDITx4oshec+swsqVF0UmjwyXB4weqdXabNtRyOWSr29xlHX5f+/KyyEdAlXt1s0gB
 FHck8dgiBLed8A1VyEhz3F5YVEa6wtjXCXYxHJQpAClgdW5EAhHHJjkxEOuSSNxPvsEi
 9PQw==
X-Gm-Message-State: AOAM532WXerizLB/+bmbAW/iwJukHKPvqeuY4VA4O58TO6xjcOKqaYuT
 RZAclwhDuw6isECpmP5NO6Apy6Gpp50=
X-Google-Smtp-Source: ABdhPJwqx6x4zfaaNXs3hip1MrGQWDzMJ1aziOlNPCMVNNhEzttDkRqQAwuDm1jVkFyWnxpwXzRJYA==
X-Received: by 2002:a17:903:2406:b0:14d:6447:990c with SMTP id
 e6-20020a170903240600b0014d6447990cmr1048970plo.22.1648056024958; 
 Wed, 23 Mar 2022 10:20:24 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 o24-20020a17090a5b1800b001c6aaafa5fbsm282644pji.24.2022.03.23.10.20.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/13] softmmu/cpus: Free cpu->thread in
 generic_destroy_vcpu_thread()
Date: Wed, 23 Mar 2022 18:17:50 +0100
Message-Id: <20220323171751.78612-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
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

From: Mark Kanda <mark.kanda@oracle.com>

Free cpu->thread in a new AccelOpsClass::destroy_vcpu_thread() handler
generic_destroy_vcpu_thread().

vCPU hotunplug related leak reported by Valgrind:

  ==102631== 8 bytes in 1 blocks are definitely lost in loss record 1,037 of 8,555
  ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
  ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
  ==102631==    by 0x92443A: kvm_start_vcpu_thread (kvm-accel-ops.c:68)
  ==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
  ==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
  ==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
  ==102631==    by 0x93E329: property_set_bool (object.c:2273)
  ==102631==    by 0x93C2F8: object_property_set (object.c:1408)
  ==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
  ==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
  ==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
  ==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Message-Id: <20220321141409.3112932-3-mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 37325b3b8d..efa8397f04 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -619,6 +619,7 @@ static void common_vcpu_thread_create(CPUState *cpu)
 
 static void common_vcpu_thread_destroy(CPUState *cpu)
 {
+    g_free(cpu->thread);
 }
 
 void cpu_remove_sync(CPUState *cpu)
-- 
2.35.1


