Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA21283C7E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 18:30:05 +0200 (CEST)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPTNE-0000FA-1w
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 12:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPTLd-0007S8-8a
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 12:28:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPTLb-0006o4-MP
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 12:28:24 -0400
Received: by mail-pj1-x102c.google.com with SMTP id kk9so77221pjb.2
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqucitEH4/4+GS3KmukO0nlTVwKYBiH1PWiLYzxk3YM=;
 b=RL0UDXRuizz+aWjp1ng2Y1riRG1furOoFYce5B8k1088jongDp6tfLBvREwV3WkaB0
 IhcM0p9C2VE4tXcfIGE31zLZeIuIutm8ieW5ZABAoBB6mkDL92FXmccnhTihb7WDOwOz
 Zu7BO4qtZAtfNc777YmHDXyjHjaxUosGaueK1yT9jwq9nMHJ2EjzYmwWJ/rNPMOfVbjn
 NTbEDHDaAc/yrKk1Kg3pXlf8DEdN8wFphWNrwbuDhjzXyTNxOSRsbgIszhVmpUt7IOPO
 Mlfxd5lyOKvVtkO4/YnyR4O1PP/DgXMMOE32qC5I+RP8WEO46xIgT/y3c3MerGbfY9bj
 cQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uqucitEH4/4+GS3KmukO0nlTVwKYBiH1PWiLYzxk3YM=;
 b=VsPzXRQdjK0uFO8FpgswqcxN6IMgRG4s+Hv91IheUEqZYrjByNUb/0JJ44PJmjaXr0
 Ukv+bXFFng2JMFPbyfJA5690HjDpZhR1wWtlWl81QC3NeOw/sGLO758AppBuULYxiISP
 gXY6EzIM9sxyXESvbY7L8u2pvxpVekjQYcBAbWzPTzmp4HuvyfBw8Axs8muAgbT1Noww
 ApxXCrcRVMah68qMH3nF7RCnJEFOcb/ossZ6mhJ6JSKofV9BLaCp9N6wyt/0IacdpuUT
 q/OiZA2bzinmQz8FYFPmeXlzh4BJc81yjXdvskhGHUXSDM/8c//rjspr9UGzm8x3rI7F
 AY7Q==
X-Gm-Message-State: AOAM531cGAlald5Q02TdTh4IB3p6R8iRp63t4d1b9R0V3+OHp9C4IU1y
 ozgfOWydKVFPGNDdZys48p4EIpa/x+W2Lw==
X-Google-Smtp-Source: ABdhPJywz6sdmuk5Cx+GUrs5uFJbvruPte2mQ9hxexBKp4XQaLOY7gObpG3zRorfuVuGQgMVLObcnw==
X-Received: by 2002:a17:90a:e697:: with SMTP id
 s23mr228554pjy.16.1601915301419; 
 Mon, 05 Oct 2020 09:28:21 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id x13sm374725pfj.199.2020.10.05.09.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 09:28:20 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] Enable plugin support on msys2/mingw
Date: Tue,  6 Oct 2020 00:28:00 +0800
Message-Id: <20201005162806.1350-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V3-V4=0D
Split  plugin: Fixes typo in qemu-plugin.h out=0D
Trying to explain the design of=0D
plugin: Getting qemu-plugin works under win32.=0D
=0D
V1-V2=0D
1. Fixes review comments=0D
2. Increase QEMU_PLUGIN_VERSION to 1 for compat  QEMU_PLUGIN_VERSION 0=0D
3. Revise the loader to support for version 0 and 1=0D
4. By export function qemu_plugin_initialize in plugin, and call it in load=
er=3D=0D
, so=0D
  we have no need call it in every plugin. And also provide a standard impl=
em=3D=0D
entation,=0D
  anyway, use can also override it.=0D
=0D
Add this feature on msys2/mingw by using glib provided cross-platform dlsym=
 f=3D=0D
unctional.=0D
=0D
Yonggang Luo (6):=0D
  plugins: Fixes a issue when dlsym failed, the handle not closed=0D
  plugin: Fixes compiling errors on msys2/mingw=0D
  plugin: getting qemu_plugin_get_hwaddr only expose one function=0D
    prototype=0D
  plugin: Fixes typo in qemu-plugin.h=0D
  plugin: Getting qemu-plugin works under win32.=0D
  cirrus: Enable plugin in cirrus for windows=0D
=0D
 .cirrus.yml                  |   3 +-=0D
 Makefile                     |   1 -=0D
 configure                    |  71 -------------=0D
 contrib/plugins/hotblocks.c  |   3 +-=0D
 contrib/plugins/hotpages.c   |   1 +=0D
 contrib/plugins/howvec.c     |   1 +=0D
 contrib/plugins/lockstep.c   |   1 +=0D
 include/qemu/qemu-plugin.h   | 197 +++++++++++++++++++++++++++--------=0D
 meson.build                  |   6 +-=0D
 plugins/api.c                |  76 +++++++-------=0D
 plugins/core.c               |  16 ++-=0D
 plugins/loader.c             |  51 ++++++++-=0D
 plugins/meson.build          |  10 +-=0D
 plugins/plugin.h             |   1 +=0D
 plugins/qemu-plugins.symbols |  40 -------=0D
 tests/plugin/bb.c            |   5 +-=0D
 tests/plugin/empty.c         |   1 +=0D
 tests/plugin/insn.c          |   1 +=0D
 tests/plugin/mem.c           |   1 +=0D
 19 files changed, 272 insertions(+), 214 deletions(-)=0D
 delete mode 100644 plugins/qemu-plugins.symbols=0D
=0D
--=3D20=0D
2.28.0.windows.1=0D
=0D

