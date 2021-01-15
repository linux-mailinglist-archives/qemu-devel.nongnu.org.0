Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7A2F8274
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:32:31 +0100 (CET)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Sxa-0008JM-KE
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l0SvP-0007gf-5o; Fri, 15 Jan 2021 12:30:16 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l0SvM-0004B9-8z; Fri, 15 Jan 2021 12:30:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CBBBA7BD8F6E;
 Fri, 15 Jan 2021 18:30:07 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 15 Jan
 2021 18:30:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002283c5eab-3143-4a8b-86d7-2eb3d5dd15b4,
 DCCBFB19B1A3BA1C031047B2F93F7C58B25CC811) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Fri, 15 Jan 2021 18:30:05 +0100
From: Greg Kurz <groug@kaod.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 1/1] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <20210115183005.2337dae4@bahia.lan>
In-Reply-To: <20210115083128.GA2457611@in.ibm.com>
References: <20210106085910.2200795-1-bharata@linux.ibm.com>
 <20210113172256.0d32dc5d@bahia.lan>
 <20210115083128.GA2457611@in.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: b5939dfc-c1cc-4515-bf1d-dd5e0b499a42
X-Ovh-Tracer-Id: 15068762879534406051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeegffehgeejgedvjeeuveelieffkeehgefhieejteevudekheduteelhfetfefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 14:01:28 +0530
Bharata B Rao <bharata@linux.ibm.com> wrote:

> On Wed, Jan 13, 2021 at 05:22:56PM +0100, Greg Kurz wrote:
> > Hi Bharata,
> > 
> > On Wed,  6 Jan 2021 14:29:10 +0530
> > Bharata B Rao <bharata@linux.ibm.com> wrote:
> > 
> > > If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
> > > 
> > > - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
> > >   ibm,hypertas-functions property.
> > > - Enable the hcall
> > > 
> > > Both the above are done only if the new sPAPR machine capability
> > > cap-rpt-invalidate is set.
> > > 
> > > Note: The KVM implementation of the hcall has been posted for upstream
> > > review here:
> > > https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata@linux.ibm.com/T/#t
> > > 
> > > Update to linux-headers/linux/kvm.h here is temporary, will be
> > > done via header updates once the kernel change is accepted upstream.
> > > 
> > > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > > ---
> > 
> > Patch looks mostly fine. A few remarks below.
> > 
> > >  hw/ppc/spapr.c            |  7 ++++++
> > >  hw/ppc/spapr_caps.c       | 49 +++++++++++++++++++++++++++++++++++++++
> > >  include/hw/ppc/spapr.h    |  8 +++++--
> > >  linux-headers/linux/kvm.h |  1 +
> > >  target/ppc/kvm.c          | 12 ++++++++++
> > >  target/ppc/kvm_ppc.h      | 11 +++++++++
> > >  6 files changed, 86 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 489cefcb81..0228083800 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -890,6 +890,11 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
> > >      add_str(hypertas, "hcall-copy");
> > >      add_str(hypertas, "hcall-debug");
> > >      add_str(hypertas, "hcall-vphn");
> > > +    if (kvm_enabled() &&
> > 
> > You shouldn't check KVM here. The capability is enough to decide if we
> > should expose "hcall-rpt-invalidate" or not. FWIW we won't even reach
> > this code when running with anything but KVM.
> 
> Correct, the capability itself can be only for KVM case.
> 
> > 
> > > +        (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) == SPAPR_CAP_ON)) {
> > > +        add_str(hypertas, "hcall-rpt-invalidate");
> > > +    }
> > > +
> > >      add_str(qemu_hypertas, "hcall-memop1");
> > >  
> > >      if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
> > > @@ -2021,6 +2026,7 @@ static const VMStateDescription vmstate_spapr = {
> > >          &vmstate_spapr_cap_ccf_assist,
> > >          &vmstate_spapr_cap_fwnmi,
> > >          &vmstate_spapr_fwnmi,
> > > +        &vmstate_spapr_cap_rpt_invalidate,
> > >          NULL
> > >      }
> > >  };
> > > @@ -4478,6 +4484,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
> > >      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
> > >      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
> > >      smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
> > > +    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
> > 
> > Any reason for not enabling this for the default machine type and
> > disabling it for existing machine types only ?
> 
> If this capability is enabled, then
> 
> 1. First level guest (L1) can off-load the TLB invalidations to the
> new hcall if the platform has disabled LPCR[GTSE].
> 
> 2. Nested guest (L2) will switch to this new hcall rather than using
> the old H_TLB_INVALIDATE hcall.
> 
> Case 2 is optional and case 1 makes sense only if LPCR[GTSE]=off.

I don't think this is relevant, as the importance of each case can change,
e.g. nested is gaining momentum.

> Hence I thought keeping it off by default and expecting the
> user to turn it on only if required would be correct.
> 

If the feature is an improvement, even for what is considered a corner
case now, and it doesn't do harm to setups that won't use it, then it
should be enabled IMHO.

> Please note that turning this capability ON will result in the
> new hcall being exposed to the guest. I hope this is the right
> usage of spapr-caps?
> 

That's perfectly fine and this is why we should set it to ON
for the default machine type only.

> > > diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> > > index 73ce2bc951..8e27f8421f 100644
> > > --- a/target/ppc/kvm_ppc.h
> > > +++ b/target/ppc/kvm_ppc.h
> > > @@ -24,6 +24,7 @@ void kvmppc_enable_logical_ci_hcalls(void);
> > >  void kvmppc_enable_set_mode_hcall(void);
> > >  void kvmppc_enable_clear_ref_mod_hcalls(void);
> > >  void kvmppc_enable_h_page_init(void);
> > > +void kvmppc_enable_h_rpt_invalidate(void);
> > >  void kvmppc_set_papr(PowerPCCPU *cpu);
> > >  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
> > >  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
> > > @@ -72,6 +73,7 @@ bool kvmppc_has_cap_nested_kvm_hv(void);
> > >  int kvmppc_set_cap_nested_kvm_hv(int enable);
> > >  int kvmppc_get_cap_large_decr(void);
> > >  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
> > > +int kvmppc_has_cap_rpt_invalidate(void);
> > >  int kvmppc_enable_hwrng(void);
> > >  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
> > >  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> > > @@ -151,6 +153,10 @@ static inline void kvmppc_enable_h_page_init(void)
> > >  {
> > >  }
> > >  
> > > +static inline void kvmppc_enable_h_rpt_invalidate(void)
> > > +{
> > 
> > g_assert_not_reached() ?
> 
> Don't see many others doing that, is that a new preferred
> way?
> 

I don't know if this is preferred or not, but it feels that
this should never be called when !CONFIG_KVM.

Cheers,

--
Greg

> Regards,
> Bharata.


