Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C64E578C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:33:51 +0100 (CET)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4rm-0005Gz-CV
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:33:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4f4-0007UE-29
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:42 -0400
Received: from [2607:f8b0:4864:20::431] (port=36788
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4f2-0005aE-1E
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:41 -0400
Received: by mail-pf1-x431.google.com with SMTP id z16so1991646pfh.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32I90XyrSsgFhoTvAz7kFHmgBFJVrEU2lmj8L6zrA7w=;
 b=HziQehOw9rA6WaAjt6GWtN96OEZQKNeqtt8BUYKzQhy7osdWurjWlBG20QGQW/EB+F
 jeu4GS9/mQNcxaXFiYXQHD+Newqzq1veJVbG2jRb7R8WXmdqG/gVdrZDjIlDxW4lRXOq
 I71naYjPm4YaQCCMtZQaseOvo60Lz/IkNWzSHUBWsfnNXC2oOABAKojB2mfg+D9g7D1D
 aCifnKvwu9gBP/efpCWO8b9KL2IWYDxFdNbknFbXsjBT6YGAcCikhEVWZMzFhjo4Dyoi
 m5OUOkfn3o+MT9iQ4opD1tk8fsbzJgw5Qcb9c/JxYjHFhN6Q4eH03QkTyrPcQEV21Vlq
 Vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32I90XyrSsgFhoTvAz7kFHmgBFJVrEU2lmj8L6zrA7w=;
 b=y4PkJc+VdN5aZVYHKiU0b8BrE9DZvACuLPAARHUPltd27UvJMVEYXAk4iu7cHki/rA
 xAuT6BP9+gfyh9UfNW7uMrsWAyzdM011bfvbHZ//EgRf3RG/XdbsDVq8KSlVSAUE+8+1
 kBEKiOleLkK7JKgqmMV2I7VD5Xqad36pbpV9+vbFBf30iHjmG9tZ5O8BPlIw2GxASyHr
 v5XrwQyrqEGxiXHVo0LXZZT15HsEN22cVUqBvOidgj7h56kJTsjlvjxvIKrooOXgCD2K
 O+Es2jimhUTuPTRM69K1I4tA5Utq56G2/1X61dzcvsoWpnsyXpyUgsnOMvlIYrzk1UPU
 hFZg==
X-Gm-Message-State: AOAM533mEOB5kFveleq8aciYuDgN9/5X3R/1xYbmvJGQUQeHE7tdCxAJ
 30JHf7bYqdbsUWfqLuFVeAW4OwSiwzo=
X-Google-Smtp-Source: ABdhPJzitqpHPUzN1FOlO6Xy6wxyKTy6324HAUZa9Y29UTDRmfk9C7LuqvIVu5doI3n8WNcv+vf6iw==
X-Received: by 2002:a63:1e52:0:b0:380:ae84:256e with SMTP id
 p18-20020a631e52000000b00380ae84256emr758991pgm.84.1648056037806; 
 Wed, 23 Mar 2022 10:20:37 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm5775028pjl.3.2022.03.23.10.20.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/13] softmmu/cpus: Free cpu->halt_cond in
 generic_destroy_vcpu_thread()
Date: Wed, 23 Mar 2022 18:17:51 +0100
Message-Id: <20220323171751.78612-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
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

vCPU hotunplug related leak reported by Valgrind:

  ==102631== 56 bytes in 1 blocks are definitely lost in loss record 5,089 of 8,555
  ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
  ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
  ==102631==    by 0x924452: kvm_start_vcpu_thread (kvm-accel-ops.c:69)
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
Message-Id: <20220321141409.3112932-4-mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index efa8397f04..23bed29545 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -620,6 +620,7 @@ static void common_vcpu_thread_create(CPUState *cpu)
 static void common_vcpu_thread_destroy(CPUState *cpu)
 {
     g_free(cpu->thread);
+    g_free(cpu->halt_cond);
 }
 
 void cpu_remove_sync(CPUState *cpu)
-- 
2.35.1


