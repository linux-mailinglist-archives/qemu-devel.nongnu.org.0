Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354AC610CDB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:16:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLTZ-0001SG-5V; Fri, 28 Oct 2022 05:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooLTF-0001PL-2D
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:16:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooLTB-0006YZ-3J
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:16:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 i5-20020a1c3b05000000b003cf47dcd316so6056524wma.4
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aoKnLQsFbe8tgMzVX7s8TvsgrVkAK0xmtET1C1NjbqQ=;
 b=sL7vjU7SVHra6Tpd4YUITHB+HB9lLMOdU54d4/tX01pDAeTy9cgKgUtLhV0svmEu5u
 u4IzeTjAZrKX1iIsQA0ZdApbgesKnlofv8eA9AWxFZ4fOViw9im3tq3BhXYYYDzMF643
 NXn+/LyflbDeGpCYa0A9fvT1uETfN5pHR3bpUckp7oQ4ZePsN3LJBOekBWbKd0wiRJBD
 G9S8+xWk7yuVO4ByLLQlhyi+Sqo3orZi/9Ma0IlwWcEahTx9aqODyV+sL6S/PGymhLOU
 opOwOWBpScJxiM7OgEvgFeruC2ytNyfF0ACt45tE0gs/jmwPZBuhMwciT9WT42DwBovn
 w24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoKnLQsFbe8tgMzVX7s8TvsgrVkAK0xmtET1C1NjbqQ=;
 b=fBeiDmuBKo2AXUTVDrCztHe3Fuf5YQiRvVgZg+PHlF1Jd3XovdX7/xfon6vVxeh3o5
 XV0AxmqIu3nCEblQgZCNknR0OSopMOhdLTaUJOu/qlRzWZ0uXqlBCcxKGoI/81ho0+qu
 udcHH1MZpN52IEtVifDVSYwYu8Yk8BDrPYuG752vCXAxqTtwfEPgciWJuonDiaeGOY/h
 6L1lFNtkKsnI7tlngE92d7GGKizicjH5+GyTcsR7Q2S1xWcrvBPHRmyccZKW9Zo2zW8S
 6K/poAYE39n99Y2xjvq2/MNTvfPSk0sxXrw19cLC+AsI+PjivLcSzjq6BMxojk4R1jcp
 fIUA==
X-Gm-Message-State: ACrzQf09hbxK6miDS0VUYOIsGF7TvI/j2IQU6yiKU7CVJ2qzQEFnky38
 tbfxIGz84hUBZLh/OYLRQw2eTQ==
X-Google-Smtp-Source: AMsMyM5jUycVoKH4uTdxHekI52Di2pHoNQixF/DwWhQPbSIVul7tC+cOKBMTrWbVs7mxZo+9cmVSRw==
X-Received: by 2002:a5d:5346:0:b0:235:6c05:6272 with SMTP id
 t6-20020a5d5346000000b002356c056272mr29286697wrv.332.1666948563532; 
 Fri, 28 Oct 2022 02:16:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a5d6303000000b0023660f6cecfsm3090552wru.80.2022.10.28.02.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 02:16:02 -0700 (PDT)
Message-ID: <941584d1-7b43-b3a9-1734-1c434ec82e60@linaro.org>
Date: Fri, 28 Oct 2022 11:16:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221028072145.1593205-1-uwu@icenowy.me>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028072145.1593205-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/22 09:21, Icenowy Zheng wrote:
> When registering helpers via FFI for TCI, the inner loop that iterates
> parameters of the helper reuses (and thus pollutes) the same variable
> used by the outer loop that iterates all helpers, thus made some helpers
> unregistered.

Oops, I didn't notice while testing, good catch.

> Fix this logic error by using a dedicated temporary variable for the
> inner loop.

Fixes: 22f15579fa ("tcg: Build ffi data structures for helpers")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>   tcg/tcg.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)


