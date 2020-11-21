Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450502BC1FC
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:14:53 +0100 (CET)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZHY-00081x-9v
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZG8-0007Wo-Kb
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:13:24 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZG6-00067Q-0k
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:13:24 -0500
Received: by mail-pl1-x641.google.com with SMTP id s2so6747570plr.9
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xqPx+Rqu21RaAzTDuTXwO7Sv9epLOYAxMBu3HdVo0x8=;
 b=JaOkfseXy54w7LKrkg3F0hIQSbTcRkoTwz4b0MAYrbjIpf5nGwkdEqPVuRJUngdipn
 diLnvXc8/nqI6QE7e1PB4+0f6xp8AFy6fsnYOdx8K3MNS7/bHtQTXW+V1cRReSDJ4DL6
 6tiAHJWYL03ojxpDiaxodmljqrMn7q6yGKWsOmP+DO7WoKEiHJ9gja2H9PEaHo9uFsSk
 74mpoAsBr0B+Ow/J7myBTYCee5vvQQqftnZ3OwsJIhVkeApSQt4SunqxoOLtEBj98rGY
 za3x/3PePqe0KyEYCPSpI8tjFL7qAWMKKEf2BSmJEY9sCd1z6D8gkwvhDed6gmkl7E3r
 Z+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xqPx+Rqu21RaAzTDuTXwO7Sv9epLOYAxMBu3HdVo0x8=;
 b=j9uvM4cMZQNh+d+u4hUjzOrgem99eYgDulHoDmAaj1ZyQqLuW0tbUMIV6UJXKVf9x2
 TteQHRDEPrzKZcJOj9kx/MLEU6cmgW8Rj144+n+DZLJxEnyE1gpXSmqGGKwD+gzAlNya
 txxiypKv6/Q6oHBeH1lkY06PTtIJkQtoGB+KrUTdVIhxJUxUJ7Sjc6GO2+w9Mm/HTPZn
 2vFMfBhUCmWwKMDECWKbnQ0qtoUeKAvbb5J9441+RipsVnBIuJ1DvFwKxrSVRRJ6MTIM
 lNd448i+BXKTJkYt2iC8s+ckm0y7aKU7wwpMdq6el+7Nn9FxNgNiILWHxDxpjTixKQKI
 VgAg==
X-Gm-Message-State: AOAM531KZJzI/tSHFzX25/hSEweEBzmbfuJeO9OCo6bjK0FJ6/GWRZl6
 Mm7dX5pgEPU8Hrh0twxxzcsCYg==
X-Google-Smtp-Source: ABdhPJzliAXa6XOsjFsXzdS74NqAOAD4nrarsqq2k8ndXeWA7Ge5EQH9ANReVxUeSeK9BwqfVwcZ7g==
X-Received: by 2002:a17:902:ee09:b029:d5:288d:fce4 with SMTP id
 z9-20020a170902ee09b02900d5288dfce4mr18986237plb.45.1605989599750; 
 Sat, 21 Nov 2020 12:13:19 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a25sm7776524pfg.138.2020.11.21.12.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:13:18 -0800 (PST)
Subject: Re: [PATCH 20/26] target/mips: Extract XBurst Media eXtension Unit
 translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-21-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b5de3f4-92ab-432f-8044-c06baa7af4e0@linaro.org>
Date: Sat, 21 Nov 2020 12:13:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-21-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Media eXtension Unit is a SIMD extension from Ingenic.
> 
> Extract 2900 lines from the huge translate.c to a new file,
> 'vendor-xburst_translate.c.inc'. As there are too many inter-
> dependencies we don't compile it as another object, but
> keep including it in the big translate.o. We gain in code
> maintainability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c                   | 2890 +-------------------
>  target/mips/vendor-xburst_translate.c.inc | 2893 +++++++++++++++++++++
>  2 files changed, 2894 insertions(+), 2889 deletions(-)
>  create mode 100644 target/mips/vendor-xburst_translate.c.inc

Where does the xburst name come from?
It's a little confusing that all of the comments talk about MXU but the
filename is xburst.  Perhaps add a comment near the top identifying the rename,
if you can?


r~

