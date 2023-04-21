Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887786EA60E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:41:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmKY-00032w-56; Fri, 21 Apr 2023 04:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppmKV-00032N-MM
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppmKK-0001sG-Ri
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682066467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpiB6sxC3DohqxrKYpC94Jz3RHHqCyDuIsL7iXn2uv0=;
 b=YEYs8BJdgHlCmfJs6YMq3pYXF4JBbynyg1lnH8gOYA03q8ExFcSdwzbhX6GW/TJYKDYeig
 f0ZkyCO1H9Gn4Fe7U7fI7kwwOmd+St8+0oqMNrFhGRUBUDgwfQmRKWwyqjEcQBy80QIVf8
 49XMsG93UdfPCaRC/6L3/CMEDmUR7eE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-b4Fuyhx4MfeIDtAtBPt8ng-1; Fri, 21 Apr 2023 04:41:06 -0400
X-MC-Unique: b4Fuyhx4MfeIDtAtBPt8ng-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a34e35f57so112369166b.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682066464; x=1684658464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HpiB6sxC3DohqxrKYpC94Jz3RHHqCyDuIsL7iXn2uv0=;
 b=FvTkCDIuX8JY/Y0Mq2RIzV8sg2k5QnZKOP/AbbnU3C2mR2RSWNh2BZr0KpWvfx8Zu6
 DCW85/VEWJHYC7ZuZtqcWnQGb0ZUpusie6ENOzFgUhY9ApR/i8cGb0KYfABsdPS4wrjf
 f9zgkT66PSrBGyNgvBJV9UG2ZIxvxM6zrknhkwUVlUV4sIFk379fgYfKZSsQPkFZwrml
 1YY86qwT3ii7gt9kfL4Z0638HxnrtLGnceayYOVhD6QonXQRPdNztSm5Sn+nlDY7wjzN
 J1X0+oTL4Dab3ZnrgAW4kVEm7C5p1pxw94WOEdSBy4DH/tEiCz54QMGEkOQEOinXH7Yb
 ossg==
X-Gm-Message-State: AAQBX9fnp1scLPTbAvJh3Q9f07RCCHD1j0cqZ/eyRuHema7o+onej9dw
 slwt31VbbtMan865uMM8TtL/uigbJ06TPdUjf8NokyTMtaxnxY0rbe/Hhd2PnWxHf6Ldab3N+yx
 0uJjQZdXoIxKbXqeLqYa3QHmEoFAf0efX3tEWcruL+IuxytCpQzqd6eRVhSxq5eWUfbqT7yggBl
 IxMw==
X-Received: by 2002:a17:906:16d5:b0:94f:1c90:cb71 with SMTP id
 t21-20020a17090616d500b0094f1c90cb71mr1423796ejd.65.1682066464648; 
 Fri, 21 Apr 2023 01:41:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350aB60kBMqTbNK/eTkWtgc4vaA8y+XGLfxAR/sT7kKcAYfMRVENfVGCHg6+yS76++hYUccXQSw==
X-Received: by 2002:a17:906:16d5:b0:94f:1c90:cb71 with SMTP id
 t21-20020a17090616d500b0094f1c90cb71mr1423773ejd.65.1682066464280; 
 Fri, 21 Apr 2023 01:41:04 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 lh21-20020a170906f8d500b0094eeab34ad5sm1735202ejb.124.2023.04.21.01.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:41:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: pkrempa@redhat.com,
	berrange@redhat.com
Subject: [PATCH v3 2/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Date: Fri, 21 Apr 2023 10:40:59 +0200
Message-Id: <20230421084059.9142-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421084059.9142-1-pbonzini@redhat.com>
References: <20230421084059.9142-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Krempa <pkrempa@redhat.com>

Since OpenSUSE Leap 15 counts as a single major release of an LTS distribution,
lcitool has changed the target name to remove the minor version.  Adjust the
mappings and refresh script.

This also updates the dockerfile to 15.4, since the 15.3 version is EOL now:

https://get.opensuse.org/leap/15.3

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <a408b7f241ac59e5944db6ae2360a792305c36e0.1681735482.git.pkrempa@redhat.com>
[Adjust for target name change and reword commit message. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/opensuse-leap.docker |  4 +--
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/mappings.yml                    | 36 +++++++++----------
 tests/lcitool/refresh                         |  2 +-
 ...suse-leap-153.yml => opensuse-leap-15.yml} |  0
 5 files changed, 22 insertions(+), 22 deletions(-)
 rename tests/lcitool/targets/{opensuse-leap-153.yml => opensuse-leap-15.yml} (100%)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 28f153b77b56..afb9f5419f5c 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-15 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.opensuse.org/opensuse/leap:15.3
+FROM registry.opensuse.org/opensuse/leap:15.4
 
 RUN zypper update -y && \
     zypper install -y \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 2fa24dce8bc2..85487e140415 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 2fa24dce8bc2d0d57b02b111dbdbd24e25d4ae95
+Subproject commit 85487e140415b2ac54b01a9a6b600fd7c21edc2f
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index e4719e45516c..454963f07b86 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -1,71 +1,71 @@
 mappings:
   flake8:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   meson:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3:
     CentOSStream8: python38
-    OpenSUSELeap153: python39-base
+    OpenSUSELeap15: python39-base
 
   python3-PyYAML:
     CentOSStream8: python38-PyYAML
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-devel:
     CentOSStream8: python38-devel
-    OpenSUSELeap153: python39-devel
+    OpenSUSELeap15: python39-devel
 
   python3-docutils:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-numpy:
     CentOSStream8: python38-numpy
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-opencv:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-pillow:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-pip:
     CentOSStream8: python38-pip
-    OpenSUSELeap153: python39-pip
+    OpenSUSELeap15: python39-pip
 
   python3-pillow:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-selinux:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-setuptools:
     CentOSStream8: python38-setuptools
-    OpenSUSELeap153: python39-setuptools
+    OpenSUSELeap15: python39-setuptools
 
   python3-sphinx:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-sphinx-rtd-theme:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-venv:
     CentOSStream8: python38
-    OpenSUSELeap153: python39-base
+    OpenSUSELeap15: python39-base
 
   python3-wheel:
     CentOSStream8: python38-wheel
-    OpenSUSELeap153: python39-pip
+    OpenSUSELeap15: python39-pip
 
 pypi_mappings:
   # Request more recent version
@@ -74,4 +74,4 @@ pypi_mappings:
 
   # Drop packages that need devel headers
   python3-numpy:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index c0d7ad551649..33ef1282dac4 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -120,7 +120,7 @@ try:
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-37")
-    generate_dockerfile("opensuse-leap", "opensuse-leap-153")
+    generate_dockerfile("opensuse-leap", "opensuse-leap-15")
     generate_dockerfile("ubuntu2004", "ubuntu-2004")
     generate_dockerfile("ubuntu2204", "ubuntu-2204")
 
diff --git a/tests/lcitool/targets/opensuse-leap-153.yml b/tests/lcitool/targets/opensuse-leap-15.yml
similarity index 100%
rename from tests/lcitool/targets/opensuse-leap-153.yml
rename to tests/lcitool/targets/opensuse-leap-15.yml
-- 
2.40.0


