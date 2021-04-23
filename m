Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6A369D27
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:09:39 +0200 (CEST)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4va-0006iw-5V
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4tW-00053m-G6
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:07:30 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4tU-0006by-TI
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:07:30 -0400
Received: by mail-pg1-x534.google.com with SMTP id y32so36165254pga.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cB4vLIIxYeh8uUarSo+miWWbkdoBB90pHxJ+g4WLQrA=;
 b=mm62Tj1fUVmE7nU53BimfWq/2q3xUqVKCxS+4NFVd7iv28291n5iHgzX2Wy2EowFkB
 FD/LhNd6J3YNOQwTnm09cuRZn8nIiXNZWNEf863Ce3yt4L6hLxitZpwMbbBVzn87MXts
 0NcfsH7P/2MSe8G9PegSRggrzRK7QIF2sEB2SV0IXYZMsFZ60jfiSkJkujGhsoYJ5uss
 UapqTZ9d8rdJUewf6Gc+r8P2lhmfZBh87OIR+syFPBw4Rfdu0PKggtiX4hr9bzvIS2tf
 0QIGShXGg3YsTVuVyvSM23VaN+1tF0d9o1DUa8a+X3kF0ZTqlFyJ9GvEvwMBGAhFlPNh
 w0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cB4vLIIxYeh8uUarSo+miWWbkdoBB90pHxJ+g4WLQrA=;
 b=HPmD0j3l8CwlYkflXjFTCTbbautSSG1pkzxSXrFYRS5j6UhP8rmYIghZOR+IofPBo4
 poj0UwykXxckWAD6/Ru5HxsU5Ca05DkCuKMK+AzNTWYe5RVPzfsLyKnPw+6NlzuaVsqO
 DAPXVm5CKKNVdReQ6ILHdIiqwnT6n/+J94QfCOaGk6l2Oe7Lyvyp6EFUAyRyAcDW4u6g
 PFKvWfcJ7sTtqICv6BQKSrr109JNly9MH7nf33QmR3NZ+9fR/g+XkgHvjj741Aj0Lk7J
 jOSX5gxz/FufCdtXScOT8VrsMb2YyZTr0HF+Dzy6BYsnyA3f7Mplgj+RWUTfhkBn79Du
 anxw==
X-Gm-Message-State: AOAM530i1lA8oXFRynSEbXcq8aV605A+y9wWrP0+EGgwBfrYrhxduP4a
 7JcRcP0ZluDf1g1ZxXKF0omv5A==
X-Google-Smtp-Source: ABdhPJyjL+8EuXKu0JtcEDUJVQbRG49O19cY9QKuFuJKy4+mHIoODDrxRcsQfAPeUBc/FsGf1Z8nRg==
X-Received: by 2002:a62:1910:0:b029:25d:44b5:2196 with SMTP id
 16-20020a6219100000b029025d44b52196mr6042426pfz.44.1619219247654; 
 Fri, 23 Apr 2021 16:07:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id r1sm5826196pjo.26.2021.04.23.16.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:07:27 -0700 (PDT)
Subject: Re: [PULL 15/24] bsd-user: Fix commentary issues
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db519240-576f-0e21-12fc-192dfb564d71@linaro.org>
Date: Fri, 23 Apr 2021 16:07:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Lines > 80 or 90 characters
> C++ comments
> BSD /*- block comment convention removed.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-mman.h | 42 ++++++++++++++++++++++++++----------------
>   1 file changed, 26 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

