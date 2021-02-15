Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B731BA67
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:34:59 +0100 (CET)
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe1i-0004Ah-Ov
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk2-0005he-Gf
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:42 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:42440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk1-0005ZZ-41
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:42 -0500
Received: by mail-ed1-x52c.google.com with SMTP id z22so7923562edb.9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EbeBCGKw5ea/26l+m+1IcrhSCzVy72F8eml9RSOy7Wk=;
 b=TN+riZx61G3lJzbmHwKJ4pDEod4kH42KkBRxgZKSigzS76nUGJq+whyaW+eTteWcxT
 9ouuC69FmBdWiPFArH8wZEddsq2GRWfDg+wbukSIGmqcmIxHH0o4id0G2So6tO4Bdi+x
 0s0sf/kx+siyynr9K99ax5DFExsU/G4nUbxf+nYE8CHLtIc3HHzErOJwVIMihcnCQ3GP
 FVfkWE9Hiu3T7dAYqbvAtIIA5XYGlwAeS9UA+r3qRugJlPb/6c6KZeJ5PimNGGcqd1lL
 /VlsG7i2h5oNthDamJd2cY77A+tIf9lff3u8gkcwWIbx4mg8qpTKLLBGY7RVmDxxm+nD
 WnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EbeBCGKw5ea/26l+m+1IcrhSCzVy72F8eml9RSOy7Wk=;
 b=eeCtBFVOhdpfw+cEbvlwvdqQyPdT9M0Y58smz9tfWdtHB4Jxv40OnQbaWXxDBHNAQX
 Jw8nO46E5K4H1ef0eq+V+tmt2Q6f6oNKoRlIKor8yJv14wizan+0wuBJshKNLLkKRDML
 BdbkFTYZosXJ+5ON7wPewFLeHIbknqKb+f0hiPj3S8F6qW2YHpafBDeMqsZ38EqvRtxi
 DJKvBNWj/WHs9IaiQJ3qE9Np1U0qQrK5+XRYc/d6rh5yO/OCQmhOxnBAajofS5gPXFWO
 FQUrYB1t+ZmmleUcAbZjrrN028N253JpIxHm7HmO5hNH5hb9C4ktc2NES52BQLFl2jVP
 pmBw==
X-Gm-Message-State: AOAM531Gbd4uUs2IIddPQUBRJaHDwYmqP/8RTU1bBEoZhvazD/vI6txy
 UjdNAF+fvdFZ+xSs31moN90iqXqsPJs=
X-Google-Smtp-Source: ABdhPJw8I5tgQUh3puVR3495SyzbJGUDl6jC0A/l2B0w+a9THV/AwFqHOIIge2hIelMc+P0rGuU7Gg==
X-Received: by 2002:aa7:d6c9:: with SMTP id x9mr1403639edr.150.1613394999844; 
 Mon, 15 Feb 2021 05:16:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/19] hvf: x86: Remove unused definitions
Date: Mon, 15 Feb 2021 14:16:24 +0100
Message-Id: <20210215131626.65640-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The hvf i386 has a few struct and cpp definitions that are never
used. Remove them.

Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-Id: <20210120224444.71840-3-agraf@csgraf.de>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/hvf-i386.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 50b914fd67..59cfca8875 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -21,21 +21,6 @@
 #include "cpu.h"
 #include "x86.h"
 
-#define HVF_MAX_VCPU 0x10
-
-extern struct hvf_state hvf_global;
-
-struct hvf_vm {
-    int id;
-    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
-};
-
-struct hvf_state {
-    uint32_t version;
-    struct hvf_vm *vm;
-    uint64_t mem_quota;
-};
-
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)
 
@@ -75,7 +60,6 @@ hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 
 /* Host specific functions */
 int hvf_inject_interrupt(CPUArchState *env, int vector);
-int hvf_vcpu_run(struct hvf_vcpu_state *vcpu);
 #endif
 
 #endif
-- 
2.29.2



