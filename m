Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCA60B375
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:06:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzJ3-0003dM-E9; Mon, 24 Oct 2022 11:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJ1-0003cj-Il
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:23:59 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzIz-0008EV-CT
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:23:59 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5CD7D320083A;
 Mon, 24 Oct 2022 11:23:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 24 Oct 2022 11:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1666625033; x=1666711433; bh=a2lEq79IhxWUrbYMVDjfCn8JQ
 s4CShLWoZXrNy9J7hE=; b=kR2bOD7grReWXTWLmVVq2Vj7iamZnCxsgfEtYhgpw
 eBduTjd+kGxMuL+L1XP6JkaoEYa1GipvkfNkexqMGYpS3svoIdT3ANRRMPUMwBr8
 4HvlX/wYuemqumgThVnkJ8xMtVDixa+YGyA3vNJsrgbMnD6vbbGXMw0l/251LO+N
 /D0linQqF3vIvsbyrS5uWhMXfPJOToa5pq2Z/LPX8QHv0cym6BwhKr06PHbaZQHQ
 2vInlpTTf9B5Evx2BiC9kGtuSDBPyT/dVkqjUPcrmcksL2EVy/SpUdcZ0gdDM9FH
 +fzvb8CHbpBY/Tu0EhZ16SQp5+88hG9JLPoVvrkKFsshA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666625033; x=1666711433; bh=a2lEq79IhxWUrbYMVDjfCn8JQs4CShLWoZX
 rNy9J7hE=; b=ToR9k4qnPXhpo2iN1zdPx6IjxeSfEWDDG4/rR/bXXjYYRkK5caA
 8z//4Lzc7gQU1sOfSjTpCK10tR87U7dSh29Ecqe/YpST2iJmh4BLBOzssBjE2xad
 4QsYIFKJEHk1ERT4a5mPCLRqE95rhNM9NzfLPN74pBCNrEAeEGTs8lUyoZ8MUdxu
 YMq3CckNQi94RI5E/61NCbvqcQbnesWkMfAk0OkWmnlTXWbXBo+Nq6b7eJ7a6Bn/
 /qRbPndUoDnMsBeAqin1MHrJ3w3JX9H/eZy4tB+jTnPk8QyOxjA2KO0UAjIbpF2X
 aXMzEHGGR+AdzsS7ebxqFYV8rqpPbP/+1/g==
X-ME-Sender: <xms:Ca5WY_gOxEZFxuKvuIf3gd9oa-U2KfbGL-gaaA5cW-8gnhRPWOytjw>
 <xme:Ca5WY8BLg2vSJC3etc2Yrz3GYnkD_8FGtLkmGCVX2PBMTUpEutm7_mhILL_9wjKSN
 VmpzhSMfSLZe3rAZcs>
X-ME-Received: <xmr:Ca5WY_EYVgnGzNY1uHTPhjYSLMlEYEGUEPe7G6TJk-5ItHEIntxPT3wf4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
 ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:Ca5WY8SQIJWEM9xv5I6fNom6VAjHA-ikEy3iZSlaU_EYzIctlnNh5w>
 <xmx:Ca5WY8x_4Wn1nNc4FcNeKHgNRsfsLg9CDshNe4DbRGd1glA9qVRHsA>
 <xmx:Ca5WYy5Oy-YhfjJaeKhICxj7e-m_KawiFXcuwUYCYiX-J4sCRjgZYg>
 <xmx:Ca5WY386uJ3QLwT0eJilhK5q22xFEkrOsxkacvIBddkYt96_GfCrHQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 11:23:53 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/6] MIPS decodetree conversion
Date: Mon, 24 Oct 2022 16:23:43 +0100
Message-Id: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently only MIPS I to MIPS Release 5 arithmatic functions are converted.
Old decoding functions are perserved in codebase for now due to dependencies
from microMIPS/nanoMIPS translation code. Will remove them after dealing with
release 6.

Both instruction encoding and test cases are generated form MIPS's internal
architecture validation tools so they are gureented to be correct.

Note:
There are some checkpatch warning/error on test cases but I'm not going to
touch them as they are generated code.

Thanks.

RFC->v1:
 - Tidy up test cases
 - Convert TX79 as well

- Jiaxun
Jiaxun Yang (6):
  target/mips: Introduce register access helper functions
  target/mips: Convert legacy arithmatic instructions to decodetree
  tests/tcg/mips: Add mips32 arithmatic instruction test cases
  target/mips: Split Loongson extention translation into standalone file
  target/mips: Move all tx79 instructions to decodetree
  target/mips: Make MXU decoder standalone

 target/mips/tcg/insn_trans/trans_arith.c.inc  |  352 +++
 target/mips/tcg/legacy.decode                 |   62 +
 target/mips/tcg/loongson_translate.c          | 1290 +++++++++++
 target/mips/tcg/meson.build                   |    2 +
 target/mips/tcg/mxu_translate.c               |   98 +-
 target/mips/tcg/translate.c                   | 1917 ++---------------
 target/mips/tcg/translate.h                   |   60 +
 target/mips/tcg/tx79.decode                   |   14 +
 target/mips/tcg/tx79_translate.c              |  205 +-
 tests/tcg/mips/include/test_utils_32.h        |   75 +
 .../tcg/mips/user/isa/mips32/arithmatic/add.c |   99 +
 .../mips/user/isa/mips32/arithmatic/addi.c    |   70 +
 .../mips/user/isa/mips32/arithmatic/addiu.c   |   90 +
 .../mips/user/isa/mips32/arithmatic/addu.c    |  125 ++
 .../tcg/mips/user/isa/mips32/arithmatic/div.c |   81 +
 .../mips/user/isa/mips32/arithmatic/divu.c    |   78 +
 .../mips/user/isa/mips32/arithmatic/madd.c    |   79 +
 .../mips/user/isa/mips32/arithmatic/maddu.c   |   78 +
 .../mips/user/isa/mips32/arithmatic/msub.c    |   78 +
 .../mips/user/isa/mips32/arithmatic/msubu.c   |   78 +
 .../tcg/mips/user/isa/mips32/arithmatic/mul.c |   78 +
 .../mips/user/isa/mips32/arithmatic/mult.c    |   78 +
 .../mips/user/isa/mips32/arithmatic/multu.c   |   78 +
 .../tcg/mips/user/isa/mips32/arithmatic/slt.c |   61 +
 .../mips/user/isa/mips32/arithmatic/slti.c    |   48 +
 .../mips/user/isa/mips32/arithmatic/sltiu.c   |   48 +
 .../mips/user/isa/mips32/arithmatic/sltu.c    |   61 +
 .../tcg/mips/user/isa/mips32/arithmatic/sub.c |  104 +
 .../mips/user/isa/mips32/arithmatic/subu.c    |  108 +
 29 files changed, 3865 insertions(+), 1730 deletions(-)
 create mode 100644 target/mips/tcg/insn_trans/trans_arith.c.inc
 create mode 100644 target/mips/tcg/legacy.decode
 create mode 100644 target/mips/tcg/loongson_translate.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/add.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addi.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addiu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/div.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/divu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/madd.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/maddu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/msub.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/msubu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/mul.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/mult.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/multu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/slt.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/slti.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sltiu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sltu.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sub.c
 create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/subu.c

-- 
2.34.1


