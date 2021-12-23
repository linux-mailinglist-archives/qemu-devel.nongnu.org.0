Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E6F47DE31
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 05:06:41 +0100 (CET)
Received: from localhost ([::1]:58510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0FNH-00010Q-Db
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 23:06:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0FMG-0000Bz-9J
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 23:05:36 -0500
Received: from [2607:f8b0:4864:20::636] (port=35680
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0FME-0006wA-FY
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 23:05:35 -0500
Received: by mail-pl1-x636.google.com with SMTP id n16so3380906plc.2
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 20:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3r2ZZ5Oi+OfE7ePYdYhNI4RjhlZ+o2ch218/hb5AVGI=;
 b=caHyJ3hL/xdsHhK8Y488QpHkCQnhpFdDnmuGTp1mSCoE8SYsDQbY7PATo1p6/uKCnF
 TE4Yh4fwr5AlAZC1KHITzcmialJKJfXEFfRVLnl6YY3QJvJO7dKddlH9ySSvh0Jp0kw8
 n3t8UOZLWGCGjpXS7jDAM1EZHipsgoqwasWhXp9jXJ1qN4ASrLeBUP5ruBUD2Ic9WlLe
 FI6UCO1Vl+57I3A2fXwQl+XQtp+PmKwb3LQJxAYXf+fSrq+2eEHp8QTb/B/Dp3LcPKsF
 BF6x2EhjcKOFYiYO/KkVs55GsQeIek89tcBxtG+V5K3fgPLmwf7XI1lc47z1i1VsHv9k
 vfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3r2ZZ5Oi+OfE7ePYdYhNI4RjhlZ+o2ch218/hb5AVGI=;
 b=Rm5McXA4DZ62dv+DE5irGbBe98xQRjX6M55s7yzDYO9OnuqtMRqHHHet5ye3JwYOgu
 5HgDXqX/DPeal8II8/GGQWfy9CwPuWIODb8jnVnMiwlNnyVO4fbTVcS8UCOEWCb7lCmh
 nViM15sx60tbyRtZ/VN9h48JYR+D+ICG0qntKQv6WzaCEIgK5Xs63zmMpdeg7Dtej68F
 eB8BaN/tjux779DhyR3leZtTwjCHzftO/Tpf6kAcdBgyzNtK4FKTth05QILWvpTg9VuR
 0wUen5pJlUGnQPxmunADU4kEF/fJ1tuWQoEzIch3nRO4w0W7WbC9wt/gtE8ySYSU0dAJ
 mP5w==
X-Gm-Message-State: AOAM532ykIsWt1Uxt9CvWEF4zjLhKNIpvM0Y8GX84NDnLaHa1RQdvalA
 uD8l3eh/Ag7razDUS3SVX2Ry45rCnbaapA==
X-Google-Smtp-Source: ABdhPJy8LdaTDvbEZaeEa/k6M0oJs3uOieSFNhpwhS41k4ucjWWBGoQAcbPuUwrceZOksHjk97g/0g==
X-Received: by 2002:a17:902:f242:b0:148:b5e5:22c7 with SMTP id
 j2-20020a170902f24200b00148b5e522c7mr766405plc.119.1640232332811; 
 Wed, 22 Dec 2021 20:05:32 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id h5sm162010pjc.27.2021.12.22.20.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 20:05:32 -0800 (PST)
Subject: Re: [PULL 0/7] NBD patches
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222185248.466010-1-vsementsov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6b9f2b47-5b48-e678-109f-dc0b2a2d9a60@linaro.org>
Date: Wed, 22 Dec 2021 20:05:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222185248.466010-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: peter.maydell@linaro.org, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 10:52 AM, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit 2bf40d0841b942e7ba12953d515e62a436f0af84:
> 
>    Merge tag 'pull-user-20211220' of https://gitlab.com/rth7680/qemu into staging (2021-12-20 13:20:07 -0800)
> 
> are available in the Git repository at:
> 
>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-12-22
> 
> for you to fetch changes up to 7f82e44de82ae1eb09c4202fd8282c8c0a0a9b4e:
> 
>    iotests: add nbd-reconnect-on-open test (2021-12-21 14:56:25 +0100)
> 
> ----------------------------------------------------------------
> nbd: reconnect-on-open feature
> 
> ----------------------------------------------------------------
> Vladimir Sementsov-Ogievskiy (7):
>        nbd: allow reconnect on open, with corresponding new options
>        nbd/client-connection: nbd_co_establish_connection(): return real error
>        nbd/client-connection: improve error message of cancelled attempt
>        iotests.py: add qemu_tool_popen()
>        iotests.py: add and use qemu_io_wrap_args()
>        iotests.py: add qemu_io_popen()
>        iotests: add nbd-reconnect-on-open test
> 
>   qapi/block-core.json                               |  9 +++-
>   block/nbd.c                                        | 45 +++++++++++++++-
>   nbd/client-connection.c                            | 59 +++++++++++++++------
>   tests/qemu-iotests/iotests.py                      | 36 ++++++++-----
>   tests/qemu-iotests/tests/nbd-reconnect-on-open     | 71 ++++++++++++++++++++++++++
>   tests/qemu-iotests/tests/nbd-reconnect-on-open.out | 11 ++++
>   6 files changed, 199 insertions(+), 32 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
>   create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

This produces new failures:

https://gitlab.com/qemu-project/qemu/-/jobs/1914712427


r~

