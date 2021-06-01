Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA21397A5F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 21:01:58 +0200 (CEST)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo9eG-0002ex-Kq
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 15:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo9cW-0001bz-T1
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 15:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo9cT-0004Y6-48
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 15:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622574003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nvA+Gv0qzYzkzDgkZ33nkaovQzbyK0edeORhGDjTiZ8=;
 b=LXUdRTjnevDAfYyCEHm87p3HvHhoaLI3Igpijifao6GA4u9lUUKFBHAP8fX51ZzqHEw6WD
 wSzRUOjbgyDValth/2ZRkOfxJK6O4H3HWG+mAt+eMEPqlqx1Jsis9tHRi0O3RuqRirYwUU
 FTYns1p5jg4o1pOjePiZE52QleKoKyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-qnQHwXqiNlejzyv9R5J8Ng-1; Tue, 01 Jun 2021 15:00:01 -0400
X-MC-Unique: qnQHwXqiNlejzyv9R5J8Ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 326F8101372A;
 Tue,  1 Jun 2021 18:59:59 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBA5B5D9CD;
 Tue,  1 Jun 2021 18:59:55 +0000 (UTC)
Date: Tue, 1 Jun 2021 14:59:55 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 2/2] i386: run accel_cpu_instance_init as
 instance_post_init
Message-ID: <20210601185955.upjlobdgi366ruhh@habkost.net>
References: <20210529091313.16708-1-cfontana@suse.de>
 <20210529091313.16708-3-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210529091313.16708-3-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Siddharth Chandrasekaran <sidcha@amazon.de>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 29, 2021 at 11:13:13AM +0200, Claudio Fontana wrote:
> This partially fixes host and max cpu initialization,
> by running the accel cpu initialization only after all instance
> init functions are called for all X86 cpu subclasses.

Can you describe what exactly are the initialization ordering
dependencies that were broken?

> 
> Partial Fix.

What does "partial fix" mean?

> 
> Fixes: 48afe6e4eabf ("i386: split cpu accelerators from cpu.c, using AccelCPUClass")
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

The fix looks simple and may be obvious, my only concerns are:

1. Testing.  Luckily we are a bit early in the release cycle so
   we have some time for that.
2. Describing more clearly what exactly was wrong.  This can be
   fixed manually in the commit message when applying the patch.


An even better long term solution would be removing the
initialization ordering dependencies and make
accel_cpu_instance_init() safe to be called earlier.  Would that
be doable?


> ---
>  target/i386/cpu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6bcb7dbc2c..ae148fbd2f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6422,6 +6422,11 @@ static void x86_cpu_register_feature_bit_props(X86CPUClass *xcc,
>      x86_cpu_register_bit_prop(xcc, name, w, bitnr);
>  }
>  
> +static void x86_cpu_post_initfn(Object *obj)
> +{
> +    accel_cpu_instance_init(CPU(obj));
> +}
> +
>  static void x86_cpu_initfn(Object *obj)
>  {
>      X86CPU *cpu = X86_CPU(obj);
> @@ -6473,9 +6478,6 @@ static void x86_cpu_initfn(Object *obj)
>      if (xcc->model) {
>          x86_cpu_load_model(cpu, xcc->model);
>      }
> -
> -    /* if required, do accelerator-specific cpu initializations */
> -    accel_cpu_instance_init(CPU(obj));
>  }
>  
>  static int64_t x86_cpu_get_arch_id(CPUState *cs)
> @@ -6810,6 +6812,8 @@ static const TypeInfo x86_cpu_type_info = {
>      .parent = TYPE_CPU,
>      .instance_size = sizeof(X86CPU),
>      .instance_init = x86_cpu_initfn,
> +    .instance_post_init = x86_cpu_post_initfn,
> +
>      .abstract = true,
>      .class_size = sizeof(X86CPUClass),
>      .class_init = x86_cpu_common_class_init,
> -- 
> 2.26.2
> 

-- 
Eduardo


