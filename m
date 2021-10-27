Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBCD43D192
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:21:55 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoUk-0003Nf-9y
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfnkn-00072i-F7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:34:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfnkl-0007FL-R7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:34:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id e65so3788286pgc.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NGYo1P8+sYF+8eQptr56mIbTD6pg3aaZjhifBmFax48=;
 b=UjF1OxjuxQsdk2LyFUQSL/rxipy8rTVjv1Jm1jyd/3+wVN8hUvyZds04Ln/JkqaxXc
 dbuWGKnCfmVeicLkaIQI6IQXIwbYBpwGH3A70L4AgCL/VLiyzCmk1xxnDLTfSiERs8W8
 e9WAdP2OwAB4tqiLTdbkJXaJMJIQX4lv9isrIuX4uEICSN2xtSm35/DU/NkWOb2P8Maa
 VQ9soIa3p+bGlZeIqQQjy76B7E4zWXiUu7gwoKsF1RrO93hpy5J4P4gDFGuIsmS5REOl
 2g9xh7kOzS1E2AIMEF6G/SvnUqcGqxiHgJAfqiWFsEIwsHElineoXVY8Xsee1NUAnrBP
 dBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NGYo1P8+sYF+8eQptr56mIbTD6pg3aaZjhifBmFax48=;
 b=RCK60FuvtALu+uNRLfVZMsV2eTkgstrwvR4vZu32xoB4SXuBlmkW8BfM5ggtQXnSpL
 ILEhqVULo/wXkBFGwe+4WcyeeMfO0LRaL0ptAHjS1Res2/alCiM3C8ts1axO9o7tV9z3
 qoDzBcBAPOm57IJ+oBBO/kJvPkXC/LWUxHZXl/JbUx12iuz8TiBrbMPXRP/tlcFtm64L
 ZhZNcgRvWj62To7D6NolaYjRmM5SDmdxCqLTexezFxXKwMRqXIbBgJT59kUxmq6gxnUM
 BPFqdUVKqLBHt9OWMR4ii22Hwt30DuONYYC29a8vm4O0OKgQX3ObtYvzulTyZENV1889
 dgxQ==
X-Gm-Message-State: AOAM533gD2TZrMk07WXy4Ap1ysAodlo3k3o+56s4v21QTZVZm+XA2HNh
 fNCnumlvkq+SfgomPOnBsziNZT6UpK7PHA==
X-Google-Smtp-Source: ABdhPJy5cD0EIQyef5yPCym/MMs6tnUHTUWtpLM68siAByEdWnmJTXBwDLNWVuc9S0iUdmyHNl+DcA==
X-Received: by 2002:a63:e613:: with SMTP id g19mr25709268pgh.12.1635359661982; 
 Wed, 27 Oct 2021 11:34:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s20sm629417pfk.131.2021.10.27.11.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 11:34:21 -0700 (PDT)
Subject: Re: [PULL 0/5] QAPI patches patches for 2021-10-27
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211027154407.214122-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22757d5e-1693-2c53-a3e4-81eb62262594@linaro.org>
Date: Wed, 27 Oct 2021 11:34:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027154407.214122-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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

On 10/27/21 8:44 AM, Markus Armbruster wrote:
> The following changes since commit 931ce30859176f0f7daac6bac255dae5eb21284e:
> 
>    Merge remote-tracking branch 'remotes/dagrh/tags/pull-virtiofs-20211026' into staging (2021-10-26 07:38:41 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-10-27
> 
> for you to fetch changes up to aa2370444b62f8f9a809c024d0c41cb40658a5c3:
> 
>    qapi: Implement deprecated-input={reject,crash} for enum values (2021-10-27 17:19:34 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2021-10-27
> 
> ----------------------------------------------------------------
> Markus Armbruster (5):
>        qapi: Improve input_type_enum()'s error message
>        qapi: Enable enum member introspection to show more than name
>        qapi: Add feature flags to enum members
>        qapi: Move compat policy from QObject to generic visitor
>        qapi: Implement deprecated-input={reject,crash} for enum values
> 
>   docs/about/deprecated.rst                      |  6 ++++++
>   docs/devel/qapi-code-gen.rst                   | 29 ++++++++++++++++++-------
>   qapi/compat.json                               |  3 +++
>   qapi/introspect.json                           | 28 ++++++++++++++++++++++--
>   include/qapi/qobject-input-visitor.h           |  4 ----
>   include/qapi/qobject-output-visitor.h          |  4 ----
>   include/qapi/util.h                            |  6 +++++-
>   include/qapi/visitor-impl.h                    |  3 +++
>   include/qapi/visitor.h                         |  9 ++++++++
>   qapi/qapi-visit-core.c                         | 30 ++++++++++++++++++++++----
>   qapi/qmp-dispatch.c                            |  4 ++--
>   qapi/qobject-input-visitor.c                   | 14 +-----------
>   qapi/qobject-output-visitor.c                  | 14 +-----------
>   tests/unit/check-qom-proplist.c                |  2 +-
>   scripts/qapi/expr.py                           |  3 ++-
>   scripts/qapi/introspect.py                     | 19 ++++++++++++----
>   scripts/qapi/schema.py                         | 22 +++++++++++++++++--
>   scripts/qapi/types.py                          | 17 ++++++++++++++-
>   tests/qapi-schema/doc-good.json                |  5 ++++-
>   tests/qapi-schema/doc-good.out                 |  3 +++
>   tests/qapi-schema/doc-good.txt                 |  3 +++
>   tests/qapi-schema/enum-dict-member-unknown.err |  2 +-
>   tests/qapi-schema/qapi-schema-test.json        |  3 ++-
>   tests/qapi-schema/qapi-schema-test.out         |  1 +
>   tests/qapi-schema/test-qapi.py                 |  1 +
>   tests/qemu-iotests/049.out                     |  6 +++---
>   tests/qemu-iotests/206.out                     |  2 +-
>   tests/qemu-iotests/237.out                     |  6 +++---
>   tests/qemu-iotests/245                         |  2 +-
>   tests/qemu-iotests/287                         |  2 +-
>   tests/qemu-iotests/308                         |  2 +-
>   31 files changed, 182 insertions(+), 73 deletions(-)

Applied, thanks.

r~


