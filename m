Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E494D469739
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:35:57 +0100 (CET)
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muE9s-0000g6-6s
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:35:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDzh-0006t2-MZ; Mon, 06 Dec 2021 08:25:26 -0500
Received: from [2a00:1450:4864:20::335] (port=52800
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDzg-000454-7f; Mon, 06 Dec 2021 08:25:25 -0500
Received: by mail-wm1-x335.google.com with SMTP id o29so8126857wms.2;
 Mon, 06 Dec 2021 05:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HZiMdWb+VSAjW9ypa/1udXIVwttK0qClm01zzqCL6kw=;
 b=d8+NC6MEExceyFqczUhE/KKQbZ99bpte9PmkOG5rgl1XjwtB41vPxqJuJSFwrL1x1U
 dxp5hIrQH67JNZb9kBmvSoi3XsgiE5gklTBgfgcHI1VGlIBy0JLuVSfhdJs12w6owBbQ
 PWbItPj7VGAnBzVz6OODo6BzEv3QVfeDxzoDx5/hRIW4mG82d+2NKojg45hpq5C09eF2
 5u6ieDXBzUHlMhTkkva9gwPx0yLwLGMzuJnlgtHOsl6LH69cXHRSDSB12UoP6uYVW2V1
 6ThPAID3GF+abQJ1kP3z/uE/YpjmbJYcMWT1LP1VDelS1vsWRPtxchl9lp4p1BIsNDYQ
 AArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HZiMdWb+VSAjW9ypa/1udXIVwttK0qClm01zzqCL6kw=;
 b=YVrbk7c0xQiSlHFSB8CcKAhtpeEzHlO51fvYOKw62XhcyTvMthQrOflOIM5fqkaloT
 BMehfqUrUSo86DlqXDJCHDs1tbO72PK5NHgLOxkw2hLU9Ws0HTS9JXVs1ng5nryfa9GH
 kfRb4xBfTfge9GshDEojZdlV5wcPh1qxIJpgX+dgWjtjomANRcO5t0qvr4G8VpWScMZb
 Y2fixv5M94A3QoKnN/0mMHrMCIFER2OH2897TEOz0MfOQ5DWXR+pr3p8AtJTs57Hwec0
 TEDoqFUD5PecYp9LCgGoPIzCpf0/IBsCpBs0wqtSreSDLOoe1ppiMx8LHRAqyCycQBvx
 c8Vw==
X-Gm-Message-State: AOAM531p/uxXXcJsuGeiBed9BkQzk73htfzOby5jW2Km+I3y1KM/HyVB
 luKx3pkm+nrUbYty4cpEeSY=
X-Google-Smtp-Source: ABdhPJz//yM8e0uhmmkqGPtweFPzXGLQaJ3ysYTSKOh1dA9S9El/6P51Ll0Lavbf4Ld6KeomzkidCg==
X-Received: by 2002:a1c:7e04:: with SMTP id z4mr39034423wmc.134.1638797121667; 
 Mon, 06 Dec 2021 05:25:21 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id o1sm11641151wrn.63.2021.12.06.05.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:25:20 -0800 (PST)
Message-ID: <92f3b2cf-236a-d379-a2ef-9ace228783c9@amsat.org>
Date: Mon, 6 Dec 2021 14:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 13/15] ppc/ppc405: Fix bi_pci_enetaddr2 field in U-Boot
 board information
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-14-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206103712.1866296-14-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:37, Cédric Le Goater wrote:
> The board information for the 405EP first appeared in commit 04f20795ac81
> ("Move PowerPC 405 specific definitions into a separate file ...")
> An Ethernet address is a 6 byte number. Fix that.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/ppc405.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index 6fb8b41bbc77..83f156f585c8 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -57,7 +57,7 @@ struct ppc4xx_bd_info_t {
>      uint32_t bi_plb_busfreq;
>      uint32_t bi_pci_busfreq;
>      uint8_t  bi_pci_enetaddr[6];
> -    uint32_t bi_pci_enetaddr2[6];
> +    uint8_t  bi_pci_enetaddr2[6]; /* PPC405EP specific */

Also eventually 6 -> ETH_ALEN from "net/net.h".

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      uint32_t bi_opbfreq;
>      uint32_t bi_iic_fast[2];
>  };
> 


