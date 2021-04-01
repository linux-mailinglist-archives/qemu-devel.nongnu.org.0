Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8A63514CA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:29:28 +0200 (CEST)
Received: from localhost ([::1]:36472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwRz-0001Rv-NK
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRwPp-0000Ic-E1
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:27:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRwPl-0002M0-Lr
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:27:13 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id AE5925C0053;
 Thu,  1 Apr 2021 08:27:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 01 Apr 2021 08:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 VB8x9Jnf+DiEk8Ny35Y/PAhQzX2nKtEBzS9g2dp9zTI=; b=fNoGItrcP7qiMmz4
 sssq+7gLYaGMSJIOiT2kiVOSKIuieEr97hmMQT9gVcukNzTC455K1Pio6UkQo4Cb
 M7Bguj3JbeR8El9YT/GmNBgcw4k0q/B5hCNSNpcIlohUrkX9aTQtNAmlbwdIczHA
 /ySfz2wRibBkUGrH+b3240WS+CpNQVo42eZBaQhwY8psLE1QUVVzVZbSWqiCo0Pz
 SKezsKX0quS+8FoXVYDj8Yxrq1oEPYukgeyQt82JttOcYmLaXz34BKHiH68XMpGO
 BSm8gO2r2fbb+NkUnjvWQvKABHmmvrhuB8qIP/wlRj3080lD6gbcVuAX9+gWmxbP
 HjNaKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=VB8x9Jnf+DiEk8Ny35Y/PAhQzX2nKtEBzS9g2dp9z
 TI=; b=IAa2vx6sy8pjGiuamyWNKo8aBHUxDTvvQxtm/TesX97W+RIiS4i58BLKp
 XrcRhm8dZT4I7Vblbatm9ZDXIuOUaJq8xa7TPqUjYjrGo7gXeu3QOjzmIwzZCpNk
 bDBDQotkGQYGCfeht+0bX6Je7niVFc8IEMh0MgqdSxYeG28ZTkmadFWLxv5HTqdm
 mQKhjmi/tZF4N9IsPECy+lidi0EkDnP94L0qzL+Uq/uv6lqbPgZt9xuWM02RGG6R
 jVl8taY307MunRow0v/Bf1OskGRx0FLz7ric3/J7oeE85cxV2N/SR1gnApvp1cQe
 F131bxG+nSwN/PJ4vIgIzEXe3Y+KQ==
X-ME-Sender: <xms:HLxlYN8rnJZno0Ns69ee_2_LFoCBL0kwLoxBfcv_bBK3mgXEp2NQew>
 <xme:HLxlYBskc4swLRQN7akwDrjZQZ0BuJa2J3YEWO4afyOrxaByvL5zwtwB7dyymvQz0
 aKsGzsR5Lfd_RLEHaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepudeuveeggedtveduudejgfeiffeiveduiedvjedvudefleetgfefvdfh
 kedtieejnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:HLxlYLD5unz5mKV34NsRRsyIqS2UCTOZwZbTn5TSoaxguMrMgYA5YA>
 <xmx:HLxlYBfcEytzLipx_ImRPuMVvdhL2ulxIgSGypCrCsGctlpmElH11A>
 <xmx:HLxlYCMkqULwd3OY7qmiBRPWC7xKr9nnJD33XAhCMzJKPqSfsudiTQ>
 <xmx:HLxlYE2z6xbJTNvEsC7GAqspaoqgtQ6P3gvcMItgs_1sz-6JVTC3Qw>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2E7D024005B;
 Thu,  1 Apr 2021 08:27:08 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 07EC8A28; Thu,  1 Apr 2021 14:27:06 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified
 device for Type 41
References: <20210401082544.16522-1-vincent@bernat.ch>
 <20210401082544.16522-2-vincent@bernat.ch>
 <YGWUrw9wgOI1E3aN@redhat.com>
Date: Thu, 01 Apr 2021 14:27:06 +0200
In-Reply-To: <YGWUrw9wgOI1E3aN@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 1 Apr 2021 10:38:55 +0100")
Message-ID: <m3sg4ajilh.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=vincent@bernat.ch;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  1 avril 2021 10:38 +01, Daniel P. Berrangé:

>> +                t->bus_number = pci_dev_bus_num(pdev);
>> +                t->device_number = pdev->devfn;
>> +            } else {
>> +                fprintf(stderr, "%s: cannot find PCI device %s\n",
>> +                        __func__, t41->pcidev);
>
> This isn't terminating execution which looks like a bug.
>
> Modify this method to have an 'Error **errp' parameter and
> use 'error_setg' to report it.  You'll need to modify the
> smbios_get_tables caller to have an 'Error **errp' too.
>
> For the callers of smbios_get_tables(), you can then just pass
> in '&error_fatal', to make it print the error + exit.

I did that. I wanted to also return -1, but it would require to tweak a
bit more code, notably the SMBIOS_BUILD_TABLE_PRE() macro. As the
callers are using error_fatal, I suppose this is not strictly mandatory
to signal the error through a return code.
-- 
Have a place for everything and keep the thing somewhere else; this is not
advice, it is merely custom.
		-- Mark Twain

