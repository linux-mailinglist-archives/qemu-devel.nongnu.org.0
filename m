Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D6277440
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 16:44:56 +0200 (CEST)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLSUR-0001zA-Me
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 10:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLST1-00016G-Oh
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 10:43:27 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kLSSz-0006C2-He
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 10:43:27 -0400
Received: by mail-pg1-x544.google.com with SMTP id k133so2025356pgc.7
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 07:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e+S5H9YRCKCRPdtkn0opnwFQTZcF99Dbx+Xe/IpZy18=;
 b=ASu7C9zAR+LGUS6L02AZ/y/NG7ncmESjKyVnm+fwBC8JGYlggLquvwyAgOEfZ5fy8w
 hHhn2B2N2yQPP5E3uZOvDE0yH7vZp5DJSJd/vvt9MHsemv6Bt4HUAKxjwNfU5MpcHYqA
 kRybNCNjq+uUzavSHZSJ5i13dGrfIqexGRjOdOS7Bt/iL/Fynp/Nk3FwT4b6yqv0BUhh
 v3WHaQNka+Iv4dMsuFgJT2dzSZ7mIga+WwwJeA1InGjDqyz+n49+J7t48qbuCitJ6j8q
 Xh2BgLgSN3tYDP/WYcI4uwaXZfZksiDKjzDPeCD01zddo2BeXWPq05KjbJXnxkZECC3h
 kXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e+S5H9YRCKCRPdtkn0opnwFQTZcF99Dbx+Xe/IpZy18=;
 b=V5HmpTNfc2vfnQQFvVSBWZInWlFdY3BSQnmENMrQcpatniPQe2M+AiZr9WXKGPRd8g
 AgkQOeso3Jbfxa2rguGj6/7xl6qzGuxPA5WjFmRGE9syeX7r+WOsyYC2SQsuwSgDbiCE
 RGPM9JJ6mIh6/0gn+H8STiVrx/Y4m2zCYqWkmo66eTfnIPKv5NmdjDoY3mfPdt8X+fdm
 m4J615W3FdbP8W9A6CGQAp8brFi7RGTWoAW/BgQnA3LLv/1plTupfGp9VkiowtZxBP7z
 iqqhHTsOmln9Xhyjmn/9xHXOI5rzP1hJ8voLJRy2LQGcBhg9YboeISuhq7Mp5JXIcxiL
 SwMQ==
X-Gm-Message-State: AOAM5314qc6YNR3LY2zYqgQgdw/QhGxkcZKJIrjKEa2S1ivrfYffF1uI
 XO7V5tfpgFBksO5oYY96MIvMiA==
X-Google-Smtp-Source: ABdhPJzc6yQpi7OKms/86fdlPPmRP3OMS1PS9eFspRSwcUARWSD5jkUjdIyAzo7+KEV6Tm+txhwlqA==
X-Received: by 2002:a63:e709:: with SMTP id b9mr4249845pgi.425.1600958603972; 
 Thu, 24 Sep 2020 07:43:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m21sm3141412pfo.13.2020.09.24.07.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 07:43:23 -0700 (PDT)
Subject: Re: [PATCH] docs/system/deprecated: Mark the 'moxie' CPU as deprecated
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20200923171815.97801-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4c8c2b6-a0c5-19cc-3317-93e646759dcb@linaro.org>
Date: Thu, 24 Sep 2020 07:43:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923171815.97801-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Anthony Green <green@moxielogic.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/20 10:18 AM, Thomas Huth wrote:
> It is currently unclear whether anybody is still using the 'moxie' CPU,
> and there are no images for testing available this CPU, so the code has
> likely bit-rotten in the course of time. When I asked the maintainer
> for information, I did not get a reply within four weeks yet (see
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg07201.html).
> The last Signed-off-by line from Anthony in our repo is from 2013,
> so it seems like this code is rather unmaintained. Time to put it onto
> the deprecation list to see whether somebody is still interested in this
> code or whether we could remove it in a couple of releases.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/system/deprecated.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

