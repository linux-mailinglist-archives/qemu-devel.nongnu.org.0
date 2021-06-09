Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FE73A08AA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 02:52:13 +0200 (CEST)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqmS5-0000X0-20
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 20:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmR6-000847-Db
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:51:12 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmR5-0006CK-08
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:51:12 -0400
Received: by mail-pg1-x52e.google.com with SMTP id i34so11555062pgl.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 17:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=F6T7h8ovOfMB9opQId2NISc5MiThM+887pH1CNDP9Pk=;
 b=sn9NeVIQzCtUREX2YWCPc78MSVRctp0u4FYZZfvhlwrLEfoCgul+4pGo2BkkYg3BM4
 lZ9pOxUdDSf/LfkOFgN3JVj52LUm5KgrAbv4dEc+40cZaeNH+ech7n8ZMlNdro6SoYv/
 VaSLOLDwiOagCvBlwm3bYz7owaH8cZPg+ALsoLswayYqy2SrdvsjT+8UXMGfvuXORGwV
 huyWIZl31iQFPHg9eCPDjjQzS6SCD/QpIQxZxy2NqJ5e14eBcDHPvYChUiNCibJOUY4G
 PVIcnat9xfMaOuC9vu87H63BQOWYCswpYktZ5yOI5fG3o44OqFRHhgcQkYnMk3ecHoRI
 QQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F6T7h8ovOfMB9opQId2NISc5MiThM+887pH1CNDP9Pk=;
 b=bXxjL8AP2z3qb5gBlF5mF4xyHWfPqRIPqX6p3lPxEoygIpzateplhDGfmb9QdNyvUF
 385KxZGywCNH1Xh5TLQ3Q00wy4A018xdqOIm8VvMJmfwEcaCZtbHyhtT/9VLOtmfYB84
 wWzJ1uK2/3vPn6ILI94S2sePhPP+DoHEP2vJvBRndKwxy6jAgPHNRLYuQyXTG7hOF+/v
 JKmQSCRgBdkRFbfb+rb2m5cNIykjOFmUSebdVDUCUoWStJLswS+e5Mlrf2GcTV26HUjg
 48zcEngMWe5u/N1nkzZvdzXPB4yoAt1D/FktuoX5CjPKkLMLF/RB6a9TZ0mDX3OWyPcy
 z78w==
X-Gm-Message-State: AOAM530Vb+8USYZlASP19cP34k9jvXvhowOESLFWfwvURVpoD+HN/dHL
 0I664Hpc2Z/5dfH6F9hdtvl8GAtLcBpt6A==
X-Google-Smtp-Source: ABdhPJwrI6WauOubxrn549x+WjGZpuHmydRbAOkpJJAQdP/AjDd16NqnHa6fWiUacM+Yt+Y4Z//fkQ==
X-Received: by 2002:aa7:9706:0:b029:2f2:4481:1e17 with SMTP id
 a6-20020aa797060000b02902f244811e17mr2727407pfg.53.1623199869419; 
 Tue, 08 Jun 2021 17:51:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a9sm2818273pjm.51.2021.06.08.17.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:51:09 -0700 (PDT)
Subject: Re: [PATCH 31/55] include/qemu/int128.h: Add function to create
 Int128 from int64_t
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06a0666b-e982-347f-4ed2-22f3e7dc04f3@linaro.org>
Date: Tue, 8 Jun 2021 17:51:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> int128_make64() creates an Int128 from an unsigned 64 bit value; add
> a function int128_makes64() creating an Int128 from a signed 64 bit
> value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/int128.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

