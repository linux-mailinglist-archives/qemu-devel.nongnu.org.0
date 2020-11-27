Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69532C6682
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:13:57 +0100 (CET)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kidZU-0004SA-SO
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kidYG-0003e2-C2
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:12:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kidYD-0003BW-Iw
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606482756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oy8hfex+WsFWYAhNU80Krx5kSMleUG1krYZ29GcR0Fg=;
 b=RFYFob6xRxP1HFRAYLHECMAVyM1CVuwZhPtErRs1UHC/r5Lv9cJkG7h6HRzoVyMNHlxDUE
 UiP2Lm5SqlOOtmqRVoOds/uF1Zm17dJZgN9xV733RE/tMIqz+JlMN6mcCmoXZQvEw8ntqV
 EFTQVfQvliuY4VYPEphW9OxlxC9TbqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-YxEGU8Y5MiC39RtpmX3WOA-1; Fri, 27 Nov 2020 08:12:34 -0500
X-MC-Unique: YxEGU8Y5MiC39RtpmX3WOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB5A185E49C
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 13:12:33 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2EF25D6D1;
 Fri, 27 Nov 2020 13:12:32 +0000 (UTC)
Date: Fri, 27 Nov 2020 14:12:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 35/36] vl: clean up -boot variables
Message-ID: <20201127141230.2c958104@redhat.com>
In-Reply-To: <20201123141435.2726558-36-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-36-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 09:14:34 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Move more of them into MachineState, in preparation for moving initialization
> of the machine out of vl.c.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/boards.h |  1 +
>  softmmu/vl.c        | 11 ++++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 4537cfb5c6..b9233af54a 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -283,6 +283,7 @@ struct MachineState {
>      ram_addr_t maxram_size;
>      uint64_t   ram_slots;
>      const char *boot_order;
> +    const char *boot_once;
>      char *kernel_filename;
>      char *kernel_cmdline;
>      char *initrd_filename;
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index d76f87028d..aeb988bcad 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -132,8 +132,6 @@ typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
>  
>  static const char *cpu_option;
>  static const char *mem_path;
> -static const char *boot_order;
> -static const char *boot_once;
>  static const char *incoming;
>  static const char *loadvm;
>  static ram_addr_t maxram_size;
> @@ -1733,6 +1731,8 @@ static void qemu_apply_machine_options(void)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
>      QemuOpts *machine_opts = qemu_get_machine_opts();
> +    const char *boot_order = NULL;
> +    const char *boot_once = NULL;
>      QemuOpts *opts;
>  
>      qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
> @@ -1762,6 +1762,7 @@ static void qemu_apply_machine_options(void)
>      }
>  
>      current_machine->boot_order = boot_order;
> +    current_machine->boot_once = boot_once;
>  }
>  
>  static void qemu_create_early_backends(void)
> @@ -2444,9 +2445,9 @@ static void qemu_machine_creation_done(void)
>  
>      qdev_prop_check_globals();
>  
> -    if (boot_once) {
> -        qemu_boot_set(boot_once, &error_fatal);
> -        qemu_register_reset(restore_boot_order, g_strdup(boot_order));
> +    if (current_machine->boot_once) {
> +        qemu_boot_set(current_machine->boot_once, &error_fatal);
> +        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
>      }
>  
>      if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {


