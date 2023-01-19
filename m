Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C06737E5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:07:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIThB-0003Mt-KB; Thu, 19 Jan 2023 07:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITh8-00038Z-E9
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:07:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITh6-0002UO-It
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:07:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id bk16so1618489wrb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2EMLVEZUotdAqpymC9FKRz9SAN5Mar29BncPdvbMT0I=;
 b=J5P5vwKdrMLRH7wpCKSUBaxB5QdfYEesDmdh9iNh46ykk4m/uY6a3ZG3yYxRk8E3L3
 JfUXpSwpNOIFHMXPs0ViNM0DYv3+jeBHZebd/ULPBI1vNWpEIFzI5CoZ6JOLRK1qMi6y
 HqCi2Ep52JZyZLZHk0cmXKfR14/cQ0s3npjHoB/b+LphJ0rj+KRnGf1EDthpe8NCXWu9
 f7EeU5ziO1NNgQmG1X88BQWGUMXqBDObc6Q67jdIecDQ9JANxUGG6sjoXpJG72Baw67G
 GGzFlp5/mMRW00XorowKhlC9olNI1uFrINl/BjK0OyxQpzDxbh2fMWJn6gyo6SlPD91L
 INwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2EMLVEZUotdAqpymC9FKRz9SAN5Mar29BncPdvbMT0I=;
 b=FeCkJZstIo8TKfrVMg7a4wFgmmjBTiYPc2CdRNoRicWxlFBulLUSZdI46KPLt0dUpW
 XiIbhXhw784Kc4jL9D+XvR106yeqU+tKed2PlcrD8wRKp27yi9O4GO4zCHwhQN/cKO3D
 FH+E0T0Cs5ALzIdsU9fBxo7QAps/Vftc2NgnUPPibkPJ4MyeSw+w4MXBkhWMALlN9Cn/
 b+jo7h4tdiKw8zdmxsW1Y7Vc8rahazNNWzlw/ofk8P7PJZDHB11geVr0/sIsXT0vcrA+
 vvpvjPHVMybrybvNiARMyiIQTS7q2o/HyFMAUkEpZYPJgK3bL7AJcx/7G76EHgM9nWcJ
 +LLg==
X-Gm-Message-State: AFqh2krvzSwH41i7hO2k8IAIyE4z6eK6/RJPaD7S1Rsf3t68uRsQxyho
 545AfjAoqOZ6d9ZJkCDFWtUaNw==
X-Google-Smtp-Source: AMrXdXuBBeSm3gl6o10933sG9UHE5vv824RLyyxhCDTGx/JOnLVEZDV0d41bpfp8u4MvdIbHfl+hCA==
X-Received: by 2002:a05:6000:1706:b0:2b5:47ab:6fa0 with SMTP id
 n6-20020a056000170600b002b547ab6fa0mr9817768wrc.38.1674130018431; 
 Thu, 19 Jan 2023 04:06:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 by12-20020a056000098c00b002bdd8f12effsm18238717wrb.30.2023.01.19.04.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 04:06:58 -0800 (PST)
Message-ID: <6b7d3a6e-a3f1-e90e-7e04-1d5196a087d1@linaro.org>
Date: Thu, 19 Jan 2023 13:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.

> Testing on Darwin:

> 19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
> qemu-system-aarch64: No machine specified, and there is no default

This one is fixed by:
https://lore.kernel.org/qemu-devel/20230119120514.28778-3-philmd@linaro.org/

