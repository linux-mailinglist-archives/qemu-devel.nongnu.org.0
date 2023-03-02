Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7D76A82EA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:57:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5d-00084q-Lv; Thu, 02 Mar 2023 07:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5b-0007yr-LA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5a-0002xf-83
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2V8yBCF0T4rv186tkKjyMb8e50BMBvmVMlFILdIz+H0=;
 b=BCSTLBPOe8cMyOY+2+ilB2fRs8UuWbVW6WCIPm+AWmyhQQsKKGz7t4UnVWcbvFvADvtJFl
 nMh8/UMhVJ6UFB3LLBiJ69GJlANwctrjRQartNBGsv1lE3Nan3EObvL8HDFLtqp61/0fea
 eR8O0Nk6DVEHBbWqdw1Rubp6IfYAPns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-gJ-f6NxUObucwKXwlw5NGQ-1; Thu, 02 Mar 2023 07:31:11 -0500
X-MC-Unique: gJ-f6NxUObucwKXwlw5NGQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so5696963wms.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2V8yBCF0T4rv186tkKjyMb8e50BMBvmVMlFILdIz+H0=;
 b=dCrS6Aob6pjskgQUB3pqx1dgCwkyXNiWt55w0cUm2o8t0sfK70Y8O2te0RRjJZ3mTn
 pPSglzCUDhWS9m2o2vMKgOqk52tBsqglLRSKa074AwL6Al5Dfy24RFzKLtlyU7SHMaCA
 b/KST2639EE8Of0M2l/XbUd9lFlBE7BEIO/C2zyB/dRbcAdZ2h3/WfhUf8VADDIK19XJ
 1DJ4y45xQI6p5dCrYw8IppKPqP6doVhkuimOi4qkKg7OhzgWrR2b7SrrJNOB9R+QFi/r
 vDOml3E4szNexWlldTpMNEEUkFcQMbh5+81hkzu5Mt89rw4yvcV8uGMrG6xTBtm36+B0
 CNiA==
X-Gm-Message-State: AO0yUKVRdg327FBAOdzB52W/sJzpwMW1Fdl9dNDPeHk2L4FIYoVIizBA
 //Yu5BGpYYtHLMm0F8dSQJMykzKA7gbN8A0j40umdsFDKggpBlzXY6y+xbGtVHSZTu6j/w+Wq29
 1YIFODaEqHF5dlPhcONQUD2qfNwF+wCdXzvkvOimdZ5RtmWYixM7GGaOj2bFhJ2eG4lNn6YJqeg
 w=
X-Received: by 2002:a05:600c:5389:b0:3e2:dba:7155 with SMTP id
 hg9-20020a05600c538900b003e20dba7155mr7497627wmb.20.1677760270386; 
 Thu, 02 Mar 2023 04:31:10 -0800 (PST)
X-Google-Smtp-Source: AK7set++oaMcEDCaeHmK6MLEhwnmvYtirJGv5VtHS/X9NW79EMMehcEhYgy9ZK7DxCbNOSpDpPxR/w==
X-Received: by 2002:a05:600c:5389:b0:3e2:dba:7155 with SMTP id
 hg9-20020a05600c538900b003e20dba7155mr7497607wmb.20.1677760270029; 
 Thu, 02 Mar 2023 04:31:10 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600c46cb00b003dc1d668866sm3139050wmo.10.2023.03.02.04.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 12/62] i386/xen: Implement SCHEDOP_poll and SCHEDOP_yield
Date: Thu,  2 Mar 2023 13:29:39 +0100
Message-Id: <20230302123029.153265-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

They both do the same thing and just call sched_yield. This is enough to
stop the Linux guest panicking when running on a host kernel which doesn't
intercept SCHEDOP_poll and lets it reach userspace.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 4ed833656f72..ebea27caf634 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -234,6 +234,19 @@ static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         err = schedop_shutdown(cs, arg);
         break;
 
+    case SCHEDOP_poll:
+        /*
+         * Linux will panic if this doesn't work. Just yield; it's not
+         * worth overthinking it because with event channel handling
+         * in KVM, the kernel will intercept this and it will never
+         * reach QEMU anyway. The semantics of the hypercall explicltly
+         * permit spurious wakeups.
+         */
+    case SCHEDOP_yield:
+        sched_yield();
+        err = 0;
+        break;
+
     default:
         return false;
     }
-- 
2.39.1


