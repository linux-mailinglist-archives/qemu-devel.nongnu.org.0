Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A253B3D49F9
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 22:48:59 +0200 (CEST)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7OZu-0006By-9Y
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 16:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7OZ5-0005X6-KJ
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 16:48:07 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7OZ2-0005yY-Vu
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 16:48:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso14085244pjb.1
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/1YVkD9BKjCyuLBILAGi09C4qgMddmMNnMNCB741E6U=;
 b=aJZcPPK5FFJQXhfuHIwjyNqDrT9Q2P0lLDS0GAFcIb2cHdiTg5DX+sR1HKR5in5xXw
 N8iPAhAAFELejKmFgVgcSTjmwLNsPeCV63bpA9LAx//2G92gPc5t2tzcG+rzEdWPW3B/
 zp3Nh99a8ehEJUR9x0o/T2/yLk9R84lr8+UZFB9jhGcQo+LVz2+Ht4EgzF2gOFjezpwo
 UmgbQpKccAumV3nQrOPUc2VnWayRDpb5wMiZS0JJAQghuL7ad8LKQCDm/o/S5HWZs21r
 yHoz+eRyzdiPUa3Pq/NoWyMiz+gcB/t08wRPypTUk14BLtnZyRPcWQyzX2C/1lfUVbtv
 cBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/1YVkD9BKjCyuLBILAGi09C4qgMddmMNnMNCB741E6U=;
 b=Qv/EIThZqcI5RaYG9cDsqkdPjX67k2NN/AfYwiLsvXacoKudY903a4ihYZGHM3SSWy
 j4mZd+uWNGF+vKrcLwVfu1ZdCNy8W/6nRYXzbv2Q4Rrb0t+lHPBhNZqrgiXdkaU83UWR
 kpjfQZx2ZaX5ZS0St1q38uUQjXIoteCUf7lTNxUo2cd0RNnvcylexl/kI2+pjA5Uhiun
 6GaTV5kQ8rrxh/+2+KjbBiCBWv0j7flCmPfYUYiTZb/efso3uHqyekaBfent0zgoyTNL
 ILiW4h4WsHsM+DmmJrpdEVw3JqscXtqokPuK/Oazj6wuteqhufIJs/APRXdC8M/fQ/ys
 OBAw==
X-Gm-Message-State: AOAM532QAKJBZBzxaJl8xS/KdtDhgJDCptmMSGLx2bCv0Xq3DJLhR2J5
 2M2b2EznLSN/9jPck55TpJ5WWQ==
X-Google-Smtp-Source: ABdhPJwzrDTEb7XDz0FiRZvXxzUIApnh8X91nd1ZgC2PbufIA2Il/dkboCVzp8997bRQ1s/4FehAoA==
X-Received: by 2002:a63:5904:: with SMTP id n4mr11012433pgb.176.1627159683419; 
 Sat, 24 Jul 2021 13:48:03 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id u24sm39286390pfm.200.2021.07.24.13.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 13:48:03 -0700 (PDT)
Subject: Re: [PATCH for-6.2 0/2] target/sparc: Drop use of gen_io_end()
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210724134902.7785-1-peter.maydell@linaro.org>
 <CAFEAcA-r_WUVx+5dFrpRPGppzMon_pDBzytTp5QwVcnbVxCzSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0750612a-5945-290c-d907-9f01e0baf336@linaro.org>
Date: Sat, 24 Jul 2021 10:47:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-r_WUVx+5dFrpRPGppzMon_pDBzytTp5QwVcnbVxCzSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.058,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/24/21 10:27 AM, Peter Maydell wrote:
> On Sat, 24 Jul 2021 at 14:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>> There is a slight difficulty here with testing this: icount
>> doesn't seem to work for sparc Linux guests in master at the
>> moment. For instance if you get the advent calendar image from
>>    https://www.qemu-advent-calendar.org/2018/download/day11.tar.xz
>> it will boot without icount with a command line like
>>    qemu-system-sparc -display none -vga none -machine SS-20 -serial stdio -kernel /tmp/day11/zImage.elf
>> But if you add '-icount auto' it will get as far as
>> "bootconsole [earlyprom0] disabled" and then apparently hang.
>> I'm not sure what's going on here :-(
>> (I filed this as https://gitlab.com/qemu-project/qemu/-/issues/499)
> 
> This turns out to be a recent regression, caused by commit 78ff82bb
> ("accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS"). It's
> an intermittent rather than a 100% reproducible hang.

Ouch.  Ok, I'll have a look.

r~


