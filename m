Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D13819E6
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 18:35:09 +0200 (CEST)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhxFr-00049Z-Ly
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 12:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhxER-0003SG-1E
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:33:39 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhxEP-00012D-GZ
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:33:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 x11-20020a05600c2a4bb02901761d2b1da1so234708wme.3
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cjI+/zw7qHWBy3g3KaMX9/C+11XMK5MeJyqAtPi99fs=;
 b=q+stbsDCI02V3HuqX+BO9uRB5SV4HsifadDWK3xLQAnrhDj4iykqS1AqO6lF9zCvn+
 Hw4eA0p4ntH+j8jqI9NjcBmQjxv5Bg4v+CfvJ96YgFZDr0nFwVH2+PvwrMqhWoa7QM7x
 P33YiaK8Nzwjz674n7CX1Ztj9wgcTBcvQR3ml2WFt083HBZkC0ykgW2OHTPo83S6xwR4
 fUAiYDtU2NIrteOSt3BlBXHrYsCK33Iv3ONdowONfiOLPxXYALusvHXi7TqkAKEZkg9q
 1qU/UYo4p33ML0PD5yuieJN9W4kwD50F4V4cJobKAGpmm4+uofLL7t90YMHc9j3LgIUB
 yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjI+/zw7qHWBy3g3KaMX9/C+11XMK5MeJyqAtPi99fs=;
 b=rBxsXnvABCyhNjybrIjd06ZdrB2UF5cv/PfxWAesYPZ4lBAJcfaTkhCyvr89JCqMW3
 R7B/Q0mo4SP08D2bslgTkbdfTdX8SSo14Gf80qabqNgjmu1KuCIODRl5AZNQCFpMkGrT
 pluDCQaGmxZf5E5tFn11uvgYtbjEFp5WkrAl96en9gCl9hWhBqW3Pkg93d23J04ZptNd
 gEF1CQulqws/4DEkDZ7iRTxW1wBVy1QJ5La0J+bptcxHlJNXKGKiU0W8R7lDGjcDIJEo
 apngWAmvj/PLFpg+WcfjU782RrQ2EpQA1FLR49Xxbh/mHl8B6Nlil5IPfc9M5vzNl5b1
 V11A==
X-Gm-Message-State: AOAM5333dZeOgNuLKhnsu6OarCysGvyQCZBhqhhD1tZiywxzeHCPOZ+5
 zYaZAfc4Kowu7/7WHEO7fi8=
X-Google-Smtp-Source: ABdhPJwi3bpKcfC6G8OzPyOK0gEvvpWSilrbgTUeFqiuIk8dOsaA/kPhfOVf3T4IsqzJS6mL21pkBA==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr14812484wmn.28.1621096415936; 
 Sat, 15 May 2021 09:33:35 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x11sm9885620wrl.13.2021.05.15.09.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 09:33:35 -0700 (PDT)
Subject: Re: [PATCH v3 00/11] PS/2 controller related fixes
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
 <c136dc92-dd3a-4421-b0b7-86c4eadfc942@amsat.org>
 <bc88eea0-b857-e732-444c-7690cb6cba9a@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92388aa0-b0b2-1b23-57bd-9fc2e805e29b@amsat.org>
Date: Sat, 15 May 2021 18:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bc88eea0-b857-e732-444c-7690cb6cba9a@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/21 4:35 PM, BALATON Zoltan wrote:
> On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
>> On 5/15/21 1:31 PM, Volker Rümelin wrote:
>>> This patch series fixes two different PS/2 mouse stream corruptions
>>> and adds a feature that allows some old misbehaving DOS programs to
>>> have a working keyboard. With the last few patches, the PS/2 con-
>>> troller behaves more like a real controller.
>>>
>>> v2:
>>> Introduce the function kbd_pending() in a preliminary patch to ease
>>> the review of patch "pckbd: correctly disable PS/2 communication",
>>> as Phillipe suggested.
>>>
>>> v3:
>>> Patch "pckbd: correctly disable PS/2 communication" exposed a bug
>>> in SeaBIOS. The updated patch keeps the relevant code. Until
>>> SeaBIOS is fixed, the PS/2 controller command KBD_CCMD_KBD_DISABLE
>>> must disable the keyboard interrupt.
>>>
>>> In patch "pckbd: PS/2 keyboard throttle" in function
>>> kbd_throttle_timeout() an unnecessary if statement was removed.
>>> The KBD_STAT_OBF flag is never set when kbd_throttle_timeout()
>>> gets called.
>>>
>>> Volker Rümelin (11):
>>>   ps2: fix mouse stream corruption
>>>   ps2: don't raise an interrupt if queue is full
>>>   ps2: don't deassert irq twice if queue is empty
>>>   pckbd: split out interrupt line changing code
>>>   pckbd: don't update OBF flags if KBD_STAT_OBF is set
>>>   pckbd: PS/2 keyboard throttle
>>>   pckbd: add state variable for interrupt source
>>>   pckbd: add controller response queue
>>>   pckbd: add function kbd_pending()
>>>   pckbd: correctly disable PS/2 communication
>>>   pckbd: remove duplicated keyboard and mouse defines
>>
>> Zoltan, you might want to test this series with your Pegasos2
>> machine. It makes the keyboard detected correctly.
>>
>> There is still a problem with the mouse interaction with the
>> host. Pressing Ctrl+Alt+G to ungrab the mouse, my host mouse
>> is still responding to guest events... (unrelated to this series).
>>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> (PPC Pegasos2 so far)
> 
> I don't get the errors you reported. Keyboard and mouse seems to work OK
> for me with SDL on Linux and never got errors detecting it so far. What
> config are you using?

OK, apparently a timing problem related to slow emulation.
I can reproduce simply using "--enable-debug --extra-cflags=-ggdb",
not without it.

Using Volker's series it is harder to reproduce.

