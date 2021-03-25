Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EDF349184
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:07:03 +0100 (CET)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOlS-00024X-Of
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOhm-0007op-TS
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:03:14 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:39791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOhl-00010D-AM
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:03:14 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 h6-20020a0568300346b02901b71a850ab4so1662529ote.6
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/2rl2TUfpAYU8sNLMo1y2EWn5t4goMXd3yR0vkgQ60I=;
 b=Qcd76qtU1XNetJcJvnTPkRn+GYkCavCNyzkejr+mMecA0oGEzJUP175ZbmWoC8GyKw
 l12p/p6tXCxUKnEJk7Ne6i3M64kTeH1rzXZRKZ0NJUXRrEw9RxZhy29uP8WY6kTcSa7d
 58kFHGs9PPjmQL50/sGRVMysMiZtQV5s2eOzwg1i2tAkya+BEnTOAplsZL9Zho5/51fQ
 8lIpNDKL/m3pZm+eciQiCBlrziA1eaOSClEnSTeOYgnSeEdgwy8njCL7py5ivt9VPwb8
 2RAeaiOuN9d8AN8Rv48ZhXZOXku6fGq/OO8veNlEzP6oVA1RBnf4UI4iJI6OigI1VqoD
 AGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/2rl2TUfpAYU8sNLMo1y2EWn5t4goMXd3yR0vkgQ60I=;
 b=HYFq6aaxriD/ZNq2uQkGITI9A1WxIG2Wvqv4sP3uDF6kmP/Fpo1iQgzwJBEmdNY9Is
 g/z/7yB4m7FgmijHienJH0cOCadgBECQr19rLK5t+eRKWP2myd84nWSC9kIRl9arGNq2
 ynVsAZyFhz71ynQftauZFfTkgd1DwP9XG+gYwb6jKhcQwF/lYYT36dyQ0eN3WrcYi0tv
 DtRCI5dxMa0NCkIucsIDwxiBsFOl2lkXn7rgWWepWQsbtFdq052I9jyCWn4jH71uLt2y
 EWDNE1rgKTXBSSnv490LLLzf0HxmhA+YAl0dR20tISsp++oGoq+Daduh6h6+WeTRl+2k
 mYug==
X-Gm-Message-State: AOAM532K8nj3vDN3VV/AeUDe3dZKcUpoWRidv5EwnaIp1HFvMKRGA5Kc
 DLqR0+1iQfco1ug+yXhqRd5jaQ==
X-Google-Smtp-Source: ABdhPJzFI8RGKy5GwAcmMHfRlD/yTnJ2ns8k7PaPnmDhj8HfAEirVz5reL6W8NjHuss1q0eunF1q8Q==
X-Received: by 2002:a05:6830:109:: with SMTP id
 i9mr7232013otp.47.1616673791881; 
 Thu, 25 Mar 2021 05:03:11 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id m19sm1229323oop.6.2021.03.25.05.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:03:11 -0700 (PDT)
Subject: Re: [PATCH 1/6] hw/isa/vt82c686: Name output IRQ as 'intr'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210324175438.680310-1-f4bug@amsat.org>
 <20210324175438.680310-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b262c441-84ca-72fd-2ae8-adca02fa3b68@linaro.org>
Date: Thu, 25 Mar 2021 06:03:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324175438.680310-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Named IRQs are easier to understand in the monitor.
> Name the single output interrupt as 'intr'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/vt82c686.c   | 2 +-
>   hw/mips/fuloong2e.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


