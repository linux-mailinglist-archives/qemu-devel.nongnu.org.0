Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA43357E4D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:41:51 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQEV-0001fE-VP
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lUQDH-0000t9-IV
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:40:32 -0400
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:57874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lUQDA-0004sQ-6A
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:40:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 9555F279366;
 Thu,  8 Apr 2021 10:40:20 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 8 Apr 2021
 10:40:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00265e66e6e-5b18-4d82-b2c7-1478fe1fda68,
 A36169EE3079FEED08DC2049B229DAFE10CEC3BC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 88.167.138.64
Subject: Re: [PATCH 21/24] hw/block: m25p80: Add support for mt25qu02g
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-22-clg@kaod.org>
 <20210408080001.2r4gxygjsuorvaxs@debian>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0d5e9101-7ae9-8892-cc00-d83f958ffca8@kaod.org>
Date: Thu, 8 Apr 2021 10:40:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408080001.2r4gxygjsuorvaxs@debian>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3bc86a52-8722-4f06-871b-9f9f6454aee3
X-Ovh-Tracer-Id: 13939766749553855337
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieejgeeggfeileehjeeihedvffeffefhjeejteejvddvkefgvedthfdvtdejfeejnecuffhomhgrihhnpehihhhsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhhrrghntghishgtohdrihhglhgvshhirghsseigihhlihhngidrtghomh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 10:00 AM, Francisco Iglesias wrote:
> Hello Cedric!
> 
> On Wed, Apr 07, 2021 at 07:16:34PM +0200, Cédric Le Goater wrote:
>> The Micron mt25qu02g is a 3V 2Gb serial NOR flash memory supporting
>> dual I/O and quad I/O, 4KB, 32KB, 64KB sector erase. It also supports
>> 4B opcodes.
>>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/block/m25p80.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 183d3f44c259..2afb939ae28e 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -259,6 +259,7 @@ static const FlashPartInfo known_devices[] = {
>>      { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
>>      { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
>>      { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
>> +    { INFO_STACKED("mt25qu02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K, 2) },
> 
> Is it possible it should be as below instead?
> 
> { INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096, ER_4K | ER_32K, 2) },
> 
> 's/0x20ba22/0x20bb22/' (or 's/mt25qu02g/mt25ql02g/') since 'u' looks to stand
> for 1.7-2.0 V and 'bb' for 1.8 V (see page 2 and 32 in [1]).

Here is what I am seeing : 

 mt25ql02g 0x20ba22 3V
 mt25qu02g 0x20bb22 1.8V

Do we agree ? 

> s/ER_4K/ER_4K | ER_32K/ since ERASE_32K is supported (see page 36). 

yes. I should have added that ! 
 
> If you find above changes ok and go with them please add:
> 
> Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Sure,

Thanks,

C.


> Best regards,
> Francisco Iglesias
> 
> [1] Micron Serial NOR Flash Memory 1.8V, Multiple I/O, 64KB Sector Erase MT25QU02GCBB
>     https://4donline.ihs.com/images/VipMasterIC/IC/MICT/MICT-S-A0008500026/MICT-S-A0008511423-1.pdf?hkey=52A5661711E402568146F3353EA87419
> 
>>  
>>      /* Spansion -- single (large) sector size only, at least
>>       * for the chips listed here (without boot sectors).
>> -- 
>> 2.26.3
>>


