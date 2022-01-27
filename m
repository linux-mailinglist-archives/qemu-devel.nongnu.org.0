Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57349E137
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:36:03 +0100 (CET)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD34L-0005Wj-MZ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2g1-0006n2-Na
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:54 -0500
Received: from [2a00:1450:4864:20::332] (port=45816
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fy-0006A0-CC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:53 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso1603734wms.4
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0MOTcOI0zXzL/XH9A/zmnk1FBFcFXsythCRvvyOsx4=;
 b=VZ8mt7nI+UA7b06GBP+/vnRsQ9zJ6mzceNeqnrMfTL74AjFpuuZH0x+RT9q9qx1/6q
 5m9yQ9gakXBsCTI5BHPa/Z7YVUaMIlSc3EQthakw6aW98ai6/0sMfqGwRKyizN81RYmL
 7MjGphUCxkrC/iiJAv4lwa/AYH7x1AfB5z1bPpnydyci1XFQzHNdUuLo9vE+BFgw4l7c
 QcJLBdG5JJOYQnYGQV0IL2UyhkQM0tpD8VeS1EPKHZe19LPdKsRwV+myHIp5OSJUOJSQ
 yg/+1gSdMkdRpOS7N1Uec+SZo0cbjHQ2287/aBcHkagNMR0vW+xenFH+3hOV0Nte5IgJ
 pkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i0MOTcOI0zXzL/XH9A/zmnk1FBFcFXsythCRvvyOsx4=;
 b=b5OTkZkOghos0nz1Q9UnhCIVyCPZXqvtPYqoWR7sxFwRCl2getuRwqzedBm/H0109f
 XdrBFJ4N/OsXk/u/9xI8SVokuuxoJVY4ysFDY0Sx4iH/Cy8zgjWRJ6OvrW/XsgvuZCD6
 7KlQKyilVYWdfV6Lk2QFvJF144hfb0hMzkLu3ZtncnP/mbdVISuw/Se2sVfoLSjvGX3j
 Yyq9ZKi0plmCP6d5XTPjFw0EIjP5R0NyeDZ0O/CDD1GOmzedyCWkJzHHc4P4NXv367td
 Kz/84JEFACl8MNEz8ku59ogNBWlR+iQGoTlrQX3A4tlJT//8iakkKYVm3CzgkJIZVXHr
 r48g==
X-Gm-Message-State: AOAM531TQnLYPldci7QBdqjg016zLEYnE3ocm5Kv9c3fMFsF9uYiVgpu
 9GqCgNuPN1qHthhAwBIsNY+LQs/or+o=
X-Google-Smtp-Source: ABdhPJzP4BMILMDpsnTjnDhTV2vm65ha6TZvcVwpLpGwS/U9hdC3ypdXTssEmsy9IQbQXqB2NYU2mQ==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr2732377wmg.4.1643281848970;
 Thu, 27 Jan 2022 03:10:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] qapi: Cleanup SGX related comments and restore
 @section-size
Date: Thu, 27 Jan 2022 12:10:36 +0100
Message-Id: <20220127111037.457901-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

The SGX NUMA patches were merged into Qemu 7.0 release, we need
clarify detailed version history information and also change
some related comments, which make SGX related comments clearer.

The QMP command schema promises backwards compatibility as standard.
We temporarily restore "@section-size", which can avoid incompatible
API breakage. The "@section-size" will be deprecated in 7.2 version.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220120223104.437161-1-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst | 13 +++++++++++++
 hw/i386/sgx.c             | 11 +++++++++--
 qapi/machine.json         |  4 ++--
 qapi/misc-target.json     | 22 +++++++++++++++++-----
 4 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index e21e07478f..47a594a3b6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -264,6 +264,19 @@ accepted incorrect commands will return an error. Users should make sure that
 all arguments passed to ``device_add`` are consistent with the documented
 property types.
 
