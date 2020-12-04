Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE82CF545
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:07:38 +0100 (CET)
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHMf-0002Ks-8t
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEhm-0008NI-8E
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:17:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klEf7-0008Db-W2
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607102009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVWLBNxW4/VDbsI4KyXQ4V5NiZ6PO3dClC4xTj8S28E=;
 b=H9MFodGzkuvG1SaC0WL3/Hb3xLlnWKRop8eag2FJatxU/HFDfc5Yb466xtA75zF0dmKiFN
 x3UN5BDpdglpjfqBkHaIkfjDxk/Wfvld1wQvjRijRM+laPUdOug5fR4TBUxG8Bv0Gfz3RU
 wR8rEgDPHs2wYPu5wcvNGmpnPNabdKM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-dK49k3lbPSOEGgRubBdJmw-1; Fri, 04 Dec 2020 12:13:28 -0500
X-MC-Unique: dK49k3lbPSOEGgRubBdJmw-1
Received: by mail-ed1-f70.google.com with SMTP id bf13so2592212edb.10
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aVWLBNxW4/VDbsI4KyXQ4V5NiZ6PO3dClC4xTj8S28E=;
 b=rDCLpy/paO+mcZPMzW8u5L8Ceo6qRsd/vHQsXIlbh4JR7DQ2FM6jEpYqkJ7iDE4nsO
 If+2ta5izOvKJdGVkHsubtoSISRv1bJfaJmto5nLnJkZ+Af6vEu4ZaOay1WOKIxQ6xLz
 SVoMpJBEUC4UhXW6w3aC2SxsHGI6a4NmefYN/AOoH4hAzYWnv2RdwJ0iesTcq9xSv49I
 Ea2lARIbze5/wyUBdphKcQSrmXzewpdjzv2xZtZ4BDrbuRHaHtJeGeIV6eC6cS3f+BSJ
 ePHu06bFDL5NUvfvDS010Clbe7JnVATv2d62gGItJWfNYLY8IQKb/60n4uUzbEb483VY
 z5cA==
X-Gm-Message-State: AOAM533jv85PiuxT6THmyDtWea6UOwiU7M2NF+ZCi/GV0ylTgn33dQGF
 5yJaSk2Wknqb1W5J0z5JOHxWriyzlATLQg6KlcLWl/ikztGsozemGzbGuUlpn+xS5gM2yccKOh8
 IA2qBSQ8LFPhRVHo=
X-Received: by 2002:a17:906:4944:: with SMTP id
 f4mr8215791ejt.231.1607102006603; 
 Fri, 04 Dec 2020 09:13:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZt3JnOgHXxIMUjupVIwqDJ6IcInvyWH9ITC8Qh2Nd0tG55uGhoJikq3+JR/z4z67JiFkMyg==
X-Received: by 2002:a17:906:4944:: with SMTP id
 f4mr8215758ejt.231.1607102006407; 
 Fri, 04 Dec 2020 09:13:26 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id u15sm4086112edt.24.2020.12.04.09.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:13:25 -0800 (PST)
Subject: Re: [RFC v7 14/22] cpu: Move cpu_exec_* to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201130023535.16689-1-cfontana@suse.de>
 <20201130023535.16689-15-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <872334f0-b83f-3d7e-4d85-9a2b8e32884d@redhat.com>
