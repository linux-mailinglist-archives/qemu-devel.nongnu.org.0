Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BEA358C11
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 20:20:40 +0200 (CEST)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUZGh-0001lk-FE
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 14:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZD7-0000RJ-DF
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:16:58 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZD3-000118-Ic
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:16:56 -0400
Received: by mail-pf1-x42f.google.com with SMTP id q5so2435866pfh.10
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jFnDvdsYrvPQzIpagt1vCGuiGU7ceX29iU9w/+5UU7k=;
 b=PUyc0Ypg6tXc+V48cutN9ZilrntgPkfkYwVDwUZ47ld4IL13f/+Gc/cuYFoBoCKfTr
 mKixkLv8qPmAArK+o3AOSTBwCarcM9jn3UVDs8XKXQbxZLWCAJiFh+3PnQBz+wZD0tJ/
 U/qmw2k/GSlRhdQNyKWBzJyzvXicU29RUMPG0Q2M0d5h98aA/B5mZ9RJ1HAwmM2L+z8x
 cZFaQG+/1MMpc357HGYjYCZ0RZmZIZm7G8KiYF/yeXmCW8eI9w33oVHx7xC4SBV3WxKp
 OykiagAIN5TlgD9DjZmseFVx+itNn17+9Rw5UN7kg5aPmdV/rOOYZv5tHLgPxxClbv1f
 Z28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jFnDvdsYrvPQzIpagt1vCGuiGU7ceX29iU9w/+5UU7k=;
 b=W87f7X1dqugFHcP7L1OidrmqtU9phfgb3QwK6HKEnWsD6DjrMrsNTYyTMUnf54CikE
 SeJxzVSgz0m8hcTT0LZv1hFettaUPbziFzSf2UT+0jr1KdAU5PAkxz9xuYG+cOhc+pNm
 qV2yowSt26xvcifUC/y3vuuxj4AmaJ4WZlqX2QPI61rgHSeEC/hmAuA1Y5dgEUr42GVA
 oPf9/29Yi1CCLCUcZXI+HcMbyHMHvGHAy/tO7MOwTQp20NWUN7GpiQFqG03qmtfmwI9i
 a0wiN9yuKGscFiirrUY3bG95LzwQvl/A0SGvwndxetwZ+OBNtw4xuW8D683BPklaG3d0
 HE3Q==
X-Gm-Message-State: AOAM5319XiKr+v4OG51W4AIGIOhfbZiyfHcNPvUCm/SCkNqSHzWajnWR
 0/AaqNgOgsGjz8fcNaMnKv+ukg==
X-Google-Smtp-Source: ABdhPJyHULlStf8ccJsvyuaEl3i6Ht1mlAEO8gTi2bdcHAVdYN5YhQtpzhaeIGgYXZ2yI4KCrMx0uA==
X-Received: by 2002:a65:6415:: with SMTP id a21mr9218018pgv.417.1617905811158; 
 Thu, 08 Apr 2021 11:16:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id i10sm77365pgo.75.2021.04.08.11.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 11:16:50 -0700 (PDT)
Subject: Re: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
To: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
 <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bfe8c0d2-ac10-a302-b364-91df7e0660c1@linaro.org>
Date: Thu, 8 Apr 2021 11:16:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 10:01 AM, Aleksandar Rikalo wrote:
> NanoMIPS ISA is supported again, since MediaTek is taking over
> nanoMIPS toolchain development (confirmed at
> https://www.spinics.net/linux/fedora/libvir/msg217107.html 
> <https://www.spinics.net/linux/fedora/libvir/msg217107.html>).
> 
> New release of the toolchain can be found at
> (https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01 
> <https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoMIPS-2021.02-01>).
> 
> Reverting deprecation of nanoMIPS ISA requires following changes:
>      MAINTAINERS: remove nanoMIPS ISA from orphaned ISAs
>      deprecated.rst: remove nanoMIPS ISA from deprecated ISAs
> 
> Signed-off-by: Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
> Signed-off-by: Aleksandar Rikalo <Aleksandar.Rikalo@Syrmia.com>
> ---
>   MAINTAINERS                |  4 ----
>   docs/system/deprecated.rst | 20 --------------------
>   2 files changed, 24 deletions(-)

NACK, for the reasons stated against v1:
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg00663.html

We're not going to remove nanomips this cycle, but we're not going to reset the 
clock on deprecation either.


r~

