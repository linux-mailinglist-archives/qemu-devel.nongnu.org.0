Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1E40DC70
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:09:29 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQs4u-0005U1-Qi
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQs28-0002Cx-Nq
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:06:38 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:35453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQs25-0002CS-Kq
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:06:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 476C41FEE7;
 Thu, 16 Sep 2021 14:06:29 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 16 Sep
 2021 16:06:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0034cf39797-09a8-4990-8343-34599739d5cc,
 902CC554B2B666CF336F93082A9AEA4058B2700C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7ae560b5-e719-0b6d-1fdc-b231af9d6a81@kaod.org>
Date: Thu, 16 Sep 2021 16:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Richard
 Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <d00d7eeb-a50c-c039-046c-7749fde25af8@kaod.org>
 <1d6fb312-ab21-ca9c-d7ec-1043ccc65b10@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1d6fb312-ab21-ca9c-d7ec-1043ccc65b10@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 708cef0f-6b27-45bd-92a7-cd70bd34d47c
X-Ovh-Tracer-Id: 5720978902582528876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 15:53, Philippe Mathieu-Daudé wrote:
> On 9/16/21 2:29 PM, Cédric Le Goater wrote:
>> On 9/14/21 17:22, Richard Henderson wrote:
>>> On 9/14/21 5:26 AM, Peter Maydell wrote:
>>>> (2) RAM blocks should have a length that fits inside a
>>>>       signed 32-bit type on 32-bit hosts (at least I assume this
>>>>       is where the 2047MB limit is coming from; in theory this ought
>>>>       to be improveable but auditing the code for mishandling of
>>>>       RAMblock sizes to ensure we weren't accidentally stuffing
>>>>       their size into a signed 'long' somewhere would be kind
>>>>       of painful)
> 
>>>> Even if we did fix (2) we'd need to compromise on (3)
>>>> sometimes still -- if a board has 4GB of RAM that's
>>>> not going to fit in 32 bits regardless. But we would be
>>>> able to let boards with 2GB have 2GB.
>>>
>>> I'm not opposed to deprecating 32-bit hosts...  ;-)
>>
>> Until then, I am willing to make the following compromise for the fuji  :
>>
>>      mc->default_ram_size = (HOST_LONG_BITS == 32 ? 1 : 2) * GiB;
> 
> While I disagree with this approach, better to document it clearly
> like commit 25ff112a8cc ("hw/arm/mps2-tz: Add new mps3-an524 board").
> 

OK. The patch I had prepared was a bit more explicit :

     /* On 32-bit hosts, lower RAM to 1G because of 2047 MB limit */
     mc->default_ram_size = (HOST_LONG_BITS == 32 ? 1 : 2) * GiB;

I even have a version with a warn_report() since 32-bit hosts are
not that common these days. But let's adopt the mps3-an524 board
approach.

Thanks,

C.

