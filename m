Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2618FAF70E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:40:45 +0200 (CEST)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7xF6-0003C6-81
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1i7xBz-00087a-6p
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1i7xBw-0002Na-SD
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:37:30 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40937)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1i7xBw-0002Mk-AX
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:37:28 -0400
Received: by mail-pf1-x442.google.com with SMTP id x127so13116675pfb.7
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RqzwvCDKWHB9wabOiS4DteFPIFeeSFV4KEfUxJp5l9A=;
 b=Ey6ws2p5+r0T6jEBxmjRr8aGvFimQd6ApTujnXqLwf6KfzQiRjXP6KOc9z2Ec+kFF6
 8y6qPvoy5u+MdZXBvEFeKI5VIZBydeufediNvo/xco4ptcBJ3X0B1UiMmL+7N7t/mC2C
 zJWBqbPPu5WiGTLpeIRBAjtk71/Tj5p/P5cBuzf1JypKm8nQC5OjTx9hFPEmJdJAihYf
 pxt/tFBh8eF87r4wswDImjWS6S70UGU+0buNyMQQp8M2JmXSVAosVV57ZOwtV6auiJEs
 M7nYjusYo9xyT4duoz8CO4DuhAwkc9XLhv8OTaXCQ6xZm5yuSK6hEJ1O7KpClWs+owL3
 fQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RqzwvCDKWHB9wabOiS4DteFPIFeeSFV4KEfUxJp5l9A=;
 b=Vp0FRczPy9BZGdVuRrjqgISHGTDS7GQ5Hy43ZOL4VmwPcSRgePZH49UqFk3hDtA3z+
 Xcql1QVX2xClAsQHXKnfcO8Hb2xuCYqpjA+DWgF2vr0/aOcLHm2zl6iuH1szxmyfCzc1
 VMXfTqRSz21yOoeDzNMdAruv+QtSlvD0x9ycDjHmYFjVML1iD+S97UL2OV+6DbAl0a1X
 22+VUw1vo9Fg65z5quD76z7xKMcHxmTGjSqovm+xh0SYApzUpA+mzj1/VW7ggLUV+Ehd
 vvxSXjeSLefI3qXhRpkn+Bcp+SdaRBI1L0DQmxCIOpFAmPX2RtyIVNF0RzR14M/ss4m8
 AORA==
X-Gm-Message-State: APjAAAUagIQb+0evDZdDxelL3wrA5zhdK8pvfChiIj7GwImImXV8garg
 VSC78dCzi5LHlbOUMmAchSjJ0g==
X-Google-Smtp-Source: APXvYqye/QwVkPIGZydNIwfgHjFnj+eFfGgWvkITofnotXpGnJUdR4H1gTVQl9GbCZHaBv52ebfDyg==
X-Received: by 2002:a62:3083:: with SMTP id
 w125mr41099037pfw.102.1568187446676; 
 Wed, 11 Sep 2019 00:37:26 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y17sm8184884pfo.171.2019.09.11.00.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2019 00:37:26 -0700 (PDT)
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20190911040452.8341-1-david@gibson.dropbear.id.au>
 <20190911040452.8341-2-david@gibson.dropbear.id.au>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <2b44fdd2-a3d6-0973-7c4b-977fdcd1e936@ozlabs.ru>
Date: Wed, 11 Sep 2019 17:37:20 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190911040452.8341-2-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH 1/7] spapr: Simplify handling of pre ISA
 3.0 guest workaround handling
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
Cc: lvivier@redhat.com, philmd@redhat.com, groug@kaod.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/09/2019 14:04, David Gibson wrote:
> Certain old guest versions don't understand the radix MMU introduced with
> POWER ISA 3.0, but incorrectly select it if presented with the option at
> CAS time.  We workaround this in qemu by explicitly excluding the radix
> (and other ISA 3.0 linked) options if the guest doesn't explicitly note
> support for ISA 3.0.
> 
> This is handled by the 'cas_legacy_guest_workaround' flag, which is pretty
> vague.  Rename it to 'cas_pre_isa3_guest' to be clearer about what it's for.
> 
> In addition, we unnecessarily call spapr_populate_pa_features() with
> different options when initially constructing the device tree and when
> adjusting it at CAS time.  At the initial construct time cas_pre_isa3_guest
> is already false, so we can still use the flag, rather than explicitly
> overriding it to be false at the callsite.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>




> ---
>  hw/ppc/spapr.c         | 10 ++++------
>  hw/ppc/spapr_hcall.c   |  3 +--
>  include/hw/ppc/spapr.h |  2 +-
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 7124053b43..c551001f86 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -218,8 +218,7 @@ static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, PowerPCCPU *cpu)
>  /* Populate the "ibm,pa-features" property */
>  static void spapr_populate_pa_features(SpaprMachineState *spapr,
>                                         PowerPCCPU *cpu,
> -                                       void *fdt, int offset,
> -                                       bool legacy_guest)
> +                                       void *fdt, int offset)
>  {
>      uint8_t pa_features_206[] = { 6, 0,
>          0xf6, 0x1f, 0xc7, 0x00, 0x80, 0xc0 };
> @@ -285,7 +284,7 @@ static void spapr_populate_pa_features(SpaprMachineState *spapr,
>      if ((spapr_get_cap(spapr, SPAPR_CAP_HTM) != 0) && pa_size > 24) {
>          pa_features[24] |= 0x80;    /* Transactional memory support */
>      }
> -    if (legacy_guest && pa_size > 40) {
> +    if (spapr->cas_pre_isa3_guest && pa_size > 40) {
>          /* Workaround for broken kernels that attempt (guest) radix
>           * mode when they can't handle it, if they see the radix bit set
>           * in pa-features. So hide it from them. */
> @@ -348,8 +347,7 @@ static int spapr_fixup_cpu_dt(void *fdt, SpaprMachineState *spapr)
>              return ret;
>          }
>  
> -        spapr_populate_pa_features(spapr, cpu, fdt, offset,
> -                                   spapr->cas_legacy_guest_workaround);
> +        spapr_populate_pa_features(spapr, cpu, fdt, offset);
>      }
>      return ret;
>  }
> @@ -551,7 +549,7 @@ static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
>                            page_sizes_prop, page_sizes_prop_size)));
>      }
>  
> -    spapr_populate_pa_features(spapr, cpu, fdt, offset, false);
> +    spapr_populate_pa_features(spapr, cpu, fdt, offset);
>  
>      _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
>                             cs->cpu_index / vcpus_per_socket)));
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 23e4bdb829..3d3a67149a 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1765,8 +1765,7 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
>              exit(EXIT_FAILURE);
>          }
>      }
> -    spapr->cas_legacy_guest_workaround = !spapr_ovec_test(ov1_guest,
> -                                                          OV1_PPC_3_00);
> +    spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
>      spapr_ovec_cleanup(ov1_guest);
>      if (!spapr->cas_reboot) {
>          /* If spapr_machine_reset() did not set up a HPT but one is necessary
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 03111fd55b..dfec8e8e76 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -175,7 +175,7 @@ struct SpaprMachineState {
>  
>      /* ibm,client-architecture-support option negotiation */
>      bool cas_reboot;
> -    bool cas_legacy_guest_workaround;
> +    bool cas_pre_isa3_guest;
>      SpaprOptionVector *ov5;         /* QEMU-supported option vectors */
>      SpaprOptionVector *ov5_cas;     /* negotiated (via CAS) option vectors */
>      uint32_t max_compat_pvr;
> 

-- 
Alexey

