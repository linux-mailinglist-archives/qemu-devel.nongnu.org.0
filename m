Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27D3B5A2C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:56:22 +0200 (CEST)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxm7x-0004aC-Hm
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lxm6f-0003gn-3E; Mon, 28 Jun 2021 03:55:01 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lxm6c-00056G-6w; Mon, 28 Jun 2021 03:55:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4DDA0B0FD782;
 Mon, 28 Jun 2021 09:54:53 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Mon, 28 Jun
 2021 09:54:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b29b0723-9b15-4144-90f4-58d399c8c9c2,
 A5942444232ACF3D755B1638A42E9F49C81D83AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [RFC PATCH 00/10] hw/sd: Start splitting SD vs SPI protocols
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5c70e1e3-81aa-1da6-7051-061b60ce0bb7@kaod.org>
Date: Mon, 28 Jun 2021 09:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5f42a0a7-7ece-408d-9424-677e55e0e275
X-Ovh-Tracer-Id: 9244764138797239078
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 4:21 PM, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> After our discussion yesterday about how to add support for MMC
> (and eMMC) I looked at how to easily add these bus protocols,
> which might have commands quite different, avoiding to have big
> unreadable if/else statements.
> 
> I'm not yet happy enough with the result but it is a starting
> point which keeps things still simple.

this is a good framework but I would introduce a Class.

> What I'm wondering is if we could include the command classes
> (as another dimension in the array). 
I don't quite get what you mean ? 

> Also if we could use the
> older spec version supported as base set of commands, and if the
> user asks for more recent spec version, for each version we
> overwrite the array of commands. Thoughts?

Yes. I think we need another RFC to see how it looks :) 

I expect these command arrays to be static. Duplicating the base 
array to add custom handlers for a new version of a protocol 
should be ok. 

Thanks,

C.
  

> 
> Phil.
> 
> Philippe Mathieu-Daudé (10):
>   hw/sd: When card is in wrong state, log which state it is
>   hw/sd: Extract address_in_range() helper, log invalid accesses
>   hw/sd: Move proto_name to SDProto structure
>   hw/sd: Introduce sd_cmd_handler type
>   hw/sd: Add sd_cmd_illegal() handler
>   hw/sd: Add sd_cmd_unimplemented() handler
>   hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
>   hw/sd: Add sd_cmd_SEND_OP_CMD() handler
>   hw/sd: Add sd_cmd_ALL_SEND_CID() handler
>   hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler
> 
>  hw/sd/sd.c | 251 ++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 143 insertions(+), 108 deletions(-)
> 


