Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A472D5F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:15:06 +0100 (CET)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNer-0006qQ-0X
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knNdI-00060k-Ox
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:13:28 -0500
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:51860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knNdA-0006Lz-Mu
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:13:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 65DA823898B;
 Thu, 10 Dec 2020 16:13:14 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 16:13:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003513d35d0-78e7-4723-ab14-47a0ec264919,
 7F90A86A4359BCD1ACB0618936AE64BD6AD86209) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Thu, 10 Dec 2020 16:13:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 1/1] spapr.c: set a 'kvm-type' default value instead
 of relying on NULL
Message-ID: <20201210161312.371c207d@bahia.lan>
In-Reply-To: <20201210145517.1532269-2-danielhb413@gmail.com>
References: <20201210145517.1532269-1-danielhb413@gmail.com>
 <20201210145517.1532269-2-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: cf812b51-d417-42a5-a63b-d251e48a90bc
X-Ovh-Tracer-Id: 4254212800021043619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=groug@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 10 Dec 2020 11:55:17 -0300
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
> values of kvm-type: "auto", "hv", and "pr", with "auto" being the default
> if no kvm-type was set by the user. This allows us to always be predictable
> regardless of any enhancements/changes made in QEMU options mechanics.
> 
> While we're at it, let's also document in 'kvm-type' description the
> already existing default mode, now named 'auto'. The information provided
> about it is based on how the pseries kernel handles the KVM_CREATE_VM
> ioctl(), where the default value '0' makes the kernel choose an available
> KVM module to use, giving precedence to kvm_hv. This logic is described in
> the kernel source file arch/powerpc/kvm/powerpc.c, function kvm_arch_init_vm().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b7e0894019..877bd264ce 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3021,17 +3021,25 @@ static void spapr_machine_init(MachineState *machine)
>      qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>  }
>  
> +#define DEFAULT_KVM_TYPE "auto"
>  static int spapr_kvm_type(MachineState *machine, const char *vm_type)
>  {
> -    if (!vm_type) {
> +    /*
> +     * The use of g_ascii_strcasecmp() for 'hv' and 'pr' is to
> +     * accomodate the 'HV' and 'PV' formats that exists in the
> +     * wild. The 'auto' mode is being introduced already as
> +     * lower-case, thus we don't need to bother checking for
> +     * "AUTO".
> +     */
> +    if (!vm_type || !strcmp(vm_type, DEFAULT_KVM_TYPE)) {
>          return 0;
>      }
>  
> -    if (!strcmp(vm_type, "HV")) {
> +    if (!g_ascii_strcasecmp(vm_type, "hv")) {
>          return 1;
>      }
>  
> -    if (!strcmp(vm_type, "PR")) {
> +    if (!g_ascii_strcasecmp(vm_type, "pr")) {
>          return 2;
>      }
>  
> @@ -3270,10 +3278,15 @@ static void spapr_instance_init(Object *obj)
>  
>      spapr->htab_fd = -1;
>      spapr->use_hotplug_event_source = true;
> +    spapr->kvm_type = g_strdup(DEFAULT_KVM_TYPE);
>      object_property_add_str(obj, "kvm-type",
>                              spapr_get_kvm_type, spapr_set_kvm_type);
>      object_property_set_description(obj, "kvm-type",
> -                                    "Specifies the KVM virtualization mode (HV, PR)");
> +                                    "Specifies the KVM virtualization mode (auto,"
> +                                    " hv, pr). Defaults to 'auto'. This mode will use"
> +                                    " any available KVM module loaded in the host,"
> +                                    " where kvm_hv takes precedence if both kvm_hv and"
> +                                    " kvm_pr are loaded.");
>      object_property_add_bool(obj, "modern-hotplug-events",
>                              spapr_get_modern_hotplug_events,
>                              spapr_set_modern_hotplug_events);


