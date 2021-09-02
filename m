Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F583FF1C6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:47:18 +0200 (CEST)
Received: from localhost ([::1]:50688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLprx-0006Tv-H9
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLpRc-0005nY-5s
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:20:04 -0400
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:35230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mLpRX-0004Hn-OL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 12:20:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id E88552963A9;
 Thu,  2 Sep 2021 18:19:54 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 2 Sep
 2021 18:19:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002394206a4-3996-4c41-b810-8c5bd1d35dca,
 0F69C8711EE098B745CC44F7BEC1CAFBB1DDDEDC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add Fuji machine type
To: Patrick Williams <patrick@stwcx.xyz>, Peter Delevoryas <pdel@fb.com>
References: <20210901225946.500125-1-pdel@fb.com>
 <60994ebb-d345-cc40-020e-2c14ed438097@kaod.org>
 <0B35613A-4001-4E31-A522-ECF827CF1F8E@fb.com> <YTDx5fyuHmylObg8@heinlein>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <73962d5d-ddf8-77b5-f4e0-7d3fad9abd71@kaod.org>
Date: Thu, 2 Sep 2021 18:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTDx5fyuHmylObg8@heinlein>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: da9dd1cc-0519-45c9-8b71-c4011afc3f4c
X-Ovh-Tracer-Id: 17990191662621690732
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "f4bug@amsat.org" <f4bug@amsat.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:46 PM, Patrick Williams wrote:
> On Thu, Sep 02, 2021 at 03:12:12PM +0000, Peter Delevoryas wrote:
>>
>>> On Sep 2, 2021, at 1:12 AM, Cédric Le Goater <clg@kaod.org> wrote:
> 
>>> Are we sure the flash models fit what the machine expects ?
>>
>> Oh, I see, I’m not exactly sure which device is being used
>> but it should be one using the m25p80 command set, and after
>> switching to one of those devices (e.g. mx66l1g45g) it works:
>>
>> [   54.867027] Creating 6 MTD partitions on "spi0.0":
>> [   54.867506] 0x000000000000-0x0000000e0000 : "u-boot"
>> [   54.873929] 0x0000000e0000-0x0000000f0000 : "env"
>> [   54.876546] 0x0000000f0000-0x000000100000 : "meta"
>> [   54.878948] 0x000000100000-0x000007800000 : "fit"
>> [   54.881290] 0x000007800000-0x000008000000 : "data0"
>> [   54.883965] 0x000000000000-0x000008000000 : "flash0"
> 
> It appears that machine uses the 128MB flash layout dtsi file:
>     https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi
> 
> I think that means it would be safe to use the same mx66l1g45g that Sonorapass
> is using in the Fuji config.  Likely we're either using that exact chip or
> something 100% compatible with it.
> 
>>>
>>>  [   41.314338] 6 fixed-partitions partitions found on MTD device spi0.0
>>>  [   41.314600] Creating 6 MTD partitions on "spi0.0":
>>>  [   41.314957] 0x000000000000-0x0000000e0000 : "u-boot"
>>>  [   41.318355] 0x0000000e0000-0x0000000f0000 : "env"
>>>  [   41.319747] 0x0000000f0000-0x000000100000 : "meta"
>>>  [   41.321064] 0x000000100000-0x000007800000 : "fit"
>>>  [   41.321247] mtd: partition "fit" extends beyond the end of device "spi0.0" -- size truncated to 0x3f00000
>>>  [   41.322684] 0x000007800000-0x000008000000 : "data0"
>>>  [   41.322827] mtd: partition "data0" is out of reach -- disabled
>>>  [   41.324110] 0x000000000000-0x000008000000 : "flash0"
>>>  [   41.324253] mtd: partition "flash0" extends beyond the end of device "spi0.0" -- size truncated to 0x4000000
>>>
>>> More info in the log below.
>>>
>>>
>>> Could we also define the list of expected I2C devices of the machine ? 
>>
>> Yeah sure! I’ll follow up with that.
>>
> 
> The fuji DTS is available upstream:
>     https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
> 
> I found that when I did Sonora Pass there were a number of unsupported i2c
> devices (ie. devices without QEMU models) but most of them were behind muxes,
> which are similarly non-supported.  You'll see a pretty large fan-out in the i2c
> busses of that DTS.  I don't see anything obvious in the DTS that is directly
> connected except for the muxes.

The pca954x muxes are supported and these devices : 

  ...
  3-0048 (lm75) - no driver bound
  unable to find driver for 3-0048
  3-0049 (lm75) - no driver bound
  unable to find driver for 3-0049
  3-004a (lm75) - no driver bound
  unable to find driver for 3-004a
  3-004c (tmp422) - no driver bound
  Failed to open /sys/bus/i2c/devices/50-0052/eeprom: No such file or directory
  Failed to parse default EEPROM

are also. It would be good to have them defined in the machine. 

Thanks,

C.


 


