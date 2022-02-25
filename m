Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E344C4CD0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:44:10 +0100 (CET)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNedV-00025d-CF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:44:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGz-00044C-KL
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:53 -0500
Received: from [2a00:1450:4864:20::533] (port=43917
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGh-0002M6-Kd
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:46 -0500
Received: by mail-ed1-x533.google.com with SMTP id m3so8304830eda.10
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bj5V9uE7Q5NnDmaF3EDFkpfzYCd8y5i1/u7I2uMgbDk=;
 b=eMVuD7sfnes4DinpdNf5zKwInHebseQQHPo29WlZMQYV4ZOhn10p/5S7XFTMslbTfx
 v+fqBWVcBpsdfXFa8QtnAQxgtW0FFOKMTDsaMjFQ7iK9sDaIENYhtzwG0jpsnA654VHU
 mIjULOs+CuRdoJovzXr++/RwmEQytdwaauCM3+PZEkf8SkM3LtN83sdnIRRep5AngDcF
 cqKwqd3m7wzlsqq1YApc4OEWL2925rtaBn/64+kxmt59tybdDiQzKQ/wstm5XcEqyzQq
 HC+F1U/TcZ6y5TIQ0UTKKn/YQm3S1Hhq1dA3ASU9556IYiviYOmQg+3rWpCJvQayIRs4
 7Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bj5V9uE7Q5NnDmaF3EDFkpfzYCd8y5i1/u7I2uMgbDk=;
 b=GJfjopjv+o/RE8BzHmjlvfIfZZKEttu3MiDtmJRs39iTPlk2kuAYkro+OroWeburuc
 y9Pg3byRJibajvJj+924dr25FUeSkhSzJgwJIwF6ECsXHK/P2EDCAHpCYj3Qap49CwAK
 8H7vCoGAywMKDRl+UIVSwsA+EZZvIWBAryfatUeFkOwIO7qgR8TXsnNoJmn6xOC+KZwy
 WY2J/+NtjaSVaq9j1ToJV/1c56v6ip6aVd12vF1SX+SYDiUvfur73x0F3grRlsiqDqMo
 NOLUvwgarbcWztkIJLo7AfeZIVtZRwyv4wR+ptxARdIzN0xQ+exASSc5aMBOIoQlf9mh
 BAng==
X-Gm-Message-State: AOAM531OYsMOiJS3OP6sUcqp5Ry78h+iSUtWfiXdD/CD3OIGWiHTgkdS
 RRkCVh6ZQfuCmyIk4EKuUQ47dA==
X-Google-Smtp-Source: ABdhPJzibLPWbp/IupJpVHvin75c4BTqGfCfJvUHgXddGJgjPB1IyRDdqFB/C7qUJIBoU6zrCDC0Xw==
X-Received: by 2002:a50:e004:0:b0:410:a39b:e30c with SMTP id
 e4-20020a50e004000000b00410a39be30cmr7884808edl.198.1645809633351; 
 Fri, 25 Feb 2022 09:20:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a170906521000b006d58773e992sm1230799ejm.188.2022.02.25.09.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA4B51FFBF;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/18] scripts/ci: add build env rules for aarch32 on
 aarch64
Date: Fri, 25 Feb 2022 17:20:10 +0000
Message-Id: <20220225172021.3493923-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least the current crop of Aarch64 HW can support running 32 bit EL0
code. Before we can build and test we need a minimal set of packages
installed. We can't use "apt build-dep" because it currently gets
confused trying to keep two sets of build-deps installed at once.
Instead we install a minimal set of libraries that will allow us to
continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-7-alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 599896cc5b..9182e0c253 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -19,6 +19,13 @@
           - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
         msg: "Unsuitable ansible version, please use version 2.8.0 or later"
 
+    - name: Add armhf foreign architecture to aarch64 hosts
+      command: dpkg --add-architecture armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
     - name: Update apt cache / upgrade packages via apt
       apt:
         update_cache: yes
@@ -115,6 +122,24 @@
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '20.04'
 
+    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 20.04
+      package:
+        name:
+          - binutils-arm-linux-gnueabihf
+          - gcc-arm-linux-gnueabihf
+          - libblkid-dev:armhf
+          - libc6-dev:armhf
+          - libffi-dev:armhf
+          - libglib2.0-dev:armhf
+          - libmount-dev:armhf
+          - libpcre2-dev:armhf
+          - libpixman-1-dev:armhf
+          - zlib1g-dev:armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['architecture'] == 'aarch64'
+
     - name: Install basic packages to build QEMU on EL8
       dnf:
         # This list of packages start with tests/docker/dockerfiles/centos8.docker
-- 
2.30.2


