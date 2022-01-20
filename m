Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DEE49559D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:46:17 +0100 (CET)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAeK0-00053e-8i
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:46:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZT1-0007b0-81
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:35:18 -0500
Received: from [2607:f8b0:4864:20::42b] (port=37700
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZSx-0007nV-IY
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:35:14 -0500
Received: by mail-pf1-x42b.google.com with SMTP id p37so5923561pfh.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jm12RTx+XSLqEoFLdjJptJPrXUHHuBs97JI2XYhzibI=;
 b=MSPWYMq8HD9G01p1ljNAP8EXbppOR+CmIybSAv9geENDOZso5Rov5tixvcUVf+sQd0
 pfx8jqP03tbkgvIpZr4CCFU4hTA/8UFBLL8VbhJfF+i3/lCUkp3QLN1WcAdHZ7T416Ah
 jT3EKV/YIw144yEQanmqA0hcAI0ohoW1+qdUuWRLP6/nJL1TMXWEljbBE+7oBFV6cn/M
 vqdyVkUDZ+fpImqxzvmfkQOcJrjkdfOhmQmMy/fk52OahwEGT2BPVCHpiMs/z7sc/T5+
 OPtF1KiU57K5GtykBFVeDMGjwTHiQ04HaRhE9ysYNBWaujAtpcIX35ZWPexXuwPph7TK
 qLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jm12RTx+XSLqEoFLdjJptJPrXUHHuBs97JI2XYhzibI=;
 b=rlFauD+JveSJkY0nnVE6f6Q0akRYZI3yu4l9exHsKIsACC/P4XiOXMUD/aWA47fmA5
 dAbVK91jsCEU6OwYfUX4wlO9wegtWM/X6VRvnMJoW/aWiwoqMR0PJ1dtfAkD6Jmqe4Ou
 fPJhfMFW5Ws7Cc69RO0pKo23YphhfPFaRJu98/0bzwnrdekr/DgMgVfsvKSaQZR0wihI
 rtfCQpwqud9ONIZgvSJ98ziH9XwbATaxouzFfkCFNxzSknwStcSp+BFd+wO4P0aSF0DP
 O22Mt9i3XypK5Oi9vENY0007oXMWCDsiWQhHzkQT8x6EEeqOmxZO06W8QDDo5XMuey5l
 hMEQ==
X-Gm-Message-State: AOAM531VGJzKB34dzNgZDkBaU9exn52KIe4QlX/xkyJZF93j4qJBRb0z
 IfKGPWVvAs2UNobJLZKZVnU=
X-Google-Smtp-Source: ABdhPJy2LHun5C7CF5PzKF479/ILWK81pG4x46fMAgRb2oSWzvL6PNrN1OKdkrZs7/ycfM0HMPXkUA==
X-Received: by 2002:a05:6a00:130a:b0:4c5:9f7d:c607 with SMTP id
 j10-20020a056a00130a00b004c59f7dc607mr7209612pfu.30.1642692906405; 
 Thu, 20 Jan 2022 07:35:06 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h9sm3820816pfi.124.2022.01.20.07.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:35:05 -0800 (PST)
Message-ID: <99e6daaa-f214-4ef7-e909-e3d458428897@amsat.org>
Date: Thu, 20 Jan 2022 16:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: "make check-acceptance" takes way too long
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing Beraldo

On 20/1/22 16:13, Peter Maydell wrote:
> On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> "make check-acceptance" takes way way too long. I just did a run
>> on an arm-and-aarch64-targets-only debug build and it took over
>> half an hour, and this despite it skipping or cancelling 26 out
>> of 58 tests!
>>
>> I think that ~10 minutes runtime is reasonable. 30 is not;
>> ideally no individual test would take more than a minute or so.
>>
>> Output saying where the time went. The first two tests take
>> more than 10 minutes *each*. I think a good start would be to find
>> a way of testing what they're testing that is less heavyweight.
> 
> Does anybody have some time to look at this? It makes
> 'check-acceptance' almost unusable for testing fixes locally...
> 
> -- PMM

