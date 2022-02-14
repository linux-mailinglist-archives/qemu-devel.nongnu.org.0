Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE544B5563
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:54:51 +0100 (CET)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdgf-0002K1-Ts
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:54:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJdTv-0007yZ-Te
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJdTq-0006Xv-9j
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644853291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsd/w+NjQuZtehgLFP9X8LWPcfZjYs5YTnQs2xyX7i4=;
 b=dhpW+O+s2wdE0jAx1x8s4ImB57aIZRfUId3SQU9KRkioR/jYxxJy6RvNsaVFd+o/4aSSfC
 Nq29mwP4JrwgA3Jga8CSUDShPlphtcaNDVH3xjHzM+LvuN6ILJDg6DU/Z1JdodcMGV7IzM
 tUqmAJWHkTF+OvJhvZX56yll8CdONcU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-TQWMZPM2OMuUr6jBS0v2sg-1; Mon, 14 Feb 2022 10:41:30 -0500
X-MC-Unique: TQWMZPM2OMuUr6jBS0v2sg-1
Received: by mail-ed1-f72.google.com with SMTP id
 g5-20020a056402090500b0040f28e1da47so10521409edz.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 07:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hsd/w+NjQuZtehgLFP9X8LWPcfZjYs5YTnQs2xyX7i4=;
 b=btD3n76JwAr9OCjasDDWVxFruIH2Irls0ZT7VJw7EosrxM0GSSWWgmD3M58i64IjLv
 I9RzoWaUh+Gq83vrDNIPmui9G32AG3br4mgDSUbS88+EHP19N/qbRVj+rxIn1iDrXP4G
 UCx1of+zwnK5IF1jWplFGNp4VLjEkJaw+PkJBxhNRGlxb5nJeJySpJUWnNUvSYTGCzoq
 2630z9oNb6rHo3efqkZ0Ge7JJnqRNWgBB4sXsCgtzVQ1XRAkMRtnHGDDemPLZ4KRHEpw
 WsK+oreD/M+WCiAImq009CbpXT1dBI8mn9glPPPq3Lg18QH8IPA5NgWj2nxyobxR+FeC
 DaIg==
X-Gm-Message-State: AOAM5333hlfyqaCEXKCyuCHvsTUngNPXPjd5uDRHROjM3FAdw7UX2ZvE
 +cv7Wp/Sy3vWwu6KeSPRgYLhHtyoMan57lm5AMKcV5yp4TebRSGkX4QF2eGO/SmNBd4w6Ft592J
 fiSRskr52v3JU8QE=
X-Received: by 2002:a17:906:dc8c:: with SMTP id
 cs12mr113455ejc.215.1644853289397; 
 Mon, 14 Feb 2022 07:41:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYLnLTXZO/YtZJMlYyWVSVsGoTLs6N8i7NlIrnUxolaOqhWOkF6lxdVilXeD+uxCgvg6TR8A==
X-Received: by 2002:a17:906:dc8c:: with SMTP id
 cs12mr113424ejc.215.1644853289060; 
 Mon, 14 Feb 2022 07:41:29 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id i18sm7189174ejy.190.2022.02.14.07.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 07:41:28 -0800 (PST)
Date: Mon, 14 Feb 2022 16:41:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Message-ID: <20220214164127.49a08ce1@redhat.com>
In-Reply-To: <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
 <20220214160325.62b6436d@redhat.com>
 <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 15:18:43 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 2/14/22 15:03, Igor Mammedov wrote:
> > On Mon,  7 Feb 2022 20:24:21 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
> >> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> >> ram-above-4g relocation happens and the CPU wasn't configured
> >> with a big enough phys-bits, warn the user. There isn't a
> >> catastrophic failure exactly, the guest will still boot, but
> >> most likely won't be able to use more than ~4G of RAM.  
> > 
> > how 'unable to use" would manifest?
> > It might be better to prevent QEMU startup with broken setup (CLI)
> > rather then letting guest run and trying to figure out what's
> > going wrong when users start to complain. 
> >   
> Sounds better to be conservative here.
> 
> I will change from warn_report() to error_report()
> and exit.
> 
> >>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  hw/i386/pc.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index b060aedd38f3..f8712eb8427e 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -842,6 +842,7 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
> >>      X86MachineState *x86ms = X86_MACHINE(pcms);
> >>      ram_addr_t device_mem_size = 0;
> >>      uint32_t eax, vendor[3];
> >> +    hwaddr maxphysaddr;
> >>  
> >>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>      if (!IS_AMD_VENDOR(vendor)) {
> >> @@ -858,6 +859,12 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
> >>          return;
> >>      }
> >>  
> >> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> >> +    if (maxphysaddr < AMD_ABOVE_1TB_START)
> >> +        warn_report("Relocated RAM above 4G to start at %lu "
> >> +                    "phys-bits too low (%u)",
> >> +                    AMD_ABOVE_1TB_START, X86_CPU(first_cpu)->phys_bits);  
> > 
> > perhaps this hunk belongs to the end of pc_memory_init(),
> > it's not HT fixup specific at all?
> >   
> It is HT fixup related. Because we are relocating the whole above-4g-ram,
> on what used to be enough with just 40 phys bits (default).

what if user starts QEMU with amount of RAM that won't fit into
configured phys bits (whether it's default one or one that comes from host)
and not on AMD host at that so no relocation happens but we still have
broken configuration. What matters here is the end address that might
be used by guest (pci64_bit hole end) is reachable.

That's why I suggested to make it generic check instead of AMD specific one. 
 
> > Also I'm not sure but there are host_phys_bits/host_phys_bits_limit properties,
> > perhaps they need to be checked/verified as well  
> 
> When booted with +host-phys-bits and/or with a host-phys-bits-limit=X, the @phys_bits
> value will be either set to host, and ultimately bound to a maximum of
> host_phys_bits_limit (if at all set).
> 
> So essentially the selected phys_bits that we're checking above is the only thing
> we need to care about IIUC.
> 


