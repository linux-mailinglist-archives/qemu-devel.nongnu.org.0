Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838696389B0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 13:25:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXkg-0001dO-Rt; Fri, 25 Nov 2022 07:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oyXke-0001cT-Oj; Fri, 25 Nov 2022 07:24:16 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oyXkc-0005AA-GB; Fri, 25 Nov 2022 07:24:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 97EB8143D445B;
 Fri, 25 Nov 2022 13:24:01 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 25 Nov
 2022 13:24:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005643650c5-03b3-4f4c-b030-d4e50fffb9d0,
 0943508581586B5A13DEB77E74985CDFB59E8D1E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <61ea8b5c-a8ae-1fc9-a54a-6a95c8b914fc@kaod.org>
Date: Fri, 25 Nov 2022 13:24:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 5/7] hw/intc/xics: Reset TYPE_ICS objects with
 device_cold_reset()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221125115240.3005559-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 17412343-3948-43a7-a29b-39c8272b73f5
X-Ovh-Tracer-Id: 12961641204222757740
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpkhhrrgigvghlsehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvg
 epshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/25/22 12:52, Peter Maydell wrote:
> The realize method for the TYPE_ICS class uses qemu_register_reset()
> to register a reset handler, as a workaround for the fact that
> currently objects which directly inherit from TYPE_DEVICE don't get
> automatically reset.  However, the reset function directly calls
> ics_reset(), which is the function that implements the legacy reset
> method.  This means that only the parent class's data gets reset, and
> a subclass which also needs to handle reset, like TYPE_PHB3_MSI, has
> to register its own reset function.
> 
> Make the TYPE_ICS reset function call device_cold_reset() instead:
> this will handle reset for both the parent class and the subclass,
> and will work whether the classes are using legacy reset or 3-phase
> reset. This allows us to remove the reset function that the subclass
> currently has to set up.

Nice !

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/intc/xics.c             | 2 +-
>   hw/pci-host/pnv_phb3_msi.c | 7 -------
>   2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index dcd021af668..dd130467ccc 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -593,7 +593,7 @@ static void ics_reset(DeviceState *dev)
>   
>   static void ics_reset_handler(void *dev)
>   {
> -    ics_reset(dev);
> +    device_cold_reset(dev);
>   }
>   
>   static void ics_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
> index 2f4112907b8..ae908fd9e41 100644
> --- a/hw/pci-host/pnv_phb3_msi.c
> +++ b/hw/pci-host/pnv_phb3_msi.c
> @@ -239,11 +239,6 @@ static void phb3_msi_reset(DeviceState *dev)
>       msi->rba_sum = 0;
>   }
>   
> -static void phb3_msi_reset_handler(void *dev)
> -{
> -    phb3_msi_reset(dev);
> -}
> -
>   void pnv_phb3_msi_update_config(Phb3MsiState *msi, uint32_t base,
>                                   uint32_t count)
>   {
> @@ -272,8 +267,6 @@ static void phb3_msi_realize(DeviceState *dev, Error **errp)
>       }
>   
>       msi->qirqs = qemu_allocate_irqs(phb3_msi_set_irq, msi, ics->nr_irqs);
> -
> -    qemu_register_reset(phb3_msi_reset_handler, dev);
>   }
>   
>   static void phb3_msi_instance_init(Object *obj)


