Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286AE67357F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIS9F-0003Ag-Bs; Thu, 19 Jan 2023 05:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIS9C-000392-NN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:27:54 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIS9B-0001eh-1w
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:27:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j17so1150573wms.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iOPwVs3w9fwJCd4U4LbZiRH3USQjmPIhLRhdMWL0NuM=;
 b=Oyx0W5ElrpMHXVGFatMx3DqkfW+4EB+yspLwD1u1zXCOm7t6hyr2MCh8yw5SOqfGme
 yDFdcH9KEzR+S4c8ycomTsSUBwYA6TUPGmCQs9QKh8ZqWL7cs5KbbA+XP2Itg3Cz1kGi
 /OUGegCNNaHZhGsXH1SIXcB5amPDYLvA6htxM+r7jjUDL7H85zyCjPzRMHBX3QgA+PyD
 qSc8FrvV2TiyO7MGpilNlWugqrA2PaUmonWPRD19ljlJUkcUU0KFtkbgyB9HKSdcY5ai
 sQDObIjRPxgkgzeZGtzhzt1ymnqD6mLE4GfMOpwwDL/wflcfvzrotgKMM+A50VeLSmm/
 7M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iOPwVs3w9fwJCd4U4LbZiRH3USQjmPIhLRhdMWL0NuM=;
 b=ZZXB5DAUMJ11sKWQNLoWHTgLWj5ScNmC3+Msenqsvnmk6hPtUMhtbLPf9j/vMH0KZT
 JTZltxKRwG13y+NUdKoz6bcLghBNOA4O+Wv60qRNYyaVnP2Nnuo1EICJHWafZjOl17+R
 pAGwAstXii9xlLbkpkqAYEuk8yh2rucxlVBDI5AnVILZrIx7Ei9qOCbZLIJXeCl1rY27
 OWsmoG9eUZLtwqlJ1/kGrl1s9ewK0iwURXHKCWuGxOZMgM4Z+j8kU0G/eORcz4127x5G
 3pGgIRSDZkGxX2jB1FT0cGDEYoigr1yWs2j3+bi4ABDLJFKYKzMTmwbz/RGRQEwWkqMR
 QWZg==
X-Gm-Message-State: AFqh2kqCfppQPV1EmFZ/JFAWluF4kO0v0jGVbDHGdJx+GgyY6FEOId1B
 3zy3xTJbtVfKFTrDPKpTeOyugA==
X-Google-Smtp-Source: AMrXdXsAkNZp8TIId4EMRSlfpmGVfQERRV3dXjr/MZme2Jn8zZvHLKCtgCKzePsQiTg2KaKm1q3smQ==
X-Received: by 2002:a7b:c8cc:0:b0:3d1:ee6c:f897 with SMTP id
 f12-20020a7bc8cc000000b003d1ee6cf897mr9483888wml.3.1674124071715; 
 Thu, 19 Jan 2023 02:27:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003daf6e3bc2fsm6147447wmq.1.2023.01.19.02.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:27:51 -0800 (PST)
Message-ID: <ab32e4db-2a6d-69f8-4b69-62a1f1c0f6ba@linaro.org>
Date: Thu, 19 Jan 2023 11:27:49 +0100
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
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>
>> For the build _with_ TCG, this should behave the same as master.
>>
>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

> Testing on Darwin:
> 
> 18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
> qemu-system-aarch64: -accel tcg: invalid accelerator tcg

These two errors have been fixed by:
https://lore.kernel.org/qemu-devel/20230119100537.5114-1-philmd@linaro.org/


