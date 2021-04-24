Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641536A25F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:27:15 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laM3m-0004kY-4F
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM1Y-0003Br-FJ
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:24:58 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM1L-0003Bi-LD
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:24:56 -0400
Received: by mail-pl1-x632.google.com with SMTP id h20so26761616plr.4
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eD1Ss3GjhcgI8GBUQ+yi+KuxnSsmzaeXnb9qtGLV7Tk=;
 b=fz4RFMhmXazRV57sVLdXpBObgod+dU8YH+IOeSFLn54bkeJWRLF7BLZhAFaG/waTs+
 nuhhCNIPvVwV9ZQpYKx4UQZVEa99JhDiHn+dHffmYg+fbZINhlr3VKNfMKjyGoG1EhTg
 6oPht6psLTxIZbaoaoHWo+Tx7KXYoVUv2N2cgWm451tH6xbsEdZM9GN5iOZoNee8jTuV
 neYIEFU8vP0WUHrpsGF5sFIq3RAxkxC9hZ0bd2vwVsNww7R0LGstybwKgJsJOr1YqhN1
 ZWIDgrNEsKFUA6z/qLGz0S78RW4QxzwAw3FZc8n09UjySsamhZ90xK4q0Ua5AO0rhtg/
 5NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eD1Ss3GjhcgI8GBUQ+yi+KuxnSsmzaeXnb9qtGLV7Tk=;
 b=VUzz0eQbJxEgRqunL65otyuev/KL4gOU7//qD+r83a6fOtJikxU6A/o4fOVqkx5WNA
 eOiYtvPfZ8Jf1y4RPYHEiwDKMYkB7mb9PzeIFM67cgiKU29e9M4wLtt/hx0L0z9ViXlG
 zeWP+VmmbzY/q4qzsB4cvOOHO7/m+3y66DZkSX6F6o8ikb3+jF8oRnd0DxEoW+mjaFQZ
 i5hFkhxsNA3JqKcNN/br1bIFYVlVjjjj/LeS4VesMBwjGeU9MXbzAzG/k7Kl/UbWyglR
 i83guM4WSpdqW4jNgolAD3mUh+g0VYoWbnRARpOoFnYmfzZbggXWAIi6KPe/2gX0a71h
 Ddow==
X-Gm-Message-State: AOAM5339+Rj7Wmz9kqouwh88qunxm/o5QGFXq24CuwR6+Uej9eJwyXQn
 7qrKGhkBrIpHzX2YaGlJLdEb0w==
X-Google-Smtp-Source: ABdhPJwMkOsvNl2e8wTV4CCNL6mBTVatrS9dsLAZImB43vJK/zNkitYoKbBjtW8MY+v0NpYpXpbPOQ==
X-Received: by 2002:a17:90b:4017:: with SMTP id
 ie23mr11814242pjb.152.1619285082188; 
 Sat, 24 Apr 2021 10:24:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id g21sm7752299pjl.28.2021.04.24.10.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:24:41 -0700 (PDT)
Subject: Re: [PATCH v2 15/48] bsd-user: style tweak: return is not a function, 
 eliminate ()
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-16-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38827b11-72b7-d1f6-2297-d8358652bfef@linaro.org>
Date: Sat, 24 Apr 2021 10:24:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-16-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
>   bsd-user/bsdload.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


