Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5F6389BA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 13:27:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXmu-0002xK-E0; Fri, 25 Nov 2022 07:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oyXmJ-0002th-UB
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:26:02 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oyXmI-0005ip-4M
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:25:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.97])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 681A7143D4991;
 Fri, 25 Nov 2022 13:25:56 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 25 Nov
 2022 13:25:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033f9effc3-45b2-4670-8200-fe5e9123e788,
 0943508581586B5A13DEB77E74985CDFB59E8D1E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f1b37263-4c12-a66a-4573-ea3fbdb76c86@kaod.org>
Date: Fri, 25 Nov 2022 13:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 7/7] hw/pci-host/pnv_phb3_msi: Convert
 TYPE_PHB3_MSI to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221125115240.3005559-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6cad7c2e-9563-4ac4-bdd0-eb53640a653b
X-Ovh-Tracer-Id: 12994010825814936428
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpkhhrrgigvghlsehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvg
 epshhmthhpohhuth
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
> Convert the TYPE_PHB3_MSI class to 3-phase reset, so we can
> avoid using the device_class_set_parent_reset() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   include/hw/ppc/xics.h      |  2 +-
>   hw/pci-host/pnv_phb3_msi.c | 15 +++++++++------
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> index 00b80b08c27..95ead0dd7c9 100644
> --- a/include/hw/ppc/xics.h
> +++ b/include/hw/ppc/xics.h
> @@ -95,7 +95,7 @@ struct ICSStateClass {
>       DeviceClass parent_class;
>   
>       DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>   
>       void (*reject)(ICSState *s, uint32_t irq);
>       void (*resend)(ICSState *s);
> diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
> index ae908fd9e41..41e63b066f9 100644
> --- a/hw/pci-host/pnv_phb3_msi.c
> +++ b/hw/pci-host/pnv_phb3_msi.c
> @@ -228,12 +228,14 @@ static void phb3_msi_resend(ICSState *ics)
>       }
>   }
>   
> -static void phb3_msi_reset(DeviceState *dev)
> +static void phb3_msi_reset_hold(Object *obj)
>   {
> -    Phb3MsiState *msi = PHB3_MSI(dev);
> -    ICSStateClass *icsc = ICS_GET_CLASS(dev);
> +    Phb3MsiState *msi = PHB3_MSI(obj);
> +    ICSStateClass *icsc = ICS_GET_CLASS(obj);
>   
> -    icsc->parent_reset(dev);
> +    if (icsc->parent_phases.hold) {
> +        icsc->parent_phases.hold(obj);
> +    }
>   
>       memset(msi->rba, 0, sizeof(msi->rba));
>       msi->rba_sum = 0;
> @@ -287,11 +289,12 @@ static void phb3_msi_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       ICSStateClass *isc = ICS_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>   
>       device_class_set_parent_realize(dc, phb3_msi_realize,
>                                       &isc->parent_realize);
> -    device_class_set_parent_reset(dc, phb3_msi_reset,
> -                                  &isc->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, phb3_msi_reset_hold, NULL,
> +                                       &isc->parent_phases);
>   
>       isc->reject = phb3_msi_reject;
>       isc->resend = phb3_msi_resend;


