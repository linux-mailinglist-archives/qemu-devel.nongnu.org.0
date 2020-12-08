Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F42D2D4C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:36:29 +0100 (CET)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kme6N-0001ng-Ss
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kme3V-0000XG-7c; Tue, 08 Dec 2020 09:33:29 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:39669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kme3R-0000qD-UA; Tue, 08 Dec 2020 09:33:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 5893678D359F;
 Tue,  8 Dec 2020 15:33:13 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 8 Dec 2020
 15:33:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00269f5b6ba-dea0-4042-956e-51ad3a1da31a,
 17D40A658B0D6C300559F39EE9B5E954A2DF46D1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 8 Dec 2020 15:33:09 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Message-ID: <20201208153309.78825861@bahia.lan>
In-Reply-To: <20201208134536.1012045-1-danielhb413@gmail.com>
References: <20201208134536.1012045-1-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 717e6f63-7145-47da-acdb-a6d9f05d2b35
X-Ovh-Tracer-Id: 10279747626111048099
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejiedgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveeljefggfehtedujeegveeihfekvdfhjedtleehveetiefhfeetheffgefhffenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On Tue,  8 Dec 2020 10:45:36 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> spapr_kvm_type() is considering 'vm_type=NULL' as a valid input, where
> the function returns 0. This is relying on the current QEMU machine
> options handling logic, where the absence of the 'kvm-type' option
> will be reflected as 'vm_type=NULL' in this function.
> 
> This is not robust, and will break if QEMU options code decides to propagate
> something else in the case mentioned above (e.g. an empty string instead
> of NULL).
> 
> Let's avoid this entirely by setting a non-NULL default value in case of
> no user input for 'kvm-type'. spapr_kvm_type() was changed to handle 3 fixed
> values of kvm-type: "HV", "PR" and, if no kvm-type was set by the user,
> DEFAULT_KVM_TYPE. This allows us always be predictable regardless of any
> enhancements/changes made in QEMU options mechanics.
> 
> While we're at it, let's also document in 'kvm-type' description what
> happens if the user does not set this option. This information is based
> on how the pseries kernel handles the KVM_CREATE_VM ioctl(), where the
> default value '0' makes the kernel choose an available KVM module to
> use, giving precedence to kvm_hv. This logic is described in the kernel
> source file arch/powerpc/kvm/powerpc.c, function kvm_arch_init_vm().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> 
> The case I mentioned in the second paragraph is happening when we try to
> execute a pseries guest with '--enable-kvm' using Paolo's patch 
> "vl: make qemu_get_machine_opts static" [1]:
> 
> $ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries --enable-kvm
> qemu-system-ppc64: Unknown kvm-type specified '' 
> 
> This happens due to the differences between how qemu_opt_get() and
> object_property_get_str() works when there is no 'kvm-type' specified.
> See [2] for more info about the issue found.
> 
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01578.html 
> 
> 
>  hw/ppc/spapr.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b7e0894019..32d938dc6a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3021,9 +3021,10 @@ static void spapr_machine_init(MachineState *machine)
>      qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>  }
>  
> +#define DEFAULT_KVM_TYPE "auto"
>  static int spapr_kvm_type(MachineState *machine, const char *vm_type)
>  {
> -    if (!vm_type) {
> +    if (!strcmp(vm_type, DEFAULT_KVM_TYPE)) {
>          return 0;
>      }
>  
> @@ -3131,6 +3132,16 @@ static char *spapr_get_kvm_type(Object *obj, Error **errp)
>  {
>      SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>  
> +    /*
> +     * In case the user didn't set 'kvm-type', return DEFAULT_KVM_TYPE
> +     * instead of NULL. This allows us to be more predictable with what
> +     * is expected to happen in spapr_kvm_type(), since we can stop relying
> +     * on receiving a 'NULL' parameter as a valid input there.
> +     */

Returning what is obviously a default value is straightforward enough
that is doesn't need to a comment IMHO.

> +    if (!spapr->kvm_type) {
> +        return g_strdup(DEFAULT_KVM_TYPE);
> +    }
> +
>      return g_strdup(spapr->kvm_type);

Alternatively you could simply do:

    return g_strdup(spapr->kvm_type ? spapr->kvm_type : DEFAULT_KVM_TYPE);

>  }
>  
> @@ -3273,7 +3284,11 @@ static void spapr_instance_init(Object *obj)
>      object_property_add_str(obj, "kvm-type",
>                              spapr_get_kvm_type, spapr_set_kvm_type);
>      object_property_set_description(obj, "kvm-type",
> -                                    "Specifies the KVM virtualization mode (HV, PR)");
> +                                    "Specifies the KVM virtualization mode (HV, PR)."

Why not documenting "auto" as a valid option as well ?

While here you could maybe convert HV and PR to lowercase in order to
have a prettier "hv, pr, auto" set of valid values in the help string.
You'd need to convert the related checks in spapr_kvm_type() to still
check for the uppercase versions for compatibility, eg. by using
g_ascii_strcasecmp().

> +                                    " If not specified, defaults to any available KVM"
> +                                    " module loaded in the host. In case both kvm_hv"
> +                                    " and kvm_pr are loaded, kvm_hv takes precedence.");
> +

s/If not specified/If 'auto'/ and mention 'auto' as being the default value.

>      object_property_add_bool(obj, "modern-hotplug-events",
>                              spapr_get_modern_hotplug_events,
>                              spapr_set_modern_hotplug_events);


