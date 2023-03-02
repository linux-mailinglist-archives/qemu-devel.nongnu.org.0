Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBA6A8254
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:35:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6V-0001wx-Sr; Thu, 02 Mar 2023 07:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5s-0000TO-OE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5r-00031Q-0G
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlDvFz5OPF2Ds6WA6ZEBin2T2RaLHPzmqBS06SNnQo8=;
 b=D20J84RMR5j3662VVMPQ+XTDELWEZqdR3D35E5vHZoG4IQtfA6zPzCXw9u8xmduiYS0Kez
 OduPvOwpnF8y8k2vPyIOv+0vptNhZRkF0tqyuUYcWl4kN2GwjJTszu1xffF2rHQlRrZVWp
 3kd72d/FUO13O5wmRnsBqtXa+LU+xOs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-2Bb79vyRPqmnzRul-OslKQ-1; Thu, 02 Mar 2023 07:31:29 -0500
X-MC-Unique: 2Bb79vyRPqmnzRul-OslKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so1186200wme.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PlDvFz5OPF2Ds6WA6ZEBin2T2RaLHPzmqBS06SNnQo8=;
 b=EYMnkxud8rVbepL6njYAa9XY7BEJszSGIbY+AqTxaThr4l2xqyOjI6Ph2wapJPWqP2
 v7jw5q56zZAqdM09RMVIqTrczqE0i4HiXfEW5tz1jjoSH5YRD0vkYkmP//0KNipFnmV7
 KXCz0PaTlwr6FdOqjZC28kj6QD94zDNssycQdhEaGgyQSyKaRjNXoZzc/aJ4Mohw9XLa
 E782HO8OM+s65Afy4GfxHKzpmPhhXVlKyw9a3F2qZ4BKx+JPyBHTBkb9LynEZl2Y738Z
 nm+FxrmLnGlpvxXrayHG2yh3UpKhNSkxp70Mo3yw2uJqzXwDa/oDz1XZGJaD5XsHiBwn
 JQvA==
X-Gm-Message-State: AO0yUKVhoxYIA9BsMpJA8VMqiTlZboaTpe9LI5rGWdiJMQAlwZUnCm3B
 RF99Qt+Ad0XgIufYR4gLrvYBUjZoWwNLVj5zCBjctwesyWhNCnPU5/wW9uKHGeTEKCglBGfmsPc
 vgI+Q1HDymfgCimKsej8uTrVS8Hb8o80z3kcgypi5JHbOShw3iV8J1i2en9AakLqr1LD+eoV8FN
 A=
X-Received: by 2002:adf:f9d2:0:b0:2c7:1a96:63f2 with SMTP id
 w18-20020adff9d2000000b002c71a9663f2mr7192949wrr.3.1677760287531; 
 Thu, 02 Mar 2023 04:31:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9dMugkRJligVC8BIwl37IB8WY1A2VpBQCDEFJdL3AHoYMAnGGRUMr4PpCLC8i8YS9Mgtc0CQ==
X-Received: by 2002:adf:f9d2:0:b0:2c7:1a96:63f2 with SMTP id
 w18-20020adff9d2000000b002c71a9663f2mr7192941wrr.3.1677760287278; 
 Thu, 02 Mar 2023 04:31:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adff70e000000b002c567881dbcsm15151297wrp.48.2023.03.02.04.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 18/62] i386/xen: implement XENMEM_add_to_physmap_batch
Date: Thu,  2 Mar 2023 13:29:45 +0100
Message-Id: <20230302123029.153265-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-compat.h | 24 +++++++++++++
 target/i386/kvm/xen-emu.c    | 69 ++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/target/i386/kvm/xen-compat.h b/target/i386/kvm/xen-compat.h
index 2d852e2a28b8..448336de9236 100644
--- a/target/i386/kvm/xen-compat.h
+++ b/target/i386/kvm/xen-compat.h
@@ -15,6 +15,20 @@
 
 typedef uint32_t compat_pfn_t;
 typedef uint32_t compat_ulong_t;
