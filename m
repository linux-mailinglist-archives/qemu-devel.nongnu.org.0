Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8062F4B141C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:24:14 +0100 (CET)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDAz-0005ag-0t
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIC1U-0006Q5-3Q
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:10:20 -0500
Received: from [2607:f8b0:4864:20::1034] (port=39819
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIC1S-0000ka-H5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:10:19 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso8994371pjt.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OpeUU5wX+YTXcbZhtjmEd7lC9Sl+CetEhj1qQ5mNFQ4=;
 b=ppmlZuKKtmVdTFxceRINKL/91xyuUPANlBlq/msXOnpgWkCqbG36cjuQkjfkqBNUjc
 LM5UvIPp6RMXOxmXj79lBzwTgcklekrE+lAhFvnnsOos6UvsfUbgoupSeBv4jshKes64
 k6GLGc2w6pw9ONIZ5bUWLeDGJTCddRoYTiw+ERNoWDQ02s44CHEPSoBO4s6MzVigTTJC
 kbC9S0JMwyyZE6FMmHeUcDGxtpTXB+ChgLTCnwZYPTOSVBEAQS3LhRBPxxQiQXM0PVA6
 ZFtStGyAUncTlt2Q5R3gCooFzwzFsMuH1smK2C81w/QRLBnBHkWvX1lXCTuk0ukGf3rm
 3wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OpeUU5wX+YTXcbZhtjmEd7lC9Sl+CetEhj1qQ5mNFQ4=;
 b=KOlI0P04cIzUhol9jH8byYDAWgkyH8bJBsWlckwxh1PeUjxlZ0WQ6iysUCazpV7t+M
 /Do4lQpUEoEl2S8Dcmkrj21MKxeyVHwvREbXjXNNu9qlDHeRDF3RYoHeKz0rTa6Y2uTy
 zY85bgadk2/9BOn1q50dHgxL12pzzFzPUoymuz7YR0foxq1eMj3h0tvfAlR/m/7epuS3
 Hk0lVZvXELMqZLtxayYOy3dfbFO5ZtU+OzkJlv7F04qEvzbNb8PqwK4BAfA7JPhS9dKM
 J0VZ5v9yDlfDZIyq8+8ip78l2lD+McYQxhwO0FXBB5S4gnNZGNciRu5LckOp/87ApCzM
 UjWw==
X-Gm-Message-State: AOAM533fJQnB4tnOm56EeCTc/O2DvyvlbpR9BBIWMODRXwNczCgifT5f
 YdM93vlRocr1tyev0K3XkYo=
X-Google-Smtp-Source: ABdhPJwkgLpJsSZa+EtSOr3lsjYzF4Cb/mI1gM9U+a0F5HWxPPWZFqPa/97tFrfURChxcDz9lgsGqw==
X-Received: by 2002:a17:903:40ca:: with SMTP id
 t10mr8183622pld.121.1644509411440; 
 Thu, 10 Feb 2022 08:10:11 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d21sm25563639pfv.141.2022.02.10.08.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 08:10:11 -0800 (PST)
Message-ID: <aaaf4fe9-525f-c54b-a7c7-3c7195dff37a@amsat.org>
Date: Thu, 10 Feb 2022 17:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: kraxel@redhat.com
References: <20220210132822.2969324-1-ani@anisinha.ca>
In-Reply-To: <20220210132822.2969324-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 10/2/22 14:28, Ani Sinha wrote:
> When adding E820_RESERVED entries we also accidentally allocate dynamic
> entries. This is incorrect. We should simply return early with the count of
> the number of reserved entries added.
> 
> fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")

8 years old, so this path is clearly untested (unused...?).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> cc: kraxel@redhat.com
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   hw/i386/e820_memory_layout.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> index bcf9eaf837..afb08253a4 100644
> --- a/hw/i386/e820_memory_layout.c
> +++ b/hw/i386/e820_memory_layout.c
> @@ -31,6 +31,8 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
>           entry->type = cpu_to_le32(type);
>   
>           e820_reserve.count = cpu_to_le32(index);
> +
> +        return index;
>       }
>   
>       /* new "etc/e820" file -- include ram too */


