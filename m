Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15BD369D2C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:12:03 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4xu-00022Z-VZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4tq-0005sy-3A
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:07:50 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4to-0006o9-I6
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:07:49 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m11so35018832pfc.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I7ODSHsMTaOzEhRhreE9Nlol+ys5u/la2JGfnq6uflk=;
 b=Bd+ZuingNACYJ2sURmkC7ACgk19jZnEF+3LScRbrEJ+DkctBBbJavEjwEYJk2DI8Vl
 DUBP+Q07Yy16+cpO+VJqXHq4q3F3MroVUFiIVOqPOzej3odb5e2/46ZvJjxXBLNRKnt/
 o1JcJs8jlygSgwHU8OcGiEoYpzKmym1VthdrnEpobJokARKWLx8qhVIhjy/Y6Wy9uzC/
 cnB+u9usBtlWQ0bB2EnZkIe3XeduU6OWSoObmESaxQyuv/zxxEXyeMMfGbsM4YpzcHRm
 NQ9XSXJQDxM17sRUzsytI7sMV+guiU1FmGot38rt+VdMTGXvEg3qO/8rfXYHKbqwyQTk
 mESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I7ODSHsMTaOzEhRhreE9Nlol+ys5u/la2JGfnq6uflk=;
 b=UjPNx/s/7z73N3COplv5HCsX1MfkwpWuId8u0wmfzYIbkpp6sYs7kF25ueBZIirRkL
 XA1VNFU9eJSWQuDc1gw4wm8AmOdcL+Z0JXFH54MvsKKxN1wu3i9z914jsx8xLgveDB1U
 cBLfCnTbphnHi+H/BFHyyr+DbN32ckp4QI4vJW73pVc7OOYNpxJG/UHDEUtYi8kfZODx
 u04WMLX3jasFKEtN19/7VC4yho7iYgNDO4S4iLTNuO9EhzNdbfeV9bnAKLn1ByibhpIg
 DLfakuy2tR0lktN8RhFLmqJM7s3KMpd+/t+vpZRctSl8203REU8r0KTJLjwnirE3Zocw
 oOrQ==
X-Gm-Message-State: AOAM531i+Ks201jPYBWdr748LNXozVOd9cuuT8DO4JyQZNvUDB0Rnmjl
 OmOPhtvt4a+1p1iJMTw9drKzjQ==
X-Google-Smtp-Source: ABdhPJz6/IeFtjVVx8Fh5UsDDvXNwXqd/93ITCN39hNF1xrS615OIlJuxG8pK7cRAq1N3gMo1CI2dQ==
X-Received: by 2002:aa7:8142:0:b029:256:d3d4:16a0 with SMTP id
 d2-20020aa781420000b0290256d3d416a0mr5879222pfn.56.1619219267260; 
 Fri, 23 Apr 2021 16:07:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e68sm5318481pfa.78.2021.04.23.16.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:07:46 -0700 (PDT)
Subject: Re: [PULL 16/24] bsd-user: Use preferred block comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5610ba92-ccce-22ee-a1e3-e17388079d34@linaro.org>
Date: Fri, 23 Apr 2021 16:07:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
> Use the preferred block comment style.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 28 ++++++++++++++++++----------
>   1 file changed, 18 insertions(+), 10 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


