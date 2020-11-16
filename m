Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F40E2B4A16
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:56:39 +0100 (CET)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegru-0000xM-OR
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kegq1-0000NX-7v; Mon, 16 Nov 2020 10:54:41 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kegpy-0003BC-3x; Mon, 16 Nov 2020 10:54:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3F5266CA7879;
 Mon, 16 Nov 2020 16:54:34 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 16 Nov
 2020 16:54:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00682808f80-31e8-426c-8b5e-fb59c78c5876,
 4C8231DAC7BA0B5668AD0293EB9EBEB96F7691F2) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-5.2] Revert series "spapr/xive: Allocate vCPU IPIs
 from the vCPU contexts"
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <160554086275.1325084.12110142252189044646.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <46173c00-f0db-1d58-2dec-7c4f1acc9847@kaod.org>
Date: Mon, 16 Nov 2020 16:54:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160554086275.1325084.12110142252189044646.stgit@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6db0bb33-e297-4103-81d9-d07ce4e2d3d4
X-Ovh-Tracer-Id: 11581287919062977385
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeetuddufeduudffgeeutdfguefhhfekvedufeefjedvfffhfeeuudevjeeftdehnecuffhomhgrihhnpehmrghrtgdrihhnfhhopdhgnhhurdhorhhgpdhlrghunhgthhhprggurdhnvghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 10:54:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Satheesh Rajendran <sathnaga@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Gustavo Romero <gromero@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 4:34 PM, Greg Kurz wrote:
> This series was largely built on the assumption that IPI numbers are
> numerically equal to vCPU ids. Even if this happens to be the case
> in practice with the default machine settings, this ceases to be true
> if VSMT is set to a different value than the number of vCPUs per core.
> This causes bogus IPI numbers to be created in KVM from a guest stand
> point. This leads to unknow results in the guest, including crashes
> or missing vCPUs (see BugLink) and even non-fatal oopses in current
> KVM that lacks a check before accessing misconfigured HW (see [1]).
> 
> A tentative patch was sent (see [2]) but it seems too complex to be
> merged in an RC. Since the original changes are essentially an
> optimization, it seems safer to revert them for now. The damage is
> done by commit acbdb9956fe9 ("spapr/xive: Allocate IPIs independently
> from the other sources") but the previous patches in the series are
> really preparatory patches. So this reverts the whole series:
> 
> eab0a2d06e97 ("spapr/xive: Allocate vCPU IPIs from the vCPU contexts")
> acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the other sources")

These are introducing the optimisation to allocate the vCPU IPI from the 
running task, and, at the same time, the issue for guests using vSMT.

> fa94447a2cd6 ("spapr/xive: Use kvmppc_xive_source_reset() in post_load")
> 235d3b116213 ("spapr/xive: Modify kvm_cpu_is_enabled() interface")

IMO, these two last patches are fine. 

C. 

 
> [1] https://marc.info/?l=kvm-ppc&m=160458409722959&w=4
> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03626.html
> 
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Fixes: acbdb9956fe9 ("spapr/xive: Allocate IPIs independently from the other sources")
> BugLink: https://bugs.launchpad.net/qemu/+bug/1900241
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> 
> Peter,
> 
> I'm Cc'ing you because we really want to fix this regression in 5.2.
> Reverting the culprit optimization seems a lot safer than the changes
> proposed in my other patch. David is on PTO right now and I'm not sure
> if he can post a PR anytime soon. Just in case: would it be acceptable
> to you if I send a PR after it got some positive feedback from the
> people on the Cc: list ? The better the sooner or do we wait for David
> to get a chance to step in ?
> ---
>  hw/intc/spapr_xive_kvm.c |  102 ++++++++--------------------------------------
>  1 file changed, 18 insertions(+), 84 deletions(-)
> 
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 66bf4c06fe55..e8667ce5f621 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -36,9 +36,10 @@ typedef struct KVMEnabledCPU {
>  static QLIST_HEAD(, KVMEnabledCPU)
>      kvm_enabled_cpus = QLIST_HEAD_INITIALIZER(&kvm_enabled_cpus);
>  
> -static bool kvm_cpu_is_enabled(unsigned long vcpu_id)
> +static bool kvm_cpu_is_enabled(CPUState *cs)
>  {
>      KVMEnabledCPU *enabled_cpu;
> +    unsigned long vcpu_id = kvm_arch_vcpu_id(cs);
>  
>      QLIST_FOREACH(enabled_cpu, &kvm_enabled_cpus, node) {
>          if (enabled_cpu->vcpu_id == vcpu_id) {
> @@ -146,45 +147,6 @@ int kvmppc_xive_cpu_synchronize_state(XiveTCTX *tctx, Error **errp)
>      return s.ret;
>  }
>  
> -/*
> - * Allocate the vCPU IPIs from the vCPU context. This will allocate
> - * the XIVE IPI interrupt on the chip on which the vCPU is running.
> - * This gives a better distribution of IPIs when the guest has a lot
> - * of vCPUs. When the vCPUs are pinned, this will make the IPI local
> - * to the chip of the vCPU. It will reduce rerouting between interrupt
> - * controllers and gives better performance.
> - */
> -typedef struct {
> -    SpaprXive *xive;
> -    Error *err;
> -    int rc;
> -} XiveInitIPI;
> -
> -static void kvmppc_xive_reset_ipi_on_cpu(CPUState *cs, run_on_cpu_data arg)
> -{
> -    unsigned long ipi = kvm_arch_vcpu_id(cs);
> -    XiveInitIPI *s = arg.host_ptr;
> -    uint64_t state = 0;
> -
> -    s->rc = kvm_device_access(s->xive->fd, KVM_DEV_XIVE_GRP_SOURCE, ipi,
> -                              &state, true, &s->err);
> -}
> -
> -static int kvmppc_xive_reset_ipi(SpaprXive *xive, CPUState *cs, Error **errp)
> -{
> -    XiveInitIPI s = {
> -        .xive = xive,
> -        .err  = NULL,
> -        .rc   = 0,
> -    };
> -
> -    run_on_cpu(cs, kvmppc_xive_reset_ipi_on_cpu, RUN_ON_CPU_HOST_PTR(&s));
> -    if (s.err) {
> -        error_propagate(errp, s.err);
> -    }
> -    return s.rc;
> -}
> -
>  int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -195,7 +157,7 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
>      assert(xive->fd != -1);
>  
>      /* Check if CPU was hot unplugged and replugged. */
> -    if (kvm_cpu_is_enabled(kvm_arch_vcpu_id(tctx->cs))) {
> +    if (kvm_cpu_is_enabled(tctx->cs)) {
>          return 0;
>      }
>  
> @@ -214,12 +176,6 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
>          return ret;
>      }
>  
> -    /* Create/reset the vCPU IPI */
> -    ret = kvmppc_xive_reset_ipi(xive, tctx->cs, errp);
> -    if (ret < 0) {
> -        return ret;
> -    }
> -
>      kvm_cpu_enable(tctx->cs);
>      return 0;
>  }
> @@ -279,12 +235,6 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
>  
>      assert(xive->fd != -1);
>  
> -    /*
> -     * The vCPU IPIs are now allocated in kvmppc_xive_cpu_connect()
> -     * and not with all sources in kvmppc_xive_source_reset()
> -     */
> -    assert(srcno >= SPAPR_XIRQ_BASE);
> -
>      if (xive_source_irq_is_lsi(xsrc, srcno)) {
>          state |= KVM_XIVE_LEVEL_SENSITIVE;
>          if (xsrc->status[srcno] & XIVE_STATUS_ASSERTED) {
> @@ -296,28 +246,12 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
>                               true, errp);
>  }
>  
> -/*
> - * To be valid, a source must have been claimed by the machine (valid
> - * entry in the EAS table) and if it is a vCPU IPI, the vCPU should
> - * have been enabled, which means the IPI has been allocated in
> - * kvmppc_xive_cpu_connect().
> - */
> -static bool xive_source_is_valid(SpaprXive *xive, int i)
> -{
> -    return xive_eas_is_valid(&xive->eat[i]) &&
> -        (i >= SPAPR_XIRQ_BASE || kvm_cpu_is_enabled(i));
> -}
> -
>  static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
>  {
>      SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
>      int i;
>  
> -    /*
> -     * Skip the vCPU IPIs. These are created/reset when the vCPUs are
> -     * connected in kvmppc_xive_cpu_connect()
> -     */
> -    for (i = SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
> +    for (i = 0; i < xsrc->nr_irqs; i++) {
>          int ret;
>  
>          if (!xive_eas_is_valid(&xive->eat[i])) {
> @@ -399,7 +333,7 @@ static void kvmppc_xive_source_get_state(XiveSource *xsrc)
>      for (i = 0; i < xsrc->nr_irqs; i++) {
>          uint8_t pq;
>  
> -        if (!xive_source_is_valid(xive, i)) {
> +        if (!xive_eas_is_valid(&xive->eat[i])) {
>              continue;
>          }
>  
> @@ -582,7 +516,7 @@ static void kvmppc_xive_change_state_handler(void *opaque, int running,
>              uint8_t pq;
>              uint8_t old_pq;
>  
> -            if (!xive_source_is_valid(xive, i)) {
> +            if (!xive_eas_is_valid(&xive->eat[i])) {
>                  continue;
>              }
>  
> @@ -610,7 +544,7 @@ static void kvmppc_xive_change_state_handler(void *opaque, int running,
>      for (i = 0; i < xsrc->nr_irqs; i++) {
>          uint8_t pq;
>  
> -        if (!xive_source_is_valid(xive, i)) {
> +        if (!xive_eas_is_valid(&xive->eat[i])) {
>              continue;
>          }
>  
> @@ -713,22 +647,22 @@ int kvmppc_xive_post_load(SpaprXive *xive, int version_id)
>          }
>      }
>  
> -    /*
> -     * We can only restore the source config if the source has been
> -     * previously set in KVM. Since we don't do that at reset time
> -     * when restoring a VM, let's do it now.
> -     */
> -    ret = kvmppc_xive_source_reset(&xive->source, &local_err);
> -    if (ret < 0) {
> -        goto fail;
> -    }
> -
>      /* Restore the EAT */
>      for (i = 0; i < xive->nr_irqs; i++) {
> -        if (!xive_source_is_valid(xive, i)) {
> +        if (!xive_eas_is_valid(&xive->eat[i])) {
>              continue;
>          }
>  
> +        /*
> +         * We can only restore the source config if the source has been
> +         * previously set in KVM. Since we don't do that for all interrupts
> +         * at reset time anymore, let's do it now.
> +         */
> +        ret = kvmppc_xive_source_reset_one(&xive->source, i, &local_err);
> +        if (ret < 0) {
> +            goto fail;
> +        }
> +
>          ret = kvmppc_xive_set_source_config(xive, i, &xive->eat[i], &local_err);
>          if (ret < 0) {
>              goto fail;
> 
> 


