Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBED3C5E39
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:20:00 +0200 (CEST)
Received: from localhost ([::1]:56168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wmt-0004OB-BG
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2wkI-0003LD-S1; Mon, 12 Jul 2021 10:17:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2wkH-0007UN-3p; Mon, 12 Jul 2021 10:17:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id l7so24929933wrv.7;
 Mon, 12 Jul 2021 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sao/ZZJQ3t+k2L5Jqxc7r+2LiSs/HcT1cc/cExL5hYs=;
 b=ICuHsdTy2WCIYjPIcxMGfIegNhIIN7rnH5zMTzcgX44XMdPs7KF3gPJHYSq/VF+yCI
 M5W1puy7RIojNBSOdvfjrL0cPpQDivE38o8eE03dF28rsnCeyZj8gbfpDCFQol/Ytda5
 ZRjGs6P6RdpTsXZNCHXZlgR5vJY00s3v+yVZrx1gnWSQLEfFeGaM3E+rKvYvi8bArsRA
 Rdd2z3PEFKK7xcuD2KP2BkVeS4lVUA6RWxUDftQe75FtDEiTIfm+WTz6KEcHrqFbE2L6
 0vzQjbsLIulYmvPosJAsvhXtFtvtAplbUHLjPCf5MAnzcYxQW9prNHbHWWyPDLW0/eZQ
 N67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sao/ZZJQ3t+k2L5Jqxc7r+2LiSs/HcT1cc/cExL5hYs=;
 b=SNXQXMmmswucYu5Agmh2yihyqxnhuiG48jzHpLWA85WwgCcBIeVWhhEj6hQY0NYHv5
 HWYiH9TGO9ix/pkMkdmKqWNLX2TCbfUkRbtc6dRx1GtUOHqIbbtTD3mKv4NmQdx3qVVY
 3hrQLaUgFGW+dMuZ3yXtZNQdMwskCT1Ta8RlnJR9byoSI1jzdj0OlIfn/ho6e1yqTrDS
 qUGUFj+nIECatYkd6RxuYwU5925X+8ta3hG03MoV31R2xQaaHlOg1Bk8zcHP52nNJutt
 AXthHtZsgN0bQAfwpjvJ3qDBULYg1rawELjgcjCG2sJ7ANYMbm8ofDDe0esDIv8ZvoyZ
 q1AQ==
X-Gm-Message-State: AOAM531/iFhOZ6hXv3NAE4cnR/UO/WRDcEQDEv8GOu7MDmA46EM3COO1
 sLqG3EQZmFAMenuc1WIClN0=
X-Google-Smtp-Source: ABdhPJyxTv6FcIzL/jg2DBHM7p3BleOmic6X5Z0LEVPTETC5s6aoIz29D51pkFocH90jLD/B/YWExA==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr22452926wry.288.1626099435347; 
 Mon, 12 Jul 2021 07:17:15 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id v18sm16976916wrr.54.2021.07.12.07.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 07:17:14 -0700 (PDT)
Subject: Re: [PATCH] mv64361: Remove extra break from a switch case
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210712131259.B705B7456E3@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5a2131d6-4b85-839d-8cd3-18cdcea15925@amsat.org>
Date: Mon, 12 Jul 2021 16:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712131259.B705B7456E3@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/21 3:11 PM, BALATON Zoltan wrote:
> The switch case of writing PCI 1 IO base address had an extra break
> statement that made part of the code unreachable. This did not cause a
> problem as guests ususally leave this register at its default value.
> 
> Reported-by: Coverity (CID 1458135)

Fixes: dcdf98a9015 ("Add emulation of Marvell MV64361 PPC system
controller")
?

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/pci-host/mv64361.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
> index 20510d8680..92b0f5d047 100644
> --- a/hw/pci-host/mv64361.c
> +++ b/hw/pci-host/mv64361.c
> @@ -687,7 +687,6 @@ static void mv64361_write(void *opaque, hwaddr addr, uint64_t val,
>      case MV64340_PCI_1_IO_BASE_ADDR:
>          s->pci[1].io_base = val & 0x30fffffULL;
>          warn_swap_bit(val);
> -        break;
>          if (!(s->cpu_conf & BIT(27))) {
>              s->pci[1].remap[4] = (val & 0xffffULL) << 16;
>          }
> 


