Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79564898DC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 13:52:09 +0100 (CET)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6u9f-0003Ux-5S
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 07:52:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6u4S-0002cs-1d
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:46:44 -0500
Received: from [2a00:1450:4864:20::435] (port=38434
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6u4P-0003r6-Rt
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:46:43 -0500
Received: by mail-wr1-x435.google.com with SMTP id a5so22595379wrh.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 04:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MOIUhQN2Q/I6XDHpzrKE5W+6dOUfWBTT0LQhMx+hWY=;
 b=HvjeQbpa4Z4dgfOy9E5cRMHQYhMUbQBeLUVAYcff93CVuuyQNChO6ZqvFGCokdfmLc
 rCaM/XtUarmdwJL15PkKzc7hOfJuKJeu1C6FXlqFL6olqc+a29RX1nkTfB+VG0zi6Ipu
 WhPYfiakujoEKCo25l5BjnAZ+ogQDyGMmnTWhti/3ykuf2GBbXwg1UFZhAP18q4riTWz
 htZUWQ6B5BOPn73QdmcDswq4DwDP4iN+Aj3l6LAe4ylS63LXsR3Q+vM8uz7YEfoFP1YU
 L3Echk9ZK4ZwF6AFjE7n37fPFxC1ygNSE8LgH7d4TOgSEx55D/Xzj6cYUpHJPGhbE/Dr
 qbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6MOIUhQN2Q/I6XDHpzrKE5W+6dOUfWBTT0LQhMx+hWY=;
 b=lHWuoLEZVhIyn82BeeUygfyeJJmSR4VZhdcNSGZDusT6Dxwo1G0uZ+b36nUVSS5Lpk
 HSkiFjlveYackFg9hyd9O15xMC1QvOSe/OJytxCpBevjDi+NggT8AxDr28tiTZAJRfkP
 OBAFGK3YUDSny5sKeDwe5N2x2zOKLazmS6hGvWyRZ1PDkGFS7NdhVUOE7lypiQ4P2HQA
 CmtHtop89L04XzPSDQUYzkTA4bCGI93qIRmZa0aO1z3/5fozLwIJ47bwl/z0YVo5GfiU
 amfT8/ymg+ojo+JX+SeAUj7Lwl2hUMRTWCP73OK33uPaX5sabRx3XOYFxeeNftqY86/g
 Sarw==
X-Gm-Message-State: AOAM532hOAov/Cn9ogvFdFxpyxQDrlnlvLwp4ipivnJjhS0+am8hE11y
 1Nw7pA0xVOYeW5+yBkj07N8NUADApaTSgA==
X-Google-Smtp-Source: ABdhPJyLHhUj3/gj41xDW/NYHtxO/vXVIvzr2oJJCUJIU3t9OiDUKRZs47o4pBoNZZd3+/7UsbT8jQ==
X-Received: by 2002:a05:6000:156c:: with SMTP id
 12mr63455231wrz.104.1641818800310; 
 Mon, 10 Jan 2022 04:46:40 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id bh10sm6528052wmb.12.2022.01.10.04.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 04:46:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests: Refresh lcitool submodule
Date: Mon, 10 Jan 2022 13:46:36 +0100
Message-Id: <20220110124638.610145-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refresh lcitool to latest.=0D
=0D
Based on Alex's testing/next=0D
Based-on: <20220105135009.1584676-1-alex.bennee@linaro.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  MAINTAINERS: Cover lcitool submodule with build test / automation=0D
  tests: Refresh lcitool submodule=0D
=0D
 MAINTAINERS                                   | 1 +=0D
 tests/docker/dockerfiles/alpine.docker        | 3 ++-=0D
 tests/docker/dockerfiles/centos8.docker       | 3 +--=0D
 tests/docker/dockerfiles/fedora.docker        | 3 +--=0D
 tests/docker/dockerfiles/opensuse-leap.docker | 2 +-=0D
 tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-=0D
 tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-=0D
 tests/lcitool/libvirt-ci                      | 2 +-=0D
 8 files changed, 9 insertions(+), 9 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

