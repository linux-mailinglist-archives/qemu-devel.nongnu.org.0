Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACCA66BA52
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:28:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLmq-0006Ob-3l; Mon, 16 Jan 2023 04:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLmn-0006Nx-Bz
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:28:13 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHLmk-0004oj-Nm
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:28:13 -0500
Received: by mail-wr1-x429.google.com with SMTP id b7so834707wrt.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=is9hRRlNQiV6AbwyoFdf53qV/eeBCbt8e1hO4wn323g=;
 b=rNxHixcpkhogQ/EpnWUYUgKfNiIHx5SFcvSOjqWI4o9oEHDSLoN+GKP8pAuHAC4x0+
 RL6tQxlnd+kAIrzXXyaoCG+7vHhB9gvVXcrFmXcPYK6fu6y9N4Q2hFYtL6pyZxpshtRh
 T0avkrz+kndYhdv9EiSAPLaQtK+T9I8f1NXX2qnCneekpnrmJJS0LhBH9e3I1HqnrtQG
 Y6v7Bgp8Koz9wC8EUHdMMNezsqVdTyDM+6wyOLJwzpIMFYvjJYdEBG/aBrF8rY3PjdvO
 SmLiOZZyBW2pJKCX9tznjf5UYbfB9R7ZFBoVRfek0imAMXfCw1S8A08Nu/y5e7no20ag
 Ej3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=is9hRRlNQiV6AbwyoFdf53qV/eeBCbt8e1hO4wn323g=;
 b=F9furiDOSE2txPgg54mIXMdF0xUSUJf2ksn9WTwAGk6HZU3wPqCMn7fopFnRgRIzII
 jmjimf7a20rY8dh5H/as62qPNM/uYpN46FjQ4o3tUpcDBv194/U/38BwvaHv4cQi/x08
 4PaVtYBrRxY/+JwYL56Qhi8RoqoJNaNQkshD4vTAVkc9wvg5LXw5B/rYUJQtW67zk5wL
 TuWvk+erSv+Dd7mjiOmaF5HUU6rZYkbwjQ5WBWdPLtxVaL7n4aIf+MqNiDoMKZzwQUDX
 YZPI2yZfox5xT3YiG1VDluR+N+THyDm7YsyvxWhcqetILx1vk/tPOkfocTUWjf2oHFyG
 ZoEg==
X-Gm-Message-State: AFqh2kp6SGxxSqoG00rMBhjXXrJUwSw/hz+4v+XN9PZpRScjzaMS+HO/
 7RaFD+vGCl9WdwRWV/ei5esleA==
X-Google-Smtp-Source: AMrXdXsRMl5INkk9hoEMQBEWRh/omvw9HyW1s0p+L6kjvAZ51Pu/XqqPqoJ/PEqyuHhTQnz9Bi6WuQ==
X-Received: by 2002:adf:ed0e:0:b0:2bb:eb1d:bbac with SMTP id
 a14-20020adfed0e000000b002bbeb1dbbacmr20685863wro.12.1673861288790; 
 Mon, 16 Jan 2023 01:28:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w4-20020a5d4b44000000b002366dd0e030sm25578068wrs.68.2023.01.16.01.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:28:08 -0800 (PST)
Message-ID: <28bcba3d-9e6b-0c3c-6581-7faa4824a72c@linaro.org>
Date: Mon, 16 Jan 2023 10:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 17/19] e1000e: Remove extra pointer indirection
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
 <20230114035919.35251-18-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114035919.35251-18-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 14/1/23 04:59, Akihiko Odaki wrote:
> e1000e_write_packet_to_guest() passes the reference of variable ba as a
> pointer to an array, and that pointer indirection is just unnecessary;
> all functions which uses the passed reference performs no pointer
> operation on the pointer and they simply dereference the passed
> pointer. Remove the extra pointer indirection.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000e_core.c | 38 +++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


