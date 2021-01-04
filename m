Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5062E9FDA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:14:40 +0100 (CET)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwY7b-0007u3-CR
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY53-0006Dj-5U
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:05 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY51-0007ku-I8
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id g185so646586wmf.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZD26O1IyzYzm5t/8wGvrcGIUsqNCSgpLU8lSrgIgrEQ=;
 b=PcKsMbv0idFTuAbjCgTf89iswwxXUgTHr+hFo5TQdEyDGcV0c5Jdesai4ny3OxkJZE
 xiAFaj711Bzcnv5Dm40ZBNxCXTpVXWNmIGDluvH5gMKjwJXs60ogQeZRRVwg0rD9D605
 +Alzrm+o78uiFWVMJE24ybaMnvzl942IaI4mDyVVcj29VyXte8DcXftW2H1DfDXXYiBv
 ZFQ9aRy172oAppsxRQWbZlLm6Gxmbkte6s8jgv3AhuYnz4rdoJQwaMZKHi9sT0GN8BLe
 MN4rgwrmQ7oUmnhyU2JEuCnl8H9b8OQ6GNmJoBkEyYhLbhiy6EQyW3fy4phZPtVDWY0d
 YVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZD26O1IyzYzm5t/8wGvrcGIUsqNCSgpLU8lSrgIgrEQ=;
 b=mdA5TsT5sop8UMbALCkHgN7Ya2tdJR5scG+hZ676S4KKcPX+nxLYQGjEsq8yeYY+kH
 bcMxYcoyg5oq0mHY+lEqcDUlto04eKEZVa664PldKLYXDf2UAycA6Mc8DV1y6hcAWa6l
 2pnd385vx8nJ+paXSomkJ8oQKLljzamQEqn5yyAmpjQGkQHaVymOabKn0HMX/MyQhr80
 3BCqI75RsHBqXg6Ind3y6LxOJSg9AGJeG7pvFT7h1qUxe6rp0QOldgNIanJAxlDjHho2
 HDriG+QOvmcZSn5T/pO+fIsBYzkLw6AqIvhSQweQ+Hz30xc2cSlMOW1pZTj6poI8/eX0
 0p8w==
X-Gm-Message-State: AOAM533xb/oOfcOs2wuyQFeR5fpc8Eb0I6fkqvoVx0hgAmTrIA2rrWqU
 jLrryha3HWvZnm0gcpOCLFbpVOmR9N8=
X-Google-Smtp-Source: ABdhPJz3IuKE5EQFN0lWI4+ZkvhZKfu0jXUEiq8sVG8709mhJeT9R5twspPTVTpiKpUO1t0zqD9hQg==
X-Received: by 2002:a1c:6a10:: with SMTP id f16mr798024wmc.106.1609798317593; 
 Mon, 04 Jan 2021 14:11:57 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id b83sm1247255wmd.48.2021.01.04.14.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:11:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] target/mips/mips-defs: Simplify ISA definitions
Date: Mon,  4 Jan 2021 23:11:39 +0100
Message-Id: <20210104221154.3127610-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3: Replace ISA_MIPS3 by ISA_MIPS64 (Richard)=0D
v2: Do not use MIPS3 for 64R1 (Jiaxun)=0D
=0D
Missing review: 1, 3, 4, 5=0D
=0D
As we don't need to duplicate 32/64-bit ISA defititions,=0D
this series remove the duplicated 64-bit variants,=0D
simplifying the overall.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
$ git backport-diff -u v2 -r ..v3=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/15:[down] 'target/mips/mips-defs: Remove USE_HOST_FLOAT_REGS comment'=0D
002/15:[----] [--] 'target/mips/mips-defs: Reorder CPU_MIPS5 definition'=0D
003/15:[down] 'target/mips/mips-defs: Rename CPU_MIPSxx Release 1 as CPU_MI=
PS=3D=0D
xxR1'=0D
004/15:[down] 'target/mips/mips-defs: Introduce CPU_MIPS64 and cpu_type_is_=
64=3D=0D
bit()'=0D
005/15:[down] 'hw/mips/boston: Check 64-bit support with cpu_type_is_64bit(=
)'=0D
006/15:[0004] [FC] 'target/mips/mips-defs: Use ISA_MIPS32 definition to che=
ck=3D=0D
 Release 1'=0D
007/15:[0004] [FC] 'target/mips/mips-defs: Use ISA_MIPS32R2 definition to c=
he=3D=0D
ck Release 2'=0D
008/15:[----] [--] 'target/mips/mips-defs: Use ISA_MIPS32R3 definition to c=
he=3D=0D
ck Release 3'=0D
009/15:[----] [--] 'target/mips/mips-defs: Use ISA_MIPS32R5 definition to c=
he=3D=0D
ck Release 5'=0D
010/15:[0002] [FC] 'target/mips/mips-defs: Use ISA_MIPS32R6 definition to c=
he=3D=0D
ck Release 6'=0D
011/15:[0004] [FC] 'target/mips/mips-defs: Rename ISA_MIPS32 as ISA_MIPS_R1=
'=0D
012/15:[0006] [FC] 'target/mips/mips-defs: Rename ISA_MIPS32R2 as ISA_MIPS_=
R2'=0D
013/15:[----] [-C] 'target/mips/mips-defs: Rename ISA_MIPS32R3 as ISA_MIPS_=
R3'=0D
014/15:[----] [--] 'target/mips/mips-defs: Rename ISA_MIPS32R5 as ISA_MIPS_=
R5'=0D
015/15:[0018] [FC] 'target/mips/mips-defs: Rename ISA_MIPS32R6 as ISA_MIPS_=
R6'=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (15):=0D
  target/mips/mips-defs: Remove USE_HOST_FLOAT_REGS comment=0D
  target/mips/mips-defs: Reorder CPU_MIPS5 definition=0D
  target/mips/mips-defs: Rename CPU_MIPSxx Release 1 as CPU_MIPSxxR1=0D
  target/mips/mips-defs: Introduce CPU_MIPS64 and cpu_type_is_64bit()=0D
  hw/mips/boston: Check 64-bit support with cpu_type_is_64bit()=0D
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
 target/mips/cpu.h                |   5 +=0D
 target/mips/internal.h           |   8 +-=0D
 target/mips/mips-defs.h          |  46 +--=0D
 hw/mips/boston.c                 |   6 +-=0D
 linux-user/mips/cpu_loop.c       |   6 +-=0D
 target/mips/cp0_helper.c         |  18 +-=0D
 target/mips/cp0_timer.c          |   4 +-=0D
 target/mips/cpu.c                |   6 +-=0D
 target/mips/fpu_helper.c         |   4 +-=0D
 target/mips/helper.c             |  12 +-=0D
 target/mips/translate.c          | 620 +++++++++++++++----------------=0D
 target/mips/translate_init.c.inc |  14 +-=0D
 12 files changed, 370 insertions(+), 379 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

