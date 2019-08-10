Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385CF887D1
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:14:06 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwIlY-0006ie-SA
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34599)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkg-0005AL-Nh
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkf-0004Aq-DK
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:10 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34623)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkf-00047n-5V
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:09 -0400
Received: by mail-ot1-x341.google.com with SMTP id n5so140563592otk.1
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JscvVXb72HH+aqQmDmmVBYlLNmvS85C4I5DperxsH0E=;
 b=t+YVVw/a9I477+5Su4/2k7y5CwaOhvTOsqOgSWApRYE/lPzDUOqpFeNJfXPLRudmZB
 dBlJBiXvjeDy2pBibku0Yispaux0Z04bypwka9AqoZ1vgX7b9NX0WoBDhlG5+eZbW+4W
 r47LYnHdwul5Ytnty1rMQa1AHLuHolfPm3MaT8xysQ6YosouHiHyZbjJmcIU/hW+qOG9
 c9hHat7JHC6g7z9NXDsi72WkO2WxruBUVERCJbYfnBxpWWcOgG+FZUxBf2bHWLIMVz97
 pOjCQxr8WEJTF8yhD6g5enRV/dIQAvam5eGjJlPjnlD4bjn2gai5N6utddIAsBVQk9tW
 HCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JscvVXb72HH+aqQmDmmVBYlLNmvS85C4I5DperxsH0E=;
 b=DqZLlDLwRP+mNCYsdtMBsLcrORA2cveB38kxjda2m2ek5AVCIHgNoxqvpN2yNKImtT
 qvDWG7TNLRFCgCwCaSvG7IMyUTGba4+ksQRrKkNEudgh62c7PLhC3+dcVJbyROouBi8Q
 RZAorSR7XhTqV03kdGAFeVykZ7t8TffO5sIxLMxxUlDBk74Tsx8mLRTzaxSosgNeR3ax
 uXvH7kFMpP9Z0A17nLZrkXlZJH+4wkChPnKe8K/X1OgkhjSY5NyDFJjCOkRahwaMyfTJ
 NZkHlOPB9xNFa6FiCMh/3uDm5WLAlhaf68cEjUPCBGJy/qMPR+MYIq2WT3FcJus5JETE
 IgcQ==
X-Gm-Message-State: APjAAAXjMGBGr8RxUaEgzVj3cKKFaUgbbqC0A/Ohe39mAQbHX6tydz3f
 Orn1QvG7BTdpr8KsBQqLKwANghQp
X-Google-Smtp-Source: APXvYqxlAkiJPKaShUj5baH39jv/qqlOidCq4qJ64f89Zbc4nPpjS/WaxOCsKV4LPBMp6h5C17botw==
X-Received: by 2002:a9d:69cd:: with SMTP id v13mr9452197oto.89.1565410386938; 
 Fri, 09 Aug 2019 21:13:06 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:06 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:16 -0400
Message-Id: <20190810041255.6820-1-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: [Qemu-devel] [RFC PATCH v2 00/39] rewrite MMX/SSE instruction
 translation
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a v2 of the patch series posted in [1]. Patches 1-9 are just
cleanups; patches 10-39 are something actually interesting. Compared
to v1, I started using preprocessor more extensively to generate
repetitive boilerplate code; opinions/alternatives are welcome and
appreciated.

I tried to eliminate as many errors reported by scripts/checkpatch.pl
as I could, but there are still some left; AFAICT they appear to be
non-applicable false positives caused by preprocessor macros.

There is a known flaw of M* operands documented in patches 25 and 39;
it will be addressed in v3. (It has some design implications which
require larger changes, so that's why I'm not including them right
away, but I already have a good idea of how to address this.)

Cheers,
  -Jan

Changes from v1:
  There is in fact little overlap with v1, apart from the minor
  cleanup patches; I tried a different approach this time.

References:
  1. https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg07041.html

Jan Bobek (36):
  target/i386: reduce scope of variable aflag
  target/i386: use dflag from DisasContext
  target/i386: use prefix from DisasContext
  target/i386: use pc_start from DisasContext
  target/i386: make variable b1 const
  target/i386: make variable is_xmm const
  target/i386: add vector register file alignment constraints
  target/i386: introduce gen_(ld,st)d_env_A0
  target/i386: introduce gen_sse_ng
  target/i386: disable unused function warning temporarily
  target/i386: introduce mnemonic aliases for several gvec operations
  target/i386: introduce function ck_cpuid
  target/i386: introduce instruction operand infrastructure
  target/i386: introduce helpers for decoding modrm fields
  target/i386: introduce modifier for direct-only operand decoding
  target/i386: introduce generic operand alias
  target/i386: introduce generic load-store operand
  target/i386: introduce insn.h
  target/i386: introduce code generators
  target/i386: introduce instruction translator macros
  target/i386: introduce Ib (immediate) operand
  target/i386: introduce M* (memptr) operands
  target/i386: introduce G*, R*, E* (general register) operands
  target/i386: introduce RdMw operand
  target/i386: introduce P*, N*, Q* (MMX) operands
  target/i386: introduce helper-based code generator macros
  target/i386: introduce gvec-based code generator macros
  target/i386: introduce MMX translators
  target/i386: introduce MMX code generators
  target/i386: introduce MMX instructions to insn.h
  target/i386: introduce V*, U*, W* (SSE/AVX) operands
  target/i386: introduce UdqMq operand
  target/i386: introduce SSE translators
  target/i386: introduce SSE code generators
  target/i386: introduce SSE instructions to insn.h
  target/i386: introduce memory-pointer operand read/write workarounds

Richard Henderson (3):
  target/i386: Push rex_r into DisasContext
  target/i386: Push rex_w into DisasContext
  target/i386: Simplify gen_exception arguments

 target/i386/cpu.h       |    6 +-
 target/i386/insn.h      |  381 ++++++++
 target/i386/translate.c | 2032 ++++++++++++++++++++++++++++++++-------
 3 files changed, 2095 insertions(+), 324 deletions(-)
 create mode 100644 target/i386/insn.h

-- 
2.20.1


