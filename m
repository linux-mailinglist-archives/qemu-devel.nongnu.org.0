Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E47284B66
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 14:11:06 +0200 (CEST)
Received: from localhost ([::1]:43438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPlo9-0003bt-4X
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 08:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPlmS-0002cd-2B
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:09:20 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPlmQ-0004AB-20
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 08:09:19 -0400
Received: by mail-pf1-x435.google.com with SMTP id w21so8896842pfc.7
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=liAqzqJi6x0FFlXweFeNjShDJp3/OT1BsfjThbI6yqw=;
 b=H1XhP/OWEnAgwAKQQ62JO3GDQQwqpuu9FXlXrX0+q5zfTO+9BGN1Nqp4hq4IArw53V
 8KN/XxG7B/ZaWbTBZFvMQ3tXbj1MBhCbIAYb4Y1a322uZp4NknP0tuWmZswr05gY+DwC
 dOPlh3hZ7eSvAtgl6SoM89zjc9MQSaqTQ6LGEehb7NlNaazZ13NU/NdmXe5Ux7v/U0vL
 QxQ9vTmhvoTlvYJVoU9xIzEDJxNiUXVK3bahEPep4jpb6+6tFYlUXQ6WSXZ4mM9/ea8p
 gllYESLQbv+ZB3ytwu6xoehTptqu+c61IuZ6POs91HKUn2ntNc5gdhkzqOkf19FWyXnJ
 EC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=liAqzqJi6x0FFlXweFeNjShDJp3/OT1BsfjThbI6yqw=;
 b=mwboi+hW0mREW32Z+iCCCMlfXsDir1ah3dB8YYQldDNk04n5500hFfH2TBLDarfrHu
 m0YTVF1QtnDLkDaVsQIVhhqQToA1k3C24LmR+L/W1NZxuVyZKHBgGcHwKmRm4AOBmg5c
 Je56hPdrQl/9t9H77aoewWLfyrt0t6ka9ZsYoK99ZTHXUeuBR+14Z02dCdXBSN3SkvHN
 Tds0Th1FoqerKDgAW8bbdSEp2cuzspaxvMqZYZjoZyUd8ZnPPcRzAa/LaqXzaw9eP4dC
 sC9qQlrQS28dKPwPylIw9pMm/MgTZV4323xYPiKyM3lxQc5WLNP1Cre39Wt2LxsCGMNv
 G2Zw==
X-Gm-Message-State: AOAM530MsFBncxYonG+EVGkqwa9QF6RQNfEuL0Yd3to9M2JErPfbG4I5
 hrU5/GdkzQ+eKq66NFkOWn58KTag3gzOmg==
X-Google-Smtp-Source: ABdhPJwN5WSKLUQFSd6R69fuwldB9NlfAnOfOkRQ3zLZNT/Ux1vQhAgbh8jM/s/f/il11N+ylvKtrg==
X-Received: by 2002:a63:5966:: with SMTP id j38mr3722471pgm.187.1601986155980; 
 Tue, 06 Oct 2020 05:09:15 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id f4sm2965681pgk.19.2020.10.06.05.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 05:09:15 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/7] Enable plugin support on msys2/mingw
Date: Tue,  6 Oct 2020 20:08:53 +0800
Message-Id: <20201006120900.1579-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x435.google.com
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
Yonggang Luo (7):=0D
  plugins: Fixes a issue when dlsym failed, the handle not closed=0D
  plugin: Fixes compiling errors on msys2/mingw=0D
  plugin: getting qemu_plugin_get_hwaddr only expose one function=0D
    prototype=0D
  plugin: Fixes typo in qemu-plugin.h=0D
  plugin: Getting qemu-plugin works under win32.=0D
  plugin: Getting qemu-plugin.h can be included in multiple source file=0D
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

