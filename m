Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D82E1C04
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 12:56:07 +0100 (CET)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks2kP-0006Fc-Tb
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 06:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1ks2jS-0005Rs-AY; Wed, 23 Dec 2020 06:55:06 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1ks2jQ-00059p-1K; Wed, 23 Dec 2020 06:55:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0CFB97668A6B;
 Wed, 23 Dec 2020 12:54:59 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 23 Dec
 2020 12:54:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00475ed607e-8dd4-49cd-8d26-fd9b878b3610,
 59BCD474BAB9721FDBC8144ACC8A5B67F1E31CEB) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Wed, 23 Dec 2020 12:54:51 +0100
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ppc: Fix build with --without-default-devices
Message-ID: <20201223125451.6ca277b9@bahia.lan>
In-Reply-To: <7bafab63-659d-a8e9-a2d1-36483b226bf0@redhat.com>
References: <160871104474.106117.16441172468969132477.stgit@bahia.lan>
 <7bafab63-659d-a8e9-a2d1-36483b226bf0@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c25104e0-52a9-432f-901e-7b35a4b9c9c7
X-Ovh-Tracer-Id: 3463831067259083171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtjedgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 09:55:58 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 23/12/20 09:10, Greg Kurz wrote:
> > Linking of the qemu-system-ppc64 fails on a POWER9 host when
> > --without-default-devices is passed to configure:
> > 
> > $ ./configure --without-default-devices \
> >                --target-list=ppc64-softmmu && make
> > 
> > ...
> > 
> > libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_mpic_kvm':
> > /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined reference to `kvm_openpic_connect_vcpu'
> > libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_irq_check':
> > /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefined reference to `xics_kvm_has_broken_disconnect'
> > libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_xive_post_load':
> > /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undefined reference to `kvmppc_xive_post_load'
> > 
> > ... and tons of other symbols belonging to the KVM backend of the
> > openpic, XICS and XIVE interrupt controllers.
> > 
> > It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
> > to depend on KVM but this has no effect when minikconf runs in
> > allnoconfig mode. The correct way to express that some configuration
> > A requires some other configuration B to be true is "A select B".
> > 
> > Have OPENPIC, XICS and XIVE to select their KVM counterpart if KVM
> > is set. While here, fix POWERNV to select XIVE and XICS, just like
> > PSERIES, and drop the now useless XIVE related config clauses from
> > hw/ppc/Kconfig.
> > 
> > This went unnoticed so far because CI doesn't test the build with
> > --without-default-devices and KVM enabled on a POWER host.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> It is also possible to remove the *_KVM symbols and just use
> 
>      when: ['CONFIG_KVM', 'CONFIG_OPENPIC']
>      when: ['CONFIG_XICS', 'CONFIG_OPENPIC']
>      when: ['CONFIG_XIVE', 'CONFIG_OPENPIC']
> 

Good idea. I'll go for that. And it seems more fixing is need
around --without-default-devices so I'll need to repost anyway,

Thanks for the suggestion !

> in the meson.build files.  Which one is preferrable depends on personal 
> taste, and I do not myself lean in one direction or the other---I 
> mention it just in case _you_ find that one preferrable.
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Thanks!
> 
> Paolo
> 
> > ---
> >   hw/intc/Kconfig |   18 +++++++++++++-----
> >   hw/ppc/Kconfig  |   17 ++---------------
> >   2 files changed, 15 insertions(+), 20 deletions(-)
> > 
> > diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> > index 468d548ca771..0a5c080c4f5c 100644
> > --- a/hw/intc/Kconfig
> > +++ b/hw/intc/Kconfig
> > @@ -19,6 +19,7 @@ config ARM_GIC
> >   config OPENPIC
> >       bool
> >       select MSI_NONBROKEN
> > +    select OPENPIC_KVM if KVM
> >   
> >   config APIC
> >       bool
> > @@ -32,21 +33,28 @@ config ARM_GIC_KVM
> >   
> >   config OPENPIC_KVM
> >       bool
> > -    default y
> > -    depends on OPENPIC && KVM
> >   
> >   config XICS
> >       bool
> > -    depends on POWERNV || PSERIES
> > +    select XICS_KVM if KVM
> >   
> >   config XICS_SPAPR
> >       bool
> >       select XICS
> >   
> > +config XIVE
> > +    bool
> > +    select XIVE_KVM if KVM
> > +
> > +config XIVE_SPAPR
> > +    bool
> > +    select XIVE
> > +
> >   config XICS_KVM
> >       bool
> > -    default y
> > -    depends on XICS && KVM
> > +
> > +config XIVE_KVM
> > +    bool
> >   
> >   config ALLWINNER_A10_PIC
> >       bool
> > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > index 982d55f5875c..037d9332e994 100644
> > --- a/hw/ppc/Kconfig
> > +++ b/hw/ppc/Kconfig
> > @@ -31,6 +31,8 @@ config POWERNV
> >       select FDT_PPC
> >       select PCI_EXPRESS
> >       select MSI_NONBROKEN
> > +    select XIVE
> > +    select XICS
> >   
> >   config PPC405
> >       bool
> > @@ -129,21 +131,6 @@ config VIRTEX
> >       select XILINX_ETHLITE
> >       select FDT_PPC
> >   
> > -config XIVE
> > -    bool
> > -    depends on POWERNV || PSERIES
> > -
> > -config XIVE_SPAPR
> > -    bool
> > -    default y
> > -    depends on PSERIES
> > -    select XIVE
> > -
> > -config XIVE_KVM
> > -    bool
> > -    default y
> > -    depends on XIVE_SPAPR && KVM
> > -
> >   # Only used by 64-bit targets
> >   config FW_CFG_PPC
> >       bool
> > 
> > 
> 


