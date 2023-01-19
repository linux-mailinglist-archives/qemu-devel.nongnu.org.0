Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A616673DC3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIX3F-00006n-Df; Thu, 19 Jan 2023 10:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX39-0008US-Ns
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX37-0005rP-AD
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674142916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAyRNRZijRpyQ0dRMa1PjUN2o0me4CYdHHtAmZmNw+A=;
 b=c38zOiovzbIIxYfqn+8al2lk0gWmVdkg40qJGjRpEyWwuNaXYRkH9ZWJG1MJ4I2od14JHZ
 eKKqtYP2l3j4bA8yF8NACsgOUafx99DB8LFEVZLpE3CTjUiL1rq7J74lhlEqg/H9fg77Zp
 gOyRailnqZJdTN0H+hdl8UoQxn3YUEw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-41-0fbwxTwpNUGISFJUWDFSyw-1; Thu, 19 Jan 2023 10:41:55 -0500
X-MC-Unique: 0fbwxTwpNUGISFJUWDFSyw-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp2-20020a1709073e0200b0084d47e3fe82so1862309ejc.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAyRNRZijRpyQ0dRMa1PjUN2o0me4CYdHHtAmZmNw+A=;
 b=xRETHzKpfcq8fAKS6CFcWJktusJj0JIGJFUITL5G+pf/sh9Qv0Yih0W1/C1bA+ksqc
 OzQai12y0ks3RVSKfzhRk/wrsCm/2/hzHQWdqDsHn6swkkIJBB7JECpI00tewTxQleza
 NwCg9RY6+E06yxGm15QCfPspaX6VBMt6APml/iW3hY7xbTxWrransVuwtZWulXtPCwN+
 UxG5C+eKzb5es0tLrW6J6GDJMkp2nGU5GcUiuX+UjI3krC8RqGabH++R2PNyZ2iVKjgj
 6Gk7TtFQ5fA31NBKIr9paBAH5/IE13PsffSdz5g2WthlOKg+Mzcp2JDyz5XGTilAh2Xq
 bV0g==
X-Gm-Message-State: AFqh2kqPcfNkmMA3hzgOMJ3n3uzeICdy3LBIPgYWG1fqxPOu24ZRXRg8
 rP/sLgTrhXwI8F7rU7HlpNfZaQpnVH+k8SJcFKV3ddtnzOUNoA7ovVMijsX4uEtTMUorWUdtvS7
 8aUj3Ho0OhZNxvVBCKtw/zIdyCd6QTOBO1F6BgICxqUCSM1CfouBN4ZWjfJyYtTd8Eso=
X-Received: by 2002:a17:906:3783:b0:86f:e116:295 with SMTP id
 n3-20020a170906378300b0086fe1160295mr14836235ejc.4.1674142913450; 
 Thu, 19 Jan 2023 07:41:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuPut1n4wXI2EWCVkVmo6bSDUfWozsUcQpbHfountiqyshzKG5LsChseqU+mBK8smiHhNZ3dA==
X-Received: by 2002:a17:906:3783:b0:86f:e116:295 with SMTP id
 n3-20020a170906378300b0086fe1160295mr14836211ejc.4.1674142913163; 
 Thu, 19 Jan 2023 07:41:53 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a1709062a4b00b0073022b796a7sm16769025eje.93.2023.01.19.07.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:41:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PATCH 2/5] scripts/ci: support CentOS Stream 8 in
 build-environment.yaml
Date: Thu, 19 Jan 2023 16:41:42 +0100
Message-Id: <20230119154145.471156-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119154145.471156-1-pbonzini@redhat.com>
References: <20230119154145.471156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Update the CI playbook so that it is able to prepare a system with a
fresh CentOS Stream 8 install, rather than just support RHEL.  The
ninja-build package is only available if the CentOS Powertools are
enabled, which indeed is what the org.centos/stream/8 playbook is
already doing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/ci/setup/build-environment.yml | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index b04c2b7ceee9..ad63bbb3ccf7 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -130,6 +130,16 @@
         - ansible_facts['distribution_version'] == '20.04'
         - ansible_facts['architecture'] == 'aarch64'
 
+    - name: Enable PowerTools repo on CentOS 8
+      ini_file:
+        path: /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
+        section: powertools
+        option: enabled
+        value: "1"
+      when:
+        - ansible_facts['distribution_file_variety'] == 'CentOS'
+        - ansible_facts['distribution_major_version'] == '8'
+
     - name: Install basic packages to build QEMU on EL8
       dnf:
         # This list of packages start with tests/docker/dockerfiles/centos8.docker
@@ -165,7 +175,7 @@
           - zlib-devel
         state: present
       when:
-        - ansible_facts['distribution_file_variety'] == 'RedHat'
+        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
         - ansible_facts['distribution_version'] == '8'
 
     - name: Install packages only available on x86 and aarch64
@@ -175,6 +185,6 @@
           - spice-server
         state: present
       when:
-        - ansible_facts['distribution_file_variety'] == 'RedHat'
+        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
         - ansible_facts['distribution_version'] == '8'
         - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-- 
2.38.1


