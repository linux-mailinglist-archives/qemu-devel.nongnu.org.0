Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA3466919
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:29:00 +0100 (CET)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msptD-0008Mv-Is
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msps5-00063J-5A; Thu, 02 Dec 2021 12:27:49 -0500
Received: from [2607:f8b0:4864:20::82b] (port=44559
 helo=mail-qt1-x82b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msps3-0002vz-3b; Thu, 02 Dec 2021 12:27:48 -0500
Received: by mail-qt1-x82b.google.com with SMTP id a2so428141qtx.11;
 Thu, 02 Dec 2021 09:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y9xhcVnSjl0ow6sJAOiADQHEGKG4BURnU3WcRN5GIVA=;
 b=loiQ0qmwgS0zDjXNannLzJRpfP4UOhB85U4mJcYIuvzNsGHNeJ3scG1/exaDJKsw2+
 aLyUusKpolwJpqbfVr7F4fomZcJXXQi46DBhIq3hRHYIUljoLUdtaB4Uei/j+wwAhdE2
 GO7+3SArUCgGzwp9ohcCHA0rn5JIVIJDgjCTvA2ijJY0DZ3u1mdpKCqJROE0ay0TZu/l
 9sh9QR33w8T0zdhRa9DpSCb5djoOOHyEJ3PyD5t8H/UgiHKcpeYbOog12bytymndJ0Sx
 x4GEhcfxyI10NuyLzr6UBjv8XP0628z/QB76MfM5g6O5dZgoxIjvmcc/RLM8t3k2nmRI
 w3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9xhcVnSjl0ow6sJAOiADQHEGKG4BURnU3WcRN5GIVA=;
 b=dbfMfArsPRTNqrJDLJNiq0TztrU7oiJ/iHYnyw2BeQT33ESVd4nyFEy7Cfic041b9E
 uz0P0HU2UB01DbXy3QulTiXIQdLR/xfPBc5qktKQ/Rhu/RsRS4r3T5ykW2CS1aMOLo6X
 32w7o87m/iyaNvVsuWMORqvKwSwQbEIFJZCq4FY8bajv39WLFVI8q9FwmlwZ5EXMxrDI
 Awqz3PYzudDFYiQ2flon8pzfsb0/lqVT/MDf530ZiLDJKyQNBYiMoOyU7wu8Ue8CUKUj
 4moWkZFF+lGSsFzbcIqIgjaJdf+LhxHb5JUVUUonSxzegCtcpP+YD6F/+6aSFNSg05bV
 cNIA==
X-Gm-Message-State: AOAM533iGPhNc54q9+pfunijuprVNlXcGyAt2+5ZrRTJzFp1sjE+LESV
 o4ZTkQeKflcM+B5gB9Kkm8k=
X-Google-Smtp-Source: ABdhPJzmkdMW7sYlZ24U9ny5TVSTW8WkVfjfFBP5aaOaD1X5nC06GXqkL95HssGd5FpfW/byzhXZwQ==
X-Received: by 2002:ac8:5cc5:: with SMTP id s5mr14946778qta.97.1638466065966; 
 Thu, 02 Dec 2021 09:27:45 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id l2sm232081qtk.41.2021.12.02.09.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:27:45 -0800 (PST)
Message-ID: <46f526be-135b-a879-2c4a-33de7f92d260@gmail.com>
Date: Thu, 2 Dec 2021 14:27:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 02/14] ppc/pnv: Drop the "num-phbs" property
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-3-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 11:42, Cédric Le Goater wrote:
> It is never used.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/pnv.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index bd768dcc28ad..988b305398b2 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1764,7 +1764,6 @@ static Property pnv_chip_properties[] = {
>       DEFINE_PROP_UINT32("nr-cores", PnvChip, nr_cores, 1),
>       DEFINE_PROP_UINT64("cores-mask", PnvChip, cores_mask, 0x0),
>       DEFINE_PROP_UINT32("nr-threads", PnvChip, nr_threads, 1),
> -    DEFINE_PROP_UINT32("num-phbs", PnvChip, num_phbs, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 

