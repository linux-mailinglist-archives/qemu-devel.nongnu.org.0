Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A16AFA7F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:34:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZgoV-0005Mm-CX; Tue, 07 Mar 2023 18:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgoT-0005Jb-8r
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:33:45 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZgoR-0000IY-Gw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:33:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l25so13780142wrb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kEXpHTatbjtbDS35hPxkRT8KA/hT5J3sK4pe6Kh1KE=;
 b=h5kVoQ4UOPH9JnWU5t/aaZxz4ugSGHVjXR+H6ZR0v1bhMwyEsq9qfnof5ScbduCXBO
 H4YzsRgXK0h3FXY+HSn6FnSUTdmHqRomJMF224Go3iulfNXc0wxvUH4GVMRBA0sHiU+z
 tWNKYVLP0lAT9xBX/n/cufj7kdHXJCLdXqrsl28mrACPwMTt11IgLvzCiHBXfm10zeu/
 HHitA5l6dAocj2psDTpa4TH2rT7bkJvnjtvQooorq4//B08ZzUG3wTWI6wovMENORooO
 KgVCssFqF09nXYwlgd0tYGttL9Ek9AbL+4kvFS4i/XB7iSCKWtJzRpzdLWFDRUMTbLnX
 N1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kEXpHTatbjtbDS35hPxkRT8KA/hT5J3sK4pe6Kh1KE=;
 b=vornxr42M0g0qpdu6ZpkQhaEP11Cm5a3WoV233eVaWdqErKB6DTwio4pNsb+6ztlG9
 xWFTZhw5Q0aZSwWWQbSuyH86P2Vjj2Eav0+GQfZalXxtOy65TpwKdKyfvRefrpS2UzeA
 zOQt3SUo1lLfW7l1Tu3odR5UtXbUuGybpUz/WiXMZ2laMPRouC2XyJ4zdxLpAR4NKZlu
 wPDijAr6iRPuhlLs/gTkGx6LbUT6PPjuf2EVOoDDvEDyMCrIdEqUOrGTd/Rv44IGx1pW
 ANkx7TZeeBYEE5J5GjIQv7Gv7ZqAi/QMjcfknjOrzUIiXW6+1ui9u2kQHunEPiRcM23a
 AiWw==
X-Gm-Message-State: AO0yUKVpeZ6U2mhhMPebuK7BExeABZ/1l8QYVjsvhoEmJKBNcrcEGhJh
 GD7a8HRHf5Obg6p5ljRjKDEufg==
X-Google-Smtp-Source: AK7set/ilru4wYrHuUC0fwvatRQ0Tqir9jtNmEBgVhD0epMH5DVwoUh+bnV+2Y9ZpwaBEIo4MuPuww==
X-Received: by 2002:a05:6000:1363:b0:2c7:1b4d:a6e2 with SMTP id
 q3-20020a056000136300b002c71b4da6e2mr10530141wrz.60.1678232021431; 
 Tue, 07 Mar 2023 15:33:41 -0800 (PST)
Received: from [192.168.10.175] (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d4e91000000b002c559626a50sm13820228wru.13.2023.03.07.15.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 15:33:40 -0800 (PST)
Message-ID: <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
Date: Wed, 8 Mar 2023 00:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu, nathan@kernel.org, Rob Landley <rob@landley.net>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

So this works on little-endian hosts, but fails on
big-endian ones :(

I.e. on Linux we have early_console_write() -> prom_putchar()
looping:

IN: prom_putchar
0x8010fab8:  lbu	v0,0(v1)
0x8010fabc:  andi	v0,v0,0x20
0x8010fac0:  beqz	v0,0x8010fab8
0x8010fac4:  andi	v0,a0,0xff

gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
...

