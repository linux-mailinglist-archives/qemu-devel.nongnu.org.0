Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC33FC880
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:42:17 +0200 (CEST)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL41k-0005UV-Uc
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL3uV-0001u5-Qw; Tue, 31 Aug 2021 09:34:43 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL3uS-0000yV-VQ; Tue, 31 Aug 2021 09:34:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.35])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 86D26BBBCAE9;
 Tue, 31 Aug 2021 15:34:36 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 Aug
 2021 15:34:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00194eb615d-1c82-4c44-b249-ebb91bdfa188,
 3D02C4E7E229260F021FFF691A6C377EE278DEFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
To: Andrew Jeffery <andrew@aj.id.au>, Peter Delevoryas <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
 <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a802ecb1-aa49-fd4c-5bd2-2bb19af56ac9@kaod.org>
Date: Tue, 31 Aug 2021 15:34:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 536ab2ba-0c01-4360-85d7-712f474091c5
X-Ovh-Tracer-Id: 3453135017623325603
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrnhgurhgvfiesrghjrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 1:23 PM, Andrew Jeffery wrote:
> Hi Cédric, Peter,
> 
> On Tue, 31 Aug 2021, at 20:09, Cédric Le Goater wrote:
>> On 8/28/21 5:58 PM, Peter Delevoryas wrote:
>>> I think I’m a little confused on this part. What I meant by “most machines just use UART5” was that most DTS’s use “stdout-path=&uart5”, but fuji uses “stdout-path=&uart1”. I /do/ see that SCU510 includes a bit related to UART, but it’s for disabling booting from UART1 and UART5. I just care about the console aspect, not booting.
>>
>> The UART can be switched with SCU70[29] on the AST2500, btw.
> 
> If it helps, neither the AST2600's "Boot from UART" feature nor the 
> AST2[456]00's "Debug UART" feature are related to which UART is used as 
> the BMC console by u-boot and/or the kernel - the latter is entirely a 
> software thing.

ok. 

I don't think we should initialize all 5 UARTs of SoC and let the user define 
all the expected devices on the command. Unless we want to do something like
'macs_mask' ? but at the SoC level. It might be overkill for the need.

My suggestion is have the Aspeed board tell the SoC which uart was selected 
for the console. That can be done with an extra "serial-dev" int property at 
the SoC level, defaults to ASPEED_DEV_UART5, like for the machine. 

The serial init needs a change  : 

    /* UART - attach an 8250 to the IO space as our UART5 */
    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
                   serial_hd(0), DEVICE_LITTLE_ENDIAN);

but it stays where it is currently, under the SoC.

> The "Debug UART" is a hardware backdoor, a UART-to-AHB bridge 
> implemented by the SoC. It provides a shell environment that allows you 
> to issue transactions directly on the AHB if you perform a magic knock. 
> I have a driver for it implemented here:
> 
> https://github.com/amboar/cve-2019-6260/blob/master/src/debug.c
> 
> SCU70[29] on the AST2500 selects whether this backdoor is exposed on 
> UART1 or UART5.
> 
> The "Boot from UART" feature is implemented in the AST2600 ROM code as 
> a fallback for loading the SPL if fetching it from SPI-NOR or the eMMC 
> fails, or the SPL is incorrectly signed for secure-boot.
>
> I think Peter is on the right track with this patch?

Yes. nearly. Sorry for the confusion on how to handle this Peter. A machine 
*and* a SoC property should to the trick. 

'amc->serial_dev' is a good idea. You need a similar one under the SoC.

Thanks for the feedback Andrew,

C. 

