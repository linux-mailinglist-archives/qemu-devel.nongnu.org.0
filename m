Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD947286A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:12:22 +0100 (CET)
Received: from localhost ([::1]:55016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiJh-0007jG-PJ
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiIQ-0006zZ-EJ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:11:02 -0500
Received: from [2a00:1450:4864:20::42c] (port=39504
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiIO-0002Nf-3Y
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:11:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a18so26082368wrn.6
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jlPv1tNGwEY64Br9mvR34FGHWH8UvIn6cUtpZRhM4CA=;
 b=kaQ3+YQtLkW1qvPSRf5dT4YVU/bc9mkS7uQ8B/rzOyAAseIxD8174ivgG0AcMOEPSp
 aicqP3M9SOkDx37HlgPFY/grBTOhmHmvz1v5or2HfadwP0wiW/COTH0Of8YMTrfAX5ko
 kLFIplh5ClD5XDV1OMfjzYAkoihixC3HJx8i+icY6dG6twRb7Awkn7+Drw6ourRP98uL
 b3K2KMywC5B3yiaGWMHByyIWJQnTa64zEDNzFyU0gr35qZokQx6Ql4uxNsv6ry/zYGUv
 GubTIpL2TvqcFF9ktGLj0IZuDzU/x9Nglc20IRJPgSFrK1ofv7pwcLph7gCqxa2n0G9V
 PSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jlPv1tNGwEY64Br9mvR34FGHWH8UvIn6cUtpZRhM4CA=;
 b=7YlLyWJhkypxtpFy6v7+MnpT0IbKXAKbGdoYpOdobRBgkU9EkhdsHsN3b8nIeI3R0C
 zc9j39GnggmZSIrKGPgG4bzBj7gAabfwGUSi+vhgmBp5zE2bOxf2ove4EttMlx9oYK7Y
 y/copBv5LuLIXvr5Pw9Ab8Ie4sEVqpIKiXUH3V29k1qkPkMP/QCB3X2OU4csYLnolNJU
 WyK8crUA0zNNf0aGePbKlQAZMESixG0QkzeDGo8oPCXnRucBnRoQntZe4Ytt1KwneGEO
 G+rpq1eWPLeHhvYw4C4xOc84zOXhNbZXmpcnqMoLDawxcRHsKk2bK4gArrA3Xt3QIpQi
 8JKQ==
X-Gm-Message-State: AOAM531M1/apIU6lpNmZII+SP95fba774Jq7H7fKyoKqLnu1bBnHUJo0
 BXcFNwcgP5e0UNvqbfQRWuc=
X-Google-Smtp-Source: ABdhPJwLgTA0Buzc8oGQnjnGnZB+/+gXfk/41DBOkt6X6raPrJH7L5YMofD6McrsoiRJbJe1kFrVJA==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr31132085wrw.138.1639390258623; 
 Mon, 13 Dec 2021 02:10:58 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id c4sm10187343wrr.37.2021.12.13.02.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:10:58 -0800 (PST)
Message-ID: <b32b56b9-acda-66ae-6b81-e45cac403bd8@amsat.org>
Date: Mon, 13 Dec 2021 11:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MIPS - fix cycle counter timing calculations
Content-Language: en-US
To: Simon Burge <simonb@NetBSD.org>, qemu-devel@nongnu.org
References: <20211116072606.BE9C8A1856@thoreau.thistledown.com.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211116072606.BE9C8A1856@thoreau.thistledown.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 08:26, Simon Burge wrote:
> The cp0_count_ns value is calculated from the CP0_COUNT_RATE_DEFAULT
> constant in target/mips/cpu.c.  The cycle counter resolution is defined
> per-CPU in target/mips/cpu-defs.c.inc; use this value for calculating
> cp0_count_ns.  Fixings timing problems on guest OSs for the 20Kc CPU
> which has a CCRes of 1.
> ---
>  target/mips/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
Good catch. Too bad you didn't Cc'ed the maintainers, this patch
would have been in the 6.2 release.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued to mips-next.

