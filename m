Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD14FA0C7
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:41:06 +0200 (CEST)
Received: from localhost ([::1]:33316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nczA1-0000Ol-6r
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncz8e-0007tM-TC
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:39:40 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncz8d-0008KM-BL
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:39:40 -0400
Received: by mail-pl1-x632.google.com with SMTP id m16so9312004plx.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6uuk4ZMdbNl+jGuP3mXy9SHZYb5KjXaItznZ0/tF2yM=;
 b=qarpTo0igbqJFH7IyL1wmKe7U6IOVLqz75+grOC0Z3uztcS+tfQwWVVQQ5XeH6Okdk
 PpH/LUKYnf1d5mjBSCQ+ikZgAJr+mv5nUbyhYKpCE8EKhpvx6BiidBcoqo7M2wEPM9dI
 9/S3iuZX0uarj52KXSVpuEfqgifUAIhbwfXHUiXX+EZC0hio0VeuHLXTAfgE39ot9VA1
 8hoQMQdWstKb24ZpV0pLxdfDCpO5E45MMPbXd2S+QsoSsDoA5YhedEPYNBooWZUPYWKL
 eDlT+lvlVf74LTks0GfpMYXWJGREkhmHQF9bNoNKShyHHPO8Hgm2W2weSQa8O4Fk4O0h
 QGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6uuk4ZMdbNl+jGuP3mXy9SHZYb5KjXaItznZ0/tF2yM=;
 b=fbRLJy4pst/svkdTShjT+lnLkt53vL/8//BILaBeLYANpNW8xI6/xiuQlz+SmVJgZb
 YkGrmoK66f5p2s8+O2ayfakogXU/7oHCjTYGqhpCCM5fAgKYUvBgdGwWe7cHFdJvPvrY
 7TpflE1R+1kJxMWAJYz8F1zIxXiqwKNz/0ZhArMzeJH+8ru5KXjP2csRSNAm4N44n3GU
 ggkSjlQWcxWVUOoMaX+nQe++AN7fWhFXRvzCyGSKcaNdPnNOHojBoc5f+046PCRpETfb
 TrUzq/NjjGsgsFlpzqt1/SnOTDOjULhBlYzEu/TM2xKGL425H1Fba4nxoqPDtiYrQX5i
 2yiw==
X-Gm-Message-State: AOAM5306cOBzfiRdnWbxcHTa+/CBBUG69VjoXRb7hx/MlWoXui/TCNdm
 lWhu3ugfYA0ZFVqWjrzyEkbGPg==
X-Google-Smtp-Source: ABdhPJxzP47L55He9K9cWI8tqUShf3yVUaC2uGpxu3VVU0tcle81gguKpYxlHn43d70+o5XGaqBVCw==
X-Received: by 2002:a17:90a:db50:b0:1ca:9af1:f54f with SMTP id
 u16-20020a17090adb5000b001ca9af1f54fmr25506017pjx.32.1649464777409; 
 Fri, 08 Apr 2022 17:39:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a056a00138a00b004fa9c9fda44sm26959144pfg.89.2022.04.08.17.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:39:37 -0700 (PDT)
Message-ID: <394e03c6-e443-e752-745d-4960ffae951e@linaro.org>
Date: Fri, 8 Apr 2022 17:39:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/41] hw/intc/arm_gicv3_its: Factor out "find ITE given
 devid, eventid"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The operation of finding an interrupt table entry given a (DeviceID,
> EventID) pair is necessary in multiple different ITS commands.  The
> process requires first using the DeviceID as an index into the device
> table to find the DTE, and then useng the EventID as an index into
> the interrupt table specified by that DTE to find the ITE.  We also
> need to handle all the possible error cases: indexes out of range,
> table memory not readable, table entries not valid.
> 
> Factor this out into a separate lookup_ite() function which we
> can then call from the places where we were previously open-coding
> this sequence. We'll also need this for some of the new GICv4.0
> commands.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 124 +++++++++++++++++++++-------------------
>   1 file changed, 64 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

