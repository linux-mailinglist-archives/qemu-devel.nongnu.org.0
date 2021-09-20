Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A9241277D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:48:57 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQDg-000370-7U
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSQCd-0002Qd-SO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:47:51 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSQCc-0006md-CX
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:47:51 -0400
Received: by mail-pf1-x42d.google.com with SMTP id k17so3036440pff.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I21XypR4C8CFEElWtEgO18Kj1oj78V7AI6gVotKrce4=;
 b=DKnWxVPIcY86cPW/4ASTyhNBszm6DXM2p/INr5J59S3U+A1LfIWFOFcgS3ze2Iv/S+
 g/tfwmUemCAyzRw0tM+yMG07aQBGa8SbSNbJTpO/tcNq7NMyxPcT1ih0JXi3XDkQC9l9
 L/PT1t1L+8URzXdivfghxXcgJ+i8ck+8qApbPUw9gEnsUBa/qT89LuiPMPByW7wDfKsi
 ZhSxNdS0MAlocu5Pi7a9HfleRdjQlidtxr8CytpU6kkvfkSXSI1pjdz7/EM5PzAWd0o9
 peoKcc6nG9yOy06nzI2dsaahkhaS66SYRG3WEJgp33dT5dRMJ9jC2tkV05YTkOftPTkG
 qIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I21XypR4C8CFEElWtEgO18Kj1oj78V7AI6gVotKrce4=;
 b=ohCkEM7XZaHjJ8DKhqwuhFhKjXM34XmBnKAPnNiqxVGPei8mzhEbl3l81mgkT6rntM
 2SvYfkH3m+fYg1Eio1SNUsD5Hd167SPUW2jgoP9yqrJsSNcQZF3OXmaE3Pp/V2k5mT7t
 CSzplSuQvN6/011rGW7BynVZrY524qVIzSYEngIdqO09KkxlUHoRz+W1VM1WVHJ7kazN
 bNlattcCNSCsSS2X+scw2hAiMMMNDxOKdyTTSHvdFZwrCKbtFTh+ZXtQ6IgR4ziHoHz6
 xLR+gjW6fu5XPBkfwcbl1KTMU3WDdZgFOTSBpbHOu+RWwD0MifoRwRRgIwWsVYiPwqr0
 w8Gw==
X-Gm-Message-State: AOAM5321tyCkXmYWwEcVirNxbf1Fb/owd7RfRWblAjwxPkMoBoTNtImc
 uFgQ9+gci1U31P15aG5/wmva0w==
X-Google-Smtp-Source: ABdhPJwBlwz/lZoD6N/VRxJ0tr5/KXEwHTxPi7EJz8Nr0x7vfD/5AdyaT7EQ5T4msBO0L5SIT+umUQ==
X-Received: by 2002:a63:f512:: with SMTP id w18mr24935217pgh.280.1632170868529; 
 Mon, 20 Sep 2021 13:47:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z123sm8613217pfb.166.2021.09.20.13.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 13:47:48 -0700 (PDT)
Subject: Re: [PATCH] tcg/tci: Remove its experimental status
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210920062306.2723797-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f0a6035-3ab2-8908-23b3-92f2a62fa2f7@linaro.org>
Date: Mon, 20 Sep 2021 13:47:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920062306.2723797-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/21 11:23 PM, Philippe Mathieu-Daudé wrote:
>   Other host architectures are not supported. It is possible to build QEMU on an
>   unsupported host architecture using the configure ``--enable-tcg-interpreter``
> -option to enable the experimental TCI support, but note that this is very slow
> -and is not recommended.
> +option to enable the TCI support, but note that this is very slow and is not
> +recommended.

This could be possible for sysemu, I suppose, but not for user-only.  We require 
host-specific support for signal handling, at minimum.


r~

