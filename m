Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF10410CD7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:18:44 +0200 (CEST)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1Ol-0007Ht-6K
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1I7-0001gB-7k
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:11:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1I5-0004gA-Ql
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:11:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id w17so16409532wrv.10
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Umwy2vTip76S114MEH01KjFzFcrM9z3cA8kbI6SvYAA=;
 b=c/y2+ISKywroS1EIm1TSWXWs5UL4ZRUK374R9wUlpf3b7aza/l8tzTKIilR0NB5MvW
 1w118ZScQEc2giZx5BxMY41LQnvRS8l95dIe3y13waRkh2pjA2SqaEiUDnILmigcMwTL
 NxhsaK/XVgOTqegvJPfyzFmN8OPzkjdeFjRKsXs06Au0LKKWKp07m7lK5rOkD/5+5U2Z
 GDRjKWY5WLDeMZPafJbhSKe4wwzO+yDvhnXi3ZZWeuZ+sxBoqCMbfYR4OJOcnwrGidCG
 0AlM4WULUEuzth0L0WtpZERFXSV7UFmpEpnMsi/vmoZksqsYl02afp+yfZJ7Ig0DRInJ
 VgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Umwy2vTip76S114MEH01KjFzFcrM9z3cA8kbI6SvYAA=;
 b=wtmV1RgY3bmBxdFNTm3dAnllacQE/yAqw+QpNgc2ndYNDzVu2x/y18Y22MteaJiJXn
 7Tgep5NTc7IKcTz4bADAlXvG/X651d+IJ16g7hbE+D9tNUVTkNgzKk2+ZdFo5LL96OYl
 L6DHcJbA2DMDtSCrnBoqNUand/1L9dxncpWKiyPHjYUvKdlBJ/43t4yWFW5zY5w+4wro
 uY4ae7/FC++6eVhVmC0R/RTfim+wKBb4FGUL0BwMcQc4vGYl2RyRNDyFZjYHD8MmlanF
 7sxU61GzZefL0ByWsqtdB+ycjHn2ewOj80as6KfzqcfUSa0UEqO465LIvUIO6CzJP9zw
 mqPw==
X-Gm-Message-State: AOAM531A6bQ0NSC4+ljq4o8RwbUosroXBATlY0u+bQ7JRc1FeYHXMngG
 SzKuqUqncnQrzkFrGzuz952Dx/34b+A=
X-Google-Smtp-Source: ABdhPJwYiwD7M0vd0gSBZ9fW3c+HEIVNczYvGKtyrOyOBGM6qPMkBqV0tIcR3VEuJ7QcHcEh5VcDbQ==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr24613289wrq.145.1632075108441; 
 Sun, 19 Sep 2021 11:11:48 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id b188sm13226658wmd.39.2021.09.19.11.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:11:48 -0700 (PDT)
Message-ID: <4d17ddff-62e8-b5c3-5abb-c0a7f20df17d@amsat.org>
Date: Sun, 19 Sep 2021 20:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 09/41] linux-user/host/alpha: Populate host_signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-10-richard.henderson@linaro.org>
 <cdfcbb18-a3b6-3986-4b0c-97dd40ced27f@amsat.org>
 <8df420cb-0b3e-443a-35a1-fadd06c24b3c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <8df420cb-0b3e-443a-35a1-fadd06c24b3c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/21 20:07, Richard Henderson wrote:
> On 9/19/21 11:03 AM, Philippe Mathieu-Daudé wrote:
>> On 9/18/21 20:44, Richard Henderson wrote:
>>> Split host_signal_pc and host_signal_write out of user-exec.c.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
>>>   accel/tcg/user-exec.c               | 31 +---------------------
>>>   2 files changed, 42 insertions(+), 30 deletions(-)
>>>   create mode 100644 linux-user/host/alpha/host-signal.h
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
> 
> Amusingly, this is one bit that we might want to simply drop.  The
> remaining required entries in linux-user/host/arch/ are missing, so one
> can't actually build with alpha host at the moment.
> 
> Similarly, linux-user/host/ia64/ is also unusable, because we would have
> hit the #error in accel/tcg/user-exec.c, missing the host signal handling.

Understandable. Since part of the work is done, I'd rather keep the
patches in this series and drop them after in another series (easier
to revert for someone interested in fixing these targets).

