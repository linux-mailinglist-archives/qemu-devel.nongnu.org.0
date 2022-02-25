Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546A4C47CA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:40:13 +0100 (CET)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNblU-0006Zs-3P
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:40:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNbR2-0003mM-QN; Fri, 25 Feb 2022 09:19:04 -0500
Received: from [2607:f8b0:4864:20::231] (port=45597
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNbR0-0003eF-KE; Fri, 25 Feb 2022 09:19:04 -0500
Received: by mail-oi1-x231.google.com with SMTP id 12so7519537oix.12;
 Fri, 25 Feb 2022 06:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FYLGg05STa+yB3dQbrIoSYZXKdMg3w0mGvJDYvOTeeA=;
 b=NAniPtqePTHAZi7hYGq0bzXwIWQyDT1OSl8MhsJFrNExo70YPvZ7bPYPffp3DeKh1P
 NLnX1ZKLb/pj4rYmHzcscQRo9I8/bQ17Kj6dwAj12WJ1ZofkA9QX40d49F1aBBNTM6Tg
 wFDLkBBMJ5lDZ2AQEcB212M1TCWeYl5rT1C3DNjJk851nRT4kbAmOkeOAPk+aE5+g9FK
 S7Sa7io/4RMiY3V8fzwMxtiqVH92+0u0w5StZn0rLxnaUXfeZLqcYEjg9ZOuKZWDY4bz
 9lCOccBeo7mLPKGBR/VLBxy9mGKlvAWBcDttPwYO8acnydRkjJxImZbuABUtj8phHPPw
 7bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FYLGg05STa+yB3dQbrIoSYZXKdMg3w0mGvJDYvOTeeA=;
 b=2DFQRX+KduaR1XoREJZtrINBDZluHNbDDvT7DIx6iJiSb7iW222gk7k4IX67vr640R
 96OoP69XQ6nPf1qIazKW0J5PloVO4j+S+fhPutmnKzIX4HdCfEgFclPixovhS1Nlt6eU
 rO5WyxsDrAr7DSfZlfEGbBcKdaO5Z5N9r9FhQproKScs8jSR2C0EewdO3+4nECYljViI
 70yuo8A656ESb0MnQH1OcFR4OLiLVyrCBSz6drPgoonIuVJu54XLEy11x6ceHkuMwcW+
 CTzQcWdyDPTtg89i/jO6beXMrv0pFERjGQ/6gyHi+dUdhTFbr+3OfPBHPxPQtxrjNQnY
 LwYQ==
X-Gm-Message-State: AOAM5306wAPdqjxAAHGrA4RjPDxdpc8t8aTsvPWHr1tK3CBqkqBtbF9J
 hXFtU3gEZJz0nAsl4szOyGQ=
X-Google-Smtp-Source: ABdhPJzwr7I/GdFnxw1B4rT6SBzpmmzusRAb6tiqovUCfi/nVfe2nyNXwPNagv47rBnYFcfSyHtHiw==
X-Received: by 2002:a05:6808:488:b0:2d4:fb86:6fed with SMTP id
 z8-20020a056808048800b002d4fb866fedmr1699944oid.133.1645798741165; 
 Fri, 25 Feb 2022 06:19:01 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a4a8687000000b003191a2edc67sm1181792ooh.7.2022.02.25.06.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 06:19:00 -0800 (PST)
Message-ID: <e73bf445-09e4-39e2-9f11-b2f091e2efaf@gmail.com>
Date: Fri, 25 Feb 2022 11:18:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 09/18] ppc/xive2: Add support for notification
 injection on ESB pages
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-10-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-10-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/26/21 08:53, Cédric Le Goater wrote:
> This is an internal offset used to inject triggers when the PQ state
> bits are not controlled locally. Such as for LSIs when the PHB5 are
> using the Address-Based Interrupt Trigger mode and on the END.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/xive.h |  1 +
>   hw/intc/xive.c        |  9 +++++++++
>   hw/intc/xive2.c       | 10 ++++++++++
>   3 files changed, 20 insertions(+)
> 
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index b8ab0bf7490f..875c7f639689 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -278,6 +278,7 @@ uint8_t xive_esb_set(uint8_t *pq, uint8_t value);
>   #define XIVE_ESB_STORE_EOI      0x400 /* Store */
>   #define XIVE_ESB_LOAD_EOI       0x000 /* Load */
>   #define XIVE_ESB_GET            0x800 /* Load */
> +#define XIVE_ESB_INJECT         0x800 /* Store */
>   #define XIVE_ESB_SET_PQ_00      0xc00 /* Load */
>   #define XIVE_ESB_SET_PQ_01      0xd00 /* Load */
>   #define XIVE_ESB_SET_PQ_10      0xe00 /* Load */
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 190194d27f84..2c73ab5ca9d6 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -1061,6 +1061,15 @@ static void xive_source_esb_write(void *opaque, hwaddr addr,
>           notify = xive_source_esb_eoi(xsrc, srcno);
>           break;
>   
> +    /*
> +     * This is an internal offset used to inject triggers when the PQ
> +     * state bits are not controlled locally. Such as for LSIs when
> +     * under ABT mode.
> +     */
> +    case XIVE_ESB_INJECT ... XIVE_ESB_INJECT + 0x3FF:
> +        notify = true;
> +        break;
> +
>       case XIVE_ESB_SET_PQ_00 ... XIVE_ESB_SET_PQ_00 + 0x0FF:
>       case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
>       case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index 9e186bbb6cd9..d474476b5a55 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -658,6 +658,16 @@ static void xive2_end_source_write(void *opaque, hwaddr addr,
>           notify = xive_esb_eoi(&pq);
>           break;
>   
> +    case XIVE_ESB_INJECT ... XIVE_ESB_INJECT + 0x3FF:
> +        if (end_esmask == END2_W1_ESe) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "XIVE: END %x/%x can not EQ inject on ESe\n",
> +                           end_blk, end_idx);
> +            return;
> +        }
> +        notify = true;
> +        break;
> +
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid END ESB write addr %d\n",
>                         offset);

