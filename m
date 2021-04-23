Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC7369D25
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:08:07 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4u4-0005D9-UY
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pM-00089x-Ng
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pL-000448-5A
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso2065939pjs.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XqHOFWgCsNtR3VC1ZhHaoYk7ZPjiQYqWcmRvBd2L0oY=;
 b=D3JLNYDaqGux/p5oHfOuyKS4KqbYd0IjN8kRquMB/QjlMJs2V7j1vJj32hbPg/SCCm
 DT+dF3JwzZrvew1fvI/cW2Wev85s221QHPQHiJ4UbvUj2nSXWXK+S8++LEPpMOf9A0gB
 tRcc5G4ZkWSbz9iKDacZ+fgo8RMNfQdOmkJwYxBxtkWiLizmEVho/IHMARuLOn84c7pz
 233DF8ncJPPCw3LMhtf3SqQtEwTzOeBSy6r8PYEZDMKl2SWeF7cGUj3QxnIbdkmTsC7M
 nZY+b94OpPMgBtO2CvABfMe2rq40bqCNZwbACXk1JYp/P0eoPHq6c3fSynmD61/jaKFc
 Yv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XqHOFWgCsNtR3VC1ZhHaoYk7ZPjiQYqWcmRvBd2L0oY=;
 b=ARVIusVY8EPJf7D+Ut/SySkC3HVxT47Hd+WU7F0kwGBFjFmhzsYSugitAiQQr4GW70
 ChnQDRAofD5DTYHsEaMsx0+F835p92O5qm04p9wuzEDclwFnko7TUhJzDyUaqy88FBzs
 GkOuHZJcEiYjbKrM+HxD3WzWCHOO+O5ks8AZ5o4khCHReFn5MjU1OH/QXEQLJKPDSvxE
 0dwDMuSbD9VJRBpCEs0IGTCL5US/7lIyEe/w0rtQ7G74/x3U+W87yKYgUTznYKd65Epk
 +y1A5TSqrgsTf7HZSKWVqq7h2ck05EMvkARvcuF/6cWkGoDUa+4Ehpk65R2kbQbyO1fn
 dF7A==
X-Gm-Message-State: AOAM530OoH1YuoqE/DZ3ihqyIivKra8wYx6arRfDjfS5vnUAmITmhKbK
 9/MJ+9yl7JNW+2ZFlsym93o1XA==
X-Google-Smtp-Source: ABdhPJzZxkDIwdmCMFskRFmbjkKTjCVthe7QQ7hr/soqkXtlLOe58RToLe38cymEDNLnGV62hjQRvQ==
X-Received: by 2002:a17:902:ed87:b029:eb:a96:7892 with SMTP id
 e7-20020a170902ed87b02900eb0a967892mr5911288plj.47.1619218989928; 
 Fri, 23 Apr 2021 16:03:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id v1sm5307908pfu.6.2021.04.23.16.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:03:09 -0700 (PDT)
Subject: Re: [PULL 03/24] bsd-user: whitespace changes
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ad99219-da7c-bc59-71f1-532027e69a5b@linaro.org>
Date: Fri, 23 Apr 2021 16:03:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
> Space after keywords, no space for function calls and spaces around operators.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


