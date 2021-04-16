Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094A9362342
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:03:47 +0200 (CEST)
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQ0Y-0003fb-3s
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXPyS-0002IT-OX; Fri, 16 Apr 2021 11:01:36 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXPyL-0002Zj-76; Fri, 16 Apr 2021 11:01:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id k128so14481925wmk.4;
 Fri, 16 Apr 2021 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HLEukpdhroBQnjfFSGkHxMIiiuDgBPTNraPQVB0AUD4=;
 b=jGIiRErz1JY/zge4VLuw4IGLCMIPhIkahh3pRK4cfMODgoZxmZ1B9bxx6cikpsImYo
 DmcabE3qOGO76wUS72XfMpQXdG+keHt5w7cx74ViO6zDtn9ks+IVW7eqelqhyw1J1Yt+
 KU80pZ5uBW4N0R/032XojkqP7OX1YMdFWrYeeHgJmkHamvihGEbXdeT84M4yYeG7nrte
 sLLVvpNiiweYlMFmg7fMflAWzhSqmrkH6dnQgFc3ToBz8GMRvMrtfLO7reMN7N7sSXnR
 z/8yIAdwlekWjYzK21NtFtwMViOXy87wxV79JABkStT+ZaS4leoRYMmelYd1iS5rGkhd
 ZWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HLEukpdhroBQnjfFSGkHxMIiiuDgBPTNraPQVB0AUD4=;
 b=Ca/hKZtta29vpXjJKJ/mTkrwoUGWiutNvuG6XVG1Fb0T36JkA31Qog7gsC2iau0uTz
 vXNP8yf+130IfiQWSPxvTFZ1tW2azsDdiGhmGmMvsj7FtnD2HjgbHk9yjfaCPiemxHYt
 z+rL5d85Y8loLwJAp+jvE/8C0jmsVqDFO8r9h1nidpjKgVXVd25z9s0bk2MrkM24CTkj
 SJvKoI+8baD66TQDXkvHZ34i7wzsfXS3HBp8NfJHkju4dLQzEP3NXz0OvrRJjy/xt+If
 HCte9kUJwjJB1XdO1V4wL1KluDQe61y1jfjpCyuRpWSJZ2u8H7rc+TgCObry9PKSdw/Y
 nrjg==
X-Gm-Message-State: AOAM530g9czSw97oyr8+uXtcZ+5ggUOOZKta7vPar63prAIgkYwutNI5
 vrGUMVa2ULHUBx82EQAiPWpNNhFkJ8I=
X-Google-Smtp-Source: ABdhPJz05J+F5osJil53ya8eZgIAd5GwsAt5C0KkduLGZ8s+wUPSimVZKL58NJHFxU+ed2MWIhN15A==
X-Received: by 2002:a1c:1b56:: with SMTP id b83mr8850463wmb.170.1618585285977; 
 Fri, 16 Apr 2021 08:01:25 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y15sm11362066wrh.8.2021.04.16.08.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 08:01:25 -0700 (PDT)
Subject: Re: [PATCH for-6.0?] hw/arm/armsse: Make SSE-300 use Cortex-M55
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210416104010.13228-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13a782fa-ad01-a953-9c34-fbc9cc7b869b@amsat.org>
Date: Fri, 16 Apr 2021 17:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416104010.13228-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 12:40 PM, Peter Maydell wrote:
> The SSE-300 has a Cortex-M55 (which was the whole reason for us
> modelling it), but we forgot to actually update the code to let it
> have a different CPU type from the IoTKit and SSE-200.  Add CPU type
> as a field for ARMSSEInfo instead of hardcoding it to always use a
> Cortex-M33.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a rather embarrassing bug. None of the test code I ran
> on the a547 model actually cared about the CPU specifically being
> an M55... Another one for the "maybe in rc4" bucket.

Yes please.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
>  hw/arm/armsse.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

