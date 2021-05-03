Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081A371B54
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:45:10 +0200 (CEST)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbgz-00088e-0j
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldbZj-0004D8-HJ; Mon, 03 May 2021 12:37:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldbZi-0004Hu-56; Mon, 03 May 2021 12:37:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso4441211wmo.0; 
 Mon, 03 May 2021 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lDyBKaje9tCrblDYnxk/P1XGebg244eOU1LPUnvS0oo=;
 b=IkoR0/ytK+h3+PRkEL+uEYnmO1BZD2ykwkMMlwQ0RJI6qNrk00NLQN3vQi7iCSAKfh
 qhwJ1cWO0XVfrdnV0+dr1Ikr4UQka+AlAZ1bjk2+bDztL8xwe5y9e4K9Ok2ddjsyqrVY
 i8AgoHRX+dWJ19l9Dl4qSOGBUQKXLEcnLJ1vqbe0smd3Yp2+fHKRWcRYDq7v/F7eIOEe
 Wkx7c5oJru0CjVIdLeNmU0CeB9D7XnFbUAlsxjCWGT6QpXh1MwE/PUXb0zGPym8fe5uK
 6f+wV/hSmewlB7rmcxqsH1f6xLkurPVKleEG8VBIGsWl/NQ9iK9jiwmPYIFLBhN2WDhG
 Ac9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDyBKaje9tCrblDYnxk/P1XGebg244eOU1LPUnvS0oo=;
 b=gopilGrZ90uW5K5qEwlUCwJKskdIeGPjcIlKYrvlhtQgXyhymjLWbRwiRvR/aNgG64
 Y8p/qiev3E+y/ZQjnq4wtXzhPY9XADiXgU7+WLHRtXoeKUsRtu9PnWFwkzKUDtZXAouH
 w0CT750xkWcMuaXEBsGCZr1FYgjYfbxFds+U004q3OkM40tdF0a8PgpNK9MZCF8vZBAK
 Zc0ERR67DwdYTkm6p4/2YxyVh2WG7iL9C4+OoJ1Jd9KgNiIMXK4i/mLxPCzQLPdG1FHR
 ZBgNXjpmNxzd+y8l+1J5HeTAfDqSFw7cZzOpabuynQ4jxI6SDIQrPyKrIpYmpLcPSKcQ
 dqpA==
X-Gm-Message-State: AOAM531Yfbf+OcuO3bIYeqlpyZF5NaqUGnXkbGOeszcYpcEalK3tv/Ln
 qlB62qi4XY0EWlXoaGkO2MyvUuxK5SEjuA==
X-Google-Smtp-Source: ABdhPJxLXgrZvVVMwAMMPHZQVug7wjiBXXgv1vey3EOBjFgDcBncBcpG395wHY4qPP/OPabK7ZuOqw==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr31777104wmq.41.1620059855097; 
 Mon, 03 May 2021 09:37:35 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id 61sm13593910wrm.52.2021.05.03.09.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:37:34 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
 <CAFEAcA-5h5ZjXyX6WbdQ8n=pqNSXTHfrt3fQSQzp6EYJY_zXLg@mail.gmail.com>
 <ab8fcac0-eb15-3f59-1b14-ef6b4cba6e03@amsat.org>
 <CAFEAcA-3o2qdssKezXdQY6f5oYSG8MKandXwsBOi1gXuqW2E6Q@mail.gmail.com>
 <20210413194319.u3dli2gbvwf6sx5r@habkost.net>
 <20210503172045.177af899@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15014600-ffa3-7142-95f9-c70852331766@amsat.org>
Date: Mon, 3 May 2021 18:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503172045.177af899@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 5:20 PM, Igor Mammedov wrote:
> On Tue, 13 Apr 2021 15:43:19 -0400
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
>> On Mon, Apr 12, 2021 at 11:44:29AM +0100, Peter Maydell wrote:
>>> On Mon, 12 Apr 2021 at 11:31, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:  
>>>> TIL MachineClass::reset().
>>>>
>>>> - hw/hppa/machine.c
>>>> - hw/i386/pc.c
>>>>
>>>>   Used to reset CPUs manually because CPUs aren't sysbus-reset.  
>>>
>>> pc_machine_reset() is not resetting the CPUs -- it is
>>> re-resetting the APIC devices, which looks like it is a
>>> workaround for a reset-ordering or other problem. I'm not
>>> sure where the CPUs are being reset...  
>>
>> CPU reset code was moved from pc.c:pc_cpu_reset() to
>> cpu.c:x86_cpu_machine_reset_cb() in commit 65dee3805259
>> ("target-i386: move cpu_reset and reset callback to cpu.c").
>> It's not clear to me why.
> 
> it was for cpu hotplug support, so that is we would have
> CPU in well know initial state after realize is complete.

It makes sense, but I don't see why this is considered x86 specific.

