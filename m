Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010D4CD6B5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:47:03 +0100 (CET)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9Cw-0007yI-In
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:47:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Ch-00066X-Vu
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8Cf-0001KY-O6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYeaIUsJ9p0JJMezYpclW6q507JeS1XFz2MM26g4c9M=;
 b=ZHEiqzgQY0FHJ9d/8xVXJReckS40nssz1jFI+Bt7K9kn1UqOIhBd60TMU7K1lgk9To+JJE
 h3wQcM15+4bDVhxW7dLlvT+LLNvlRPXwuu9xRuulZjMjL7pwIQzEGyuaXSgpAL98FiqD21
 L/LmY+u3pLHdllgTFnvQj8vWOtZ0jUI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-UolcBa-KPTOGNk5X0bwjSw-1; Fri, 04 Mar 2022 08:42:40 -0500
X-MC-Unique: UolcBa-KPTOGNk5X0bwjSw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so3369712wrp.10
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pYeaIUsJ9p0JJMezYpclW6q507JeS1XFz2MM26g4c9M=;
 b=zpY9D6LAoRgwPSH7eGg5uFhiCerVUn5+YaiVWyU8IJwItbcU7+riZvIapgvY6NszwB
 Ug4E63WU+PRCX0W0c7Gw2lCY55TUcgyKnaXEa47hqSDGYiFqCtrZ9Wq2FSLwmKR+X6kM
 VkefgvGU2DYXl9XJLQFsDO/jl+DiMxjsK5m0uQeCBqaKqfLnCP+vYodSCzanyMidgRrP
 vmkjLu0OM8QugQEEOKznH6nqA9BkRf4ttGqmYijrE6pobPIqnevd4ruRxY6ntEJGUf18
 VC8YT0XR1HVK7ByYzCopZsXbrZSh0vF5bywmYZT41gq8i8IoJZReu5NkDlV0CBoJO+y/
 cHQg==
X-Gm-Message-State: AOAM533A+IqboeqtGRX/jzCBBJJYwlaMSF11GEAjo9jN0OVaBMygFZQp
 b5FK2f/WGyGh+Ln9GECMTILWSsiiRdktqg/PmSKLJy/USirWnGNIU4ySuLuQ1HAINLllt6vqfY1
 ZfyLe6ZbU5+hTaShhFQGrit4vEQgRbP4lyXdo1tkHhaL9oZXvqevt1qM7QzTK
X-Received: by 2002:a5d:638b:0:b0:1ef:e601:e7c9 with SMTP id
 p11-20020a5d638b000000b001efe601e7c9mr16543082wru.439.1646401358577; 
 Fri, 04 Mar 2022 05:42:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGY6K1j2J200z7b7bnGBCyWa5C4CwwgWOxUNlrEp9fcWFmy8MqGRIfUXKpDa9sgYhQUqxXAg==
X-Received: by 2002:a5d:638b:0:b0:1ef:e601:e7c9 with SMTP id
 p11-20020a5d638b000000b001efe601e7c9mr16543065wru.439.1646401358342; 
 Fri, 04 Mar 2022 05:42:38 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5006000000b001e75916a7c2sm4618234wrt.84.2022.03.04.05.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:34 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/45] x86: cleanup unused compat_apic_id_mode
Message-ID: <20220304133556.233983-42-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

commit
  f862ddbb1a4 (hw/i386: Remove the deprecated pc-1.x machine types)
removed the last user of broken APIC ID compat knob,
but compat_apic_id_mode itself was forgotten.
Clean it up and simplify x86_cpu_apic_id_from_index()

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220228131634.3389805-1-imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/x86.h |  2 --
 hw/i386/x86.c         | 16 +---------------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index a145a30370..916cc325ee 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -35,8 +35,6 @@ struct X86MachineClass {
 
     /* TSC rate migration: */
     bool save_tsc_khz;
-    /* Enables contiguous-apic-ID mode */
-    bool compat_apic_id_mode;
     /* use DMA capable linuxboot option rom */
     bool fwcfg_dma_enabled;
 };
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b84840a1bb..4cf107baea 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -83,24 +83,11 @@ inline void init_topo_info(X86CPUTopoInfo *topo_info,
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
                                     unsigned int cpu_index)
 {
-    X86MachineClass *x86mc = X86_MACHINE_GET_CLASS(x86ms);
     X86CPUTopoInfo topo_info;
-    uint32_t correct_id;
-    static bool warned;
 
     init_topo_info(&topo_info, x86ms);
 
-    correct_id = x86_apicid_from_cpu_idx(&topo_info, cpu_index);
-    if (x86mc->compat_apic_id_mode) {
-        if (cpu_index != correct_id && !warned && !qtest_enabled()) {
-            error_report("APIC IDs set in compatibility mode, "
-                         "CPU topology won't match the configuration");
-            warned = true;
-        }
-        return cpu_index;
-    } else {
-        return correct_id;
-    }
+    return x86_apicid_from_cpu_idx(&topo_info, cpu_index);
 }
 
 
@@ -1330,7 +1317,6 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = x86_cpu_index_to_props;
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
-    x86mc->compat_apic_id_mode = false;
     x86mc->save_tsc_khz = true;
     x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
-- 
MST


