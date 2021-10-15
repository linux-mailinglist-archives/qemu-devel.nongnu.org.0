Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D484242FE60
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 00:52:12 +0200 (CEST)
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbW3f-00061k-IW
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 18:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbW1Z-0004iZ-JK
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 18:50:01 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbW1W-0007RR-HO
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 18:50:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id y1so7253689plk.10
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 15:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7iJttm38j+MoZIg99k7hRSQSFoKZFdI2Y4W4rCMka30=;
 b=kMH+L5GsyLcZb0TneJETw5MAuDU7rcNlQIuNCFT6NnWFNjQR3vltUPAVmWSb1aSF13
 hyQCN8SYk8dBcKjEg0A1WfbseEkijXH1U9tuvTucrzz3CuUembE7MoSDYz5Lm697qcPN
 fHF67Gm/get/mBCO/spssgICKa7fpYO5OZ2gZpaeehiL+nQUhDLG4pw+zEExLbzLGpSZ
 dwYXsbhoDEBGOhvEZYHP8pb+aJ13ZyOt73R5S+cf5ZdsWxYuN4wOTBpftGY2V2t7z66O
 fobkuLZGK6096ndLmfuPRjyNj1Uo1bLLSPZkG9vrghlSxE+8xyiA6FJbshsY/FlRhJMC
 eB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7iJttm38j+MoZIg99k7hRSQSFoKZFdI2Y4W4rCMka30=;
 b=tK6k2SV7dzdyHmfYwvZ6qGadl0+vaFCNV+zs1x8yHmKiqKAQR4iTxdcwbb7heCrIjq
 Hhw9q5JLteM7h0ic0T1Dun9i15bcaeQI1IjiRwJhttS89+QWdrLVbnBjpsIo+m5fsGQV
 Pw3SVRzlZLUcvVpVO+6pgtx+8Avq7We1ZyITp0wv4kv4t8SMJSkqD9Jwcgv+NdbMR+4+
 dAmNqznjVJiEtDcUspSTrQue6JWkumo9d0UVjX+HBGMkkTcsoQqmq0PNB9QWVy2F46HN
 QkgTE9ybNq/2p8h3Dw+NVjXdp6ComuAZfcJDZyibglX7SV09svW93ewfXzjgT0j3ej+1
 0ucw==
X-Gm-Message-State: AOAM532WBQdwGx7TGHlVvzU5zV8qdx94P9pWmv6UJjKZblytAJ8f5m+I
 R6o60SrhWPAKxLz0HH1hgK/AhcFxRAUZMg==
X-Google-Smtp-Source: ABdhPJy3k68oI+fd+p+9u4lm0mlfMH/ha4iTdCkeFSgbbsqwlUlYtVzruUiAy2DRjOiifDw1b2rX0Q==
X-Received: by 2002:a17:902:a414:b0:13e:45cd:1939 with SMTP id
 p20-20020a170902a41400b0013e45cd1939mr13236048plq.54.1634338195828; 
 Fri, 15 Oct 2021 15:49:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c12sm5702301pfc.161.2021.10.15.15.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 15:49:55 -0700 (PDT)
Subject: Re: [PULL 00/15] NBD patches through 2021-10-15
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20211015211011.1272011-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4703a4d1-aac5-15d5-395b-1dc0d77a85d2@linaro.org>
Date: Fri, 15 Oct 2021 15:49:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015211011.1272011-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 2:09 PM, Eric Blake wrote:
> The following changes since commit 253e399bab7c83b3411f8eac01840283a9304cb3:
> 
>    Merge remote-tracking branch 'remotes/kwolf/tags/for-upstream' into staging (2021-10-15 12:08:54 -0700)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-10-15
> 
> for you to fetch changes up to bec4042baefc1bfeae05b161aa17d2f57d526b60:
> 
>    block-backend: update blk_co_pwrite() and blk_co_pread() wrappers (2021-10-15 16:02:09 -0500)
> 
> [Still not included: Rich's patch for qemu-nbd --selinux-label]
> 
> ----------------------------------------------------------------
> nbd patches for 2021-10-15
> 
> - Vladimir Sementsov-Ogievskiy: Consistent use of 64-bit parameters in
>    block operations
> - Hanna Reitz: Silence 32-bit compiler warning
> 
> ----------------------------------------------------------------
> Hanna Reitz (1):
>        qcow2: Silence clang -m32 compiler warning
> 
> Vladimir Sementsov-Ogievskiy (14):
>        block-backend: blk_check_byte_request(): int64_t bytes
>        block-backend: make blk_co_preadv() 64bit
>        block-backend: convert blk_co_pwritev_part to int64_t bytes
>        block-backend: convert blk_co_pdiscard to int64_t bytes
>        block-backend: rename _do_ helper functions to _co_do_
>        block-coroutine-wrapper.py: support BlockBackend first argument
>        block-backend: drop blk_prw, use block-coroutine-wrapper
>        block-backend: convert blk_foo wrappers to use int64_t bytes parameter
>        block-backend: convert blk_co_copy_range to int64_t bytes
>        block-backend: convert blk_aio_ functions to int64_t bytes paramter
>        block-backend: blk_pread, blk_pwrite: rename count parameter to bytes
>        block-backend: drop INT_MAX restriction from blk_check_byte_request()
>        block-backend: fix blk_co_flush prototype to mention coroutine_fn
>        block-backend: update blk_co_pwrite() and blk_co_pread() wrappers
> 
>   scripts/block-coroutine-wrapper.py |  12 +-
>   block/coroutines.h                 |  33 ++++++
>   include/sysemu/block-backend.h     |  33 +++---
>   block/block-backend.c              | 237 ++++++++++++++++---------------------
>   block/qcow2-cluster.c              |   3 +-
>   block/trace-events                 |   4 +-
>   6 files changed, 169 insertions(+), 153 deletions(-)

Applied, thanks.

r~


