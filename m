Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9FD622C58
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 14:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osl4e-0004lP-38; Wed, 09 Nov 2022 08:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1osl4Z-0004l7-Db
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:24:55 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1osl4X-0002FS-Db
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 08:24:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9602623C7B;
 Wed,  9 Nov 2022 13:24:41 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 9 Nov
 2022 14:24:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0022ad1432e-2fa9-4047-a100-bc5d8e1aed46,
 4415709E3B3AA4C727D1A1893130D6054088B7E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ee7bd4ef-454e-1e8b-5df2-da80750436e8@kaod.org>
Date: Wed, 9 Nov 2022 14:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] hw/pci-host/pnv_phb: Avoid quitting QEMU if hotplug of
 pnv-phb-root-port fails
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20221109122210.115667-1-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221109122210.115667-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 61ecf627-ac9d-4807-b1a8-01e24abecc5c
X-Ovh-Tracer-Id: 12256827864650976224
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/9/22 13:22, Thomas Huth wrote:
> Currently QEMU terminates if you try to hotplug pnv-phb-root-port in
> an environment where it is not supported, e.g. if doing this:
> 
>   echo "device_add pnv-phb-root-port" | \
>   ./qemu-system-ppc64 -monitor stdio -M powernv9
> 
> To avoid this problem, the pnv_phb_root_port_realize() function should
> not use error_fatal when trying to set the properties which might not
> be available.

Fixes: c2f3f78af5 ("ppc/pnv: set root port chassis and slot using Bus properties")

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 7b11f1e8dd..0b26b43736 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -241,8 +241,16 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>        * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>        * root port.
>        */
> -    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
> -    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
> +    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +    index = object_property_get_int(OBJECT(bus), "phb-id", &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>   
>       /* Set unique chassis/slot values for the root port */
>       qdev_prop_set_uint8(dev, "chassis", chip_id);


