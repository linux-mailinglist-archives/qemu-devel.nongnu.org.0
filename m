Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533E64AA342
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:38:20 +0100 (CET)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG7Df-0007CA-3y
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:38:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG7Cf-00064Z-MJ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:37:17 -0500
Received: from [2607:f8b0:4864:20::1036] (port=40829
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG7Cd-0000Dc-NA
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:37:17 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 p22-20020a17090adf9600b001b8783b2647so1175827pjv.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 14:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4/swoDCPKUQzGIExlL/BbZpTnXbMlYbHtL+koLcN1og=;
 b=j1wxNwlfbbDCZjtGxDOeLuV8yhgZuS1y6Du70iW3ACwnCfct3QnUlMlRKLLMaopDc6
 ICqpxk4jtbYOxJSeEY7Zu9GJ6fVd/kYJdosgKaTxZNJVkNFarcYcvSh5DGrEqXbEv1wL
 LvCsudfLwqoyWUQYjWp1tZrJV3N4c9xlUNzV0XVpM0ectmDvwor5jLLASCILZLpp8mKE
 qtZXVc/nuZouLU1kMmbwZnmiOoqOM0X45/ewt+y1grSQignigD58jEPbi3WjL3URkcOJ
 aP9KVbZevZQAfQLZuiCL2mOtwvBlpTXDkSkzdHOzyvcsbk+9+d2HBsNOH+nb8wwhfxMI
 ZIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4/swoDCPKUQzGIExlL/BbZpTnXbMlYbHtL+koLcN1og=;
 b=BsXKe4KkOhM55UEguypSmTe63kleq8lL0G3yhKNrxItHiS0QiIQXcfQRI5xptm1IF+
 D6t8HRr8ueBttHNtnk7TyNqSbRGsgQX9g16vb8CNrGp9gr0vbVBtRXxFjt22UZ/5hP5G
 sgC+KiLuDg9do2ttdVsxwweLlxwUa3V3Sr+2Pheragfu+GgKEQskFM+LWuHplMWmP8wZ
 d2VHIgEPwus2SEu2t6L9ypXrqwSKP1FuSJfMfYxm49/kcAem7o72ZJSTj4+oC42eNsE+
 mzoKRWDr/QZy6XAM/0ii/DQBSQXOe3qGMiMwTfPUsf/gY1zegkQqwJKvWCm3bPCY/H3A
 HXtA==
X-Gm-Message-State: AOAM532go2toLCtY+WIi+X613ZUjB75YEsw1IKg3ZoJgN6rT/8GiU/p1
 oxL0HNmx88XwEOmuimqzG14=
X-Google-Smtp-Source: ABdhPJz3S475JFn4vCle5dhHfyuglfQVdYnx4MziLHsL0O3fphjOrRODiJ5NPKSmZ16ZgV1x6kLlUw==
X-Received: by 2002:a17:902:f682:: with SMTP id
 l2mr5394099plg.114.1644014234297; 
 Fri, 04 Feb 2022 14:37:14 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id lb7sm3134396pjb.56.2022.02.04.14.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:37:13 -0800 (PST)
Message-ID: <b7b5dff8-3d18-8242-e1a8-2357132560a0@amsat.org>
Date: Fri, 4 Feb 2022 23:37:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 23/26] tests/plugin: allow libinsn.so per-CPU counts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu,
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-24-alex.bennee@linaro.org>
In-Reply-To: <20220204204335.1689602-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 21:43, Alex Bennée wrote:
> We won't go fully flexible but for most system emulation 8 vCPUs
> resolution should be enough for anybody ;-)
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220124201608.604599-20-alex.bennee@linaro.org>
> ---
>   tests/plugin/insn.c | 39 +++++++++++++++++++++++++++++++--------
>   1 file changed, 31 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

