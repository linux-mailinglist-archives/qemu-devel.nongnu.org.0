Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A097C47933D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 18:58:08 +0100 (CET)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myHUd-0002dL-BK
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 12:58:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myHRZ-0001XC-Bz
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:54:58 -0500
Received: from [2607:f8b0:4864:20::529] (port=42592
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myHRW-0003bn-07
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:54:56 -0500
Received: by mail-pg1-x529.google.com with SMTP id g2so262588pgo.9
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 09:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=utaK6Im8fj6jQkl5x+7gGiAxz01z/0QMzo+jEXs6kvM=;
 b=jd01PnwXR8nH+UlVRrP0D1940UyFCjMuHqp1uAiy5UAaWSlBu+smljvCYpKwroCOXh
 Ebih8FgTFGKkNze3NgojkI9f5B9ipQ7zLUvmQvRuMW4RvANLWYvaoW2UzOcIIXDcnIPu
 4NWdJ54foyCRDoEHVdQUdtAq016P0kGEQyeeXaxx3INnJejWXqqJ0QtjoNk4vH0m15rT
 SdoQF1KOCojJin6fNjPodqE9JIVfyiDHjv+GZ7OucgwXwH3dCvFm70s97lREux3ibaN5
 T+GG7B3hOaeXe4lEOdl9h0wlbBzB1qzq/LMV+HANteqIBsNi+UsEjYQKucown8JDBs4x
 ZPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=utaK6Im8fj6jQkl5x+7gGiAxz01z/0QMzo+jEXs6kvM=;
 b=X6cCB+wePcy6Inw3e6uf9M0Oxb1K37lzRzoMnaNn/n+nO+4/VccOahRTfoAitxU0Kf
 Ag9FjP1m7L7Gj+qZNKFuXnIKfD6NkCtiKnQnMlFSE/aRUTDkB/mJ4VM8aqm8BsJM/3Dq
 isXxdDfu44u54cHZ0QD21tcx4k0ZleQzphJz1hwgQwMhSLC0LnMy0bOw3VIDa7bae7Yt
 5ZjBNAHvraqyqMREnMZqVB5oRJBb1PKGjk0NUX2jZxNT7NyRMtCTgZ3f4+f9ielCFZnx
 5bMSQPQuqYH3L9hn1PzTRWjtvtz7LTUJbhEU185ZtC0N7jb1mlgYFo6CYSa6s3Ia9xov
 ZzMg==
X-Gm-Message-State: AOAM5320dT2M/IoPKK69+bbdILdGtjEAqcQJuVxuox95Iw8hqhyYjHvn
 xC+phQnyH2mFtFg0ny5VqnFTHw==
X-Google-Smtp-Source: ABdhPJxW4zWUSjNxU0vHYBhiZnFlHpPwbS+ySSeomdETBfumihXtUdaQ3wfWRkDnew3beTFhP1Ir1g==
X-Received: by 2002:a63:4a19:: with SMTP id x25mr3869629pga.202.1639763682258; 
 Fri, 17 Dec 2021 09:54:42 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e11sm8890404pjl.20.2021.12.17.09.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:54:41 -0800 (PST)
Subject: Re: [PULL v2 0/7] s390x patches (and one gitlab-CI fix)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211217144634.141481-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c83b4e3d-2ecb-f78e-135e-ed097e0a9a76@linaro.org>
Date: Fri, 17 Dec 2021 09:54:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211217144634.141481-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 6:46 AM, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit 29eb5c2c86f935b0e9700fad2ecfe8a32b011d57:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-12-16 08:39:20 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/s390x-2021-12-17
> 
> for you to fetch changes up to 9f8e6cad65a66b27e797defe639a4a4fd4330f23:
> 
>    gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices (2021-12-17 09:12:37 +0100)
> 
> ----------------------------------------------------------------
> * Small fixes for the s390x PCI code
> * Fix reset handling of the diag318 data
> * Ease timeout problem of the new msys2-64bit job
> 
> ----------------------------------------------------------------
> 
> v2: Dropped the patch that introced the new machine types
> 
> Christian Borntraeger (1):
>        MAINTAINERS: update email address of Christian Borntraeger
> 
> Collin L. Walling (1):
>        s390: kvm: adjust diag318 resets to retain data
> 
> Matthew Rosato (4):
>        s390x/pci: use a reserved ID for the default PCI group
>        s390x/pci: don't use hard-coded dma range in reg_ioat
>        s390x/pci: use the passthrough measurement update interval
>        s390x/pci: add supported DT information to clp response
> 
> Thomas Huth (1):
>        gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices
> 
>   .gitlab-ci.d/windows.yml        |  2 +-
>   .mailmap                        |  1 +
>   MAINTAINERS                     |  6 +++---
>   hw/s390x/s390-pci-bus.c         |  1 +
>   hw/s390x/s390-pci-inst.c        | 15 +++++++++------
>   hw/s390x/s390-pci-vfio.c        |  1 +
>   include/hw/s390x/s390-pci-bus.h |  3 ++-
>   include/hw/s390x/s390-pci-clp.h |  3 ++-
>   target/s390x/cpu.h              |  4 ++--
>   target/s390x/kvm/kvm.c          |  4 ++++
>   10 files changed, 26 insertions(+), 14 deletions(-)

Applied, thanks.

r~

