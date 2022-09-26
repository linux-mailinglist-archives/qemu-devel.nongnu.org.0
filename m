Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EE95EA8F4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:49:42 +0200 (CEST)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpQT-0001aH-LT
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ocpLZ-0004F6-P4
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:44:42 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:53545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ocpLX-00077B-G1
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:44:37 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C8EF85C00AF;
 Mon, 26 Sep 2022 10:44:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 26 Sep 2022 10:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1664203471; x=
 1664289871; bh=YT0xN66NX+uFrq6gV3VK3hHffNGVNNucVDgZW/WIaTc=; b=w
 OEXQcbzKyV4yxWcFaDlqCY9UaxL/aVGCJ0pboBbYIz41IPx6lI9hcFIxns2sOHjz
 9m7/6vwV/BvD+MAPI2tWQWR1nH4mxhPcqUPJk+ctZhNwsQcU+k6I5VQcWY2mprxu
 /z7+JW4EsFWNVKHMBHHYYk3aM0krE25pVnjvTq/H5ZsWDfIOyRRKuGjOiLvVm7jU
 cyA4FbWOpD9gARYB/LwJofYx2CMw47sTX6ogrMC7/ovz7gJM/PAqHosSLCuF/UHp
 RaTBsTHT4l0QIIGKmlP6uo/a882EZvq+HOeD9KZSkFO3ZeOyuuaEn7++4cdgJgjo
 SQDobsLrUn9FE6xukB1Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1664203471; x=
 1664289871; bh=YT0xN66NX+uFrq6gV3VK3hHffNGVNNucVDgZW/WIaTc=; b=w
 v9RvWGS/jQgykmK/xswJu0p9jO2N/jy58dmBr1+E84q8ORXpNu3hrTU8WtupOFsb
 rexsd9X04bE4HRVGE1XLJ+s0IPJ99R7whQXu6q3F1f/JtmZx+kRyeOUlfzdo5Gjw
 K80f1LPEM3WVtrYYH07n2/QrH/ASW84l2Ye5/zmk/UT1/3IhhPhyTnFwFSdiTL0b
 D1D1ZHYCvitL9O4W/VdMs4LAEpp7omh6vJblvNDbVpVhDx1hkAABxsfqBqafh1zo
 QdoK7Me4psEY3Ct1njf1dvIp9OwzFw09AMhAmB29wOJjhk07ixtzORWTYbf8zyg9
 HiKwhz7OF+LFzehwLwjkQ==
X-ME-Sender: <xms:z7oxYz-hPt8Qoh432Q8HSbaw8Ag6ZY4etCCFLB6T93rsYPpGsHlZ8g>
 <xme:z7oxY_tdk-LJh_ejaRm6iKTsxj-BIsYE5GwflcpSsncUNRL0YTCIUA3vmzlgwqWgK
 U2uLP0cI8Hj3BxSNIM>
X-ME-Received: <xmr:z7oxYxDe8iMVYvOkw_2EdpNM0ze_441PTNeU5TPHoFq11mvrlUwggO1rGJWTGfszpuBX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpegtggfuhfgjffevgffkfhfvofesth
 hqmhdthhdtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedutdejffetteefke
 ejieehfeeuieeguedtveeijeeviefhffelvdfgudeihfdvtdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:z7oxY_dYjl0oKg_6GpbViOkHqGbSsDeJBWw1E_BEA_gHc0tC6-hPXQ>
 <xmx:z7oxY4OPgSs6Ha3PhHRQqQOH-ZCalg_jTMBsmnOuNnLs-7NmlKPnOA>
 <xmx:z7oxYxlpxFT4MzCp-HyF3ll-Yvj8zF-JYiOk16bmryvV9WM5bn9umg>
 <xmx:z7oxYy3spNhcA9UtI9f3EYEbedQvMFTc6I6DjIJnW8GhY-_d2dbBng>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 10:44:30 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.74\))
