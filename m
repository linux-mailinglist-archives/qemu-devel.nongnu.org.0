Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF25BFED6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:19:07 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazd3-000291-Vl
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oaz3R-00013O-D9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:42:19 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oaz3J-0004Xh-ST
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:42:14 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id AB06232001FF;
 Wed, 21 Sep 2022 08:41:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 21 Sep 2022 08:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1663764101; x=1663850501; bh=7+5Vm4ELh6fH3LgFG13n6f+qP
 6HIEBAk7fxxKnBjPQE=; b=mGMEz03r0Jmk/aABUoT9xSrGES+fdBhmPrqbfjPYT
 3lzADthMT10QrWmXDVz9KfF4xUKlDRYKbg49TUPuh5DsXium0kk4zqFFWg2Fcjhv
 H29cPXCFWWyXefE44sAxKeoFTwLlcnRb7Rqk9syBx36p2/iBO8+tyMYvQQoreUS8
 S9FspWhvf/Kq85JKcOqze21l5U+gBZlhwTK0k4mzHdoRWjpiNMXqdlvFg1MWoiYw
 D820ZCV843MBCiUvBmUglSt2BrchAeKC8ioTKZOAiCWUxMUlnVqOnG9lky5k2ew0
 lnShyHSo0Gd87JQsqg7Nr2gF16s8fsbupcx7Qq5rOUWOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1663764101; x=1663850501; bh=7+5Vm4ELh6fH3LgFG13n6f+qP6HIEBAk7fx
 xKnBjPQE=; b=tLvk7hqDSw0cDboRZ7U9spU5WVofuiCJxxGfG4WYSvyCriAQ2lR
 hyYhpPDIXapnCevnXCJ3oYaqAboGZ+GDmkH02R6Kj6IXXsvMD9vMqpMy5Di3tEnL
 Dap/epbdkIE2J4H9OFiMO+dQnF0CJs//+7wDmHUlHcmZ6KBDS9bRlHys90ujpzwZ
 uc5XUADeOTNnkZzzz+veihnRgyB+uki3tvII29xiqLaDO4h7x8oIdIK4kCS0HM43
 DbvQ0vCkd3lAO5xfYr2DTzCwpFfHpiCTnC2Y0TBFvWiXBJH+1fsUxSSE21PXScHN
 RU08unr9N+6980PEsXx6lp9nM90dfhlp+kA==
X-ME-Sender: <xms:hAYrY6nac-eSeNCq14xfoQ8-gY6pYAjBzyz3jnIohYIZsK5l8s7x4Q>
 <xme:hAYrYx0MigzyKvGprDvYOIPdRTROssBmaLvf0YA_mCCrVu_a-cdxfHDEy5A6MpzzN
 BlFf-X173PrwxnRYwo>
X-ME-Received: <xmr:hAYrY4qOxaU5hODOiYDK4Af2GxWziDUy3UH5OvjXWXCHkLBr68nA5FhOOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
 ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:hQYrY-kYSWtZewiYR7zqFI3AYlSMHuFHqVhpxBYSK-JnvWmkASw-iw>
 <xmx:hQYrY421kJsJYTK4w3UZkCVYEYyxUHbn6xanAMfM-h7e0ZkGLurWsQ>
 <xmx:hQYrY1uXnGRayzG0nEvJ-SNIzzTPud6PfP27eqJ4_rE9dIs0ZfKBsQ>
 <xmx:hQYrY2AHlnuyLnqWgcmVE55Yb8tClEfZ071ujmG2SkZj94u-kRNS-g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 08:41:40 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 0/3] MIPS decodetree conversion attempt 
Date: Wed, 21 Sep 2022 13:41:02 +0100
Message-Id: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout2-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is my attempt of converting MIPS translation code into decodetree.

Currently only MIPS I to MIPS Release 5 arithmatic functions are converted.
Old decoding functions are perserved in codebase for now due to dependencies
from microMIPS/nanoMIPS translation code. Will remove them after dealing with
release 6.

Both instruction encoding and test cases are generated form MIPS's internal
architecture validation tools so they are gureented to be correct.

Thanks.

- Jiaxun

Jiaxun Yang (3):
  target/mips: Introduce register access helper functions
  target/mips: Convert legacy arithmatic instructions to decodetree
  tests/tcg/mips: Add mips32 arithmatic instruction test cases

 target/mips/tcg/insn_trans/trans_arith.c.inc  | 352 ++++++++++++++++++
 target/mips/tcg/legacy.decode                 |  62 +++
 target/mips/tcg/meson.build                   |   1 +
 target/mips/tcg/translate.c                   | 143 ++++++-
 target/mips/tcg/translate.h                   |  54 +++
 tests/tcg/mips/include/test_utils_32.h        |  75 ++++
 .../tcg/mips/user/isa/mips32/arithmatic/add.c |  99 +++++
 .../mips/user/isa/mips32/arithmatic/addi.c    |  70 ++++
 .../mips/user/isa/mips32/arithmatic/addiu.c   |  90 +++++
 .../mips/user/isa/mips32/arithmatic/addu.c    | 125 +++++++
 .../tcg/mips/user/isa/mips32/arithmatic/div.c |  81 ++++
 .../mips/user/isa/mips32/arithmatic/divu.c    |  78 ++++
 .../mips/user/isa/mips32/arithmatic/madd.c    |  79 ++++
 .../mips/user/isa/mips32/arithmatic/maddu.c   |  78 ++++
 .../mips/user/isa/mips32/arithmatic/msub.c    |  78 ++++
 .../mips/user/isa/mips32/arithmatic/msubu.c   |  78 ++++
 .../tcg/mips/user/isa/mips32/arithmatic/mul.c |  78 ++++
 .../mips/user/isa/mips32/arithmatic/mult.c    |  78 ++++
 .../mips/user/isa/mips32/arithmatic/multu.c   |  78 ++++
 .../tcg/mips/user/isa/mips32/arithmatic/slt.c |  61 +++
 .../mips/user/isa/mips32/arithmatic/slti.c    |  48 +++
 .../mips/user/isa/mips32/arithmatic/sltiu.c   |  48 +++
 .../mips/user/isa/mips32/arithmatic/sltu.c    |  61 +++
 .../tcg/mips/user/isa/mips32/arithmatic/sub.c | 104 ++++++
 .../mips/user/isa/mips32/arithmatic/subu.c    | 108 ++++++
 25 files changed, 2206 insertions(+), 1 deletion(-)
 create mode 100644 target/mips/tcg/insn_trans/trans_arith.c.inc
 create mode 100644 target/mips/tcg/legacy.decode
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


