Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DD83C16E4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:13:19 +0200 (CEST)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WeM-0004tE-KD
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W1s-0007zb-95
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:33:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W1q-0004O3-1z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:33:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso5476888pjx.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XN3PZ/3nwkMYwk6+MSNxCZQ2O8CV9tgXl2jdY/DXmHY=;
 b=bldZANe2lBvNZY5xgvVrvVIScz9QvgxcPRfalfFbW989JlDOUFFRG0x17HOugfhiqh
 wo/LT4/biVfTGcViFd7ExML8LZnk5J0bSkMWnbKekX6Y1bG8xom5STCgFbY0xy9+WUCQ
 h8qwxMOFzpQnhAEIpt/FDKWJzMXb9sc1pKWyGepr/WU0114exVamP/3wj7eu8vYeFo5a
 aTkaUn6ZiZ5mQsBJVunTKWm+gm3LPVM7A6Up8Xmq40Y6cU9bKM1nVX9ud6k5Q5XeRPmj
 Pt5Da+QUJ3ClPYZFRTEeIXDCkufwLY16eQAKg+q2FXWCPn82+Idxder7URTIsr9sIrwM
 /Gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XN3PZ/3nwkMYwk6+MSNxCZQ2O8CV9tgXl2jdY/DXmHY=;
 b=KPudrRBx4MnhEb2SZNhPnDXTh5KQ1DWRpUE8imhaL9EC1/503iIR1f+BHuwwzsuc4E
 cKup+/6OqcwitWxoSogSP8drKGqwiyNIEnRJhIDG7TML2dqjG3lFOMXafrJEwjwQPidz
 qD+7Qi8DeXIAy9LuBciitasZs8D0TaT5lHQ8i1jJwulF5kQVU9dgVBBdlIqilwPMTgYw
 lap3bBJ/0N+kgkXpau2Lk5VcN1TFnVhzR/nszV0wBJQOMecfR7B8ITeYlf0CX9tmkx4K
 ZBSmLK2VMfBjpAUElk1DcwYOfQ7bQ6CESy5AFk7X+o7t/8JF0IN1URefm8k+MPw8G1CB
 r/NQ==
X-Gm-Message-State: AOAM530R4kHnruHz3Ei2TIg+mbgUCsptbsQpgcY5Mz+DCec4fVj7+iCM
 BnBl5nZCq74KjdDLymyky58mqg==
X-Google-Smtp-Source: ABdhPJzZq7+gv4a4dGKYT0Shj8aSLxLOdlV9lTsUJ/ex59hRJuyMW+hzregMUubd4UgqR84YsmyYwg==
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr5368193pjv.60.1625758408715; 
 Thu, 08 Jul 2021 08:33:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o91sm9869146pjo.15.2021.07.08.08.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:33:28 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] linux-user: Extract target errno to
 'target_errno_defs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d612907-cb56-dc41-8eab-0d69f832b6c6@linaro.org>
Date: Thu, 8 Jul 2021 08:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 7:11 AM, Philippe Mathieu-Daudé wrote:
> +++ b/linux-user/aarch64/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef AARCH64_TARGET_ERRNO_DEFS_H
> +#define AARCH64_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif

What happened to just the one include line?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

