Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430E33F73A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:39:54 +0100 (CET)
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMa9A-0006IW-Ds
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lMZaJ-0002Ix-Ji; Wed, 17 Mar 2021 13:03:51 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lMZaH-0001Ms-7o; Wed, 17 Mar 2021 13:03:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.253])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 35C9691500D7;
 Wed, 17 Mar 2021 18:03:44 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 18:03:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004f3c21803-2d0a-479f-9ec6-c96feb35a6cd,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 1/3] hw: Model ASPEED's Hash and Crypto Engine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
References: <20210312105711.551423-1-joel@jms.id.au>
 <20210312105711.551423-2-joel@jms.id.au>
 <d2969a4a-abaf-b4e5-1cdb-5fdac85fa388@amsat.org>
 <6fcc0cc8-e09d-5390-dc3b-593612e404e6@kaod.org>
 <bc22a53d-f21d-e34e-f075-f8c97fba164d@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4bf33abe-e729-33e3-51fe-64a9ac472324@kaod.org>
Date: Wed, 17 Mar 2021 18:03:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bc22a53d-f21d-e34e-f075-f8c97fba164d@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ba562289-b734-49d0-adbd-952750de5f21
X-Ovh-Tracer-Id: 3922635278227376943
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelleeuveelvdejvdegtddugfdvkeejueehvdejuefgleeivdduhfduteffgeeinecuffhomhgrihhnpehmrghilhdqrghrtghhihhvvgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 2:13 PM, Philippe Mathieu-Daudé wrote:
> 
> 
> On 3/17/21 1:36 PM, Cédric Le Goater wrote:
>> On 3/17/21 12:47 PM, Philippe Mathieu-Daudé wrote:
>>> On 3/12/21 11:57 AM, Joel Stanley wrote:
>>>> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,
>>>> SHA2, RSA and other cryptographic algorithms.
>>>>
>>>> This initial model implements a subset of the device's functionality;
>>>> currently only direct access (non-scatter gather) hashing.
>>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>> v3:
>>>>  - rebase on upstream to fix meson.build conflict
>>>> v2:
>>>>  - reorder register defines
>>>>  - mask src/dest/len registers according to hardware
>>>> ---
>>>>  include/hw/misc/aspeed_hace.h |  33 ++++
>>>>  hw/misc/aspeed_hace.c         | 312 ++++++++++++++++++++++++++++++++++
>>>>  hw/misc/meson.build           |   1 +
>>>>  3 files changed, 346 insertions(+)
>>>>  create mode 100644 include/hw/misc/aspeed_hace.h
>>>>  create mode 100644 hw/misc/aspeed_hace.c
> 
>>>> +static int do_hash_operation(AspeedHACEState *s, int algo)
>>>> +{
>>>> +    hwaddr src, len, dest;
>>>> +    uint8_t *digest_buf = NULL;
>>>> +    size_t digest_len = 0;
>>>> +    char *src_buf;
>>>> +    int rc;
>>>> +
>>>> +    src = 0x80000000 | s->regs[R_HASH_SRC];
>>>> +    len = s->regs[R_HASH_SRC_LEN];
>>>> +    dest = 0x80000000 | s->regs[R_HASH_DEST];
>>>> +
>>>> +    src_buf = address_space_map(&s->dram_as, src, &len, false,
>>>> +                                MEMTXATTRS_UNSPECIFIED);
>>>
>>> It seems the Aspeed machines aren't using correctly the AS API...
>>> This device shouldn't worry about where it is physically mapped.
>>> IOW its AS is too wide.
>>>
>>> I'm trying to fix this in a series:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg791085.html
>>
>> The buffers can be anywhere in DRAM
> 
> Exactly. This device only requires direct access to DRAM, not the
> full bus. Regardless the amount of DRAM available, only the bus
> aperture to the DRAM should be passed to this device (MR link),
> then this device use an AS view on it, zero-based.
> 
> Your device becomes independent to where the DRAM is physically
> mapped on the SoC.

ok.

The initial problem was that the RAM was not initialized before 
the SoC was realized and we couldn't use it. things have changed
and we can now pass directly machine->ram to sub models instead of 
the ram_container. That should address your comments on the HACE 
model and on the SMC model. 

I will check what we can do for the mmio_flash address space.

C. 


> 
>> which is mapped at 0x80000000
>> on the AST2600. This is correct and very similar to what we do 
>> in the Aspeed SMC DMA models.
>>
>> I would prefer if we did loads though.
>>
>> Cheers,
>>
>> C.
>>
>>


