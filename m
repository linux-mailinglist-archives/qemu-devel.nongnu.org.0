Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F408747E9B5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 00:50:27 +0100 (CET)
Received: from localhost ([::1]:56430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Xqs-000828-J6
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 18:50:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Xp8-0007Ev-9r
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:48:38 -0500
Received: from [2607:f8b0:4864:20::52e] (port=42963
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Xp6-0003RA-AT
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 18:48:37 -0500
Received: by mail-pg1-x52e.google.com with SMTP id g2so6153921pgo.9
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 15:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DAAvn9r2ku0Zqrwe0xoLWdGP4tXwXAk1Vd/BRS9o5cA=;
 b=njdVzLBhhTZeYJElcA4tyLwTCHQPNdFWizkdmcVV3bbmYXl61uDSkyAcPMTTpce2/z
 hyEqpFrLr/fh1xV19uR2Lqt3+OjYaH2dpcM2I0EaJczB9J/uvyVWB1JVfHfdm1I51iMq
 2JHbPeMrsqHMTwFGT8s4kG3y0zztxiZrc3CSL7X8XI/qxhSArm9MVwJS0tJrWg5acQ91
 4Xj1XIY8oHDCBvqEZt4b3dXwx+kiWuADQlB9EAqBbq0kVLF1vDXtbmHD9Yat6Z5yYS8i
 bz6cz1CV/ufF16q0y9YnBjLNyFcfiuVvLYy6bOz/nSs8o6KeoSu+PMq0jCwr2ocEB823
 k4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DAAvn9r2ku0Zqrwe0xoLWdGP4tXwXAk1Vd/BRS9o5cA=;
 b=5Axs8D+Fh+w5PtSO0NGbzC/++lI/dLEbsSGzUsy/BAvFy0UVzJEO9ITFEPlxyCxSLn
 kSHTASnmF0xfOp53fMHpJ4jmvbFmyVI5J25BhBTsj+B9y3xn/UeBWuktaUuzId2pM/tn
 9hKjs/GS2C1Xa8e5WRX6vr5v8d+O7kycTMeiBz0mdRQX0RSnj9zYc5s1RvvlPJO4p5c9
 P6CDBT0dfj34RjJVjf5PCMP1JRxv5Vru5VEp9kRO1a2mQRVgLI9lXe/VGPPbXebacwvT
 3sbt1j+JelHMxI8lkLCxyJMrw0IPaSyFvhmQyt9x8z1UtGcpf2TTVDV7xLecuZf3swO8
 Z5AQ==
X-Gm-Message-State: AOAM533N/VRbxQSsXMV46i4+Z/ecY4g4DvW3kHxMW+S1vNyr+uKRXhAh
 Fy+jX1ohKtrxP7JtO8K573dbkG5ZD0+ElQ==
X-Google-Smtp-Source: ABdhPJyzI101k0OeLOgzoDXfG/NlbEqjgBaFx07hE3LC05umeGIp6wQK4gCZQkANnlSoUoprSC2GPA==
X-Received: by 2002:a63:2c8e:: with SMTP id s136mr3911485pgs.431.1640303314820; 
 Thu, 23 Dec 2021 15:48:34 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id y27sm7376446pfa.12.2021.12.23.15.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 15:48:34 -0800 (PST)
Subject: Re: [PULL 0/1] "make check" switch to meson test harness
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211223101736.507167-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <581f1f22-25ed-98ef-3c54-4d42d7e5a2c7@linaro.org>
Date: Thu, 23 Dec 2021 15:48:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211223101736.507167-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/23/21 2:17 AM, Paolo Bonzini wrote:
> The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:
> 
>    Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream-mtest
> 
> for you to fetch changes up to 3d2f73ef75e25ba850aff4fcccb36d50137afd0f:
> 
>    build: use "meson test" as the test harness (2021-12-23 10:06:19 +0100)
> 
> ----------------------------------------------------------------
> Replace tap-driver.pl with "meson test".
> 
> ----------------------------------------------------------------
> Paolo Bonzini (1):
>        build: use "meson test" as the test harness
> 
>   Makefile              |   3 +-
>   meson.build           |   5 +-
>   scripts/mtest2make.py | 112 ++++++---------
>   scripts/tap-driver.pl | 379 --------------------------------------------------
>   scripts/tap-merge.pl  | 111 ---------------
>   tests/fp/meson.build  |   2 +-
>   6 files changed, 51 insertions(+), 561 deletions(-)
>   delete mode 100755 scripts/tap-driver.pl
>   delete mode 100755 scripts/tap-merge.pl

Applied.  The terminal output is silly, with the rotating moon, but whatever.


r~


