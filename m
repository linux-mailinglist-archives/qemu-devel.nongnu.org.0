Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2642E25F6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 11:36:38 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksNz3-0004rV-Gf
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 05:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ksNxg-0003qA-DV; Thu, 24 Dec 2020 05:35:14 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ksNxb-0002ee-9w; Thu, 24 Dec 2020 05:35:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 47040769EE12;
 Thu, 24 Dec 2020 11:35:04 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 24 Dec
 2020 11:35:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d71fecd8-4f20-4e11-960a-354aa7f7dfb9,
 1EADCDB2D537A6DD3E80F364D97246EF8095A17C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 2/2] pnv: Fix reverse dependency on PCI express root
 ports
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
 <160875161547.98237.12463124171004809427.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <50a0a3bc-6e11-43db-48dd-851fb43f052c@kaod.org>
Date: Thu, 24 Dec 2020 11:35:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160875161547.98237.12463124171004809427.stgit@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: face9104-b9fd-4f28-9d6c-6d67539ae78c
X-Ovh-Tracer-Id: 7987133943093037987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtledgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/20 8:26 PM, Greg Kurz wrote:
> qemu-system-ppc64 built with --without-default-devices crashes:
> 
> Type 'pnv-phb4-root-port' is missing its parent 'pcie-root-port-base'
> Aborted (core dumped)
> 
> Have POWERNV to select PCIE_PORT. This is done through a
> new PCI_POWERNV config in hw/pci-host/Kconfig since POWERNV
> doesn't have a direct dependency on PCI. For this reason,
> PCI_EXPRESS and MSI_NONBROKEN are also moved under
> PCI_POWERNV.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
>  hw/pci-host/Kconfig     |    5 +++++
>  hw/pci-host/meson.build |    2 +-
>  hw/ppc/Kconfig          |    3 +--
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 036a61877a73..eb03f0489d08 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -60,3 +60,8 @@ config PCI_BONITO
>      select PCI
>      select UNIMP
>      bool
> +
> +config PCI_POWERNV
> +    select PCI_EXPRESS
> +    select MSI_NONBROKEN
> +    select PCIE_PORT
> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index e6d1b896848c..da9d1a9964a8 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -23,7 +23,7 @@ pci_ss.add(when: 'CONFIG_VERSATILE_PCI', if_true: files('versatile.c'))
>  
>  softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
>  
> -specific_ss.add(when: 'CONFIG_POWERNV', if_true: files(
> +specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
>    'pnv_phb3.c',
>    'pnv_phb3_msi.c',
>    'pnv_phb3_pbcq.c',
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 064bd6edd83d..501b9868568e 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -29,8 +29,7 @@ config POWERNV
>      select XICS
>      select XIVE
>      select FDT_PPC
> -    select PCI_EXPRESS
> -    select MSI_NONBROKEN
> +    select PCI_POWERNV
>  
>  config PPC405
>      bool
> 
> 


