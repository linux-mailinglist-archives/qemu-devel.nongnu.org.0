Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A810358A2A7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 23:07:29 +0200 (CEST)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJi40-0007vt-9u
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 17:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJi2X-0005zl-3A
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 17:05:57 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJi2V-0001KI-61
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 17:05:56 -0400
Received: by mail-pf1-x429.google.com with SMTP id q19so565442pfg.8
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3kE+IB78C7bOq6+MzkVZh59fukzUH1rdLWE+9gBsweU=;
 b=xYzC0DcVwL3Dhj1/ROp8clyIBAQ5tdn+4c3TtDAy2KvmpN1HTrRBMsTex9hNW+yj1y
 bxc/Ha+xPFp8M0rFfBAek0gffqWdKikGTUTvPRjmTGOeeCiBopLQxLKPubxIZ+8xlT7F
 NZ7kXuTwwi7ppm6uUlsnxNoyR5dY9AKlZR3kdCrvgn8ouVSTUBPYqfzKz3U5exriw3wt
 2eYjbJR4yelXYenY9FMtkfX6eJtSWvj4q+SkB12mqyvRnB7HoI6Vdq9IrcU4EAr5ROdT
 LOMNeETzl49xyiEVN1XYdNcZXjACmiW2afQRzj/54cCDdDM80pLCQ5il14L6jXy2oL7j
 5QWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3kE+IB78C7bOq6+MzkVZh59fukzUH1rdLWE+9gBsweU=;
 b=AVytvPzFPfJIafdrGVXyhqKbE+Io3Z6EphWtXytTe/3H2pbZC71ucDB/DPb71Ouqgj
 1/Ztw/5AOYGAG5uIaBmWCH1gDR/GIxbs1K6RVUIguuqNQQ94hoOKZQZNSEHvd3tvBW8n
 A1Z8zpU1tJFz8Tqgjuy+hUx+9e678J5aJsXsrLoWCupFzXAWkcF1uDJOWs4o72MP3uD5
 ygoWVN7iI00hzAMERVVcYC0DqDcSR+2hh4yaUoCMbY0KZ93q3sxWq92fpOfnGtZmk9yD
 drwRxvqE0GR4ewILw9lzbr13SvKC89BAXqO/O/hMRP5U5Y9dtE9g80g07rBzn7p6alAd
 qXbA==
X-Gm-Message-State: ACgBeo0cMTrDSuQfW5f4riuCUurheGEq4/OTz93ADLoK2viAexy4k4hK
 amXdBMEinCIbrD6fciJXgqtnhQ==
X-Google-Smtp-Source: AA6agR5esHRO+VLEfosfqrZpPIWopi6Gp2unZNagXMmh725uF6SB93JNWRr0MyEnaM6vMwkGjaiCfQ==
X-Received: by 2002:a05:6a00:1343:b0:52e:61b1:4a9f with SMTP id
 k3-20020a056a00134300b0052e61b14a9fmr3673653pfu.6.1659647153536; 
 Thu, 04 Aug 2022 14:05:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 q18-20020aa79612000000b0052dc3796cc2sm1399615pfg.164.2022.08.04.14.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 14:05:52 -0700 (PDT)
Message-ID: <273155b5-fde6-06c2-80e2-e11143bd7595@linaro.org>
Date: Thu, 4 Aug 2022 14:05:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/1] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220804184111.2770822-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804184111.2770822-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/22 11:41, Daniel Henrique Barboza wrote:
> The following changes since commit 2480f3bbd03814b0651a1f74959f5c6631ee5819:
> 
>    Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-03 08:32:44 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220804
> 
> for you to fetch changes up to ed021daf2d6c19499ae406055156dc19c073228f:
> 
>    hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[] (2022-08-04 15:20:14 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-08-04:
> 
> In this short queue we have a fix in the sam460ex machine where we're
> not storing all GPIO lines in sam460ex_init().
> 
> This is not causing problems (as far as we're aware of) at this moment,
> but this is getting in the way of a ppc405 rework we want to do for 7.2,
> so let's fix it now.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel Henrique Barboza (1):
>        hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]
> 
>   hw/ppc/sam460ex.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


