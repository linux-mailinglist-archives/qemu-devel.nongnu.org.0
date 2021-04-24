Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE336A27F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:07:15 +0200 (CEST)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMgU-0006vz-KV
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMei-0006MX-0a
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:05:24 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMdP-0006D6-63
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:05:23 -0400
Received: by mail-pf1-x431.google.com with SMTP id u10so796017pfi.10
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=10CeJktr9Oke1FdJKtCLy8zg4eZI1oemxpxJhM4pLOw=;
 b=wXAUPU1Vg6kdqDhRXiROrFQHj0rHJwKEXcGbcWqbkQ4c/gdj5IVlCxf6tnLk2gWzS8
 leRskGEkEFjW7e20F09OkVeUiYK1N4jjEOECfqDWF7VlYkdG/fMfHknX4xdoxvMZedtY
 H82C8GWLTrQc/NhKrZISvBDBSY0uqnXTIIaAcij/Q9fwFf3q2gkC9ClthOxyXi+0sejU
 pb7wPod2dtz57JxxdiFdgv/RcYZ7iMLwf0Rc9OPH0GQlwx/AJMyEgb19FObmrIKlSuTO
 Q5cTldKr96+5B8CJztScu6S/2Y1Ztgzb8VqztzzMRV8UpBMwaUp3tGQHWSUsmbin/Mk4
 BJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=10CeJktr9Oke1FdJKtCLy8zg4eZI1oemxpxJhM4pLOw=;
 b=WpiBkTjTcB7hmdTWTbRJ1kh2F5/WMkdbCRRypg2hUAV1q9u+R7+8ppRk+4clmvl5xb
 FWpEV7NnnF/WrN1pg0hbIX7XR3TrJiENQpMdNFgzLl4niRvUQxrK2iUMSatquPVhY8qa
 gjxBPbB1vnhGgsmqJyXap8KMPNYpxiT5Q+41EU5qnPhkfgFNatVelAYlxnYAKqwZ4ip5
 /gfqhkORNq/KmgyLSMSgsETCvztkIFDjGarrEBvO8SVSyRnb6ML34OZntqPt/OxCPBXG
 FpE2RkxjO0v+R70RGNBSgYnzJp9zsuknDvZ+dbWxMMI8vQTm23wGBRnMpD+gETsM4RhJ
 rgFg==
X-Gm-Message-State: AOAM5337w64D1km05oF2gZWFqP3mrGz2220+vPyksWSayKZJE5bB+kpL
 at05Y2V+WVWOYYvpIozgdsicfQ==
X-Google-Smtp-Source: ABdhPJzM6BbjN7X5AJGNwsG15ffXMmSxCNSBKlyvjximis7PDE5SI3g7psY2jylR7ESvsH5aHua4Kg==
X-Received: by 2002:a63:1921:: with SMTP id z33mr9554978pgl.211.1619287441742; 
 Sat, 24 Apr 2021 11:04:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w123sm7254943pfb.109.2021.04.24.11.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:04:01 -0700 (PDT)
Subject: Re: [PATCH v2 32/48] bsd-user: style tweak: remove spacing after '*'
 and add after }
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-33-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e0e0ff7-c09c-8a9d-b18a-4d4597331273@linaro.org>
Date: Sat, 24 Apr 2021 11:03:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-33-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

