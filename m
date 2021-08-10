Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4023E7F2B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:38:02 +0200 (CEST)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVhQ-0002PR-7B
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDVfy-0000RP-DR
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:36:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDVfw-0001XW-QS
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:36:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id e19so8653334pla.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RVCaVtsbdUA6Wzn2dJ7jS26psv+kPStlg7vR6ZUIV9M=;
 b=PeFlU3+H/51FUGA0wH6IImCAt0ohKkC2rTe+lXm7oj5D4G4kbdE6v1uudUIcLfOauA
 tq9xFHzQ4NTEz4Ulq3TYUfruYJi6wKBvWX9npTS4JGlmEj5PFbf4qJzRF6JgjD/cAOq4
 NuqEdTNmy3b6OuyRPMKOybWPP4CDgWobwfywlIzDYl4KF0DFWO0OQmAWptXKpc31KDpa
 YmzpiLhsOyCy+VoljqJ+jXoWehcmZNXdojygBbFmOzixh7y0dUzGzjUuNvFgOQEU6aTX
 DFW0m4iSpvcxy7DXwdIB7C/NB6Ub6hqz0h9lH+lshSqlVK9/HT9CIfrzFXtlmuGvxhlS
 Nw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RVCaVtsbdUA6Wzn2dJ7jS26psv+kPStlg7vR6ZUIV9M=;
 b=WZS1nsBfNEMF6rlVlcbwe0NKcsqGATRlco3S7mFzBKo84ze8meUpiUSsQGGpfw+Hny
 DTQ4NmJE+nDkILxkU2IDvJC+X5278UhIIGMUXcMcwY2nwX5wRSjz3RYCxQo7jFRXDo+P
 NERj0Rtm0y4MR1Tbu5Ho98VVCsnFsAhPZQ1jkX70oMSNrXGpsf8G4O+tPFV+s+ZOKGCZ
 cUwvzzpS+s14bg115ZS3VMbHdoem3ch4L9uZowDz+CXk3capMqywwNijtdQwOnwtJroG
 Bug3zHkkVJYvXU7LQQ0inQ1Z/2U5UN4p+hwab9Y3oiH9ipgd8ukUvv3MM43hS0aC05yP
 Btmw==
X-Gm-Message-State: AOAM532sUrVSQP+/QlfGkUYmezPX8l1yBrzBU6HtpH+ZXhtaSOk2ny7D
 q+X5UaNzkUVv4hdUm4Z8JXbarA==
X-Google-Smtp-Source: ABdhPJxK9h3c3ZySK0ABepE/hSvlhA16bGl9gTr3B/Bi5ZBe0iLHyPgBrH7ZLyiMRHTGBq4t7RIP3g==
X-Received: by 2002:a05:6a00:230e:b029:3c4:24ff:969d with SMTP id
 h14-20020a056a00230eb02903c424ff969dmr30204328pfh.44.1628616987077; 
 Tue, 10 Aug 2021 10:36:27 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id b7sm23721047pfl.195.2021.08.10.10.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 10:36:23 -0700 (PDT)
Subject: Re: [PATCH for 6.2 43/49] bsd-user: elfload.c style catch up patch
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-44-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e51dfbc-04e8-cbeb-3be9-0ad295bb11dc@linaro.org>
Date: Tue, 10 Aug 2021 07:36:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-44-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Various style fixes to elfload.c that were too painful to make earlier
> in this series.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> 
> Sponsored by:		Netflix
> ---
>   bsd-user/elfload.c | 212 ++++++++++++++++++++++-----------------------
>   1 file changed, 105 insertions(+), 107 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

