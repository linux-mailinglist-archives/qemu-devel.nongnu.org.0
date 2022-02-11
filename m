Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE54B1AAE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 01:48:01 +0100 (CET)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIK6S-00041t-6R
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 19:48:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIJzD-00035T-TF
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:40:32 -0500
Received: from [2607:f8b0:4864:20::42b] (port=37766
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIJzC-00051J-6g
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:40:31 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y5so13309525pfe.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 16:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yiU6WCpUWi6z0EUYNaUJqF0SyBYgeRDhF+hJUYIKmeA=;
 b=oMARt/112Msi7JEDIxI5wRLFMB8D4Gt7SVt90m4FKwf8hVlSb/9DLCDNLQl9vrr6bq
 sokFFNBnvmW3JRoB6Mrxsk0sUsYpJNyKokhGn3hm2u7VQ4cKi2T3t3Y2RKkmtYbWU5TT
 i8toPQTwJTxmqVGjaGN17Fao8RWbzPRi3f4Tn1o7+CzrlramXAJregQSB0ZU+VivJ2fo
 FlegCyX8y5FVS1srlb2H7oyb9NeEvG/1bwikMItequtWt9n/j7GvGj/754DdppjPshhi
 EsgFA9q+WURChlhbqD2kv2xdQ5heRV8lgOesFTKrr66NjGX5xFAbvdYcmnjMIMVIWg9Z
 WbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yiU6WCpUWi6z0EUYNaUJqF0SyBYgeRDhF+hJUYIKmeA=;
 b=BXljE6zd9qZP3aWwtmzp9m2gUJ2H2sCXYsjvwMt7QmH0IR1QVPGxnHVZYNiVNt4spa
 oPmpR3yK3jzYwHCU+9OWfm4W/H6yJ+YDUlqlgWb+xmI2ErV8kQJztpTt6p68YygalaYH
 ZVbPhz4Ujtm9T5ZFwYTr7tuiLoo1CLFQf7CKPbr+usjbX+Qt4/S9SV97LstZvjBYuejO
 FiBfkqf2bzXvAdE8lSfs/OGWa2HWIAKtPrvzFJO9GOJG3Uxk2VZQEryv6Q0bO4bA/8fn
 W/qoF0iONNt5TYRd/lnctMD38GOveeCWuHkr8FRvw5VObsdOJ0BJy3j6KRNToNbkuPGH
 qFrg==
X-Gm-Message-State: AOAM532z9MAC2SMpME9G9WLONpqqcLncY/RueA6tJdKsoAf65kYVdZK9
 eid0qjNI8XcSZ/qB3kj+xmoDTw==
X-Google-Smtp-Source: ABdhPJxmfc21btjG52U7+2BoZlEf8DoRII0VDmFWD0tztPTD8QebUgP2ELZGAn6MLiixXUgISLwBhQ==
X-Received: by 2002:a63:4147:: with SMTP id o68mr8346061pga.476.1644540028756; 
 Thu, 10 Feb 2022 16:40:28 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25669775pfi.111.2022.02.10.16.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 16:40:28 -0800 (PST)
Message-ID: <e5d8a52b-0627-39a0-aebd-1504ebc5c86b@linaro.org>
Date: Fri, 11 Feb 2022 11:39:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/12] Hexagon (target/hexagon) fix bug in circular
 addressing
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 13:15, Taylor Simpson wrote:
> From: Michael Lambert <mlambert@quicinc.com>
> 
> Versions V3 and earlier should treat the "K_const" and "length" values
> as unsigned.
> 
> Modified circ_test_v3() in tests/tcg/hexagon/circ.c to reproduce the bug
> 
> Signed-off-by: Michael Lambert <mlambert@quicinc.com>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/op_helper.c | 6 +++---
>   tests/tcg/hexagon/circ.c   | 5 +++--
>   2 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

