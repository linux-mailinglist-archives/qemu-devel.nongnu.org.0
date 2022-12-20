Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D3565176D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:55:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Qub-0008UW-I1; Mon, 19 Dec 2022 19:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Qua-0008UO-O1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:55:16 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7QuZ-0004R7-3u
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:55:16 -0500
Received: by mail-pl1-x631.google.com with SMTP id 17so10768255pll.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NaxwCkoyK8HVGbyeBy7KWUsupYF3NKdwlpaidbYT/Vc=;
 b=Yqtsbf2kd7FjITUhxY6M7A1ZOXH/Fcsz//FrWkCkqxnCtbdxAI0NjA/RQhf1atOUrJ
 4gH1ffdtGyyqFcSCLpu8Qeia0lbFii1CiWC1ktwP8YBJjlZp9K8+fualoXltLuNJqtfy
 MRoT67eU9tNhNJF0SHSGgdD6Bln3cHEZflChBG1JecICJ18B7ID9CyV5hBuHVKmzm+K/
 Y0O7cdaDg/HImFrg+m7dpU0L1goedD5PHQGqABZxYEc9ad9oDdFwSf+8B7p15vQY7dHv
 gFZ7TTj3pAxMz/G8BYJJY9QR3NpUrIHfDSC0QrAivxtqYrTikdBlIuezbMQxObDTHtu+
 DeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NaxwCkoyK8HVGbyeBy7KWUsupYF3NKdwlpaidbYT/Vc=;
 b=Bx4+7pKLHQtlS1Nv0zGw2GPZeVvcjPhUcZPFqA93T+T7DptYtzEued83eboyfQ5edV
 e58SMY+zd3CEcBOEylfzBrPgQPMAjJe4ScOdtDitxtDSpGLYbYutzldDnd6bzlHhxgAj
 gaRQiU24WHgfZJGTiDOCQWwsXHOrGbk3n5zDjp+WlRv9CoiAy2J0jfFgLooeaOL5xp0b
 uo8AVlZOoc1rYXK88HWeJbL/S/YwrEcQ1bTLMQzVndZCgfWRVJb1X/oUmN8F3i1sNW/w
 2lJCPBJaCteqGzGldJZuxGEPYNLCsjyPIUvoMQtELlyVJggv0BMytSv0kVxl8ZSqY/3L
 QkgQ==
X-Gm-Message-State: ANoB5pkvHOnuvvON5nH9BDt1b40Jb1MzPEHfTNiMo+T/ugS3E4051WQy
 2wnvXRg+Ep1SkHKk3u1fUkqM70+/c3Xylaqb
X-Google-Smtp-Source: AA0mqf5x7x5pFwt6yi3vFscD9pRN+l4rpAyoUg/whNrDl20dAs8nka5nA1zAYgLeFhSwsH2t2WvDNQ==
X-Received: by 2002:a05:6a20:662f:b0:a4:cb41:298f with SMTP id
 n47-20020a056a20662f00b000a4cb41298fmr39562865pzh.6.1671497713650; 
 Mon, 19 Dec 2022 16:55:13 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 bc13-20020a656d8d000000b0043c732e1536sm6903327pgb.45.2022.12.19.16.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:55:13 -0800 (PST)
Message-ID: <464af603-847e-8547-d3d2-49a1087c5cea@linaro.org>
Date: Mon, 19 Dec 2022 16:55:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 7/7] hw/mips/gt64xxx_pci: Move it to hw/pci-host/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209151533.69516-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> The GT-64120 is a north-bridge, and it is not MIPS specific.
> Move it with the other north-bridge devices.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   MAINTAINERS                                   | 2 +-
>   hw/mips/Kconfig                               | 6 ------
>   hw/mips/meson.build                           | 1 -
>   hw/mips/trace-events                          | 6 ------
>   hw/pci-host/Kconfig                           | 6 ++++++
>   hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} | 0
>   hw/pci-host/meson.build                       | 1 +
>   hw/pci-host/trace-events                      | 7 +++++++
>   meson.build                                   | 1 -
>   9 files changed, 15 insertions(+), 15 deletions(-)
>   delete mode 100644 hw/mips/trace-events
>   rename hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

