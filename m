Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCC652492
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 17:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7fLZ-0000UG-Eu; Tue, 20 Dec 2022 11:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7fLU-0000Sz-31
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:20:01 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p7fLS-0003DP-4E
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:19:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id h16so12195490wrz.12
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XMNMenn2MnY0TWdn9v9K6JUbE6GUmWFj6LU6GgXbTrY=;
 b=b3JBd4jDl69glgL5OStP/WEAaqDLLGP2D5/e/QsqCxtvuJlAJHTCUZGG9MPX9thihD
 oxK+ZGRAVUZSXrbunkZDTzivdXALqHs5mEA3VMlrE+5qXgGokPo6LdkdV6FPlhPXALwF
 KC1ySlTS3Oxg9dUHoiVysw738ZPwzeIxLz6dn4c/k0S435qwQ2pBupUlp3xECoC7EiAm
 xvWTDDcRXQqHfrMzIU+Ml/1GRAuEwyPPKvVFGMVxUXASy8IEJncjHB5O5LhbVYUZ72nF
 aOYloSPU3Z6J3rjxLgW0aJ6rM0+6lo8J3T942/jo/YU3ezPyhbTb9BAhvZhWCcFlqmSG
 t/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMNMenn2MnY0TWdn9v9K6JUbE6GUmWFj6LU6GgXbTrY=;
 b=0/ewPpqQL7lks7ueXmeBsZ+rnps578tPwLhBhfwohbl9Hkh2Vue6UwVOwMK02Ufx4e
 ab83oKG4zU+CYpPSPFCVGQp6CKbHF2F2NQJs4SIiLtpEdlyX5gHp/yEZFK9gsW8QWigw
 cAVlqzzC1QTuV2SEPbhDIHD5zTZs5bAruqUl1L2okDO+P1J0EnDqaItWCQiRtZKH0tYF
 Qhwv/gRNzVx6709bwiPrwLJT46rKkyLzYLeERaYRmsdZRbtlEspjvZGlODqa0U9lt0dC
 6/dwYQzzZjSdyzeMDYpCkP9OiRoBp+WhdXa9DkobPc0+mysXLlpgo6fbO6Tc6Ej8cLNN
 iLaQ==
X-Gm-Message-State: AFqh2koReklPpdUboiJJsUxVcspNIV1d3BdNhto6KL3J5uolE4aLR6Ay
 UpERjLSQjLri2zFHOe0SGDY=
X-Google-Smtp-Source: AMrXdXv/Mtt3+eZJX9SddpnOA8jQ9bE9HpPsaZRvTkDjZw0EO1XnTiK78m88V/1cDVJbOaMo+0Dgvg==
X-Received: by 2002:a5d:6ac5:0:b0:24d:867f:10e6 with SMTP id
 u5-20020a5d6ac5000000b0024d867f10e6mr11287377wrw.32.1671553196333; 
 Tue, 20 Dec 2022 08:19:56 -0800 (PST)
Received: from [192.168.6.89] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056000124900b002422bc69111sm15546171wrx.9.2022.12.20.08.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 08:19:56 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6e5ab37f-4797-70f1-7e49-d1699af2a425@xen.org>
Date: Tue, 20 Dec 2022 16:19:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH v3 07/38] xen-platform: allow its creation with
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-8-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221216004117.862106-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.161, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/2022 00:40, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> The only thing we need to handle on KVM side is to change the
> pfn from R/W to R/O.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index a6f0fb478a..15d5ae7c69 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -283,7 +283,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
>       case 0: /* Platform flags */ {
>           hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
>               HVMMEM_ram_ro : HVMMEM_ram_rw;
> -        if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
> +        if (xen_mode == XEN_EMULATE) {
> +            /* XXX */

???

Paul

> +            s->flags = val & PFFLAG_ROM_LOCK;
> +        } else if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
>               DPRINTF("unable to change ro/rw state of ROM memory area!\n");
>           } else {
>               s->flags = val & PFFLAG_ROM_LOCK;
> @@ -508,12 +511,6 @@ static void xen_platform_realize(PCIDevice *dev, Error **errp)
>       PCIXenPlatformState *d = XEN_PLATFORM(dev);
>       uint8_t *pci_conf;
>   
> -    /* Device will crash on reset if xen is not initialized */
> -    if (!xen_enabled()) {
> -        error_setg(errp, "xen-platform device requires the Xen accelerator");
> -        return;
> -    }
> -
>       pci_conf = dev->config;
>   
>       pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY);


