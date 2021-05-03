Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE628371EDA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:45:00 +0200 (CEST)
Received: from localhost ([::1]:33436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcct-0007lu-QC
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldcTr-0000wU-0w
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldcTo-000854-PP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620063335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YgWkBOpmW47z0vCe4sUC8C/PYvyTKvQToOOdtPZ8r8=;
 b=F/DCoHhUUM+1EtNIJVy83Cm7LPL49Xa+tFrEUnPqcffvmJJtLuz1Cp0w/BpvIGQ+G5NuK5
 2UxOggAvvdmtqUkJAvV2LyFjKvOpktjaRvkHit0QrPFc5ZhI4Q2g3wG8ZRjvFT8FzBjvFg
 FDe/fceXSdm4NIZJLG2zK3dr/+0knMY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-gYgSNm1YO_W_A2SGwxHNkA-1; Mon, 03 May 2021 13:35:32 -0400
X-MC-Unique: gYgSNm1YO_W_A2SGwxHNkA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso4305213wrf.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YgWkBOpmW47z0vCe4sUC8C/PYvyTKvQToOOdtPZ8r8=;
 b=p0oUdYOtwoeBsBv9PcMbxzyNV2cGDhk8L5yfBH2DWm+demRmF4NOIYT9F4XQMx38DH
 mkyfh3BS4AHCru9PnzSASi9sM9bqRSqOdW3JFX8553VGKPPCYM3vukxmXAOryEEexud5
 qFoK1R8BKkMNpEE03m4/8NGf4zhY5sUoWuXln7P8OUPWnfht7/izH6BzRdLeSQvwhvch
 nEzCf8UVUYI5wsHUrdvlE4nAfs0Yvbyae9wscxBQWatM7oFGgoS92iUvodZ6J2LkseYd
 QH4Qsflrn5o8ONJczluvRB7aQ94dHzu+E711cApJLsN8sGQb12oV/NCixWEYA/yMc72e
 5HwQ==
X-Gm-Message-State: AOAM530/xruX2TmDEKqXBl6Ni5y124LG9N2hvtSP0tx+XXx+iCYnKzma
 0r3ocgOpIY3sqVBW/m0Nc5nBGMfhJkS5GyfKcMuERXUBonNduIYyQgurydxiRX7EEAj8Z/vtl6n
 GAHlyNhpMbLyylXIdlVi7P/SZETWPhzRgraJU0GB3kZubfG4Zyg9rG5i7u89YIg7/
X-Received: by 2002:a5d:525c:: with SMTP id k28mr26048534wrc.158.1620063331005; 
 Mon, 03 May 2021 10:35:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXNy6dP9AUAL5JAPfb6lk4qmRpYPVIF4Xk5j/X81wW+7xku9n976nupPNl0vx6nVTBHZpHjA==
X-Received: by 2002:a5d:525c:: with SMTP id k28mr26048514wrc.158.1620063330847; 
 Mon, 03 May 2021 10:35:30 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id k6sm75457wmi.42.2021.05.03.10.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:35:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/i386/cpu: Constify CPUCaches
Date: Mon,  3 May 2021 19:35:23 +0200
Message-Id: <20210503173524.833052-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 target/i386/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7c..c7ded968e74 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1655,7 +1655,7 @@ typedef struct X86CPUDefinition {
     int stepping;
     FeatureWordArray features;
     const char *model_id;
-    CPUCaches *cache_info;
+    const CPUCaches *const cache_info;
     /*
      * Definitions for alternative versions of CPU model.
      * List is terminated by item with version == 0.
@@ -1698,7 +1698,7 @@ static const X86CPUVersionDefinition *x86_cpu_def_get_versions(X86CPUDefinition
     return def->versions ?: default_version_list;
 }
 
-static CPUCaches epyc_cache_info = {
+static const CPUCaches epyc_cache_info = {
     .l1d_cache = &(CPUCacheInfo) {
         .type = DATA_CACHE,
         .level = 1,
@@ -1748,7 +1748,7 @@ static CPUCaches epyc_cache_info = {
     },
 };
 
-static CPUCaches epyc_rome_cache_info = {
+static const CPUCaches epyc_rome_cache_info = {
     .l1d_cache = &(CPUCacheInfo) {
         .type = DATA_CACHE,
         .level = 1,
@@ -1798,7 +1798,7 @@ static CPUCaches epyc_rome_cache_info = {
     },
 };
 
-static CPUCaches epyc_milan_cache_info = {
+static const CPUCaches epyc_milan_cache_info = {
     .l1d_cache = &(CPUCacheInfo) {
         .type = DATA_CACHE,
         .level = 1,
-- 
2.26.3


