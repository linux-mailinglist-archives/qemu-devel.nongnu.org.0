Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB394EFA81
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 21:43:52 +0200 (CEST)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naNBX-0001Jy-0g
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 15:43:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1naNAW-0000KJ-Mj; Fri, 01 Apr 2022 15:42:48 -0400
Received: from [2001:4860:4864:20::2c] (port=32889
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1naNAV-0005zQ-A3; Fri, 01 Apr 2022 15:42:48 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso3878674fac.0; 
 Fri, 01 Apr 2022 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5Iazfub6mCy9gMN67xajKqmdw9PA0aCDXX9F/Ya6Kwk=;
 b=oa4OGw9Bn5cNtGYjO06AgZa8QXUNA76HvkCYucRIS1oMDMYptqcQalAuxqrfEDecjy
 gzJHBNMKWuHSAqLjbPlzu7NpeR5IVxpO8UU0p7i+JPxKD6yI4rWYaSyaqRhU3/KGa7TO
 y78LF1dCg306WIv1KlHBuODmieYhDalrhWTASTbt/udJr1geiQ7pYX/NWOj6h+SCR2gQ
 i7KZ43Btc8sKrs68i3TsF6+z5ARqRwuod1mNsqkc9ZP9s1XlovkHUMpZh/Z/YODdoRvp
 zhuaqpOI9bwWH1Mi1Ma2WasSKLZv1du5vh1zSviB6bhzCkUvENoEJNOxU9I/EN/cjEL6
 3sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Iazfub6mCy9gMN67xajKqmdw9PA0aCDXX9F/Ya6Kwk=;
 b=IGXkhbYGNRdjbK5f5scv8Q98f5a3/w3m0hG5DwyJ1zbsRL2uiF2gCLl6q2hUiD74Fv
 +djdsKVJMTNHc7cTQeTmXT697KeiMUYTNJY9NUD+42NIwalCQ5qW0A1CGYKsHzx6U+vy
 kH6zCj21haD1VXguFNIiifRyZ5aMwyJXbjkfAuYNvSk1smNZIUJSUhcezGhyLf7Vc35i
 y1kAEB5OfdjVaSSqEgpTLtSaLoL3r98qv4zBOCu4/PsPf6Pk5u1gox4I/Jq+QuD/qLPH
 xjFWuZ6+ldevx+a14SBRPyUtf+tFtYF2h3HogX5599aCm4JaK1s57iVQh2/yXSLCezfK
 gc+g==
X-Gm-Message-State: AOAM532NnGmTVOh9Xx3whwK+YEklNYrXbzePaLeNhQD74+pidsGhjZiT
 +6N0FmKLaffylMF3gBnB6aeYcLkxvQo=
X-Google-Smtp-Source: ABdhPJx0ic9WhTkBOPh4PMYqQtmf5uGj7OeDAqQdW4ep1y/5skbB/HRa2JM46Rg9rqoQnd6ToGXxjQ==
X-Received: by 2002:a05:6870:d29e:b0:de:2438:7a04 with SMTP id
 d30-20020a056870d29e00b000de24387a04mr5884532oae.139.1648842165415; 
 Fri, 01 Apr 2022 12:42:45 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:abe8:ed:2c78:ab0c:7946?
 ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05687036c700b000da4bcdae42sm1376069oak.13.2022.04.01.12.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 12:42:45 -0700 (PDT)
Message-ID: <8a872e1e-e0c2-830a-df7b-b20d8ce71d2f@gmail.com>
Date: Fri, 1 Apr 2022 16:42:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ppc/pnv: Fix number of registers in the PCIe controller
 on POWER9
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, clg@kaod.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20220401091925.770803-1-fbarrat@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220401091925.770803-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/22 06:19, Frederic Barrat wrote:
> The spec defines 3 registers, even though only index 0 and 2 are valid
> on POWER9. The same model is used on POWER10. Register 1 is defined
> there but we currently don't use it in skiboot. So we can keep
> reporting an error on write.
> 
> Reported by Coverity (CID 1487176).
> 
> Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
> Suggested-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index b02ecdceaa..19dcbd6f87 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -180,7 +180,7 @@ struct PnvPhb4PecState {
>       MemoryRegion nest_regs_mr;
>   
>       /* PCI registers, excluding per-stack */
> -#define PHB4_PEC_PCI_REGS_COUNT     0x2
> +#define PHB4_PEC_PCI_REGS_COUNT     0x3
>       uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
>       MemoryRegion pci_regs_mr;
>   

