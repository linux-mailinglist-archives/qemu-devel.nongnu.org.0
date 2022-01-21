Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A323496242
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:45:03 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAw61-0003u1-RY
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:45:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw2n-00018t-KE
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:42 -0500
Received: from [2a00:1450:4864:20::429] (port=42585
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAw2k-0007fI-Ha
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:41:39 -0500
Received: by mail-wr1-x429.google.com with SMTP id a13so394910wrh.9
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EHjznGSV/fDRjpb0joQNEyTir32e/RHeRMpMRznUadg=;
 b=EUVutSxDczCf/NZkQpacWAK5HiRsqWcR4gtkTqauQu+iH1lPJIRhfCdjZ8W3ySjjk1
 AWuAJc2NS/w2hV9d+9WUtJJJp+C4IohtdpUI4Byi6CZccc9eywBztVh1B0m0Mlg3se2S
 0Ew1zYNgiZ9rNGH0gs7hM3HTHCt88d3beox2rOcNGjdYQdeWyKbtkuI2WaoHDtVZLaXl
 AuZV/J2PtZwiN7I+OZecjtoik081x0K9BpqyFuR+MPP+T2kRPkpKjI/ftDSSPcbewLYP
 hO7paPQtt/89f1uKnabOe15XI87f9GQY8FYcBzBXE+5VLIIxhZMfw8r2qUs88Eho+BOF
 SeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EHjznGSV/fDRjpb0joQNEyTir32e/RHeRMpMRznUadg=;
 b=RWX34fqPSYQUGskMf+FonG6/7MnHF8wnK/0RtFLVrmc3rX9GrdN3tGICK8jAdeYmyd
 XVGX4ILHa7icPg/R6Se0NarDQtLlCXTy3DhaqgSH7LKfDcgKuiwAGH9DhFPLLQDIEwN/
 xua9rQ3rLYDEHQtLhrMfp5z8JZ6C/Jqp7MhE9S/fW3NX/4/03uwY0kwhQvxbpZVobmvJ
 5FjoIt+0D5iB++Xl9uWQRkhEcvJYG8ad4StfYV8OLtKTtnFsOh+3doiXTVLvWiELCa2f
 aGSrzFI1kbStpDNuDM457V3oey1SyiexA6rGYEfIv6qnCwC03rbF9k6SblM0HAuLnfo+
 ac0g==
X-Gm-Message-State: AOAM533yZ7H+2iK+N7P9btOfTO6MoxWMY9Efbn31vhj7TzmgojZFWNGm
 6Uo1SMR6RWPfrzrSshUspHWpXATFQO0=
X-Google-Smtp-Source: ABdhPJwjLFM/cXvJ4gxq8TDFnQQG/e/JeS9NO2EL01HeY27c+CHKQ1tw96szqf50E+Ddg+DOSirL4w==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr4370103wrr.54.1642779696884;
 Fri, 21 Jan 2022 07:41:36 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 m187sm5271813wme.25.2022.01.21.07.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 07:41:36 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Date: Fri, 21 Jan 2022 16:41:27 +0100
Message-Id: <20220121154134.315047-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

This is my last respin on this series which is fully reviewed.=0D
=0D
Refresh lcitool to latest and remove libxml2 (mjt).=0D
=0D
v6:=0D
- update libvirt-ci submodule to remove lttng-ust from FreeBSD runners=0D
=0D
v5:=0D
- update scripts/meson-buildoptions.sh (thuth)=0D
- squash libvirt-ci updates (thuth)=0D
=0D
v4:=0D
- Fixed typos and cleaned checkpatch.pl (thuth)=0D
- Corrected libvirt-ci submodule URL=0D
=0D
v3:=0D
- fix 'refresh' helper to update cirrus-ci files (danpb)=0D
=0D
v2:=0D
- rebased (testing/next)=0D
- include mjt's libxml2 removal patch=0D
=0D
Michael Tokarev (1):=0D
  drop libxml2 checks since libxml is not actually used (for parallels)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  MAINTAINERS: Cover lcitool submodule with build test / automation=0D
  gitmodules: Correct libvirt-ci submodule URL=0D
  tests/lcitool: Include local qemu.yml when refreshing cirrus-ci files=0D
  tests/lcitool: Refresh submodule and remove libxml2=0D
  tests: Manually remove libxml2 on MSYS2 runners=0D
  tests/lcitool: Install libibumad to cover RDMA on Debian based distros=0D
=0D
 meson.build                                     | 6 ------=0D
 .cirrus.yml                                     | 1 -=0D
 .gitlab-ci.d/cirrus/freebsd-12.vars             | 2 +-=0D
 .gitlab-ci.d/cirrus/freebsd-13.vars             | 2 +-=0D
 .gitlab-ci.d/cirrus/macos-11.vars               | 2 +-=0D
 .gitlab-ci.d/windows.yml                        | 2 --=0D
 .gitmodules                                     | 2 +-=0D
 MAINTAINERS                                     | 1 +=0D
 block/meson.build                               | 3 +--=0D
 meson_options.txt                               | 2 --=0D
 scripts/checkpatch.pl                           | 1 -=0D
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -=0D
 scripts/coverity-scan/coverity-scan.docker      | 1 -=0D
 scripts/coverity-scan/run-coverity-scan         | 2 +-=0D
 scripts/meson-buildoptions.sh                   | 3 ---=0D
 tests/docker/dockerfiles/alpine.docker          | 4 ++--=0D
 tests/docker/dockerfiles/centos8.docker         | 4 +---=0D
 tests/docker/dockerfiles/fedora.docker          | 4 +---=0D
 tests/docker/dockerfiles/opensuse-leap.docker   | 3 +--=0D
 tests/docker/dockerfiles/ubuntu1804.docker      | 4 ++--=0D
 tests/docker/dockerfiles/ubuntu2004.docker      | 4 ++--=0D
 tests/lcitool/libvirt-ci                        | 2 +-=0D
 tests/lcitool/projects/qemu.yml                 | 2 +-=0D
 tests/lcitool/refresh                           | 2 +-=0D
 24 files changed, 19 insertions(+), 41 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

