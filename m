Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39E49B2E7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:29:10 +0100 (CET)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCK0b-0000in-4d
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCJwY-0007oX-Lo
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:24:58 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCJwV-0000yN-7I
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:24:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DC612D9E17F6;
 Tue, 25 Jan 2022 12:24:52 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 12:24:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004689303ce-1a40-428a-a954-703312a1bb62,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d841b1f3-3d38-4d27-cce7-e97b093b47da@kaod.org>
Date: Tue, 25 Jan 2022 12:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] spapr.c: check bus != NULL in spapr_get_fw_dev_path()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220121213852.30243-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220121213852.30243-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1da72321-c12c-4f4b-ac71-8775b07988bb
X-Ovh-Tracer-Id: 15997911780468231136
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 22:38, Daniel Henrique Barboza wrote:
> spapr_get_fw_dev_path() is an impl of
> FWPathProviderClass::get_dev_path(). This interface is used by
> hw/core/qdev-fw.c via fw_path_provider_try_get_dev_path() in two
> functions:
> 
> - static char *qdev_get_fw_dev_path_from_handler(), which is used only in
> qdev_get_fw_dev_path_helper() and it's guarded by "if (dev &&
> dev->parent_bus)";
> 
> - char *qdev_get_own_fw_dev_path_from_handler(), which is used in
> softmmu/bootdevice.c in get_boot_device_path() like this:
> 
>      if (dev) {
>          d = qdev_get_own_fw_dev_path_from_handler(dev->parent_bus, dev);
> 
> This means that, when called via softmmu/bootdevice.c, there's no check
> of 'dev->parent_bus' being not NULL. The result is that the "BusState
> *bus" arg of spapr_get_fw_dev_path() can potentially be NULL and if, at
> the same time, "SCSIDevice *d" is not NULL, we'll hit this line:
> 
>      void *spapr = CAST(void, bus->parent, "spapr-vscsi");
> 
> And we'll SIGINT because 'bus' is NULL and we're accessing bus->parent.
> 
> Adding a simple 'bus != NULL' check to guard the instances where we
> access 'bus->parent' can avoid this altogether.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/spapr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 72f5dce751..3d6ec309dd 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3053,7 +3053,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *p, BusState *bus,
>       VHostSCSICommon *vsc = CAST(VHostSCSICommon, dev, TYPE_VHOST_SCSI_COMMON);
>       PCIDevice *pcidev = CAST(PCIDevice, dev, TYPE_PCI_DEVICE);
>   
> -    if (d) {
> +    if (d && bus) {
>           void *spapr = CAST(void, bus->parent, "spapr-vscsi");
>           VirtIOSCSI *virtio = CAST(VirtIOSCSI, bus->parent, TYPE_VIRTIO_SCSI);
>           USBDevice *usb = CAST(USBDevice, bus->parent, TYPE_USB_DEVICE);
> 


