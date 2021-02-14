Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D631B36F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:36:54 +0100 (CET)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQwf-0001MI-Kb
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQec-0005VQ-Ki
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:18:14 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQeb-0005m9-57
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:18:14 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z15so3128101pfc.3
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 15:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RuA5pFl226zNhGeekCqsm9jox6+SLB+SgzsmG2Hz/8k=;
 b=elFFVFvURi30/kSWrJkmWTONnYfUGpySlhmQqWCYu3BE5B7F35v5ZuGf0QBm+Qcalh
 muHy0B7NzEvbkEQMDEVIriqyALaG2wEUzKSFr7bptzH+BuExpLNF3bQ0Z0WCX+1nPHOl
 RA5BfHKzIeKPfIfwstjWr0dp24UZ32FinbhjDfLMdPpMnzDKw/BInLofeTZ3Ygq+98Nh
 HV4sWDj+ug6F2H/nZzw4qjOC5WtsBC1gly4ETE6nqSZVLO7zo/vtZ7VIfqFBWHh0vVKw
 zs5R0M0kPH1Xkp18BD27r90IcEUzt+W1x4CTaA+no/IuDsN1ZLQdQ77nuslR9cLx0ZvH
 fSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RuA5pFl226zNhGeekCqsm9jox6+SLB+SgzsmG2Hz/8k=;
 b=UjNkR7pQ0XAtOkE8+xLGCBlHCubqgg6ffcrD0V9F4d3o0b3EihwDOBUPWkSNICPhQD
 hJZYrqcHxhnS5rVRdehStNqmXKf3YCIattjo/ir06VcrRyxzXXXZKFHoC3j5Tfh8a102
 4i0SpR03u87zNGKsSTT8AqOJLSBUvrin6tmAxjbyz5Zl+xVJrulIqqsbkG/yUzb+MyGw
 oddNvQq0vZXGoYPEF6AZC6WSrYVuTRZ4w58IMS9A78DStYFLoa2yZOBlxzHk3reaSs9W
 4DFStPY4CerlPxwPboWke+zsAna2Wm/5c84DdPSpSJSY3T57HBZfj+Lhg8apXg7XXKq4
 1Acw==
X-Gm-Message-State: AOAM532ObD+wSJ0UTBSy9XdZoQ0Cn1rf2wIrrLJUMylnY/GqGJ9Phr5b
 bNCm07Y+1Yk+bQC9WaaXvKBRwQ==
X-Google-Smtp-Source: ABdhPJx4OVV81DOCgW5+b2cg5Nmw8FVPw9AID7w21Fbyt8ocf9O/p0xB6EvGedQPoPyvEtgN2kaVcQ==
X-Received: by 2002:a63:ef14:: with SMTP id u20mr12797666pgh.93.1613344691991; 
 Sun, 14 Feb 2021 15:18:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 9sm16424191pgw.61.2021.02.14.15.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 15:18:11 -0800 (PST)
Subject: Re: [PATCH v8 19/35] Hexagon (target/hexagon) generator phase 1 - C
 preprocessor for semantics
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-20-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab3235df-3836-7fd4-2fc1-6509e61d7f8e@linaro.org>
Date: Sun, 14 Feb 2021 15:18:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-20-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> Run the C preprocessor across the instruction definition files and macro
> definition file to expand macros and prepare the semantics_generated.pyinc
> file.  The resulting file contains one entry with the semantics for each
> instruction and one line with the instruction attributes associated with
> each macro.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hexagon/gen_semantics.c | 88 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 target/hexagon/gen_semantics.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


