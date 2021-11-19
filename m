Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EAE45709F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:26:58 +0100 (CET)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4qv-0004Bx-3d
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo4pN-0002Ez-7N
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:25:28 -0500
Received: from [2a00:1450:4864:20::330] (port=45852
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo4pH-0004Z4-JF
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:25:20 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so7641795wme.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0DV/Y6Xtf3HzTXNLg5e8rttdo8B9ull6ms89lrVnR14=;
 b=JxPPY8SEz7cBe3n7VQd54gL7wKLGW7r+g5Mfc8L+krt0Jj/5ShffUl443Y/od4ZXur
 c88IZQJki4xNd5adHFTfK/odqKBxMC1l6wvrLoSxriVtzSbds6n6Pr00r4WWPHyPVeit
 9+D0iQ5Zo2zi3PcvytrqpUPlKH3TsW29690TVkPoaPZHyCwA14LyAYCG01/ms4uKeppn
 Npa09bUEzmb1LBwXIp9/PHzJxmHaSWvwFRAEiHk5lC7iENYN57Vo+K1Mo49x4m13DloJ
 qsLnYk+0zVz2PxzFkPT9mJaxTVVVFUZ+x5Mb8Ng/T45aN75/ZORZSE0gHThJ91C5XTTA
 1XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0DV/Y6Xtf3HzTXNLg5e8rttdo8B9ull6ms89lrVnR14=;
 b=12zQn/mXXQPAD5v/wiZCkFpSglATjYXSzA2rrk8Xg9bg+bCXCakWpqe4e5NKlYkQEP
 PhyxJKxYs2MKanzCtZPtGSAeeB2J6XBFiE4Y65pFSPTU9BBYjkG8uKDs/PbXXuDsB3+B
 vjaZU51TWpiFWB3nHSUr/V+HVo4B+zn2lQL5FuWpySKXVnoOKK0hFRNE3s9D2IqmpGAF
 qZymoiMdSf+/0d+yWVGP556F5Jcmkca/asaFumwVnx+DxC2ikyTO+xwrnWJpmE4ZPHTp
 5lyD9tdRHnFqMxBkRGPtk5FB67Rnf7IKMSdNN+jUcB1Fr6tx8Fg+C04MnyS+FSaa7aos
 Q5lA==
X-Gm-Message-State: AOAM531IQRKYgSL646GNk6nqhz1bTeuWx0jsXexxR2dPJkLVEtZbbODO
 ptooDsBIFqC5rakaxMhhe7HUSQ==
X-Google-Smtp-Source: ABdhPJzZAxKYmT+pTugryIljgtMWbUOqX+ZwD460owMD1Pir+dtZv8T+hPeIkuKSe+DxOvf7GPSRYw==
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr36436wmr.136.1637331913794; 
 Fri, 19 Nov 2021 06:25:13 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id d15sm4596720wri.50.2021.11.19.06.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 06:25:13 -0800 (PST)
Subject: Re: [PULL for-6.2 0/2] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211119115545.2080251-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41ae6116-b30a-708c-40c6-0d8e646362e2@linaro.org>
Date: Fri, 19 Nov 2021 15:25:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119115545.2080251-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 12:55 PM, Cédric Le Goater wrote:
> The following changes since commit 67f9968ce3f0847ffddb6ee2837a3641acd92abf:
> 
>    Update version for v6.2.0-rc1 release (2021-11-16 21:07:31 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-ppc-20211119
> 
> for you to fetch changes up to a443d55c3f7cafa3d5dfb7fe2b5c3cd9d671b61d:
> 
>    tests/tcg/ppc64le: Fix compile flags for byte_reverse (2021-11-17 19:10:44 +0100)
> 
> ----------------------------------------------------------------
> ppc 6.2 queue:
> 
> * fix pmu vmstate
> * Fix compile of byte_reverse on new compilers
> 
> ----------------------------------------------------------------
> Laurent Vivier (1):
>        pmu: fix pmu vmstate subsection list
> 
> Richard Henderson (1):
>        tests/tcg/ppc64le: Fix compile flags for byte_reverse
> 
>   hw/misc/macio/pmu.c               |  1 +
>   tests/tcg/ppc64le/Makefile.target | 12 +++---------
>   2 files changed, 4 insertions(+), 9 deletions(-)

Applied, thanks.

r~

