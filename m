Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C84B4FDE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:19:10 +0100 (CET)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaJw-0007vX-Rr
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaGI-0005CJ-TM
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:15:24 -0500
Received: from [2a00:1450:4864:20::42c] (port=41663
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaGC-0000sY-3J
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:15:17 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k1so26486137wrd.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+bw4vhS40ivUedgiQoGpkpMldknURGKmZZNZ7aDsDjI=;
 b=f6seLw0IjDXxNjbopDK+oo7Z+8tXksRgJCMA6qGKXT3+2sEnIrQcvUY8860Ac0InZE
 2I5liBYHXyFTZKlnnjip1+nGa4Okexfi+Th/zLT8gIpmqoizRwlGwnrGlYUZ6VcCp14d
 5RmKEfN55W+yySXAE6r+4bF6OO4JaRR/h1YBQTRHAOAdDKWZUJfK16VTOS+xdNfmq9dD
 MZEhqmSKArYKcsW/kKEC6s6Ot8ANnL9PhkKlHy3TiEFmgJQL9R8mgFCqi1LLJlrMw281
 nBmeoHlQ23QRreShGe028lF6wEw0prAsX+TdtgRtszO/CA3SJaIrU9wUNZHIy6KsdQAR
 j+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+bw4vhS40ivUedgiQoGpkpMldknURGKmZZNZ7aDsDjI=;
 b=C1EaDV/oqeurkzKOAdltKku1YbWu2rI7tkqBYPQ74k3fmvCZvaX7b7i80/hpJk6voe
 vgtMMhcgQ1E68Q4Hmj5gYxl1g5s3rT+7TNv//ASkFYYR/XxI1aBnslN7Nyz9gjMVtHJ8
 /68R7LOS9dszh8/7mL3qvAa1JMppiYwIPZMEaWhIq4mszTeqtq/DzLt0Ji4xY4zXEzXS
 21ISTdUql/F7fwYQq06qDtM1qeaoGlxtsF+RJMoCC+HMqXGQaOhn+ynFLSiWzx9Nor4c
 d07I11pCfwTvjyu7cmaoszHygXLf6cU2VjCsoonD+9LM/DWYxI1wW1uAsiri0HNqvHFS
 tomw==
X-Gm-Message-State: AOAM5332n3rUvKiZ+SOGzKeHXTg3e414/WIdeuDqBIrusSeO7l8jqaYr
 12wzT49YwQuzJ6Ss26FaQA4=
X-Google-Smtp-Source: ABdhPJxPMNjNnZ8O2BDn0IbHjOgQhbcxO73VQotvm8g1JZo6EJ9kcTNQulFabWWmfji4H4JFzBErFA==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr8973708wry.486.1644840909287; 
 Mon, 14 Feb 2022 04:15:09 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id p2sm11845755wmc.33.2022.02.14.04.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:15:08 -0800 (PST)
Message-ID: <b97cb628-1de1-06b4-37f8-2d8a36523f9e@amsat.org>
Date: Mon, 14 Feb 2022 13:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] MAINTAINERS: no need to add my name explicitly as a
 reviewer for VIOT tables
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, mst@redhat.com, qemu-devel@nongnu.org
References: <20220214120145.39359-1-ani@anisinha.ca>
In-Reply-To: <20220214120145.39359-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/2/22 13:01, Ani Sinha wrote:
> I am already listed as a reviewer for ACPI/SMBIOS subsystem. There is no need to
> again add me as a reviewer for ACPI/VIOT.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b0b845f445..d92a262947 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1812,7 +1812,6 @@ F: docs/specs/acpi_hw_reduced_hotplug.rst

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


