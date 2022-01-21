Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39BB495FE3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:43:29 +0100 (CET)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAuCO-0005w3-BR
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:43:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtYx-0008O4-86
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:01 -0500
Received: from [2a00:1450:4864:20::336] (port=40449
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtYu-0000Fd-7t
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:02:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 r132-20020a1c448a000000b0034e043aaac7so4918748wma.5
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 05:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ultuOIKxr5TWbAjcktzHn+51q8ThlG+OnLPxMn4F5pk=;
 b=KAVYYULvbTOgCIG1vBvlkCCylUvlLGtYLPLsRgRa1pArIxqiFxqYAtYhozAwzPXIfw
 NHiR/EkOEiKGMbSMcXN7VYvBDdcegc7yZXBYwhjKNW2fHrQgrBXpxCKJbYBIOB7jF0hl
 hycTCvNzsx876u4yjeVyvAY3B8qkOP3CptZaW7qHpaOQgwgy2poRfagmtyngPYStntyG
 6LrE/ReiRnOMINUJKNBhm8VhcPZO8HNnQ30qvWLOR03xb0qR4e3ZQdLC3D27CWmzlg7N
 gEYdluzDzgO4b/cSygDZ55UUUw9DpEtxUhPWhTInMeV2AGJD1/f7EWCO2aJJmfFxCrFp
 6pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ultuOIKxr5TWbAjcktzHn+51q8ThlG+OnLPxMn4F5pk=;
 b=RGie6Vuv3lAVmj51LNkT+NiD4+iAsIls8CXL7PsA1LMnBKkM3nVpIGjY4FGb/shpf4
 J1i7wAXL8mvFQMk8brU+QI3QsmI/FiFWIla8NkLpHssCyOyoso3/yBQ1LT6ROpiZUXiV
 p9tf8X9QUT/htvUAh7gmxorbgAKcHOuGB/FS5wlu4LS950bXG2wmRIt/CZKJZKMP6s9X
 Fr0AW24tbbVvYTqFBnp0DCVagqrlmex2SAGkLxR1hYf0pBuEErf/813662e6pReX8/EE
 E5A27Tc/HbyTaELKIadFUR9awDCeNJxxhi7wPCCfp7dMH2cg3dDpq0qy/hHWyfIg+Smj
 wgLA==
X-Gm-Message-State: AOAM531xCG8RnVOuTE1RARE4un34MR6Eph8RvjtI0V82+0ho794e9Rya
 wpcEXB8NxYQnl0Rft4vX4KrZ1XAz+W8=
X-Google-Smtp-Source: ABdhPJzQzUmN28sZ1gp1pp/r9Lkyre8roVxQKUY7WOHdgmOK2kKj+M07ig1kE2qpK96S4HJFfxEIpw==
X-Received: by 2002:a1c:98cd:: with SMTP id a196mr675300wme.40.1642770144634; 
 Fri, 21 Jan 2022 05:02:24 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 i15sm7260511wry.100.2022.01.21.05.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 05:02:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 0/7] tests: Refresh lcitool submodule & remove libxml2
Date: Fri, 21 Jan 2022 14:02:15 +0100
Message-Id: <20220121130222.302540-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

Series fully reviewed.=0D
=0D
Refresh lcitool to latest and remove libxml2 (mjt).=0D
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

