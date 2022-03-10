Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E644D50A3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:34:58 +0100 (CET)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMgi-0007fK-O8
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:34:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSMeI-0005ed-5C
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:32:28 -0500
Received: from [2607:f8b0:4864:20::52f] (port=33765
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSMeG-0005oA-J4
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:32:25 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 6so5335486pgg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=L9LugZ0UPWbfG0XPptpV4TuKIT+1N5KdG71bQT6atwQ=;
 b=MYxNy2VSllwgWN9f7MPG/aobd8hboI4aIFe4pW0f1Fz8x5be5sVJGNArL2iBX3898S
 8anw3k4Xmz5WP/1HNiMhxYlf8TXBeeZDypC5RNgHZzBH21nuSM6zPjZIxoDe/jxPra/v
 A/ctkISp/xE4o9oSDmq+oQTkU3SalsN1MMIBMFaOn5ANumROcbgpBhExv+fDRblcbDbs
 vrMRTVPFHYC/5wDvy/CEacy6AwMmr9ASu+bPp9lhTCAZdM3Btsh4s5dAJ56yUO/C317E
 yDz8TMvY1LctMa4l6I5PR43gQ7O3DjrqmRSNW5FBd5vF+ENaBpSnFCPZvaMFa7U7Y1kH
 BrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L9LugZ0UPWbfG0XPptpV4TuKIT+1N5KdG71bQT6atwQ=;
 b=i4mOZ90c1sbaPdSf5DCEG5epZ3vS8ghooaQZMu+rC3g49CgcRchk6pIHoNabnM426X
 PDLjxiDqhy7hwORLeurzDnCjFocm4R1Z+LV4M5CWnnZj+0toumqUmXIweYucYYvwqeOY
 knWvR4xFTCOqjqhtEaZxNSXGoXhoypCVzrAzCLJPpx0jiRZEHNO4JpsOY+XP2anzt9sb
 XieU2mORsPHccG6/RJ4UUWW9QKAgarjthNLAs/ft/gDeErpOFwaNLZ3tcEBfu7zuzxcs
 PgOkmP1ay6kujk8RIsXQfLIUjBGu5Q6UcVIT566JPBwaagFBpvuBcvqepj8tMB8nRLC+
 /XiQ==
X-Gm-Message-State: AOAM533rv1vkkC0fy/XgZJ8rrV5dmdmKbxPDQ0US0wcN2/vad9qiog04
 SnDSUiOv6GqTKQ1jRsctR4Q=
X-Google-Smtp-Source: ABdhPJw6HeoSVHs7CVchf+w0ibAZGWwKDVog2RqqSBGn/umZ+WBBoVk8wxsB/OeH34DFVDNEsn5IAQ==
X-Received: by 2002:a63:904c:0:b0:37f:fd5c:82dc with SMTP id
 a73-20020a63904c000000b0037ffd5c82dcmr4979637pge.79.1646933543038; 
 Thu, 10 Mar 2022 09:32:23 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 s16-20020a63ff50000000b003650ee901e1sm6187906pgk.68.2022.03.10.09.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 09:32:22 -0800 (PST)
Message-ID: <df5f5cda-c5e0-2a81-71be-f1e29c64ef35@gmail.com>
Date: Thu, 10 Mar 2022 18:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH-for-7.0] tulip: Assign default MAC address if not specified
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <YiotlroslM5hcR04@p100>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YiotlroslM5hcR04@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 17:55, Helge Deller wrote:
> The MAC of the tulip card is stored in the EEPROM and at startup
> tulip_fill_eeprom() is called to initialize the EEPROM with the MAC
> address given on the command line, e.g.:
>      -device tulip,mac=00:11:22:33:44:55
> 
> In case the mac address was not given on the command line,
> tulip_fill_eeprom() initializes the MAC in EEPROM with 00:00:00:00:00:00
> which breaks e.g. a HP-UX guest.
> 
> Fix this problem by moving qemu_macaddr_default_if_unset() a few lines
> up, so that a default mac address is assigned before tulip_fill_eeprom()
> initializes the EEPROM.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index d5b6cc5ee6..097e905bec 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -967,6 +967,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
>       pci_conf = s->dev.config;
>       pci_conf[PCI_INTERRUPT_PIN] = 1; /* interrupt pin A */
> 
> +    qemu_macaddr_default_if_unset(&s->c.macaddr);
> +
>       s->eeprom = eeprom93xx_new(&pci_dev->qdev, 64);
>       tulip_fill_eeprom(s);
> 
> @@ -981,8 +983,6 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
> 
>       s->irq = pci_allocate_irq(&s->dev);
> 
> -    qemu_macaddr_default_if_unset(&s->c.macaddr);
> -
>       s->nic = qemu_new_nic(&net_tulip_info, &s->c,
>                             object_get_typename(OBJECT(pci_dev)),
>                             pci_dev->qdev.id, s);
> 


