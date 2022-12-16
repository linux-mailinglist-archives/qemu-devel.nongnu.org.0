Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123964EFAD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:48:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Drn-0006QU-T7; Fri, 16 Dec 2022 11:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Drk-0006Ol-DO; Fri, 16 Dec 2022 11:47:20 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p6Dri-0006Wd-PD; Fri, 16 Dec 2022 11:47:20 -0500
Received: by mail-oi1-x232.google.com with SMTP id r130so2428917oih.2;
 Fri, 16 Dec 2022 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E7UrxsSLb+0W8g1qAvBnmTOhbPAx/vUfp/wBCrELUiQ=;
 b=AZI2H6SWr3rdh5b9DbAiSrZpxLPsh2OpoYHH5D6w3839Zki1KWeHcENSnxYCmnazA7
 T4DMPycqme1VRcEAYcLJkYcRT5+/pH416bzFs5q9rEPQzCh+br/IpqFzJOBSTJMvzBd+
 ieokTmTYbnwb2gopbpyNEb7wXnmkp+qb4hERc3xY1XrzPk1cpEjrPimFWp1ocwUlc3vX
 6kiVO68d82ac63lPCwgBwwq+/A+FKOCteLSmjpIbhPxIbSFjuvo04wCxel/d/ewiowUI
 G/Fuq59UDlOWHZT+5+69W2lwrmJjjGBvm8RFq0Fneow16RmyZ/kNV0Fqm5jMywRaL31Q
 kD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E7UrxsSLb+0W8g1qAvBnmTOhbPAx/vUfp/wBCrELUiQ=;
 b=AmIo0AfnJ/TkKEevYTOHM2jkob5rpao42M+Fkls/PwpnoGL+hZxAxHoyFC6AHfRBBi
 S057J58xdN7gO8RoRukxQFFmdvxh2GhvMg5HKG1IvxQEr78WH2hk7Tyh9W4Rtm8OYB0J
 bFOSYbHgLWTsFqgLccxLNQEJW/oR9YqUlc8zL8Q7DzxyWyI58Rdz8lWdLGUKH2vD1zcG
 6RrATU9KdamyVqh4BUnjAsQMyzm8aBiapse5261Ha9aPE6RD6YKXU8k2vrilWxbJ89r+
 YusenxjE60Fdgnsn5vWNrYn2RpJB1k093LEkNwjZPEGoQihnK6ZLyoJzT4GxJidN69MT
 r41Q==
X-Gm-Message-State: ANoB5plinCD8oTwYqeYyzrO14jHIRuCJZo1pRYK2QypnuqIcWjqpt+O7
 Qt3zw6Qf+kyTmzTHdariv0w=
X-Google-Smtp-Source: AA0mqf41f2ZzMZMs9c1XRbypYStSBBLDzk55zopupul3TcdAyZBeBNES07kuhEYCzXlmkc5PIZF8aQ==
X-Received: by 2002:a05:6808:1a9c:b0:35b:80e6:86f7 with SMTP id
 bm28-20020a0568081a9c00b0035b80e686f7mr13609964oib.43.1671209236833; 
 Fri, 16 Dec 2022 08:47:16 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 bk22-20020a0568081a1600b003544822f725sm933465oib.8.2022.12.16.08.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:47:16 -0800 (PST)
Message-ID: <c871b044-4241-2f02-ebd6-6b797663a140@gmail.com>
Date: Fri, 16 Dec 2022 13:47:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 4/4] hw/ppc/spapr_ovec: Avoid target_ulong
 spapr_ovec_parse_vector()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
 <20221213123550.39302-5-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221213123550.39302-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
> spapr_ovec.c is a device, but it uses target_ulong which is
> target specific. The hwaddr type (declared in "exec/hwaddr.h")
> better fits hardware addresses.

As said by Harsh, spapr_ovec is in fact a data structure that stores platform
options that are supported by the guest.

That doesn't mean that I oppose the change made here. Aside from semantics - which
I also don't have a strong opinion about it - I don't believe it matters that
much - spapr is 64 bit only, so hwaddr will always be == target_ulong.

Cedric/David/Greg, let me know if you have any restriction/thoughts about this.
I'm inclined to accept it as is.


Daniel

> 
> Change spapr_ovec_parse_vector() to take a hwaddr argument,
> allowing the removal of "cpu.h" in a device header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ppc/spapr_ovec.c         | 3 ++-
>   include/hw/ppc/spapr_ovec.h | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
> index b2567caa5c..a18a751b57 100644
> --- a/hw/ppc/spapr_ovec.c
> +++ b/hw/ppc/spapr_ovec.c
> @@ -19,6 +19,7 @@
>   #include "qemu/error-report.h"
>   #include "trace.h"
>   #include <libfdt.h>
> +#include "cpu.h"
>   
>   #define OV_MAXBYTES 256 /* not including length byte */
>   #define OV_MAXBITS (OV_MAXBYTES * BITS_PER_BYTE)
> @@ -176,7 +177,7 @@ static target_ulong vector_addr(target_ulong table_addr, int vector)
>       return table_addr;
>   }
>   
> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector)
> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector)
>   {
>       SpaprOptionVector *ov;
>       target_ulong addr;
> diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
> index c3e8b98e7e..d756b916e4 100644
> --- a/include/hw/ppc/spapr_ovec.h
> +++ b/include/hw/ppc/spapr_ovec.h
> @@ -37,7 +37,7 @@
>   #ifndef SPAPR_OVEC_H
>   #define SPAPR_OVEC_H
>   
> -#include "cpu.h"
> +#include "exec/hwaddr.h"
>   
>   typedef struct SpaprOptionVector SpaprOptionVector;
>   
> @@ -73,7 +73,7 @@ void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
>   void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
>   bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
>   bool spapr_ovec_empty(SpaprOptionVector *ov);
> -SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int vector);
> +SpaprOptionVector *spapr_ovec_parse_vector(hwaddr table_addr, int vector);
>   int spapr_dt_ovec(void *fdt, int fdt_offset,
>                     SpaprOptionVector *ov, const char *name);
>   

