Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03A626033
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 18:14:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otXaR-00074B-Pg; Fri, 11 Nov 2022 12:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otXaK-00072a-QW
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 12:12:56 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otXaG-0004BX-Ue
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 12:12:55 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so5814185wmi.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 09:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TEkgpn49ZtuQPQtoF3zhxYpc+WzS1jHpsPT4M/c9Bko=;
 b=zaoLZH4XHmqEobG/wF5gK4YoW+gtGDv1iRwT30SurY6ze2PblKqBj05BizX07Q9/OT
 +DsOWNHSSoEE9EY7jsS/JeprzE/UgwV4JH/9btTsdLjR2alNPDQVjuc6h7KXkhNXkHZ3
 DRWvw8dAMZAlpF/ZyqFDmIsDWmRxsJlQCcaKxFziwBRYSATK7/mtdL79z9Az0boKORBR
 +S7qj3lqjrXHEMGIks/Gjdqh1UTZAb93l48eoc+xpp9C1kFnAamfPIs58UlM7FuGiwq+
 8dOsfYTTWUSNrJZxIsdYKFG0QcXS8mSFMGr56Oz4mpFGe0jiSNndPeswbijfbbEZz2IE
 15oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TEkgpn49ZtuQPQtoF3zhxYpc+WzS1jHpsPT4M/c9Bko=;
 b=6ydI8AZi4yJ6qrqMzpc6MLMoyyBWMg3YJfNzeQw7zDBRoKMPc4hKs4pns94yQI4XVt
 EunrV4e9UrPOd47oNKJhjclZjV0pCYcy1y6qZC8tY8BuljlDOwROmTZWZzPt2Shx1lWc
 JeIfNh/GTcxkiXrg7jRA7g7mzusBMlPvvRERVoy3etz+YEocP/q1wb5fRf+w29PJkzzz
 uRSQ37NoWZpW4n/W88hwnBfAI+POrh+IMEzQL3F1Erb3po35Fj28Tc6cuTn9x3zZO0Om
 2raqFv2WQ1yMz53SecMdtknXvXD+zACLc3nuB2ceIRDwJElGzh/rmkp9UJhlhcQqzPgb
 0aWA==
X-Gm-Message-State: ANoB5pkFnWodE054aHtRQHcA11ItNlj7U8eNwQ4VV9RTD7I32J9XfnQ8
 VCi4icuprzb6a2juTxWOEewQjQ==
X-Google-Smtp-Source: AA0mqf5LmLmqF3bztxQeBUZTnNHfUp1/PnAz23rgKHNndAFyuOaULyOOi4ebrtYCSq5fKQUBb4otOg==
X-Received: by 2002:a7b:c398:0:b0:3cf:8b22:b567 with SMTP id
 s24-20020a7bc398000000b003cf8b22b567mr1920562wmj.144.1668186762248; 
 Fri, 11 Nov 2022 09:12:42 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c215500b003c6c3fb3cf6sm3344965wml.18.2022.11.11.09.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 09:12:41 -0800 (PST)
Message-ID: <727e8e0a-5624-0e3a-dfca-f3941a8c7446@linaro.org>
Date: Fri, 11 Nov 2022 18:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 04/12] tests/docker: allow user to override check target
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111145529.4020801-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/11/22 15:55, Alex Bennée wrote:
> This is useful when trying to bisect a particular failing test behind
> a docker run. For example:
> 
>    make docker-test-clang@fedora \
>      TARGET_LIST=arm-softmmu \
>      TEST_COMMAND="meson test qtest-arm/qos-test" \
>      J=9 V=1
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v1
>   - fix s/target /target./
>   - CHECK_TARGET -> TEST_COMMAND
> ---
>   tests/docker/Makefile.include | 2 ++
>   tests/docker/common.rc        | 6 +++---
>   2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


