Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE76296CD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:10:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outpQ-0007GK-9j; Tue, 15 Nov 2022 06:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1outpO-0007Et-MN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:10:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1outpN-0001IR-53
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:10:06 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n12so35094939eja.11
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9xFxXJhQ39n0aPrBTpD7+Mel5nRfKn3zYfUTuIoFkiQ=;
 b=iKOPjpSZY6xVcdx3cWBnu8HtbGcT5vO88A3CTKMrkz6CAd0MA7R0nIM1adqsupqS9K
 dYrRpcQY4pA2W+ky97S4lVI1kyZqzyM5s/1Bd69XZrOQLMzEJgTba+UuSevv0P6qiU/j
 hNz8WKMJBQZ+rcMsbIgACm30zXbji2YwqFKacl8XEX9fMn2aSe7CTcNJOb27DfCSW0wE
 7l7JID3sc6RmXSx9DeIqJXV4ddEXF6/xaaffI4JAxh8tfI/rSe0TsGWYqr7LpQU9stS9
 RTuFsBx/W/EDDOyyZhaZJnrUfXzfoI5r9nQF+JlO8AiwUkTVI88TSPSHLwejqmuvlcVU
 hhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9xFxXJhQ39n0aPrBTpD7+Mel5nRfKn3zYfUTuIoFkiQ=;
 b=y+8KXfQq+jjTJ/fgi/FsSq4/4vTwVNZ+iLnIJN5DMW6Yp9w5xQ/qgnGs9Dj/tlbITC
 fpUqNZAlkp9INWDOmUXN6Fqgz6CvCUCNa7EUTAgJ+WuZIv6nEDVzqgGTGIjEeDQONYss
 5BVJR1/MTa/2Pye6KRFhX4sEEXEElW97ybwxDaAsfTkg9Yr82cP/83He3jINxQpnMK6g
 rOnnynTd2OJ4da4iBX/P/+4cn2fuSx4Q8BJbvbTEc6WxfTdN721RCfOJrQ0mI66QHXX0
 GPknKl8YA4ltyfW4m0b3QoiSfQUcyRtiX/UBrlUrPpHINVz1tFbL7UR7+X2J1M84YXOe
 LLOA==
X-Gm-Message-State: ANoB5pkQYE1GvOv7/Ql02D7xc2BUbvnA3OGN76WgZ1X2oifT966JFbjt
 Q6iKe8kPq1KaKonooM98BdOC7Q==
X-Google-Smtp-Source: AA0mqf6cS138HUSLrySA4LpcPWTt1cWvG9ed+WpJD6RJpBsf2cHA01ll3tYVIPt+fHmFbVn4vyA7Ww==
X-Received: by 2002:a17:906:4911:b0:7ad:9891:8756 with SMTP id
 b17-20020a170906491100b007ad98918756mr13730279ejq.203.1668510603185; 
 Tue, 15 Nov 2022 03:10:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709063d2900b0077a11b79b9bsm5391687ejf.133.2022.11.15.03.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 03:10:02 -0800 (PST)
Message-ID: <228fca21-8627-013a-c447-35535c563489@linaro.org>
Date: Tue, 15 Nov 2022 12:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2] Add G_GNUC_PRINTF to function qemu_set_info_str
 and fix related issues
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
References: <20221115071935.1020799-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221115071935.1020799-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

On 15/11/22 08:19, Stefan Weil via wrote:
> With the G_GNUC_PRINTF function attribute the compiler detects
> two potential insecure format strings:
> 
> ../../../net/stream.c:248:31: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>      qemu_set_info_str(&s->nc, uri);
>                                ^~~
> ../../../net/stream.c:322:31: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>      qemu_set_info_str(&s->nc, uri);
>                                ^~~
> 
> There are also two other warnings:
> 
> ../../../net/socket.c:182:35: warning: zero-length gnu_printf format string [-Wformat-zero-length]
>    182 |         qemu_set_info_str(&s->nc, "");
>        |                                   ^~
> ../../../net/stream.c:170:35: warning: zero-length gnu_printf format string [-Wformat-zero-length]
>    170 |         qemu_set_info_str(&s->nc, "");
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   include/net/net.h | 3 ++-
>   net/socket.c      | 2 +-
>   net/stream.c      | 6 +++---
>   3 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


