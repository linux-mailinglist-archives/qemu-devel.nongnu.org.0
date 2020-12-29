Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6882E6F1F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 09:53:30 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuAkz-0002RM-O4
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 03:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kuAiw-0001YJ-Tc
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 03:51:23 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:28608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kuAir-0001UA-Qt
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 03:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1609231875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yJIGI0RCqGFz9WmG8RXkeb2VtyV6QkoKRrtPrvqzXyg=;
 b=XwmUuiGBV+PawpJVby01/LEfz18xHivrGmJS15AhhLpSZE0KdJ6Gt+iM7pCr0GlufNRqte
 H1KHp3hiMXD5FJVUr6Hgu8z8YImEwatPFFFyUdDbU/wYA+yynZe61+qjSa3OD7d8UkG3jL
 nEvAcn2kzcmyxI0EKWesEyN6TPH2j2o=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-1zCc_8DvO4WMuvw0lpilMQ-1;
 Tue, 29 Dec 2020 09:51:11 +0100
X-MC-Unique: 1zCc_8DvO4WMuvw0lpilMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FD+f3Rksr+o+jc02L8Fw6E1uqdF81AFA5AoXHxd49AcoQ5N4F3jVPTWOqbSDKe0f6+GD8Igm9vih0SSaTggVBC9M0i2TuzkSXZ/tqNKeMDrgJD2LAJhOPdAgr8Grg7qqM5z4MpBJH1JRyue1VfdJvxyk7Lj+Yx566EKyEiYEHifE3/z0rlKtGyK44XrWXOjq7H0IXpZtufF3fNbSGX7rXJJiEAcaxLF6XxxhZyN9rHIpC9a4OBiKHCvxtCE0o5zgeQZfDSVy9nXQV3m65/x4/PMVEhQoDeWTDypmnKf199NmsTQy0I21XhOUunf/kPbW3bXL8UZOGVBEJ8dozAgr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVxrYqNQeEtrb5vcV2Jal0e4q6OAlV1pxAPInGz2Zo8=;
 b=AajcuZf/Uw3Zin8mH1ZDy8yPr2Y8sA2RFL3MO9zT/pfdqmplc9HbnY9tLcMmswhewrzjq/+bJ8vw1JCqhgmpn6VhUhqvN35KFeUH91LLhZIzhI6OCtMUXMnKWZeJyn2u6Q+Z4Qlu1t/bGkusKq8cU9VDFVqK6v22zDsyWauKtGl74bMz5zCVhok5TOV52T0vf+cHqyvvewLeajgdO0pvTiCRv4qae9k8rWUyArj9KRutUWB5EEGc3XzgTrYHOZ1FHOofStLdQ+Ng7kt6sQihPtB8XIHUE3ZUtQJKkQd4g4QfZ+tNTlRztjUQ2mONlLL+lQ7EkdWy/GSae7lwDw4TJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB7310.eurprd04.prod.outlook.com
 (2603:10a6:800:1a2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Tue, 29 Dec
 2020 08:51:09 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%7]) with mapi id 15.20.3700.029; Tue, 29 Dec 2020
 08:51:09 +0000
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
Date: Tue, 29 Dec 2020 16:50:46 +0800
Message-ID: <20201229085046.8536-1-acho@suse.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR04CA0075.apcprd04.prod.outlook.com
 (2603:1096:202:15::19) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (60.251.47.115) by
 HK2PR04CA0075.apcprd04.prod.outlook.com (2603:1096:202:15::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 08:51:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 797d3bc6-8a02-4c6c-33e2-08d8abd6e2f6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73105BC0076B67C05B05F62BA0D80@VE1PR04MB7310.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ikH5JfCyZWLUEx+S2JVz6tLkiMj0BeHv3Wxy6jGmNMAVyplr56YScrm1vHcgGTjkGbCyEexKaGu5loR3OpYtjS3q6x9c5HFw3HEq0o5AhBm7AUAVNuemGDr2zLmO9ElY82dONGKnRqSIA9GN7CeWNcCf7XhB09dT997a5XuPuNJWU0QB5zjqMr0ns9Kptsane88IU8M/gkCU0MnqVQPh8F86IAs3NTgNXZafXgb9BSvIFvxTHHl9ePcyCI9Gf1/zWuWcNnoogQsAXGg3CxB5rYLA2hXzdbFdTyhIGlR0dulSm5lENtsoNhLMnEZRHp7evacgYBPObfRhZd5cAb3jPAVqx9bBEj/sWei0w2hxlx0Zg0tRBgdc8rVLvXwYi9ih2QGsYgGzwuIO3fdzixw1m6+OOSZaZOj2wATfk757HVazaYYSlFOqyxbQPzWXTLw/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(136003)(396003)(366004)(346002)(1076003)(16526019)(186003)(8936002)(8676002)(107886003)(83380400001)(6506007)(36756003)(86362001)(4326008)(316002)(6666004)(66476007)(69590400010)(55236004)(52116002)(6486002)(5660300002)(478600001)(66556008)(26005)(2906002)(956004)(6916009)(6512007)(2616005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JnfP6Uynx5ADeDidoLf0UUszldacmVLTClstjBq6EP3nMJRaLs6OSEdyI17Y?=
 =?us-ascii?Q?RYqPjZPcYjgYd3H/KjvAOBYYzxKAa+Xtn8MWOQCpWYzkchxfZBUVmRM64BZy?=
 =?us-ascii?Q?iDxcpIfurPOXu7su11SM8B5k+xpEG/FGtgITVdh40Y2+BsGb2HFMZKHT3vtw?=
 =?us-ascii?Q?nz+tovA2IYq0lqnhh1XsyAwnjoAQJqbpdL16nJJ3DtIaxr7b5OYB/Hbt8Wb1?=
 =?us-ascii?Q?LHQeKoxRiTtqT3X7twcjqIBusP627aV10E2G2fHfmOErGAd7Xfi67Mm5g6re?=
 =?us-ascii?Q?TXVpAwoW1lvdcQM25fj9UpcazxjDKMNaWvcIStfn7uymlxPURhimjyUpbr+6?=
 =?us-ascii?Q?GFbTcIvTVXOMecpNPGejHzm5cxPIk3czhjYQhm6HPuuTCc2AHFQj9o5wERVd?=
 =?us-ascii?Q?cYxwDP6z6RTMV0LErK+bxSNKFRBLeeywtH2To3INy0JmN57Ee24OqgLRQiKI?=
 =?us-ascii?Q?e7UlBBE340plwW2x2kqxaaKeFyuqeSE+MkMMo1BlfapWtIjPEexLSPamSO5y?=
 =?us-ascii?Q?0IRuCry8FR5t+IpbTsa03xV2E+PijTzDyoXyEf/2VFjqwx2X2Wc0RuLHoGNW?=
 =?us-ascii?Q?adS/kC2Up1mhxCic/eVP2q4ppwAxVjA5T+GD8jOU00ILs/4bSvjRCd7IJDEZ?=
 =?us-ascii?Q?bdUqX+MY/Z2DeGEQchssR82otXpw5U2hYVwgkj9YGHSz8ehJ2bQp627fqMWW?=
 =?us-ascii?Q?Qlb41TaMmYyFDWo1weHMJGd16UX8wl+9lcTjdc/P4ZyD3RCaRgTiI6sqD+Y7?=
 =?us-ascii?Q?mrYizdicmWeRQWsqYb5doFGZbD8qFh0I6Y7O+4vjtMsn7U5csKKTcdcj0hNl?=
 =?us-ascii?Q?AnZS/bC+nbpv12/zDVX9SC9j3+drGK/7W7BLmwG1u+RKLoO7fgFTFhvG1OOO?=
 =?us-ascii?Q?V5dVtN3TaGUF+xQ8/AIrZeKzIRuD1UUhkAsrRezTFLlQ2n2YoGV+2KzEO+lx?=
 =?us-ascii?Q?Q5ljJ41ttjYlWHWm9ZEKfzUo19CNqMgEzHNJMvkMlTHMWXPJOXwWHiGpYt3c?=
 =?us-ascii?Q?K8Rz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 08:51:09.0962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 797d3bc6-8a02-4c6c-33e2-08d8abd6e2f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Fd50jnKuLLFBGAZwWoXJbCOqf0ad+/JQi55CbBuiucXynO8eOGW8Dh7tmVjbqmu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7310
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, lyan@suse.com, thuth@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, brogers@suse.com, cfontana@suse.de,
 alex.bennee@linaro.org, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: "Cho, Yu-Chen" <acho@suse.com>
From: "Cho, Yu-Chen" via <qemu-devel@nongnu.org>

Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
Use openSUSE Leap 15.2 container image in the gitlab-CI.

Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
v4:
Add package tar and fix python3 version from 3.8 to 3.6
Add acceptance-system-opensuse back.

v3:
Drop the "acceptance-system-opensuse" job part of the
patch for now to get at least the basic compile-coverage

v2:
Drop some package from dockerfile to make docker image more light.

v1:
Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
Use openSUSE Leap 15.2 container image in the gitlab-CI.
---
 .gitlab-ci.d/containers.yml                   |  5 ++
 .gitlab-ci.yml                                | 31 +++++++++++
 tests/docker/dockerfiles/opensuse-leap.docker | 55 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 892ca8d838..910754a699 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -246,3 +246,8 @@ amd64-ubuntu-container:
   <<: *container_job_definition
   variables:
     NAME: ubuntu
+
+amd64-opensuse-leap-container:
+  <<: *container_job_definition
+  variables:
+    NAME: opensuse-leap
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98bff03b47..fb65a2d29c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -195,6 +195,37 @@ acceptance-system-centos:
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
=20
+build-system-opensuse:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: opensuse-leap
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensuse:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensuse:
+   <<: *native_test_job_definition
+   needs:
+     - job: build-system-opensuse
+       artifacts: true
+   variables:
+     IMAGE: opensuse-leap
+     MAKE_CHECK_ARGS: check-acceptance
+   <<: *acceptance_definition
+
+
 build-disabled:
   <<: *native_build_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/d=
ockerfiles/opensuse-leap.docker
new file mode 100644
index 0000000000..0e64893e4a
--- /dev/null
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -0,0 +1,55 @@
+FROM opensuse/leap:15.2
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    cyrus-sasl-devel \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    libaio-devel \
+    libattr-devel \
+    libcap-ng-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    lzo-devel \
+    make \
+    libSDL2_image-devel \
+    ncurses-devel \
+    ninja \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python3-base \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    usbredir-devel \
+    virglrenderer-devel \
+    xen-devel \
+    vte-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.6
+
+RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
--=20
2.29.2


