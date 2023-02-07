Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB1768D5B2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMIo-0001vu-BY; Tue, 07 Feb 2023 06:38:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIm-0001vJ-80
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIk-0003z9-Ns
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uK94fcymOVdApNTE2J2S39VT7KMfsPK0unfcL2uBjwk=;
 b=bfEsKVQEh6ZVuVTbgB29XBYNHX3RKPKaxbDf6VUdtl2c4lZd+iNJFoDrZOmjSA+8UNvXni
 iQ0UJkmUabsfWgjK2XdgTI+bZwfuG22Cges+Img9iwNDV1XA9d/7Vcr4QKhBsRnS8/9osq
 pYq3fRQeUd1+mUbcbP9ZyB6WINxIt6o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-138-SJ3EnXphMV-_ESlsf_x0Eg-1; Tue, 07 Feb 2023 06:38:16 -0500
X-MC-Unique: SJ3EnXphMV-_ESlsf_x0Eg-1
Received: by mail-ed1-f72.google.com with SMTP id
 dm4-20020a05640222c400b004aaa5e3c414so4461746edb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uK94fcymOVdApNTE2J2S39VT7KMfsPK0unfcL2uBjwk=;
 b=Tv64azi/5c2knBqPrpd5Pr47HHD0rnNIsyTNZ/EwEGTZ30ITk9/LHAj4WojOgDPNFt
 VnGKQ/t8nMRkVtLSpnF1JCzRCwRQcVQ5whx8PXjhF90iykjuhASmHptKRuqeGT62w/Ey
 pvj1Y7Wisc7+NNiE9B+MacMbCmeHq8d/G9O5eJpwsaLucm+tann5iZUy8p66djyQCRM2
 g652ia5KOimKkKDMjCSSvAPBfyL6shq1e/6yt8K9U4NIc+hBNukQmgTWdtFt83cK5XJH
 YpXian6PSzqY+Ey7X62K8gAjKICOrTpzkoG+6PaRGGuy2RcK1+EdaWbHr0l4BZkijWMy
 bgEg==
X-Gm-Message-State: AO0yUKWH0L971RfZSGyzRsqpIo7g0Y9phagz6opXTNRmle4K8krrrp/D
 ul3fQuiUvkg1DOpXJjdG6kFw1nPv+4z7UQdTsTDFt5rWlEQt/E68KFMP35Xc/qUVCAEdZLSWTuj
 k423ubEWYvhNjfupXfjDi1KSqhYDzdaQmEcIM/r4T5gP9Bzah1S8i9Jj3w6JT4FhAu+sGsmeq
X-Received: by 2002:a17:907:16a8:b0:8aa:eb:ca42 with SMTP id
 hc40-20020a17090716a800b008aa00ebca42mr1871284ejc.69.1675769895371; 
 Tue, 07 Feb 2023 03:38:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9phKnx2tr0gDR0KfjgAZHEFYF79hPby7/PM9vNclQzrGfEhMwu1QrTCTigC7JKioXpgc4luA==
X-Received: by 2002:a17:907:16a8:b0:8aa:eb:ca42 with SMTP id
 hc40-20020a17090716a800b008aa00ebca42mr1871263ejc.69.1675769895121; 
 Tue, 07 Feb 2023 03:38:15 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 uo29-20020a170907cc1d00b00871ac327db6sm6693686ejc.45.2023.02.07.03.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:38:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PULL 2/5] scripts/ci: support CentOS Stream 8 in
 build-environment.yaml
Date: Tue,  7 Feb 2023 12:38:04 +0100
Message-Id: <20230207113807.67322-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207113807.67322-1-pbonzini@redhat.com>
References: <20230207113807.67322-1-pbonzini@redhat.com>
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

Update the CI playbook so that it is able to prepare a system with a
fresh CentOS Stream 8 install, rather than just support RHEL.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/ci/setup/build-environment.yml | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 58438008eeb6..c3cebc42ac2c 100644
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
@@ -164,7 +174,7 @@
           - zlib-devel
         state: present
       when:
-        - ansible_facts['distribution_file_variety'] == 'RedHat'
+        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
         - ansible_facts['distribution_version'] == '8'
 
     - name: Install packages only available on x86 and aarch64
@@ -174,6 +184,6 @@
           - spice-server
         state: present
       when:
-        - ansible_facts['distribution_file_variety'] == 'RedHat'
+        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
         - ansible_facts['distribution_version'] == '8'
         - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-- 
2.38.1


