Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FFD4D0BAA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:06:11 +0100 (CET)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMQc-0005gn-Jm
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:06:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7g-00008G-7V
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7e-0005jp-MJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYeaIUsJ9p0JJMezYpclW6q507JeS1XFz2MM26g4c9M=;
 b=ZtDgshpc4Ywz6cKzb77CvwFAyUsthBbeQ9ch7yQb5RDL16QmbA5NQ3Jmg6EPhJogg2Be1e
 QwxZlHH6jKtHv5lTVahfFwIENYQDvKWHcQX2G4VrjDpv/VxqQvXlM0kBCL95bYamW1OZGK
 nsY5HeLr0eDSpi+OPNv09YNM2mXRMqk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-To6gvK28O823yz4tk2Vd1A-1; Mon, 07 Mar 2022 17:46:33 -0500
X-MC-Unique: To6gvK28O823yz4tk2Vd1A-1
Received: by mail-ej1-f71.google.com with SMTP id
 r18-20020a17090609d200b006a6e943d09eso7638114eje.20
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pYeaIUsJ9p0JJMezYpclW6q507JeS1XFz2MM26g4c9M=;
 b=0b28lOjKK72ZQy7yEoTGRHJGRzQynV7Y89A6Bg8a+iG7bKRaXvCOKys7Y+OOWLR1V8
 NIUE7d1a/bi/xAaBaHOp4ugh6jgivyDdgSjubWV1xDbPrDwvqgSBC4Sm6AQ0ik1ak6rI
 0Kwf6wjl6MLYGYpdW57+B+ndTNfAkYQ90NcWbefISCHgnJtEaX2vVRf+RuvMXHQQ9SUL
 tfboMJ67wlKNQ8jEaLYr1V/82AyTASyoycsnyIlF1MJFv8dbWh1nGFWo6sLLkOZ7AekY
 ZgOPE7zywJJXpUXeCj4umFTms+wX+olTRJyDMubRb4ClKx6YDJrpi1MHysT1RL8Y40mo
 69OQ==
X-Gm-Message-State: AOAM530+dFjb8/c446YO7ZaKNKyeC858oS2ADnXzqreMSpBRvJfL2oSJ
 J6Jbosp+4DL3Cn4T9JPw34rjEyQzqH/ps15S/k0iZlbKyExHyeVBAfuxN9zqv0I6nrDTL2BCeXy
 Ps0VNm5BqRqLlf04JR9NGTbJ+Jq9+xOp733YQz5X4BxX6Qg7BWhDTHhVjpoX6
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id
 m15-20020a170906848f00b006cf723408aemr11047298ejx.620.1646693191605; 
 Mon, 07 Mar 2022 14:46:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzh88KbHqp3WFqhnN8Tyk/8OyOwKPbLLxAQUKotbhp1gMELn4k23VMvArjlkJeerNY3BgkKqw==
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id
 m15-20020a170906848f00b006cf723408aemr11047278ejx.620.1646693191382; 
 Mon, 07 Mar 2022 14:46:31 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 m13-20020a170906234d00b006cf86bb0652sm5157897eja.121.2022.03.07.14.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:30 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 37/47] x86: cleanup unused compat_apic_id_mode
Message-ID: <20220307224357.682101-38-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


