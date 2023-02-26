Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DD6A3455
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWP6F-0001EH-OB; Sun, 26 Feb 2023 17:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWP6C-0001DZ-4b
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:02:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWP67-0003E7-SB
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 17:02:25 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so2742106wmc.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4EaHpi3TXwBncl61nWREz/kwqGOoNdH8tfgvf1jpJRw=;
 b=Y8yjUJninbaJz461+nYAWmoPuyj7czNCDou1uuDgMMYm3Y4Uzd00JK8/z0Br2ra9OH
 4XL/K0mGQpnT0tYtWUtzukeNGh1nl4USTH9Pn2IyEy5UUuVmTkzZO2gy1/x6QNoIZ5VH
 qnxMoZOei3xNNUHY3z3Z8muYP6yTMukT01sLJSpC0pru8IevGmIgp4lxMCD+Jea0lN5d
 BI015L3SVpjLDUyex6niOBsKzFhZEUxf6HwU4CgPBNfHA+0oTUxbpcQYX8VZ2ShfYeWE
 /2m+trTEyt1V8999H0K42DK13UgFU3tUPwm6ntVH8juGnWJDzzLSD4ZfMlRPxaTNwEQ4
 jRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4EaHpi3TXwBncl61nWREz/kwqGOoNdH8tfgvf1jpJRw=;
 b=rSX4ejDWEfdUugEgmcwCIdVBKXX+tsPk8PEY1rduTtMsRAsiVlMKFKDUHdoL4SOUJn
 m+EvOyN+QEO/gaynR0lWkc1c7hkGhlUFkFycG394zvB41kyP2SJmV+RnCEMqNJnoOL6w
 893h3ZER/FtNnvGm6nkdkUd5COKo9vHKHfRtXuvCzjUQh+JSMZWAPLQYgkfwyopkHgMm
 vMBb1U1/lkVghSF6lzG0G/JwLMup9kFi0ikMt2emPOwNg2Z6GBOiVzhN/LceIElr7QmB
 +ZW9HPhXz8KFD34aJvSCODju4ZDrG162fDTFPusBkGYhV2KOBcjMPndGXybhVu9Q2t0A
 15QA==
X-Gm-Message-State: AO0yUKWByCOdhzzgQvV0Yo+oU4zfOuNtnXjAoGchQtpUEsoyXRLaVftR
 FH0CHtZIE5jTfQGB5Ocx2KO8mQ==
X-Google-Smtp-Source: AK7set/34dNcrfvbsP3dq9tAlsK2wnseuRQYE/ZMD6rt7JTY8N49Tx/0oNGfe3wPKcERCreNwfENQg==
X-Received: by 2002:a05:600c:a4c:b0:3ea:e667:b1ee with SMTP id
 c12-20020a05600c0a4c00b003eae667b1eemr8729011wmq.38.1677448941990; 
 Sun, 26 Feb 2023 14:02:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a05600c220e00b003e11f280b8bsm10515414wml.44.2023.02.26.14.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 14:02:21 -0800 (PST)
Message-ID: <05a0390e-b14f-6a2e-678e-c2b680e6d8cf@linaro.org>
Date: Sun, 26 Feb 2023 23:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/display/sm501: Implement more 2D raster operations
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sebastian Bauer <mail@sebastianbauer.info>
References: <20230216144043.D632874634B@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216144043.D632874634B@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/2/23 15:40, BALATON Zoltan wrote:
> Add simple implementation for two raster operations that are used by
> AmigaOS which fixes graphics problems in some progtams using these.

Typo "programs".

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> For definitions of these see:
> https://learn.microsoft.com/en-us/windows/win32/gdi/ternary-raster-operations

Comment worth being in the commit description IMO.

>   hw/display/sm501.c | 30 +++++++++++++++++++++++++++++-
>   1 file changed, 29 insertions(+), 1 deletion(-)


