Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B8E444E03
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 05:49:23 +0100 (CET)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miUgk-0000CE-8m
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 00:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miUdU-0007Wv-W6
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 00:46:01 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miUdT-0003ly-Er
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 00:46:00 -0400
Received: by mail-qk1-x732.google.com with SMTP id bl12so4542448qkb.13
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 21:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A/4jDduD3moqpzWsw9ua3yPD58KPiC8zFuSBMWcVkuA=;
 b=uyDsjYfu6a2Hq59nOxZh47hS1E+QRsn4JebFHBbMZyhDDG0W1y5nuxxBXZF0CoB9lJ
 mh8Z081NB8h7tN4HQOVNQcyTrX1PyOpV/SKxqvAbMMh7JkC2Vlt/3USDMxx9YrV+JXIc
 Ur80qGq97Cs3Ix5YFbUV753FH2hPA/U8a7b0K5/G9I83qapfYgo+Gk7sZ7sGY/e9mUuq
 /3iKQFQPbNHhNUWVC8/du5FFyd9/tpofSXhR9ppKwe6Ta9fkNoJARgV+PHmoainaFtzP
 0s66zYxf/5kKNFG/RT0SfHAK7vH06Aqf/iMXGgn1H4SiaaPDsSCskNBFcGXz1CawanYT
 dYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A/4jDduD3moqpzWsw9ua3yPD58KPiC8zFuSBMWcVkuA=;
 b=8EcrYxKfvY2PUyh4EiIL1ZQ4nxyjQpAnoasGGV9Vv7MGHh7I47s+Q4j/1UC2AUGSR9
 qxliYnodzqtmgcjXsRDD4fV4pAzn1oKXhsHXS3u9LfuTRO0bKakUo/HlSsfCqiM508kz
 pyJJgR7TUysbRU3TE6W1VJR+OU2CwA2Mo8w7u1bgMYqpvKnkQ+drvYU+womNwGx6eT0d
 xahHB4p6pYCgtxfVUuDEuBY1ZkX8rJWnDOpn0/azoaBTXD8xfhejkgmiJsVupz+qK4+n
 wbyhNTCqHeUiSE1UlOeXVV+gmGS0inuj5LD1V7UWP6jRDNTy6U1OwA2TWEhKcIvIVjFt
 ejXg==
X-Gm-Message-State: AOAM531hq4NP44ZtHUUu1QK/EaUg0amQqLBPLJ1rQgy0wiSZ1v81amHa
 nYUmsfnwawd8o7UDqY7Ih467eg==
X-Google-Smtp-Source: ABdhPJzESy6Uz+XHLWLrQljEVsId6cG7fLEjgtFbVbAgIrz1bWZDEkA9VRu8K/BhAiPoDmscayXMEQ==
X-Received: by 2002:a05:620a:134f:: with SMTP id
 c15mr38578387qkl.97.1636001158423; 
 Wed, 03 Nov 2021 21:45:58 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id p187sm2798325qkd.101.2021.11.03.21.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 21:45:58 -0700 (PDT)
Subject: Re: [PULL for 6.2 00/21] testing, plugin and gdbstub updates
To: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
 <87a6iljgsh.fsf@linaro.org>
 <SN4PR0201MB88080FAD370D8FFAF244168BDE8C9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <347c69bb-8b43-4299-b858-e58d2b76e0a1@linaro.org>
Date: Thu, 4 Nov 2021 00:45:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SN4PR0201MB88080FAD370D8FFAF244168BDE8C9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Brian Cain <bcain@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 3:32 PM, Taylor Simpson wrote:
> We'll investigate the toolchain issue.  This is compiling tests/tcg/multiarch/signals.c, right?

Technically, yes.  But the error I identified is within the packaged musl libc.a.


r~

