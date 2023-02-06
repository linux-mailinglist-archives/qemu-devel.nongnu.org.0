Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711068B917
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 10:55:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOyDU-0001gz-1c; Mon, 06 Feb 2023 04:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOyDL-0001gd-JQ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 04:55:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOyDJ-0005P2-QG
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 04:55:07 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so3008179wmb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1T+WPS8Xm7PLRCcgqpKhHBHzua4yPg2CCbmenRr33Jo=;
 b=tsPQajaQUgYasqpJbXV65D4WEHzFlzunL2yfU6SWKpcvKx1FwbW8Oh/rAUuPu9liEN
 MI58/c1UgCXBfI/un6KmDOororXBobtFvJ9adTFA9j6fIiBUQlR0QEcPrTC64OBs67U/
 g7WUCj+5VVqT9M+NnUdDPHcq758Bh9kWpUm8F9j76FjSZ4QHX3mPo4tdyRtVD4WfnVeh
 02Wi0X33gmjOF6ZK9thUkkmx80L1/GnN9hAerIBrysq5prIJRt+SnWrzvdrK/J417RHU
 DxzKZLP2fAU8KIBOySZwQ+lnLiiqJ/YQuUXD4nq6Ip/7ypnr3+dkYK00cHDYI3Tf3MVd
 htsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1T+WPS8Xm7PLRCcgqpKhHBHzua4yPg2CCbmenRr33Jo=;
 b=HvnBxONcgNF3c+BYSiJm/VnNMM1zUvhnFuxOfUHBER/kfNJCi7yfFxfE3NRKrY8dYd
 y7AW9LL8mFdV6/+rNle4v1lkD3pwxNUCuAW4W/ljpRbuxBC4hnHy5Zfin97ELezqWSll
 Z4BxDkq3yqr84iPQ3gflUi13TW074Ti0iCyqRCNBIOc+VZXGv/9mNu5x/th15mGktd4I
 3t4/Ql0pCGyLhbJ5u5wlRbCKmiHCGon1nbClpvWi3TR78F5ua1WAIr65SLJ3Ffuinw/X
 Md+ANBf0rQxrEacG9hIUJzAjwRgnM6Ak7efSMgqTcZBgQZbC0Pw8ReNoZpZnAIkYzhDR
 49Aw==
X-Gm-Message-State: AO0yUKVGPe8+r99l+iGicI70nUyTjxs+LivWKcvguCXTRtlSmZDHPz2A
 DHmSuC/bWTYToG0w19CsXtrXXQP/68jKMI52
X-Google-Smtp-Source: AK7set+V+j6fRF2Ta5pqndvJIyrute8wtDLidxKCUbUnKTQU8K6FR0mBY9ZPu2xx5KoyzvBP5/QvdQ==
X-Received: by 2002:a7b:ce15:0:b0:3d9:f769:2115 with SMTP id
 m21-20020a7bce15000000b003d9f7692115mr18366170wmc.26.1675677304482; 
 Mon, 06 Feb 2023 01:55:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bd16-20020a05600c1f1000b003db0ee277b2sm15668151wmb.5.2023.02.06.01.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 01:55:03 -0800 (PST)
Message-ID: <9d13db25-0ee3-4eaa-227a-dd3ca909a1ba@linaro.org>
Date: Mon, 6 Feb 2023 10:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Qemu - how to run in Win?
Content-Language: en-US
To: Jacob A <extrapowernosugar@gmail.com>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Yonggang Luo <luoyonggang@gmail.com>
References: <CALj-+m3GVB8s60wMbQuZVEHm2kJRLaYxoveQg_wg=hV6MYcS_A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CALj-+m3GVB8s60wMbQuZVEHm2kJRLaYxoveQg_wg=hV6MYcS_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc'ing Yonggang & Stefan.

On 5/2/23 13:01, Jacob A wrote:
> Hello,
> 
> After installing Qemu on Win, I don't see any shortcut to run it? There 
> is only a link to 'uninstall'. launching exe files doesn't do anything.  
> Can you please explain how to launch this application?
> 
> Thanks,
> J.
> 
> Please see the attached image.
> 
> 


