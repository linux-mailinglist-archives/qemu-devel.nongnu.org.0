Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B47560D1A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 01:20:37 +0200 (CEST)
Received: from localhost ([::1]:56860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6gz6-0001Mr-Ig
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 19:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6gxG-0000WK-2J
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:18:42 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6gxE-0002YR-9j
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:18:41 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 9so16747683pgd.7
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DYS3nKmOv5GYeFugMgsH3EnP6HeIRHMVj5MkVJ8qeeA=;
 b=W3Dl5qQd8tN7Al+fUFT+ZNQZaLA2C3m9HMXgwwT9JBWRU0ri2GyFh5NvvQ2DYfcDdH
 3MkSfB7TJt91bILGI89jwQXqTiALPDEu5hWD7k+jsInyD7VhQ6YJzWpF0dbP+337ZdDS
 iuhwTsu7xL+wdVNbml0zQFjB3AaxPywzcwtDRY+kYMd+mHeAGKMiqCKuk5TFI2ZXWJJM
 H8F/DHagb/72ktVl/XyJJi0Gg4hxGcv1/LaX+o05ITQT13L7zrYZqqlQO+wPIsRZ5cKL
 62ggYBotb+kdGZ5vsKsOXJe8Ftjypiv72d6RGuL0OweJOxUhdOil5d+uMLqTagtMdEYZ
 ecdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DYS3nKmOv5GYeFugMgsH3EnP6HeIRHMVj5MkVJ8qeeA=;
 b=7gNXtQ2f3a1pq1iZInNn5L56upoL9A7xwM35KmvdA63LxwR17GcSBY0IY4wv2TVCwY
 GVnW4ip5HPEE6RMqeLyDepzpdQYkNu7CPVu8xspDLUuoqTDQvISJQ16zhKLz3B15/s9K
 MqnYVjWmzBSnI6xP+H8kVXuNAXp75sC5+nFNTma33lYKaBNjQfj24j653BMfP51JZ7zN
 XoV15LtcURnjDdvUuzpDot6wGW85c6Phbo6OVfnfpzUR2IuCYEXeyH89MF24u2v9uEoj
 1WffvrpkLzf0Uq5ICoBHldq1bXNdT06iSLRVwan61ZtyiSCQdRg/kdAFTB4SS3BKvQM6
 CM4A==
X-Gm-Message-State: AJIora/RG3yPC7B6UPFtPJnD8nPqfwvDqx3sc1BNE9N82mlo/fwOO6o6
 C9jJcdNW3jo1ODma9I/XfuxTjg==
X-Google-Smtp-Source: AGRyM1tPLPz+jDAGC/iNIsE3D32rCKZ2ef6HRTqeUYmg6GqJQMg22VjeOPMyMQfwpMMyXVj63y2omA==
X-Received: by 2002:a63:6806:0:b0:3fc:3b43:52d5 with SMTP id
 d6-20020a636806000000b003fc3b4352d5mr4945917pgc.319.1656544718195; 
 Wed, 29 Jun 2022 16:18:38 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170902758200b0016a058b7547sm11743554pll.294.2022.06.29.16.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 16:18:37 -0700 (PDT)
Message-ID: <230922ea-a0ae-06f3-af17-0964dabd13fa@linaro.org>
Date: Thu, 30 Jun 2022 04:48:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL v2 0/9] Block jobs & NBD patches
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, peter.maydell@linaro.org
References: <20220629081517.446432-1-vsementsov@yandex-team.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220629081517.446432-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/22 13:45, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit ad4c7f529a279685da84297773b4ec8080153c2d:
> 
>    Merge tag 'pull-semi-20220628' of https://gitlab.com/rth7680/qemu into staging (2022-06-28 10:24:31 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-06-14-v2
> 
> for you to fetch changes up to 1b8f777673985af366de099ad4e41d334b36fb12:
> 
>    block: use 'unsigned' for in_flight field on driver state (2022-06-29 10:57:02 +0300)
> 
> ----------------------------------------------------------------
> Block jobs & NBD patches
> 
> v2: - add arguments to QEMUMachine constructor in test, to make it work
>        on arm in gitlab pipeline
>      - use bdrv_inc_in_flight() / bdrv_dec_in_flight() instead of direct
>        manipulation with bs->in_flight

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> - add new options for copy-before-write filter
> - new trace points for NBD
> - prefer unsigned type for some 'in_flight' fields
> 
> Denis V. Lunev (2):
>    nbd: trace long NBD operations
>    block: use 'unsigned' for in_flight field on driver state
> 
> Vladimir Sementsov-Ogievskiy (7):
>    block/copy-before-write: refactor option parsing
>    block/copy-before-write: add on-cbw-error open parameter
>    iotests: add copy-before-write: on-cbw-error tests
>    util: add qemu-co-timeout
>    block/block-copy: block_copy(): add timeout_ns parameter
>    block/copy-before-write: implement cbw-timeout option
>    iotests: copy-before-write: add cases for cbw-timeout option
> 
>   block/block-copy.c                            |  33 ++-
>   block/copy-before-write.c                     | 110 ++++++---
>   block/mirror.c                                |   2 +-
>   block/nbd.c                                   |   8 +-
>   block/trace-events                            |   2 +
>   include/block/block-copy.h                    |   4 +-
>   include/qemu/coroutine.h                      |  13 ++
>   nbd/client-connection.c                       |   2 +
>   nbd/trace-events                              |   3 +
>   qapi/block-core.json                          |  31 ++-
>   tests/qemu-iotests/pylintrc                   |   5 +
>   tests/qemu-iotests/tests/copy-before-write    | 216 ++++++++++++++++++
>   .../qemu-iotests/tests/copy-before-write.out  |   5 +
>   util/meson.build                              |   1 +
>   util/qemu-co-timeout.c                        |  89 ++++++++
>   15 files changed, 482 insertions(+), 42 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/copy-before-write
>   create mode 100644 tests/qemu-iotests/tests/copy-before-write.out
>   create mode 100644 util/qemu-co-timeout.c
> 


