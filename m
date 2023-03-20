Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775096C0E14
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:04:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCMo-0002XN-TT; Mon, 20 Mar 2023 06:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1peCMm-0002Wu-5y
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:03:48 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1peCMj-0004yK-Pd
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:03:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4F9F320E12;
 Mon, 20 Mar 2023 10:03:41 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 20 Mar
 2023 11:03:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00226a079ac-243b-45d9-9c82-7a235fc64134,
 F0E6F0E3EAC8DE216C47088D2AA2F9E7F08C2096) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7db48667-11e2-b806-03f7-eb516a7be157@kaod.org>
Date: Mon, 20 Mar 2023 11:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vfio/pci: add support for VF token
Content-Language: en-US
To: <minwoo.im@samsung.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "alex.williamson@redhat.com" <alex.williamson@redhat.com>, SSDR Gost Dev
 <gost.dev@samsung.com>, Klaus Birkelund Jensen <k.jensen@samsung.com>
References: <CGME20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
 <20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7fa0f0fe-4984-42ac-9f8d-d1f43c7fe8a0
X-Ovh-Tracer-Id: 3421891293897657251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefkedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekhfevhfehieffudevhfefieethfelvedugfekudejudeiteeffffgffdvleeuleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhinhifohhordhimhesshgrmhhsuhhnghdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghlvgigrdifihhllhhirghmshhonhesrhgvughhrghtrdgtohhmpdhgohhsthdruggvvhesshgrmhhsuhhnghdrtghomhdpkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/20/23 08:35, Minwoo Im wrote:
> VF token was introduced [1] to kernel vfio-pci along with SR-IOV
> support [2].  This patch adds support VF token among PF and VF(s). To
> passthu PCIe VF to a VM, kernel >= v5.7 needs this.
> 
> It can be configured with UUID like:
> 
>    -device vfio-pci,host=DDDD:BB:DD:F,vf-token=<uuid>,...
> 
> [1] https://lore.kernel.org/linux-pci/158396393244.5601.10297430724964025753.stgit@gimli.home/
> [2] https://lore.kernel.org/linux-pci/158396044753.5601.14804870681174789709.stgit@gimli.home/
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/vfio/pci.c | 13 ++++++++++++-
>   hw/vfio/pci.h |  1 +
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ec9a854361..cf27f28936 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2856,6 +2856,8 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>       int groupid;
>       int i, ret;
>       bool is_mdev;
> +    char uuid[UUID_FMT_LEN];
> +    char *name;
>   
>       if (!vbasedev->sysfsdev) {
>           if (!(~vdev->host.domain || ~vdev->host.bus ||
> @@ -2936,7 +2938,15 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>           goto error;
>       }
>   
> -    ret = vfio_get_device(group, vbasedev->name, vbasedev, errp);
> +    if (!qemu_uuid_is_null(&vdev->vf_token)) {
> +        qemu_uuid_unparse(&vdev->vf_token, uuid);
> +        name = g_strdup_printf("%s vf_token=%s", vbasedev->name, uuid);
> +    } else {
> +        name = vbasedev->name;
> +    }
> +
> +    ret = vfio_get_device(group, name, vbasedev, errp);
> +    g_free(name);
>       if (ret) {
>           vfio_put_group(group);
>           goto error;

Shouldn't we set the VF token in the kernel also ? See this QEMU implementation

   https://lore.kernel.org/lkml/20200204161737.34696b91@w520.home/

May be I misunderstood.

Thanks,

C.

> @@ -3268,6 +3278,7 @@ static void vfio_instance_init(Object *obj)
>   
>   static Property vfio_pci_dev_properties[] = {
>       DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
> +    DEFINE_PROP_UUID_NODEFAULT("vf-token", VFIOPCIDevice, vf_token),
>       DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
>       DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
>                               vbasedev.pre_copy_dirty_page_tracking,
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 177abcc8fb..2674476d6c 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -137,6 +137,7 @@ struct VFIOPCIDevice {
>       VFIOVGA *vga; /* 0xa0000, 0x3b0, 0x3c0 */
>       void *igd_opregion;
>       PCIHostDeviceAddress host;
> +    QemuUUID vf_token;
>       EventNotifier err_notifier;
>       EventNotifier req_notifier;
>       int (*resetfn)(struct VFIOPCIDevice *);


