Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1C620F44
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:39:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMwP-0002Kk-6C; Tue, 08 Nov 2022 06:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1osMwN-0002IL-6x
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:38:51 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1osMwL-00071F-GU
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:38:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 18AC43200907;
 Tue,  8 Nov 2022 06:38:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 08 Nov 2022 06:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667907527; x=
 1667993927; bh=8ZHAt9cqtLzlvmQiMwkKtKKlBUGewMI0PDkVmfFKnCA=; b=o
 pLQb6dyfcNbAWc0YEf8g4l4Szi8BMowQqFD/38EnW0EXGYlXcSj3xFHCSYGtLLtg
 /zsgcTHRsPpI2wd50CPBuxKptye+KUZSZ35jRFht9akoWf2JSmTr9wXLhbkD3OgX
 HYbXy27drzH3dcrFpwIKyUOGdOrfEFKxB3qPfCU7aQJT9YXxm3D1TikK0EnB5VJ8
 SxdhjLGc9QQASRU2NIdiKA/N622QFNkGzbcLdJNaQrXcirhDF1HsVIzni3GaIC1L
 wSGdymIoq/O+1ZnsWxe20oNrOj1TBH8X9h2dzFS4BraSQ4Yxh5q49fovTSH2ELc7
 kAvdXEy5fT2DCDJNFl/mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1667907527; x=1667993927; bh=8
 ZHAt9cqtLzlvmQiMwkKtKKlBUGewMI0PDkVmfFKnCA=; b=SnmhFu+NxXY2wDAq3
 2LttG+NaBCUA5FKHNl6faDDmDlxmpVn9o2FrYkwBuv0ZB21mBzy/v5+WteiFlOyT
 +p4CjFtq/9duMSQ2XTe+/i5NUbqCTqqYnPov6uS4LNuAZT6izV+tNt+GT8Gpu4VY
 8VfhV0Xuak8Ly84qpw45YErpZpw4ii/rxjiX8aygTE0fOTytMjOLJDE+2tXIR0Nz
 usj3ltdjTvq3gmgA5eejDOPy92Jo8wXKrkunVX8sBvEFUZ9eF+lM5g7JFlHp3BPk
 3KQEm6JZr6CgEVHyGsN3VbFAB1I3ojTynDXI8q4SjnA45GM5KJqI9OVzwbM97cqa
 1NXcw==
X-ME-Sender: <xms:xz9qY0P6n9PBgF9kzmQlb0bPjnjn6U6obHzX1IBvZMesp6nLynunAw>
 <xme:xz9qY6_cr-2ti1C7S3UNrYOAeAVrBWhXn9VUB1yrbn-8vuH0ixuhkvOj6lzhnZOXh
 qwg8BbXqSgo5dJmuAs>
X-ME-Received: <xmr:xz9qY7SI2l4mX2QfEFVBvpoy-_5Qmvaika3nhFocfGg3_8mWQcB98tb53kGCfczX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepheeiuddvvefhkeejfedttdekieethfdukedvieeuueelgfelieej
 geehvdekudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:xz9qY8tYsRyi8YKNv8_gs5m3_ZVG1WLVIfBTVJgg42WxUu0DP-HU3w>
 <xmx:xz9qY8f0sK4ITG54zIQrwyErwpkNEV1nVev83wR9wKFLKSca688VCw>
 <xmx:xz9qYw2fnReUHkhxL86xy9qUrToKRpLvR5lXgYI9Qe-9LqZdRc1BNw>
 <xmx:xz9qY0mIZKsGvMCO6X-oLmKBKvgklkx7yBnIZB7s-qP7H2zDLSnhQA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Nov 2022 06:38:47 -0500 (EST)
Message-ID: <0eb13e3f-6003-7590-e883-cb383443a063@flygoat.com>
Date: Tue, 8 Nov 2022 11:38:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] target/mips: Don't check COP1X for 64 bit FP mode
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
 <43f4db9f-786e-c45f-f2a0-fa46fd8fa24c@linaro.org>
 <c8ca4542-31ce-d5f0-84d0-127ae3f4e050@linaro.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <c8ca4542-31ce-d5f0-84d0-127ae3f4e050@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/11/7 23:29, Philippe Mathieu-Daudé 写道:
> On 7/11/22 23:47, Philippe Mathieu-Daudé wrote:
>> On 2/11/22 17:57, Jiaxun Yang wrote:
>>> Some implementations (i.e. Loongson-2F) may decide to implement a 64 
>>> bit
>>> FPU without implmenting COP1X instructions.
>>>
>>> As the eligibility of 64 bit FP instructions is already determined by
>>> CP0St_FR, there is no need to check for COP1X again.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>   target/mips/tcg/translate.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
>>> index 2f2d707a12..e49d2a25a8 100644
>>> --- a/target/mips/tcg/translate.c
>>> +++ b/target/mips/tcg/translate.c
>>> @@ -1545,7 +1545,7 @@ void check_cop1x(DisasContext *ctx)
>>>    */
>>>   void check_cp1_64bitmode(DisasContext *ctx)
>>>   {
>>> -    if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | 
>>> MIPS_HFLAG_COP1X))) {
>>> +    if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
>>>           gen_reserved_instruction(ctx);
>>>       }
>>>   }
>
> Did you test your patch? I'm getting:
>
> ../../target/mips/tcg/translate.c:1548:49: error: expected ')'
>     if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
>                                                 ^
> ../../target/mips/tcg/translate.c:1548:8: note: to match this '('
>     if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
>        ^
> ../../target/mips/tcg/translate.c:1551:1: error: expected statement
> }

Woah, typo when copy changes back from test machine...
Will use git publish next time.

Thanks
- Jiaxun


> ^
>


