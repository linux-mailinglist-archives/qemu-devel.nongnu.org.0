Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1822E6E4A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 06:27:25 +0100 (CET)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku7XX-00030k-W8
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 00:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ku7Wn-0002ao-AC
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 00:26:37 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:49385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ku7Wl-0008Qs-I6
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 00:26:37 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C4C9B5803FE;
 Tue, 29 Dec 2020 00:26:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 29 Dec 2020 00:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=M
 B6vz86Kx9JrGM+CKSqeDt0pnUEE2W3g9n/PSa7FLDg=; b=glr9Xcfq5hRIlACPN
 6CqSl7XqD8i7rWt5yR1LIOOLh5mIoT4pvltJD8j1xDIz68iRK3rD/TF4jL+OgtNP
 +4ubeHqdzy7ptGlSzxwucUJQPZ+rVh1/+WdIvNASp/GxLEK5KdO21H42ndE4Ry1+
 jxrUpgmszM6IioyOAjLSjzfeLyQVj2H4s7lSwJdgkO80ieo5mBK2MTH7HZbuTYT+
 qjPwKfcf0NeB9UtxAdi/17avKWS12Uy6diD2gSIVgHZGyVmvVfIYrSiW5QPw4q9H
 d63ZWqe/xBoWN1KPqR9ehgRMEMr6xEqI5Y+g6zxx4rt/fB64qC4l5zfm6weMJren
 /5cyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=MB6vz86Kx9JrGM+CKSqeDt0pnUEE2W3g9n/PSa7FL
 Dg=; b=QwDkTqlAX5syTNJgphjLkGPHBUnZbetGilydZEBCLxhl+4hMF9cYEKvaW
 6uwkemn6t+J3D+/2BHbrdxQvI0AKNQrLnDrNcRx1Ww3DUztSd03ieyiEO3DP/imm
 z+mbrL/z5PVw+5rsUnB3pmnLQsL7gyHc8nXzheXsPlIhA9zBqvfImWGA/hui2Tpu
 k1N6VrXE9+6se490J634r8nROsclWkEbdXMrRZmueXoizmsqaEkEV4vox6KpaW6u
 zHyvug+mH09cfFTI895wdWk1nQI4oKJsqeVk8KHu4RAt492akI1jlfbmelAZmVnj
 S/SYI+fPzZtPe4jDU6NlvWuIk0eIA==
X-ME-Sender: <xms:Cb7qX4if6fLYMcj6AE40QMZ-wY8MAKOoF1RBE-8ZpUYJvp29GPCjUQ>
 <xme:Cb7qXxA5I5xkr2v9_ArYu_86eJDm6gZWwAEF5dCufRJh3ZGFpCaAVIfzQ-1t7-dmw
 o-8N8S4eO81tj2clXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvtddgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
 ffeugeevfefgfeenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:Cb7qXwEEZJJ-Q-tNkrBAUgaR8vTtBmikOQSCaDcLcnrLJO3Eb_VWTg>
 <xmx:Cb7qX5QG_gNCObhgbkxALJfQjjbvX5T4JcLeums-QYFDp7PoQwpanw>
 <xmx:Cb7qX1yJxZEoRClQsKx2Yeg-n1yT8_j04faEKOnxzvNYx4IpS05JuQ>
 <xmx:Cr7qXzZA01hXGUZEX2E5qRrVuahfsBrHSBkxM0gG8iUz3x6dXSQ-dA>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68B47108005F;
 Tue, 29 Dec 2020 00:26:32 -0500 (EST)
Subject: Re: Bug in Bonito? (mips/fuloong2e)
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <771a6cd4-90a7-662e-5a5b-e8a9395a875@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c655a692-991e-b633-456a-6fb149520a37@flygoat.com>
Date: Tue, 29 Dec 2020 13:26:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <771a6cd4-90a7-662e-5a5b-e8a9395a875@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.698,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2020/12/29 上午11:26, BALATON Zoltan 写道:
> Hello,
>
> While continuing with part two of my vt82c686b clean ups I've tried to 
> implement SMBus IO base configuration in the vt82c686b-pm part that 
> I've already done for vt8231 for pegasos2 and it should be the same 
> for 686B. (In short, writing address to pm config 0x90 sets base 
> address of smbus regs and bit 0 of 0xd2 enables/disables it.) This is 
> what the firmware does first and it would allow removing hard coded 
> 0xeee1 value and the property to set it and then I could reuse the 
> same PM part in VT8231.
>
[...]
>
> Any idea what this is trying to do and how to fix it?

It's trying to translate Bonito style PCI config space r/w to standard PCI
config space R/W.

A quick galance told me change BONITO_PCICONF_REG_MASK to 0xff
may help.

Thanks.

- Jiaxun

>
> Regards,
> BALATON Zoltan


