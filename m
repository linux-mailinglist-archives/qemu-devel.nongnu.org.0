Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A735130D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:08:54 +0200 (CEST)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuFx-0006nA-Tx
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRuEi-00060c-Jt
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:07:36 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:56257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRuEg-000859-RW
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:07:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id C75882D5A;
 Thu,  1 Apr 2021 06:07:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 01 Apr 2021 06:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 TO1gxBt4tZlbMfFNeVpfx8d3MDgdjrSmNCdLlz6H6Rk=; b=EO0y1/uJjR8/zT/C
 98AnjPC1iDtg5bfK1uylrGgZoEfegBUOG3WoScSSRrnwJGjc92587/uKAfuoILTD
 sLHcocNkMbSsT6vLnk20djnAm2+Gj3YAuGcAUXQX7TKrE5dIV/443F1MHKsKtCRg
 IzDRKZmdffzbz14fxg7z9SIGSMW1MNgqrYBX+ECjSmjq0GAGMl7kx87T788GyRFT
 TnZ0xe4dZr4GBQGE7LpgldNqftouDRdHhPUGD29zSkC3swHymAqvb6+c0vnL9isq
 zXKsCXRW2O6A1rDqoyshOcn6wdA2lrAwwDVB6hXAzOym3Fm+rhiNrQk5TUGi8r+n
 AE5GBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=TO1gxBt4tZlbMfFNeVpfx8d3MDgdjrSmNCdLlz6H6
 Rk=; b=BUxo3R7IxXouASWwP8PD3e+i3lGYjd3zu1RGtsYj3nnhjelTjo6gAp3Lg
 3E9xctj7arP/gcLgFzsc1iicdYlRRKr3mn93uKVpKKt9bl0jEWlEFoShsHQGskzH
 yh0ugAROXc/wFpQpSNR5cPRDnqFaagRWC0+TJUGqnR4ks4xFaVN6NR87BGlDs0nF
 wMIlVs7am98Yh96urjriLPJQ1rMHLor0XydQV+tgFs5EWOLa76tbNynHKqRoBFAq
 7sGsBJ27pKHjyHtiRrtdgre1kxFILbp896XDbohvh/D+rEVGarNtXWl8rEne40Sc
 Onp6YVmAKrDPLvomkRSaCp7wnC32g==
X-ME-Sender: <xms:ZJtlYJCu2pHnwrQzMr8cy_T0lqQ8FwzPwv1gbW0uQ7j3uzJV6nOGhg>
 <xme:ZJtlYHjPp6e17dJhVA1HkIBgJeti1QKYNSxaYD7865riCvoRuZqpjyyxSJrLL0MBa
 qBLX_0jmmasBsDkw1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepudeuveeggedtveduudejgfeiffeiveduiedvjedvudefleetgfefvdfh
 kedtieejnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:ZJtlYEl-2XCToefySUFcXbg-ahV62BpIULjT9abZAzT1gpE0jCW8fg>
 <xmx:ZJtlYDzHP3LIMof8kLHuhwKV7JDCzfOec_xFhKYzgADKrFA2my5P4A>
 <xmx:ZJtlYOSAu-GUePxRzQRTFSiEN9YTNETXEcy7AEvtQo00qP-cxaZrDA>
 <xmx:ZJtlYBL--YFdAs_f9f4K1RafeN95J5H0j2hQZkxTYckVbEERKcE1Yg>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id E07A41080064;
 Thu,  1 Apr 2021 06:07:31 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 4E146A28; Thu,  1 Apr 2021 12:07:30 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified
 device for Type 41
References: <20210401082544.16522-1-vincent@bernat.ch>
 <20210401082544.16522-2-vincent@bernat.ch>
 <YGWUrw9wgOI1E3aN@redhat.com>
Date: Thu, 01 Apr 2021 12:07:30 +0200
In-Reply-To: <YGWUrw9wgOI1E3aN@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 1 Apr 2021 10:38:55 +0100")
Message-ID: <m3wntmjp25.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=vincent@bernat.ch;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

>>  hw/smbios/smbios.c | 47 +++++++++++++++++++++-------------------------
>>  qemu-options.hx    |  2 +-
>>  2 files changed, 22 insertions(+), 27 deletions(-)
>
> It doesn't really make sense to have this as a separate patch
> when it is deleting half the code you added in the previous
> patch. Just merge them together as one.

I'll do that.

>> +                /*
>> +                 * TODO: Extract the appropriate value. Most of the
>> +                 * time, this will be 0.
>> +                 */
>> +                t->segment_group_number = cpu_to_le16(0);
>
> Hmm, tricky, as it requires interpreting the PCI topology. Wonder if
> there's any helper that can do the hard work for you

There is pci_root_bus_path(), but it returns a string which could just
contain a segment or several segments. It seems the SMBIOS standard
didn't account for complex topologies. I could parse the string. and
keep only the right-most segment.

>> +                t->bus_number = pci_dev_bus_num(pdev);
>> +                t->device_number = pdev->devfn;
>> +            } else {
>> +                fprintf(stderr, "%s: cannot find PCI device %s\n",
>> +                        __func__, t41->pcidev);
>
> This isn't terminating execution which looks like a bug.

It was my intention. The PCI address will then be 00:00:00.0. If you
think it's better to terminate, I can do what you suggest.
-- 
Replace repetitive expressions by calls to a common function.
            - The Elements of Programming Style (Kernighan & Plauger)

