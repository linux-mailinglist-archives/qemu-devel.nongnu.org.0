Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC651DDE4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:50:58 +0200 (CEST)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn1AM-0005Bm-Vv
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nn19F-0004U4-VQ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:49:45 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:43013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nn19D-0000cB-Um
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:49:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5A5B2FD2572B;
 Fri,  6 May 2022 18:49:38 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 6 May 2022
 18:49:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0046693672d-6964-4645-8c3f-1a524d43eee8,
 85FEA43FB7D152D5FE87D0D31D0EEF45A371AE19) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c7086bc1-ff69-41cd-f80e-95b643140e2b@kaod.org>
Date: Fri, 6 May 2022 18:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Klaus Jensen
 <its@irrelevant.dk>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Arun
 Kumar Kashinath Agasar <arun.kka@samsung.com>, Corey Minyard
 <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen
 <k.jensen@samsung.com>, <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, 
 Matt Johnston <matt@codeconstruct.com.au>, Jeremy Kerr <jk@ozlabs.org>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220506150731.00000693@Huawei.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220506150731.00000693@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b066392c-59cc-4c18-97b2-f56e021e96b0
X-Ovh-Tracer-Id: 5882264066874772411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeifeehtdevfeeuhfelheekkeefieeivdfhgeevueeijeetjeekueeggedujeeiieenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhksehoiihlrggsshdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Jonathan,

On 5/6/22 16:07, Jonathan Cameron wrote:
> On Thu, 31 Mar 2022 18:57:33 +0200
> Klaus Jensen <its@irrelevant.dk> wrote:
> 
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Hi all,
>>
>> This RFC series adds I2C "slave mode" support for the Aspeed I2C
>> controller as well as the necessary infrastructure in the i2c core to
>> support this.
>>
>> Background
>> ~~~~~~~~~~
>> We are working on an emulated NVM Express Management Interface[1] for
>> testing and validation purposes. NVMe-MI is based on the MCTP
>> protocol[2] which may use a variety of underlying transports. The one we
>> are interested in is I2C[3].
>>
>> The first general trickery here is that all MCTP transactions are based
>> on the SMBus Block Write bus protocol[4]. This means that the slave must
>> be able to master the bus to communicate. As you know, hw/i2c/core.c
>> currently does not support this use case.
>>
>> The second issue is how to interact with these mastering devices. Jeremy
>> and Matt (CC'ed) have been working on an MCTP stack for the Linux Kernel
>> (already upstream) and an I2C binding driver[5] is currently under
>> review. This binding driver relies on I2C slave mode support in the I2C
>> controller.
> 
> Hi Klaus,
> 
> Just thought I'd mention I'm also interested in MCTP over I2C emulation
> for a couple of projects:

Klaus is working on a v2 :

   http://patchwork.ozlabs.org/project/qemu-devel/patch/20220503225925.1798324-2-pdel@fb.com/

Thanks,

C.


> 
> 1) DMTF SPDM - mostly as a second transport for the kernel stack alongside
>     PCI DOE.
> 2) CXL FM-API - adding support for the Fabric Manager interfaces
>     on emulated CXL switches which is also typically carried over
>     MCTP.
> 
> I was thinking of emulating a MCTP over PCI VDM but this has saved me
> going to the effort of doing that for now at least :)
> 
> I have hacked a really really basic MCTP device together using this
> series and it all seems to be working with the kernel stack (subject to a
> few kernel driver bugs that I'll report / send fixes for next week).
> I'm cheating all over the place so far, (lots of hard coded values) but
> would be interested in a more flexible solution that might perhaps
> share infrastructure with your NVMe-MI work.

