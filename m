Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF433A739
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 18:53:59 +0100 (CET)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLUwA-0000RM-Ld
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 13:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsq-0004N5-E0
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsn-0006eH-Jl
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id g8so6809265wmd.4
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZMZr0coHzueub1sILoBkXAANm74sgodlaSTxFzPXWuo=;
 b=jIMZMRq3UL/wf7v28/oVJdeVQ3oaXxcVjMp3bd1OniddaVmw/I9aBAfl73tt/HZQse
 TZLrzzqf3S+W8JRcgrdYf8hTrWComSlMZkhb2r/GIwXb504H2eOXA/sywcSdMiQfv3uV
 18mFBUqDBD8vkWE80U18AFC7si33s3cy6hj6UAjg4MR21P6PRocRuqQ8VVquTMwKndpQ
 a93TeQvnedAGLR3WjFpjsZglLkI6b08z58+ataHchiuK8eCTrJDQlZP2Nq+zNLEfbRXF
 AV3WK5NAGQ6MV07+is0IZEgVpppIIxeix6k7xgur3IlcP8IaJ0fMpSo1UTOGP/AYsJNn
 DMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZMZr0coHzueub1sILoBkXAANm74sgodlaSTxFzPXWuo=;
 b=FE53ClGhCY1J/8RhVGgJQJcc5/uJzjqD6Nl3xWh4VMFkvNTjdKwAEINMm8VeDlK4Oz
 hZ7k0KxxqPPyp5fOAYI6akuEbJRadm12ilczisLZz0mx6wE3uQIQBKRRC1ewtfXulwsb
 anCkyjp/xt3k3b84gY9T0xDIFc2GVOc+FOCj6ZZfeM5ZTCq75HtdzMEcUaXsXpYP4W1N
 ulalAZwblo8keA5UvTE7HEWUFjmMWMjhfpoUTWLLrorMxfeP0q4U2/fR+tPFIHt8vS6T
 o708LkYGxu7SCScpY6uEblb0H0EZWlCxZCrK5UBP/4CM6DE1uVrBHxJcL6PHFV0A57gz
 R97A==
X-Gm-Message-State: AOAM532mEcBKfLuXduY7Bb0rjNftRwrq/e4JQzRmvKUX7hDV4hO/64di
 HpXm79RGyo8G9b04+ROQrZuJ4ItO37Y=
X-Google-Smtp-Source: ABdhPJxfxgYpYeuBP7qfEvWzA770lyBB1hyUhKcF7p4AvNexM+gh3+dol2uzC+uNGISjIDRbWvuzQw==
X-Received: by 2002:a1c:1f94:: with SMTP id
 f142mr22779410wmf.180.1615744227092; 
 Sun, 14 Mar 2021 10:50:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a6sm11442749wmm.0.2021.03.14.10.50.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:50:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Meson version update
Date: Sun, 14 Mar 2021 18:50:20 +0100
Message-Id: <20210314175025.114723-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-meson-0.57

for you to fetch changes up to ddbac656401866a1a48d4829b5d02c239d1e8fc3:

  hexagon: use env keyword argument to pass PYTHONPATH (2021-03-13 19:26:03 +0100)

----------------------------------------------------------------
Update Meson to 0.57.

----------------------------------------------------------------
Paolo Bonzini (5):
      hexagon: do not specify executables as inputs
      hexagon: do not specify Python scripts as inputs
      meson: bump submodule to 0.57.1
      meson: switch minimum meson version to 0.57.0
      hexagon: use env keyword argument to pass PYTHONPATH

 configure                               |  7 +----
 docs/meson.build                        | 12 ++++----
 meson                                   |  2 +-
 meson.build                             | 54 +++++++++++++++------------------
 plugins/meson.build                     |  4 +--
 scripts/mtest2make.py                   |  7 ++---
 target/hexagon/meson.build              | 37 ++++++++--------------
 tests/docker/dockerfiles/centos7.docker |  2 +-
 tests/meson.build                       |  2 +-
 tests/qapi-schema/meson.build           |  4 +--
 tests/qtest/meson.build                 |  2 +-
 trace/meson.build                       |  4 +--
 12 files changed, 57 insertions(+), 80 deletions(-)
-- 
2.29.2


