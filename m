Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FFE36B69F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:18:52 +0200 (CEST)
Received: from localhost ([::1]:49990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3wh-0004Cq-Pa
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb3tp-0002F9-7g
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lb3tn-0007J1-Lu
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619453751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tI2IV2W76A2TNkjU5ufkryz+d3+FodA5njmaPjw/VuU=;
 b=SsNNlbSKEtoRLhHvV7Qc3tgUtTt4mht8A5sBiKXUtZ+xR93rWdZQ742BJfLt97FxR/6WZY
 2Rqiyv3CnmO5ryLjtsiP5I7jUx7SrQ9vJuUKXVSXWUg7vrU+Lze02pCoMvN7iWoORzG2IM
 mxWacRG1HVu/8KtuJzQj0kVUHpLZ18k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-YrH4pzDwPlOeUUbYxduHkg-1; Mon, 26 Apr 2021 12:15:46 -0400
X-MC-Unique: YrH4pzDwPlOeUUbYxduHkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B2F107ACF6;
 Mon, 26 Apr 2021 16:15:44 +0000 (UTC)
Received: from work-vm (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 921D46086F;
 Mon, 26 Apr 2021 16:15:39 +0000 (UTC)
Date: Mon, 26 Apr 2021 17:15:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 06/18] cpu: Assert DeviceClass::vmsd is NULL on user
 emulation
Message-ID: <YIbnKL8wiR7afBbj@work-vm>
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-7-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-7-f4bug@amsat.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> Migration is specific to system emulation.
> 
> Restrict current DeviceClass::vmsd to sysemu using #ifdef'ry,
> and assert in cpu_exec_realizefn() that dc->vmsd not set under
> user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  cpu.c                  | 1 +
>  target/sh4/cpu.c       | 5 +++--
>  target/unicore32/cpu.c | 4 ++++
>  target/xtensa/cpu.c    | 4 +++-
>  4 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/cpu.c b/cpu.c
> index bfbe5a66f95..4fed04219df 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -138,6 +138,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  #endif /* CONFIG_TCG */
>  
>  #ifdef CONFIG_USER_ONLY
> +    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL);

Why not make that:
   assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
          qdev_get_vmsd(DEVICE(cpu)->unmigratable)

then you don't have to worry about the changes below.

Dave

>      assert(cc->vmsd == NULL);
>  #else
>      if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index ac65c88f1f8..35d4251aaf3 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -218,10 +218,12 @@ static void superh_cpu_initfn(Object *obj)
>      env->movcal_backup_tail = &(env->movcal_backup);
>  }
>  
> +#ifndef CONFIG_USER_ONLY
>  static const VMStateDescription vmstate_sh_cpu = {
>      .name = "cpu",
>      .unmigratable = 1,
>  };
> +#endif
>  
>  #include "hw/core/tcg-cpu-ops.h"
>  
> @@ -257,12 +259,11 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = superh_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
> +    dc->vmsd = &vmstate_sh_cpu;
>  #endif
>      cc->disas_set_info = superh_cpu_disas_set_info;
>  
>      cc->gdb_num_core_regs = 59;
> -
> -    dc->vmsd = &vmstate_sh_cpu;
>      cc->tcg_ops = &superh_tcg_ops;
>  }
>  
> diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
> index 0258884f845..a74ac7b6140 100644
> --- a/target/unicore32/cpu.c
> +++ b/target/unicore32/cpu.c
> @@ -115,10 +115,12 @@ static void uc32_cpu_initfn(Object *obj)
>  #endif
>  }
>  
> +#ifndef CONFIG_USER_ONLY
>  static const VMStateDescription vmstate_uc32_cpu = {
>      .name = "cpu",
>      .unmigratable = 1,
>  };
> +#endif
>  
>  #include "hw/core/tcg-cpu-ops.h"
>  
> @@ -146,7 +148,9 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
>      cc->dump_state = uc32_cpu_dump_state;
>      cc->set_pc = uc32_cpu_set_pc;
>      cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
> +#ifndef CONFIG_USER_ONLY
>      dc->vmsd = &vmstate_uc32_cpu;
> +#endif
>      cc->tcg_ops = &uc32_tcg_ops;
>  }
>  
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index e2b2c7a71c1..a66527e2d45 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -176,10 +176,12 @@ static void xtensa_cpu_initfn(Object *obj)
>  #endif
>  }
>  
> +#ifndef CONFIG_USER_ONLY
>  static const VMStateDescription vmstate_xtensa_cpu = {
>      .name = "cpu",
>      .unmigratable = 1,
>  };
> +#endif
>  
>  #include "hw/core/tcg-cpu-ops.h"
>  
> @@ -216,9 +218,9 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_stop_before_watchpoint = true;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
> +    dc->vmsd = &vmstate_xtensa_cpu;
>  #endif
>      cc->disas_set_info = xtensa_cpu_disas_set_info;
> -    dc->vmsd = &vmstate_xtensa_cpu;
>      cc->tcg_ops = &xtensa_tcg_ops;
>  }
>  
> -- 
> 2.26.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


