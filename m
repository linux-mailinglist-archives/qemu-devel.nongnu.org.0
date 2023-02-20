Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4CE69C9F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:33:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4Pv-0005wS-OJ; Mon, 20 Feb 2023 06:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4Pu-0005wB-2Z
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:33:10 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4Ps-00020v-58
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:33:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c5so1496750wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J/dHRG5aVmE5Nj3SsUOZkeSw0LAlKAJwzZEGzQ9MKno=;
 b=EofqjCYhq2k6BbSj2rvodYBYHrtnZt/OOnoiSTdcz17jgNEMy9QE1rfqPSmSIEovUM
 28lysfitlmQnQY1/7qU+0SG02vjE9S0VfpUkt8d3C8+tJ8mNH/fdUWBatrThSgzUCJUK
 E8XF6S4v7WWU8vzfKO80Z+z74yLLz7A64nfvwwhWoGKos1Qd0YRC/d+BatnLctwfoDl+
 iVr/L8+vVixEt3lHdAXuhoS44OGZptZaFCW2y8gK0Jogq//v3NFplwQISnqHyv5EjZv9
 jHjY5t9zozUXQloKq0S/cYSuVPRKT/++cmlBqRonFYZQ0LZJqJ+TwWThnvAqlGq5twwV
 At0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J/dHRG5aVmE5Nj3SsUOZkeSw0LAlKAJwzZEGzQ9MKno=;
 b=0MNfyLeX1A7q9gofpWnoXjjVpKcEF+urYfJVQlVvTnaepjVpu7mkC1U6omR7J1ZhVd
 b2HMt8ufABsWtp/zR2P5P4VNHrN1HNj1D6k/TKdyt8DYlW/svoptbh/XQCFj9wD7z63i
 l6XzLsU+SFU0qYoh9oiEykC78NuP+QHZFgYiI5xcDSCqM5giviys505Afwttc7bud0dc
 3hY7Nbyy/xRhjuyQQzpWZt5s+Cn1ynxBqjJkh7Ff7GXUf+6Jtl3jIbcfK8/RRAf8GTIr
 q7vtTI7uYkJn93vV1SvTn+v6oHbaRT+Oi0CXdzFcPrE0PVSEGziqcSZdNYjjHaPyj7eX
 a4dA==
X-Gm-Message-State: AO0yUKVj/WBNb26R9lsxmTrvu/UFiJj8bqjWucPGGpmenMXMCk4hH3LV
 vT47MTHL4SeyjvMdLsZCBKB04A==
X-Google-Smtp-Source: AK7set+2jaoz23QjdIsu1FNt0kQynBXpqoBZAW/KngfFVBxN7puAd14g91H+d1FpodR9heU1dAilsw==
X-Received: by 2002:a5d:660f:0:b0:2c5:d3d1:dd6a with SMTP id
 n15-20020a5d660f000000b002c5d3d1dd6amr1845639wru.53.1676892786087; 
 Mon, 20 Feb 2023 03:33:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d8-20020adffbc8000000b002c5d3f0f737sm666559wrs.30.2023.02.20.03.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 03:33:05 -0800 (PST)
Message-ID: <bcf0b85d-edbf-335f-ac74-c27a4cecdcb8@linaro.org>
Date: Mon, 20 Feb 2023 12:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/4] Adds support for running QEMU natively on
 windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Pierrick,

On 20/2/23 12:12, Pierrick Bouvier wrote:
> Since v2:
> 
> - Delete superfluous comment on unreachable code
> - Fix style for multiline comments
> 
> Since v1:
> 
> - Comment why we use generic version of flush_idcache_range
> - Ensure __mingw_setjmp/longjmp are available using meson
> - Fix a warning by calling g_assert_not_reached() instead of initializing a
>    variable
> 
> As before this was tested with:
> - make check
> - boot an x64 debian bullseye vm
> - boot an arm64 ubuntu 22.10 vm
> 
> Thanks
> 
> Pierrick Bouvier (4):
>    util/cacheflush: fix cache on windows-arm64
>    sysemu/os-win32: fix setjmp/longjmp on windows-arm64
>    qga/vss-win32: fix warning for clang++-15
>    target/ppc: fix warning with clang-15

You forgot to include the 'Reviewed-by/Acked-by' tags from your previous
versions. See from these guidelines:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#proper-use-of-reviewed-by-tags-can-aid-review

   When reviewing a large series, a reviewer can reply to some of the
   patches with a Reviewed-by tag, stating that they are happy with
   that patch in isolation [...]. You should then update those commit
   messages by hand to include the Reviewed-by tag, so that in the next
   revision, reviewers can spot which patches were already clean from
   the previous round.

No need for a v4, you can reply to each patch with the missed tags.

