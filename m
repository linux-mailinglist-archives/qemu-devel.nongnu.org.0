Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8544077C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 06:46:30 +0200 (CEST)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mggGD-0007gb-IB
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 00:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mggER-0006z7-CQ
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 00:44:39 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mggEP-00072z-LY
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 00:44:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id a26so11072054pfr.11
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 21:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=v7ho//CG03QYWU9+XLdVo4PRpDBVAzcgwV+NA5BTjNw=;
 b=HtZrWNHNCfB8jbifLJ1heBjdeUp0HK2unyI4LmJkwnVIwq3tIg5slbrwvk4Zup4SZe
 l44uApJ9SHk3kXgdRIrNDIC5SeDCMusc2aKUZtuYjDXhlLambSUnvlRrAbmIsgh1ozmp
 HvVJS9O6UKLGUzT38XCrTtGIxhX9vmwt6f6qU6Sm/WVHgTX7rN+++TPocxnJleLo4NNw
 Y698k/u+G3XKRH8z61ysHpLJsz6GwS0Fc1xoxSy4iik8XX4k+fV+7x0DffsfQLwPOjgo
 Qd8dkfwWw6YqUX2Nmt2a8zaVTohAXDxo4cFhtTzUuo6TSTNd9bh4aaVgca1YyQBO0Z45
 mCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v7ho//CG03QYWU9+XLdVo4PRpDBVAzcgwV+NA5BTjNw=;
 b=tcNE2vUCFHVM8HFfhRZu8CjusVIiQgWXQZ2diLSf2KTEhDAJfbQoL1WCR7uxcQhvj5
 I+6RlfJ5TS9TjcWZBXCV2dqMTNTMjA4HtpQ1/vxh8eLKwMY3CKqkLuxJ88gu2TvfuDZp
 EFcP75200ZbDR/y3wPXOTOhVCG9BkX4biKEqxSXCbyRV2UdGw6m1fIPg8Qwg7ETs0UMB
 1cs6KmojYT/yH6wKVOoPXmluOYKd6E5SGCf+rlB2zAVNmq9M9whq9sDWg5EoYtaDD5KR
 7lDzXcsNunjvs/qjf+zx1Mk4oVaDiLwg1nrKXj+JeMTlAJ6Zau68XmUJxS1Ci1HchefC
 R4RQ==
X-Gm-Message-State: AOAM530Qzqzbtx87MzzKMyO7i50V4rJZACOQGZ3e+oa8MRLoqjLH0Xjf
 VQcWbmaC+hX0h2FU28n1iZkkeaG0hHIKmg==
X-Google-Smtp-Source: ABdhPJwVsbRZzhP0u4hLqHdtinMoxC95XzyWzMCGEsMLLuSK6foKZTeLAv2eNCgBW/CxAyb4RQ83dg==
X-Received: by 2002:a05:6a00:841:b0:47e:eef2:5796 with SMTP id
 q1-20020a056a00084100b0047eeef25796mr7255945pfk.66.1635569074965; 
 Fri, 29 Oct 2021 21:44:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id c3sm12255934pji.0.2021.10.29.21.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 21:44:34 -0700 (PDT)
Subject: Re: [PULL 0/9] QAPI patches patches for 2021-10-29
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211029193015.1312198-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f819273e-53d8-1371-6203-c7d6d3a84b90@linaro.org>
Date: Fri, 29 Oct 2021 21:44:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029193015.1312198-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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

On 10/29/21 12:30 PM, Markus Armbruster wrote:
> The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:
> 
>    Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-10-29
> 
> for you to fetch changes up to 57df0dff1a1f4c846aa74a082bfd595a8a990015:
> 
>    qapi: Extend -compat to set policy for unstable interfaces (2021-10-29 21:28:01 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2021-10-29
> 
> ----------------------------------------------------------------
> Markus Armbruster (9):
>        qapi: New special feature flag "unstable"
>        qapi: Mark unstable QMP parts with feature 'unstable'
>        qapi: Eliminate QCO_NO_OPTIONS for a slight simplification
>        qapi: Tools for sets of special feature flags in generated code
>        qapi: Generalize struct member policy checking
>        qapi: Generalize command policy checking
>        qapi: Generalize enum member policy checking
>        qapi: Factor out compat_policy_input_ok()
>        qapi: Extend -compat to set policy for unstable interfaces
> 
>   docs/devel/qapi-code-gen.rst            |   9 ++-
>   qapi/block-core.json                    | 123 +++++++++++++++++++++++---------
>   qapi/compat.json                        |   8 ++-
>   qapi/migration.json                     |  35 +++++++--
>   qapi/misc.json                          |   6 +-
>   qapi/qom.json                           |  11 +--
>   include/qapi/compat-policy.h            |   7 ++
>   include/qapi/qmp/dispatch.h             |   6 +-
>   include/qapi/util.h                     |   8 ++-
>   include/qapi/visitor-impl.h             |   6 +-
>   include/qapi/visitor.h                  |  17 +++--
>   monitor/misc.c                          |   7 +-
>   qapi/qapi-forward-visitor.c             |  20 +++---
>   qapi/qapi-util.c                        |  43 +++++++++++
>   qapi/qapi-visit-core.c                  |  41 +++++------
>   qapi/qmp-dispatch.c                     |  19 ++---
>   qapi/qmp-registry.c                     |   4 +-
>   qapi/qobject-input-visitor.c            |  22 +++---
>   qapi/qobject-output-visitor.c           |  13 +++-
>   storage-daemon/qemu-storage-daemon.c    |   3 +-
>   qapi/trace-events                       |   4 +-
>   qemu-options.hx                         |  20 +++++-
>   scripts/qapi/commands.py                |  12 ++--
>   scripts/qapi/events.py                  |  10 +--
>   scripts/qapi/gen.py                     |   8 +++
>   scripts/qapi/schema.py                  |  11 ++-
>   scripts/qapi/types.py                   |  22 +++---
>   scripts/qapi/visit.py                   |  14 ++--
>   tests/qapi-schema/qapi-schema-test.json |   7 +-
>   tests/qapi-schema/qapi-schema-test.out  |   5 ++
>   30 files changed, 355 insertions(+), 166 deletions(-)

Applied, thanks.

r~


