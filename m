Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F1514ABC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 15:39:23 +0200 (CEST)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkQq9-0002qF-Qg
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 09:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkQog-000253-G2
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 09:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkQod-0006P1-Fa
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 09:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651239465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7w5LWc5HZq51umHzByp77iPOD2y1aYlnoTrn28ayUs=;
 b=KsrH3zwITZes8qJpgVv4xrOm+Zea+7rLaTLr3He3JjWqsHu2yRcMlz+bM1VGyZubN/ZCvQ
 DOoaKF+ki0a32GpYGtr3izEAdr3srp2JisjDMA1e54j0D2TpBxT9NEb5XiYDt5yD2X6RbR
 Bqju0zfM3tR2iNTycm6bGpHGgnr5M+o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-pt5xNkUFMg2LQYfcxrZn7w-1; Fri, 29 Apr 2022 09:37:44 -0400
X-MC-Unique: pt5xNkUFMg2LQYfcxrZn7w-1
Received: by mail-ej1-f71.google.com with SMTP id
 sg44-20020a170907a42c00b006f3a40146e8so4485724ejc.19
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 06:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:references:subject:in-reply-to
 :content-transfer-encoding;
 bh=f7w5LWc5HZq51umHzByp77iPOD2y1aYlnoTrn28ayUs=;
 b=J/3k8u59WCoSbmysydpYu0owL+B/LpaKFL83Rxq+M6rXSHzmgjAyw9hNZ7kAgIIfT/
 WzqkGahokZhwPJUCJJySVuxYzXOIR5tImoWhcNfMX+lybz4ZzBxMXTYPpIm1RQgp/ADS
 m4W60AaFqnoufLQEPH7LDiFrjLANh4yC3eGTNCIRFe/2DedpYdcw5KsX/I7B1um222ua
 Y5F9+QZp4B6zqrlybHKjyxZKrymUCXe2itDyWs2KubztyD6i1hfLvWl94GSBz0oWkce9
 XxIekIudY7jleIZu8VGgVfRb4nF1cgzZJE00+fqGMAHA6WCcaOsd8hQH8lkJY65xhitq
 LzUQ==
X-Gm-Message-State: AOAM530rjYxfmF6wN39K6TYcyvPLh+Vh93I4l9/QcTfGsNrwO2mD2SxF
 zLaGjHCF3yv2nlOEKcuCd5ECNZL1c3hlTdTB3HXq3myv9CrhXIjIO63+u3rzf+aNGtJrSWw/NFB
 9iPolfvufVkllFFJwaKAbwfvq9H5Te2q3SBuQzxWkNaJeChF4OBGPTq2rviEpZVTHf8w=
X-Received: by 2002:a17:907:7b8c:b0:6f3:a7d8:2609 with SMTP id
 ne12-20020a1709077b8c00b006f3a7d82609mr19756825ejc.53.1651239462966; 
 Fri, 29 Apr 2022 06:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJQsbdDksp4wS633lxFNSVLD+rFm7iDxMC5WAdn+hI8/Ghd/2wJC67+VGZgmI57vmIcMMXyA==
X-Received: by 2002:a17:907:7b8c:b0:6f3:a7d8:2609 with SMTP id
 ne12-20020a1709077b8c00b006f3a7d82609mr19756798ejc.53.1651239462602; 
 Fri, 29 Apr 2022 06:37:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 og31-20020a1709071ddf00b006f3ef214da2sm650997ejc.8.2022.04.29.06.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 06:37:41 -0700 (PDT)
Message-ID: <d6fb8d66-5cae-1365-cd7a-20b73bf37f5d@redhat.com>
Date: Fri, 29 Apr 2022 15:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
References: <20220427113225.112521-1-pbonzini@redhat.com>
 <20220427113225.112521-2-pbonzini@redhat.com>
Subject: Re: [RFC PATCH 1/6] pc: remove -soundhw pcspk
In-Reply-To: <20220427113225.112521-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mkletzan@redhat.com, berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 13:32, Paolo Bonzini wrote:
> The pcspk device is the only user of isa_register_soundhw, and the only
> -soundhw option which does not create a new device (it hacks into the
> PCSpkState by hand).  Remove it, since it was deprecated.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/audio/pcspk.c           | 10 ----------
>   hw/audio/soundhw.c         | 27 ++++-----------------------
>   include/hw/audio/soundhw.h |  3 ---
>   3 files changed, 4 insertions(+), 36 deletions(-)

