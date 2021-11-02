Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE7442B19
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:54:25 +0100 (CET)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqUq-0008GY-79
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqTV-0006wf-EO
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:53:01 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:40802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqTS-0003Rx-3r
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:53:01 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id b11so9532539qvm.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z6t4kOtgzqZI5hPsU//eau4A6xA48sQgFV0zbXdWxg8=;
 b=zYz964IyyOvRXpUkcwdYap2I0STWFRjSBj3zpmr8VJti3T3AkvDMPw+vHgg7rx4hQY
 /BuvvbwgMZ6Ohn/QipuTZHSa2z3+G1H7LLbd24wFgeG1m8UFIvf+xhFogxx6LNBiv9w0
 v9IDEMB7dqkDUYbHrintbMIYBKuLnuQxDscB41piPCVRYkoOZO6mpDEjTEPR8L3HysqR
 rpwCU0epQav0qO7gn2/JXWDRs3S+Y1t7NJHHde6Z3nXtJbXUJV3x4EQZFtnXT90AWiEg
 9nxRaKnANGfwRF+9LP1OZg0nCQbDy9gfXfxzoGQIR4KEAyKSu1rfN7OIDtJD8+Rlla7R
 OS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z6t4kOtgzqZI5hPsU//eau4A6xA48sQgFV0zbXdWxg8=;
 b=DQ+1aGZTMcKcaOjhFIQoX6s3URoXbtE/esOZzj6TtMkiKrk72SVA6dpGjaBxl8WNjP
 9hThUo0YK/zrnhdo3pIv/LoQo/Ozd9StTwFDWTbn1YsPhqetToCGbjQ/NlJM1AjFeMKQ
 0dKex1YhhCMrDLvxQ0ZN3CEhOonQWrh8VV5E678jtCANJnqYEnGx2o7KwG0V1CEJ5siD
 VAiZzrHd+yosQCKVHXIypupRmsfdP3org8tJO68QkG4810t7Nf5TGTzgf51v64AAlwZ2
 qppoxHRMbNMdH1FAV0aitJUHCc/XMX0g2nLUbU0krT5vy5N+ltZS+fdXJfl9xrCSyFcy
 Qxxw==
X-Gm-Message-State: AOAM531ZnctjGwa7KlrZSt9dzBz1EUWsq+E+MQp49nkYqYZv3JdbfpRO
 ++woAnxTE5w99OYKGCgYPq3VNA==
X-Google-Smtp-Source: ABdhPJzDSK8Qpmg7h6/q68TQ7IgvyBpn8rC6dtkN0X5KuXuuNgMdtL9NchgVjGkeOW3Z6vik2Rs0eQ==
X-Received: by 2002:a05:6214:2505:: with SMTP id
 gf5mr12426466qvb.55.1635846777074; 
 Tue, 02 Nov 2021 02:52:57 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id m68sm11826606qkb.105.2021.11.02.02.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 02:52:56 -0700 (PDT)
Subject: Re: [PULL 00/22] Python patches
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211101173006.656673-1-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a7c4667-0000-5fd1-5a89-df782c9396ce@linaro.org>
Date: Tue, 2 Nov 2021 05:52:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101173006.656673-1-jsnow@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 1:29 PM, John Snow wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> 
> for you to fetch changes up to 76cd358671e6b8e7c435ec65b1c44200254514a9:
> 
>    python, iotests: replace qmp with aqmp (2021-11-01 11:54:59 -0400)
> 
> ----------------------------------------------------------------
> Pull request
> 
> ----------------------------------------------------------------
> 
> John Snow (22):
>    iotests/297: Move pylint config into pylintrc
>    iotests/297: Split mypy configuration out into mypy.ini
>    iotests/297: Add get_files() function
>    iotests/297: Create main() function
>    iotests/297: Don't rely on distro-specific linter binaries
>    iotests/297: Split run_linters apart into run_pylint and run_mypy
>    iotests/297: refactor run_[mypy|pylint] as generic execution shim
>    iotests/297: Change run_linter() to raise an exception on failure
>    iotests/297: update tool availability checks
>    iotests/297: split test into sub-cases
>    iotests: split linters.py out from 297
>    iotests/linters: Add entry point for linting via Python CI
>    iotests/linters: Add workaround for mypy bug #9852
>    python: Add iotest linters to test suite
>    python/machine: remove has_quit argument
>    python/machine: Handle QMP errors on close more meticulously
>    python/aqmp: Remove scary message
>    iotests: Accommodate async QMP Exception classes
>    iotests: Conditionally silence certain AQMP errors
>    iotests/300: avoid abnormal shutdown race condition
>    python/aqmp: Create sync QMP wrapper for iotests
>    python, iotests: replace qmp with aqmp
> 
>   python/qemu/aqmp/__init__.py              |  12 --
>   python/qemu/aqmp/legacy.py                | 138 ++++++++++++++++++++++
>   python/qemu/machine/machine.py            |  85 +++++++++----
>   python/tests/iotests-mypy.sh              |   4 +
>   python/tests/iotests-pylint.sh            |   4 +
>   scripts/simplebench/bench_block_job.py    |   3 +-
>   tests/qemu-iotests/040                    |   7 +-
>   tests/qemu-iotests/218                    |   2 +-
>   tests/qemu-iotests/255                    |   2 +-
>   tests/qemu-iotests/297                    | 103 +++++++---------
>   tests/qemu-iotests/300                    |  13 +-
>   tests/qemu-iotests/iotests.py             |  20 +++-
>   tests/qemu-iotests/linters.py             | 105 ++++++++++++++++
>   tests/qemu-iotests/mypy.ini               |  12 ++
>   tests/qemu-iotests/pylintrc               |  16 +++
>   tests/qemu-iotests/tests/mirror-top-perms |  17 ++-
>   16 files changed, 424 insertions(+), 119 deletions(-)
>   create mode 100644 python/qemu/aqmp/legacy.py
>   create mode 100755 python/tests/iotests-mypy.sh
>   create mode 100755 python/tests/iotests-pylint.sh
>   create mode 100644 tests/qemu-iotests/linters.py
>   create mode 100644 tests/qemu-iotests/mypy.ini

Applied, thanks.

r~


