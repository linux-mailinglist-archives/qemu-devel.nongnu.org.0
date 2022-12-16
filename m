Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB4764EF3F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Dbf-0007T9-IO; Fri, 16 Dec 2022 11:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Dbd-0007RM-BF
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:30:41 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Dbb-0002VU-LT
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:30:41 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y16so3062589wrm.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7L0Z4MbvB1dXFTJ/PXFbC1ByY9mQtKaYj/qD6g3pag0=;
 b=RqBQqhvN3IZiInz/NnGgczMAunxywtqx1WFuLWFIonn9GSNCp3D5e2Ar0yuG8VSS6C
 M90Iiz/l2hygVzepqo7TsXKWZCX3GBqWwxdvYqZFvTaJk3pgJU9g7OQoFzEdy+xVHlQ6
 fVQzHP73agvlebFaD8+X5jV0fOddBeLU/bxGMOLgtClc/qpv0ldJd7zHnXh/MIQRRJbj
 JfQtJWhphQMYdib4toy+jv2ArZnsxQC+faI8b7bThTf9v5TuMtAHZ4VnOMrHsa0IZ+hC
 zovzzeq85k5qYYEgXLrfEtSD1BGvERMWFy50bxe9wxLOFRen6IQReWxSKfaP6ZDntgBb
 Q6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7L0Z4MbvB1dXFTJ/PXFbC1ByY9mQtKaYj/qD6g3pag0=;
 b=YaiJFnmijV5YBDy8ZBUSzLxQwhGixu4+sh0a+IinDiaPRBs+HUB+JUwhMtx7t0pfJU
 yS1iGUFWaf0oV0Oy2ptlknCsYV7smeOGUMtuDk6m074aIudCGvB0pqH6GyEJlA1SmvdA
 3BRCj0hCANFjQ6mc3E+mIVEpQmDrk6psV3xi+OOrPmf+CARJPQAEJ7rwZ0pElhpGu1ba
 ynB7WwL7C2sKf8z2X2bUOWivnIbfBwzJSh/I0keBLppsjgH7ZzlM/uXD1+/JB9adgUZp
 /tnyVDLsh5hDpzTQ93q0DNeecUgOA960+HMa2Qf+jEAu5aJjXBejIrs/c857wjaGvraJ
 ECQQ==
X-Gm-Message-State: ANoB5pmR1Phl+StVHn05E97+OlCbEI+U/gWlbhbHGXVfDj6n7JCXzUEb
 gVteM7Fm/TbX+J3W2129ZDZtLg==
X-Google-Smtp-Source: AA0mqf4GG5XPI4QpF0KCiJT/kSzhjBfIe6av6m6pLhs6dJ8NLLP9StcE8IQyUPKRtOrLC+2J+BdclA==
X-Received: by 2002:a05:6000:182:b0:242:4d70:7882 with SMTP id
 p2-20020a056000018200b002424d707882mr20002145wrx.15.1671208238119; 
 Fri, 16 Dec 2022 08:30:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y9-20020a5d6149000000b0023662d97130sm2685057wrt.20.2022.12.16.08.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:30:37 -0800 (PST)
Message-ID: <5c3c7f39-1e73-efdb-25c9-117cda9013c9@linaro.org>
Date: Fri, 16 Dec 2022 17:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/6] hw/ppc/e500: Prefer local variable over
 qdev_get_machine()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev
 <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <20221216145709.271940-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216145709.271940-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 16/12/22 15:57, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/e500.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 2fe496677c..ad83924004 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -959,7 +959,7 @@ void ppce500_init(MachineState *machine)
>       memory_region_add_subregion(address_space_mem, 0, machine->ram);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



