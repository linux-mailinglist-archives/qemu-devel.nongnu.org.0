Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC81690DC8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 17:02:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ9MU-0001uB-VY; Thu, 09 Feb 2023 11:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ9MO-0001tT-5w
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:01:23 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ9MM-0007OG-IB
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 11:01:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id bg26so1810748wmb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 08:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hFfR97IWlYEUySHxDMXaNT4lk8Vjj6yEHXzRkFYki3Q=;
 b=IDJFZnHpldUMQxS6oo7imfD8thfh3ZNMAibc+vxusQSCdc6RRnkMpaeNVTBUhYs/84
 0yWEfFsr2ZabTl/jVprRCx2kpNtHXf/xqsNBARa1lRC+/fp+Ma9jTQmoruEeZSFGG6jl
 AFW33UzFGOOlfu0ZUsZ8MG7h9RQmR7ZgINklVbudwepBaF45bM/+e4y9vfK24q94adrz
 eaRgU92l9AH7ZzbQZhUwxgqBRRTekAvFBRdF7ipJzY0YU/Si9y+usUs3v09yCSlWK7xk
 9pI8gmPrbV4BYs0/GYXKsbrM8LeksUgaCPIxZ8jiUQ/49Ontv3oHkrUrzLaB15SVm+TI
 xcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hFfR97IWlYEUySHxDMXaNT4lk8Vjj6yEHXzRkFYki3Q=;
 b=x3CE/UldXRBs6gn8SpYgzglTwOUPr4iakXEOVMuxveOMR2CrAmaMF4Lip+XnzkAly7
 MlkTasP/HooT0LGgqZDqK2Jth49YqJydicu3ASvbijc4lsv2GAwtI4FWATU8wQ2EadAr
 eU+xaRqXiAEMQJqdWztglvr105go0dCBdhJMHlbcTAMV3+0shAXZhNQtW7kfzYpWE5wn
 ByOyLaFS5VQB86OXopIqPB+kAEZ9FGh+151Yk53ATH/F0KiOmu1+dCby150P7px2QCge
 iUZdE/gswnoIc7Jn5Le9/Mclgk1Dg8WAuHLyN6mWSZI1dh5x/aGZNgRzaVVFRAXnTTrb
 T7mw==
X-Gm-Message-State: AO0yUKUMOVGFs9GPDKSQzAplkxFNREDhau/9gVdZRgrt7CoSmg3J8uJK
 tQTPCWXycmEqKbsuLVsMquEgyg==
X-Google-Smtp-Source: AK7set/RJx0VdZENcz24un1MJTWEmgA2QKCagZy1nR7et5+HTt5v+YK1kWJW/gu2KS11cjAJo/rvhg==
X-Received: by 2002:a05:600c:3197:b0:3db:2858:db84 with SMTP id
 s23-20020a05600c319700b003db2858db84mr10637214wmp.34.1675958475912; 
 Thu, 09 Feb 2023 08:01:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c2ca400b003dc51c48f0bsm5590066wmc.19.2023.02.09.08.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 08:01:15 -0800 (PST)
Message-ID: <e91dd704-dea1-7a43-6237-453271a42e62@linaro.org>
Date: Thu, 9 Feb 2023 17:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/7] python: support pylint 2.16
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Daniel Berrange
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230209154034.983044-1-jsnow@redhat.com>
 <20230209154034.983044-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209154034.983044-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 9/2/23 16:40, John Snow wrote:
> Pylint 2.16 adds a few new checks that cause the optional check-tox CI
> job to fail.
> 
> 1. The superfluous-parens check seems to be a bit more aggressive,
> 2. broad-exception-raised is new; it discourages "raise Exception".
> 
> Fix these minor issues and turn the lights green.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/qemu/qmp/protocol.py                            | 2 +-
>   python/qemu/qmp/qmp_client.py                          | 2 +-
>   python/qemu/utils/qemu_ga_client.py                    | 6 +++---
>   tests/qemu-iotests/iotests.py                          | 4 ++--
>   tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


