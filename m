Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364992ECBA0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 09:10:07 +0100 (CET)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxQMw-0007Ha-5G
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 03:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kxQLO-0006Mu-9z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:08:30 -0500
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kxQLF-0000sU-PA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:08:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 8636522E5F7;
 Thu,  7 Jan 2021 09:08:17 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 7 Jan 2021
 09:08:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00512650ed1-2b06-4406-a2ea-d86f78b1f577,
 60F1A555FF7AE05BC39886BDE76A51AB2B051214) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Thu, 7 Jan 2021 09:08:15 +0100
From: Greg Kurz <groug@kaod.org>
To: BALATON Zoltan via <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 3/3] sam460ex: Use type cast macro instead of simple cast
Message-ID: <20210107090815.12cc73fd@bahia.lan>
In-Reply-To: <8bc87f574759a3e9e9e8707b1e0947c1ee21fa8c.1609946641.git.balaton@eik.bme.hu>
References: <cover.1609946641.git.balaton@eik.bme.hu>
 <8bc87f574759a3e9e9e8707b1e0947c1ee21fa8c.1609946641.git.balaton@eik.bme.hu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 13d8f254-ad53-48d7-853f-521abb7cafbc
X-Ovh-Tracer-Id: 13938922322658433318
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdeguddgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, f4bug@amsat.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jan 2021 16:24:01 +0100
BALATON Zoltan via <qemu-ppc@nongnu.org> wrote:

> Use the PCI_BUS type cast macro to convert result of
> qdev_get_child_bus(). Also remove the check for NULL afterwards which
> should not be needed because sysbus_create_simple() uses error_abort

It seems to me that sysbus_create_simple() doesn't return NULL because
it ends up calling object_new_with_type(). This allocates the object
with either g_malloc() or qemu_memalign(), both of which abort on
failure.

> and PCI_BUS macro also checks its argument by default so this

AFAICT, PCI_BUS() and all other instance type checking macros are
happy with a NULL argument. They simply return NULL in this case.

> shouldn't fail here.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ppc/sam460ex.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 14e6583eb0..cc67e9c39b 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -384,11 +384,8 @@ static void sam460ex_init(MachineState *machine)
>      ppc460ex_pcie_init(env);
>      /* All PCI irqs are connected to the same UIC pin (cf. UBoot source) */
>      dev = sysbus_create_simple("ppc440-pcix-host", 0xc0ec00000, uic[1][0]);
> -    pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
> -    if (!pci_bus) {
> -        error_report("couldn't create PCI controller!");
> -        exit(1);
> -    }
> +    pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci.0"));
> +

But PCI_BUS() is being passed qdev_get_child_bus(dev, "pci.0"), not
dev... so the real question here is whether this can return NULL
or not. And if this happens, is this a (1) user or (2) programming
error ?

If (1) then the "if (!pci_bus) { }" should be kept. If (2) then
it should be converted to an assert().

>      memory_region_init_alias(isa, NULL, "isa_mmio", get_system_io(),
>                               0, 0x10000);
>      memory_region_add_subregion(get_system_memory(), 0xc08000000, isa);


