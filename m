Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1D370760
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 15:15:13 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcpSi-0006S8-Eh
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 09:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcpRU-0005cY-2I
 for qemu-devel@nongnu.org; Sat, 01 May 2021 09:13:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcpRS-0004Tf-8I
 for qemu-devel@nongnu.org; Sat, 01 May 2021 09:13:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id s82so611645wmf.3
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QMGnkp+UveHbbZ6DHBCkbTwhWVKQuDWe5peCfiEJtrQ=;
 b=JDYsorTP9NWjf8294whDWtQo0aH0XEyOCU55T/droEG7oI0dfE8721MC2VyUTXZM0v
 8AB+nSzK3COr9wxZuK9jROSMCFYzsb7EhkQ+logGzmiBkvRJu9OCV/Oega+nRQ0TBEwU
 QrAlyp7B6vrQQpM0fQb4ABeXDCx4XtWmJJ90cyLm517Perf/uKhKABs5DewZjmGod1PQ
 r22YppWQVryvZAZ7P0BWTnPVF8EK0dT4UOKtTmD+RKwLre/PVwEc/pt2MWAP7mvmuZ3e
 jHT0rwyAeabiZkSsmqpet7D5PLT4lYlJKrunVTWeT8LTEAp8EMXrBFE8RkBhrrKoQFql
 zJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QMGnkp+UveHbbZ6DHBCkbTwhWVKQuDWe5peCfiEJtrQ=;
 b=fb3CUr/qwSF8wv0OP/3YOK/OvZdRo8XIltjvSwjRNEGpK2EuPgF38I2jnfk27sqs7c
 FxTaDR6F7fSaQSXwGYQ+3eLLdf8LjsamhOVVMnsAllGcL3SDFHMKRhQJnkfPZ8v/M2g9
 qvhNyc/8j5jlT1Mjcs8WC+QmqRfDu18PbkcphAgUwpGm8w6y4x9FlmvPF5MlOhXiVI+k
 rzV9LD02JkL7byEin3QIy9eYGrfxRR1IUYYX3J09m9ce2VC80qIWGGMhSHY6C5ZqGBpp
 TTZjUuwigir/ciC3o263P1qjNT9ik5mpeuFuXHy8QWz2e9KaP3ONKK+LRG2RM37j0rnL
 MkqA==
X-Gm-Message-State: AOAM531SK56Dn3ufBkXvBLWTs2WYky6r/tnPcgqHm55yumbMZYURswec
 /d+D9hWS60bq66LXLb+oMXV8dmFdEzd0yNzA
X-Google-Smtp-Source: ABdhPJyLtxmKfyjtZiwkqZ02SDuzkGkVdalM2CJ8aa52s8yDZzuhWLlGBG2ddyK2wQWlVCivzz1w/w==
X-Received: by 2002:a1c:9897:: with SMTP id a145mr13779535wme.9.1619874832327; 
 Sat, 01 May 2021 06:13:52 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id v18sm6744448wro.18.2021.05.01.06.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 06:13:51 -0700 (PDT)
Subject: Re: [Bug 1861677] Re: wavcapture crash with pulseaudio
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Bug 1861677 <1861677@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <158073341807.19403.15811772889635903332.malonedeb@gac.canonical.com>
 <161986065342.4935.14510629788143038327.launchpad@chaenomeles.canonical.com>
 <98db3a34-3820-79e4-9423-b5c0fdd3674d@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <688dc944-f8be-54fe-6466-47cd261c2987@amsat.org>
Date: Sat, 1 May 2021 15:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <98db3a34-3820-79e4-9423-b5c0fdd3674d@t-online.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/21 3:01 PM, Volker Rümelin wrote:
>> You received this bug notification because you are a member of qemu-
>> devel-ml, which is subscribed to QEMU.
>>https://bugs.launchpad.net/bugs/1861677
>>
>> Title:
>>  wavcapture crash with pulseaudio
>>
>> Status in QEMU:
>>  New
> 
> Hi Philippe,
> 
> this bug was fixed with commit cbaf25d1f5 "audio: fix wavcapture segfault".

Indeed, thanks!

Phil.

