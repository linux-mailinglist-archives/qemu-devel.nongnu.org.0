Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D204761B8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:29:53 +0100 (CET)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZyK-00046x-Gi
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxZ5X-0000F5-1i
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:33:15 -0500
Received: from [2607:f8b0:4864:20::62f] (port=42994
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxZ5V-0000BR-8f
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:33:14 -0500
Received: by mail-pl1-x62f.google.com with SMTP id u17so17217026plg.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 10:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xenI9WIjz/qYzaVd4SsYjqdyXTEyiHmE5TyMiazNSVA=;
 b=YxbxTzPuC5l94ZoTs6ugQ0QaSe36R8QC4bYLNHce1nJkPOUpbNTX5K5FtRQXHlSQwp
 uWpWC1aYXm/iTDaGCTMAWG8w5LsaGJg4khfxQlMDWB/Shqscu57O4YPgGSebWfrpifog
 yk2SlREnyDTLPuMzVstbNvvnL21seJRyI6c0RAGxh/ISfk1pJsKBYVXI3pzI7nGP7S+V
 p0i8xS4mVaP0m1l5V1ep3LqIXoFja+Cum5Ym4q0kEK4V90FYqjmJhZbcAUai5KuFfQZr
 onAcX3MdA8mfY2sHZZ2bKhM1uDaj48uQwZVu64TWJWu83O8FIpz6ZNzBVLOGFjywqfrx
 /zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xenI9WIjz/qYzaVd4SsYjqdyXTEyiHmE5TyMiazNSVA=;
 b=et4Fyu5YVmzz9/geE0Sw60CBLcgIiJmh1uw3SYyFnc0xfaaRo8txBY1yd/HcnzsHkh
 NM4XVXdM7or7gVixT6JaXQvoYwGETXnUJIsYU9L42OULpmkaiKMZzyIsI80k9X7BSfYB
 r47cifkVo+2jwlpP44S/xSNFWG9/wzynwCXAO6ibuT9+/EFQVm9cHFk7iDLn3L47NW8I
 Y21BjlPUipHNAPXNNMzz/alTxkUOBjGcE1yXxoH/ZfVHLFNb1GeyUGW95hMSD1zgKdLW
 pfwtTDZhWaDYjsd8vB9qSjjkpVd3LFUKWEbSF1PdWyNUzeRUhbb/vfDkpUzdpUfy/tif
 li+A==
X-Gm-Message-State: AOAM532Q+JM1K7z4Uz60KTTFJxBhHIVGY6W+P0TioGbrruY5/BYysyL6
 tSC22lKC2TWm/tYLk/q3mYRHVw==
X-Google-Smtp-Source: ABdhPJyqkM55pg9MlaNLN8wlSPwkg6WuxgMnqQvdEaLI2iB5Mp5x7rkdmPab7JPGX6C3WtsNPRw4rQ==
X-Received: by 2002:a17:903:22d1:b0:148:a2f7:9d58 with SMTP id
 y17-20020a17090322d100b00148a2f79d58mr5584918plg.119.1639593191321; 
 Wed, 15 Dec 2021 10:33:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w37sm2923566pgk.87.2021.12.15.10.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 10:33:10 -0800 (PST)
Subject: Re: [PULL 00/18] Migration 20211214 patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211215103218.17527-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bba09d31-ce07-2d50-fe60-6077f87fe9d1@linaro.org>
Date: Wed, 15 Dec 2021 10:33:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 2:32 AM, Juan Quintela wrote:
> The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-14 12:46:18 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git tags/migration-20211214-pull-request
> 
> for you to fetch changes up to a5ed22948873b50fcf1415d1ce15c71d61a9388d:
> 
>    multifd: Make zlib compression method not use iovs (2021-12-15 10:38:34 +0100)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Hi
> 
> This are the reviewed patches for the freeze period:
> 
> - colo: fix/optimize several things (rao, chen)
> - shutdown qio channels correctly when an error happens (li)
> - serveral multifd patches for the zero series (me)
> 
> Please apply.
> 
> Thanks, Juan.
> 
> ----------------------------------------------------------------
> 
> Juan Quintela (12):
>    migration: Remove is_zero_range()
>    dump: Remove is_zero_page()
>    multifd: Delete useless operation
>    migration: Never call twice qemu_target_page_size()
>    multifd: Rename used field to num
>    multifd: Add missing documention
>    multifd: The variable is only used inside the loop
>    multifd: remove used parameter from send_prepare() method
>    multifd: remove used parameter from send_recv_pages() method
>    multifd: Fill offset and block for reception
>    multifd: Make zstd compression method not use iovs
>    multifd: Make zlib compression method not use iovs
> 
> Li Zhang (1):
>    multifd: Shut down the QIO channels to avoid blocking the send threads
>      when they are terminated.
> 
> Rao, Lei (3):
>    migration/ram.c: Remove the qemu_mutex_lock in colo_flush_ram_cache.
>    Fixed a QEMU hang when guest poweroff in COLO mode
>    COLO: Move some trace code behind qemu_mutex_unlock_iothread()
> 
> Zhang Chen (2):
>    migration/colo: More accurate update checkpoint time
>    migration/colo: Optimize COLO primary node start code path
> 
>   include/migration/colo.h |  1 +
>   migration/multifd.h      |  6 ++--
>   dump/dump.c              | 10 +-----
>   migration/colo.c         | 33 ++++++++++++++-----
>   migration/migration.c    | 26 +++++++++------
>   migration/multifd-zlib.c | 48 +++++++++++++--------------
>   migration/multifd-zstd.c | 47 ++++++++++++---------------
>   migration/multifd.c      | 70 +++++++++++++++++++++-------------------
>   migration/ram.c          | 11 ++-----
>   migration/savevm.c       |  5 +--
>   10 files changed, 131 insertions(+), 126 deletions(-)

Applied, thanks.

r~