+``query-sgx`` return value member ``section-size`` (since 7.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Member ``section-size`` in return value elements with meta-type ``uint64`` is
+deprecated.  Use ``sections`` instead.
+
+
+``query-sgx-capabilities`` return value member ``section-size`` (since 7.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Member ``section-size`` in return value elements with meta-type ``uint64`` is
+deprecated.  Use ``sections`` instead.
+
 System accelerators
 -------------------
 
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 5de5dd0893..a2b318dd93 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -83,7 +83,7 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
            ((high & MAKE_64BIT_MASK(0, 20)) << 32);
 }
 
-static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
+static SGXEPCSectionList *sgx_calc_host_epc_sections(uint64_t *size)
 {
     SGXEPCSectionList *head = NULL, **tail = &head;
     SGXEPCSection *section;
@@ -106,6 +106,7 @@ static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
         section = g_new0(SGXEPCSection, 1);
         section->node = j++;
         section->size = sgx_calc_section_metric(ecx, edx);
+        *size += section->size;
         QAPI_LIST_APPEND(tail, section);
     }
 
@@ -156,6 +157,7 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
 {
     SGXInfo *info = NULL;
     uint32_t eax, ebx, ecx, edx;
+    uint64_t size = 0;
 
     int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
     if (fd < 0) {
@@ -173,7 +175,8 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
     info->sgx1 = eax & (1U << 0) ? true : false;
     info->sgx2 = eax & (1U << 1) ? true : false;
 
-    info->sections = sgx_calc_host_epc_sections();
+    info->sections = sgx_calc_host_epc_sections(&size);
+    info->section_size = size;
 
     close(fd);
 
@@ -220,12 +223,14 @@ SGXInfo *qmp_query_sgx(Error **errp)
         return NULL;
     }
 
+    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     info = g_new0(SGXInfo, 1);
 
     info->sgx = true;
     info->sgx1 = true;
     info->sgx2 = true;
     info->flc = true;
+    info->section_size = sgx_epc->size;
     info->sections = sgx_get_epc_sections_list();
 
     return info;
@@ -249,6 +254,8 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
                    info->sgx2 ? "enabled" : "disabled");
     monitor_printf(mon, "FLC support: %s\n",
                    info->flc ? "enabled" : "disabled");
+    monitor_printf(mon, "size: %" PRIu64 "\n",
+                   info->section_size);
 
     section_list = info->sections;
     for (section = section_list; section; section = section->next) {
diff --git a/qapi/machine.json b/qapi/machine.json
index c87c81b803..42fc68403d 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1207,7 +1207,7 @@
 #
 # @memdev: memory backend linked with device
 #
-# @node: the numa node
+# @node: the numa node (Since: 7.0)
 #
 # Since: 6.2
 ##
@@ -1288,7 +1288,7 @@
 #
 # @memdev: memory backend linked with device
 #
-# @node: the numa node
+# @node: the numa node (Since: 7.0)
 #
 # Since: 6.2
 ##
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 1022aa0184..4bc45d2474 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -344,9 +344,9 @@
 #
 # @node: the numa node
 #
-# @size: the size of epc section
+# @size: the size of EPC section
 #
-# Since: 6.2
+# Since: 7.0
 ##
 { 'struct': 'SGXEPCSection',
   'data': { 'node': 'int',
@@ -365,7 +365,13 @@
 #
 # @flc: true if FLC is supported
 #
-# @sections: The EPC sections info for guest
+# @section-size: The EPC section size for guest
+#                Redundant with @sections.  Just for backward compatibility.
+#
+# @sections: The EPC sections info for guest (Since: 7.0)
+#
+# Features:
+# @deprecated: Member @section-size is deprecated.  Use @sections instead.
 #
 # Since: 6.2
 ##
@@ -374,6 +380,8 @@
             'sgx1': 'bool',
             'sgx2': 'bool',
             'flc': 'bool',
+            'section-size': { 'type': 'uint64',
+                    'features': [ 'deprecated' ] },
             'sections': ['SGXEPCSection']},
    'if': 'TARGET_I386' }
 
@@ -390,7 +398,9 @@
 #
 # -> { "execute": "query-sgx" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true, "section-size" : 0 } }
+#                  "flc": true,  "section-size" : 96468992,
+#                  "sections": [{"node": 0, "size": 67108864},
+#                  {"node": 1, "size": 29360128}]} }
 #
 ##
 { 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
@@ -408,7 +418,9 @@
 #
 # -> { "execute": "query-sgx-capabilities" }
 # <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
-#                  "flc": true, "section-size" : 0 } }
+#                  "flc": true, "section-size" : 96468992,
+#                  "section" : [{"node": 0, "size": 67108864},
+#                  {"node": 1, "size": 29360128}]} }
 #
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
-- 
2.34.1



