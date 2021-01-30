Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46BC30915B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 02:54:14 +0100 (CET)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fSn-00088Q-C2
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 20:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRE-0006eV-48; Fri, 29 Jan 2021 20:52:37 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fRC-0008R5-7D; Fri, 29 Jan 2021 20:52:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id i9so8542510wmq.1;
 Fri, 29 Jan 2021 17:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=adQegksKyg6ypqy8yaNY4IxRFUUd8NlguDdBcG0O0Dc=;
 b=Jify+HIvCRI6v2kFDWjTZrLVCkFPKsirwWVmqbOedbFWxEWVegCK8Kfa5vj1pFUxNR
 uVc5o1KEC4qiu0zDMpLGV/D0/60D4MPbPGua/hCXEYPst1Gv7htKhNx4uEL6eT4mq1+u
 xrIxvT+4cmFzEtGbbarSXi7wPPUsqpBBh2xGR088evTJQDO5hPAkzcAnHItmWFdxuCtm
 th5XWIsnQ2N49bSnJC6+lJtaNE46hgI0naP5dMuR0EKp4QP815M06UqGrxn62rOTX72K
 b4eZU7IMeR8PULGxqjQi4Df8MG49oURxPLIda+TTg4pBpWCFlHieW7lxwh/2o1n0irDR
 eUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=adQegksKyg6ypqy8yaNY4IxRFUUd8NlguDdBcG0O0Dc=;
 b=GMSbOc+AXpxK5tG3wl6ZRt8mpXSKIRl6A33dDWSY3dQvubTuE1SGFH7Mz5JyB5A4o4
 peE7ojJDTLb02XxKgjhsJ1alzzdqHM2Xj8ZLvqIAcVIDidgHAVjcFAs6ezANkp5HFZGZ
 tCE7vKIpVOKMZJLkDYARdzsRJAjKe8RXRyR7S1nAGLLoL6zEK5ruVwkUMzUvZyYZhBNZ
 v6V/o0YmNduXrcWI55hfgHZmAaQdECgwtg7PxakD6wjMfbZrqBJwyPz6NbO5a4NkLr8Q
 6ZXsSLEeyqfCtOiAeM9BvnxdaifGH2g4t42k+jBzTu/QQxL+HeiFlrXpqKQWoQ0zT/f+
 DOmw==
X-Gm-Message-State: AOAM531P5o7rk4buii3Su1HNOT3wWRqXN0th49MdTbqSwOYbFanwwlrb
 OMdbhJA85VDf9XaMPOxhUCB7m4FecUc=
X-Google-Smtp-Source: ABdhPJzAZ1zraX1+wErsQAoxLg/4/5cge/k+zf+9AXuQRmCgsUUA0TAkV3aDzuzdcsuTqEd2pjPmTg==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr1504698wme.147.1611971550627; 
 Fri, 29 Jan 2021 17:52:30 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e4sm15520107wrw.96.2021.01.29.17.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:52:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/11] Support disabling TCG on ARM (part 2)
Date: Sat, 30 Jan 2021 02:52:16 +0100
Message-Id: <20210130015227.4071332-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cover from Samuel Ortiz from (part 1) [1]:=0D
=0D
  This patchset allows for building and running ARM targets with TCG=0D
  disabled. [...]=0D
=0D
  The rationale behind this work comes from the NEMU project where we're=0D
  trying to only support x86 and ARM 64-bit architectures, without=0D
  including the TCG code base. We can only do so if we can build and run=0D
  ARM binaries with TCG disabled.=0D
=0D
v5:=0D
- addressed Paolo/Richard/Thomas review comments from v4 [5].=0D
=0D
v4 almost 2 years later... [2]:=0D
- Rebased on Meson=0D
- Addressed Richard review comments=0D
- Addressed Claudio review comments=0D
=0D
v3 almost 18 months later [3]:=0D
- Rebased=0D
- Addressed Thomas review comments=0D
- Added Travis-CI job to keep building --disable-tcg on ARM=0D
=0D
v2 [4]:=0D
- Addressed review comments from Richard and Thomas from v1 [1]=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html=0D
[2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html=0D
[3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html=0D
[4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html=0D
[5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746041.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  exec: Restrict TCG specific headers=0D
  default-configs: Remove unnecessary SEMIHOSTING selection=0D
  target/arm: Restrict ARMv4 cpus to TCG accel=0D
  target/arm: Restrict ARMv5 cpus to TCG accel=0D
  target/arm: Restrict ARMv6 cpus to TCG accel=0D
  target/arm: Restrict ARMv7 R-profile cpus to TCG accel=0D
  target/arm: Restrict ARMv7 M-profile cpus to TCG accel=0D
  target/arm: Reorder meson.build rules=0D
  .travis.yml: Add a KVM-only Aarch64 job=0D
=0D
Samuel Ortiz (1):=0D
  target/arm: Do not build TCG objects when TCG is off=0D
=0D
Thomas Huth (1):=0D
  target/arm: Make m_helper.c optional via CONFIG_ARM_V7M=0D
=0D
 default-configs/devices/aarch64-softmmu.mak |  1 -=0D
 default-configs/devices/arm-softmmu.mak     | 28 --------=0D
 include/exec/helper-proto.h                 |  2 +=0D
 target/arm/cpu.h                            | 12 ----=0D
 hw/arm/realview.c                           |  7 +-=0D
 target/arm/cpu_tcg.c                        |  4 +-=0D
 target/arm/helper.c                         |  7 --=0D
 target/arm/m_helper-stub.c                  | 73 +++++++++++++++++++++=0D
 .travis.yml                                 | 32 +++++++++=0D
 hw/arm/Kconfig                              | 66 +++++++++++++++++--=0D
 target/arm/meson.build                      | 28 +++++---=0D
 11 files changed, 196 insertions(+), 64 deletions(-)=0D
 create mode 100644 target/arm/m_helper-stub.c=0D
=0D
-- =0D
2.26.2=0D
=0D

