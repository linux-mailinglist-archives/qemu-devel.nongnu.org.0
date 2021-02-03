Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDCD30DF99
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:24:39 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KxK-0007rF-H8
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7KpG-0001OE-92
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:16:18 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l7Kp3-0001dP-3B
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:16:17 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 8B62A261D4A;
 Wed,  3 Feb 2021 17:15:58 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Feb 2021
 17:15:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d03d0090-901e-436c-a398-7faaa0e21e1c,
 14764A637080470E006017DF0F40374BD57DCD59) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 3 Feb 2021 17:15:48 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v8 07/13] confidential guest support: Introduce cgs
 "ready" flag
Message-ID: <20210203171548.0d8e0494@bahia.lan>
In-Reply-To: <20210202041315.196530-8-david@gibson.dropbear.id.au>
References: <20210202041315.196530-1-david@gibson.dropbear.id.au>
 <20210202041315.196530-8-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: af5f4bdd-8cd5-43de-941a-fb2932b2f48a
X-Ovh-Tracer-Id: 14717200635796625759
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegvhhgrsghkohhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: pair@us.ibm.com, mtosatti@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, borntraeger@de.ibm.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 pragyansri.pathi@intel.com, andi.kleen@intel.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 dgilbert@redhat.com, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  2 Feb 2021 15:13:09 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> The platform specific details of mechanisms for implementing
> confidential guest support may require setup at various points during
> initialization.  Thus, it's not really feasible to have a single cgs
> initialization hook, but instead each mechanism needs its own
> initialization calls in arch or machine specific code.
> 
> However, to make it harder to have a bug where a mechanism isn't
> properly initialized under some circumstances, we want to have a
> common place, late in boot, where we verify that cgs has been
> initialized if it was requested.
> 
> This patch introduces a ready flag to the ConfidentialGuestSupport
> base type to accomplish this, which we verify in
> qemu_machine_creation_done().
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  include/exec/confidential-guest-support.h | 24 +++++++++++++++++++++++
>  softmmu/vl.c                              | 10 ++++++++++
>  target/i386/sev.c                         |  2 ++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
> index 3db6380e63..5dcf602047 100644
> --- a/include/exec/confidential-guest-support.h
> +++ b/include/exec/confidential-guest-support.h
> @@ -27,6 +27,30 @@ OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
>  
>  struct ConfidentialGuestSupport {
>      Object parent;
> +
> +    /*
> +     * ready: flag set by CGS initialization code once it's ready to
> +     *        start executing instructions in a potentially-secure
> +     *        guest
> +     *
> +     * The definition here is a bit fuzzy, because this is essentially
> +     * part of a self-sanity-check, rather than a strict mechanism.
> +     *
> +     * It's not fasible to have a single point in the common machine

s/fasible/feasible

Anyway,

Reviewed-by: Greg Kurz <groug@kaod.org>

> +     * init path to configure confidential guest support, because
> +     * different mechanisms have different interdependencies requiring
> +     * initialization in different places, often in arch or machine
> +     * type specific code.  It's also usually not possible to check
> +     * for invalid configurations until that initialization code.
> +     * That means it would be very easy to have a bug allowing CGS
> +     * init to be bypassed entirely in certain configurations.
> +     *
> +     * Silently ignoring a requested security feature would be bad, so
> +     * to avoid that we check late in init that this 'ready' flag is
> +     * set if CGS was requested.  If the CGS init hasn't happened, and
> +     * so 'ready' is not set, we'll abort.
> +     */
> +    bool ready;
>  };
>  
>  typedef struct ConfidentialGuestSupportClass {
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1b464e3474..1869ed54a9 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -101,6 +101,7 @@
>  #include "qemu/plugin.h"
>  #include "qemu/queue.h"
>  #include "sysemu/arch_init.h"
> +#include "exec/confidential-guest-support.h"
>  
>  #include "ui/qemu-spice.h"
>  #include "qapi/string-input-visitor.h"
> @@ -2497,6 +2498,8 @@ static void qemu_create_cli_devices(void)
>  
>  static void qemu_machine_creation_done(void)
>  {
> +    MachineState *machine = MACHINE(qdev_get_machine());
> +
>      /* Did we create any drives that we failed to create a device for? */
>      drive_check_orphaned();
>  
> @@ -2516,6 +2519,13 @@ static void qemu_machine_creation_done(void)
>  
>      qdev_machine_creation_done();
>  
> +    if (machine->cgs) {
> +        /*
> +         * Verify that Confidential Guest Support has actually been initialized
> +         */
> +        assert(machine->cgs->ready);
> +    }
> +
>      if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
>          exit(1);
>      }
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 590cb31fa8..f9e9b5d8ae 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -737,6 +737,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>      qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
>      qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
>  
> +    cgs->ready = true;
> +
>      return 0;
>  err:
>      sev_guest = NULL;


