Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FE68FD1D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 03:28:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPwfM-0007I8-5U; Wed, 08 Feb 2023 21:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPwfH-0007HR-ST
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 21:28:00 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPwfF-0001uq-EL
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 21:27:58 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id l8so653228vsi.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 18:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=raExKNmwx6bqZrMIio4sHAC5BrRj4c3S6EjlpfyZLqA=;
 b=L3kczzoC4w6vn98NiLf3iy8nAxm15CICMt6HzW7nPKLlnOa18upGgsebi3VTh3zVdH
 /6EJ6yDos4JpIoKIaC57QmQh2OdJaWYjKJjAg0jVBBa0tWma7d9MRNxy7/qhSk7tcaob
 yn77KmNkG6WkxIsuCedhEEoid27f5+WSfoFfMz7ub8W6csO3HudNgpmJPKMpRohwL+Jp
 FnkYaPKi/mycgLh79VIr4wJNPJsSgu1p8AWu/dAbzuZC9HFhS2ZvGweWDh8RxempiNSH
 FKX+sS0QcYH2+K5K6H2zbEGd4+OM+GJP6+H3rJ9gKXsk4XVI6kFAmRPqOECtIalBirgK
 JlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raExKNmwx6bqZrMIio4sHAC5BrRj4c3S6EjlpfyZLqA=;
 b=WJ9TdYUUnleYnB33iookem5SQfI+RsqJbr4Usg1YPVodE8sODpMMJ2SgPz8hKr2UpN
 OrxUIe95dufCHPuZQcFXM4S+5+Qilp09hl7UPN8JBA4oEKCifGGvPEwU02DrftYCT8j8
 lZMXDhg+lItln1tnGr6jqCBLLW4zRPnz6muA7kzEIBJ6f385IKlScfigNnZTLQ+yIN5A
 IGIeAUzYyRJkugR0XZK1M4tsG6QFMKll5kmXy+h/7D1rbUt4OShoBEenWfchHVxyzczy
 wJS9IMa/szBGMrwMPFZ0cBO7VXZwNGmbcYpCXb0ktLGrlURldm3ZXG3GmKfv41qyOPo0
 S3Qg==
X-Gm-Message-State: AO0yUKVTdapCZXoy4CjeSm2ppo4nOqhlCxpywId5a89NwNp36gweeJyd
 udyH6mdF5RmTxN9re3BmVwXGju5nFf4IzywXKPM=
X-Google-Smtp-Source: AK7set9Oxty4Prvf+kpillR4SSzUk+Ux3L9fJX6Z5q3egvU0JjXfQ+kzYK5XGvumzbCL/Ls6kwWojoCuWF/Q4scTDkw=
X-Received: by 2002:a67:e11e:0:b0:3f9:3f38:ca46 with SMTP id
 d30-20020a67e11e000000b003f93f38ca46mr2403585vsl.73.1675909674597; Wed, 08
 Feb 2023 18:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20230206234220.8414-1-dongli.zhang@oracle.com>
In-Reply-To: <20230206234220.8414-1-dongli.zhang@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 12:27:28 +1000
Message-ID: <CAKmqyKOFsYTkpb-1j3_3Rqcz7c0OK4TMg4XEjDFcFvo9n6M0Qg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/core/cpu: always print cpu index with cpu state
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, richard.henderson@linaro.org, 
 pbonzini@redhat.com, joe.jin@oracle.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 7, 2023 at 9:46 AM Dongli Zhang <dongli.zhang@oracle.com> wrote:
>
> The cpu_dump_state() does not print the cpu index. When the
> cpu_dump_state() is invoked due to the KVM failure, we are not able to tell
> from which CPU the state is. The below is an example.
>
> KVM internal error. Suberror: 764064
> RAX=0000000000000002 RBX=ffff8a9e57c38400 RCX=00000000ffffffff RDX=ffff8a9cc00ba8a0
> RSI=0000000000000003 RDI=ffff8a9e57c38400 RBP=ffffb6120c5b3c50 RSP=ffffb6120c5b3c40
> R8 =0000000000000000 R9 =ffff8a9cc00ba8a0 R10=ffffffff8e467350 R11=0000000000000007
> R12=000000000000000a R13=ffffffff8f987e25 R14=ffffffff8f988a01 R15=0000000000000000
> RIP=ffffffff8e51bb04 RFL=00010046 [---Z-P-] CPL=0 II=0 A20=1 SMM=0 HLT=0
> ES =0000 0000000000000000 ffffffff 00c00000
> CS =0010 0000000000000000 ffffffff 00a09b00 DPL=0 CS64 [-RA]
> SS =0000 0000000000000000 ffffffff 00c00000
> DS =0000 0000000000000000 ffffffff 00c00000
> FS =0000 0000000000000000 ffffffff 00c00000
> GS =0000 ffff8ac27fcc0000 ffffffff 00c00000
> LDT=0000 0000000000000000 ffffffff 00c00000
> TR =0040 fffffe0000096000 0000206f 00008b00 DPL=0 TSS64-busy
> GDT=     fffffe0000094000 0000007f
> IDT=     fffffe0000000000 00000fff
> CR0=80050033 CR2=0000000000000000 CR3=00000010ca40a001 CR4=003606e0
> DR0=0000000000000000 DR1=0000000000000000 DR2=0000000000000000 DR3=0000000000000000
> DR6=00000000fffe0ff0 DR7=0000000000000400
> EFER=0000000000000d01
> Code=0f 1f ... ...
>
> Print the cpu->cpu_index in cpu_dump_state() and remove it from the caller.
>
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/cpu-common.c      | 1 +
>  monitor/hmp-cmds-target.c | 2 --
>  softmmu/cpus.c            | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 5ccc3837b6..d2503f2d09 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -105,6 +105,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
>
>      if (cc->dump_state) {
>          cpu_synchronize_state(cpu);
> +        qemu_fprintf(f, "\nCPU#%d\n", cpu->cpu_index);
>          cc->dump_state(cpu, f, flags);
>      }
>  }
> diff --git a/monitor/hmp-cmds-target.c b/monitor/hmp-cmds-target.c
> index 0d3e84d960..f7dd354d2a 100644
> --- a/monitor/hmp-cmds-target.c
> +++ b/monitor/hmp-cmds-target.c
> @@ -99,7 +99,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
>
>      if (all_cpus) {
>          CPU_FOREACH(cs) {
> -            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>              cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>          }
>      } else {
> @@ -114,7 +113,6 @@ void hmp_info_registers(Monitor *mon, const QDict *qdict)
>              return;
>          }
>
> -        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>          cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>      }
>  }
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 9cbc8172b5..f69bbe6abc 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -122,7 +122,6 @@ void hw_error(const char *fmt, ...)
>      vfprintf(stderr, fmt, ap);
>      fprintf(stderr, "\n");
>      CPU_FOREACH(cpu) {
> -        fprintf(stderr, "CPU #%d:\n", cpu->cpu_index);
>          cpu_dump_state(cpu, stderr, CPU_DUMP_FPU);
>      }
>      va_end(ap);
> --
> 2.34.1
>
>

