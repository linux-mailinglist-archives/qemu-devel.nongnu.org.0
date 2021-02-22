Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5C3213FB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:20:12 +0100 (CET)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8K3-0003zM-Kc
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F4-0007ul-Js
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:02 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F1-0005F6-AX
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:02 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o82so12990580wme.1
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c7e36pAUIHvrvPvy/QxxH3kdAPnP0yKca6cV1ILXWx4=;
 b=ObkaKVUWfFjgjTfnOi0QFcVNSVyWxo7mcdQE1IjgdJNqbThZubAPWF4DYilxYTssj0
 G6CNN3zfGAuVi5gTJCL1OYJA61IFih29vAaE3X2M0mpUNR4WsmlbGdffnbQoDdQKPI0i
 fKoGvFzg3HfbQuY3sDn0wpZOfN7uicJKrcEUvaRlmqftmbXDhAoPJo7x+kBW4bUmwXtX
 Zlt3f274CepskRWjVgJ5BR/6tW+KXEpOnwrItLmP2NxWbzi1s+4Arp9383u25CJ0SCSy
 AUVmH+nxrgTIBjw0ukC52mU896lI6qnl/csWQJegJKpisZw0hO9Te8kcLraN1HHZHShv
 UtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c7e36pAUIHvrvPvy/QxxH3kdAPnP0yKca6cV1ILXWx4=;
 b=RD9wScXNjiqPNf+yCtjDrpwEIkxfe9i6wItwyZMpceZ30PLEDG17MxTllDPxE1p+ap
 73cuje/MphnwlMqfm15iQRiiQu4UL8E7bHICVL+G9o8gBoSyupaA5gjLI2AlfAofIZtH
 BREvlOxXdZ71ySxtTAiM2iMAENAQ99trEe5A99Mtm9ZFxHUryyGfnor2qa6RSP4gMx7M
 K5FIMtWQj13HeMWrmNWOhcVOFu5MAiBZJLEgd/2ttrpblqer6oNvEuf3YdlvH4jjLqpS
 WuGbGc5Nnmy5njevWJDdUYiqZnSOiPHMdAw3hveR+oyQ4ZcueIyg70V06Z820ZMsiUqK
 /YhQ==
X-Gm-Message-State: AOAM533a8m0kyP1XCzOWuf9f07PenbGRTHF8xr1VNUBwTwaU4pgxtmzZ
 3XD0ftFMxPVPsHUmCdi0KazcUQ==
X-Google-Smtp-Source: ABdhPJw6nGg6/1hfVN0OQ88Sr5ZFe+8HB7t8eO0TgYAsv7gfBDbph1+xptjNcVP6MRPGTS7VXVWx0w==
X-Received: by 2002:a1c:2090:: with SMTP id
 g138mr19461745wmg.137.1613988897508; 
 Mon, 22 Feb 2021 02:14:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l22sm23172425wrb.4.2021.02.22.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:14:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C02DA1FF7E;
 Mon, 22 Feb 2021 10:14:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 0/6] testing/next (meson check-tcg, fedora bump, docs)
Date: Mon, 22 Feb 2021 10:14:49 +0000
Message-Id: <20210222101455.12640-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

A few patches dropped off as Thomas merged them. I've added some
additional documentation patches for testing.rst. I guess I'll wrap
this up into a PR later this week. The docs patches need review:

 - docs/devel: add forward reference to check-tcg
 - docs/devel: update the container based tests
 - docs/devel: expand on use of containers to build tests

Alex Bennée (5):
  meson.build: expose TCG cross compiler information in summary
  tests/acceptance: allow a "graceful" failing for virtio-gpu test
  docs/devel: expand on use of containers to build tests
  docs/devel: update the container based tests
  docs/devel: add forward reference to check-tcg

Philippe Mathieu-Daudé (1):
  docker: Bump Fedora images to release 33

 docs/devel/testing.rst                        | 85 ++++++++++++++-----
 meson.build                                   | 18 ++++
 tests/acceptance/virtio-gpu.py                |  7 +-
 .../dockerfiles/fedora-cris-cross.docker      |  2 +-
 .../dockerfiles/fedora-i386-cross.docker      |  2 +-
 .../dockerfiles/fedora-win32-cross.docker     |  2 +-
 .../dockerfiles/fedora-win64-cross.docker     |  2 +-
 tests/docker/dockerfiles/fedora.docker        |  2 +-
 tests/tcg/configure.sh                        |  8 --
 9 files changed, 93 insertions(+), 35 deletions(-)

-- 
2.20.1


