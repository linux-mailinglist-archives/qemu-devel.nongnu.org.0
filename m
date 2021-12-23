Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3347DDC6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 03:34:36 +0100 (CET)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0DwB-0001sv-9M
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 21:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0DvF-0000yp-I8
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:33:37 -0500
Received: from [2607:f8b0:4864:20::430] (port=41689
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0DvD-0000cM-Nb
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:33:37 -0500
Received: by mail-pf1-x430.google.com with SMTP id m1so3924841pfk.8
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 18:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zQA2/ViOqw3qZSQ8961fwO8xOLEt5DsGUCal3X7RjyQ=;
 b=wLY4DFphNHKJUIzRzzCUH/2yaRp7MPGyqhDrXN4F4HJjpKxu866Zd7ZXYG1gu4Q/4n
 wB3Ugea0RoyqLL1RmrfYNLVC4BiCFiUPP235qQw6t4w/fpEQfgM/J160DBfxYOV1Mevj
 z2S7klzFV0zmSEYWYxUczUfMzzd1Bkt6ZHTy3Rx2ePeZPAsmxTF1BElSgKRTnwVQakYd
 cE/EJyd5s4rcdyTKU+JX5k23JJY6hWFX6pCArkC4o0QUfRskxysiJkGGU47MAsoMMa7Q
 GdQSAd2QdU4fX1TripTVVoCH3/HBe8YdYiRajAkHGRxq/BiMPL9xHpc1SPAXVpfooUmu
 7hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zQA2/ViOqw3qZSQ8961fwO8xOLEt5DsGUCal3X7RjyQ=;
 b=JXPY5kVW4L0DHX05pTOdTF3irNxkNazqh39NoBpw+z20uy+/4QMdGA5CL6dcINkBIF
 DQ/9d2o3bun2Y6r9PqYqySkFS0SocULYmJN5pqRsuvPAKBnW5t5CZRuNPqByQXUFmjdq
 AuLWPtNaXhyl77za/ndbQQs9tcBeBmkhRkhZYKi9JwREGD6/BxLVzQJ5DSdynpU94Usv
 32BlLTWADuHN8NQi+y4k7ioBW1DTOspneVq92cBGaZzEdcy6NGenqmDeNnYAHugxwi7H
 GQzpBBgM1tRwLZLX73uffBlfZDcN3jGMDRYFxwb3GgMe7RabiQvbzEhY6NtnjI5ygleo
 WNtw==
X-Gm-Message-State: AOAM531BeHbxBNMwWor7OKTyI5ZCAiXd6200MlEGk93lui/T8u2BWY+6
 oeVd9cPKTFXNqet+Ui1222Bx3g==
X-Google-Smtp-Source: ABdhPJyvKpU+ZzdhSev/Ess2mmHgmRR/Xk/iCPUecFl08tPveOVsu63CVEbkERc6HFX4Qa1QH9c1LQ==
X-Received: by 2002:a63:d446:: with SMTP id i6mr440154pgj.479.1640226813147;
 Wed, 22 Dec 2021 18:33:33 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id f7sm64524pfc.141.2021.12.22.18.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 18:33:32 -0800 (PST)
Subject: Re: [PULL 0/3] Block patches
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211222165208.693159-1-hreitz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b893274-f411-efab-5aa3-8bf9baf2bfe2@linaro.org>
Date: Wed, 22 Dec 2021 18:33:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222165208.693159-1-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 8:52 AM, Hanna Reitz wrote:
> The following changes since commit 8c5f94cd4182753959c8be8de415120dc879d8f0:
> 
>    Merge tag 'pull-loong-20211221-2' of https://gitlab.com/rth7680/qemu into staging (2021-12-21 13:30:35 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/hreitz/qemu.git tags/pull-block-2021-12-22
> 
> for you to fetch changes up to 722f87df2545b308aec49b459b028f0802b4fd9e:
> 
>    iotests: check: multiprocessing support (2021-12-22 16:29:48 +0100)
> 
> ----------------------------------------------------------------
> Block patches:
> - Added support to the iotests for running tests in several parallel
>    jobs (using the new -j parameter)
> 
> ----------------------------------------------------------------
> Vladimir Sementsov-Ogievskiy (3):
>    iotests/testrunner.py: add doc string for run_test()
>    iotests/testrunner.py: move updating last_elapsed to run_tests
>    iotests: check: multiprocessing support
> 
>   tests/qemu-iotests/check         |  4 +-
>   tests/qemu-iotests/testrunner.py | 86 ++++++++++++++++++++++++++++----
>   2 files changed, 80 insertions(+), 10 deletions(-)

Applied, thanks.

r~

