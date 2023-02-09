Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC96901B9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1sd-0008W9-15; Thu, 09 Feb 2023 03:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1s8-0008Kd-JU
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:01:41 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1s7-0007Ss-0D
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:01:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id n13so818262wmr.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tmRoJe76UjiVK+MIlcbOLIlOgVTVMDp93aHkKvAgRYM=;
 b=GXGKBH3NLO8J1CgiZZ3XFVvIueZ+Mguy/8ZmN1May+VEoWwtHVqWTl+JJC1J+TvTZK
 Ngo1dVPMqDIBvVBMrAey0OyHJaazbf0zsow4ZwepDS3A6po1H33tLgkgMTZhPS6usJEV
 xct/WtvB69ia9dn8npa0cfY5jMnXDK7D3H2m/JAyNRgavWM6xCEX7cz5tUGswW5vk4+V
 rt4KkhsxLmzCiuwudgDPpQS/IpUXXctjldE26LQBj5i2RMRLUEZG2KVKAOyO0UbRhEdy
 Fg3wyJtCnxOUMomHmvOuX2/ShdQQv078W/YR8vFvSNgfxMb9eA05PXZh4lVBSomxxPHH
 Hn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tmRoJe76UjiVK+MIlcbOLIlOgVTVMDp93aHkKvAgRYM=;
 b=tiEv9fJT4FQPzCZXMmM9OwFS9otp1G1alFw56zWXLaSVTqQETI45Po3KFNTKzzWSDP
 8s6y0BtTgAY7IFV1eyjtc02y9EUj7F71DHucZU/O1Xgf5QTLSo66FCcdO4BwReMv9ijn
 EyA3i1Bfeog0F9crVKwxb6trVs4XA6+XLAVPsP5TdiZw1/dmB6GevklTqFZov2bxaBVZ
 avwY9LEOvi07CQdIzgmVS6RnQeJzgzJjiSPxyLVmzGeB405eKYzCKgDM7zp1ssaiSVvO
 NIJRmH8Qzxq0X6vSeXKrRRzQ5IlQ2tiqy+4mv5qp3yyLIfENxDYWnPw7qKY2mqFhlqcf
 FNQg==
X-Gm-Message-State: AO0yUKXXwUO8Q1gvz6H3FLni8ENio7eMRsxPq6n+Mq1nIfK7dNFNHbHm
 Pe900smoI1usm27Uya5dm/duEA==
X-Google-Smtp-Source: AK7set8cObDVV40MrUXbK5VA6QJvmj6G9zZHIIx+N41jh0WhNQaFgenNrfuGzTndzhvna3MnMMnO8Q==
X-Received: by 2002:a05:600c:164a:b0:3df:deb5:6ff5 with SMTP id
 o10-20020a05600c164a00b003dfdeb56ff5mr8848049wmn.24.1675929691400; 
 Thu, 09 Feb 2023 00:01:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d4304000000b002c3f03d8851sm587872wrq.16.2023.02.09.00.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:01:30 -0800 (PST)
Message-ID: <5f7e66f1-d0b8-f21a-535f-7c3e03b05fa4@linaro.org>
Date: Thu, 9 Feb 2023 09:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 4/4] hw/i2c: add canonical path to i2c event traces
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au
References: <20230208224339.270589-1-titusr@google.com>
 <20230208224339.270589-5-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208224339.270589-5-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 23:43, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/core.c       | 8 +++++---
>   hw/i2c/trace-events | 2 +-
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



