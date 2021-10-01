Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5141ED4A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:24:23 +0200 (CEST)
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWHaO-0008GJ-9q
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWHYk-0006LE-5g
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:22:38 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:40765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWHYg-0007Bx-Fn
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:22:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 479BFC18F586;
 Fri,  1 Oct 2021 14:22:31 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 14:22:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0039273a315-9dc7-42d5-b253-cad9539954c1,
 4BD1923EFCE0A2D5FFEE921A78BF2E0F2CE6D79C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <83766d80-62fd-0c75-6462-44aceacbf995@kaod.org>
Date: Fri, 1 Oct 2021 14:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and the
 405 CPU models
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-devel@nongnu.org>
References: <20211001121943.1016447-1-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211001121943.1016447-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9cc92df0-3f28-42c7-b9db-84e04b70be65
X-Ovh-Tracer-Id: 18268570416571386845
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedggeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekkeefheefvdefhefgjeelveekheeileehudevkeefvdfhleetiedvffdtudeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.127,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 14:19, Thomas Huth wrote:
> These machines need a firmware image called 'ppc405_rom.bin', and nobody
> seems to have such a firmware image left for testing, so the machines are
> currently unusable. There used to be support in U-Boot, but it has been
> removed a couple of year ago already.
> Thus let's mark these boards and the 405 CPU as deprecated now, so that we
> could remove them in a couple of releases (unless somebody speaks up and
> says that these are still usefull for them).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>   docs/about/deprecated.rst | 15 +++++++++++++++
>   hw/ppc/ppc405_boards.c    |  2 ++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 2f7db9a98d..27c03ef624 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
>   this CPU is also deprecated.
>   
> +PPC 405 CPU models (since 6.2)
> +''''''''''''''''''''''''''''''
> +
> +The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
> +
>   
>   QEMU API (QAPI) events
>   ----------------------
> @@ -258,6 +263,16 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
>   machines. It can be easily replaced by the ``witherspoon-bmc`` or the
>   ``romulus-bmc`` machines.
>   
> +``ref405ep`` and ``taihu`` machines (since 6.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''
> +
> +These machines need a firmware image called 'ppc405_rom.bin', and nobody seems
> +to have a working copy of such a firmware image anymore. `Support in U-Boot
> +<https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdfdba62c069>`__
> +has been removed a couple of years ago, too, so it is very unlikely that
> +anybody is still using this code at all.
> +
> +
>   Backend options
>   ---------------
>   
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 972a7a4a3e..1578c0dac8 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -317,6 +317,7 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>       mc->init = ref405ep_init;
>       mc->default_ram_size = 0x08000000;
>       mc->default_ram_id = "ef405ep.ram";
> +    mc->deprecation_reason = "ppc405 CPU is deprecated";
>   }
>   
>   static const TypeInfo ref405ep_type = {
> @@ -547,6 +548,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
>       mc->init = taihu_405ep_init;
>       mc->default_ram_size = 0x08000000;
>       mc->default_ram_id = "taihu_405ep.ram";
> +    mc->deprecation_reason = "ppc405 CPU is deprecated";
>   }
>   
>   static const TypeInfo taihu_type = {
> 


