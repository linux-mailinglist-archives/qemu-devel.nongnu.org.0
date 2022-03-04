Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762B54CE142
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 00:56:04 +0100 (CET)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQHmF-0003Kt-8E
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 18:56:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHk4-0002Ep-8Q; Fri, 04 Mar 2022 18:53:48 -0500
Received: from [2607:f8b0:4864:20::435] (port=41836
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHk3-0000Wm-05; Fri, 04 Mar 2022 18:53:47 -0500
Received: by mail-pf1-x435.google.com with SMTP id p8so8888741pfh.8;
 Fri, 04 Mar 2022 15:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ot/1RYIsi/u9PlYsiFuK7XlXxkuHnmPUD8ShAIAKs1g=;
 b=KUd+DKotVqx6+AI29nZ4TqIfl2BHhW6VzGGVEzkoqkVMQAtM+KPbMGB8vcJvTWPm9E
 wCeQ8NsFFECVbjRrHovNj5Lvgnl6q3kX0XCplT/jJ5v5FejjNS/tOC8GaxnFLtISASG7
 zx0a71xmmFMgMyTzV/77d5I4t1Rl1vTbqcSaYCN3WjDc0663N96OA1GdqcjUcUgzH8sO
 Jz3X+o7QarY2oXdv54sc5m/c5sT50MNUsnmPvdxY4ahv/hjeS3KsyQC8XUuNGYXluAd3
 1rKyJ+i3j3+g+jylKUV41yJQpu3tDpOzVN7aNboINkiKUxoHqoCl2vByylfjlkcg8IlY
 KWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ot/1RYIsi/u9PlYsiFuK7XlXxkuHnmPUD8ShAIAKs1g=;
 b=KsqQBT5xI/rq11fCzcE1S80sNNPU0NxuhkmsNPuvUiiVDd4EbWR0CXDXnjWsLhWUma
 oLU5ERa8LVzspqdS7cCQh76owMBtxw4J2zSmpKOsjiBahXDG71oqk0x3N/9xbxlPwEqk
 fnGHJPuQmxbHMZmObIwaB/itXWlff9/SWfPg2Da7Vv6VYfqhb3rQ3Ov0aPxMM4bDhmgq
 UeRCvf3Gp2xTmipdzH67yejAN/Mwb7w8O/XJ5YrMh+Ch+8+QulY4IQoSi3nlRVh0/6gJ
 vxjjHyRISXRoMfA3PCaACtYnry3xovdkE94OJRNS6Bz+mnCurnTo3dRljSvr2J51Zl4X
 ZiZQ==
X-Gm-Message-State: AOAM531jurodgz/Sdp2txatVzMpQJIDdGLl3p9CfmhXJ7+dVhsEqv6Fw
 z06FlQ6l5R7lHFNJwedcitI=
X-Google-Smtp-Source: ABdhPJzkYcJoqyOnr6L7P2jZgkPPzbn8CgGx/MG2Dxuop7qESmWBx/B3M3rRmrn3nLJOxm24JZVoDw==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id
 l13-20020a056a0016cd00b004e103667ee8mr1003197pfc.9.1646438025225; 
 Fri, 04 Mar 2022 15:53:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 2-20020a631342000000b0037487b6b018sm5368261pgt.0.2022.03.04.15.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 15:53:44 -0800 (PST)
Message-ID: <e6720b50-4c0d-6208-b285-771fe2bd9aff@gmail.com>
Date: Sat, 5 Mar 2022 00:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 6/9] hw/i2c: Added linear mode translation for pmbus
 devices
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-7-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-7-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, venture@google.com,
 Shengtan Mao <stmao@google.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 02:50, Titus Rwantare wrote:
> From: Shengtan Mao <stmao@google.com>
> 
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c         | 18 ++++++++++++++++++
>   include/hw/i2c/pmbus_device.h | 20 +++++++++++++++++++-
>   2 files changed, 37 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

