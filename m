Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711833481B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:38:05 +0100 (CET)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4eh-0000TV-Ua
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4R0-00066G-JK
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:57 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qk-0002iY-8D
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:54 -0500
Received: by mail-ej1-x630.google.com with SMTP id dx17so41034985ejb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zcMWgz0RcLjvn27F3ptWXilp8cr/GI183MhOdE6gdTc=;
 b=CJWwspPDe2nYXcP4NPPNk32r/MkKb1EaHVp67pNj2f3sILI1kNlBybE8todOghtHu8
 XAseEY2B5X0aPodZeCFc1WrsD5HH095V2G8l0KIEuPnv9DueFiVlY1HkBONW0vFkWCPO
 RNyOa7PsFnSwZMUYHPrfKH9ihFaa2bxHA6sppQgeRvVZavBY9uLTsgeyzP5nUpOxUBcO
 W4r3A6nm+xpVzvVLsraIWgkW1Yw4zwRMdmnlA7fjfdCzm8CIgmaSaGO59mbSMeUwJZr0
 xyRfSccOd+w98OLgLZQSr6hwvK74kwI+sUCeE5slvgvLdAMXlkhSr9a/xcgUV5EVWkRK
 JGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zcMWgz0RcLjvn27F3ptWXilp8cr/GI183MhOdE6gdTc=;
 b=cC9Q2bCH6KiXMSfWqolc4Px8SgQZw9XMmBAeJm5+S65Ob9xr92T7fhb5I8tkr/7mnW
 pD6g72mgIF9vXh13Zgbmr8njl6jqduKdjLsA68YKxHwh8+EAX57OMwyNwTdcl9YyFU4N
 o8l99kkWmHsrio3u4unMEnTe9m4nnwDATkCkBgxhfIXzLZRqk70/JvXzbQ9/ojOluyje
 HHmPjS30ImcfB68tgrX91AF5c9B17B1t4jnsY6UldkePNOthtRiwZtrB65zKR8LCQ11d
 R0sjnBsZ5+c8uzBt0Wrf5JvUFk6UKe/TPcLu97EzEid8n1+VzNWh9aTtFOUwr7gSAYDL
 Op0A==
X-Gm-Message-State: AOAM5315qjFQ0BaLnMw8KEqKvO5MqUU8RzNZpcxt8E7Z/+gAZQ1fAvc8
 e86ovYw5aXhI6baMBmZtMEaq/g==
X-Google-Smtp-Source: ABdhPJwhKlZ7oXVLG1X98Ce10XtqXi+be1of777SgdvTl4smUCjvHymtdZuX8pY3L9HZwC3MOYjtRA==
X-Received: by 2002:a17:906:a443:: with SMTP id
 cb3mr10559ejb.542.1615404216251; 
 Wed, 10 Mar 2021 11:23:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id hd8sm175443ejc.92.2021.03.10.11.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:23:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D117D1FF7E;
 Wed, 10 Mar 2021 19:23:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/7] testing/next (hexagon 2, electric boogaloo)
Date: Wed, 10 Mar 2021 19:23:24 +0000
Message-Id: <20210310192331.29284-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is basically the bits I dropped out of the in-flight PR:

  pull-testing-docs-xen-updates-080321-2

In an attempt to avoid docker caching shenanigans I basically took the
fugly hammer to our existing over-engineered docker.py script to grow
new features to handle the case of images we don't want users to build
normally. I'm open to better approaches.

 - docker: Add Hexagon image
 - tests/docker: add "fetch" sub-command
 - tests/docker: allow "update" to add the current user
 - tests/docker: make executable an optional argument to "update"
 - tests/docker: fix copying of executable in "update"


Alessandro Di Federico (2):
  docker: Add Hexagon image
  tests/tcg: Use Hexagon Docker image

Alex Bennée (5):
  tests/docker: fix copying of executable in "update"
  tests/docker: make executable an optional argument to "update"
  tests/docker: allow "update" to add the current user
  tests/docker: add "fetch" sub-command
  gitlab: add build-user-hexagon test

 .gitlab-ci.yml                                |  11 ++
 MAINTAINERS                                   |   2 +
 tests/docker/Makefile.include                 |  24 ++-
 tests/docker/docker.py                        |  78 +++++++---
 .../dockerfiles/debian-hexagon-cross.docker   |  44 ++++++
 .../build-toolchain.sh                        | 141 ++++++++++++++++++
 tests/tcg/configure.sh                        |   4 +
 7 files changed, 282 insertions(+), 22 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
 create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh

-- 
2.20.1


