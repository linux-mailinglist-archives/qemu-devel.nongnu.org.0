Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069702226A6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 17:15:57 +0200 (CEST)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw5c4-0006ZU-34
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 11:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jw5ao-0005f3-Ac
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 11:14:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24899
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1jw5am-0000QO-Rm
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 11:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594912476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXv2Zt7lc3LCTxZdV0CFff4J1mirt6+c4CDz3gJ/WTU=;
 b=AhaDMWny1jYdFFOQIMldMH+r/cXGf9CA4SJ0chOcGn0IVBQW2YxCf8beSh9h7DbCTfFBRs
 VqqgX4sr10D32vx9j9LPDUFvt289uePVkgHlLvCAWY+rlninL932YuF2i9HtVe3JAwuz+Y
 rBkZrSBlcJLgON2CooBRmflWxwUxWXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-VOl3Rm_0PDC2jEjMYXwBdw-1; Thu, 16 Jul 2020 11:14:34 -0400
X-MC-Unique: VOl3Rm_0PDC2jEjMYXwBdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 717DD18C63CF;
 Thu, 16 Jul 2020 15:14:33 +0000 (UTC)
Received: from localhost (ovpn-119-232.rdu2.redhat.com [10.10.119.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FFF472AD9;
 Thu, 16 Jul 2020 15:14:32 +0000 (UTC)
Date: Thu, 16 Jul 2020 11:14:31 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH 2/2] i386/cpu: Mask off unsupported XSAVE components
Message-ID: <20200716151431.GK1274972@habkost.net>
References: <20200716082019.215316-1-xiaoyao.li@intel.com>
 <20200716082019.215316-3-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200716082019.215316-3-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 09:29:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 16, 2020 at 04:20:19PM +0800, Xiaoyao Li wrote:
> When setting up XSAVE components, it needs to mask off those unsupported
> by KVM.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>

We must never disable CPUID features silently based on host
capabilities, otherwise we can't guarantee guest ABI stability
when migrating to another host.  Filtering of features should
involve a call to mark_unavailable_features() (or some equivalent
mechanism) so we can report the missing features properly through
QMP.

Could you explain what's the bug you are trying to fix?  The loop
at x86_cpu_filter_features() is already supposed to disable
features unsupported by the host.

> ---
>  target/i386/cpu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index f5f11603e805..efc92334b7b1 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6274,8 +6274,10 @@ static void x86_cpu_enable_xsave_components(X86CPU *cpu)
>          }
>      }
>  
> -    env->features[FEAT_XSAVE_COMP_LO] = mask;
> -    env->features[FEAT_XSAVE_COMP_HI] = mask >> 32;
> +    env->features[FEAT_XSAVE_COMP_LO] = mask &
> +        x86_cpu_get_supported_feature_word(FEAT_XSAVE_COMP_LO, cpu->migratable);
> +    env->features[FEAT_XSAVE_COMP_HI] = (mask >> 32) &
> +        x86_cpu_get_supported_feature_word(FEAT_XSAVE_COMP_HI, cpu->migratable);
>  }
>  
>  /***** Steps involved on loading and filtering CPUID data
> -- 
> 2.18.4
> 

-- 
Eduardo


