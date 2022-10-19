Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF4604207
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:52:46 +0200 (CEST)
Received: from localhost ([::1]:60748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6gm-0006r9-P5
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6aN-0002aK-F0
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:46:07 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6aL-0005g7-6y
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:46:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id a3so28378877wrt.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 03:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1KmOaDFf/dmsb6gAjpxiL6B3fTWjDmaoHrX3Q1Fz82A=;
 b=KIBkH1vvt4GurDej+ub+ZnU+OOwXfBf53vEYd8mMkvajqqgap8Bh4xPsHO8ZG9HAJN
 w1O6xmOxayLlc1hrYVnoJZ7vTTRi2E2LSUd2oJY8ZhSyNaPqbxNP36ACFMXZOMfNQymY
 iKZ4gPUH/mnu/VHgXton0OY+v9sCOLpYgzEDp5XvSapkzTRfOAiLH/UHQLIdJq5eqZMM
 vm3tRboFGSTX0lvHPQQQWz2Pewh2iaS7j4NiN7VFxL7EMzuADIAJtcgMNZj5XdcQ3oJA
 xhE9TZfTONZhddV6+FHl2H8xq8jgvONEDyIh1oZGs/P2uf+HMwQwen9fJ1cA3OWdHIBy
 NKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1KmOaDFf/dmsb6gAjpxiL6B3fTWjDmaoHrX3Q1Fz82A=;
 b=mMGcgtMoBPCANlZQ6fT3AzdEH0EO17OFxqkBs27juXVXOjck09jCzi2dVaKEFuxSCX
 7ceG0emwBsRCGbTHPf+PqXCN8F5Wxs7fWpTo6tlO2Zu0NqW/kgKVq1qNFJLiYQCIXrhJ
 95jReBknVzbKLq1poTqX0sr0AVNJ/5b+QmhkiK0WUZhuzO51vK2YYq8/RRTazV2P44Th
 6mFRcYsj2kD1SPVG5uUa22wZAlNksDU/NEuomLtBNTQ3JC4zrP6tkFmOBgbbl3OoU/1H
 KHJXk866Q0FAgfaRUsHoUZ66FRyQPl2ezowlbdSyEOQgHlM1d7a1v+g2C/fLqn/J+XZb
 sEeQ==
X-Gm-Message-State: ACrzQf2LJLa+uXoEcKR8a866urvJA0pTdqnt5jAM89HsQphNO0J4Y1ig
 Ig079tyZuybc928L+/wY09E4D4BFHbDVIK86
X-Google-Smtp-Source: AMsMyM7H9YiGYiTvtGy6xrPGHnkETZdC8KG08POy7l+/Sxhon1UmfnULIvjqGhoSAJnIxhR6df0fBA==
X-Received: by 2002:a05:6000:184d:b0:22f:4ef4:47a7 with SMTP id
 c13-20020a056000184d00b0022f4ef447a7mr4594527wri.563.1666176363000; 
 Wed, 19 Oct 2022 03:46:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o18-20020adfcf12000000b0022a297950cesm13390065wrj.23.2022.10.19.03.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 03:46:02 -0700 (PDT)
Message-ID: <f2652058-dcd8-b2ee-11c7-ed6f5d6774ae@linaro.org>
Date: Wed, 19 Oct 2022 12:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 09/15] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/9/22 16:14, Alex Bennée wrote:
> This removes the hacks to deal with empty current_cpu.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - update for new fields
>    - bool asserts
> ---
>   hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


