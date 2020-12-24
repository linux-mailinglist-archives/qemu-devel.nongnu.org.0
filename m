Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542182E2573
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 09:27:57 +0100 (CET)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksLyW-0006tj-DH
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 03:27:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ksLxP-0006Nv-0q; Thu, 24 Dec 2020 03:26:47 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:52145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ksLxM-0001ow-Q3; Thu, 24 Dec 2020 03:26:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 7196F7D0C330;
 Thu, 24 Dec 2020 09:26:34 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 24 Dec
 2020 09:26:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00223a78562-1d1a-4956-b8f9-a09ab0ded215,
 1EADCDB2D537A6DD3E80F364D97246EF8095A17C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 1/2] ppc: Fix build with --without-default-devices
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <490464a3-d8a6-1814-2a5c-681eca3b96fa@kaod.org>
Date: Thu, 24 Dec 2020 09:26:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 92bb49cc-2314-4c16-a1b9-e1a11a8b06a4
X-Ovh-Tracer-Id: 5816961871538326435
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtkedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
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
> Linking of the qemu-system-ppc64 fails on a POWER9 host when
> --without-default-devices is passed to configure:
> 
> $ ./configure --without-default-devices \
>               --target-list=ppc64-softmmu && make
> 
> ...
> 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_mpic_kvm':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined reference to `kvm_openpic_connect_vcpu'
> libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_irq_check':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefined reference to `xics_kvm_has_broken_disconnect'
> libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_xive_post_load':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undefined reference to `kvmppc_xive_post_load'
> 
> ... and tons of other symbols belonging to the KVM backend of the
> openpic, XICS and XIVE interrupt controllers.
> 
> It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
> to depend on KVM but this has no effect when minikconf runs in
> allnoconfig mode. Such reverse dependencies should rather be
> handled with a 'select' statement, eg.
> 
> config OPENPIC
>     select OPENPIC_KVM if KVM
> 
> or even better by getting rid of the intermediate _KVM config
> and directly checking CONFIG_KVM in the meson.build file:
> 
> specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> 		if_true: files('openpic_kvm.c'))
> 
> Go for the latter with OPENPIC, XICS and XIVE. While here also move
> XIVE_SPAPR to hw/intc/Kconfig where it belongs.
> 
> This went unnoticed so far because CI doesn't test the build with
> --without-default-devices and KVM enabled on a POWER host.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - check CONFIG_KVM in the meson.build as suggested by Paolo
> ---
>  hw/intc/Kconfig     |   14 +++++---------
>  hw/intc/meson.build |    9 ++++++---
>  hw/ppc/Kconfig      |   15 ---------------
>  3 files changed, 11 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 468d548ca771..ee60d4bf7857 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -30,23 +30,19 @@ config ARM_GIC_KVM
>      default y
>      depends on ARM_GIC && KVM
>  
> -config OPENPIC_KVM
> -    bool
> -    default y
> -    depends on OPENPIC && KVM
> -
>  config XICS
>      bool
> -    depends on POWERNV || PSERIES
>  
>  config XICS_SPAPR
>      bool
>      select XICS
>  
> -config XICS_KVM
> +config XIVE
>      bool
> -    default y
> -    depends on XICS && KVM
> +
> +config XIVE_SPAPR
> +    bool
> +    select XIVE
>  
>  config ALLWINNER_A10_PIC
>      bool
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 68da782ad2c5..b6c9218908e3 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -39,7 +39,8 @@ specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_lioint
>  specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
>  specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
>  specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
> -specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true: files('openpic_kvm.c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> +		if_true: files('openpic_kvm.c'))
>  specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c'))
>  specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
>  specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
> @@ -50,8 +51,10 @@ specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> -specific_ss.add(when: 'CONFIG_XICS_KVM', if_true: files('xics_kvm.c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> +		if_true: files('xics_kvm.c'))
>  specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
>  specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
> -specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true: files('spapr_xive_kvm.c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
> +		if_true: files('spapr_xive_kvm.c'))
>  specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 982d55f5875c..064bd6edd83d 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -129,21 +129,6 @@ config VIRTEX
>      select XILINX_ETHLITE
>      select FDT_PPC
>  
> -config XIVE
> -    bool
> -    depends on POWERNV || PSERIES
> -
> -config XIVE_SPAPR
> -    bool
> -    default y
> -    depends on PSERIES
> -    select XIVE
> -
> -config XIVE_KVM
> -    bool
> -    default y
> -    depends on XIVE_SPAPR && KVM
> -
>  # Only used by 64-bit targets
>  config FW_CFG_PPC
>      bool
> 


There is still a small inconsistency I think,

In hw/ppc/Kconfig :

  config POWERNV
      ...
      select XICS
      select XIVE

  config PSERIES
      ...
      select XICS_SPAPR
      select XIVE_SPAPR

and in hw/intc/meson.build :

  specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c'))
  ...  
  specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
  specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
  ...


Couldn't we simply select XICS and XIVE in the PSERIES machine and
compile 'xics_spapr.c' and 'spapr_xive.c'  when CONFIG_PSERIES is
defined ? This to be in sync with the POWERNV machine.

or introduce 'CONFIG_XICS_PNV 'CONFIG_XIVE_PNV' ? 

Thanks,

C. 



