Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F736A25A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:24:39 +0200 (CEST)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laM1G-000235-5g
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLxx-0000fR-VQ
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:21:13 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laLxw-0001AD-Fd
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:21:13 -0400
Received: by mail-pj1-x102b.google.com with SMTP id u11so21027609pjr.0
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7QCTPXYJqXa6xQ//v1DUSrb29xYKaw7TW+NcGm1gXRg=;
 b=QfM1T5FBQ2e5MgZGuVfXn37GR53zkzTTwgqfnfiiQwWeSHK8a3Zvdig7OEJF+zzoOn
 QSbzmA4SvXcP0S1BxdK9PI5A0bv+Yoqs1G29hMn4Sh6mX/Nr+aIZiTGPloGvm2ZTrNeU
 66OIdhaaQLKKZM3URn42u3xZ6VyLGISr0J/hx5ARAgjQr9O1k6TS0kDAFuWvnIODj7wQ
 BW/9CgMkTzcQH5egon91rZ7peOX5CHnjcOGygsAVOAcisVwz2SIv4v2VbO+N2+dqGkhh
 ZFj1TJSBVffhVtXYZmVn7BN1+D+ZVz7pW0+v5+ipe7p6P815urNC+LfRZ7judpboHRkT
 SRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7QCTPXYJqXa6xQ//v1DUSrb29xYKaw7TW+NcGm1gXRg=;
 b=Gt8KoluAhEIPgdOZSILsd3krrGIC3SDYpax6VZYSOz5+5T6NdZz6/8sffzquknXthB
 C2ei9RX7I0gaH/pd1p1eRCBDYEjWDDk98anwSsFCwfTwM7c1zfT21/LBT0zbPJ9ntkf6
 XKFTUxWcZJRNnz5LLElskvKQh3fPPxEmn69Dv7mu3385RzG4UMgG4tguTBz+Oden6K3X
 AalXb8KbXu8K4aR2jT1nwq7oIAIqFEvOXQzj+xO3htl80nE4w2FWXTPx8Ma64IAY+Eee
 +t+RVUcDZuWLhEslxrIfdqnLBDSyNQjR/QxvB+h/tRJ38aTFGNwwgbdJZulvqwlsLXRU
 KqcQ==
X-Gm-Message-State: AOAM533klFMf9FtgKhGvjjo1TcLjhcBNsg3Bh54FFFvt1M5DZAGoIz1D
 Qcf5qksgK7kmSR0fLQKN/zgJbQ==
X-Google-Smtp-Source: ABdhPJyBq5cB73OvDRz978qbSeKBk3VaXeAhR6a4vivXdsWKY5HAykA0MmX47IZWRpzpDUfEDAnfmQ==
X-Received: by 2002:a17:90a:a604:: with SMTP id
 c4mr12488031pjq.81.1619284870913; 
 Sat, 24 Apr 2021 10:21:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id g185sm7221530pfb.120.2021.04.24.10.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:21:10 -0700 (PDT)
Subject: Re: [PATCH v2 11/48] bsd-user: style tweak: Remove #if 0'd code
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d0031fc-7a34-7c60-9723-f8dfbcb6d27e@linaro.org>
Date: Sat, 24 Apr 2021 10:21:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-12-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 12 ------------
>   1 file changed, 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


