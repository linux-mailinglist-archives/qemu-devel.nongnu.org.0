Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D041810D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:32:52 +0200 (CEST)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4zD-0002YQ-Qc
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4wl-0001Fu-HH
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:30:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4wj-0000ON-Cs
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:30:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t18so35161572wrb.0
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JbRDnnY3ijdR6ZA850DVoID6LxqW/flNqw1ro4dWOpk=;
 b=HsoUcRmYsYlVX4z6Tf+39k6xmfw74DcfCyIP9MWB9GU6a0tMBCnQoSrQMbOZcvJKyM
 0HGSlXU9/NbL7ozL9LY2z+K6t/eqhrJy5SxFj5Hk1C5JIa86/yGs7pmPgfwghxHRxNGA
 2raC+OgCMaLoElTqBwlV6rQg8M7CMxGMOoH5ZHiPnWoc8U92pXbVSw8zE8fpBdyrdRLL
 BYko+zxpna60VDVzB1KIWDrh7+6qayQKOJ7IA5ATc/TWb+oxmnWe+krb4ZJxGIQlDZyQ
 U2Yreal06RD9YBbiCDEUOlhIt+SyyncEftaU9pIm7te6ZaFR1kNWtQEiZv5ILTv/3Fzs
 DAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JbRDnnY3ijdR6ZA850DVoID6LxqW/flNqw1ro4dWOpk=;
 b=OyTBxb4QUpzKyd/FdXjyREFkLVE17xGbJDBCozW4ONEM5cONcOV7DTZUYn0dU0Mn6L
 VL+6enWFUupdEdi/1QGc01FCO3XwyaC2Xw1zqXKamKcjiXzARchEUBwR1ziQbnoL9422
 FcVsJph9VGvUKMbaGDNJICm6jvTclRaVappe2YofYnbZs1HjBlcvmwd1CsZkU5OYgtzN
 b46YRIHx8dcyPcGjCzwsl2as+oOgLIf3Hp0lYe8wRSZyMhrzlFpevSjFjHZfH0GlNqWR
 1YtjJBpyD96Vgp9Ty6mPjJglhq9lYsD8JSRZxe2vSH5IZYue2Ynsuu7drnh0XfjQez+X
 OvFA==
X-Gm-Message-State: AOAM532tDuikPy4Nb1M8UYPrYBlKI78R4Oc8Bk0GL0o+ZKcVdC35IABD
 V23fOXUHSdoamTGSNkK3/+4=
X-Google-Smtp-Source: ABdhPJzZT4b8LZreGOC8tpkMrX4ZsthYnBTGTPzBv3zHroksJpmwG/xY+t8fSjFl9f1JcHcIAIweWw==
X-Received: by 2002:a05:600c:8a9:: with SMTP id
 l41mr6575296wmp.29.1632565816107; 
 Sat, 25 Sep 2021 03:30:16 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h1sm10782738wmb.7.2021.09.25.03.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:30:15 -0700 (PDT)
Message-ID: <107893cf-b169-483b-3949-7a7b84665b19@amsat.org>
Date: Sat, 25 Sep 2021 12:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 03/14] bsd-user: TARGET_RESET define is unused, remove it
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-4-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 08:14, Warner Losh wrote:
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_cpu.h   | 2 --
>   bsd-user/x86_64/target_arch_cpu.h | 2 --
>   2 files changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

