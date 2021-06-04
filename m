Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2C39C22E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 23:17:12 +0200 (CEST)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpHBn-0002So-5E
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 17:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpHAA-00013e-E7
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:15:30 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpHA8-0004zH-QF
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 17:15:30 -0400
Received: by mail-pf1-x431.google.com with SMTP id t28so8337672pfg.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SxA1KrB5NU5q226UHX6i7G6cMoM5NJ78Uikrd3XcY4k=;
 b=daoFys+8/euf1akcd85CTHrBKx6ENQvyygOJ/HiCV5P3lgL6wT7Go6FZYaNFuLElnQ
 tkIVUPAwnSGyzKCtOB370RjipqIHdorTQNbtA5Ut3+hfx71CyhRffXA8GRJGPi46gWwS
 aYv9HmA8kL8kqLYSqOlc4tSGXztmytfdvCK0SSWEeByY345XFJ9oy/eHpCgssN+39n8j
 /wIh01nN14jDHKfyQ5Fu4dFjRRz5CgvgC6kiOmJANIyV9z0IofJ7uGBmg3VdWRHWlWg7
 hZnP798PYx3rv6DFS4HApLZ2tPTP9O/Bo+Gof4QO0g1nx493T7YOmeycfePqiAOB9nvb
 AF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SxA1KrB5NU5q226UHX6i7G6cMoM5NJ78Uikrd3XcY4k=;
 b=Ua2PoRB2op3iFZYfwOf8YqLxtv/i6gLN0LekN/Ad/aC53OZ9CBNYQc8bcntlg81S+/
 XAKjN7oc1Z6+OSjVCbecB5KQGoBi8k6E0ihJMJc5c8+Qy/tp2lzpIlZec0OQcY09U4Cj
 RC50jzwOoVEXKlyrPiG3lrpPK26cvMRAK+QPzyPPKZ2prAvPsQM7vk/KEyZBcxu9K9ke
 qE8yqOIPGxI8KR9xp6LeWQHWB1eryrAp0MxmE5brSO9sfqHzfPwIkGZPfwmkL9VqWElX
 9bxWRZsKPBTj+ALy7t3alUWzF+zx3SpOqL3Edbt8wCCO3J+DoLUJj3th80mxoHaPzo9A
 3z7A==
X-Gm-Message-State: AOAM530KoifE2ZDW7c4+7p7HicZzTs307J6TiDsOkVPs2gOjWavN061/
 0JhrMBihUBmRrt60SySdAUTvjw==
X-Google-Smtp-Source: ABdhPJzNJ2CcJrXPCq24PObXbXGDByVFQvvyYaVANv1rLnBts6cencqiDPX7iglB3CP+RZLeDN7LJA==
X-Received: by 2002:a63:b54:: with SMTP id a20mr1015370pgl.407.1622841327519; 
 Fri, 04 Jun 2021 14:15:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i8sm2732477pgt.58.2021.06.04.14.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 14:15:27 -0700 (PDT)
Subject: Re: [PATCH v16 12/99] qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f90e54a4-dfc9-a749-b356-6af96dae348e@linaro.org>
Date: Fri, 4 Jun 2021 14:15:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
> 
> Reviewed-by: Eric Blake<eblake@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Tested-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-13-philmd@redhat.com>
> ---
>   tests/qtest/meson.build | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

