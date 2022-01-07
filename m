Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD29F487D86
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:11:25 +0100 (CET)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5uQr-00068L-Di
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:57:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uNc-0002q8-UV
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:54:24 -0500
Received: from [2a00:1450:4864:20::435] (port=36541
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uNQ-0006Qk-5I
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 13:54:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id r10so5118080wrc.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dYBDfftgUsNYbWOuJgD5yryzn7gsmRdbY5L1+f7SCv0=;
 b=gBnszpnZfAVHmLljTtc30gPgM2KKxfHJi+vL9L/HomzzZiV52mHvY7glTsGra+KC69
 UxDHj+X/J0JBK0VsLdM1UlKzD/KYTGr9J8nIwUUE+O1Af9G/wHI6t+UIS3HgwUFJ5ycq
 cAmv9q9gOGN6kteBmBMzuLLqsIWA2L57dwF2u5F/lcrQw6AgKoxiDDaoziCapppOM+6W
 Z5DogQvGhsljUX1OjJt006HDPkVZV1WoisGZzOYNLTP0XIxDhNKWcnSjyOMQ8AP4MRiQ
 ZJYIamU1f87ior1gNkfj66OhMacawiDPvPBP6iZLC5MGyJk0FhCWGArAZ4OuPQrbTjp8
 6h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dYBDfftgUsNYbWOuJgD5yryzn7gsmRdbY5L1+f7SCv0=;
 b=fBQgU3Y6uEGtu9YBJm7rNnDxEWWq6y6YrmoATdJGd4u5AlmSeteJpYtm03ya3c5/v/
 IvrEexVmRPKFA4Nb4ATsYXqGypqOQ8a2O64v4+Z69E1MVMK23+7H6jbeEwxflfzOVv5Z
 mE5yrYqHqi5PpMk+ST1v8nLjU1uv9IYjaxOrCvKLtYQl6Oe0ofnEGaXgSJVDoAwzan2Y
 0TXTQ8vBmexlyM2vOxejjbVuV7FLb+qQ2i+ABYPY0sfIWxYf328nZ/x2s8pFGfRDpboW
 FIKFJSBulvoBc5UXKfPd1OLl/OsXcPn8Cp2YKIVveoF9gZjjGExUFDqYm+QO0SSjHrsg
 FoAg==
X-Gm-Message-State: AOAM531NqYmjXezILXK+U7EL7CRmJvetcnTPJiOcRERuZ0LE14MN3W7a
 gMXLSYqX6wrjEoypQr+O5FY=
X-Google-Smtp-Source: ABdhPJwlpJ9IQy+6Ip6cAVAR6WICC5HpH+qC3fQKHcTUv+TpG+OiB3bg0CsVypzUgz6qBt+h3lcENQ==
X-Received: by 2002:a5d:5849:: with SMTP id i9mr54663697wrf.148.1641581649052; 
 Fri, 07 Jan 2022 10:54:09 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id t6sm3022599wry.84.2022.01.07.10.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 10:54:08 -0800 (PST)
Message-ID: <280cccf6-7d6d-56da-4b5f-ddb4facfed7e@amsat.org>
Date: Fri, 7 Jan 2022 19:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/i386: Add the possibility to disable the 'isapc'
 machine
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220107160713.235918-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220107160713.235918-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 17:07, Thomas Huth wrote:
> We already have a CONFIG_ISAPC switch - but we're not using it yet.
> Add some "#ifdefs" to make it possible to disable this machine now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/i386/pc_piix.c        | 5 ++++-
>  tests/qtest/cdrom-test.c | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1999190276..5147e1ee74 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -357,10 +357,12 @@ static void pc_compat_1_4_fn(MachineState *machine)
>      pc_compat_1_5_fn(machine);
>  }
>  
> +#ifdef CONFIG_ISAPC
>  static void pc_init_isa(MachineState *machine)
>  {
>      pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
>  }
> +#endif
>  
>  #ifdef CONFIG_XEN
>  static void pc_xen_hvm_init_pci(MachineState *machine)
> @@ -916,6 +918,7 @@ void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
>      pci_config_set_revision(bridge_dev->config, pch_rev_id);
>  }
>  
> +#ifdef CONFIG_ISAPC
>  static void isapc_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> @@ -935,7 +938,7 @@ static void isapc_machine_options(MachineClass *m)
>  
>  DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
>                    isapc_machine_options);
> -
> +#endif

Wouldn't it be cleaner to extract the isapc machine to a new C unit
(after renaming/declaring pc_init1 public)? Anyway this is what is
done for Xen, so why not...

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


