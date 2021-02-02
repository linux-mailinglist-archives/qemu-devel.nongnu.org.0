Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A230B60B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 04:50:57 +0100 (CET)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6miO-0001q2-AW
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 22:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mh7-0001Og-St
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:49:39 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l6mh6-0001zp-Eo
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 22:49:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3FAB5803E7;
 Mon,  1 Feb 2021 22:49:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 22:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=k
 vOAecdNULk9yw1e//8fp1iYNQ6tWD6bzhktiQG2XqU=; b=stkaruIWIgt8O2pT8
 kjDONj4v7xBbUNYmOxUZdvdV9pXQDsJKWpgcI+y4GGYpCHd2M7Tjffykn4o9T//H
 D4pgceNXhcs1WolD5HUq5J+/7jhHoMt+CK1LEYgFnvpRL0oQx7mU9zlOwpoDTrTc
 sSJeB2vw/j9818LfmJ0DYdsxDvU3pUa39RvP5DtXW5/C7wLjYrTVhOV8R9320IIo
 ZBs0L0RH8anG5Bv+5Gsgnzn4fGHpP/6zg21gqvnbNw+q88efuJkf4SWJfpUMfUFp
 FakL2YMdJGI5ykZD9Hmvqm1zjCa/77cJp+SwHn2TkiXyJ7yj4VA0LPSktoygyUL4
 tXRdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=kvOAecdNULk9yw1e//8fp1iYNQ6tWD6bzhktiQG2X
 qU=; b=MGUQsq47giWXIW7A7Pm9bwIpFtv6OGn6nSUIVM+WSLgA+CaOwH3X/ydXK
 ZAfe3xL7uegxmmYCZKJus170JSJToGEQ1ET7tjuOaHUbfuxsJ7q53Ta9tPr4n/Z2
 pMSll4Hsgx6Fp9WzJgRkxpdGwaHQT2xJFSSuU/S9iuelCpOpBemS3aJLtGt9xfUH
 2J98dRApNoe01k6yCsGUr4DWj+cOj1D6Y1Ie3q4mEo+vjnq1n7CH1G0q0tnlRmjL
 0USFO0jeBTTIeneJt7OU/wgIKM1mBvLFdRTcBcbuj0xno5at8zt1tDQzLk25SJpe
 KdZHyBzgKNn3KMpI/O2wcu0gb2XaA==
X-ME-Sender: <xms:zssYYHV9bPp2-bdX8_TMd8XhnqY84bCXrI9y_DnM7VWG8kW7J2UomA>
 <xme:zssYYPgJOp_AD08Q-8xP5vm85EYG4nMN9X9N_g5TsdfY7QQrhQ4GkNZXh5JGJNxTP
 MsaD6bq1XWF6X-Axm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeduheegrddujedruddvrdelkeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:zssYYAQEcNKXb6Wo0ro4mG_eBWCTi_ySUIZH0cu_wN_uDksBC7_hyg>
 <xmx:zssYYKE6qCplBpAiPe6-kiPUpOpxKmbxuPeivFzhOUwhYSEzGMkH2g>
 <xmx:zssYYAmmuAfEmLK0LFa2N_mneaz1Az24WrV4UU4ylmVLObGCR871yg>
 <xmx:z8sYYKwchpscpyIzp16Y7H7wFhDgv0HgIOAcks7TWnz7zwltnDcUPg>
Received: from [0.0.0.0] (unknown [154.17.12.98])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26CA024005E;
 Mon,  1 Feb 2021 22:49:32 -0500 (EST)
Subject: Re: [PATCH v3 0/4] MIPS Bootloader helper
To: qemu-devel@nongnu.org
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7d31e507-2baa-de1f-9cba-e376642e88a5@flygoat.com>
Date: Tue, 2 Feb 2021 11:49:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/27 下午2:54, Jiaxun Yang 写道:
> v2:
> A big reconstruction. rewrite helpers with CPU feature and sepreate
> changesets.
> v3:
> respin

ping?

>
> Jiaxun Yang (4):
>    hw/mips: Add a bootloader helper
>    hw/mips: Use bl_gen_kernel_jump to generate bootloaders
>    hw/mips/malta: Use bootloader helper to set BAR resgiters
>    hw/mips/boston: Use bootloader helper to set GCRs
>
>   include/hw/mips/bootloader.h |  49 +++++++++++
>   hw/mips/bootloader.c         | 164 +++++++++++++++++++++++++++++++++++
>   hw/mips/boston.c             |  64 +++-----------
>   hw/mips/fuloong2e.c          |  28 +-----
>   hw/mips/malta.c              | 109 +++++++----------------
>   hw/mips/meson.build          |   2 +-
>   6 files changed, 260 insertions(+), 156 deletions(-)
>   create mode 100644 include/hw/mips/bootloader.h
>   create mode 100644 hw/mips/bootloader.c
>


