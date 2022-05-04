Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973EC51A337
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:08:22 +0200 (CEST)
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmGc1-0002Rh-8u
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmGac-0000LG-Hq
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:06:54 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmGaa-0000D2-MU
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:06:54 -0400
Received: by mail-io1-xd2b.google.com with SMTP id o190so1770130iof.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B6PMqW97A/0hsP1vHlejwfPgZB1m7757+mlH926YcTI=;
 b=YXa6UOERw8FeH6GR4R3Gqgb/kq1v1PngwzaLTJ/p3/7rPY21H8nA9IZ9TDlvwyktsC
 ZvyGiI1tGFYtBUzp3WYFQyxtdZkJi/HUaaT/g8rgm9Q4rcB3qU2uU5dB4cMAOLlLT6sp
 /rEJTMIqW6xvgNcmaVHSmT1JmseiP3neAfWNU9zHSlGEpIKLVCm1iIVGMIZVkKG0NyMO
 ebVPoh1dDbGvOq7B99laJA2zAKYcLCNlErbhx++lueXm07XjYF9ZN0PrTObiIBHWSyeC
 HeIT8UC5rbP1UuSn5suxi4n6uEegjSlHD8YLWrTtSKrAgU0BpwC43+xfF/keGOlkHfyx
 U/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B6PMqW97A/0hsP1vHlejwfPgZB1m7757+mlH926YcTI=;
 b=1u+yQFgMP0v2Rhfxy/wIs1snME5PsN8lvSVB8N9aDoxO35ND+X61Of1ml+c1N4pXVZ
 MvhDtgCRjVH5ZCBEzkmOebapbT8vj1GbmKbDZiC9i7ZIaxqeRmgMmq/hJTBakfRqrKne
 Hi/43R4zLf5vzvsYoDNqsauLoG2LYlRK0p4Xt/LhNpwrrB2Ofd+l6KWvLR4Kw0aL53ik
 PlgWWsJMe9LrmL0HyB7cSe44HaXVsJeGgkbtvb1uwOb9fR83yK1cD9XqBBYAtrbSNoQp
 PaE88dMt+oupZde4H0x/ByGUtNwpvt/F1+XEqQxZ+xQ/g7SP/g2MAA0EEyqRtHDQqdx9
 2MXw==
X-Gm-Message-State: AOAM533eL2O66qHp4SCu3oXZyllT4TQURIcBYtgBawfHfbV0QEYH1fbe
 UJzv81N05s6gQ05ZCd6/GxBLsg==
X-Google-Smtp-Source: ABdhPJxO10pZvYdN8LJdM+0u1SSDyn0Vy7aCGECnZ4+zFeONuA1NCoch3HcdDTPYN08OGZtWbN0KpQ==
X-Received: by 2002:a05:6638:164b:b0:323:ac42:8d4b with SMTP id
 a11-20020a056638164b00b00323ac428d4bmr9357350jat.75.1651676811527; 
 Wed, 04 May 2022 08:06:51 -0700 (PDT)
Received: from [172.19.1.158] ([75.104.86.150])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a92c805000000b002cde6e352edsm4209877iln.55.2022.05.04.08.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 08:06:50 -0700 (PDT)
Message-ID: <fb9c0e3a-8760-4c95-2c17-11ee4fd26b0d@linaro.org>
Date: Wed, 4 May 2022 08:06:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/7] QGA patches
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220504100101.564747-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504100101.564747-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 03:00, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:
> 
>    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/qga-pull-request
> 
> for you to fetch changes up to 22668881f3def13e9ffcf16840e5fde974a55b1e:
> 
>    qga: Introduce disk smart (2022-05-04 13:03:19 +0400)
> 
> ----------------------------------------------------------------
> QGA Pull request

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Andrew Deason (5):
>    qga/commands-posix: Use getifaddrs when available
>    qga/commands-posix: Fix iface hw address detection
>    qga/commands-posix: Fix listing ifaces for Solaris
>    qga/commands-posix: Log all net stats failures
>    qga/commands-posix: 'guest-shutdown' for Solaris
> 
> Zhenwei Pi (2):
>    qga: Introduce NVMe disk bus type
>    qga: Introduce disk smart
> 
>   meson.build          |   1 +
>   qga/qapi-schema.json |  56 +++-
>   qga/commands-posix.c | 591 ++++++++++++++++++++++++++-----------------
>   3 files changed, 413 insertions(+), 235 deletions(-)
> 