+typedef uint32_t compat_ptr_t;
+
+#define __DEFINE_COMPAT_HANDLE(name, type)      \
+    typedef struct {                            \
+        compat_ptr_t c;                         \
+        type *_[0] __attribute__((packed));   \
+    } __compat_handle_ ## name;                 \
+
+#define DEFINE_COMPAT_HANDLE(name) __DEFINE_COMPAT_HANDLE(name, name)
+#define COMPAT_HANDLE(name) __compat_handle_ ## name
+
+DEFINE_COMPAT_HANDLE(compat_pfn_t);
+DEFINE_COMPAT_HANDLE(compat_ulong_t);
+DEFINE_COMPAT_HANDLE(int);
 
 struct compat_xen_add_to_physmap {
     domid_t domid;
@@ -24,4 +38,14 @@ struct compat_xen_add_to_physmap {
     compat_pfn_t gpfn;
 };
 
+struct compat_xen_add_to_physmap_batch {
+    domid_t domid;
+    uint16_t space;
+    uint16_t size;
+    uint16_t extra;
+    COMPAT_HANDLE(compat_ulong_t) idxs;
+    COMPAT_HANDLE(compat_pfn_t) gpfns;
+    COMPAT_HANDLE(int) errs;
+};
+
 #endif /* QEMU_I386_XEN_COMPAT_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 5d7982712842..2b235e7b2714 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -262,6 +262,71 @@ static int do_add_to_physmap(struct kvm_xen_exit *exit, X86CPU *cpu,
     return add_to_physmap_one(xatp.space, xatp.idx, xatp.gpfn);
 }
 
+static int do_add_to_physmap_batch(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                   uint64_t arg)
+{
+    struct xen_add_to_physmap_batch xatpb;
+    unsigned long idxs_gva, gpfns_gva, errs_gva;
+    CPUState *cs = CPU(cpu);
+    size_t op_sz;
+
+    if (hypercall_compat32(exit->u.hcall.longmode)) {
+        struct compat_xen_add_to_physmap_batch xatpb32;
+
+        qemu_build_assert(sizeof(struct compat_xen_add_to_physmap_batch) == 20);
+        if (kvm_copy_from_gva(cs, arg, &xatpb32, sizeof(xatpb32))) {
+            return -EFAULT;
+        }
+        xatpb.domid = xatpb32.domid;
+        xatpb.space = xatpb32.space;
+        xatpb.size = xatpb32.size;
+
+        idxs_gva = xatpb32.idxs.c;
+        gpfns_gva = xatpb32.gpfns.c;
+        errs_gva = xatpb32.errs.c;
+        op_sz = sizeof(uint32_t);
+    } else {
+        if (kvm_copy_from_gva(cs, arg, &xatpb, sizeof(xatpb))) {
+            return -EFAULT;
+        }
+        op_sz = sizeof(unsigned long);
+        idxs_gva = (unsigned long)xatpb.idxs.p;
+        gpfns_gva = (unsigned long)xatpb.gpfns.p;
+        errs_gva = (unsigned long)xatpb.errs.p;
+    }
+
+    if (xatpb.domid != DOMID_SELF && xatpb.domid != xen_domid) {
+        return -ESRCH;
+    }
+
+    /* Explicitly invalid for the batch op. Not that we implement it anyway. */
+    if (xatpb.space == XENMAPSPACE_gmfn_range) {
+        return -EINVAL;
+    }
+
+    while (xatpb.size--) {
+        unsigned long idx = 0;
+        unsigned long gpfn = 0;
+        int err;
+
+        /* For 32-bit compat this only copies the low 32 bits of each */
+        if (kvm_copy_from_gva(cs, idxs_gva, &idx, op_sz) ||
+            kvm_copy_from_gva(cs, gpfns_gva, &gpfn, op_sz)) {
+            return -EFAULT;
+        }
+        idxs_gva += op_sz;
+        gpfns_gva += op_sz;
+
+        err = add_to_physmap_one(xatpb.space, idx, gpfn);
+
+        if (kvm_copy_to_gva(cs, errs_gva, &err, sizeof(err))) {
+            return -EFAULT;
+        }
+        errs_gva += sizeof(err);
+    }
+    return 0;
+}
+
 static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                    int cmd, uint64_t arg)
 {
@@ -272,6 +337,10 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = do_add_to_physmap(exit, cpu, arg);
         break;
 
+    case XENMEM_add_to_physmap_batch:
+        err = do_add_to_physmap_batch(exit, cpu, arg);
+        break;
+
     default:
         return false;
     }
-- 
2.39.1


