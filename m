Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F54C3685
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:07:14 +0100 (CET)
Received: from localhost ([::1]:39170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKOP-0004fD-42
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKM7-0002Ma-Rc
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:04:51 -0500
Received: from [2607:f8b0:4864:20::431] (port=33601
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKM4-0000bV-Dc
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:04:51 -0500
Received: by mail-pf1-x431.google.com with SMTP id d17so2847640pfl.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T+1rjQcTqyurlXfKyJq09Edm0xQXvZ9ytXx9WZtD7BU=;
 b=mJypmAFIYg5UZUU+H8yuUILlsfm/xdL4TKcGHQs/JBBYhXwojpN2ndxwMFmnp5yf+O
 fL4KK1aDcI1EPVRyfHRSSRRZpfZNcei4+sHHqcZweAGYOzCHrhYE5Cr22ru4s6icQLSt
 qwGNVNcZhduDDsCMZzPvlo8CkxrmW/K4nwYtjw0H7KhtnQOR0pgl8vyORM8W4q6oDKtn
 S2fn67b6AKI+V/+G28CMSTGwnEk2tG7NZGgFvwbxgcbWvk+Ch5uOwa0UvAqvaIoOUtAY
 5WTVd7ZEAhzGN1ETe4T3WY/FUi13N7HtJGqIGm1a0gXjgG6dhRz9WKfUumWPjcKTcpCz
 ghmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T+1rjQcTqyurlXfKyJq09Edm0xQXvZ9ytXx9WZtD7BU=;
 b=qjImXt3uOg4LLmNw7HQvKaXyBWKVhkVFVWfsAMIzehpSgArYbFgEprpk+MRw3TSNK5
 /jL5DrP1JBJAP4mO3TIiyiUAkE4mx0igtiNHFf8qQqH5ssIOJCGEOuiVWlUVNIfR2UqJ
 RxorWQ94fm5wEcfrxnTipGz7ubBLi3yTKMyheBI2S0kFdboviCwzB9NU0qCdgQOnsZy+
 qzC9QY1eg2qLK/BDeDNtWnxqJL48XRzr1A6gb9vwFAsA91FLnDl97034VtOVIWnA3Vzw
 asfvnrSWm0k+4lRmnZV8sCH7juSegaTIGWbNgQcUxnLas2QOKfmJb3Z+eKMIdyQR/pIu
 96xg==
X-Gm-Message-State: AOAM530FU1Y8m8G53t8zN4Sz3pDsOk1NxvxarqdLjyIryQJGKa9c+EYR
 qhgfXxvs5HYAhjfrRRDNT1Cm4ePZ2pHujw==
X-Google-Smtp-Source: ABdhPJw9Aqw6op9UEph3FdGDAoZ4ZUghhXkBlG/oahJ2tBtnHWzL6T3wvOBbfXCSzwzgBAkUDR8JMg==
X-Received: by 2002:a63:4006:0:b0:375:7cc7:3622 with SMTP id
 n6-20020a634006000000b003757cc73622mr3475129pga.436.1645733087147; 
 Thu, 24 Feb 2022 12:04:47 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 w21-20020a634755000000b00368f3ba336dsm289818pgk.88.2022.02.24.12.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:04:46 -0800 (PST)
Message-ID: <8066c607-d9ad-7a2a-cfbd-b294f21a0d65@linaro.org>
Date: Thu, 24 Feb 2022 10:04:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/12] qapi: remove needless include
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-13-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-13-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:37, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   qapi/qmp-dispatch.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

