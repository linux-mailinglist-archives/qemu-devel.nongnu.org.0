Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B1B4AEF09
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:14:12 +0100 (CET)
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjzH-00013S-IO
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHjvw-0006xp-Nk
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:10:45 -0500
Received: from [2a00:1450:4864:20::436] (port=45897
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHjvu-0003ZX-JF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:10:43 -0500
Received: by mail-wr1-x436.google.com with SMTP id m14so3040329wrg.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 02:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=liQaU8cf6JJ4v4bNVqcy1+sO8c+xsy9OP28oMfGMMoU=;
 b=ThNGOQFvThW+aWPVpxcu6wVXHq4+HOBpJS8OM9DN+qfO+U0RjDAiSO9CDRy3YHCPtL
 vk6HdcE+ld8J7aej8LMb1ycGik0MHOWz1ayIyAQn2BmvVn2TY/oU3sNMfYRC0lKrnJjf
 JtpPBF/sH0BhsDyvc0lNw4fUg090rss/LLftQDZKUoJN2ckB+2jRbxcYacBzh7UciByR
 ZJY82Nivk7We/iSmfAg3nyaicS+UxkT9OIEqqE6KeQJUnbfP5ijYNKq0zdi4aU4cIqOG
 S9SgKaGNU4OSw815tXs0X2ON15RuXRTsqBq6i+s+1zuGIaYP8Xl68AiFGlxKASvNWFn4
 3KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=liQaU8cf6JJ4v4bNVqcy1+sO8c+xsy9OP28oMfGMMoU=;
 b=4OxKprQHrVTW8a+9u+umQVuVaWbd9vMxSlW7OitFdi8fmidVTuUX4Ky+HdAfB8LYRd
 5+ZNK/bogo3as4nEG0pmbzJsblJIm4/blwgZ8QUAYBb4WFX7F+QzWop2SsMBYX/+9RFk
 ftlpCnstp4Pdv2gTqNWf9bknEtVyRPdMuttMK77MuZARFEr59g88Nv1kE3YwIBZC7JxO
 Ag+Z+gZN3eDSWg9sreHWmuJTKojIclEprm1GI7dfk6qZLe3OrOJsV6eTGPurtJrMPboc
 wgAaRNIEC2EPXPf5EQpb++7pGm69CcJEkd3texKgoc6e0uGyW362QrNXSH5GLvB5fOEP
 iY2g==
X-Gm-Message-State: AOAM5312v0sJfwZlgvxNnf+Pbbevt21oV3bixgIZLoHdHu8tlBg8cw1Z
 Y+jRMl5MOhQ3i3nfvTRreeY=
X-Google-Smtp-Source: ABdhPJxqQ1m0Z5ydmqfrkvE3UXHzTf/Yu1WhwIUI684o3hl8wXdxwN9NLfQrg3/wdUftAHolgTbYIw==
X-Received: by 2002:a05:6000:1b85:: with SMTP id
 r5mr1438337wru.453.1644401440766; 
 Wed, 09 Feb 2022 02:10:40 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h4sm18530299wre.0.2022.02.09.02.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 02:10:40 -0800 (PST)
Message-ID: <8f330b10-7978-860c-35c5-282c8db23f70@amsat.org>
Date: Wed, 9 Feb 2022 11:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 5/5] include: Move hardware version declarations to new
 qemu/hw-version.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-6-peter.maydell@linaro.org>
 <4a8c6105-b1b2-99a2-27b0-ebb48463a50d@amsat.org>
 <CAFEAcA-At8OFF4tU-c3T0simXX5B90ZzJ9Efj573RF6MM3D+JA@mail.gmail.com>
In-Reply-To: <CAFEAcA-At8OFF4tU-c3T0simXX5B90ZzJ9Efj573RF6MM3D+JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 9/2/22 10:25, Peter Maydell wrote:
> On Wed, 9 Feb 2022 at 09:20, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/2/22 21:08, Peter Maydell wrote:
>>> The "hardware version" machinery (qemu_set_hw_version(),
>>> qemu_hw_version(), and the QEMU_HW_VERSION define) is used by fewer
>>> than 10 files.  Move it out from osdep.h into a new
>>> qemu/hw-version.h.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    include/qemu/hw-version.h | 27 +++++++++++++++++++++++++++
>>>    include/qemu/osdep.h      | 16 ----------------
>>>    hw/arm/nseries.c          |  1 +
>>>    hw/ide/core.c             |  1 +
>>>    hw/scsi/megasas.c         |  1 +
>>>    hw/scsi/scsi-bus.c        |  1 +
>>>    hw/scsi/scsi-disk.c       |  1 +
>>>    softmmu/vl.c              |  1 +
>>>    target/i386/cpu.c         |  1 +
>>>    target/s390x/cpu_models.c |  1 +
>>>    util/osdep.c              |  1 +
>>>    11 files changed, 36 insertions(+), 16 deletions(-)
>>>    create mode 100644 include/qemu/hw-version.h

>>> +/*
>>> + * Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
>>> + * instead of QEMU_VERSION, so setting hw_version on MachineClass
>>> + * is no longer mandatory.
>>> + *
>>> + * Do NOT change this string, or it will break compatibility on all
>>> + * machine classes that don't set hw_version.
>>> + */
>>> +#define QEMU_HW_VERSION "2.5+"
>>> +
>>> +/* QEMU "hardware version" setting. Used to replace code that exposed
>>> + * QEMU_VERSION to guests in the past and need to keep compatibility.
>>> + * Do not use qemu_hw_version() in new code.
>>
>> Can you include the "legacy" word somewhere in the include path?
> 
> I'm not completely convinced that (a) we have a clear idea of
> what of our APIs are legacy and what are not or (b) that we could
> coherently move the 'legacy' ones into separate files.
> If you want to propose something like that as an RFC, I don't
> 100% object to it, but I don't want to do a very small subset
> of that as part of what is really just a "get stuff out of osdep"
> series.

OK, thanks.


