Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA20320C6E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 19:12:02 +0100 (CET)
Received: from localhost ([::1]:52912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDtD7-0001t2-KV
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 13:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDtBK-0000fo-PX; Sun, 21 Feb 2021 13:10:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDtBH-0007uL-HG; Sun, 21 Feb 2021 13:10:09 -0500
Received: by mail-wm1-x334.google.com with SMTP id n10so12380706wmq.0;
 Sun, 21 Feb 2021 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8AS8HVtNS7aMtsCE9eAx8uIyqzgxOpubCAtr2EbERxw=;
 b=dpy6M71HCXXcEmRurKidd4Xw7lSU4XfjWjRe6qju6yMJoUPqN9zsa5JWu1NQl2z72Q
 RQtLo9FB6oynakADDg3sRaGO+l6pDnrnZuEWlS8iPgAlnQu16he3jAtgu20Drp1b7xxN
 TOqaJ+Q+eN6hXcyD+VdY7AxaudG9XvX5uUK+aLWKymSM2YalpcIkWEbL6bBz4me9hlKA
 wyVDc2RPd37RBOg8kFevRScs9pAjoHEybitxQgNeAojo0BuGsf50oi3xczQdGGjUD+yW
 7v2/CQM7zVpysQD4HXW32b254D5MvEqmpbxnLHX+OBlOkr3Kw2u2kOYIQ0KKafq/YMSs
 DJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8AS8HVtNS7aMtsCE9eAx8uIyqzgxOpubCAtr2EbERxw=;
 b=Pte5BHIjR25LCqld740Jk4YC7tDstnuQocaCpVunD76QXcoNf+zwOYnHmPQUr0BAs5
 9Bx40c2PcdpvwXDTKymZ1AXlTwK4GbekiYr5KqncNX1Z16TbyCw6+snLTsmOGMoXsSq3
 vya2A3bTrpTSB73TaDdV/1Iw+VJinL8HGLSOo9NfFcVnsZUwgJVGSnvg3kt9j0ibSets
 aC58O7zFPHpXqpxZtn0GtNACPvPplRmOCIe1P+4iOE5JtKn/A5D5qY0xU7jWJRt6+mTx
 JGF6pGcHBVO0u64wetgiBhprj5yh+roMhvKAdOvKx0z5nwbHV/ubBg/9QKTTsjE/AkNa
 7VBw==
X-Gm-Message-State: AOAM530HsJ581ytOHOFWzsQ/o2QMHUuA77sc/Q2HAMcxZUJaHVEgZT4T
 mMKO+UiHs/28RtU162FGB9HBW8QifmE=
X-Google-Smtp-Source: ABdhPJxBlalUXaLD9z/wyfFHapWh1lBnClZsTD8aRrIQweS9bCogzV9kFst52zJDOo85zyVqFOYVaw==
X-Received: by 2002:a1c:e446:: with SMTP id b67mr17093405wmh.65.1613931005350; 
 Sun, 21 Feb 2021 10:10:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm22834752wmo.41.2021.02.21.10.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 10:10:04 -0800 (PST)
Subject: Re: [PATCH 1/4] hw/sh4/Kconfig: Rename CONFIG_SH4 ->
 CONFIG_SH4_DEVICES
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210208135048.2601693-1-f4bug@amsat.org>
 <20210208135048.2601693-2-f4bug@amsat.org>
 <CAFEAcA-CYk2XpngH_r3adYmb2t=39wfJA0pae8jmcOPCgofOvw@mail.gmail.com>
 <56febf1b-db70-d934-615d-88a9ff0cdaaf@amsat.org>
Message-ID: <fdb6f3f8-114d-7f46-e5da-461a4a8a86e6@amsat.org>
Date: Sun, 21 Feb 2021 19:10:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <56febf1b-db70-d934-615d-88a9ff0cdaaf@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 7:07 PM, Philippe Mathieu-Daudé wrote:
> On 2/8/21 9:22 PM, Peter Maydell wrote:
>> On Mon, 8 Feb 2021 at 20:04, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> We want to be able to use the 'SH4' config for architecture
>>> specific features. As CONFIG_SH4 is only used to select
>>> peripherals, rename it CONFIG_SH4_DEVICES.
>>>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/block/meson.build | 2 +-
>>>  hw/char/meson.build  | 2 +-
>>>  hw/intc/meson.build  | 2 +-
>>>  hw/sh4/Kconfig       | 6 +++---
>>>  hw/timer/meson.build | 2 +-
>>>  5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> We could if we wished be more fine-grained about this, eg by
>> adding new CONFIG options for each device:
>>  CONFIG_TC58128
>>  CONFIG_SH_SERIAL
>>  CONFIG_SH_INTC
>>  CONFIG_SH_TIMER
>>  CONFIG_SH_PCI
>>
>> and then in hw/sh4/Kconfig
>>  * config SH7750:
>>    add 'select SH_SERIAL', 'select SH_INTC', 'select SH_TIMER'
>>  * config R2D:
>>    add 'select SH7750' (it's a pre-existing bug that it doesn't, since
>>    r2d.c has a call to sh7750_init(). Harmless at the moment because
>>    nothing actually uses CONFIG_SH7750 -- hw/sh4/meson.build always
>>    compiles sh7750.c and sh7750_regnames.c unconditionally...)
>>    add 'select SH_PCI' (and make hw/sh4/meson.build build sh_pci.c
>>    only if it is set...)
>>  * config SHIX
>>    add 'select TC58128'
> 
> OK.

(Forgot to say in this case it makes sense because SH4 and RX targets
share peripherals IP cores, so some models could be reused.)

