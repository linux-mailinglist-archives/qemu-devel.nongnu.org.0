Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100042D9067
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:21:48 +0100 (CET)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXsJ-0002EA-1M
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqT-0000nj-3M
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:19:53 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqR-0004zG-9b
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:19:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id w5so10654345wrm.11
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6aT0hnxN9Lk7mHwwTD8w8mjwYa5KaIbUi6jXCtHBCQM=;
 b=RXb4/2mjYb9G+dykIme3OPCkocGwJCGkzuu8clS4GEEKO6f7cta1u/r1bQAFbtjYbs
 /zKjnseBBJh+zQECv52jnZTPvPGT/ymFWc7pDbD90QNaj5dz37UZWRkhTBk7FY+rgDjt
 F+QlCoK1mzZabzzXwrCUAfOZqQSLPqqCRA2giCqCJqAcuQBzWZOp2daV1r3sVprGWe0b
 BjnWngxp7PVwrZb9yFA/RrSFnGcOtriXO9yUNmuBORsTQamxRLCuxwarWFm0qFSwCMdM
 7rzqFzD//+hkRkbjZmQcS9njY7E3xJBd6R450w3pqn4/J07XCNd3E/rmy7hUSHhV0Vp2
 3IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6aT0hnxN9Lk7mHwwTD8w8mjwYa5KaIbUi6jXCtHBCQM=;
 b=BY4XTdmcQRGXMSVRMkKzSzRWFYfsleHUzCmKtxuvkOtkpKNE2Q0XXbGnW54HKjFJH6
 pxBHaXXakYVdvNSB4PwbUB8up0ygjOjoybLTMShZ8wdgTcfXcpGyu59j20MvCeMV2lwI
 fEaS2tFAX7+gBWTEuXENnmvpqobrp11iVfGCAd2RkNhfTuHctrwG9dYj6csTYdEGpZZM
 2eiLZ7HzFgMu+iewVxEisskLyMZJhKFyfiO3iUCXMsMkldWdUEGXKkssuDuk+2ZaEcN0
 DHPV286WiqJ0WjLMTC9gm0qI2VoD82qi2gMUezTuumXmtAgAQGHISGWFITLcrsxks6/b
 kLZg==
X-Gm-Message-State: AOAM530TPL7o234o1lGPDUfUIbCP4pXCPNVNzMzmdKvlGJRDwDf3kBuZ
 sfGlG3uu0koiAXq/YcCVRvCDqIpbdsA=
X-Google-Smtp-Source: ABdhPJzLu1l79ty9fZ484FlDoec/3Llbbu/ND5f33k0x8Pjnud30Pvq+O1w+UgnL5w5ESi994IyXZA==
X-Received: by 2002:adf:c454:: with SMTP id a20mr25225088wrg.314.1607890789069; 
 Sun, 13 Dec 2020 12:19:49 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id i9sm31558614wrs.70.2020.12.13.12.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:19:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] MIPS patches for 2020-12-13
Date: Sun, 13 Dec 2020 21:19:20 +0100
Message-Id: <20201213201946.236123-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ad717e6da3852b5729217d7938eecdb81c546114=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into stagi=
ng (2020-12-12 00:20:46 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/mips-20201213=0D
=0D
for you to fetch changes up to 3533ee301c46620fd5699cb97f2d4bd194fe0c24:=0D
=0D
  target/mips: Use FloatRoundMode enum for FCR31 modes conversion (2020-12-=
13 20:27:11 +0100)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
. Allow executing MSA instructions on Loongson-3A4000=0D
. Update Huacai Chen email address=0D
. Various cleanups:=0D
  - unused headers removal=0D
  - use definitions instead of magic values=0D
  - remove dead code=0D
  - avoid calling unused code=0D
. Various code movements=0D
=0D
CI jobs results:=0D
  https://gitlab.com/philmd/qemu/-/pipelines/229120169=0D
  https://cirrus-ci.com/build/4857731557359616=0D
----------------------------------------------------------------=0D
=0D
Huacai Chen (1):=0D
  MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org=0D
=0D
Philippe Mathieu-Daud=C3=A9 (25):=0D
  target/mips/kvm: Assert unreachable code is not used=0D
  target/mips/kvm: Remove unused headers=0D
  target/mips: Include "exec/memattrs.h" in 'internal.h'=0D
  target/mips: Replace magic values by CP0PM_MASK or=0D
    TARGET_PAGE_BITS_MIN=0D
  target/mips: Do not include CP0 helpers in user-mode emulation=0D
  target/mips: Remove unused headers from cp0_helper.c=0D
  target/mips: Also display exception names in user-mode=0D
  target/mips: Allow executing MSA instructions on Loongson-3A4000=0D
  target/mips: Explicit Release 6 MMU types=0D
  target/mips: Rename cpu_supports_FEAT() as cpu_type_supports_FEAT()=0D
  target/mips: Introduce cpu_supports_isa() taking CPUMIPSState argument=0D
  hw/mips: Move address translation helpers to target/mips/=0D
  target/mips: Remove unused headers from translate.c=0D
  target/mips: Remove unused headers from op_helper.c=0D
  target/mips: Remove mips_def_t unused argument from mvp_init()=0D
  target/mips: Introduce ase_mt_available() helper=0D
  target/mips: Do not initialize MT registers if MT ASE absent=0D
  hw/mips/malta: Do not initialize MT registers if MT ASE absent=0D
  hw/mips/malta: Rewrite CP0_MVPConf0 access using deposit()=0D
  target/mips: Extract cpu_supports*/cpu_set* translate.c=0D
  target/mips: Move mips_cpu_add_definition() from helper.c to cpu.c=0D
  target/mips: Move cpu definitions, reset() and realize() to cpu.c=0D
  target/mips: Inline cpu_mips_realize_env() in mips_cpu_realizefn()=0D
  target/mips: Remove unused headers from fpu_helper.c=0D
  target/mips: Use FloatRoundMode enum for FCR31 modes conversion=0D
=0D
 include/hw/mips/cpudevs.h        |   7 -=0D
 target/mips/cpu.h                |  20 ++-=0D
 target/mips/internal.h           |  17 +-=0D
 hw/mips/boston.c                 |   5 +-=0D
 hw/mips/cps.c                    |   3 +-=0D
 hw/mips/malta.c                  |  14 +-=0D
 {hw =3D> target}/mips/addr.c       |   2 +-=0D
 target/mips/cp0_helper.c         |  15 +-=0D
 target/mips/cpu.c                | 299 ++++++++++++++++++++++++++++++-=0D
 target/mips/fpu_helper.c         |   6 +-=0D
 target/mips/helper.c             |  64 ++-----=0D
 target/mips/kvm.c                |  11 +-=0D
 target/mips/op_helper.c          |   4 -=0D
 target/mips/translate.c          | 262 ---------------------------=0D
 target/mips/translate_init.c.inc |  10 +-=0D
 .mailmap                         |   2 +=0D
 MAINTAINERS                      |   8 +-=0D
 hw/mips/meson.build              |   2 +-=0D
 target/mips/meson.build          |   3 +-=0D
 19 files changed, 378 insertions(+), 376 deletions(-)=0D
 rename {hw =3D> target}/mips/addr.c (98%)=0D
=0D
-- =0D
2.26.2=0D
=0D

