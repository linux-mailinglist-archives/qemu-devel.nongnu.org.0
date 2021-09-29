Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A64141CA81
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:43:01 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcfb-00064r-Mt
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVceK-0005HZ-4k
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:41:40 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVceH-0004wW-P5
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:41:39 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 703115C0051;
 Wed, 29 Sep 2021 12:41:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 29 Sep 2021 12:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=i
 KVBSY/M+Xgk6x49Pbx3pp8V2c+R8NItmPH5KRvvSk8=; b=gq0xI7dQZHe3hrHiS
 X3sMCNW1p80t7sKqudPEVBYjBc4ddbQ9mhKWTiq2G63h8/jVfG9ByJeb3D9JYCKH
 azloidVUpIraf0gDq8z6IyoTir6zgBglvh+rKqoxl0bnwwczK0tOmj/9uNmlH8Dx
 DZiR09Mlu/FD3mfurt1FtHLdL0JJpSMfqFAcPcMLrgF/vyXbNt3GQfZZPecXI7Zq
 AmDUiw3oPzPyJFtblDG1l8I9QDAdhjvBcK+yDFhRszJA0n6GdvhQJUXnXJcTBtrA
 aTrW1t6xwmYxoGo0oSB/cWGXJwpWIL5DJYVQAsZ2zPf+E7fM/FDLat6M1N7Nhy4G
 jA5pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=iKVBSY/M+Xgk6x49Pbx3pp8V2c+R8NItmPH5KRvvS
 k8=; b=WCesNQMHmYg+GlW0UuOKknTTSMBNTjitZ1M/KYdIgyKnWQmS2HNuLxnUU
 EMv0GlLP7k+bgQZzMLe50BX57fQh3dERi5KujisRim0/V9wpLOVC33GUsGaQ2PIu
 ZiFZsrIDa0nDag+mvjQcb3lLTyxYAbeyQJYm81f5efvfRjs0glmIOu0eOOWlyQK6
 H8AvqIOz3UERV5F3Q5ya5Y5Zm0CETIcmqMTtXubUrnWrqelUgVsldTIZ/BChqFbm
 jyWVeZvfCnFtX3DzjZSiEESIaygoEjbucJdighmMJUbc/U6f9GCguVzLKo9lLKrL
 tbQ4iTWOr03orESC5YAfkEIdPu4DA==
X-ME-Sender: <xms:P5dUYcnz0KbdasnleZo0xsw-PlmfNfToDHpJ1NrT4IXeCJFS8NHkoQ>
 <xme:P5dUYb1-QBXVwL4x49-d23vE8FoDi6COjMHM3TZf_oGaXIVPff1gujmXuy4dSyggO
 ZNHsv94t16fO6fQw24>
X-ME-Received: <xmr:P5dUYaoc8LF6UgEG_o65uFbPbWwYX3jepoVDG1vIa7aBz1jaIlny6DDEuI8kfxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepheeiuddvvefhkeejfedttdekieethfdukedvieeuueelgfel
 ieejgeehvdekudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:P5dUYYlcmJq6Nl9R_DHmv0Jf8LVECJrAuGloVmxsjUvvT7NrLkyMFQ>
 <xmx:P5dUYa1Akg7kbdZnchojdy3fPlcBkIGBdh-FVWueWC04ZF1W-7Hysg>
 <xmx:P5dUYfuTw8Dvgg7fTVqDHRckVaMU5Gdga4mjOVpWxDe0fbtnQALcjA>
 <xmx:QJdUYfxdDoBNi5uV4hbHXncmZn_ywEHsy8OMB-QMgjaEQSqoxE3zmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 12:41:34 -0400 (EDT)
Message-ID: <a369f0b4-b8eb-894b-569a-88c09681876d@flygoat.com>
Date: Wed, 29 Sep 2021 17:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 1/3] hw/mips/boston: Massage memory map information
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210929151211.108-1-jiaxun.yang@flygoat.com>
 <20210929151211.108-2-jiaxun.yang@flygoat.com>
 <b1c25fe-c4af-264c-7a8e-fedeb272e845@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <b1c25fe-c4af-264c-7a8e-fedeb272e845@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
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
Cc: aleksandar.rikalo@syrmia.com, qemu-devel@nongnu.org, paulburton@kernel.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/9/29 16:32, BALATON Zoltan 写道:
> On Wed, 29 Sep 2021, Jiaxun Yang wrote:
>> Use memmap array to uinfy address of memory map.
>> That would allow us reuse address information for FDT generation.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> -- 
>> v2: Fix minor style issue, fix uart map size
>> ---
>> hw/mips/boston.c | 95 ++++++++++++++++++++++++++++++++++++------------
>> 1 file changed, 71 insertions(+), 24 deletions(-)
>>
>> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>> index 20b06865b2..5c720440fb 100644
>> --- a/hw/mips/boston.c
>> +++ b/hw/mips/boston.c
>> @@ -64,6 +64,44 @@ struct BostonState {
>>     hwaddr fdt_base;
>> };
>>
>> +enum {
>> +    BOSTON_LOWDDR,
>> +    BOSTON_PCIE0,
>> +    BOSTON_PCIE1,
>> +    BOSTON_PCIE2,
>> +    BOSTON_PCIE2_MMIO,
>> +    BOSTON_CM,
>> +    BOSTON_GIC,
>> +    BOSTON_CDMM,
>> +    BOSTON_CPC,
>> +    BOSTON_PLATREG,
>> +    BOSTON_UART,
>> +    BOSTON_LCD,
>> +    BOSTON_FLASH,
>> +    BOSTON_PCIE1_MMIO,
>> +    BOSTON_PCIE0_MMIO,
>> +    BOSTON_HIGHDDR,
>> +};
>> +
>> +static const MemMapEntry boston_memmap[] = {
>> +    [BOSTON_LOWDDR] =     {        0x0,    0x10000000 },
>
> What's the advantage of having it in an array as opposed to just have 
> simple defines for these? I did not see a case where you go through 
> these as array elements so it seems it's just an unnecessarily complex 
> way to write boston_memmap[BOSTON_LOWADDR] insted of BOSTON_LOWADDR. 
> Did I miss something where having an array helps?
I do consider it as sort of common practice which will make address 
allocation much more clear and easier for subsequent FDT generation 
patch to take both address and size. Many new boards such as arm-virt, 
arm-sbsa and riscv-virt is using MemMapEntry to manage their address 
allocation.

Thanks.
- Jiaxun
>
> Regards,
> BALATON Zoltan
>


