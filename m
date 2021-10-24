Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE439438B62
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 20:28:58 +0200 (CEST)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meiEr-0002Ki-HV
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 14:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1meiCo-00010n-Nw
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:26:50 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1meiCm-0005LP-8u
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:26:50 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3CF7F5C06AF;
 Sun, 24 Oct 2021 14:26:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 24 Oct 2021 14:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=9
 OlMpLm3Z6AIxDuodr9RVh5j5Ap/F1yeo37tCuD/HlY=; b=Juv0EEyk2IB+oA983
 lQHqq83By1tNrR4PQxpu6mwkrduqe7XpNrHghscj554a6YibTWaBMAccrYtoq7pU
 pZkubvmy5iTUMkWfemWyIeOGHArioaFrdKhJpX8W9SRqPM5rmuvds51LzVfbIk+q
 /kJq+S/jshTC/9uue8wIJgTNGDrFdg5FQYgMRpXIIw8xkLI+7SdHL32u5V6Dua3g
 1PSNJpTZJ8xiTGJVIpjErA5ImzmKTf8M/AfuxmCq9gSEOkx+3XQX7HDWKYKjB2H7
 8wePT3LK/5cfHQxtnN3jO0+JgGdLRrjwkyGSmzpgDZs/6jiACNrdyAyNO0FKZ/ir
 Z0saw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=9OlMpLm3Z6AIxDuodr9RVh5j5Ap/F1yeo37tCuD/H
 lY=; b=Xtb0EKDDZi0IOdNK4XQW3S5QHlqklsckPPnphfH3mZGnDvHkZUkH5ucUI
 pka4zALe1+NhksSBoySVzdxZ1GHhKq7cgt1vw1HR1b2paHJasdTaBsiWc15pKQlF
 7dSf3Wfl88NJVMg6i2fcDatvv0ur1K9cYlFkj/X5AvMVcV+IcdTNuyHVt41/nqIa
 5nI6wKsRcsmrRrQftqWcLx+Gh7eCRZLMvQySPHsOUbIW9VUol9MlS8WPVCxvWRlT
 U2hv0muX2wCvohhdnpnl1E1p2cRPAV3NRiW9dJ5qpNnqyriYOp9wZ3ioG605M29s
 26PAHofczJSWtHRW384JKVEWMkDfg==
X-ME-Sender: <xms:ZKV1YYa75KuncbVJd8DeDJ8bNuLIrqgNMxYimCv2L5AD6SIvsLG0Kw>
 <xme:ZKV1YTZYXAwbzlQ22vw2AwH4IExQX8r75kSmJryvWSJBXI3EZTnv2YKDLgh0BnzKj
 lhUZ-t-ALO9WkI-n90>
X-ME-Received: <xmr:ZKV1YS9rulc86UJliNlSefiN4AwQUk80Mq05JHce2oeNZD2FM_REDwRGysz3JKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeffedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeejffffgeeivdeffffgleffueeifeevueejueefteegtdehvdek
 hffgveeuuddvleenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ZKV1YSpJ46y_pOUiIrXhAUOlRRVRk4Yl-ERUQ1PdHPGBwG222mv9pQ>
 <xmx:ZKV1YTqnfetxh_YA1YoKqXPppfIwDUW7dtPrKDy20LDW_1L4A52a6g>
 <xmx:ZKV1YQTsHB-4YXdX5D4N9a-Bgo-Q-cz0Ime0v04p5v_BiMQnfXqOeQ>
 <xmx:ZaV1YSVOjXddOzXAeIt3obtfSek6Kua3NBcAKSEX_oMpIZSfLtx6OQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 24 Oct 2021 14:26:43 -0400 (EDT)
Message-ID: <3331bed9-5435-1ef8-197e-f67e358c2768@flygoat.com>
Date: Sun, 24 Oct 2021 19:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 00/33] target/mips: Fully convert MSA opcodes to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/23 22:47, Philippe Mathieu-Daudé 写道:
> Hi,
>
>
>
> This series converts 2000+ lines of switch() code to decodetree
>
> description, so this hard-to-review/modify switch is auto generated
>
> by the decodetree script. This is a big win for maintenance (and
>
> indeed the convertion revealed 2 bugs).
>
>
>
> Massive convertions are - beside being often boring - bug-prone.
>
> In this series we re-start running the MSA tests (the tests are
>
> run automagically in the 'build-user-static' job on gitlab CI).
>
>
>
> Although boring, the conversion is very clean, so I hope it will
>
> be easy enough to review. The TRANS*() macros are heavily used.
>
>
>
> When possible, constant fields are hold with tcg_constant().
>
>
>
> Note, various opcodes can be optimized using TCG host vectors.
>
> We won't address that in this series, as it makes the resulting
>
> review harder. We will post that in a following series. Here we
>
> simply dummy-convert.
>
>
>
> The resulting msa.decode file is quite pleasant to look at, and
>
> the diff-stat is encouraging: number of LoC halved.
>
>
>
> Regards,

