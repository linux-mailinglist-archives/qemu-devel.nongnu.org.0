Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268BB2E0379
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:43:36 +0100 (CET)
Received: from localhost ([::1]:47306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVm3-0002eD-8p
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1krVj9-0001Cr-MY
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:40:35 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:52909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1krVj7-0004B6-Rs
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:40:35 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3219E580403;
 Mon, 21 Dec 2020 19:40:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 21 Dec 2020 19:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=u
 Oo7Ajei8Ye3lpMN7dla6kdCVmG0ed5TOowTvWiFjFA=; b=c4do2k7/qq6MawmFJ
 R6c7oGJ19os0dGN2p5eXzNNlmMXnWrFa4gueQpRqawZ5I3wECXxxdiboawW9FxB6
 ygm6yRcQ6H8coJvBM+eaYgZCdZMWucmy9MbxapcRYPS3ly6w8NkBbBZd8IT+2CJM
 tufIHnVvFvWsOiZQ6PNc2BXOysxbVp7nw//zUKfcLsnnrI8LQkeskQQTtjMb0waI
 eV4eluBCy8t7y3vxI8+lkD5KjhESPYOMHCloY3sf8v53EagoW4RboRU4xoZEf6ZM
 MJP79lYy8y/uD8N93kPCUI1Msn6pF8/mZOczdjwSZsk6k+2pkxt/aw9sCuFvuC2K
 gVzOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=uOo7Ajei8Ye3lpMN7dla6kdCVmG0ed5TOowTvWiFj
 FA=; b=ChzqSFoq6aKQq3eUQ+RA2UCNP8T096Tv08BVopb9mwn2VcRnHvbcxkUsC
 h36AF+G/IIp8a9kDvX9e5oI6G46x7OQjWop2XDDiNLpc61Bc5mAS0lfCddHLGZzM
 +gnyGk6BqLYHi7p/Q2zNTwSOAFQOmavRAA0t4DlmLu6+ZF3z4UKc2oPt956vWBfj
 64UgxLEh/2gTgtcC7vW/irGgT0yIPY7KpvSa1VTApswgHy4//7mrCIfQ5vTWUi/P
 hdn4b/jVYkmxYSR+lX6Gj+J8dDwwwHyBV6G8XKt4SUsqCgjLR0apFbtaC2/Rv88g
 HjdTnU6XEcDhQN70OZ1+nRh0cZNCA==
X-ME-Sender: <xms:gEDhX_KKajbEbY-pHo7n-WY-8RzAvUVyUPDPTN_pBWXqvruahfeHJA>
 <xme:gEDhXzKxQB80TSb3d2vqnHSvDY2-CRF9CWOD7dRtCcm_qTf7tHVT5Tpvc5XcAgXZE
 YE75f1EjqDsSH1oDu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtfedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
 ffeugeevfefgfeenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:gEDhX3u2NhsQcj47ZcKDUnLehIGlFM7DNJ4L5ilvUPl6Lgcbl6PPRQ>
 <xmx:gEDhX4agheZVHgDxwCKa238z9mGv6UEdE6ZhL3nAbJXTRBk-ZEMqsg>
 <xmx:gEDhX2aB6aDgYHnduz7Sr5-K7rtlMXuFMjhOkIlBUeGFEEO2K_Kqow>
 <xmx:gUDhX2EWrzSsygSH-QKK98GP0rPh_cpXzVHeh67X6D1mmpk6DbUZHIiE7Uc>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0519D240057;
 Mon, 21 Dec 2020 19:40:29 -0500 (EST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Willian Rampazzo <wrampazz@redhat.com>
References: <20201216181759.933527-1-f4bug@amsat.org>
 <ad7ff216-66b9-9b0c-eece-80a294240c28@redhat.com>
 <CAAhV-H7f4Bw_+BLCC0DcrUQKK0nUanQTTQ+a272ADBheB_NBJQ@mail.gmail.com>
 <57336906-ec68-020a-9388-4d43db937a81@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ec1ac9cb-0cea-51a3-548b-08d591a6a0e0@flygoat.com>
Date: Tue, 22 Dec 2020 08:40:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <57336906-ec68-020a-9388-4d43db937a81@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.233,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2020/12/21 下午11:34, Philippe Mathieu-Daudé 写道:
> On 12/21/20 1:51 PM, Huacai Chen wrote:
>> Hi, Philippe,
>>
>> On Sat, Dec 19, 2020 at 4:51 AM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>> On 12/16/20 3:17 PM, Philippe Mathieu-Daudé wrote:
>>>> Test the PMON firmware. As the firmware is not redistributable,
>>>> it has to be downloaded manually first. Then it can be used by
>>>> providing its path via the PMON_PATH environment variable:
>> A1101 is a real machine type, and there is a UEFI-based bios designed
>> for loongson3-virt machine (though it is also not redistributable),
>> why not test that one?
> Well, if you already shared that information, I probably missed it.
>
> I'm trying to add test for your machine to be able to test it regularly
> to avoid regressions... I'd rather let you contribute the tests :)

Hi Huacai and Philippe,

I will contribute a test with our port of PMON.
UEFI firmware lacks reasonable console output and interactive shell.

Thanks

- Jiaxun

>
> Phil.
>


