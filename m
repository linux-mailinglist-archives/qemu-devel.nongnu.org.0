Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC947E869
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 20:36:42 +0100 (CET)
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0TtI-0001dk-VS
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 14:36:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Tpd-0008D8-Bm
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 14:32:53 -0500
Received: from [2607:f8b0:4864:20::102f] (port=50818
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Tpb-0003Er-J5
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 14:32:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id gj24so5857668pjb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 11:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gxzV4ZI2JwC7JyDTd8y0bRKbj6p0HkOgXpQx5d9yJmI=;
 b=yKyKGuMAcZfuXi4YDwOfG5kCkFtT9bZiftubV/w+y8UVw18rIinGii2StkjcPITTMC
 b1SUpSQjFvN/1QTYmnLm2tO6XFLLOY4WGrpgbmf0rsMWOT5SKFfawrSbqUQZIeC/Gb8S
 0PyrBOt6yS8OwcFbsgpfcxlSgIFP9jFBfoHg6l1eYfA7ZquRD4g395amZJdc7B1JAEZ+
 kgSB5TGiH8luIb+CJfeY1PSroZmQFKIt2a9RXEix25z6s4qa679H8hW6rrNk3LAiHW08
 zLzmXEUyppq9x456dOlgqMCEpQGOEdcveyJl2C1QPEIVET7D2uRvOxkT+CFd5CJf1Em5
 P2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gxzV4ZI2JwC7JyDTd8y0bRKbj6p0HkOgXpQx5d9yJmI=;
 b=LWHGLwKKrYWGmdzhHQGStcDASSci0G/HGLhHV7+lSBFg1LbssklSqaeMonFt/Di72I
 wDXIjx2xoYT/QKYIH0lrvncaMRS3bmuYxYvp/ZK0w+qvCgiByW4l5rrsxUX4u2dSWz0e
 96JWeZ5fAdODYbuuE4G4x5JCKcm+MvCZT/1DT/kTBJmQPQ0RlzOH4ZzQLBtfh18r+05x
 +zQzYet6KwwCX4u/RmeEpKhB0QBaeDcdNH3kZXWTSlCw/O35Z9ExNVWEvIOcNiD+8eWg
 k6eN8ZrbLytF4gOO6Lqecqzn9VJiitBdGXS6Y0JQUhNwfKRk81ppSE9nUI1hTdlwQmHk
 Nnhg==
X-Gm-Message-State: AOAM5321TxupmVLZSpznSYgU47TI6jcTu8KFQkx7GZcdlUpcAmj4Xrzf
 beVYC0uh0yWFDHV8ah55wYbl0FsNp3Q6SA==
X-Google-Smtp-Source: ABdhPJy4OVR2jFGCs1Tl/wdN4xGDa9nY9a9KFNTNwzNSfyhyw8ASPS7OYVqs2al94vC8QVhCsX8T+A==
X-Received: by 2002:a17:90b:1d81:: with SMTP id
 pf1mr4399127pjb.42.1640287970257; 
 Thu, 23 Dec 2021 11:32:50 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id cx5sm6004058pjb.22.2021.12.23.11.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 11:32:49 -0800 (PST)
Subject: Re: [PULL v2 0/7] NBD patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211223085309.511450-1-vsementsov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f96013c0-f36a-18ae-cbb3-ce2bd7379a07@linaro.org>
Date: Thu, 23 Dec 2021 11:32:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211223085309.511450-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: peter.maydell@linaro.org, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 12:53 AM, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:
> 
>    Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)
> 
> are available in the Git repository at:
> 
>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-12-22-v2
> 
> for you to fetch changes up to ab7f7e67a7e7b49964109501dfcde4ec29bae60e:
> 
>    iotests: add nbd-reconnect-on-open test (2021-12-23 09:40:34 +0100)
> 
> ----------------------------------------------------------------
> nbd: reconnect-on-open feature
>    v2: simple fix for mypy and pylint complains on patch 04
> 
> ----------------------------------------------------------------
> 
> Vladimir Sementsov-Ogievskiy (7):
>    nbd: allow reconnect on open, with corresponding new options
>    nbd/client-connection: nbd_co_establish_connection(): return real
>      error
>    nbd/client-connection: improve error message of cancelled attempt
>    iotests.py: add qemu_tool_popen()
>    iotests.py: add and use qemu_io_wrap_args()
>    iotests.py: add qemu_io_popen()
>    iotests: add nbd-reconnect-on-open test
> 
>   qapi/block-core.json                          |  9 ++-
>   block/nbd.c                                   | 45 +++++++++++-
>   nbd/client-connection.c                       | 59 ++++++++++-----
>   tests/qemu-iotests/iotests.py                 | 37 ++++++----
>   .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
>   .../tests/nbd-reconnect-on-open.out           | 11 +++
>   6 files changed, 200 insertions(+), 32 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
>   create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

Applied, thanks.

r~


