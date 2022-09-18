Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EDA5BBFF1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:51:53 +0200 (CEST)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1Gb-000131-1b
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa12O-0005Lm-OZ
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:37:13 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa12M-0006QJ-Ak
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 16:37:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so4971561pja.5
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 13:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=awfvEuAd03HuXz4HgmzYqUtNYIleX2Gr2uHhCVon+3o=;
 b=D4pUYZq6digjpnuN0MWpVXaqrpdnFuu5jJbmh6aTGK90HWjhpqD/nQgJIanilccYd4
 8INL+537pWyH3A3m8a2DvH0FNZZEOphFde+a0o6Of9ZVLJRolRNgkaTmSsz35ZxNBj6m
 8Fi2vRj+hI8koISP2FjFJafyapxKCIg1GlR+CC20R45rQAs2xsxCMKcJLeuubk8pg7mC
 kcqvlbV9fLKfdNsHrpj2kqGya0HtzT+JVBDwYmkWTvbJgctJDyh6uLaq6EyI0NOLgZ2W
 hm4p1R3XfdHAbjpSC2pQ8si3g9fZzEcAGWydNYvcvV6zmRaX72YUft3BH1y2lixsc1ah
 5Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=awfvEuAd03HuXz4HgmzYqUtNYIleX2Gr2uHhCVon+3o=;
 b=jkhpF94JX72f+aFPbyXpXCmXcTIuAuZYHEHZl0D8u6Swcu2KMJ4Ivo7IJcfg8zwMtI
 EiRvAV3/Aep9xk2aCLBVEURIB8EYt6xSpKbjuISHYsANr3NTbz4ElT/GoM3ISD2i0Rs2
 FvNe7JOsftovNwouqi/2iedOGp+3kv/bTxGxk2RJ9cJsPYKRPO9VnTDQ2J34YQSUR4/Z
 ZKZiHjDgQl6Mcyk/myCrUhNS2PRZIwQPXNcuign9nIzwLWAKBFsfMGq18biUIqdeNdBg
 LpRJSrQQQmcgK3wQFhRf2bUKpcHEbeCWoLbM9ht2pDbh6DA9rQcozfaxT1RWzz8N1Utf
 C8Lg==
X-Gm-Message-State: ACrzQf3e0sXsgd3hOA4vZF9YMDKiX19kMEeq0BtyyCTUXicTp+mK0lCH
 gCnpyye4teEID0Qw4XjsEKo=
X-Google-Smtp-Source: AMsMyM5w4bsHA1h+V1U40oxADSA3+6dphb8PcS4wgadO0YYB57YWH5XKFUTw2PAUBBggCRr4XzSEOQ==
X-Received: by 2002:a17:90a:a69:b0:202:8a60:c869 with SMTP id
 o96-20020a17090a0a6900b002028a60c869mr16752595pjo.2.1663533427733; 
 Sun, 18 Sep 2022 13:37:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a63e654000000b00434abd19eeasm17013146pgj.78.2022.09.18.13.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 13:37:07 -0700 (PDT)
Message-ID: <569161db-c8cf-9ae5-9ae6-161de7f22335@amsat.org>
Date: Sun, 18 Sep 2022 22:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 04/12] linux-user: Log failing executable in EXCP_DUMP()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-5-deller@gmx.de>
In-Reply-To: <20220918194555.83535-5-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.657,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/9/22 21:45, Helge Deller wrote:
> Enhance the EXCP_DUMP() macro to print out the failing program too.
> During debugging it's sometimes hard to track down the actual failing
> program if you are e.g. building a whole debian package.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/cpu_loop-common.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

