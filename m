Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE61FAE15
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 12:36:26 +0200 (CEST)
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl8x7-0004IB-Cy
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 06:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8wA-0003fv-P3; Tue, 16 Jun 2020 06:35:26 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl8w8-0002Re-Jb; Tue, 16 Jun 2020 06:35:26 -0400
Received: by mail-wr1-x444.google.com with SMTP id h5so20227771wrc.7;
 Tue, 16 Jun 2020 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J2uJxqD51F7CZc+NyuSHRCXZW8MAgzr7y20mWhDvdNQ=;
 b=UHGKTgcSqdSR0EK/3qogkAoli9eYvRsDkEoC3TN2/qEnyf+IhYk6nrBmenlRxfRFd5
 rZX7bN0anoMjQB7l0vojy/tN2jOg42mJsxZbmdRPKzSSYduaK8PVKu8IvZZ4kLqlJY+L
 YbYnqFUT+WWJbvISbovsibF3UB2n83ZNq7GjMrE3OVAP7WifsYYfWXjoY1aAA7LWZbJn
 WX18HUMnOFb2a7fhdzWx5YUCAsgrq67BxlNX+7alPukp4xjuJD7qFymHI0BgfSUX0wKf
 cSyzC6PaTXhs+VLCFO7KqseMmUNcq54FXE+RgZBVPAKw3DHECSWK5XpGbvUQyzUO1IPA
 rzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J2uJxqD51F7CZc+NyuSHRCXZW8MAgzr7y20mWhDvdNQ=;
 b=f4vCX/K6ixd92ScW622JNGTtTi7enrg6tE4ggihMzodmk6Yg5+7ej/VIW41q2eAEAW
 bUonIXYXunM9EI+/q2Fao7YYG5zxIWP9gFTLJVA1Nqro91GCTgcExLEPcmdAHIRPHhsd
 R8MWbdMyCmG8D4PI27LMEBN1WBqNpNrn18N0sL7Esvk+X0VUtKmm0gOOHwl8eCcRrxAe
 go0SLFdc5vX8Fzc2BmFBqeBn83tOy9PdGK8OM8W4Mxh+2KOhvAt9OujFgsWsUMHsg92o
 DXwNqwEM4G+LcODE6lfzCU3fvj12uf7SVeXUeWliAJj6kP3TpMU6KazPIWuD2yKzwKkF
 8jIw==
X-Gm-Message-State: AOAM530r1T9nlw7DLKDivBdbnuHMplbq+k+Wh2wqwwSbMhtcbgqSwU6Q
 GlBmRESeOXjNdFdYAUxH53jKRzJl
X-Google-Smtp-Source: ABdhPJyp8D7ubSy1424QRf3dNiutMpNPSffhmqRgnjg2G75feo2NpC7b/C0Xf7MxbdQLsYHcE1Fkkg==
X-Received: by 2002:adf:d852:: with SMTP id k18mr2364899wrl.177.1592303722159; 
 Tue, 16 Jun 2020 03:35:22 -0700 (PDT)
Received: from [192.168.1.41] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id d191sm3353108wmd.44.2020.06.16.03.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 03:35:21 -0700 (PDT)
Subject: Re: [PATCH 3/7] hw/arm/mps2: Add CMSDK APB watchdog as unimplemented
 device
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-4-f4bug@amsat.org>
 <CAFEAcA9335-h=44X-kRMd3vSaGqeRwJnFtWkGUbzt3jeChNEmw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d0af46d-b332-12b1-86dc-8e5b145246b2@amsat.org>
Date: Tue, 16 Jun 2020 12:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9335-h=44X-kRMd3vSaGqeRwJnFtWkGUbzt3jeChNEmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/20 12:17 PM, Peter Maydell wrote:
> On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Register the watchdog peripheral as unimplemented to better
>> follow its accesses, for example booting Zephyr:
> 
> We have a TYPE_CMSDK_APB_WATCHDOG device; so we could use
> that, I think ?

Oh I missed it, excellent! Thanks :)

> 
> thanks
> -- PMM
> 

