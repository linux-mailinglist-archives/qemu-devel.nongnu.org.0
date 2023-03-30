Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699886D0850
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:28:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phtGF-0004Qu-Hq; Thu, 30 Mar 2023 10:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtFu-0004Jd-Dt
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:28:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtFs-0003Ni-AX
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:27:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso13575519wmb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680186474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T+4WOKKnq4kwS658ZQkKW+NMV21jACgGAoDdwRdqjJk=;
 b=cjmPtsva9kl+UCS/3TNSOMhO6vZG3q3GisfZbl4N9l3bIsOerhRxJLnHYdB2nrlq2C
 SfG/kynZQDGwT3+wsvvTr+Ag0lxML6vQPJmEBqglbdRUdfbYVIhl2dMBkyf+bI2gFsyj
 HJNcFcB2lXcYOVRC2SI5exPdvFzQrnYUNplnc1OiuSrpNYiQ+95xIbc65bHgFlf/txn9
 fseZNrbVj6FjXxfi3YoX1Lt7NpakvPTku9/EQF/zZqxNhI8VxOBCDcBEslcRLazzLE7b
 WmZ8W+ePJkxP2Twcff09P9o5yr7qmcVt4hwozZs7pHfA9D5ubFDJGqZG4Ip+CEXBgc1d
 4bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T+4WOKKnq4kwS658ZQkKW+NMV21jACgGAoDdwRdqjJk=;
 b=x85iLmsxOWz33jQH2gPSKaKFgs4MRdQ8vUCwwo1rQsk2/MTzdaDGmYEvj66bKrZ2mw
 cxeHUBNx9hjfew+x0q75qsBWo73YjVNxAxbhIdaR7K8RVUgLljMZBJ4UeDK6ZgchaIoJ
 ma+LWOUSj0Dp/LJkU91oGgNL0GF/Wp9MWMQIab/Ke2akxFyN8UK7++0aJFdA5zC8mRnr
 g3IGV91RJ/wdg8YjkH8lG2F8zLkYorl7eifXepCllQwDJjynoHYS8ZiEtmbVbjc7WmDE
 D3YVq7d0ErFwSoi8+sWnvQtjauU5xtcKThleTjICO6UvlRP8zyG2+CjN/ltj4lZx24Sb
 mpWQ==
X-Gm-Message-State: AO0yUKWitlQj6cx3uTY6OwWkeHJtq3RqMnzZ69ELs90pCAWL9LuiguR4
 DgjWAAEOuHriulLILuI4zr/EDQ==
X-Google-Smtp-Source: AK7set+H0Td2TRG8/sKw1HLBuTQjKIybmnvcNivcksbrOQFbHrh2sPb8KkQufX1dkg2ben1usQ5RjA==
X-Received: by 2002:a05:600c:2118:b0:3eb:39e0:3530 with SMTP id
 u24-20020a05600c211800b003eb39e03530mr16679430wml.41.1680186474414; 
 Thu, 30 Mar 2023 07:27:54 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0acc00b003ed2987690dsm5989683wmr.26.2023.03.30.07.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:27:53 -0700 (PDT)
Message-ID: <b2d54bd4-d181-9ecc-e940-353da9d2a5a3@linaro.org>
Date: Thu, 30 Mar 2023 16:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu, nathan@kernel.org
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/2/23 17:19, Jiaxun Yang wrote:
> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use PCI_HOST_BRIDGE's
> accessor facility and enabled byte swap for both CFGADDR/CFGDATA register.
> 
> However CFGADDR as a ISD internal register is not controled by MByteSwap
> bit, it follows endian of all other ISD register, which means it ties to
> little endian.
> 
> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to disable
> endian-swapping.
> 
> This should fix some recent reports about poweroff hang.
> 
> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   hw/pci-host/gt64120.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Patch finally queued for 8.0-rc3, thanks!

