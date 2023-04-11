Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A316DD63D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:08:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm9yM-0006va-I5; Tue, 11 Apr 2023 05:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pm9yJ-0006v1-QO
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:07:27 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pm9yI-0006CV-6C
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:07:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9714C20993;
 Tue, 11 Apr 2023 09:07:15 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Apr
 2023 11:07:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033fd3d4f2-8686-48b7-b028-4f38dc08e33b,
 61C8AB929B8C2440E17BE938A65DAB5D4424B980) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <d2faf2b5-d30d-550a-fd1c-674baf5dc0d3@kaod.org>
Date: Tue, 11 Apr 2023 11:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] pcie: Release references of virtual functions
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230411090408.48366-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230411090408.48366-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 79121016-5f28-499a-9511-be1c41da245e
X-Ovh-Tracer-Id: 2540874617116068832
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelpdekvddrieeirdejjedrudduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghkihhhihhkohdrohgurghkihesuggrhihnihigrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhmshhtsehrvgguhhgrthdrtghomhdpmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.246,
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

On 4/11/23 11:04, Akihiko Odaki wrote:
> pci_new() automatically retains a reference to a virtual function when
> registering it so we need to release the reference when unregistering.
> 
> Fixes: 7c0fa8dff8 ("pcie: Add support for Single Root I/O Virtualization (SR/IOV)")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>   hw/pci/pcie_sriov.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index aa5a757b11..76a3b6917e 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -211,6 +211,7 @@ static void unregister_vfs(PCIDevice *dev)
>               error_free(local_err);
>           }
>           object_unparent(OBJECT(vf));
> +        object_unref(OBJECT(vf));
>       }
>       g_free(dev->exp.sriov_pf.vf);
>       dev->exp.sriov_pf.vf = NULL;


