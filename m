Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEA4BDA43
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:35:02 +0100 (CET)
Received: from localhost ([::1]:45544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9mG-0007Mb-OI
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:35:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM9gy-0004g0-LI
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:32 -0500
Received: from [2a00:1450:4864:20::32a] (port=44960
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nM9gv-0003Qq-1E
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:32 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so11303237wmq.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WBlWdZAoV60j2wakfauBqY8qFrlv2VTw2qHxYi/LKag=;
 b=Eov9SPUrDcT/RZveSU+8xThulnOuQ2jpfAqxQkjC2A7qv5WWOSKYRwW1ibtLyNC/d8
 PapwxBKQb+lJDnsZQt9NqU1bIKxBSPT9BOTw2mxWIuYyYRRzar3cOqk9gcldWXOXwj06
 N9T7WUREP9jw+0iPCcCDWiHO/o+1FGj8N/RT8WC9TrXGD4a+GDVyZQBItrPlHsRMKFQ0
 pVuBd9OcP96Q1gzd1I0udH/+yZ1Tf5CcVU6ckmI7m6WaOpN84ATTp9pZpK8mb0Ei3VJY
 HLF9k8vV0bLkty9W9DHJ31g2/WM18WiClgB1LArIusvPoRtwoQ+WiuBKY7PYGThU8ZZR
 nDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WBlWdZAoV60j2wakfauBqY8qFrlv2VTw2qHxYi/LKag=;
 b=1Ja0tbLFp8xttqHXzZ5stERCDKCmfPztOYl+2PzIu3EO0DvTgdnSxqyWmYr1sT7iDP
 mae/BeyUW6Lqs6diRx/IlAXGz422fMMy6JgRlNBJRJfnaAq0SPLAjwfjfE0E0PpyTiF9
 aVkpzuCXN4mHsJUej846W880NGQPcQxVPzQm66Onoj0We8j0bTiehgAy+sIZfmevkxdj
 HfS//NfUmzyyEQjp3bCbM8EF7GpF3ht8Kakx1wDflyxWaMywFLhgC15nnvMqGfZ3pkZZ
 chUSC4yGEnek8mB/KD5u0aUHUus+cUwfJZmAjOkPxb1LnQ4MxvBcX7BznTfHYDNAvJFs
 5UxQ==
X-Gm-Message-State: AOAM531R3GWB1T+30Uo7M3O+uipUu6MsDc7ciyv9oUtKQAs3vlk0YPzZ
 2qwvGtyogVQ9JpY/j5OqZu4=
X-Google-Smtp-Source: ABdhPJyJz/TaQ5lw+4ZwD/dTyo3dNt+Cg9KeNXqKkVaVA2nE+4/4ALt3pecdgJbN/Yca+mimdXFOzg==
X-Received: by 2002:a1c:f003:0:b0:37b:d5fc:5c9e with SMTP id
 a3-20020a1cf003000000b0037bd5fc5c9emr17972827wmb.154.1645453760675; 
 Mon, 21 Feb 2022 06:29:20 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l28sm53599156wrz.90.2022.02.21.06.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 06:29:20 -0800 (PST)
Message-ID: <7d9779bf-252a-a810-81b1-ec27135cea83@gmail.com>
Date: Mon, 21 Feb 2022 15:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] hw/misc/pvpanic: Use standard headers instead
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220221122717.1371010-1-pizhenwei@bytedance.com>
 <20220221122717.1371010-2-pizhenwei@bytedance.com>
 <89be0672-87e4-b0dc-5b36-0ab05f100e8a@gmail.com>
 <CAFEAcA_kZkX7w+wxxYRbFxfXzaL7gc+Q0=ySEwE8Bg14=iVybA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA_kZkX7w+wxxYRbFxfXzaL7gc+Q0=ySEwE8Bg14=iVybA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 15:11, Peter Maydell wrote:
> On Mon, 21 Feb 2022 at 13:55, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> On 21/2/22 13:27, zhenwei pi wrote:
>>> QEMU side has already imported pvpanic.h from linux, remove bit
>>> definitions from include/hw/misc/pvpanic.h, and use
>>> include/standard-headers/linux/pvpanic.h instead.
>>> Also minor changes for PVPANIC_CRASHLOADED -> PVPANIC_CRASH_LOADED.
>>
>> It seems to fail to build, missing PVPANIC_CRASH_LOADED. On which
>> tree is this patch based?
> 
> That's in patch 1/2.

Sorry Google Mail is making my life harder, and this series not having
a cover letter didn't help.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

