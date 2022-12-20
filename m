Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8157652893
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:54:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kYN-000497-28; Tue, 20 Dec 2022 16:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kYL-00046s-53
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:53:37 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kYJ-0004NA-Jk
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:53:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id d20so19571185edn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DYBKwh7FzHYZBaUH5dwhE6g8fewqa9VUrGJENttseRU=;
 b=haKYBZRX5COdBsnmSnMJCBn1DYM0N18qlzDkWY8LCB6/FmUwljEqPhQjlK9478BENv
 CEkL5Vn7YnC2gpxmlwYz6+iheNQG5eb75sja7BzvpP7cPzBS861lXSxlefw7vptwtUvK
 0lmXjuRgZXkqNVWNBwjNtc4MKg6qTldL8xrU4cPQh1X0Hs7cJg9gG2lqi3F9SNRJiShs
 CvLDJDYSWejTpIWriH3DoQbMI+2qp0x2NmTVzC6R1EUlFmgbJngxGUuRWRe5weUAiAzG
 20cdiSv7XLaPzfwwsw/05oXUjDCVdBH2pKqxm2cbRwbwyruFUZYMPQ8bK/FZ6BzuKKp7
 7PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DYBKwh7FzHYZBaUH5dwhE6g8fewqa9VUrGJENttseRU=;
 b=1dJmhNsvB/Ro/thja2TkbWlz68+ZOfBDZWCqBogjUO9OU1xOLZ/YDRCFJ+g8GPvvMU
 oCL0xShL34Ik7Bz9k6w/yHtnY+Cne7+KntbsJ9R8SGRA97GxoVKvruR2u9xrbONsahUy
 XP2/McLyQXLzfq756BRyPz9WxxbWyreHsqmYb7ZW+FD//7ZA0qsC1QCUxLmQByxAGAZk
 FdZ7Mv8Lx7tg6uMFKODw+sBXjLZPnCjwIVc0YfhErjtmJNy6IMkfBZDUcrTwoNbfRnFW
 Y92tzEZyDQAsvnuCq0YJ4D5ltQsTdwxNIzKN3otBwP32p8rBHcIxdi076B4Qa7+22Ep6
 sF3Q==
X-Gm-Message-State: AFqh2kr0dNM6mbRvkbeBh8S1n8XsaAAUuqLC4nNnynH0kxoUMze0UKMI
 dfpL1ae5tPvCkwMlwj9Lvw640g==
X-Google-Smtp-Source: AMrXdXuye2BpL4ynlNh9XO8RfXvZOELp6yUk634YlaLp6FDlFoNLXp/36FHlg6GfLB+9LEocj367Dw==
X-Received: by 2002:a05:6402:1c1c:b0:47b:16c7:492c with SMTP id
 ck28-20020a0564021c1c00b0047b16c7492cmr6345025edb.25.1671573214065; 
 Tue, 20 Dec 2022 13:53:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0564020f0e00b004714b6cce2dsm6112386eda.20.2022.12.20.13.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 13:53:33 -0800 (PST)
Message-ID: <b780ed9f-820f-29c1-4521-1fbb8588efde@linaro.org>
Date: Tue, 20 Dec 2022 22:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/5] coroutine: Use Coroutine typedef name instead of
 structure tag
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20221220154944.3611845-1-armbru@redhat.com>
 <20221220154944.3611845-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220154944.3611845-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 16:49, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/block/aio.h | 7 +++----
>   util/async.c        | 4 ++--
>   2 files changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


