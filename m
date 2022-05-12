Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3165253A7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:29:52 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCdL-00080h-LU
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ5-0004vK-Hj
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ2-000564-KP
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbGcfNZIfshSpkC4Df+eoPZ1ATXLFNv3HAbE0FyCjIw=;
 b=P+gnhN35/qC6hYPVseCLjZsagGkZy0/CGqCR8eQz24Y/dW+2tRalAseyxSDTZNNGUL4TQu
 CmlfeBMK8xLmGbMsEq7P1HGuSkizSRNlt4apr4GllQ6fOqkK9z3e6rtY9nHwQEwrjhyX/Y
 u6yov8MoD0mMA4yQx9+4r/XhdVmKo5Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-TEQ8EiZJPnqOz4Gfi9O4PA-1; Thu, 12 May 2022 13:25:22 -0400
X-MC-Unique: TEQ8EiZJPnqOz4Gfi9O4PA-1
Received: by mail-ej1-f71.google.com with SMTP id
 sh14-20020a1709076e8e00b006f4a5de6888so3187121ejc.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mbGcfNZIfshSpkC4Df+eoPZ1ATXLFNv3HAbE0FyCjIw=;
 b=FXhdtf/j1+vDH3Pwoi+abOtgDcKt8EOPmJzu9RYCJhtha7hSt1e5KctDF4jOWjD/cZ
 GH5osHsebUDcTXS7jMxIjV3xWoH8U68idwNIGXo5JxjnotCAP16dtVzLuPG2uZbQUyT3
 GceLXTYYxf7f8q/maNH6cjzGpFIsxHVg5yvVhllPvCrE9qAsSwL5G7jHQWvv8453EZ4b
 IHt05/IG/rkc3gP29Oo3UY0P/Kd4BhwLACQLvHQqhp1k3FWODC/2Jl2wsPL1wjI+x/0G
 VWxSGSI2TM/jzvxhMFoKw1oQNpSIvZDRNsu9volWCoRrrawW6VpwF5t/GeUaxv4bpjcQ
 qKxg==
X-Gm-Message-State: AOAM530aoSOEuOSnsYbPruoZKOo8DGqn63YPdCe5c1J93RcvDQRCUtOQ
 q+gOWdbBttb1+GcHAxJORmJxhLth1UZgJZMh/sgoLYt/Tsu+QO9vpsSJVeGocL6n1ad+SNCOdLn
 utvJYyp6NoonPdjDldLu1I71k/TNl803BnLIqlPOyILiduVrvXbwzeHgFph0cGHblFGU=
X-Received: by 2002:a17:907:72c2:b0:6f4:ef00:4588 with SMTP id
 du2-20020a17090772c200b006f4ef004588mr845792ejc.515.1652376320650; 
 Thu, 12 May 2022 10:25:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSjhGMRnJ0pshPUrgqSPxlg2jQempVvOpq8u/uxOxOuh7MXiAb4EM1OP9bQSdeofz+UVVkAQ==
X-Received: by 2002:a17:907:72c2:b0:6f4:ef00:4588 with SMTP id
 du2-20020a17090772c200b006f4ef004588mr845768ejc.515.1652376320361; 
 Thu, 12 May 2022 10:25:20 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 q21-20020aa7d455000000b0042617ba63d3sm2737287edr.93.2022.05.12.10.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PULL 05/27] meson: Make mremap() detecting works correctly
Date: Thu, 12 May 2022 19:24:43 +0200
Message-Id: <20220512172505.1065394-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Without this (at least in Fedora 35) it don't detect mremap()
correctly.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20220502131119.2345-1-quintela@redhat.com>
[Also switch the LEGACY_RDMA_REG_MR test to cc.links, otherwise
 Debian fails to build. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 864e97945f..03f63e95e2 100644
--- a/meson.build
+++ b/meson.build
@@ -2179,7 +2179,8 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
 
 have_pvrdma = get_option('pvrdma') \
   .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
-  .require(cc.compiles('''
+  .require(cc.compiles(gnu_source_prefix + '''
+    #include <sys/mman.h>
     int main(void)
     {
       char buf = 0;
@@ -2190,7 +2191,7 @@ have_pvrdma = get_option('pvrdma') \
     }'''), error_message: 'PVRDMA requires mremap').allowed()
 
 if have_pvrdma
-  config_host_data.set('LEGACY_RDMA_REG_MR', not cc.compiles('''
+  config_host_data.set('LEGACY_RDMA_REG_MR', not cc.links('''
     #include <infiniband/verbs.h>
     int main(void)
     {
-- 
2.36.0


