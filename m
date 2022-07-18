Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B945782D8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:57:15 +0200 (CEST)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQJH-0003cT-4J
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQFL-0006Xb-SZ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQFI-0008JI-7g
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658148787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+8cq5jFTvIS1uc3p8g1wxzC9tMqaMNGG++vZOKcsHQ=;
 b=TrJicjiknNSg9Upd8sgpwbyOyLG0LVfJ9evs5UlJLyww/7+AvcoA7zcRNsh1Q6tOuVhJ3S
 iymLhNE4FVSStj6jWVX9wJ1CT8CzACRFlj95lc5eThCFSX8SqkhraitpqCWpK2uGVyHUlo
 ieyq1HEArfyWlh6frC4sMhyVA4vXkvQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-RWVCoU2PM6iKU5GkywIq1Q-1; Mon, 18 Jul 2022 08:53:06 -0400
X-MC-Unique: RWVCoU2PM6iKU5GkywIq1Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq20-20020a1709073f1400b0072b9824f0a2so2288446ejc.23
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F+8cq5jFTvIS1uc3p8g1wxzC9tMqaMNGG++vZOKcsHQ=;
 b=IE/l8dnjOgxeEwhQ8JfI4fMSB+9ZmCBgVozYORJQW0naqJgQOcdwe/kZyYHuJz9lZE
 O7wlSe6jxutdJAsrQqH8V6eOP0Kz8nkh3g5iReH5XKAXNeHfLuN0wJzKS8BdT7MEH7l7
 EfsatARf7rxwyGJtgPPkIytzNxkIjdg3WTUicPsC9F0EfSWkobdeU1insKx7HaxZTA/3
 pecaiVqJDlLNmHzkbqDMZTFPC4+N3posk+YYCdsEzf+aQQDmxr8+voXIrjrnxzXsMevL
 IwqcKHhAqTPAqXqeLB+Z3cYspW/wrlZz+EiEQjNnJki1kfJcnrkmcjDzI31fM3TVIya7
 6EaA==
X-Gm-Message-State: AJIora9rP/g60ChJaEvrK74l+Pfv41Ki6UJgsk0jxwWHFjhlQUvwkwYm
 rxnmrOfe2JjhbS1Yf+YfkxVQmINefny1487IQkQGg6Gf3uYhH5vaXS0Ag0Lz/nJ53qZVd680Mor
 /UsFZR0ZC5rB/NRo=
X-Received: by 2002:a17:907:2cca:b0:72b:4188:f95b with SMTP id
 hg10-20020a1709072cca00b0072b4188f95bmr26142994ejc.153.1658148785101; 
 Mon, 18 Jul 2022 05:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uos0vmdp7MIlZt9i9LbskpkfIwTTuvSUjUfS5CCMm7vCZwdD17CyMYAOlJrALr2jW1Mg3A9w==
X-Received: by 2002:a17:907:2cca:b0:72b:4188:f95b with SMTP id
 hg10-20020a1709072cca00b0072b4188f95bmr26142983ejc.153.1658148784937; 
 Mon, 18 Jul 2022 05:53:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa7dad9000000b0043a0da110e3sm8593128eds.43.2022.07.18.05.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 05:53:04 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:53:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v8 05/11] i386/pc: factor out cxl range end to helper
Message-ID: <20220718145303.22985b0b@redhat.com>
In-Reply-To: <20220715171628.21437-6-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-6-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 15 Jul 2022 18:16:22 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Move calculation of CXL memory region end to separate helper.
> 
> This is in preparation to a future change that removes CXL range
> dependency on the CXL memory region, with the goal of allowing
> pc_pci_hole64_start() to be called before any memory region are
> initialized.
> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 216e38da938e..1f42f194d7b7 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -825,6 +825,25 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>  }
>  
> +static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
> +{
> +    uint64_t start = 0;
> +
> +    if (pcms->cxl_devices_state.host_mr.addr) {
> +        start = pcms->cxl_devices_state.host_mr.addr +
> +            memory_region_size(&pcms->cxl_devices_state.host_mr);
> +        if (pcms->cxl_devices_state.fixed_windows) {
> +            GList *it;
> +            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +                CXLFixedWindow *fw = it->data;
> +                start = fw->mr.addr + memory_region_size(&fw->mr);
> +            }
> +        }
> +    }
> +
> +    return start;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -1022,16 +1041,8 @@ uint64_t pc_pci_hole64_start(void)
>      MachineState *ms = MACHINE(pcms);
>      uint64_t hole64_start = 0;
>  
> -    if (pcms->cxl_devices_state.host_mr.addr) {
> -        hole64_start = pcms->cxl_devices_state.host_mr.addr +
> -            memory_region_size(&pcms->cxl_devices_state.host_mr);
> -        if (pcms->cxl_devices_state.fixed_windows) {
> -            GList *it;
> -            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> -                CXLFixedWindow *fw = it->data;
> -                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
> -            }
> -        }
> +    if (pcms->cxl_devices_state.is_enabled) {
> +        hole64_start = pc_get_cxl_range_end(pcms);
>      } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
>          hole64_start = ms->device_memory->base;
>          if (!pcmc->broken_reserved_end) {


