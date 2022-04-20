Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA9509017
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:13:48 +0200 (CEST)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFlr-0000kF-EV
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEoP-0001j2-5T
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:12:21 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEoN-00029j-Ca
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:12:20 -0400
Received: by mail-pg1-x530.google.com with SMTP id k14so2378664pga.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0opvWO5J8jC1iRFp1P2040ANXjXZgWinGIeMoGxmvt0=;
 b=bLUDiNbnzoH3PMUzSOFd0aIm1zjjKQJnTU+mIII+VEvCB8Fc0fjCyykpCM/sOamrOo
 bcM3vAS2IkjVn71Vmtn6IN9jxP8/gFw/0s/do9BtiT86BYLwbMdgJIZl1W1782+R0N8J
 Pym2XFqGpFmR3fxEFE062HU+6a0mlR++4dRCIO5IaDMnYdfeWsN/nGhXDUe51mc87Ci9
 iIdXU4gc8zu2jBC9ou0u/NghNArDu0ctC7vl/9CVbT2tNPtQCI+Uoqa8qDXMitqyZRG6
 KLclGvDNU8zt1MsNY2WjcTVLgHTwxM4fXl64IGs15d3aBiSBpxr6DM6kO5wtzaATXhKs
 P9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0opvWO5J8jC1iRFp1P2040ANXjXZgWinGIeMoGxmvt0=;
 b=6abeow0Q9Ndp+7wrV47pCn93yZcvpMKMaW7a8ELMbYGrhRl4fNyn4etZQu8Pu231rK
 knYJ6X+ZnjVc2qJJysh+XthBI+NRvW+95dwlqPodHrH05WY80bL1NhK0otCrPr2uwUGQ
 8jJzZCi+EnQeXPqXAiTuD1DTYIG6dihB0yDPLGrVHI9wqUIm+W9lB0W+enSET2vwhY2o
 i47s98XKJR/6+TKrclahr6olknvgXmerQNngrk5azJe8hea1yPa4bxjK4AEjiJvSFAaP
 qHyXdF7P/yeiUqqdWmLa9L1f7WPVlv2P3sA8iR/Ir9lRJKSKbr/ycVmu2o5En9FQ2hMr
 RiFA==
X-Gm-Message-State: AOAM5328lM1Ze7oGeQrdkPcu0Z7l/OjG3jewQgTeYQg+xy+i3OqG/W0T
 48YwBEOx/YXZWaDJkdj4rtFeXw==
X-Google-Smtp-Source: ABdhPJxm3A2uGPlFDiN8BX48d6AaiH862gMrgeTzemejPhIJ9fJAt142eFwIIWeNv/iFOGMixr3s/w==
X-Received: by 2002:a63:2b94:0:b0:3aa:74e4:d9d with SMTP id
 r142-20020a632b94000000b003aa74e40d9dmr2384376pgr.91.1650478337960; 
 Wed, 20 Apr 2022 11:12:17 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a17090ac50500b001cd5ffcca96sm61821pjt.27.2022.04.20.11.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 11:12:17 -0700 (PDT)
Message-ID: <28457d64-a42f-f3ee-14a8-9b90d6fd142c@linaro.org>
Date: Wed, 20 Apr 2022 11:12:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/8] Block patches
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220420124104.795836-1-hreitz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220420124104.795836-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 05:40, Hanna Reitz wrote:
> The following changes since commit 1be5a765c08cee3a9587c8a8d3fc2ea247b13f9c:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-04-19 18:22:16 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-04-20
> 
> for you to fetch changes up to 0423f75351ab83b844a31349218b0eadd830e07a:
> 
>    qcow2: Add errp to rebuild_refcount_structure() (2022-04-20 12:09:17 +0200)
> 
> ----------------------------------------------------------------
> Block patches:
> - Some changes for qcow2's refcount repair algorithm to make it work for
>    qcow2 images stored on block devices
> - Skip test cases that require zstd when support for it is missing
> - Some refactoring in the iotests' meson.build

Applied, thanks.  Please update the wiki changelog for 7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Hanna Reitz (6):
>    iotests.py: Add supports_qcow2_zstd_compression()
>    iotests/065: Check for zstd support
>    iotests/303: Check for zstd support
>    qcow2: Improve refcount structure rebuilding
>    iotests/108: Test new refcount rebuild algorithm
>    qcow2: Add errp to rebuild_refcount_structure()
> 
> Thomas Huth (2):
>    tests/qemu-iotests/meson.build: Improve the indentation
>    tests/qemu-iotests: Move the bash and sanitizer checks to meson.build
> 
>   block/qcow2-refcount.c         | 353 +++++++++++++++++++++++----------
>   tests/check-block.sh           |  26 ---
>   tests/qemu-iotests/065         |  24 ++-
>   tests/qemu-iotests/108         | 259 +++++++++++++++++++++++-
>   tests/qemu-iotests/108.out     |  81 ++++++++
>   tests/qemu-iotests/303         |   4 +-
>   tests/qemu-iotests/iotests.py  |  20 ++
>   tests/qemu-iotests/meson.build |  73 ++++---
>   8 files changed, 673 insertions(+), 167 deletions(-)
> 


