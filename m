Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2522F2449
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:37:46 +0100 (CET)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7gv-00070Z-Bh
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kz7em-0005nm-3Z
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:35:33 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kz7ek-0007s0-4c
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:35:31 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5F7AA58066E;
 Mon, 11 Jan 2021 19:35:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Jan 2021 19:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=8
 ECw2ui1DSz9RsQPvyjBTRfZymZzp4AdIegc3WoQ6B4=; b=KqdP4HoWz/2//yxe6
 7Q21+DI2k7i75Ohdku40/x5GZJImUI1cdRXRI1m+TYA5SpSOWkinwiEVrVjna84J
 q2DL33GJ1Ww7Oyam3FafA++EIS6y3lRmpJlnyHcLyrdKxdcdQnqwfr1plTx7Yk3s
 FLOAVYuChxBdD+JNex9j6w3IiSkP4BUJT4Jp3ij38Zza69dZkobjTCEzJrqliKVc
 Rje1j6THELA5RjeHJ9ijBF+TB6VDuojfOsyVFHfGgZUmtlK8HgKrEQ+N+rPpL1Cm
 vg2h+WrWVdzx2ENuz0n3JGP0dMQzMBRLp6zp5zFTLVhHWPLybnsA5/7rPvNKX17K
 +5/Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=8ECw2ui1DSz9RsQPvyjBTRfZymZzp4AdIegc3WoQ6
 B4=; b=cw8UPmoIs+d/Bb13NAULUH7QSvl77x2v4IFJDThVcwpo4mz8TSgbgLck0
 VATGXCugxiW8TviBuq8xZFH7cd//XoZroYSgNezATvEpHpZBM1HdfIzmEicxY6wc
 +Qcx9H8XBHSMMivyr2ICS26+ifqzSIz7CFHG9Ykm+ADvz2VQ3FFzV3xjKFzoMiNo
 FssXolcxgQfgJSjzbhDgrfszcWelVTmkRnzM6wqQsGo2tipxIrIbF6L/MflJUvB6
 rMZ7xQ/XHnyQnGZvPuUWlPJHcY4dtF+ppE6/5JgI7yrScI/J+ZAVJyH2FL4E2ml1
 ifkm6868NPVGT23M5GGl97KjjjVaA==
X-ME-Sender: <xms:0O78X5WDVOrxqQpCjXt3FBt9uzTV2je3Pjlwcc70x2qUB96K1d2hKA>
 <xme:0O78X5kAhn__SsQBLXeF70XJCP1lYVFBFAdQFscc_MZUiPU2mvdUSdJxkTZ0Rydu2
 jtidOfzYsvCVT4CJwI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
 ffeugeevfefgfeenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:0O78X1YPBOOL1q48ODBkn7f0qqwc5jhKCzfvgauR3B3x1xUSPHeYfA>
 <xmx:0O78X8U3rUrS60KoxXvx1OtsYoXDlkjKQxAmZ1OltjDVixVN4IUvdw>
 <xmx:0O78XzmBu-fXkUYoV6tOb5_v1MtJpMW9FjE5krCurSJFKISTBT3nGA>
 <xmx:0e78X4wcdiWOuil6A_yRiHy5a8Ba3zzcQHRdAcoVvnv4jrKcxpSqvQ>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id F33C8240057;
 Mon, 11 Jan 2021 19:35:25 -0500 (EST)
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
To: Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
 <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
 <b2dd6d33-d8e9-21a3-7b76-bdf44e117128@amsat.org>
 <3aece87-60ff-b195-8bd-c696bf461cb6@eik.bme.hu>
 <CAAhV-H71-wrTfDWN9zH2gU4gdJkCpMk5EDfAi1W1d4jXA3OkZg@mail.gmail.com>
 <3f383a52-6583-4c60-8f24-a24e6b95c068@www.fastmail.com>
 <29acb49a-4d1-ae6b-328d-6e3081e2ab2f@eik.bme.hu>
 <CAFEAcA8trw0PNeDaQq3dZa0q4qYoXF35ROLMHDw3qnJ=wX+vvw@mail.gmail.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <9ccb0e6a-4b80-eea2-b9f5-4eec6f8e1fad@flygoat.com>
Date: Tue, 12 Jan 2021 08:35:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8trw0PNeDaQq3dZa0q4qYoXF35ROLMHDw3qnJ=wX+vvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 BALATON Zoltan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/11 下午6:35, Peter Maydell 写道:
> On Mon, 11 Jan 2021 at 10:20, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Mon, 11 Jan 2021, Jiaxun Yang wrote:
>>> On Mon, Jan 11, 2021, at 8:36 AM, Huacai Chen wrote:
>>>> I think R_END should be 0x60, Jiaxun, what do you think?
>>> U r right.
>>> The manual is misleading.
>> The R_END constant is also used in loongson_liointc_init() for the length
>> of the memory region so you might want to revise that. If this is a 32 bit
>> register then you should decide what R_END means? Is it the end of the
>> memory region in which case the reg starts at R_END - 4 or is it the
>> address of the last reg in which case the memory region ends at R_END + 4.
>>  From the above I think it's the address of the last reg so you'll probably
>> need to add 4 in loongson_liointc_init() when creating the memory region.
> Mmm, or check
>    (addr >= R_START && addr < (R_START + R_ISR_SIZE * NUM_CORES))
>
> Side note: R_ISR_SIZE is 8, but the code makes both the
> 32-bit addresses you can read/write in that 8-byte range
> behave the same way. Is that really what the hardware does ?
> Or does it actually have 1 32-bit register per core, spaced
> 8 bytes apart ?

Yes, the hardware was designed like that. It have 1 32-bit register
per core but spaced 8 bytes apart.

I assume they were planing to add more ISRs in the future but as the
product line have been ceased I'm not going to handle that.

I'll send a patch for fix.

Thanks.

- Jiaxun


>
> thanks
> -- PMM


