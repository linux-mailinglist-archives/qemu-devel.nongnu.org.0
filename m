Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67375425CAD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 21:53:43 +0200 (CEST)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZSX-0007MF-OV
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 15:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYZQy-0006fr-NE
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mYZQp-0002IC-BT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633636313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSJdnQLBRJZqIYEQXaJkFdiNc92DNWtdQnJhG+HrODQ=;
 b=AeJmiweUz++zP05g2aLKvEtoz4mOzMRdkDNk45zUxvmaZWqtiK2Xh9Ic1/sbErk31xbiQB
 dFPmXEDW8ow3Bk/Qlij3toWdusEVv8uas2YdPAgMYiqvSXUrOWFhj86+7Ysc2kUouU5GNX
 wfiiRRzwfITFCGfPBiwYhoC0fyNgSSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-8-O3j7ivNHG0-_TYdbmp9A-1; Thu, 07 Oct 2021 15:51:51 -0400
X-MC-Unique: 8-O3j7ivNHG0-_TYdbmp9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 231E21922964;
 Thu,  7 Oct 2021 19:51:50 +0000 (UTC)
Received: from redhat.com (ovpn-113-216.phx2.redhat.com [10.3.113.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1124210016FF;
 Thu,  7 Oct 2021 19:51:12 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:51:10 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 16/23] target/i386/sev: Remove stubs by using code
 elision
Message-ID: <20211007195110.tmsawi5vt3vnoo6t@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
 <20211007161716.453984-17-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211007161716.453984-17-philmd@redhat.com>
User-Agent: NeoMutt/20210205-818-e2615c
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 06:17:09PM +0200, Philippe Mathieu-Daudé wrote:
> Only declare sev_enabled() and sev_es_enabled() when CONFIG_SEV is
> set, to allow the compiler to elide unused code. Remove unnecessary
> stubs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/sev.h       | 14 ++++++++++++--
>  target/i386/cpu.c       | 13 +++++++------
>  target/i386/sev-stub.c  | 41 -----------------------------------------
>  target/i386/meson.build |  2 +-
>  4 files changed, 20 insertions(+), 50 deletions(-)
>  delete mode 100644 target/i386/sev-stub.c
> 
> diff --git a/target/i386/sev.h b/target/i386/sev.h
> index c96072bf78d..d9548e3e642 100644
> --- a/target/i386/sev.h
> +++ b/target/i386/sev.h
> @@ -14,6 +14,10 @@
>  #ifndef QEMU_SEV_I386_H
>  #define QEMU_SEV_I386_H
>  
> +#ifndef CONFIG_USER_ONLY
> +#include CONFIG_DEVICES /* CONFIG_SEV */
> +#endif
> +
>  #include "exec/confidential-guest-support.h"
>  #include "qapi/qapi-types-misc-target.h"
>  
> @@ -35,8 +39,14 @@ typedef struct SevKernelLoaderContext {
>      size_t cmdline_size;
>  } SevKernelLoaderContext;
>  
> -bool sev_enabled(void);
> -extern bool sev_es_enabled(void);
> +#ifdef CONFIG_SEV
> + bool sev_enabled(void);
> +bool sev_es_enabled(void);
> +#else

Is that leading space on the sev_enabled() line intentional?

> +#define sev_enabled() 0
> +#define sev_es_enabled() 0
> +#endif
> +

This allows an optimizing compiler to elide code, but does not require
that the elision worked. The real test is whether there is a link
error when functions that are only called inside what we hope is
elided have no stub.

>  extern SevInfo *sev_get_info(void);
>  extern uint32_t sev_get_cbit_position(void);
>  extern uint32_t sev_get_reduced_phys_bits(void);
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 8289dc87bd5..fc3ed80ef1e 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5764,12 +5764,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          *edx = 0;
>          break;
>      case 0x8000001F:
> -        *eax = sev_enabled() ? 0x2 : 0;
> -        *eax |= sev_es_enabled() ? 0x8 : 0;
> -        *ebx = sev_get_cbit_position();
> -        *ebx |= sev_get_reduced_phys_bits() << 6;
> -        *ecx = 0;
> -        *edx = 0;
> +        *eax = *ebx = *ecx = *edx = 0;
> +        if (sev_enabled()) {
> +            *eax = 0x2;
> +            *eax |= sev_es_enabled() ? 0x8 : 0;
> +            *ebx = sev_get_cbit_position();
> +            *ebx |= sev_get_reduced_phys_bits() << 6;
> +        }

As long as this compiles in all of our configurations, then the
compiler really has elided the calls and we can get rid of the stub.
But that's merely because we're relying on our particular gcc or clang
compiler behavior, and NOT because it is standardized behavior.  On
the other hand, I doubt either compiler would break this assumption,
as it is probably used in lots of places, even if it is not portable.

Since you asked for my opinion, I'm okay giving:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


