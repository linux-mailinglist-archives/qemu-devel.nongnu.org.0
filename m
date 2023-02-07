Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1C68D5AF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:39:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMIq-0001wU-VA; Tue, 07 Feb 2023 06:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIp-0001wD-4G
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIn-0003zm-J6
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=elkAROsafooyNp8D2XL2GR8wOoNkAqUWuBWLRj1FOHk=;
 b=QUaJ2LkqxF/65JWmvoe2Oy6q7RQmS7DJ//IJzz0c1uVXTlGObQ2F8hsiwZ3PhcU5IATuDn
 2eF2T/aYZagCOlIHn14EesOG+dLk81TL80FRkZMuGe0qRokhBlMN9gtBC5pZSm3JyHCqn8
 IBxdWpnxS2T40uLpTQgl8hS7wHExCw0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-LyPRBAgrO46jcnwBLZ2J_g-1; Tue, 07 Feb 2023 06:38:19 -0500
X-MC-Unique: LyPRBAgrO46jcnwBLZ2J_g-1
Received: by mail-ed1-f71.google.com with SMTP id
 s26-20020a056402037a00b004a25c2875d6so9672317edw.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=elkAROsafooyNp8D2XL2GR8wOoNkAqUWuBWLRj1FOHk=;
 b=AaVG2yx95elUqxxShGMaNP9rQDsWALzw5Z63W4tZI+C/mV2lcxJX+u8iSvaRuJxbSD
 SA+Qp64TDOO8tJ7pxrZsEAdgQUsvddZT/3n/6gEtarIscIR1gDtx9tAclkTD2/0DTl2f
 v8rWV4qeW+GLpvETBeSUvU32kBdI4e8iF0SWK8PsgjfCjrZWNFRgRUNyvrCeJH7JH4rB
 raJht49qnEX69CXGw8Y2ijhUeCGFZmWk3qfDm1nVEp0mS4UCjc2eNh1jWoEQ3Z6PKskV
 QN7VNn5R3Xsgaer92DghaAoGy0RukGaZhgYqPR9HBVcqVAID9XJdKZAkby/LC2N5psuJ
 a+ZQ==
X-Gm-Message-State: AO0yUKVaPyGiF6+G6WX9pgW2O1LgDEXQ2SiEB5ppqLwrS2Z3EcSX8+he
 uftZH4Mu0y4p6hStkvJkn0HRi7VaLrLQXsgeU+WwWWYocvcv5H2X2FOr2ZdNTjB/xfcZuEOSIee
 sgEc009wSGebl8y9HDYacy/0q/9Xcu/z6RMRdZBWkKWNa+iPJAZQA4JMrNU8KNGYKWjFtF9f8
X-Received: by 2002:a17:906:70c7:b0:87b:d376:b850 with SMTP id
 g7-20020a17090670c700b0087bd376b850mr2642085ejk.10.1675769897827; 
 Tue, 07 Feb 2023 03:38:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/DaFo/YNTWawaxxhctk/R9ymQzWkVkNJ+Yj20tk4D2P552MwX5WyGXuosty3j2aXAaML//OQ==
X-Received: by 2002:a17:906:70c7:b0:87b:d376:b850 with SMTP id
 g7-20020a17090670c700b0087bd376b850mr2642074ejk.10.1675769897615; 
 Tue, 07 Feb 2023 03:38:17 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bk21-20020a170906b0d500b0087873afb1b4sm6746597ejb.41.2023.02.07.03.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:38:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PULL 3/5] scripts/ci: add capstone development packages
Date: Tue,  7 Feb 2023 12:38:05 +0100
Message-Id: <20230207113807.67322-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207113807.67322-1-pbonzini@redhat.com>
References: <20230207113807.67322-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/ci/org.centos/stream/8/build-environment.yml |  9 +++++++++
 scripts/ci/setup/build-environment.yml               | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index fe8807b7b074..95474ad034dc 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -10,6 +10,14 @@
       check_mode: yes
       register: centos_stream_8
 
+    - name: Enable EPEL repo on CentOS Stream 8
+      dnf:
+        name:
+          - epel-release
+        state: present
+      when:
+        - centos_stream_8
+
     - name: Enable PowerTools repo on CentOS Stream 8
       ini_file:
         path: /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
@@ -22,6 +30,7 @@
     - name: Install basic packages to build QEMU on CentOS Stream 8
       dnf:
         name:
+          - capstone-devel
           - device-mapper-multipath-devel
           - glusterfs-api-devel
           - gnutls-devel
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index c3cebc42ac2c..8d76404c6cf7 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -46,6 +46,7 @@
           - libbrlapi-dev
           - libbz2-dev
           - libcacard-dev
+          - libcapstone-dev
           - libcap-ng-dev
           - libcurl4-gnutls-dev
           - libdrm-dev
@@ -130,6 +131,15 @@
         - ansible_facts['distribution_version'] == '20.04'
         - ansible_facts['architecture'] == 'aarch64'
 
+    - name: Enable EPEL repo on EL8
+      dnf:
+        name:
+          - epel-release
+        state: present
+      when:
+        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
+        - ansible_facts['distribution_major_version'] == '8'
+
     - name: Enable PowerTools repo on CentOS 8
       ini_file:
         path: /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
@@ -148,6 +158,7 @@
         name:
           - bzip2
           - bzip2-devel
+          - capstone-devel
           - dbus-daemon
           - diffutils
           - gcc
-- 
2.38.1


