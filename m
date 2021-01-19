Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0F2FB3A7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:03:17 +0100 (CET)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1lyu-0005il-GM
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1lxU-00059w-A3
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:01:48 -0500
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:50996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l1lxR-00036Z-BD
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:01:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 7DCBD25B3CB;
 Tue, 19 Jan 2021 09:01:40 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 19 Jan
 2021 09:01:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0031ad2b040-dd18-4657-8e34-3460c003b26b,
 9B6877A1159CEF26E29E5BE572491BB707B5295E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 19 Jan 2021 09:01:38 +0100
From: Greg Kurz <groug@kaod.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 1/1] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <20210119090138.05ebf18a@bahia.lan>
In-Reply-To: <20210119044455.GA2587010@in.ibm.com>
References: <20210106085910.2200795-1-bharata@linux.ibm.com>
 <20210113172256.0d32dc5d@bahia.lan>
 <20210115083128.GA2457611@in.ibm.com>
 <20210115183005.2337dae4@bahia.lan>
 <20210119044455.GA2587010@in.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: b4c1304c-c3e8-483f-88f1-f44a94c413e6
X-Ovh-Tracer-Id: 10512527433878968739
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtdelgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekgeffheegjeegvdejueevleeiffekheeghfeijeetvedukeehudetlefhteefgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.45.231; envelope-from=groug@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 10:14:55 +0530
Bharata B Rao <bharata@linux.ibm.com> wrote:

> On Fri, Jan 15, 2021 at 06:30:05PM +0100, Greg Kurz wrote:
> > On Fri, 15 Jan 2021 14:01:28 +0530
> > Bharata B Rao <bharata@linux.ibm.com> wrote:
> > 
> > > On Wed, Jan 13, 2021 at 05:22:56PM +0100, Greg Kurz wrote:
> > > > Hi Bharata,
> > > > 
> > > > On Wed,  6 Jan 2021 14:29:10 +0530
> > > > Bharata B Rao <bharata@linux.ibm.com> wrote:
> > > > 
> > > > > If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
> > > > > 
> > > > > - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
> > > > >   ibm,hypertas-functions property.
> > > > > - Enable the hcall
> > > > > 
> > > > > Both the above are done only if the new sPAPR machine capability
> > > > > cap-rpt-invalidate is set.
> > > > > 
> > > > > Note: The KVM implementation of the hcall has been posted for upstream
> > > > > review here:
> > > > > https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata@linux.ibm.com/T/#t
> > > > > 
> > > > > Update to linux-headers/linux/kvm.h here is temporary, will be
> > > > > done via header updates once the kernel change is accepted upstream.
> > > > > 
> > > > > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > > > > ---
> > > > 
> > > > Patch looks mostly fine. A few remarks below.
> > > > 
> > > > >  hw/ppc/spapr.c            |  7 ++++++
> > > > >  hw/ppc/spapr_caps.c       | 49 +++++++++++++++++++++++++++++++++++++++
> > > > >  include/hw/ppc/spapr.h    |  8 +++++--
> > > > >  linux-headers/linux/kvm.h |  1 +
> > > > >  target/ppc/kvm.c          | 12 ++++++++++
> > > > >  target/ppc/kvm_ppc.h      | 11 +++++++++
> > > > >  6 files changed, 86 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > > > index 489cefcb81..0228083800 100644
> > > > > --- a/hw/ppc/spapr.c
> > > > > +++ b/hw/ppc/spapr.c
> > > > > @@ -890,6 +890,11 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
> > > > >      add_str(hypertas, "hcall-copy");
> > > > >      add_str(hypertas, "hcall-debug");
> > > > >      add_str(hypertas, "hcall-vphn");
> > > > > +    if (kvm_enabled() &&
> > > > 
> > > > You shouldn't check KVM here. The capability is enough to decide if we
> > > > should expose "hcall-rpt-invalidate" or not. FWIW we won't even reach
> > > > this code when running with anything but KVM.
> > > 
> > > Correct, the capability itself can be only for KVM case.
> > > 
> > > > 
> > > > > +        (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) == SPAPR_CAP_ON)) {
> > > > > +        add_str(hypertas, "hcall-rpt-invalidate");
> > > > > +    }
> > > > > +
> > > > >      add_str(qemu_hypertas, "hcall-memop1");
> > > > >  
> > > > >      if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
> > > > > @@ -2021,6 +2026,7 @@ static const VMStateDescription vmstate_spapr = {
> > > > >          &vmstate_spapr_cap_ccf_assist,
> > > > >          &vmstate_spapr_cap_fwnmi,
> > > > >          &vmstate_spapr_fwnmi,
> > > > > +        &vmstate_spapr_cap_rpt_invalidate,
> > > > >          NULL
> > > > >      }
> > > > >  };
> > > > > @@ -4478,6 +4484,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
> > > > >      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
> > > > >      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
> > > > >      smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
> > > > > +    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
> > > > 
> > > > Any reason for not enabling this for the default machine type and
> > > > disabling it for existing machine types only ?
> > > 
> > > If this capability is enabled, then
> > > 
> > > 1. First level guest (L1) can off-load the TLB invalidations to the
> > > new hcall if the platform has disabled LPCR[GTSE].
> > > 
> > > 2. Nested guest (L2) will switch to this new hcall rather than using
> > > the old H_TLB_INVALIDATE hcall.
> > > 
> > > Case 2 is optional and case 1 makes sense only if LPCR[GTSE]=off.
> > 
> > I don't think this is relevant, as the importance of each case can change,
> > e.g. nested is gaining momentum.
> > 
> > > Hence I thought keeping it off by default and expecting the
> > > user to turn it on only if required would be correct.
> > > 
> > 
> > If the feature is an improvement, even for what is considered a corner
> > case now, and it doesn't do harm to setups that won't use it, then it
> > should be enabled IMHO.
> > 
> > > Please note that turning this capability ON will result in the
> > > new hcall being exposed to the guest. I hope this is the right
> > > usage of spapr-caps?
> > > 
> > 
> > That's perfectly fine and this is why we should set it to ON
> > for the default machine type only.
> 
> The property can be turned ON only when the hypervisor supports
> the hcall. So if it set to ON for default machine type, then
> it may fail if the host doesn't have this hcall. Hence I thought
> it should be OFF by default and turning ON should be left to the
> user.
> 

Ok. This can be changed later when H_RPT_INVALIDATE support is
more widely available. BTW, if users are expected to manually
set this, I think you should add some documentation so that
they know how/when to use it.

> Regards,
> Bharata.


