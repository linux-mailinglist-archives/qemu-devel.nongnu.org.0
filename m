Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D745BBFEC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 22:47:34 +0200 (CEST)
Received: from localhost ([::1]:55056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1CP-0002ox-Cq
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 16:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa0z8-0007Ms-Oz; Sun, 18 Sep 2022 16:33:50 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oa0z3-0005pc-AQ; Sun, 18 Sep 2022 16:33:47 -0400
Received: by mail-pl1-x629.google.com with SMTP id d24so3021173pls.4;
 Sun, 18 Sep 2022 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=2biSNsTpuRVqxa6K87u9FLzqbZArBDOnmF48F9uHzh8=;
 b=hs1dbHx5K2rzpRZpQnqO4EkurfFFwYPkYGJnTZz5q+dpPbVNfLmQ4vZOyz73uwzl8l
 lkBfSOuyEVf84aEh6kdLRKiFpEZv05v6vmLpn4OdYuiyppxn9buvwk88oU4ufLkG9usf
 EXrRdxO4c1Y3BXIIfkqvbw/mjvVHjQd3UJnjzJ7hD5yj8zh3cyNZSllgwWzu16xcrNGc
 WmTHNLtt2uv13v3M8CW8wBUBty/+pZV5Y6WZnecsYLs52f8OJ4M3iw1vWl9s44gQR9rX
 urlVs4ySEFTuH8OcxLmaRntOY9rYHJwO7uST3CDfJg9oFBl1K6ODV20To+PlmDoI46Ar
 jLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=2biSNsTpuRVqxa6K87u9FLzqbZArBDOnmF48F9uHzh8=;
 b=7YMHm82aksF7rV/tlvvyq6sm5aRhPUQDI28cM+QVSL69KeRNPVn0qD56X87HI80oZd
 tZ8Et7/meQbAsLMqayz0OCe1y+ryo8r2P8hkHAaNepXq1zAztMLP4Kbc/q1UxDjVYiLl
 dZBwyxGR+WMIRtfs+cdAYWRyabeOdLyKF1/RyCTTW6gSLIUXr6C4jyrJF38mLt/S7tqx
 yr3zNAGurbYGpRZ8UWZEIpiIfSNFgzSdB+COY1TxIJVHXGnWEqJsGR971VPTEDmMZTMd
 3NIzZNnja2GRVvr12vmG7+Xq0DMrjcSUpj5vMXSTGOFQWuNEnjuZCc2GjH2XycO+zKHo
 R/3w==
X-Gm-Message-State: ACrzQf2T1b1i1fVvDRY7LjCJhTCRdf8K7EkuWtChO9B4Gjm/MFyO/aui
 O7oNlGSZjCzcmNyIWrirDcQ=
X-Google-Smtp-Source: AMsMyM4XZETEkF7XRU+ZV6Ld2y4fiCwCR617kngMlyZ1lrmaMXHkxli+9zfFxtATT8abZynJUHvaSg==
X-Received: by 2002:a17:902:eb90:b0:178:25ab:b3ee with SMTP id
 q16-20020a170902eb9000b0017825abb3eemr9721961plg.23.1663533222984; 
 Sun, 18 Sep 2022 13:33:42 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a630f10000000b004340d105fd4sm16979870pgl.21.2022.09.18.13.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 13:33:42 -0700 (PDT)
Message-ID: <77037a56-1723-02f2-90bc-c934dd8a8b88@amsat.org>
Date: Sun, 18 Sep 2022 22:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 00/21] ppc4xx_sdram QOMify and clean ups
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663531117.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663531117.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
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

On 18/9/22 22:24, BALATON Zoltan wrote:
> This is the end of the QOMify series started by Cédric. This series
> handles the SDRAM controller models to clean them up, QOMify and unify
> them and at least partially clean up the mess that has accumulated
> around these in the past. This includes the not yet merged patches
> from the last series and new ones that change the DDR2 version used by
> sam460ex.
> 
> v5: Add functions the enable sdram controller and call it from boards
> v4: address more review comments
> v3: Fix patches that got squashed during rebase
> v2: address some review comments and try to avoid compile problem with
> gcc 12.2 (untested)

When respining a large series with various patches already ready, you
could mention "missing review: patches F, L, N..." in the cover letter
so we directly go look at those.

