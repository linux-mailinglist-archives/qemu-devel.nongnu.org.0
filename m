Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434C5424834
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 22:47:40 +0200 (CEST)
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYDpC-0006Qm-Ov
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 16:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYDmi-0005eF-Bi
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:45:05 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYDmg-0002Yx-HO
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 16:45:04 -0400
Received: by mail-pg1-x530.google.com with SMTP id s11so3531226pgr.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s6vQBQCIyvm6BbObmvympuwpY/msCEX8HNynSjflB0M=;
 b=HIoFZjgHts+Du4C0M/a5PJYvm0E7vZm+/aHV6wEls/v2zTBA6d0ywn9IkvmCMW1vdk
 LPTD5Gal6lPGmmfhZvF/+BD/GsrstCCyE98uGNyH1SzygJvJ34U0y/j0Va0vFgKf/VSc
 dvceBi+GDS69QT6qSsNYBJ83duWpjE5qOfmjhA5XXGicxQLdk8Jvbd3KDgtSUpBTAQQn
 6HLG1SVvB0qav/TXg9AWS2nJI55ep32YOT6PmJANng8PtVdSiAFphsCf5K1CmGXW/WvK
 NW2WPZqkSjHcRs1ju4akFG1UO87qynbrp+7B2EEZkb6l12gRdZeACk1kLiUR9k/q4t8/
 g9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s6vQBQCIyvm6BbObmvympuwpY/msCEX8HNynSjflB0M=;
 b=WAEARrgLFHrkpOBNv/C/ynlnwczvUisxJTnv5IU57rFkTvJfXv4UnXO7AWWF57hg8F
 fCRBnAwo+C6FrQee4Cau+fyFJ7KfjWQQuMm4A4LDwP4BVoAO9bf7DEUZl68xuMCjR4Wp
 wUTSJwK0zCwAgxO3eAUH5XvlhHah5F32r+CpfWjWmusrvuxEjXN/gXqOOSc3gKGC0T5g
 RC+ugluHva7HCvvbdbYL9rcTavlg1XdiWgQBcYua7GxJ7M+2XgVGEjhcs2XnV01rI1pP
 otRrJ3B8rArCuSB76OwYcpyF92vzBSjX0XENNr2sTJhJjoMwKlLU/EnQRc6zTlLui+gH
 0uYw==
X-Gm-Message-State: AOAM5337okl7tGSdwVxWfNP5QE/EjRVrPjX06kPSl+AzhHIaEXxpKaNG
 h0LoaonHXEd+lY9Jx1V4p4MuHw==
X-Google-Smtp-Source: ABdhPJzh2LR9z/o515lO9tPZ4QVH4lYfO0myu7D3/iP9u6Ijl5or7Uy/BDNP8gs66cMg1XGzUOOYjg==
X-Received: by 2002:a63:fb58:: with SMTP id w24mr134679pgj.327.1633553100506; 
 Wed, 06 Oct 2021 13:45:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u4sm7102823pfh.147.2021.10.06.13.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 13:45:00 -0700 (PDT)
Subject: Re: [PULL 0/3] Hexagon (target/hexagon) update
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1633535271-17986-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c60e00f-609b-68cb-4af7-252b1a9e26cd@linaro.org>
Date: Wed, 6 Oct 2021 13:44:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633535271-17986-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 8:47 AM, Taylor Simpson wrote:
> The following changes since commit e3acc2c1961cbe22ca474cd5da4163b7bbf7cea3:
> 
>    tests/docker/dockerfiles: Bump fedora-i386-cross to fedora 34 (2021-10-05 16:40:39 -0700)
> 
> are available in the git repository at:
> 
>    https://github.com/quic/qemu tags/pull-hex-20211006
> 
> for you to fetch changes up to 23803bbe524c34d5725508f169a0a23f652e6584:
> 
>    target/hexagon: Use tcg_constant_* (2021-10-06 10:29:56 -0500)
> 
> ----------------------------------------------------------------
> Change from Philippe - Use tcg_constant_*
> Change from Philippe - Remove unused TCG temp
> Change from Taylor - Probe the stores in a packet at start of commit
> 
> ----------------------------------------------------------------
> Philippe Mathieu-Daudé (2):
>        target/hexagon: Remove unused TCG temporary from predicated loads
>        target/hexagon: Use tcg_constant_*
> 
> Taylor Simpson (1):
>        Hexagon (target/hexagon) probe the stores in a packet at start of commit
> 
>   target/hexagon/gen_tcg.h          |   6 +--
>   target/hexagon/helper.h           |   2 +
>   target/hexagon/macros.h           |   5 +-
>   target/hexagon/genptr.c           |  39 +++++---------
>   target/hexagon/op_helper.c        |  16 ++++++
>   target/hexagon/translate.c        |  64 +++++++++++++++--------
>   tests/tcg/hexagon/hex_sigsegv.c   | 106 ++++++++++++++++++++++++++++++++++++++
>   target/hexagon/gen_tcg_funcs.py   |   4 +-
>   tests/tcg/hexagon/Makefile.target |   1 +
>   9 files changed, 185 insertions(+), 58 deletions(-)
>   create mode 100644 tests/tcg/hexagon/hex_sigsegv.c

Applied, thanks.

r~

