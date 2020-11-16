Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C92B42D8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:32:52 +0100 (CET)
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keckd-0000tG-Md
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kecjP-0000Od-00
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:31:35 -0500
Received: from de-smtp-delivery-52.mimecast.com ([62.140.7.52]:28758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kecjM-0001DO-NT
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605526288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NsWnDpZp5kK89nJZioTsWJM4KY7++2YWENauZOtYqT8=;
 b=jZSDez6waNNrbXiBX5PAqBlMj4d2vAP3qkYAypZJDdq8l1dcVlt3da3VZBxnW4rnhapxBR
 0gnTp5loyQQ0NYFG/HZYx6I5ltpKc8xlv49KaCtilZY62vF4LEGNhnsDCgqXsKHTuBnw5K
 6NOI0m0U6FnSTSSlmfp5FrzqZ7DCRtA=
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-OiseGu-2PeWURip3dtHewA-1; Mon, 16 Nov 2020 12:31:26 +0100
X-MC-Unique: OiseGu-2PeWURip3dtHewA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDCW1fTm/QNt+XoEgMLoUkECCudNDHRTD+RJbsbnytGaoBSAuskzSUjv4qhNyzvoQ7o2jhZr8h0vCO0gKEpXlYTIKLAJki4caswOOJyCgPaOyaA9BZ3YUZeQFBQH2KYXD7kZzb/uw9+mskMLL3sJJgMDRcvzDCMP4VuL0dOVQahkjup79uqmxSuJqEr+wzzOxkzWp52qvVqzAARxatJGOiecgJ0nOpnC400bThWa0WaRwS4KC1k/ZujkRNAukgxtX37DPkYrmXwkOkyLlLZWKtRZEp8SUD0PGRlUk/kGGnTpfweV8EKjr4G3HQbx3U0dqSvIEhgDLdwBWb9ZoIxV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTmQzFd7ULpS/cX7c7X2p+FpwWiL3x92gYk7b3UEmSs=;
 b=oD2DFKEPZ7dv+dje2Dumsq6DR8HeQj5xYa6fS0s8FUxEtW932BNBvLGTq4tw1vzWqe9pSFb+hBqxnwv3qCCBbpWB1WLxt26ckPo+O8r2Em1pY3zP2of8d6mQPZkp8ORkSmoweJXHKY+arV3Qu3UGUZPCZMZsUd7bcabbXfGa8HZOuR3o2pJvKVpnBT5AmaEiPwekxu9kBDF1DtVl4iQl3UTIkk1IgVQjGcduV6dofCIYWQ7MoSY8WzPUmnCa1tfzuYmw8DEk1xD7mA2tKNNqUcawHTx6vpLnaZd+tT0cjzj06bJHRccBN5YffdSDFm2mhjhMHZLjIdNDUbgkC/dCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7006.eurprd04.prod.outlook.com
 (2603:10a6:803:137::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 11:31:18 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 11:31:18 +0000
From: "Yu-Chen, Cho" <acho@suse.com>
To: qemu-devel@nongnu.org
CC: thuth@redhat.com, philmd@redhat.com, wainersm@redhat.com,
 alex.bennee@linaro.org, fam@euphon.net, cfontana@suse.de, brogers@suse.com,
 lyan@suse.com
Subject: [PATCH] gitlab-ci.yml: Add openSUSE Tumbleweed and Leap for gitlab
 CI/CD
Date: Mon, 16 Nov 2020 19:30:46 +0800
Message-ID: <20201116113046.11362-1-acho@suse.com>
X-Mailer: git-send-email 2.29.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [118.166.46.186]
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (118.166.46.186) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 11:31:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec0db1bb-3c3d-403c-31d2-08d88a232240
X-MS-TrafficTypeDiagnostic: VI1PR04MB7006:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB700604BA8EA9A562D7DEB35CA0E30@VI1PR04MB7006.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +WoQPXzKxMrdBgmfPN/EJB16G4WNQ3MHHQGj1veKzq8wyU0qCrLgl1GVyWGvgESda4O+tGyHC3azaw54ZwDl0nHpJ8ZtF73lc/5zhsn2RVbtWXvS8our9hUAKj+Cc3pg2L/uwWt94SkonkbctFwf/70QzWvRLnqHa/go3THo3vrOjaMqwuIb5pnGgSVLi+xsioxLQSLZ+NPK2OU3aEZVCw+bc+A+HF0eoZQjLCjctqW0SbfCHHuswmd1mJ+VaX9DW/Hgw81BsTwtCcNs5rIcYCUtB5KzBS3oaZIT74SYKdrKMLp0jvLl219VqS+XrKTRm1G+QpD1XhsuUUh1EZ8Sc4E1AnqI27L4OU5qPUnfv8/aeII7JwV+k1PXs4X0KGyT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(4326008)(36756003)(5660300002)(6916009)(956004)(2616005)(6666004)(8936002)(8676002)(1076003)(69590400008)(107886003)(26005)(83380400001)(316002)(55236004)(16526019)(86362001)(66946007)(66476007)(2906002)(66556008)(186003)(6506007)(478600001)(6486002)(6512007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CnHWgzpSoktWB4t+xPRlYl5jfPjNhz4xkLCKBursYePPW9F+eHWAj7wxhyRAzPNyUMLX8awPl3AwyoLX0eBpzhjlNnLJWo+qmHFbLtqk+io2le7NTDHxJYlFDFFkfdtem4gAn3hEWgibZL1JhTAHPOzxuOuXbSr3YW+2REjpDpPLsSipgMHzROoaC/l1FWmU8V7jfsTvmrkOVFaHP8gXMtAMRc+a5CRxRb1FApELk0waSKLqEtIj9eTlG0KcjR1Ss6Kj/TJ+hm8t89zDr0Gi2aUFQjCnCHurjA6WsUzLwNp5GAuuNQ/px4XDxjg6BapzaPHXnSMx/m4gBhcJ4gBq4K8JGkN3g0r3KJ0tcsS7/xghghPdmiewVTdLUW+5hA84Sfrsl9OpXdbp5m9mTnCKlwlpIsNCGsdd8Yslvr+EdjQ5nhKtFQx+mkxmbc43C1icpMkszcUJmNQzRLUgc16Z9dyaCFwjOKZjM34yDxZ63KvhEGpkqDGqZ0YTlhlfG638XeLfMeM3hHSezdiElfBRUvZ38LDlpSSVuALcjX2I6LQbJ9tZ9hiJ5+IbxKthXXDl3Y9AUt5AJrYIXHdgLJYUpoMO/EGM9dQsZhE6xbyAvCC2pUPu/cQDT2DwX2w3TQFJTXU3pE0Xe0QeGEYqtlJfTQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0db1bb-3c3d-403c-31d2-08d88a232240
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 11:31:17.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1Qond3yLgH4UqfBns+QJIFAUqS638nHVj0o7KNMOtuzogTL5OM9WuvZB8FfDkJo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7006
Received-SPF: pass client-ip=62.140.7.52; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 06:31:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add build-system-opensusetw and build-system-opensuse152 jobs and
add opensuse152.docker and opensusetw.docker dockerfile.
Use openSUSE Tumbleweed and openSUSE Leap 15.2 container image in the
gitlab-CI.

Signed-off-by: Yu-Chen, Cho <acho@suse.com>
---
 .gitlab-ci.d/containers.yml                 | 10 +++
 .gitlab-ci.yml                              | 60 ++++++++++++++
 tests/docker/dockerfiles/opensuse152.docker | 88 ++++++++++++++++++++
 tests/docker/dockerfiles/opensusetw.docker  | 89 +++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 tests/docker/dockerfiles/opensuse152.docker
 create mode 100644 tests/docker/dockerfiles/opensusetw.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 11d079ea58..449a00de70 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -48,6 +48,16 @@ amd64-debian11-container:
   variables:
     NAME: debian11
=20
+amd64-opensuseTW-container:
+  <<: *container_job_definition
+  variables:
+    NAME: opensusetw
+
+amd64-opensuse152-container:
+  <<: *container_job_definition
+  variables:
+    NAME: opensuse152
+
 alpha-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a8b375188..540a700596 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -195,6 +195,66 @@ acceptance-system-centos:
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
=20
+build-system-opensusetw:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: opensusetw
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensusetw:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensusetw
+      artifacts: true
+  variables:
+    IMAGE: opensusetw
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensusetw:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensusetw
+      artifacts: true
+  variables:
+    IMAGE: opensusetw
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
+build-system-opensuse152:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: opensuse152
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensuse152:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse152
+      artifacts: true
+  variables:
+    IMAGE: opensuse152
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensuse152:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse152
+      artifacts: true
+  variables:
+    IMAGE: opensuse152
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 build-disabled:
   <<: *native_build_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/opensuse152.docker b/tests/docker/doc=
kerfiles/opensuse152.docker
new file mode 100644
index 0000000000..712eb4fe3a
--- /dev/null
+++ b/tests/docker/dockerfiles/opensuse152.docker
@@ -0,0 +1,88 @@
+FROM opensuse/leap:15.2
+
+RUN zypper update -y
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    libzip-devel \
+    ccache \
+    clang \
+    cyrus-sasl-devel \
+    dbus-1 \
+    device-mapper-devel \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    hostname \
+    libaio-devel \
+    libasan5 \
+    libattr-devel \
+    libblockdev-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    libubsan0 \
+    libudev-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lzo-devel \
+    make \
+    mingw32-filesystem \
+    glibc-devel-32bit \
+    libSDL2_image-devel \
+    mingw64-binutils \
+    nmap \
+    ncat \
+    ncurses-devel \
+    libnettle-devel \
+    ninja \
+    mozilla-nss-devel \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python3-base \
+    python3-PyYAML \
+    python3-numpy \
+    python3-opencv \
+    python3-Pillow \
+    python3-pip \
+    python3-Sphinx \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    sparse \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    usbredir-devel \
+    virglrenderer-devel \
+    libvte-2_91-0 \
+    which \
+    xen-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.8
+
+RUN zypper  --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/opensusetw.docker b/tests/docker/dock=
erfiles/opensusetw.docker
new file mode 100644
index 0000000000..21edd8039a
--- /dev/null
+++ b/tests/docker/dockerfiles/opensusetw.docker
@@ -0,0 +1,89 @@
+FROM opensuse/tumbleweed
+
+RUN zypper update -y
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    libzip-devel \
+    ccache \
+    clang \
+    cyrus-sasl-devel \
+    dbus-1 \
+    device-mapper-devel \
+    diffutils \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    hostname \
+    libaio-devel \
+    libasan5 \
+    libattr-devel \
+    libblockdev-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    libubsan0 \
+    libudev-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lzo-devel \
+    make \
+    mingw32-binutils \
+    glibc-devel-32bit \
+    libSDL2_image-devel \
+    mingw64-binutils \
+    nmap \
+    ncat \
+    ncurses-devel \
+    libnettle-devel \
+    ninja \
+    mozilla-nss-devel \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python38-base \
+    python3-PyYAML \
+    python3-numpy \
+    python3-opencv \
+    python3-Pillow \
+    python3-pip \
+    python3-Sphinx \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    sparse \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    usbredir-devel \
+    virglrenderer-devel \
+    libvte-2_91-0 \
+    which \
+    xen-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.8
+
+RUN zypper  --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
--=20
2.29.1


