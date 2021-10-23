Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6787438593
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:49:54 +0200 (CEST)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOtl-0004ex-AB
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOs7-00032J-EG
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOs4-00052U-4Z
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:10 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 84-20020a1c0457000000b003232b0f78f8so8316594wme.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GEZRVVxWl3KiT2RdI5oFWcJhS2OeBMe7WFpUsgBTO0g=;
 b=hc7mMln42sAQPKONZkg2j1TcMUWdm8Iz4UVkBRlFoT5EeBO6FF31zGUGSHjEIeWRcc
 KyDvUqzurOWqRk0vxKcmBPtMV3mtkdxQgAy9YFQqOT8OpB5usouf+DcHAFlzeajXnPXe
 RSBJAFu4vYB02X3G+Fxwn4e8TuK+ujVaJL6Dq6NUyhwBliqfJsk4vBWbszVYElj3P+8S
 8p7fmRJnecfUJWYOeGdbKFj3Acx/rvxsML72kqnxItrwImKsHKf9gWBsoZ+eiNAsoABP
 +yg2MBwr73ZuXU2tNQLmdidp1JE66P9/yBO/oZyNbcB/2ZMgY0+inS6qFXLS5ImdMUk2
 Wc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GEZRVVxWl3KiT2RdI5oFWcJhS2OeBMe7WFpUsgBTO0g=;
 b=L7qhWbj9IX7xsqLj0IFE466AAgJHECFqxItS7PmZgOvMkcluhgU3iWUVzMfLLix1Ut
 G3guXRizvF//4SwrGPX/Cg52WdX0amPhFXg9GYhdYAs8T9VfJ70wJCwFdfzIK9heHUVB
 2ZtLcUnuwhDfI1+XX9WixxQl0tx1Z1sAUwS6LsdCMa1hdObkgh0QmUZWy0J1eeovM8m6
 PGxRJCFFt+/XBOlCqWtzWZ0/mBD9osAVsevM1B/HIZRKh4eVj+zTqUXvkS6mDUYeGq4W
 i9iRQgSHgO+l127Gxkt8O+UcuroWFhB9U278DqewDBGMzDwl+bwhdnqP/X+u/x1Nhq7b
 hKNA==
X-Gm-Message-State: AOAM531H4HoGTnfg6nIbsQx2a5gMt5E8/rPHzYok8lk1Tq0kUXDdWf7s
 VU4QRWzOsjYYe0CIUXORfVu9EfPeZOY=
X-Google-Smtp-Source: ABdhPJxkqqQwf/L+8Mw7v++gQiH6ENpKz1GgAvDsJALBrqtXrj8IklxoSlEjh+0MG2ZeCtPv+b0EXw==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr9243592wml.178.1635025685607; 
 Sat, 23 Oct 2021 14:48:05 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o194sm4985049wme.40.2021.10.23.14.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/33] target/mips: Fully convert MSA opcodes to decodetree
Date: Sat, 23 Oct 2021 23:47:30 +0200
Message-Id: <20211023214803.522078-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series converts 2000+ lines of switch() code to decodetree=0D
description, so this hard-to-review/modify switch is auto generated=0D
by the decodetree script. This is a big win for maintenance (and=0D
indeed the convertion revealed 2 bugs).=0D
=0D
Massive convertions are - beside being often boring - bug-prone.=0D
In this series we re-start running the MSA tests (the tests are=0D
run automagically in the 'build-user-static' job on gitlab CI).=0D
=0D
Although boring, the conversion is very clean, so I hope it will=0D
be easy enough to review. The TRANS*() macros are heavily used.=0D
=0D
When possible, constant fields are hold with tcg_constant().=0D
=0D
Note, various opcodes can be optimized using TCG host vectors.=0D
We won't address that in this series, as it makes the resulting=0D
review harder. We will post that in a following series. Here we=0D
simply dummy-convert.=0D
=0D
The resulting msa.decode file is quite pleasant to look at, and=0D
the diff-stat is encouraging: number of LoC halved.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
git: https://gitlab.com/philmd/qemu.git tree/mips-msa-decodetree=0D
Based-on: <20211023164329.328137-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (33):=0D
  tests/tcg: Fix some targets default cross compiler path=0D
  target/mips: Fix MSA MADDV.B opcode=0D
  target/mips: Fix MSA MSUBV.B opcode=0D
  tests/tcg/mips: Run MSA opcodes tests on user-mode emulation=0D
  target/mips: Have check_msa_access() return a boolean=0D
  target/mips: Use enum definitions from CPUMIPSMSADataFormat enum=0D
  target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v=0D
  target/mips: Convert MSA LDI opcode to decodetree=0D
  target/mips: Introduce generic TRANS_CHECK() for decodetree helpers=0D
  target/mips: Extract df_extract() helper=0D
  target/mips: Convert MSA I5 instruction format to decodetree=0D
  target/mips: Convert MSA BIT instruction format to decodetree=0D
  target/mips: Convert MSA SHF opcode to decodetree=0D
  target/mips: Convert MSA I8 instruction format to decodetree=0D
  target/mips: Convert MSA load/store instruction format to decodetree=0D
  target/mips: Convert MSA 2RF instruction format to decodetree=0D
  target/mips: Convert MSA FILL opcode to decodetree=0D
  target/mips: Convert MSA 2R instruction format to decodetree=0D
  target/mips: Convert MSA VEC instruction format to decodetree=0D
  target/mips: Convert MSA 3RF instruction format to decodetree=0D
    (DF_HALF)=0D
  target/mips: Convert MSA 3RF instruction format to decodetree=0D
    (DF_WORD)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    1/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    2/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    3/4)=0D
  target/mips: Convert MSA 3R instruction format to decodetree (part=0D
    4/4)=0D
  target/mips: Convert MSA ELM instruction format to decodetree=0D
  target/mips: Convert MSA COPY_U opcode to decodetree=0D
  target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree=0D
  target/mips: Convert MSA MOVE.V opcode to decodetree=0D
  target/mips: Convert CFCMSA and CTCMSA opcodes to decodetree=0D
  target/mips: Remove generic MSA opcode=0D
  target/mips: Remove one MSA unnecessary decodetree overlap group=0D
  target/mips: Adjust style in msa_translate_init()=0D
=0D
 tests/tcg/mips/ase-msa.mak         |   30 +=0D
 target/mips/tcg/translate.h        |    9 +=0D
 target/mips/tcg/msa.decode         |  231 ++-=0D
 target/mips/tcg/msa_helper.c       |   64 +-=0D
 target/mips/tcg/msa_translate.c    | 2781 +++++++---------------------=0D
 MAINTAINERS                        |    1 +=0D
 tests/tcg/configure.sh             |   14 +-=0D
 tests/tcg/mips/Makefile.target     |    5 +=0D
 tests/tcg/mips64/Makefile.target   |    9 +=0D
 tests/tcg/mips64el/Makefile.target |   12 +=0D
 tests/tcg/mipsel/Makefile.target   |    9 +=0D
 11 files changed, 1052 insertions(+), 2113 deletions(-)=0D
 create mode 100644 tests/tcg/mips/ase-msa.mak=0D
 create mode 100644 tests/tcg/mips64/Makefile.target=0D
 create mode 100644 tests/tcg/mips64el/Makefile.target=0D
 create mode 100644 tests/tcg/mipsel/Makefile.target=0D
=0D
-- =0D
2.31.1=0D
=0D

