Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D5371ED9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:44:41 +0200 (CEST)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcca-0007W5-ID
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldcTu-00010n-4X
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldcTq-00087U-V5
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620063338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w85E9X6fr/rpsgzjFIOCIamOZMIKhlKm8ouDJEHbPs8=;
 b=BP2y6jn+kHkKjlHhes01vGddRj02zg0FW8dVWhi3n1F1uM4PGlLxEw9PIbyM4SmmS+Mi0t
 JFqXooRd9Tm2DUjIujdqAeJVcrGOJb+RvbfpdS6AkzzzKmKzHUTETl+9sG/eHR4GSQwJJO
 T0WAG5ZeiRg9D1t7NyX0yCpJLERn/sQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-CQjduF9oOluFIpK6gKQSRQ-1; Mon, 03 May 2021 13:35:36 -0400
X-MC-Unique: CQjduF9oOluFIpK6gKQSRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 7-20020a05600c2307b02901432673350dso904717wmo.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w85E9X6fr/rpsgzjFIOCIamOZMIKhlKm8ouDJEHbPs8=;
 b=P8lizL6aZBoIqTRz6FE5SK1xlU6Et4b7JnR66ZaJr2H1U1pemJDZmVyKjdljTRS10A
 Fzln7IRxR3+546Js+4FwNglLUjDR6/195Ps6FX/chUBxWRz8PmUmGnT10ALFfdvHM8JF
 569hAeVPqNJsqPyrfChKugSLYkSHHmmacrUw3r31QAIsVe064TmHii8SvH6KRhpgDXsY
 /CJIDjJtXdiPnzjuMN4XruuY8dXrSVu3EhxBO34/7WeYk/yq9zHsc6vjzCb7t0NjaufM
 c9c4oK5RPYNNQAUpOxog+5hiuZevQc6VQi6oZVVLogi9Pntm1J2gLVEuiHSB8Ny86doT
 USjg==
X-Gm-Message-State: AOAM532ASDydAzgL711GTw/wkkX+wjumTgNmlRHckTclVc1/vLdETuHn
 T5LifFuhSQReMuD5qu0aJ7hCjPB2uSOQMBuD+PhVWZySc3rEoVPkhXmjHa3Hmiw7l1feF/jZYZI
 U7NxLBTca0mVejQ3olrNhL2Vhgm6CZeMDCx5J1X1wux7+Cn+30OOJ1Xv8O/pPSJFW
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr4747175wrx.43.1620063335665; 
 Mon, 03 May 2021 10:35:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfwUvJxh81DqCsdOWxIdg1x/QebCcurGDOCBB36MTI0PHRRU8K8radB+Zh95mU0hoU+TLPLg==
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr4747158wrx.43.1620063335508; 
 Mon, 03 May 2021 10:35:35 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y8sm16235970wru.27.2021.05.03.10.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:35:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/i386/cpu: Constify X86CPUDefinition
Date: Mon,  3 May 2021 19:35:24 +0200
Message-Id: <20210503173524.833052-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503173524.833052-1-philmd@redhat.com>
References: <20210503173524.833052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c7ded968e74..3a6f1c55ef3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1668,7 +1668,7 @@ typedef struct X86CPUDefinition {
 /* Reference to a specific CPU model version */
 struct X86CPUModel {
     /* Base CPU definition */
-    X86CPUDefinition *cpudef;
+    const X86CPUDefinition *cpudef;
     /* CPU model version */
     X86CPUVersion version;
     const char *note;
@@ -1680,14 +1680,15 @@ struct X86CPUModel {
 };
 
 /* Get full model name for CPU version */
-static char *x86_cpu_versioned_model_name(X86CPUDefinition *cpudef,
+static char *x86_cpu_versioned_model_name(const X86CPUDefinition *cpudef,
                                           X86CPUVersion version)
 {
     assert(version > 0);
     return g_strdup_printf("%s-v%d", cpudef->name, (int)version);
 }
 
-static const X86CPUVersionDefinition *x86_cpu_def_get_versions(X86CPUDefinition *def)
+static const X86CPUVersionDefinition *
+x86_cpu_def_get_versions(const X86CPUDefinition *def)
 {
     /* When X86CPUDefinition::versions is NULL, we register only v1 */
     static const X86CPUVersionDefinition default_version_list[] = {
@@ -1876,7 +1877,7 @@ static const CPUCaches epyc_milan_cache_info = {
  *  PT in VMX operation
  */
 
-static X86CPUDefinition builtin_x86_defs[] = {
+static const X86CPUDefinition builtin_x86_defs[] = {
     {
         .name = "qemu64",
         .level = 0xd,
@@ -5246,7 +5247,7 @@ static void x86_cpu_apply_version_props(X86CPU *cpu, X86CPUModel *model)
  */
 static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
 {
-    X86CPUDefinition *def = model->cpudef;
+    const X86CPUDefinition *def = model->cpudef;
     CPUX86State *env = &cpu->env;
     const char *vendor;
     char host_vendor[CPUID_VENDOR_SZ + 1];
@@ -5553,7 +5554,7 @@ static void x86_register_cpu_model_type(const char *name, X86CPUModel *model)
     type_register(&ti);
 }
 
-static void x86_register_cpudef_types(X86CPUDefinition *def)
+static void x86_register_cpudef_types(const X86CPUDefinition *def)
 {
     X86CPUModel *m;
     const X86CPUVersionDefinition *vdef;
-- 
2.26.3


