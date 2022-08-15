Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9D592EAC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 14:06:35 +0200 (CEST)
Received: from localhost ([::1]:36660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNYra-00070Z-4H
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 08:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oNYlg-0003rf-DU
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 08:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oNYld-0004P4-JX
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 08:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660564824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xr5EbMWfwdtTBuO9xbnnvrHYYjtrr4mlyMRWpK0uFZw=;
 b=MXiadfTrsc0rxa1ZSxcOvwBosp9b4AGMQ/nLOQVLKY5jjoJPQcP7YgMxrqMS+41G/KAxT9
 LP3ELhv+p54iho5t3mkhjiIBhwCYyUTgN4HF89MxGaMvMIKgk4N2PXe/lR/vAmsINWB3JL
 aOm1AUtwTuIdgI57Utp7e18kOpo//2I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-CZfgcvfRPG6RN6vSsKr1Sw-1; Mon, 15 Aug 2022 08:00:23 -0400
X-MC-Unique: CZfgcvfRPG6RN6vSsKr1Sw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adfba4c000000b0021e7440666bso1123741wrg.22
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 05:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Xr5EbMWfwdtTBuO9xbnnvrHYYjtrr4mlyMRWpK0uFZw=;
 b=Hqup8TcnhRprAQA3Sj/M0EL6QBsjtLNfsuYl6Jhr1ntyLxhO8+52BgDHZK+RGeTWLw
 ksDsGuXSMh8sZXGeaazbg66ajVXWm9bQhCbOt/isTjYuCtvFpbamjf9yOyqvodlAG+ox
 sLABzm5VVnzrCECU1OPySjX2pjuvD82QZpNsep1mr0NFJTxTq/ImhPO3xkK9u8ueoUZ8
 IXhu5F9R3vUut8KdGv3qtQaa5HNG5941nqp2MT2QeogRN2OeUPDGgVCh4/yGntbIbNrX
 mktClhD3Go3pI98W5yPLVJ6SHi6ZaqL5JHou0rj/VvFaW9/x6mXPrW3w8E+S1dZTkcoL
 g8Ew==
X-Gm-Message-State: ACgBeo1v/sb0DDmeuYv/kZAEedl8AHzsYueCfhyXpBbrvKuJ6EuqnYMD
 Te645lmGm0dJlT1UqswaDw5uEaG+W15TYAhwNgnFmHKv+EZJZaEDgCrF1nHLuHwkKVpfM7/LhTp
 RwlE6+U4Q6Q5EGoc=
X-Received: by 2002:adf:ead0:0:b0:225:f9e:efb8 with SMTP id
 o16-20020adfead0000000b002250f9eefb8mr652961wrn.1.1660564820957; 
 Mon, 15 Aug 2022 05:00:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5QgBfcvlHHN9NiNdpf8cMRyfOcnnBo/y1obqi6UAQ519UbrpqqrZaOohfcHKLhWGTYE/bbnQ==
X-Received: by 2002:adf:ead0:0:b0:225:f9e:efb8 with SMTP id
 o16-20020adfead0000000b002250f9eefb8mr652948wrn.1.1660564820757; 
 Mon, 15 Aug 2022 05:00:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 b6-20020a05600c4e0600b003a5f4fccd4asm3840520wmq.35.2022.08.15.05.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 05:00:19 -0700 (PDT)
Date: Mon, 15 Aug 2022 13:00:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: armbru@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com
Subject: Re: [PATCH v4 1/1] monitor: Support specified vCPU registers
Message-ID: <Yvo1UdBtKxyaFas8@work-vm>
References: <20220802073720.1236988-1-pizhenwei@bytedance.com>
 <20220802073720.1236988-2-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802073720.1236988-2-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* zhenwei pi (pizhenwei@bytedance.com) wrote:
> Originally we have to get all the vCPU registers and parse the
> specified one. To improve the performance of this usage, allow user
> specified vCPU id to query registers.
> 
> Run a VM with 16 vCPU, use bcc tool to track the latency of
> 'hmp_info_registers':
> 'info registers -a' uses about 3ms;
> 'info registers 12' uses about 150us.
> 
> Cc: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hmp-commands-info.hx |  8 +++++---
>  monitor/misc.c       | 10 ++++++++--
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 188d9ece3b..e012035541 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -100,9 +100,11 @@ ERST
>  
>      {
>          .name       = "registers",
> -        .args_type  = "cpustate_all:-a",
> -        .params     = "[-a]",
> -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
> +        .args_type  = "cpustate_all:-a,vcpu:i?",
> +        .params     = "[-a|vcpu]",
> +        .help       = "show the cpu registers (-a: show register info for all cpus;"
> +                      " vcpu: specific vCPU to query; show the current CPU's registers if"
> +                      " no argument is specified)",
>          .cmd        = hmp_info_registers,
>      },
>  
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..6436a8786b 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
>  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>  {
>      bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> +    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
>      CPUState *cs;
>  
>      if (all_cpus) {
> @@ -315,13 +316,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>              cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>          }
>      } else {
> -        cs = mon_get_cpu(mon);
> +        cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);
>  
>          if (!cs) {
> -            monitor_printf(mon, "No CPU available\n");
> +            if (vcpu >= 0) {
> +                monitor_printf(mon, "CPU#%d not available\n", vcpu);
> +            } else {
> +                monitor_printf(mon, "No CPU available\n");
> +            }
>              return;
>          }
>  
> +        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>          cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>      }
>  }
> -- 
> 2.20.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


