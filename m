Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DC96A9A8F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:26:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7Gw-0005mw-Ou; Fri, 03 Mar 2023 10:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pY7Gq-0005jF-PQ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:24:34 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pY7Go-0000Cs-9g
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:24:31 -0500
Received: by mail-lf1-x129.google.com with SMTP id bi9so4094097lfb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677857067;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+nq9aiHykai5Duy7gY8qa0DAFcNCmGsD2HIYvCEEajc=;
 b=KRC/aYIIihD3pys5vhrqxVFdDChWUVe2dipUDWJkMHVHUYfmLXDWcqkC+Bj4UI0Q6W
 W6YLwIV8ULvDaTQzXA/BIEExETPQtmSnc2FIgU7msKPBKqzIgwFNsxf1HaODahnnMnrO
 bgAE80FFVwuRmy+iOFl9CLEH0n4Z3gWG9+lugBz1n1d5dOrD6mTGBLEqs7oXKZafzI+T
 jOhrg0lHOMWZuhOy+YRUEwJWD0vMWkVuBlFdoEzQGIiau01wdVdMrPT8eU0f9qidxMLf
 0/hzGpv1Kt+oh/zflunXZV+oaFtLbFbVPjL+ynE9/rxC1DEIHsTeUCrMdmJyFphbNiUE
 K5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677857067;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+nq9aiHykai5Duy7gY8qa0DAFcNCmGsD2HIYvCEEajc=;
 b=4jgDQ6xwkr1EFoDjDwNg0gU72V+ub6TDhl4UDzPgxPmr2eiFORPdCjkadL8WTsmIfd
 9UKaZWBP/t9p4OPlnL/E4I5TGJ+WRz4sYq068oQYch+5/qhePwfcbjUHgP9pv7Jtf6zW
 /ToXXXqndaU2zjltHRnp2GA5yV/7ujUkD6G0PzHjiopyz8qOIy+kpYe3ErXLRx8rJv3N
 mRIdLNRT5Px2SWX0na+6gcISb1xCATfos1dKWRYb5PkeXQXvkL22vd+OJfSsU4IyAcyw
 1bnr+arbfytbW8OZD+RfVgYeJCsit1csuDM9oGJIzjqkykATaXzXaqPyr9HasalR5IOB
 oL8Q==
X-Gm-Message-State: AO0yUKWapYvpK94kl6bMGipUaQdQSqhJFoZ3v7OneTkYpewQe/Wd94gE
 chKwtRBZjtsvX9XuE3Y52n7TtA==
X-Google-Smtp-Source: AK7set8MHetM6xqQkTAxa5K8cEe5C+tHzpDE+d44NZYjwi79cmuczO91CqN/141kABgXS8dtuiKYCA==
X-Received: by 2002:ac2:593b:0:b0:4a4:68b7:deab with SMTP id
 v27-20020ac2593b000000b004a468b7deabmr620232lfi.7.1677857067414; 
 Fri, 03 Mar 2023 07:24:27 -0800 (PST)
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl.
 [83.11.36.13]) by smtp.gmail.com with ESMTPSA id
 u17-20020ac25191000000b004db3aa3c542sm427616lfi.47.2023.03.03.07.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 07:24:27 -0800 (PST)
Message-ID: <5759b40d-2f61-ea0a-f6a5-368aa52441c0@linaro.org>
Date: Fri, 3 Mar 2023 16:24:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] tests/avocado: update AArch64 tests to Alpine 3.17.2
Content-Language: pl-PL, en-GB, en-HK
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
 <87mt4u9itl.fsf@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <87mt4u9itl.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

W dniu 3.03.2023 o 12:24, Alex Bennée pisze:
> 
> Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:
> 
> Next time please ensure you have a cover letter for a multi-patch series
> as the various bits of tooling get confused without one.
> 
>> To test Alpine boot on SBSA-Ref target we need Alpine Linux
>> 'standard' image as 'virt' one lacks kernel modules.
> 
> Is this kernel modules we will need for SBSA "hw" choices?

Yes. Virt image fails to boot on sbsa-ref:

   Booting `Linux virt'
-console: Mounting boot media failed.
console: initramfs emergency recovery shell launched. Type 'exit' to 
continue boot
console: sh: can't access tty; job control turned off