Thanks that's really helpful!

For the whole series:

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Double checked decode tree opcode with manual.

Thanks.

- Jiaxun

>
>
>
> Phil.
>
>
>
> git: https://gitlab.com/philmd/qemu.git tree/mips-msa-decodetree
>
> Based-on: <20211023164329.328137-1-f4bug@amsat.org>
>
>
>
> Philippe Mathieu-Daudé (33):
>
>    tests/tcg: Fix some targets default cross compiler path
>
>    target/mips: Fix MSA MADDV.B opcode
>
>    target/mips: Fix MSA MSUBV.B opcode
>
>    tests/tcg/mips: Run MSA opcodes tests on user-mode emulation
>
>    target/mips: Have check_msa_access() return a boolean
>
>    target/mips: Use enum definitions from CPUMIPSMSADataFormat enum
>
>    target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
>
>    target/mips: Convert MSA LDI opcode to decodetree
>
>    target/mips: Introduce generic TRANS_CHECK() for decodetree helpers
>
>    target/mips: Extract df_extract() helper
>
>    target/mips: Convert MSA I5 instruction format to decodetree
>
>    target/mips: Convert MSA BIT instruction format to decodetree
>
>    target/mips: Convert MSA SHF opcode to decodetree
>
>    target/mips: Convert MSA I8 instruction format to decodetree
>
>    target/mips: Convert MSA load/store instruction format to decodetree
>
>    target/mips: Convert MSA 2RF instruction format to decodetree
>
>    target/mips: Convert MSA FILL opcode to decodetree
>
>    target/mips: Convert MSA 2R instruction format to decodetree
>
>    target/mips: Convert MSA VEC instruction format to decodetree
>
>    target/mips: Convert MSA 3RF instruction format to decodetree
>
>      (DF_HALF)
>
>    target/mips: Convert MSA 3RF instruction format to decodetree
>
>      (DF_WORD)
>
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>
>      1/4)
>
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>
>      2/4)
>
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>
>      3/4)
>
>    target/mips: Convert MSA 3R instruction format to decodetree (part
>
>      4/4)
>
>    target/mips: Convert MSA ELM instruction format to decodetree
>
>    target/mips: Convert MSA COPY_U opcode to decodetree
>
>    target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree
>
>    target/mips: Convert MSA MOVE.V opcode to decodetree
>
>    target/mips: Convert CFCMSA and CTCMSA opcodes to decodetree
>
>    target/mips: Remove generic MSA opcode
>
>    target/mips: Remove one MSA unnecessary decodetree overlap group
>
>    target/mips: Adjust style in msa_translate_init()
>
>
>
>   tests/tcg/mips/ase-msa.mak         |   30 +
>
>   target/mips/tcg/translate.h        |    9 +
>
>   target/mips/tcg/msa.decode         |  231 ++-
>
>   target/mips/tcg/msa_helper.c       |   64 +-
>
>   target/mips/tcg/msa_translate.c    | 2781 +++++++---------------------
>
>   MAINTAINERS                        |    1 +
>
>   tests/tcg/configure.sh             |   14 +-
>
>   tests/tcg/mips/Makefile.target     |    5 +
>
>   tests/tcg/mips64/Makefile.target   |    9 +
>
>   tests/tcg/mips64el/Makefile.target |   12 +
>
>   tests/tcg/mipsel/Makefile.target   |    9 +
>
>   11 files changed, 1052 insertions(+), 2113 deletions(-)
>
>   create mode 100644 tests/tcg/mips/ase-msa.mak
>
>   create mode 100644 tests/tcg/mips64/Makefile.target
>
>   create mode 100644 tests/tcg/mips64el/Makefile.target
>
>   create mode 100644 tests/tcg/mipsel/Makefile.target
>
>
>

