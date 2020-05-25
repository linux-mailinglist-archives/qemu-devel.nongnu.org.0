Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953451E0BD0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 12:29:03 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdALu-0008Bl-Mq
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 06:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jdAKx-0007Ab-Fb
 for qemu-devel@nongnu.org; Mon, 25 May 2020 06:28:03 -0400
Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80]:53345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jdAKv-00085T-Ao
 for qemu-devel@nongnu.org; Mon, 25 May 2020 06:28:03 -0400
Received: from player157.ha.ovh.net (unknown [10.110.208.202])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 1EB39134A1F
 for <qemu-devel@nongnu.org>; Mon, 25 May 2020 12:27:59 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id DF20712AE49C8;
 Mon, 25 May 2020 10:27:36 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0018e3cef46-2c28-4a7f-b44a-ec4150264288,22A89661A4361147AF88D80C9EA00EFFECB1F326)
 smtp.auth=groug@kaod.org
Date: Mon, 25 May 2020 12:27:35 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC v2 10/18] guest memory protection: Add guest memory
 protection interface
Message-ID: <20200525122735.1d4a45c7@bahia.lan>
In-Reply-To: <20200521034304.340040-11-david@gibson.dropbear.id.au>
References: <20200521034304.340040-1-david@gibson.dropbear.id.au>
 <20200521034304.340040-11-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11362018912813488614
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvtddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheekhfdtheegheehjeeludefkefhvdelfedvieehhfekhfdufffhueeuvdfftdfhnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.109.80; envelope-from=groug@kaod.org;
 helo=2.mo177.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 06:27:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 mdroth@linux.vnet.ibm.com, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 May 2020 13:42:56 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> Several architectures have mechanisms which are designed to protect guest
> memory from interference or eavesdropping by a compromised hypervisor.  AMD
> SEV does this with in-chip memory encryption and Intel has a similar
> mechanism.  POWER's Protected Execution Framework (PEF) accomplishes a
> similar goal using an ultravisor and new memory protection features,
> instead of encryption.
> 
> This introduces a new GuestMemoryProtection QOM interface which we'll use
> to (partially) unify handling of these various mechanisms.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  backends/Makefile.objs                 |  2 ++
>  backends/guest-memory-protection.c     | 29 +++++++++++++++++++++
>  include/exec/guest-memory-protection.h | 36 ++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>  create mode 100644 backends/guest-memory-protection.c
>  create mode 100644 include/exec/guest-memory-protection.h
> 
> diff --git a/backends/Makefile.objs b/backends/Makefile.objs
> index 28a847cd57..e4fb4f5280 100644
> --- a/backends/Makefile.objs
> +++ b/backends/Makefile.objs
> @@ -21,3 +21,5 @@ common-obj-$(CONFIG_LINUX) += hostmem-memfd.o
>  common-obj-$(CONFIG_GIO) += dbus-vmstate.o
>  dbus-vmstate.o-cflags = $(GIO_CFLAGS)
>  dbus-vmstate.o-libs = $(GIO_LIBS)
> +
> +common-obj-y += guest-memory-protection.o
> diff --git a/backends/guest-memory-protection.c b/backends/guest-memory-protection.c
> new file mode 100644
> index 0000000000..7e538214f7
> --- /dev/null
> +++ b/backends/guest-memory-protection.c
> @@ -0,0 +1,29 @@
> +#/*
> + * QEMU Guest Memory Protection interface
> + *
> + * Copyright: David Gibson, Red Hat Inc. 2020
> + *
> + * Authors:
> + *  David Gibson <david@gibson.dropbear.id.au>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/guest-memory-protection.h"
> +
> +static const TypeInfo guest_memory_protection_info = {
> +    .name = TYPE_GUEST_MEMORY_PROTECTION,
> +    .parent = TYPE_INTERFACE,
> +    .class_size = sizeof(GuestMemoryProtectionClass),
> +};
> +
> +static void guest_memory_protection_register_types(void)
> +{
> +    type_register_static(&guest_memory_protection_info);
> +}
> +
> +type_init(guest_memory_protection_register_types)
> diff --git a/include/exec/guest-memory-protection.h b/include/exec/guest-memory-protection.h
> new file mode 100644
> index 0000000000..38e9b01667
> --- /dev/null
> +++ b/include/exec/guest-memory-protection.h
> @@ -0,0 +1,36 @@
> +#/*
> + * QEMU Guest Memory Protection interface
> + *
> + * Copyright: David Gibson, Red Hat Inc. 2020
> + *
> + * Authors:
> + *  David Gibson <david@gibson.dropbear.id.au>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + *
> + */
> +#ifndef QEMU_GUEST_MEMORY_PROTECTION_H
> +#define QEMU_GUEST_MEMORY_PROTECTION_H
> +
> +#include "qom/object.h"
> +
> +typedef struct GuestMemoryProtection GuestMemoryProtection;
> +
> +#define TYPE_GUEST_MEMORY_PROTECTION "guest-memory-protection"
> +#define GUEST_MEMORY_PROTECTION(obj)                                    \
> +    INTERFACE_CHECK(GuestMemoryProtection, (obj),                       \
> +                    TYPE_GUEST_MEMORY_PROTECTION)
> +#define GUEST_MEMORY_PROTECTION_CLASS(klass)                            \
> +    OBJECT_CLASS_CHECK(GuestMemoryProtectionClass, (klass),             \
> +                       TYPE_GUEST_MEMORY_PROTECTION)
> +#define GUEST_MEMORY_PROTECTION_GET_CLASS(obj)                          \
> +    OBJECT_GET_CLASS(GuestMemoryProtectionClass, (obj),                 \
> +                     TYPE_GUEST_MEMORY_PROTECTION)
> +
> +typedef struct GuestMemoryProtectionClass {
> +    InterfaceClass parent;
> +} GuestMemoryProtectionClass;
> +
> +#endif /* QEMU_GUEST_MEMORY_PROTECTION_H */
> +

Applying patch #1294935 using "git am -s -m"
Description: [RFC,v2,10/18] guest memory protection: Add guest memory protection
Applying: guest memory protection: Add guest memory protection interface
.git/rebase-apply/patch:95: new blank line at EOF.
+
warning: 1 line adds whitespace errors.


