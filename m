Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D49674D88
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 07:58:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlLI-0007O0-BX; Fri, 20 Jan 2023 01:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlLF-0007NA-Sn
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 01:57:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlLE-0004Li-3B
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 01:57:37 -0500
Received: by mail-wr1-x434.google.com with SMTP id b5so4014970wrn.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 22:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIzO5WcZMLxcuwhPaKdv9Z6qpKNuH1rIHoNvo/1Rw8Y=;
 b=Bemudum++GuidblNhn62gr3MMYvB+9DI7jgUtVOJXo4ESm0My7eZGqUc+pCjY5AaX9
 Q2isJ/sfH3Dr5cN7BtLWFO3WH+NNovRYZPcVbBbr5Mr3EpRXa7KpOdEkspjjPVcNLj83
 fcwRVyjT9exPRBifdFcEv3VyUJfWa7zAQUGcvddBEYyH/3AEheT/RlgCQUs57F0wQAlu
 m2j4i5y8tMAb8DVC5YzL7G7XIi0mW2iIyiv7sgV6VR085IDBE1/kWonuAZrXTpBocqjt
 2Vi1GfwoROMeWM+8SPqbaimqwz4JpA4L1YTZGf9jgZAPoUQHu7sZamVFoCAyd5GTzNvV
 IE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OIzO5WcZMLxcuwhPaKdv9Z6qpKNuH1rIHoNvo/1Rw8Y=;
 b=OYDxhnyTUU6iphmakZKXX/V7a1G23Y3lgbKOaeE15AydzEdNnTDKVrzXIodybSoR1A
 f8xX07O+lsGuvzMDd49zeG0n/BrkBSZ80sMXNt08LAtSNKrsZxKgO73Olz6UxdnbG03K
 zLWe3CbIzbVnuJfEsDhU8pNRAueG1qhlHvj0lZOtAvv0Z6ZBQbUOfYMa1v4XYZIoTzeo
 KTqhoD6vgeMlVEUz415aeQApyoZi8GTLuw6RSehxhsHsnKbgqlp91MO9wYgZ44O9dN/F
 kRR6cIOzkG5ddlW3gBzRo8nHyv/nbYrZubN44PW5y1/0msyWmX66m5qIQM8xjbw7ufrh
 clpQ==
X-Gm-Message-State: AFqh2krrKl7FS+Isf+9XS+oiWVzhkQpuslhTdubQIIgGDlZ0yYSznwqw
 Ke+VevqP0d9AJzsUpsDJBkQWQA==
X-Google-Smtp-Source: AMrXdXvBpqWuzi43AdUbNKBquAlc0hojqTh8xvZCf11g/nRtJbNAOJs4gHKcLWXHA57gySY7pCL7AQ==
X-Received: by 2002:a05:6000:a03:b0:2b9:9e7b:be6b with SMTP id
 co3-20020a0560000a0300b002b99e7bbe6bmr12645380wrb.45.1674197853611; 
 Thu, 19 Jan 2023 22:57:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m15-20020adffe4f000000b002bdd155ca4dsm21070866wrs.48.2023.01.19.22.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 22:57:33 -0800 (PST)
Message-ID: <b03eb9fc-ccd2-cc8f-2862-6ece604fae1e@linaro.org>
Date: Fri, 20 Jan 2023 07:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] mac_nvram: Add block backend to persist NVRAM contents
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230119222845.27209745706@zero.eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119222845.27209745706@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 23:28, BALATON Zoltan wrote:
> Add a way to set a backing store for the mac_nvram similar to what
> spapr_nvram or mac_via PRAM already does to allow to save its contents
> between runs. Use -drive file=nvram.img,format=raw,if=mtd to specify
> backing file where nvram.img must be MACIO_NVRAM_SIZE which is 8192
> bytes. It is only wired for mac_oldworld for now but could be used by
> mac_newworld in the future too.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/nvram/mac_nvram.c         | 28 ++++++++++++++++++++++++++++
>   hw/ppc/mac_oldworld.c        |  8 +++++++-
>   include/hw/nvram/mac_nvram.h |  1 +
>   3 files changed, 36 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


