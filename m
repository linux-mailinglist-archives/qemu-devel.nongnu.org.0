Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C00494F31
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:42:28 +0100 (CET)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXhq-0000jO-R5
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:42:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVep-0005ak-KQ; Thu, 20 Jan 2022 06:31:13 -0500
Received: from [2a00:1450:4864:20::32a] (port=37457
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVen-0006T3-0H; Thu, 20 Jan 2022 06:31:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso21165825wmj.2; 
 Thu, 20 Jan 2022 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XInVpbU/LjClZLeEI9CLHPU5EJt4O41Z6urLKtiK8M4=;
 b=SQohLV1CEFTtM61J45vBbOO1WE6WU5/F3EHZ4OV9wlkvX50vRQ7+rX/EBzjr4gpWy2
 WYnmPCnyAFxGPd6cRBDPDWvOZQlVjKATk22ABuiqycrsPBY6hLpiyJXwO9/p9hyINNpR
 fvfcfc2GuEq0P75cnoRACLjyeo+4eVgWPJ1gGyppNqeGNmLGLXY1v46Viyy1/o9MTbqt
 +0EF0RO4Qp/+GJiv2c98S12MTGUSgKfNowL629c5Zdv12GlDx3QA6OiZYI2kL4o1EQS6
 x79pw9ZoF4lHxXwacYuFUDXJ//Ic1/gOFwEgovX7wMGxdfQt9nsLUJ7FhwOruL5BNrrV
 aWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XInVpbU/LjClZLeEI9CLHPU5EJt4O41Z6urLKtiK8M4=;
 b=6l2Yn68ylx7vxsj4gwSslnoL8kx8tf8d/ub/VpZW1xTl8doxxSL2xzrZRvDCaMZxxL
 mvSn2WN8n/EXhpTZ4cgbgh0jkrgLFiPbvOewufNHVsYw80GiPHwSLxTOd1FDu4QQ4hoc
 47QvSYY+DtFV8VL68FvotBp9xKSC0HfFsY4eiia1Ns80O9LfljjLXEG17s6hv/qy3qw8
 szsyoUcsM3SmYnI5prenvtivPFJ/JUY/rrQ8ChqKf+Z4lBEbjQfoUM5dwG/wDHGOPZNx
 Pkp5JMJF8Y0vDUQYRc7ih6D6vOSVorvY/xUC9yut8WLYEVSt8y9pPzJwkKbEsKyFMdvP
 OVJw==
X-Gm-Message-State: AOAM533JbAFekyTL0I1NsSBxx5JRmWZKNRHDDnuLJWNjL7QJP1BgAHsZ
 lQid0roEXDoN5Ccz0Tx3NbuCckBKo64=
X-Google-Smtp-Source: ABdhPJx5xBIEl0gKp+W7Z7jjt6wTmrYLAtKiCOOFdGydcRFY6uadodYwAffQeS2Vj+NIa8hmR9UuxQ==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr32903680wri.193.1642678218853; 
 Thu, 20 Jan 2022 03:30:18 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g17sm10811463wmq.9.2022.01.20.03.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:30:18 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/7] tests: Refresh lcitool submodule & remove libxml2
Date: Thu, 20 Jan 2022 12:30:09 +0100
Message-Id: <20220120113016.268265-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

Refresh lcitool to latest and remove libxml2 (mjt).=0D
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
  tests/lcitool: Include local qemu.yml when refreshing cirrus-ci files=0D
  tests: Refresh lcitool submodule=0D
  tests/lcitool: Install libibumad to cover RDMA on Debian based distros=0D
  tests/lcitool: Remove libxml2=0D
  tests: Manually remove libxml2 on MSYS2 runners=0D
=0D
 meson.build                                     | 6 ------=0D
 .cirrus.yml                                     | 1 -=0D
 .gitlab-ci.d/cirrus/freebsd-12.vars             | 2 +-=0D
 .gitlab-ci.d/cirrus/freebsd-13.vars             | 2 +-=0D
 .gitlab-ci.d/cirrus/macos-11.vars               | 2 +-=0D
 .gitlab-ci.d/windows.yml                        | 2 --=0D
 MAINTAINERS                                     | 1 +=0D
 block/meson.build                               | 3 +--=0D
 meson_options.txt                               | 2 --=0D
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -=0D
 scripts/coverity-scan/coverity-scan.docker      | 1 -=0D
 scripts/coverity-scan/run-coverity-scan         | 2 +-=0D
 tests/docker/dockerfiles/alpine.docker          | 4 ++--=0D
 tests/docker/dockerfiles/centos8.docker         | 4 +---=0D
 tests/docker/dockerfiles/fedora.docker          | 4 +---=0D
 tests/docker/dockerfiles/opensuse-leap.docker   | 3 +--=0D
 tests/docker/dockerfiles/ubuntu1804.docker      | 4 ++--=0D
 tests/docker/dockerfiles/ubuntu2004.docker      | 4 ++--=0D
 tests/lcitool/libvirt-ci                        | 2 +-=0D
 tests/lcitool/projects/qemu.yml                 | 2 +-=0D
 tests/lcitool/refresh                           | 2 +-=0D
 21 files changed, 18 insertions(+), 36 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

