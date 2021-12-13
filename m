Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BFD4736A1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:40:36 +0100 (CET)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwt3h-0002Kv-Mf
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:40:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwt2U-0001gf-Kg
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:39:18 -0500
Received: from [2607:f8b0:4864:20::533] (port=47053
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwt2S-0002v1-Ae
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:39:18 -0500
Received: by mail-pg1-x533.google.com with SMTP id r138so15658310pgr.13
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 13:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BzPC6ZJrizvNLG/ysWEt42l0me1gd7my1zew0Dmga5Q=;
 b=rZS1h7+i7O3azoAyjK7Ohq4w33fAqdH0C/7XcKA1tt3jKpV0UQeqY9+hIi1nXQHecT
 tXQrQ8Ap3XPoxIq512Hf+h70FXDhqXgSoIait1jPW/O0tQGHvNVx4xOaR1JMiiw0Nh70
 cnU2Q5XOahaXwD+e9k1HZjinKESrxupe6BD2lzHw0PLV5J4Xt/kLjEpK1GYA/UsDGb+U
 a5FJzj+VqB5FXgfvvQ8COxHHwOPa+PIkht4MagjOF1xbKrRZIjqB2xDjJFFtb5u70REC
 kCT21m4igNf7O+RynwANosHGGsikXrpkL4e8hWkHZ3TGC32DudGCESJ25l9Q6yCESZvi
 Y/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BzPC6ZJrizvNLG/ysWEt42l0me1gd7my1zew0Dmga5Q=;
 b=PiYl4PuotKEWmELy9Uj6RkfhGx1bUiz6u3toSAaodZ9mIoOJmBKMgUj1Y1Jzh1mDCg
 lx/j9t1HNu9r9wfpWtxn1tDE2e7WH/x+cf1IuXiinVjTKHPWBSSu44zCkMezRl8ojY6U
 Bdz6C4cuqsEiN6UVqIaU59N69tSk0o1u3M9kMDdVwDH9GEEFFv70NCCGyz464/860vIA
 8DiZ+vPBYXGmb8o8IDeMAwynMkSUNrDbTWifL8HPa1HTDuKGm0zSQBO+bo0cZAW7iHoc
 QL8qnrF1vKatH2/3Ql0DHNX4eGoGEKkbwrYW8qIW9OdHIogFa3Vn/TgihHDT+k74d3Sg
 oEOQ==
X-Gm-Message-State: AOAM530Z9jwf/T8yeVEKDGU7Fz8sbspj/fBGE21vjoVzPHJGOxjpqyu/
 ERSc2PxwVg6QfOe8vrzqQE7lDdKJ3ggNNw==
X-Google-Smtp-Source: ABdhPJwjHWXddxxz1NH8mrxi1+dvFV1hoZ3vUAn9x3jQKMp/lbL4I1+4yhFpeMT7oJghIwLHsg8Ucw==
X-Received: by 2002:a65:654a:: with SMTP id a10mr939016pgw.22.1639431554277;
 Mon, 13 Dec 2021 13:39:14 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id np1sm78813pjb.22.2021.12.13.13.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 13:39:13 -0800 (PST)
Subject: Re: update hexagon float ref files
To: Taylor Simpson <tsimpson@quicinc.com>
References: <c54f6905-5826-23c3-c619-a19eca3a4c86@linaro.org>
 <SJ0PR02MB8815EF1B9B3DBCD70E86DD9BDE749@SJ0PR02MB8815.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <194eb0f9-12d1-0933-7f6f-f711d6e9f87e@linaro.org>
Date: Mon, 13 Dec 2021 13:39:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR02MB8815EF1B9B3DBCD70E86DD9BDE749@SJ0PR02MB8815.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 1:31 PM, Taylor Simpson wrote:
> Happy holidays to you as well!!
> 
> Sure - would you prefer a patch or a fresh copy of the files?

Which ever is easier for you.


r~

