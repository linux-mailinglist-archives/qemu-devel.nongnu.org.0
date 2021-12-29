Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0A4817CF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 00:51:44 +0100 (CET)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ijP-0002jY-50
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 18:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n2iiP-00024W-Qb
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 18:50:41 -0500
Received: from [2607:f8b0:4864:20::62a] (port=40537
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n2iiO-0007gm-39
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 18:50:41 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l15so2029650pls.7
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 15:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uq5qA18YWuVaw3mKk8soeGxJhCNO0cpAmFFVyATnO30=;
 b=csfKoe15COipLaCJTpKgLhYmJENiIbMfsSOJ3HgBsyin5rronfqFypkI805P2l3PQg
 IObxlSip4Z2fzYQnQ+HIC0yuo5YxloIVQWv7s27EmeYSheMuHTQzl4O9cSmq4BkNKwF3
 6vT7Q0HuGUBFqxBZ2mNcML9CdOUEp+IUIZO6yEeFycpcK66ALY2E5XnGs3RpIoNukuHf
 LC3LG8kl8MsDj1he73JZR4pHozh0h7bd9Ler8x99OKwP+I/wC2JvqBAfEny7QZ0ZKBCl
 +yfBnyA/5uAQzohtGTHw90uNd3cewf9V4WtOSLNX4blyxM8QI+I39S/u1XyFvYLeCF10
 O6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uq5qA18YWuVaw3mKk8soeGxJhCNO0cpAmFFVyATnO30=;
 b=M5Wlman3jWtyHUkOD+3W7JwS3I4droq4T9bFBwBrqlj0ekh3puPQyA9rKqdVPhykXh
 Gb+4MUf6ivqskI8BJP3bPRMAgoNkVJ7CBsA/kKBbs6xk2k6YqwyuEIk5SUTK8XBanILh
 ozMeuTiKUBrAl5a7UT2VI4wPAo+tyZ5q0LUF3bqh+YzqTXnvVJ7jjxWQiMltIyetb+Vq
 JmKq+Cc8kNDLtzOZMTdfx4Nn54kTEHLmkM0lFQ3szkAnfeAc5D1s8kAkzQS7EeeDLhBi
 zrdHdVPJK8E7Xvf81732H0exzL+UjMdmw1ffiWd8JNNfvbOM0IoKLJ8c0LguTRyLUxFv
 VMcw==
X-Gm-Message-State: AOAM531/RUrmFghFScUoxYa0z/lEXN0l9bKUz/bFTvWYE09WRarTH+9P
 6/er1Xtb5Dqwr1NjeZSO1jWEMw==
X-Google-Smtp-Source: ABdhPJxSu8pG/tgtCYks+5AfS1nHCjxl0JqCezp3xh+/+zzXfFsS8sMK5oYsAA8dFjLd28E5NiDMyg==
X-Received: by 2002:a17:902:8b89:b0:149:9c7d:2fb6 with SMTP id
 ay9-20020a1709028b8900b001499c7d2fb6mr5649724plb.68.1640821838674; 
 Wed, 29 Dec 2021 15:50:38 -0800 (PST)
Received: from [172.16.1.241] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id c6sm3302371pfv.62.2021.12.29.15.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 15:50:38 -0800 (PST)
Subject: Re: [PULL 0/6] Block jobs patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf29fad2-c22d-bc04-0622-b17441c72934@linaro.org>
Date: Wed, 29 Dec 2021 15:50:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, hreitz@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/21 11:21 AM, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit 89f3bfa3265554d1d591ee4d7f1197b6e3397e84:
> 
>    Merge tag 'pull-pa-20211223' of https://gitlab.com/rth7680/qemu into staging (2021-12-23 17:53:36 -0800)
> 
> are available in the Git repository at:
> 
>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-jobs-2021-12-29
> 
> for you to fetch changes up to 985cac8f200443ad952becc03b07c51ff4f80983:
> 
>    blockjob: drop BlockJob.blk field (2021-12-28 15:18:59 +0100)
> 
> ----------------------------------------------------------------
> Jobs patches:
>   - small fix of job_create()
>   - refactoring: drop BlockJob.blk field
> 
> ----------------------------------------------------------------
> 
> Emanuele Giuseppe Esposito (1):
>    job.c: add missing notifier initialization
> 
> Vladimir Sementsov-Ogievskiy (5):
>    blockjob: implement and use block_job_get_aio_context
>    test-blockjob-txn: don't abuse job->blk
>    block/stream: add own blk
>    test-bdrv-drain: don't use BlockJob.blk
>    blockjob: drop BlockJob.blk field
> 
>   include/block/blockjob.h       | 10 +++++++---
>   block/mirror.c                 |  7 -------
>   block/stream.c                 | 24 +++++++++++++++++------
>   blockdev.c                     |  6 +++---
>   blockjob.c                     | 36 ++++++++++++++++------------------
>   job.c                          |  1 +
>   qemu-img.c                     |  2 +-
>   tests/unit/test-bdrv-drain.c   | 12 ++++++++----
>   tests/unit/test-blockjob-txn.c | 10 +---------
>   tests/qemu-iotests/141.out     |  2 +-
>   tests/qemu-iotests/283         |  3 ++-
>   tests/qemu-iotests/283.out     |  2 +-
>   12 files changed, 60 insertions(+), 55 deletions(-)

Applied, thanks.


r~


