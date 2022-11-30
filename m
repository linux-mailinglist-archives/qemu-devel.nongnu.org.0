Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4E763D9B9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 16:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0PF6-0007op-RL; Wed, 30 Nov 2022 10:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0PF4-0007oV-KC
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:43:22 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0PF2-0007DQ-Tc
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:43:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id y16so7973368wrm.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zKvQFEAKBpfYXBxtQ4ZJLO5SqReUQmzE/Q7+2JSfMJA=;
 b=kfCHauU3zV0uu6y0n8APMMmHvRh5PCWrW1cwRQ5f3r5Jt/6syhZXCUvGkzwQvevMAV
 zSTNW2QPhc2xuk5IPa8v7GaxFVrYfLZ1+m00649OxuyeNxzkXqrOhT1EX2iUTKyXNRGW
 XbnQkUdRYZbQOTForLSoj7f7JWPZmwDDd2igx6fFLsW23lAxmArWWq8iRrSaMVfmtVsl
 nBUCGi8SuMVI3BbPGPEWXPz7HDVUBupr+5S4g+2+zMP/Si4fUxFlmxHUocozGdB5I/2l
 ohP0a3jqdouCH504HuLmcCBeRibXUJJnHKoOTJrnpT07nb1EZAuYOg9dNXH3SSrhVpeH
 BCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKvQFEAKBpfYXBxtQ4ZJLO5SqReUQmzE/Q7+2JSfMJA=;
 b=qwZTNlbQJScmXNHVN/CcSjqmSNlVQGxNppHLZU2HJmY94saYMjPAZvlbOspAT9bdU6
 LYILFqCBxXG9ECvsOhzCR3a5+OCPAzjWSVZSIXevsBavyh1N/a6GA5OFhuhguWCCFle/
 prtkQcn/mBoe0vM+b+Gnt1Mgj3myMpNoVrJQ94g3RJ+iqZUz0ShM/8v/yue7zJ1TLE5O
 7b3NoCbjVyaP2fpKBeKco9B1tt72qA11Np898m/Oky5cT08HZQ4jLMta/ZZXdsTQCVGQ
 JhP730SIkyP1OBdPFueY/lXZJ4GkuJZJ6SHS9zawyMb4IuiFArPu3TuDLwq1aQnHxUMo
 hNgg==
X-Gm-Message-State: ANoB5pktx7NeBWNqiTrtjQFJWHb6K3bq2VU0+ha0xgMp+Wh3l3QtaTVh
 Cgu7OwLVFyGhnZrln6TYqHl2BQ==
X-Google-Smtp-Source: AA0mqf4pMg0o3tmq7p+tLMZHjPTvmFO63lEMsK9WBi63u2Xt6UG1IGEJfhGIg2WgjGoY6bawH1K5vQ==
X-Received: by 2002:a5d:510b:0:b0:241:fe9d:fbf4 with SMTP id
 s11-20020a5d510b000000b00241fe9dfbf4mr19666260wrt.412.1669822998713; 
 Wed, 30 Nov 2022 07:43:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b003d04e4ed873sm7136505wmb.22.2022.11.30.07.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:43:18 -0800 (PST)
Message-ID: <28a5cb7b-9aa6-ff77-1cff-1679c55068f2@linaro.org>
Date: Wed, 30 Nov 2022 16:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH-for-8.0 2/2] hw: Reduce "qemu/accel.h" inclusion
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221130135641.85328-1-philmd@linaro.org>
 <20221130135641.85328-3-philmd@linaro.org> <878rjs4glf.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <878rjs4glf.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 30/11/22 16:17, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Move "qemu/accel.h" include from the heavily included
>> "hw/boards.h" to hw/core/machine.c, the single file using
>> the AccelState definition.
> 
> Do you mean accel_init_interfaces() and ACCEL_GET_CLASS? I don't see
> AccelState explicitly.

Oops you are right...

Paolo, do you mind fixing with:

    Move "qemu/accel.h" include from the heavily included
    "hw/boards.h" to hw/core/machine.c, the single file using
    accel-related definitions.

or do you want me to respin a v2?

> Anyway,
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>

Thanks!

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/core/machine.c   | 1 +
>>   include/hw/boards.h | 1 -
>>   2 files changed, 1 insertion(+), 1 deletion(-)