I'll queue this patch, in the meanwhile feedback on especially 6/6 is 
welcome.

Paolo

> diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
> index dfc7ebca4e..daf92a4ce1 100644
> --- a/hw/audio/pcspk.c
> +++ b/hw/audio/pcspk.c
> @@ -245,18 +245,8 @@ static const TypeInfo pcspk_info = {
>       .class_init     = pcspk_class_initfn,
>   };
>   
> -static int pcspk_audio_init_soundhw(ISABus *bus)
> -{
> -    PCSpkState *s = pcspk_state;
> -
> -    warn_report("'-soundhw pcspk' is deprecated, "
> -                "please set a backend using '-machine pcspk-audiodev=<name>' instead");
> -    return pcspk_audio_init(s);
> -}
> -
>   static void pcspk_register(void)
>   {
>       type_register_static(&pcspk_info);
> -    isa_register_soundhw("pcspk", "PC speaker", pcspk_audio_init_soundhw);
>   }
>   type_init(pcspk_register)
> diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
> index 173b674ff5..f7d94d7dfa 100644
> --- a/hw/audio/soundhw.c
> +++ b/hw/audio/soundhw.c
> @@ -36,26 +36,12 @@ struct soundhw {
>       const char *typename;
>       int enabled;
>       int isa;
> -    union {
> -        int (*init_isa) (ISABus *bus);
> -        int (*init_pci) (PCIBus *bus);
> -    } init;
> +    int (*init_pci) (PCIBus *bus);
>   };
>   
>   static struct soundhw soundhw[9];
>   static int soundhw_count;
>   
> -void isa_register_soundhw(const char *name, const char *descr,
> -                          int (*init_isa)(ISABus *bus))
> -{
> -    assert(soundhw_count < ARRAY_SIZE(soundhw) - 1);
> -    soundhw[soundhw_count].name = name;
> -    soundhw[soundhw_count].descr = descr;
> -    soundhw[soundhw_count].isa = 1;
> -    soundhw[soundhw_count].init.init_isa = init_isa;
> -    soundhw_count++;
> -}
> -
>   void pci_register_soundhw(const char *name, const char *descr,
>                             int (*init_pci)(PCIBus *bus))
>   {
> @@ -63,7 +49,7 @@ void pci_register_soundhw(const char *name, const char *descr,
>       soundhw[soundhw_count].name = name;
>       soundhw[soundhw_count].descr = descr;
>       soundhw[soundhw_count].isa = 0;
> -    soundhw[soundhw_count].init.init_pci = init_pci;
> +    soundhw[soundhw_count].init_pci = init_pci;
>       soundhw_count++;
>   }
>   
> @@ -158,18 +144,13 @@ void soundhw_init(void)
>                   } else {
>                       pci_create_simple(pci_bus, -1, c->typename);
>                   }
> -            } else if (c->isa) {
> -                if (!isa_bus) {
> -                    error_report("ISA bus not available for %s", c->name);
> -                    exit(1);
> -                }
> -                c->init.init_isa(isa_bus);
>               } else {
> +                assert(!c->isa);
>                   if (!pci_bus) {
>                       error_report("PCI bus not available for %s", c->name);
>                       exit(1);
>                   }
> -                c->init.init_pci(pci_bus);
> +                c->init_pci(pci_bus);
>               }
>           }
>       }
> diff --git a/include/hw/audio/soundhw.h b/include/hw/audio/soundhw.h
> index f09a297854..e68685fcda 100644
> --- a/include/hw/audio/soundhw.h
> +++ b/include/hw/audio/soundhw.h
> @@ -1,9 +1,6 @@
>   #ifndef HW_SOUNDHW_H
>   #define HW_SOUNDHW_H
>   
> -void isa_register_soundhw(const char *name, const char *descr,
> -                          int (*init_isa)(ISABus *bus));
> -
>   void pci_register_soundhw(const char *name, const char *descr,
>                             int (*init_pci)(PCIBus *bus));
>   void deprecated_register_soundhw(const char *name, const char *descr,


