Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277C447860C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 09:16:27 +0100 (CET)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my8Ph-0005et-LY
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 03:16:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1my8O6-0004lZ-7F
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1my8O2-00010y-Nm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639728877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fPUd6FfO7Yj3sJYHwd/y2oBSxWGegqeIJxewSS1CO5I=;
 b=AEF5Dgy/LMmZadU8zMO5X0P0//gZLb9dn2OQ5VCKLjOKoOi/s6qI8v8oFuHKd+jGxybakU
 UULFbe++PPWJUw2YHP2U2Ha2te+jU8rtord2VPshhL9zt0I6S7dpZvnbOkAGJrm1FAoIZt
 cswmCQz92ddj/WnTYv/LuuDl3IfOHzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-xWIohXJfPSquW8TiBeGB5w-1; Fri, 17 Dec 2021 03:14:35 -0500
X-MC-Unique: xWIohXJfPSquW8TiBeGB5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAD40801B2A;
 Fri, 17 Dec 2021 08:14:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A417A46F;
 Fri, 17 Dec 2021 08:13:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, David
 Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Halil
 Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com>
Organization: Red Hat GmbH
References: <20211208170241.110551-1-cohuck@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 17 Dec 2021 09:13:55 +0100
Message-ID: <87lf0jr6m4.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 08 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
>

(...)

> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc24..fccde2ef39f6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> +GlobalProperty pc_compat_6_2[] = {};
> +const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
> +
>  GlobalProperty pc_compat_6_1[] = {
>      { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
>      { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 223dd3e05d15..b03026bf0648 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_6_2_machine_options(MachineClass *m)
> +static void pc_i440fx_7_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
> +                      pc_i440fx_7_0_machine_options);
> +
> +static void pc_i440fx_6_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
>                        pc_i440fx_6_2_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index e1e100316d93..6b66eb16bb64 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_6_2_machine_options(MachineClass *m)
> +static void pc_q35_7_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
> +                   pc_q35_7_0_machine_options);
> +
> +static void pc_q35_6_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
>                     pc_q35_6_2_machine_options);
>  

So, this apparently causes some problems with one of the avocado tests:

162-tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias -> AssertionError: None != 'Cascadelake-Server-v1' : Cascadelake-Server must be an alias of Cascadelake-Server-v1

(full output at https://gitlab.com/qemu-project/qemu/-/jobs/1893456217)

I have looked at the patch again and do not see what might be wrong (has
something changed with the cpu model versioning recently?)

Does anyone else (especially the x86 folks) have an idea?


