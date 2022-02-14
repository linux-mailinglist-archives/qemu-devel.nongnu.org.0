Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599184B54C4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:28:59 +0100 (CET)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdHe-0004SN-G4
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJctU-0001td-H0
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:04:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJctB-0007sV-4Z
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644851016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8bLoOcm/BnpVQ1UZ86lpP1bL/JbPzWi75mpbMgogmE=;
 b=cqAeiJ9cKbMPJ2WsP5EgeRXUl9IW4CtOj2zmQnCL+lsaKfZTMQ5Gr9I1OTW7z2Ted24zSB
 uFizUBcrNbNlhgUkSyIYMSkxoMIApPgMwJSo/WuJs0azt28SZ66mGSxvmvZgKg3dXuhyWS
 jzJSsNl8lE8fNFhBO+sW2YF/OXnBHhs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-krejFXf5PZqAqNoDlTOaZQ-1; Mon, 14 Feb 2022 10:03:35 -0500
X-MC-Unique: krejFXf5PZqAqNoDlTOaZQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 z8-20020a05640240c800b0041003c827edso8772018edb.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 07:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w8bLoOcm/BnpVQ1UZ86lpP1bL/JbPzWi75mpbMgogmE=;
 b=a4qgqs6ZLuAc14likvDKC6zHzaCDz1EiCpZfXs2Sen1k/QkL27esWPszrhcPKYAyqO
 ew0DszcXwcAfiraYbuBuy4j0zPYolWcpXnZhSLc+VrjWRE4TsxHtQcVr5apddcYfTfkj
 Nx+kppB9N+tsyJqUHduzPuBhHDtTFWH8NCMrgGz68bO1/nUwS+bH4M5x9bxtid1QP/ty
 8WT7G2UT2+T1JMGmdH/4SHX5HcAttP7p5IN+z9zmzD7DyQkSirH+H4p7UN+8IzRxo0Dx
 4IWMyAbKXVORsDbgskyreP96EWaj/RXsnM8GKgRLsD7Xv6oEuvtNX5vwRithWTgiMpFe
 CXow==
X-Gm-Message-State: AOAM533IoXFwPkKvDgo3h0x1ctGciynAHDd4cz8bciWiOdnfvg00OIvK
 v1UVfoUwR4ESxISt57gUADhesa4AEjLhzR+iyunwXgP+D1kiokiw2h+lGmvK1ALmQlyKIh13yJv
 Kb4tRQRuIFB2XaJs=
X-Received: by 2002:a17:907:a41f:: with SMTP id
 sg31mr11614433ejc.645.1644851009928; 
 Mon, 14 Feb 2022 07:03:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX1Nh1VmI1qAnLG2s5FKvuH4TddUu0lyDJlrJ6D614dWLSPj55uo1uaaAZ37eb2W1NJW1dPw==
X-Received: by 2002:a17:907:a41f:: with SMTP id
 sg31mr11614217ejc.645.1644851007140; 
 Mon, 14 Feb 2022 07:03:27 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s10sm2978559ejm.0.2022.02.14.07.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 07:03:26 -0800 (PST)
Date: Mon, 14 Feb 2022 16:03:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Message-ID: <20220214160325.62b6436d@redhat.com>
In-Reply-To: <20220207202422.31582-4-joao.m.martins@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Mon,  7 Feb 2022 20:24:21 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> ram-above-4g relocation happens and the CPU wasn't configured
> with a big enough phys-bits, warn the user. There isn't a
> catastrophic failure exactly, the guest will still boot, but
> most likely won't be able to use more than ~4G of RAM.

how 'unable to use" would manifest?
It might be better to prevent QEMU startup with broken setup (CLI)
rather then letting guest run and trying to figure out what's
going wrong when users start to complain. 

> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index b060aedd38f3..f8712eb8427e 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -842,6 +842,7 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>      ram_addr_t device_mem_size = 0;
>      uint32_t eax, vendor[3];
> +    hwaddr maxphysaddr;
>  
>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>      if (!IS_AMD_VENDOR(vendor)) {
> @@ -858,6 +859,12 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>          return;
>      }
>  
> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> +    if (maxphysaddr < AMD_ABOVE_1TB_START)
> +        warn_report("Relocated RAM above 4G to start at %lu "
> +                    "phys-bits too low (%u)",
> +                    AMD_ABOVE_1TB_START, X86_CPU(first_cpu)->phys_bits);

perhaps this hunk belongs to the end of pc_memory_init(),
it's not HT fixup specific at all?

Also I'm not sure but there are host_phys_bits/host_phys_bits_limit properties,
perhaps they need to be checked/verified as well

>      x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
>  }
>  


