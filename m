Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8514C8E79
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:01:56 +0100 (CET)
Received: from localhost ([::1]:33148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP40g-000332-Lp
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:01:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nP3yM-0001hC-6k; Tue, 01 Mar 2022 09:59:31 -0500
Received: from [2607:f8b0:4864:20::429] (port=44818
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nP3yK-0001KB-Ls; Tue, 01 Mar 2022 09:59:29 -0500
Received: by mail-pf1-x429.google.com with SMTP id g21so8116172pfj.11;
 Tue, 01 Mar 2022 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y1nRIMAH5eflopsjldlIg/Wm7EBlQ2LLrBe/EtaewQI=;
 b=YyUjV/EZ692VgFl9gnvadynnBvLdI7eLBJ6qL572xzks9icGGuVfrkL6AubjDvipeN
 +FfJumKmv2pEPq4NXZ3KRmXKmAuj2cK7TwuRPTaap2U2/FR7n37/7dk1l642lf/DZvkx
 XqzAR9DPwlkY7HRuYRwV5YTbPG2Up6FYZjxc7bomXxU36mDGxGtWqY2AhkKcPhjiZnXn
 37m9tAeZ3KoLoKj034qWbLNbAQwhmJc74M1GMeWUu++9W19f54etUwmaH1lJ1Fqep8QL
 5r77UvpXf6u5sAaMNUmd7WjucBRKSqMaiSC3z26AFDjHwzEpp58GzSlf9jtlnmpQWmmO
 QVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y1nRIMAH5eflopsjldlIg/Wm7EBlQ2LLrBe/EtaewQI=;
 b=Xv5kfnGS/EHb0Af0DWt2TscegXN7tbUCYNOuLSlhsH9B3+p2lfin4HqpvnJYsVBnhY
 +vnhGaJ9TeDQX4uyO2t7dok9xw+EQmgFIbpRXkdKCMk/qd1ZsPuDn+Hg0vW0vpZL74B1
 X6UHun4It9zuoOP249/hSOeefRHHlsZC1rt4NUAzBG9IBdTNu2rOGIcCowUq2jaL8pAJ
 0b+7OLKXdxUie4jkEK9JFhq1f0IoOxca2fTd3uSM1+xvH5xIguJrZluH6VYWKPvbbsTW
 SgBW8MQJ7B/6NXaR2Nj+GpKMUsjUie41g/Acg1ftzOEO+wRH/BKXaqiBk9RTN+on279w
 agxg==
X-Gm-Message-State: AOAM532DpFLgAhIXA2qgoTf84dY4U2R5IEMZ5ubfTp5LLYRhe3DmaUUO
 zQMS3SPgZEFkU7x1PWFSw0c=
X-Google-Smtp-Source: ABdhPJzY4ptOe+EDCRrGgwGsN1P9jpNxmnru58DQ7Vk7wQbrt8A28vUzIibDPOfZFuTAu8og2LHTcQ==
X-Received: by 2002:a63:8543:0:b0:35e:3bd9:3798 with SMTP id
 u64-20020a638543000000b0035e3bd93798mr22283045pgd.73.1646146766651; 
 Tue, 01 Mar 2022 06:59:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056a00134d00b004f35ee59a9dsm18587913pfu.106.2022.03.01.06.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 06:59:26 -0800 (PST)
Message-ID: <5753847b-0269-e461-7d46-5e4f6b2090de@gmail.com>
Date: Tue, 1 Mar 2022 15:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] configure: Fix building on a ppc64 host with Clang
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220301132754.1483837-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220301132754.1483837-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 14:27, Thomas Huth wrote:
> Clang only supports the -mlittle-endian and -mbig-endian switches,
> and not -mlittle / -mbig. Since GCC supports both, let's use the
> long versions that are supported by both instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index c56ed53ee3..81618708e4 100755
> --- a/configure
> +++ b/configure
> @@ -630,10 +630,10 @@ case "$cpu" in
>     ppc)
>       CPU_CFLAGS="-m32" ;;
>     ppc64)
> -    CPU_CFLAGS="-m64 -mbig" ;;
> +    CPU_CFLAGS="-m64 -mbig-endian" ;;
>     ppc64le)
>       cpu="ppc64"
> -    CPU_CFLAGS="-m64 -mlittle" ;;
> +    CPU_CFLAGS="-m64 -mlittle-endian" ;;
>   
>     s390)
>       CPU_CFLAGS="-m31" ;;

Mirek sent a similar fix, but it was pending Matheus TCG fixes:

https://lore.kernel.org/qemu-devel/20220131091714.4825-1-mrezanin@redhat.com/
https://lists.gnu.org/archive/html/qemu-ppc/2022-02/msg00116.html

