Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383322D9F5C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:42:20 +0100 (CET)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosna-0001DG-Q0
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjC-00082z-Nj
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:37:46 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjA-0007M4-IG
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:37:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a11so9705242wrr.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AG2rQ9Qtoq4dN1hxG3H/JYpJcOn2clPmULTzCCQTdSg=;
 b=dofAUxB8rl9deqttLdM9wJfdeOk+uMF9M+K33hBsYpo6ml/65Tvhhrx/vtw3QNHAMr
 wSHc6Q39uT6NgKHt6Z6400LcxQETiWX1FW2d0qESbGYMMR86dXK8xVcKc3da0RPmibJR
 Cft0X489fWZYC/kOlyTFkay+KSGwphpCPV7N9LIl/yWbPhdZZOxCdnJVliQ8BWgfQbbj
 mlOIg/YOIAnZFdrcEWMRDwaz1PBl4/KAq1BJzZK8k19847lFj0+KnTvIDxMZDxoYkNEA
 aTChfn07kynPe6FJ1On4KKkkAnMGA4Ceo3KLPvL4Z/kGzMMDbHCTfnLesTe5xdA8XHFA
 0d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AG2rQ9Qtoq4dN1hxG3H/JYpJcOn2clPmULTzCCQTdSg=;
 b=tWsI9ohAkS3nZq6UbN00p5UywhvTOpUNB+6DrGwkJrc6+7cOlTwBCI4ssIWHyQeDsu
 3Uqev35gIomxobLzprwlUc3FX2oRwqCuiEQTkreqxbv3pSoHMr7qLm+QyzbXuWXcpkfL
 TxWG7hJXBfnhnHqJtboDXYu0xmWzCeQjwgHAypwlj+PgWQOEgl63WwEydL/5uzGPiIUW
 2yvEG3PDGcEcfPbHcLJFBbi8QOYuZM+w4K+S9r67NKqRHtbI1jdpu5gEP9wXabYbKLbE
 agYXncFFmpbf1+HsRtCV4hxfFY1/6xCoyphDPNF5XgAVQwh/k4W0kPMTNyRnBch5gd4j
 +GEA==
X-Gm-Message-State: AOAM531cgXzL5H0OP0Ad6AE4p5vyAMMLHH8ywxizBetcNkLxP6iiBdLl
 BDcRqtAym89L6Y0WVUid6xu5ysEfr7E=
X-Google-Smtp-Source: ABdhPJyGIAR0xFDE405UQS33tC5brIhj4plOxCsmIutdMpwyktpCHuGbf+AeTk8Lgn6viqQ6dVnD1g==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr22567213wrr.9.1607971062134;
 Mon, 14 Dec 2020 10:37:42 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v11sm3413358wrt.25.2020.12.14.10.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:37:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/16] target/mips: Boring code reordering + add
 "translate.h"
Date: Mon, 14 Dec 2020 19:37:23 +0100
Message-Id: <20201214183739.500368-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series contains the patches previously sent in "Boring code=0D
reordering" [1] and "Add translate.h and fpu_translate.h headers"=0D
[2]. I removed the patches merged and addressed Richard review=0D
comments.=0D
=0D
Missing review: 1 3-5 9-11 14 15=0D
=0D
Available as:=0D
  https://gitlab.com/philmd/qemu/-/commits/refactor_translate_h=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Based-on: https://gitlab.com/philmd/qemu.git tags/mips-next=0D
Supersedes: <20201206233949.3783184-1-f4bug@amsat.org>=0D
Supersedes: <20201207235539.4070364-1-f4bug@amsat.org>=0D
=0D
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg764551.html=0D
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg764828.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (16):=0D
  target/mips: Inline cpu_state_reset() in mips_cpu_reset()=0D
  target/mips: Extract FPU helpers to 'fpu_helper.h'=0D
  target/mips: Add !CONFIG_USER_ONLY comment after #endif=0D
  target/mips: Remove consecutive CONFIG_USER_ONLY ifdefs=0D
  target/mips: Extract common helpers from helper.c to common_helper.c=0D
  target/mips: Rename helper.c as tlb_helper.c=0D
  target/mips: Fix code style for checkpatch.pl=0D
  target/mips: Move mmu_init() functions to tlb_helper.c=0D
  target/mips: Rename translate_init.c as cpu-defs.c=0D
  target/mips: Replace gen_exception_err(err=3D0) by gen_exception_end()=0D
  target/mips: Replace gen_exception_end(EXCP_RI) by=0D
    gen_rsvd_instruction=0D
  target/mips/translate: Extract DisasContext structure=0D
  target/mips/translate: Add declarations for generic code=0D
  target/mips: Declare generic FPU functions in 'translate.h'=0D
  target/mips: Extract FPU specific definitions to translate.h=0D
  target/mips: Only build TCG code when CONFIG_TCG is set=0D
=0D
 target/mips/fpu_helper.h                      |  59 ++=0D
 target/mips/internal.h                        |  52 +-=0D
 target/mips/translate.h                       | 166 ++++=0D
 linux-user/mips/cpu_loop.c                    |   1 +=0D
 target/mips/cpu.c                             | 243 ++++-=0D
 target/mips/fpu_helper.c                      |   1 +=0D
 target/mips/gdbstub.c                         |   1 +=0D
 target/mips/kvm.c                             |   1 +=0D
 target/mips/machine.c                         |   1 +=0D
 target/mips/msa_helper.c                      |   1 +=0D
 target/mips/op_helper.c                       |   2 +-=0D
 target/mips/{helper.c =3D> tlb_helper.c}        | 260 ++---=0D
 target/mips/translate.c                       | 897 ++++++++----------=0D
 .../{translate_init.c.inc =3D> cpu-defs.c.inc}  |  50 +-=0D
 target/mips/meson.build                       |  10 +-=0D
 15 files changed, 903 insertions(+), 842 deletions(-)=0D
 create mode 100644 target/mips/fpu_helper.h=0D
 create mode 100644 target/mips/translate.h=0D
 rename target/mips/{helper.c =3D> tlb_helper.c} (87%)=0D
 rename target/mips/{translate_init.c.inc =3D> cpu-defs.c.inc} (96%)=0D
=0D
-- =0D
2.26.2=0D
=0D

