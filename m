Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8FA2F4E4C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:16:46 +0100 (CET)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzht7-000750-7D
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqh-0005Mm-D3
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:15 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqf-0008Rd-62
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:15 -0500
Received: by mail-wr1-x429.google.com with SMTP id 91so2495326wrj.7
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3rWlj/ufqnx4Zw+xHVInWPsjb3U7AuAODbsjl0WbNL4=;
 b=lCW7LO2CaitszntxFO3BYgPfdoO2NdIgqn4J9c9692UudEnaQfY3nrxkS5c8QQWmrL
 W/nidwFlCveOsqEPo9GDuX9XdbSVhkjAUhrkwymf/1XLoh38omG0OgEO87PI4yLuWp2q
 m8Wr/mXH2EnKbNCXBEyOlf4Qz19pspPBUEYTAZnipNrRp0vhDxkyhkxKNL4m80fpYdsS
 9tgJFl90RfxGEumeKhefOL6Z5cLvHSCGjmgNsZ3jU8eMFCBKk+4RJslzSjdvRXhUyC+h
 85mVkJbEZH74wZE+x1BCkN+/O1FclTXJX8Wb2Qf569KPADByD2W4ueulbzqASdbbU/yE
 poYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3rWlj/ufqnx4Zw+xHVInWPsjb3U7AuAODbsjl0WbNL4=;
 b=OqanOjyI+CTcbdgVDJKOllc5y2HmwGPVF0ry+CvU0YSEVFjef7MENVvkwwXebZyIIB
 y2g3XzZODM+fCRupNuLkczHRwhVDTUgNwuT1s8xsXzSxlZjJyuGBlcL2PemhByN28Tir
 7E1NxbkcNs4pyfLJrMy2ODalNSzwUct7asEBIUElYlcYLD+ZIgDhWRlPShuHA9t4rlLF
 Xs6v6JJvYf6524rhfrhG8KgtxIBV++A4MWcDcEb5xS9vWAg4vsKj1XSpoOgp9mI35WC5
 S2K3DalFf437fYXce/w4AnE1VZ2Bq0z9no8bHbOy5JsmERXtz3w3SYTseBsW300hO11o
 d1SQ==
X-Gm-Message-State: AOAM531eTVRa03VESTUX03Hdf5MlMavnlg5gShveMA8veXD/0v5Uwn+g
 XOaoMp9QWc3MyK9u3FxQUKrg9Q==
X-Google-Smtp-Source: ABdhPJzrynfuT3GQZymFR+HnthKGgb86YicSHUVrtyj+JSAqioOXkXIPJLa/vUXG00iS21kOdCqlIg==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr3093343wrq.75.1610550851726;
 Wed, 13 Jan 2021 07:14:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm3462572wrt.10.2021.01.13.07.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 917071FF7E;
 Wed, 13 Jan 2021 15:14:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/9] testing/next (tags!,
 more travis/shippable deprecation)
Date: Wed, 13 Jan 2021 15:13:59 +0000
Message-Id: <20210113151408.27939-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Not a lot in this tree at the moment but I did grab a few patches that
got inadvertently included in my pre-PR series for semihosting and
gdbstub. It does include Phillipe's deprecation of most of the
shippable builds. I've also moved one more test across from Travis
while trying to beef up the documentation we generate. We really need
a better "official" way to install the docs in an arbitrary directory
though.

The following need review:

 - gitlab: move docs and tools build across from Travis
 - docker: expand debian-amd64 image to include tag tools
 - Makefile: wrap cscope in quiet-command calls
 - Makefile: wrap etags in quiet-command calls
 - Makefile: wrap ctags in quiet-command calls
 - Add newline when generating Dockerfile
 - shippable.yml: Remove jobs duplicated on Gitlab-CI
 - Makefile: add GNU global tags support

Alessandro Di Federico (1):
  Add newline when generating Dockerfile

Alex Bennée (6):
  Makefile: add GNU global tags support
  Makefile: wrap ctags in quiet-command calls
  Makefile: wrap etags in quiet-command calls
  Makefile: wrap cscope in quiet-command calls
  docker: expand debian-amd64 image to include tag tools
  gitlab: move docs and tools build across from Travis

Philippe Mathieu-Daudé (2):
  tests/docker: Remove Debian 9 remnant lines
  shippable.yml: Remove jobs duplicated on Gitlab-CI

 Makefile                                     | 46 ++++++++++++++++----
 .gitignore                                   |  3 ++
 .gitlab-ci.yml                               | 22 +++++++---
 .shippable.yml                               | 14 +-----
 .travis.yml                                  | 16 -------
 tests/docker/Makefile.include                |  1 -
 tests/docker/docker.py                       |  4 +-
 tests/docker/dockerfiles/debian-amd64.docker |  5 ++-
 8 files changed, 64 insertions(+), 47 deletions(-)

-- 
2.20.1


