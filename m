Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8052BBDD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:15:52 +0200 (CEST)
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKSt-0002JV-5h
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrKNt-0006rj-Fr
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:10:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrKNr-0001N1-Do
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:10:41 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso2176137pjb.3
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=AiH25ucag/5uDnMYkr1abF34a3h/Q9wAOI+A0vqTa3A=;
 b=eYm4rXDHP+e7Lpztu/Jysv/YVeX7FZ6z41ds+mU91DYMXe4Np+W1JOxZU9ZyAihguV
 mVoqhTbX1aTOQxYzRulDyReZ7Wu2jFMKs81DRltOSJ6C5QARv8Bm/sUrUeCFws7ODrh2
 IhbZCLGWtgEfQg+QweeDOBPe8KYvrPd9dX75W7RpwVs6PvIO0diLg4+7p7EN6hUjoIP1
 eBRmc8+l6cIIgR1DglKuV2hwl1NP7pmDrPEDRi6n5y2ubLyiARwK7QKYHewERTvFcUTW
 zzW2y3TMzELRPT9EC0ObsXh3t1lh6LM7WIZuLOO5Nayeyui+mkySRrIp//ztcAYg2tES
 +NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AiH25ucag/5uDnMYkr1abF34a3h/Q9wAOI+A0vqTa3A=;
 b=qP9quOA4f2q/JBKyIkpW98lTtLkHjMFvhxDhPBgmP4R3paIjQlnk4dclDrCDnA3H8q
 K8miEBMoGj2U86aYuI3k+yKs4Jb0QrTUuuJ2dY3p7pDs080waczflWrh+E3V+9zN58pA
 iZ8wlR1WfODIA0WWyiKOtO+I0DHYhD2eSTHYSTQnBLul8dnIXuLKkTmJImza8ttJUpAn
 RsvFzlc8je+L3URuUB8owmaIvmSCRZkXVhqFt+pD2CVKbESxm8T8e0NZNUJnl6gCjydY
 Cz+rdLv0uoR7CdsP7DoPGRcmvL/ukyjYRXaLWRftD8jo14DgKGnidW9Ekzs5htFMaUFM
 ndsQ==
X-Gm-Message-State: AOAM533pl07SBXUvxs6lueRPrT4WmJH/QduhbNGOfHVE7fQWMX7rcg70
 mlDUMp5luNBPAE64REbrTriO+g==
X-Google-Smtp-Source: ABdhPJxwO+iVhhv4KJNleBVsKbZrrzPjHo3aNsw7syp+HtDgmCqNYZHNuOF6beuZHDyPoGFJlUbxLw==
X-Received: by 2002:a17:90a:cb8d:b0:1df:26ba:6338 with SMTP id
 a13-20020a17090acb8d00b001df26ba6338mr201543pju.142.1652883037069; 
 Wed, 18 May 2022 07:10:37 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 n4-20020aa79844000000b0050dc76281c0sm1952063pfq.154.2022.05.18.07.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 07:10:36 -0700 (PDT)
Message-ID: <56f1c129-9b7e-e82b-2186-83a5c7168de6@linaro.org>
Date: Wed, 18 May 2022 07:10:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/8] Net patches
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20220518031214.93760-1-jasowang@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220518031214.93760-1-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 5/17/22 20:12, Jason Wang wrote:
> The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:
> 
>    Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16 16:31:01 -0700)
> 
> are available in the git repository at:
> 
>    https://github.com/jasowang/qemu.git tags/net-pull-request
> 
> for you to fetch changes up to 052c2579b89b0d87debe8b05594b5180f0fde87d:
> 
>    tulip: Assign default MAC address if not specified (2022-05-17 16:48:23 +0800)
> 
> ----------------------------------------------------------------
> 
> ----------------------------------------------------------------
> Helge Deller (1):
>        tulip: Assign default MAC address if not specified
> 
> Vladislav Yaroshchuk (7):
>        net/vmnet: add vmnet dependency and customizable option
>        net/vmnet: add vmnet backends to qapi/net
>        net/vmnet: implement shared mode (vmnet-shared)
>        net/vmnet: implement host mode (vmnet-host)
>        net/vmnet: implement bridged mode (vmnet-bridged)
>        net/vmnet: update qemu-options.hx
>        net/vmnet: update hmp-commands.hx

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
>   hmp-commands.hx               |   6 +-
>   hw/net/tulip.c                |   4 +-
>   meson.build                   |  16 +-
>   meson_options.txt             |   2 +
>   net/clients.h                 |  11 ++
>   net/meson.build               |   7 +
>   net/net.c                     |  10 ++
>   net/vmnet-bridged.m           | 152 +++++++++++++++++
>   net/vmnet-common.m            | 378 ++++++++++++++++++++++++++++++++++++++++++
>   net/vmnet-host.c              | 128 ++++++++++++++
>   net/vmnet-shared.c            | 114 +++++++++++++
>   net/vmnet_int.h               |  63 +++++++
>   qapi/net.json                 | 133 ++++++++++++++-
>   qemu-options.hx               |  25 +++
>   scripts/meson-buildoptions.sh |   1 +
>   15 files changed, 1044 insertions(+), 6 deletions(-)
>   create mode 100644 net/vmnet-bridged.m
>   create mode 100644 net/vmnet-common.m
>   create mode 100644 net/vmnet-host.c
>   create mode 100644 net/vmnet-shared.c
>   create mode 100644 net/vmnet_int.h
> 
> 
> 
> 


