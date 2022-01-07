Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A57487B88
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:39:10 +0100 (CET)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tCn-0008UC-Bp
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:39:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5t2J-0006NP-RM
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:28:20 -0500
Received: from [2a00:1450:4864:20::52a] (port=33344
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5t2E-0000Ln-0t
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:28:19 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m21so24971867edc.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bbV3VrpUKkBj5EuDsPvigSeYAPe/cdU7ftbWEpcua4U=;
 b=Gw98SCUtPS1QQEjXvlwW/zEJpkNOMxaebO0um/2k91nGwW8Brzm3JeFfo/aSISw+xQ
 9ovgCrIStUmFdcyGEMhoL2aRfQ3XVM7K8aXLEVMtQp366HcLxj/J0VVOddzaYatIRFY6
 vOnQob8rYC0sfrsqgeIHOQg/mO6Ej3l/+rF1eM2gsF0uPszQk585xm07F6dS4fUDU/C9
 IGqgL2JN7XXAGjLuEvNiZnZ0QnV3JbhKrtVYgTzMVAdkEUOovdHkTayKwr6uOuUyBKxy
 zVC5dTunUa0aqkh8c6wtyiLH2GVTJ9r1X4eFCk/Yw4O+/uV1A2gTv73T1/1yFlT1hoTF
 zyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bbV3VrpUKkBj5EuDsPvigSeYAPe/cdU7ftbWEpcua4U=;
 b=L6QIQSKtSxi8WNdZRKMjyhTNZFfPKhji7bepeHgVLnMhnyZqaDr9PulL9m6/hNRqiM
 rsiB0X/Lr9fJxzR5/8aINhZt3+wGdJSEtOVct8aTaFIKxQZbRzryzywjCCv6HdHgyfXn
 k8c2KrHaRH2J9uXjil31Q7GIPFDkizNdNxXxrg1u/tnHs+mheRM3n5XCBVOEfQ3YZpWJ
 CxhEP6cauhoWt+OjTMHI3EcbQaOcnIFrF7NYANRJ2zigfn7Q1TEiOJZpjBHY3bXNwUfz
 W6n29xRlrUgUhoCJF2tVh0oIK/U+7i71sGLjHht1jCRP9cASJTfj9S611F9NLkaTn2G7
 rzZQ==
X-Gm-Message-State: AOAM5330bo73318oHfuXFFGOeKS3TIwszAWQpv7wr3RyGdpruZujHDYe
 eSk1oQJ+s8BQBJSEfTbRmF0=
X-Google-Smtp-Source: ABdhPJy8mGJJnYEhAzZ4wUja0tkokBtTPp4NYuUEDQ/BPV5DAX96gCWXqLTqKmrrJabUOY7gB+Zh8Q==
X-Received: by 2002:a05:6402:4312:: with SMTP id
 m18mr56923866edc.354.1641576492616; 
 Fri, 07 Jan 2022 09:28:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id da26sm2305528edb.26.2022.01.07.09.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 09:28:12 -0800 (PST)
Message-ID: <0452d24b-c14f-14d9-f145-2013a3be72d6@redhat.com>
Date: Fri, 7 Jan 2022 18:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/i386: Add the possibility to disable the 'isapc'
 machine
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220107160713.235918-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220107160713.235918-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
>   hw/i386/pc_piix.c        | 5 ++++-
>   tests/qtest/cdrom-test.c | 2 +-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1999190276..5147e1ee74 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -357,10 +357,12 @@ static void pc_compat_1_4_fn(MachineState *machine)
>       pc_compat_1_5_fn(machine);
>   }
>   
> +#ifdef CONFIG_ISAPC
>   static void pc_init_isa(MachineState *machine)
>   {
>       pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
>   }
> +#endif
>   
>   #ifdef CONFIG_XEN
>   static void pc_xen_hvm_init_pci(MachineState *machine)
> @@ -916,6 +918,7 @@ void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
>       pci_config_set_revision(bridge_dev->config, pch_rev_id);
>   }
>   
> +#ifdef CONFIG_ISAPC
>   static void isapc_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> @@ -935,7 +938,7 @@ static void isapc_machine_options(MachineClass *m)
>   
>   DEFINE_PC_MACHINE(isapc, "isapc", pc_init_isa,
>                     isapc_machine_options);
> -
> +#endif
>   
>   #ifdef CONFIG_XEN
>   static void xenfv_4_2_machine_options(MachineClass *m)
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index cfca24fa94..fdd889a487 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -138,7 +138,7 @@ static void add_x86_tests(void)
>        * Unstable CI test under load
>        * See https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05509.html
>        */
> -    if (g_test_slow()) {
> +    if (g_test_slow() && qtest_has_machine("isapc")) {
>           qtest_add_data_func("cdrom/boot/isapc", "-M isapc "
>                               "-drive if=ide,media=cdrom,file=", test_cdboot);
>       }

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

