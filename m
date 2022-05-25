Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8992B534197
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:37:31 +0200 (CEST)
Received: from localhost ([::1]:42778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntu0o-0005aS-CN
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nttvo-0007a7-8w
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:32:21 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nttvm-0001BH-Dm
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:32:19 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso5590758pjb.3
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=T1vC0BbWsvpNgszRyOd3MN3BVSgAOECWeuPzB5Lyef8=;
 b=fJDqGhAfZp2ho7fHmisGKs24yihn5LfkYMaBOOTXG1zmASO6wwc3xYSNheXAXM7sCo
 KEmI/koPF53Vj8mNs7rSIyM8vggaAzi9UPIv+E+Gj6iNc5bq5tTh+utY3fFqXLFLrAVr
 ij7Xt4fnWEy9KksceWQnTPk3yeu0oAWnLkj6iVBaOntFKew2PQUoXJYewY5IO4U6w33i
 iduSz+ve8x+1TADj0H2mMwmgls37JlpD1GzSNa+j9TntkVwITy8Cbv8CwLO3yYK87hIS
 EeRr4pq1qY5CpFaCDf9yWdOuoUCuPvezEl7UI82ENg2W49Y2O1hahhO4//jD3snELkpH
 UFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T1vC0BbWsvpNgszRyOd3MN3BVSgAOECWeuPzB5Lyef8=;
 b=zKegvWpuv4T4S79NpU8qCjlgWXU+sxtoEWEWAt1TAtysvG8aa6qaXRBKnqjUNBxqmZ
 I6MRz/1v+P2lphw50Ln1iDII4oflj4aRky44nbO7jf0EYBn3SpL6Uzg7OZoJxcgo9WG9
 uYoBs07BAxdGSoHbLZJo5+SQQbTSIhShqghXiLhdmRP5h4M/845hb0V4yf/MtIArzaRN
 s8GoUh2PyYHLv+IqVyZ95CgIQhHdNg4YQ7PbY+jbSxchiL9Mg4GSc+Z1HvS5LUU7dw9r
 WZpRi18kdGysbZJuGW2Lt0EKAi8HYoEzSN6dRHrbZI7kfF1xA+2dGjqObSg/dkqMgCxQ
 z5jw==
X-Gm-Message-State: AOAM5310lBVXMDik5dSiuTEE1eEgf7GYDq13GQTH0eIPMT5nUj0PjeqV
 AoAogAf/F05TRjYuS5CuZjycQw==
X-Google-Smtp-Source: ABdhPJz5J+o4S8xgEPWeI1EarJFtpcsXU+jDZhTpTN3mFxHB+gMZ0gJL5DWc6aXn3Z7eBxszhzU/Jg==
X-Received: by 2002:a17:902:d502:b0:161:8e01:b4f1 with SMTP id
 b2-20020a170902d50200b001618e01b4f1mr33817565plg.137.1653496332099; 
 Wed, 25 May 2022 09:32:12 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a636f04000000b003f84815f6bdsm5481832pgc.82.2022.05.25.09.32.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 09:32:11 -0700 (PDT)
Message-ID: <fb52d9e3-2029-747e-53d3-459bce5269f7@linaro.org>
Date: Wed, 25 May 2022 09:32:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v2 0/4] qemu-ga patches
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220525092938.945611-1-kkostiuk@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525092938.945611-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 5/25/22 02:29, Konstantin Kostiuk wrote:
> The following changes since commit 0cac736e73723850a99e5142e35d14d8f8efb232:
> 
>    Merge tag 'pull-riscv-to-apply-20220525' of github.com:alistair23/qemu into staging (2022-05-24 15:55:12 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:kostyanf14/qemu.git tags/qga-win32-pull-2022-05-25
> 
> for you to fetch changes up to b9a002609fd887447eca8ee10777690d691f91d4:
> 
>    qga-win32: Add support for NVME bus type (2022-05-25 12:12:02 +0300)
> 
> ----------------------------------------------------------------
> qga-win32-pull-2022-05-25
> 
> v2:
> - fix Fedora cross-compilation

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Konstantin Kostiuk (3):
>        trivial: qga: Log version on start
>        tests: Bump Fedora image version for cross-compilation
>        qga-win32: Add support for NVME bus type
> 
> luzhipeng (1):
>        qga: add guest-get-diskstats command for Linux guests
> 
>   qga/commands-posix.c                               | 123 +++++++++++++++++++++
>   qga/commands-win32.c                               |  11 ++
>   qga/main.c                                         |   2 +
>   qga/qapi-schema.json                               |  86 ++++++++++++++
>   tests/docker/dockerfiles/fedora-win32-cross.docker |   2 +-
>   tests/docker/dockerfiles/fedora-win64-cross.docker |   2 +-
>   6 files changed, 224 insertions(+), 2 deletions(-)
> 
> 
> --
> 2.25.1
> 


