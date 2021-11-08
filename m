Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD23D449819
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:24:01 +0100 (CET)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6V6-0005WQ-N7
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6TJ-0003fw-Rv
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:22:11 -0500
Received: from [2a00:1450:4864:20::329] (port=50920
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6TG-0006Q3-AO
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:22:08 -0500
Received: by mail-wm1-x329.google.com with SMTP id 133so13354542wme.0
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F8mIQtKKaGs24RX9J3zdnVpevwA0ZmQUcEutwkbVk3E=;
 b=u2cAo9MbRHV3qkjwaUoELFi5VfRRjcMaUJnpnM/oRv+ABV+++DRAQOYgsjKczksUsz
 f9Be38NHO3JT+9oOVJRtqqER0v5gppCS1KM51dqlEIwOHYI0RT+ORdZJ2DVjnYbp0+hl
 qWvXXAIFk6DsBJeq6I9mz7L5cEUjuRslyu5uChMRhyFkgCCL9EPUGmdmvUKci8pNk8cF
 ClgJ6OEYud03f6z5cuTfMrGykNtQK+y24qcgBhvYcQmWNcCvkq39fvkVMyfKcZkdCw7M
 v94wsDYs7nYYEq1hcoY0LfrU3PYkHtUSpb9/squ8emIkXGDO8tKAo7TJO7fCPyIXqX7k
 a+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F8mIQtKKaGs24RX9J3zdnVpevwA0ZmQUcEutwkbVk3E=;
 b=GaNRcHac658kp1fGq+BidUajZ53Fqg3mYNS+4WxGRxjq7rtc2LRhnolFZlfrRmW3AT
 Mb3ctPMhbd9AazzUmfLA8vh4wsIVpkbJ/kI4ysf8UnaQcfXI4JlpDbyskSj1r9gC47Yg
 pTDxGiO3u5seNz7i3eNOsz6LcSr9MxpNNU4UZ/QgJEFzw9Q+kgbb9m8O6UZgspIdt/oU
 w36smZbRlNu5w5c5YSTzuNZ2yKG57FsqLABP9ox1blRWqSpzecGrN5rLXHvhZQFwAir+
 hTok/UmY50Qj2bETCxPm+YxlyQ6n8kXZKW5E6Vf/etHlSt2NT4sIeLq9ih/Kw8OWodKh
 JBGA==
X-Gm-Message-State: AOAM530/tkV3Xbbr3n/CSrFJWtpaORBB9Yk0IAYROWgSyC6qAzHBB0Or
 HKWmysRAJFtC+upgFkgDOW8czA==
X-Google-Smtp-Source: ABdhPJyYipvZpHoKj1Ns4JbdDAtCCEWUfTd+7r7sD6f/q8j1eTeJviOEozhOzCTdD7q4XzHXAikheg==
X-Received: by 2002:a1c:5409:: with SMTP id i9mr93069wmb.146.1636384924610;
 Mon, 08 Nov 2021 07:22:04 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id g5sm17942034wri.45.2021.11.08.07.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:22:04 -0800 (PST)
Subject: Re: [PULL v2 00/11] Sphinx patches
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211108090155.371357-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87e15aca-8226-2ef5-f59b-2e69c268d032@linaro.org>
Date: Mon, 8 Nov 2021 16:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108090155.371357-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 10:01 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit 63ed851de474b1e2458cb9b4ba6e02a88f72c25c:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211106-pull-request' into staging (2021-11-06 19:43:42 -0400)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/sphinx-pull-request
> 
> for you to fetch changes up to c11b3a1dd324d1f7dc8512bb840ffd8226fbd0a7:
> 
>    docs/sphinx: change default role to "any" (2021-11-08 12:27:23 +0400)
> 
> ----------------------------------------------------------------
> Some Sphinx improvements
> 
> PR for 2 series:
> https://patchew.org/QEMU/20211015105344.152591-1-marcandre.lureau@redhat.com/
> https://patchew.org/QEMU/20211004215238.1523082-1-jsnow@redhat.com/
> 
> ----------------------------------------------------------------
> 
> John Snow (3):
>    docs: remove non-reference uses of single backticks
>    docs: (further) remove non-reference uses of single backticks
>    docs/sphinx: change default role to "any"
> 
> Marc-André Lureau (8):
>    docs/sphinx: add loaded modules to generated depfile
>    docs/sphinx: add static files to generated depfile
>    docs/sphinx: add templates files to generated depfile
>    tests/qapi-schema/meson: add depfile to sphinx doc
>    meson: drop sphinx_extn_depends
>    meson: drop sphinx_template_files
>    docs/sphinx: set navigation_with_keys=True
>    docs/sphinx: add 's' keyboard binding to focus search
> 
>   docs/conf.py                           | 12 +++++++++++-
>   docs/devel/build-system.rst            | 16 ++++++++--------
>   docs/devel/fuzzing.rst                 |  9 +++++----
>   docs/devel/tcg-plugins.rst             |  2 +-
>   docs/interop/live-block-operations.rst |  2 +-
>   docs/meson.build                       | 10 ----------
>   docs/sphinx-static/custom.js           |  9 +++++++++
>   docs/sphinx/depfile.py                 | 19 +++++++++++++++++--
>   docs/system/guest-loader.rst           |  2 +-
>   docs/system/i386/sgx.rst               |  6 +++---
>   qapi/block-core.json                   |  4 ++--
>   include/qemu/module.h                  |  6 +++---
>   qemu-options.hx                        |  4 ++--
>   tests/qapi-schema/meson.build          |  4 +++-
>   14 files changed, 66 insertions(+), 39 deletions(-)
>   create mode 100644 docs/sphinx-static/custom.js

Applied, thanks.


r~

