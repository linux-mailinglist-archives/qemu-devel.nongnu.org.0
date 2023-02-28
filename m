Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CDB6A58FA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWz49-0007Da-Q1; Tue, 28 Feb 2023 07:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWz47-0007Cj-1h
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:26:43 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWz45-0000x7-9Y
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:26:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t15so9528887wrz.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cu+nvG5w9sWCWl9GYD0stdG9tMSCSHPgD7RGc1i2YRA=;
 b=K3wluKxcE/rCvWqOkwXeehlmYRMbEq8RyljUSJLktvXWQYzvfV0JVuxh7sEjOItHLy
 zkB0bDfg1w0blyu7O79patbUxjElHTkQWl4dXxYhVt8U8TUSLz+j6ddCyrJhS7m5cNCn
 JLxtUFnp8BSUDvt4S4Tw2zxaHnbV4XxV4VEVqJ/d+Y8YmSoKUc7w/Eb9CcXJEnBvBW/A
 surEgKqpwer9fNgWwtsETr6+JOUrM+n0f+qX5qRY93yOvzTIh3pBSxNrOBcD3EKmU40Z
 QzGrVYDctK5UF7fdvl4Q/aoN9YBMtUH8C7ppyKj5Xnqt7NAR6KHA4YfeOrcVsxTwOU7s
 Czbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cu+nvG5w9sWCWl9GYD0stdG9tMSCSHPgD7RGc1i2YRA=;
 b=dlQ31Mp1JhiSNlHSKgEiPiF6YVHMvL9nSwTARXhsOVoooMStJrcw+iK8RFKzBLRBuo
 vpH1Q+FErdLDg9i/S4YwImZrmZfSQRbE4lu65GI67syKzIe/lO9/AXRUCC5kE3OnvfiO
 bcn5+8ADMQ8s7MmwYrmI1bCDpHgR7MvMAE6IAS57B/IbCJZCg5BM4i7VwIFpD63KQL3e
 s3H4Cq48noYPQBlBAFSdl71QwZ6yveL0gsMfI5ZxA/h3atFeZB8yAID0myiD4TeB7uHk
 ej50oUVWdVcBRFsb6/YgPuizTXWnJsqIGIJKyJAb7lplWAKK7/m/hdLPkvadJnlyhBUX
 dqqA==
X-Gm-Message-State: AO0yUKV7B2cd4fGx2wEIFa/17dtzY5tzSkHYtFTwuX6viRieKGFotk6K
 2tvgk6C5iWR+Ao2NRU1weuAPVQ==
X-Google-Smtp-Source: AK7set/FeEH3SMp+xTRs7KN0rO4ziPX4ZU/IYrCCDHUXsFss9SGulRgXPV/twaTftMt+Opk3ZZcv+w==
X-Received: by 2002:adf:f405:0:b0:2c7:2cf4:baff with SMTP id
 g5-20020adff405000000b002c72cf4baffmr2283941wro.70.1677587199717; 
 Tue, 28 Feb 2023 04:26:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c18-20020adfed92000000b002c54c9bd71fsm9920712wro.93.2023.02.28.04.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 04:26:38 -0800 (PST)
Message-ID: <084ec45e-944c-32a5-163f-d2fe5666d3c9@linaro.org>
Date: Tue, 28 Feb 2023 13:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
 <20230228035917-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228035917-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 28/2/23 09:59, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
>> On 2/27/23 10:12, Michael S. Tsirkin wrote:
>>> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>>>> I feel like we should have separate deprecation entries for the
>>>> i686 host support, and for qemu-system-i386 emulator binary, as
>>>> although they're related they are independant features with
>>>> differing impact. eg removing qemu-system-i386 affects all
>>>> host architectures, not merely 32-bit x86 host, so I think we
>>>> can explain the impact more clearly if we separate them.
>>>
>>> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
>>> a superset.
>>>
>>> Removing support for building on 32 bit systems seems like a pity - it's
>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>> and the maintainance overhead is quite small.
>>
>> It's not that small.  It only works for single-threaded system mode.  It
>> silently does not honor atomicity for user-only mode, which is perhaps worse
>> not working at all.

Will the same occur with 64-bit hosts when we introduce a 128-bit 
target? If so, there is no much code we'll be able to drop,

> We should probably block multi-threading on 32 bit then.

so this sound a user experience fix.


