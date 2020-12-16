Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528812DC466
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:38:33 +0100 (CET)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZou-0005ry-DP
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZec-0004Bu-PE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:27:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpZeW-0007gS-Tm
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:27:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id 91so23767678wrj.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CDwlfEjRKdCc4qZBSft/xfvlstGd5zLwXY7YrvZUNmY=;
 b=FB8J6OPzh6bbV385UYI+KAaOcjNNHeFNQtp1+NtIMDgD0JjOMlk1GRnehE+NN5GqrT
 M/Pcggzok77OA+IRa+/aIVL1MCxewLa0+PjAvKm9T+ungHtY+3mkwGYkTLoHyoNgewNg
 U/7CChSli2Patmcg4MElbolLpMSiVY3JA0/Ib8NmH9A8X1cqbjwmBfYJCujpLmO12owM
 +X9d0AS1+eYi81+0QT7mKXX3rI8lRkQOB9NT3xxtlO9r7yt+h4w2DdzSBJPrXQ76TVx3
 HLcKVDzwvxeELWN2THF957DwlgF/RyGwwDsXKRa8scyRXahd6SI4lAWNSmscZuhmYe7b
 PGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CDwlfEjRKdCc4qZBSft/xfvlstGd5zLwXY7YrvZUNmY=;
 b=uQEKzVIvMDe4p2FAf05rsabHX0wREf+2J0J5eUIJYeg1aYcgElz6kLZubbMlmF0tQ4
 s2syRegQjI5bTB31lTdTxrql10FXYady3MDTLmVR0JiBeKxrEbHPPSbjYEmni8RQL+vr
 Tj1UcgcbNSTUTRFd677CBVm/P2mu4KjAhNaiKxvz4GkK6TD3h7q5NcF9qPzVhmCqnqQn
 ks8x1d04XF7c2RHKzv7AsQB5k3/kAz4lA7H11JX6jgo/+Z+lF4PRR3mePCfDGfeYyfo4
 1eBV4wQlK00cpJGhVv873v2cN+vRX6Z7A5X5u6Wy20MyzWSHn2TOjlR8Rb01QcWr3y7r
 79tw==
X-Gm-Message-State: AOAM5304z0qeNKMfKmVyYQ7sYV5Va9aSJeFvOl035K5O8Pil+kk2C9v8
 hiAmRFCbQzetAZFJerlADr1bfEspyas=
X-Google-Smtp-Source: ABdhPJyK0g+8bFKeImZwMlflebwozFjl1EjIkEmotOxL483FO2t81pZr41+igewwwntCuZHJObHpYw==
X-Received: by 2002:adf:80ae:: with SMTP id 43mr7889572wrl.50.1608136067134;
 Wed, 16 Dec 2020 08:27:47 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v189sm3512773wmg.14.2020.12.16.08.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:27:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] target/mips/mips-defs: Simplify ISA definitions
Date: Wed, 16 Dec 2020 17:27:32 +0100
Message-Id: <20201216162744.895920-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: Do not use MIPS3 for 64R1 (Jiaxun)=0D
=0D
As we don't need to duplicate 32/64-bit ISA defititions,=0D
this series remove the duplicated 64-bit variants,=0D
simplifying the overall.=0D
=0D
Changes done automatically with my editor using "find=0D
and replace".=0D
=0D
While the 'ISA_MIPS_Rx' form is shorter than 'ISA_MIPS_RELx',=0D
which one is the clearer?=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
$ git backport-diff -u v1 -r ..v2=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
vely=0D
=0D
001/12:[----] [--] 'target/mips/mips-defs: Reorder CPU_MIPS5 definition'=0D
002/12:[0013] [FC] 'target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64'=0D
003/12:[down] 'target/mips/mips-defs: Use ISA_MIPS32 definition to check Re=
lease 1'=0D
004/12:[----] [--] 'target/mips/mips-defs: Use ISA_MIPS32R2 definition to c=
heck Release 2'=0D
005/12:[----] [--] 'target/mips/mips-defs: Use ISA_MIPS32R3 definition to c=
heck Release 3'=0D
006/12:[----] [--] 'target/mips/mips-defs: Use ISA_MIPS32R5 definition to c=
heck Release 5'=0D
007/12:[----] [--] 'target/mips/mips-defs: Use ISA_MIPS32R6 definition to c=
heck Release 6'=0D
008/12:[0010] [FC] 'target/mips/mips-defs: Rename ISA_MIPS32 as ISA_MIPS_R1=
'=0D
009/12:[----] [--] 'target/mips/mips-defs: Rename ISA_MIPS32R2 as ISA_MIPS_=
R2'=0D
010/12:[----] [--] 'target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_=
R3'=0D
011/12:[----] [--] 'target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_=
R5'=0D
012/12:[----] [--] 'target/mips/mips-defs: Rename ISA_MIPS32R6 as ISA_MIPS_=
R6'=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  target/mips/mips-defs: Reorder CPU_MIPS5 definition=0D
  target/mips/mips-defs: Use ISA_MIPS3 for ISA_MIPS64=0D
  target/mips/mips-defs: Use ISA_MIPS32 definition to check Release 1=0D
  target/mips/mips-defs: Use ISA_MIPS32R2 definition to check Release 2=0D
  target/mips/mips-defs: Use ISA_MIPS32R3 definition to check Release 3=0D
  target/mips/mips-defs: Use ISA_MIPS32R5 definition to check Release 5=0D
  target/mips/mips-defs: Use ISA_MIPS32R6 definition to check Release 6=0D
  target/mips/mips-defs: Rename ISA_MIPS32 as ISA_MIPS_R1=0D
  target/mips/mips-defs: Rename ISA_MIPS32R2 as ISA_MIPS_R2=0D
  target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_R3=0D
  target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_R5=0D
  target/mips/mips-defs: Rename ISA_MIPS32R6 as ISA_MIPS_R6=0D
=0D
 target/mips/internal.h     |   8 +-=0D
 target/mips/mips-defs.h    |  40 +--=0D
 hw/mips/boston.c           |   2 +-=0D
 linux-user/elfload.c       |   2 +-=0D
 linux-user/mips/cpu_loop.c |   6 +-=0D
 target/mips/cp0_helper.c   |  18 +-=0D
 target/mips/cp0_timer.c    |   4 +-=0D
 target/mips/cpu.c          |  12 +-=0D
 target/mips/fpu_helper.c   |   4 +-=0D
 target/mips/tlb_helper.c   |   6 +-=0D
 target/mips/translate.c    | 620 ++++++++++++++++++-------------------=0D
 11 files changed, 357 insertions(+), 365 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

