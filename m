Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB192417194
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:14:28 +0200 (CEST)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk5z-0002PS-KY
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsC-0006rL-8U
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:14 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:44545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjs9-0002oj-Gs
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:12 -0400
Received: by mail-qt1-x832.google.com with SMTP id r16so9098869qtw.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PVl6Nj+r7dh0kW4mEXs6YmG10XqkGTKb35Q0r8/aaIs=;
 b=hB256GOZlkii8SG3HhCY8Xm7bhSJLoPuFvTwlxnCkCh78IZ696mQe52YgWJIZkqJko
 bEd3kQgwGvmq5ytkn42OfN/3pFRfOlwgwC9Uaxq86imp7pjCA5U3b236QJDygpYVNnhz
 PCKGZ/zQFSvDQuYxsMNnFAUinz+ApWFooGWjtbZTbVGa/gkdzDICKz0I5Tkq49JOGB5q
 MNrKjgt6SdcNBNJI/cEh/i1AAvFvBU3TbJXkDn6feCErWJ9xIg5HxyBFa2KUIgNKFU9J
 3UjRRjkg2MwrEdpVRppdigRbYpbFNIME0Gjq/8K/Xdn3+k1V4yFceXTs4gHv6ESax8lT
 rcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PVl6Nj+r7dh0kW4mEXs6YmG10XqkGTKb35Q0r8/aaIs=;
 b=nuRJYFHwpwYVjffthZWRnGUhBBY62G9rtiUsu765sZF60De6ftkYw4TPMjQtjmZFm7
 igwy5i1ugSni/6+yMt/lkttOnIWjw3vZujhd1asWcKnaDezWVa5BJvSkpBv4rSF3PSlg
 nefyxiFJt0lGLxX8SPCMdAul9wCcc4RjClXjoHeuLFTHbGfmlSveYbluOsodSVcWawmx
 GMR25BhA7Ab9JDhLhUyH5Y880aWFtaPvdey7c4+naqkCayPG5Jon+9Bl0bulz1zArNl7
 wYD3T7fynxiWrgagJQhx6gVXEd6WMBy79rafeiZACeZgOYMDtm5Qb+wRBwUaa4eCOnXz
 zXzA==
X-Gm-Message-State: AOAM531nDNVV1CvPWdmuyT/PRnLPukxtgKK5sRvpH0fWKMwxofzqnyhi
 hZmp0hdn7pALgkERyqUjLm9hBKR7eW0yHg==
X-Google-Smtp-Source: ABdhPJyveHdUY9h8Zvg/XD6cGvjEXphDQ0DRhw/x7GNJGb+WKdwp2XzYzQKMUcqRGIfk8JVicMlpjw==
X-Received: by 2002:a05:622a:45:: with SMTP id
 y5mr3569022qtw.145.1632484808643; 
 Fri, 24 Sep 2021 05:00:08 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id q12sm6089915qkc.104.2021.09.24.05.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:08 -0700 (PDT)
Subject: Re: [PATCH 02/14] bsd-user/strace.list: Remove support for FreeBSD
 versions older than 12.0
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a18be5f9-c6c4-3d44-0e3d-55687cbc4e6f@linaro.org>
Date: Thu, 23 Sep 2021 10:57:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/strace.list | 11 -----------
>   1 file changed, 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

