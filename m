Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE56510A97
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:34:21 +0200 (CEST)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRt6-0006qf-8f
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRsB-0005qb-LT
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:33:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRsA-0002Et-01
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:33:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so18998372pfm.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Jc2mc3Kyl93I9bgGjorekkSgbZOsfryDx9ya2EfMN9Q=;
 b=bieSBCQr5jMCBBTsW5Wh2a7XRXzB1+OJl16dp/7zNfluo4Wx5e6FRKRKL0Z+3oy90b
 5P02lOObuXo2c+Ha7gyhnHYLSq/6BUJ/ClLdI7XjFr1c56jlvJOIvzahX0GYbdIRD22B
 rkP3KDzFF5zgbNnyYe9mczs6/yGLbkpgJNeQBSUp6nsbmHyf0aqs6FJbc4CyM+m+nXQU
 CS8V2FrnG26rwJnywtY3jjSnIzbhTIuLz/Ut88FCoyMBii+8lU723fIYc24gAs+Nbmix
 UkFRAYvVJGHODYCh9QYr+45HJB75paDNX4DemUarZYJgyd9gcRDeKp/xxCJrD8ihZz0I
 wN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jc2mc3Kyl93I9bgGjorekkSgbZOsfryDx9ya2EfMN9Q=;
 b=nW5y+z1kxMpKhWycexw/30hg9d198b5SV94iFWz4ryYJrpuDw5nScpH0UQnupKln2J
 ZPXEuNPPwBdE8PFa4OpYgZxGGtP6vR/T2JjrRa7KdRjjtJm1Bl6tIelGrls4Woz5inPv
 DecWZ4m/2ggZWpTXMpT0zNqBXZJHfAFutka5NPOSUCcYYx4CNbA8Vd2dR3TW5z6C0D1j
 Dvo8EGfjwU/Vyo1KKQlBHtsV/1sqn/4112FVFQt3RvctfxJWmwZriyg5OFnEmqa+8k0i
 mocYbhtzZz/nSM7SSS5F8SCSz6vU9QavB1IoyrD5Diims5wV0J9c7mALgEnNb35a3FpX
 k4pQ==
X-Gm-Message-State: AOAM533r0Crh3dOAW8wPW5aOZFc6bEZSFPfGbKCTH6K5GVxUABGAYrnA
 MartQLKAxrGzIUPMKkGNs0X7Xg==
X-Google-Smtp-Source: ABdhPJxyuEbdT33WPflUmSgdbH8041WOglcWjyVo3w6AAdfTQ0UfdIpBQLix1IaUW1uO8CcFvPeC7w==
X-Received: by 2002:aa7:9852:0:b0:50d:6d10:2094 with SMTP id
 n18-20020aa79852000000b0050d6d102094mr1785035pfq.4.1651005200181; 
 Tue, 26 Apr 2022 13:33:20 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b0050d223013b6sm12654860pfg.11.2022.04.26.13.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:33:19 -0700 (PDT)
Message-ID: <aab6cf8f-1d7a-4ebe-73f7-4d078d181aec@linaro.org>
Date: Tue, 26 Apr 2022 13:33:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/9] docs: move replay docs to docs/system/replay.rst
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062842182.526882.9554594086439389972.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165062842182.526882.9554594086439389972.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, philmd@redhat.com,
 wrampazz@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 04:53, Pavel Dovgalyuk wrote:
> This patch adds replay description page, converting prior
> text from docs/replay.txt.
> The text was also updated and some sections were moved
> to devel part of the docs.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   docs/devel/replay.rst  |  264 ++++++++++++++++++++++++++++++-
>   docs/replay.txt        |  407 ------------------------------------------------
>   docs/system/index.rst  |    1
>   docs/system/replay.rst |  237 ++++++++++++++++++++++++++++
>   4 files changed, 496 insertions(+), 413 deletions(-)
>   delete mode 100644 docs/replay.txt
>   create mode 100644 docs/system/replay.rst

Not thoroughly reviewed, but I browsed the outlines.
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

