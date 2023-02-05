Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2568AF60
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcTd-0003br-Bl; Sun, 05 Feb 2023 05:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcTb-0003be-MH
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:42:27 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcTZ-0002bp-T4
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:42:27 -0500
Received: by mail-ej1-x635.google.com with SMTP id gr7so26717177ejb.5
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Rx+cKhz51XWo2cs5Wh4CzNxzUzWqAGIbRQx8z2eT+8=;
 b=EpQjI/hsREj4RSO4L0HQYpqj9pxOWBjshpf/dYoE8+oqubgconHOKhyIY5aUNDkbnG
 BJEC8SbBtSUl8Qk1cCX61aQdZ7eNzCJbHoxyj+rD9Kzuyi7Jz2AyxbyuwBuSwSWwwNwt
 ibL7z4LTLsp4EiAZu3yK6tWCTQGSzJtiUSYJE3+ClDIl9Vvq6D7CZ1up0269NtIbWTtN
 gQVp7777RmyDqLtYvrKxEEUew1iZdLBPOYZb6hLPu/0XWBwL9WCC0DBNXEOwabcF8yZg
 HGI9dP1kpC0J26dPKGW8QgEXMgWUlZZmsCYA71tLOlONvD5Sk6G/QSTDM0WIk6Vs5FQ/
 lP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Rx+cKhz51XWo2cs5Wh4CzNxzUzWqAGIbRQx8z2eT+8=;
 b=Q0b336xwyu2FCtA2WGbte7sbQi6hBm4lc7MKwJ69ds94xQr2OK9Iix8yZvFz4aC8ZV
 g8FO0PygrZ17XaR9cRNx9MTI8yDJBcfcLKGddT5P2jmE41G1nsqlv+NAlORsaWJABy0U
 JWImVEvgxFxFyWn6nZsoqOoAjJMzXsq+Rk51pq2rEluvy0R4aXYs6FM0tONskbkrZ+mj
 9slSoh35NEcJ6wGq4Y10oDp4i86j57SC2ZhWhdt6POBx0EPBLD8xaBJVcaKEIxuoa3R2
 nbdk5ur1+Rs84aHlX3dYpAB0nRBuSaMji/SkStm8z47r6mqOxpiW1jW8bbiwKXiUG6Cn
 v3YA==
X-Gm-Message-State: AO0yUKX8RqUsDvkNZsyVNzJEtkNQQNJ+/Qp6tvJPpk0/vrZBCUykg448
 Y92hVzPwwUTGsDJh2DMMXAwyYA==
X-Google-Smtp-Source: AK7set/+LSTPaUPDU7QlWqUCZ4fqRxern4+YJMz//uO3k5Gp8oOqzJ1/apUD+Z8uLdQMkz/PRM5ulw==
X-Received: by 2002:a17:907:9d08:b0:879:36b4:486 with SMTP id
 kt8-20020a1709079d0800b0087936b40486mr19452593ejc.13.1675593744495; 
 Sun, 05 Feb 2023 02:42:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 rn26-20020a170906d93a00b008845c668408sm3931925ejb.169.2023.02.05.02.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 02:42:23 -0800 (PST)
Message-ID: <d9ff975c-c054-93a7-3c2a-e0a7b5d33af0@linaro.org>
Date: Sun, 5 Feb 2023 11:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 04/10] fuzz/generic-fuzz: add a limit on DMA bytes written
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-5-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230205042951.3570008-5-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 5/2/23 05:29, Alexander Bulekov wrote:
> As we have repplaced fork-based fuzzing, with reboots - we can no longer

Typo "replaced".

> use a timeout+exit() to avoid slow inputs. Libfuzzer has its own timer
> that it uses to catch slow inputs, however these timeouts are usually
> seconds-minutes long: more than enough to bog-down the fuzzing process.
> However, I found that slow inputs often attempt to fill overly large DMA
> requests. Thus, we can mitigate most timeouts by setting a cap on the
> total number of DMA bytes written by an input.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   tests/qtest/fuzz/generic_fuzz.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