Subject: Re: [RFC PATCH 0/3] MIPS decodetree conversion attempt
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
Date: Mon, 26 Sep 2022 15:44:18 +0100
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 richard.henderson@linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E9443B6B-D245-4F31-B3BF-85011CB6B9FD@flygoat.com>
References: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3731.200.74)
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> 2022=E5=B9=B49=E6=9C=8821=E6=97=A5 13:41=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi,
>=20
> This is my attempt of converting MIPS translation code into =
decodetree.
>=20
> Currently only MIPS I to MIPS Release 5 arithmatic functions are =
converted.
> Old decoding functions are perserved in codebase for now due to =
dependencies
> from microMIPS/nanoMIPS translation code. Will remove them after =
dealing with
> release 6.
>=20
> Both instruction encoding and test cases are generated form MIPS's =
internal
> architecture validation tools so they are gureented to be correct.

A kindly ping :-)

Will send v1 tomorrow if no objection.

Thanks
- Jiaxun

>=20
> Thanks.
>=20
> - Jiaxun
>=20
> Jiaxun Yang (3):
>  target/mips: Introduce register access helper functions
>  target/mips: Convert legacy arithmatic instructions to decodetree
>  tests/tcg/mips: Add mips32 arithmatic instruction test cases
>=20
> target/mips/tcg/insn_trans/trans_arith.c.inc  | 352 ++++++++++++++++++
> target/mips/tcg/legacy.decode                 |  62 +++
> target/mips/tcg/meson.build                   |   1 +
> target/mips/tcg/translate.c                   | 143 ++++++-
> target/mips/tcg/translate.h                   |  54 +++
> tests/tcg/mips/include/test_utils_32.h        |  75 ++++
> .../tcg/mips/user/isa/mips32/arithmatic/add.c |  99 +++++
> .../mips/user/isa/mips32/arithmatic/addi.c    |  70 ++++
> .../mips/user/isa/mips32/arithmatic/addiu.c   |  90 +++++
> .../mips/user/isa/mips32/arithmatic/addu.c    | 125 +++++++
> .../tcg/mips/user/isa/mips32/arithmatic/div.c |  81 ++++
> .../mips/user/isa/mips32/arithmatic/divu.c    |  78 ++++
> .../mips/user/isa/mips32/arithmatic/madd.c    |  79 ++++
> .../mips/user/isa/mips32/arithmatic/maddu.c   |  78 ++++
> .../mips/user/isa/mips32/arithmatic/msub.c    |  78 ++++
> .../mips/user/isa/mips32/arithmatic/msubu.c   |  78 ++++
> .../tcg/mips/user/isa/mips32/arithmatic/mul.c |  78 ++++
> .../mips/user/isa/mips32/arithmatic/mult.c    |  78 ++++
> .../mips/user/isa/mips32/arithmatic/multu.c   |  78 ++++
> .../tcg/mips/user/isa/mips32/arithmatic/slt.c |  61 +++
> .../mips/user/isa/mips32/arithmatic/slti.c    |  48 +++
> .../mips/user/isa/mips32/arithmatic/sltiu.c   |  48 +++
> .../mips/user/isa/mips32/arithmatic/sltu.c    |  61 +++
> .../tcg/mips/user/isa/mips32/arithmatic/sub.c | 104 ++++++
> .../mips/user/isa/mips32/arithmatic/subu.c    | 108 ++++++
> 25 files changed, 2206 insertions(+), 1 deletion(-)
> create mode 100644 target/mips/tcg/insn_trans/trans_arith.c.inc
> create mode 100644 target/mips/tcg/legacy.decode
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/add.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addi.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addiu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/addu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/div.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/divu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/madd.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/maddu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/msub.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/msubu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/mul.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/mult.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/multu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/slt.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/slti.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sltiu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sltu.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/sub.c
> create mode 100644 tests/tcg/mips/user/isa/mips32/arithmatic/subu.c
>=20
> --=20
> 2.34.1
>=20

---
Jiaxun Yang