Date: Fri, 4 Dec 2020 18:13:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130023535.16689-15-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 3:35 AM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  accel/tcg/cpu-exec.c            | 12 ++++++------
>  include/hw/core/cpu.h           |  6 ------
>  include/hw/core/tcg-cpu-ops.h   |  9 +++++++++
>  target/alpha/cpu.c              |  3 ++-
>  target/arm/cpu.c                |  2 +-
>  target/arm/cpu64.c              |  2 +-
>  target/arm/cpu_tcg.c            |  2 +-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               |  2 +-
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg-cpu.c           |  6 +++---
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/ppc/translate_init.c.inc |  6 +++---
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  26 files changed, 43 insertions(+), 39 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 816ef29f68..07ff1fa4dc 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -240,8 +240,8 @@ static void cpu_exec_enter(CPUState *cpu)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> -    if (cc->cpu_exec_enter) {
> -        cc->cpu_exec_enter(cpu);
> +    if (cc->tcg_ops.cpu_exec_enter) {
> +        cc->tcg_ops.cpu_exec_enter(cpu);
>      }
>  }
>  
> @@ -249,8 +249,8 @@ static void cpu_exec_exit(CPUState *cpu)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> -    if (cc->cpu_exec_exit) {
> -        cc->cpu_exec_exit(cpu);
> +    if (cc->tcg_ops.cpu_exec_exit) {
> +        cc->tcg_ops.cpu_exec_exit(cpu);
>      }
>  }
>  
> @@ -625,8 +625,8 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>             True when it is, and we should restart on a new TB,
>             and via longjmp via cpu_loop_exit.  */
>          else {
> -            if (cc->cpu_exec_interrupt &&
> -                cc->cpu_exec_interrupt(cpu, interrupt_request)) {
> +            if (cc->tcg_ops.cpu_exec_interrupt &&
> +                cc->tcg_ops.cpu_exec_interrupt(cpu, interrupt_request)) {
>                  if (need_replay_interrupt(interrupt_request)) {
>                      replay_interrupt();
>                  }
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 19211cb409..538f3e6cd3 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -146,9 +146,6 @@ struct TranslationBlock;
>   * @gdb_get_dynamic_xml: Callback to return dynamically generated XML for the
>   *   gdb stub. Returns a pointer to the XML contents for the specified XML file
>   *   or NULL if the CPU doesn't have a dynamically generated content for it.
> - * @cpu_exec_enter: Callback for cpu_exec preparation.
> - * @cpu_exec_exit: Callback for cpu_exec cleanup.
> - * @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec.
>   * @disas_set_info: Setup architecture specific components of disassembly info
>   * @adjust_watchpoint_address: Perform a target-specific adjustment to an
>   * address before attempting to match it against watchpoints.
> @@ -211,9 +208,6 @@ struct CPUClass {
>      const char *gdb_core_xml_file;
>      gchar * (*gdb_arch_name)(CPUState *cpu);
>      const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
> -    void (*cpu_exec_enter)(CPUState *cpu);
> -    void (*cpu_exec_exit)(CPUState *cpu);
> -    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>  
>      void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
>      vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 109291ac52..e12f32919b 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -10,6 +10,9 @@
>  #ifndef TCG_CPU_OPS_H
>  #define TCG_CPU_OPS_H
>  
> +/**
> + * struct TcgCpuOperations: TCG operations specific to a CPU class
> + */
>  typedef struct TcgCpuOperations {
>      /**
>       * @initialize: Initalize TCG state
> @@ -28,6 +31,12 @@ typedef struct TcgCpuOperations {
>       * @set_pc(tb->pc).
>       */
>      void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
> +    /** @cpu_exec_enter: Callback for cpu_exec preparation */
> +    void (*cpu_exec_enter)(CPUState *cpu);
> +    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
> +    void (*cpu_exec_exit)(CPUState *cpu);
> +    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
> +    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
>  } TcgCpuOperations;
>  
>  #endif /* TCG_CPU_OPS_H */
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index d66f0351a9..4f206c154d 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -218,7 +218,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
>      cc->class_by_name = alpha_cpu_class_by_name;
>      cc->has_work = alpha_cpu_has_work;
>      cc->do_interrupt = alpha_cpu_do_interrupt;
> -    cc->cpu_exec_interrupt = alpha_cpu_exec_interrupt;
>      cc->dump_state = alpha_cpu_dump_state;
>      cc->set_pc = alpha_cpu_set_pc;
>      cc->gdb_read_register = alpha_cpu_gdb_read_register;
> @@ -234,6 +233,8 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
>      cc->tcg_ops.initialize = alpha_translate_init;
>  
>      cc->gdb_num_core_regs = 67;
> +
> +    cc->tcg_ops.cpu_exec_interrupt = alpha_cpu_exec_interrupt;

With cc->tcg_ops.* guarded with #ifdef CONFIG_TCG:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


