Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4623854A26C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 01:06:00 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0t8A-0004eN-QX
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 19:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0t6Q-0003c5-1t
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 19:04:10 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0t6O-0000Cu-Cv
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 19:04:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so7423076pjb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 16:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDyzZNMlLlxiZoiU6f0C3jwLrkqYmijKhuiVAx62ZQQ=;
 b=S60lkIX6sWXud1GsIgX5CkJVAcq4SnPI3a90ALDmWH4JcLzkDgXYLj64ra2AOLhAym
 UNwY2Bq2o4eJ+0oXB0+CFA9sWgef9/gKuxqj40wEnIXzSu/WMpj/of10MVBBmi1gnWUp
 mO3jxW/CIIHHB6FEbczLC1U0IkL1fUim/0aYBlQv1qlluiSTd3G5j0E1Pv9pthmlHC4f
 EJB56oCUmXGjsdwT9U5cpKkfCi63bfGc/1/8qRu8AF7S91HiYOVklONv3ddEyLrMUgK1
 RJ81ovnHMYbutuUKDZsgAj5aUCMfZcoIXuE1Pb5/L1Z17QmqKc8C0r5Q26RaiYhfe7cb
 VVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vDyzZNMlLlxiZoiU6f0C3jwLrkqYmijKhuiVAx62ZQQ=;
 b=gdjsNFAr2bEbEn324YIrb19nrRDEKdGYOYSrWAz/Pq7tcGyxWsTQE3xS1nNdcLnlf/
 NjrZk2wJx1tdTe0BV6jLqt7V9cbzDhe1qaxZtgPwpmdcMll1os13YVaPX+a2wYVKNIIo
 ddGjaWsRjS9yzxMOAefjvDrbxg3ncu9tJLn/PUBLCs1tFqlEdUeyEomqzdWZAgh/pAin
 U0/xMkcJEIkIztVh9bBdFHP3DYYp2o9xwuOUg59o48MlLURN1ttGLKTCXxu1NDu3KbdM
 xXsViYkCdOx5BFQETtBKO7+00rTMfFerx9YCxxJzbjaUg2ESgHX6W8SEYpVvH7H4poIT
 M0yw==
X-Gm-Message-State: AOAM530FvFX7bFMRpqg+sy3BNUwkaFLNBg4/ytytBWSI2/e9lIe/EkB2
 0u0gddJT40Lb2XPxSnCGLO/32/z5Nwc=
X-Google-Smtp-Source: AGRyM1uaJDP7yz/oBYQCqCJtouFNDTLjjMCg/wFH7gSZ9dK1CGXP2KdprucOZZAmnjgscy1Gj0vQ0A==
X-Received: by 2002:a17:902:7b8b:b0:168:9498:a0f9 with SMTP id
 w11-20020a1709027b8b00b001689498a0f9mr1401499pll.39.1655161446834; 
 Mon, 13 Jun 2022 16:04:06 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y197-20020a62cece000000b0052051ff6387sm5908497pfg.215.2022.06.13.16.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 16:04:06 -0700 (PDT)
Message-ID: <d40df618-d80c-40ad-c6f7-b7a427d44665@amsat.org>
Date: Tue, 14 Jun 2022 01:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v1 7/7] .gitlab: use less aggressive nproc on our
 aarch64/32 runners
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-8-alex.bennee@linaro.org>
In-Reply-To: <20220613171258.1905715-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/6/22 19:12, Alex Bennée wrote:
> Running on all 80 cores of our aarch64 runner does occasionally
> trigger a race condition which fails the build. However the CI system
> is not the time and place to play with much heisenbugs so turn down
> the nproc to "only" use 40 cores in the build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../custom-runners/ubuntu-20.04-aarch32.yml   |  4 ++--
>   .../custom-runners/ubuntu-20.04-aarch64.yml   | 24 +++++++++----------
>   2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> index 47856ac53c..1998460d06 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> @@ -19,5 +19,5 @@ ubuntu-20.04-aarch32-all:
>    - mkdir build
>    - cd build
>    - ../configure --cross-prefix=arm-linux-gnueabihf-
> - - make --output-sync -j`nproc`
> - - make --output-sync -j`nproc` check V=1
> + - make --output-sync -j`nproc --ignore=40`
> + - make --output-sync -j`nproc --ignore=40` check V=1

Alternatively:

-j$(expr $(nproc) / 2)

So we don't have to update the configs if the runner gets its hardware 
updated.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

