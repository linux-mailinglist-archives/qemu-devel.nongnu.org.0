Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC1338F09
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:44:43 +0100 (CET)
Received: from localhost ([::1]:36252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKi5q-0006T2-Pn
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKi4k-0005Q1-9Q; Fri, 12 Mar 2021 08:43:34 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKi4i-0005Aw-O3; Fri, 12 Mar 2021 08:43:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so15833965wml.2; 
 Fri, 12 Mar 2021 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KCJ75BGhEhOfVEFa9uKBURjUCyJ0UliRcUvh3NK2fc4=;
 b=qkn5ETVqrbX+knqh3on3KGcfKTH1qC4OPCxbTeBBuaQoCh/GLquBgyKoX1SEoYj1LW
 FYO8BzM9QMLsg/deGnPbG73Seah0sfFjz0HzSe7TyFxUvSKjoQCFq4hOcyWbr6k0WP8q
 QOjcN0p4K+RZx/fp8/TtrGOsMbgMGzA7RlF6xjvmk0Gj/GVGdzZYZc0IyDcl4L1xuWHc
 zBJkSuXyiaundrFqMos7ej3gC79puIOvpcEn1/M5+3nHDJ/qDNCkPBd5fYmTc2aV4xjT
 aJW/bBZUpykimkQfx+0Yj8jNANoSqJ7dE+61YF5fIh8EDgjWlX77dYVkoksbnlDOg9qD
 6Siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KCJ75BGhEhOfVEFa9uKBURjUCyJ0UliRcUvh3NK2fc4=;
 b=SgCL6TC+ChVrYW8wSKkAkhqCCnnZaubo42uymj1Zkxr4iRO+QDuzBSJ2T/PYJWRNTJ
 A2FChh4K7bm8RsjgLOLGg+EswHdw8PnwWv7EMhsuuBdDZhGe07Ck81KmbHkDjSItpFoA
 vECzY9+Vu9zzDbbMDMwUzfweGdukuIRcV557J2nS1qdd9HY5wZaTrUxcNfV2RtcGX7Zh
 AG6IQvnoAiCt2XO3Kat03fVTiE6Wt3dEVYqKUqJ8FLSzt1Ocyo+qcQrjbGFyFwBPaVZZ
 B9QTt4HBaN+NlyIhvFmCiNpYlX3+srF3pAVtD6qGF3x6Qr+6Ct+8ylP43Vb9r413EI+9
 RHoQ==
X-Gm-Message-State: AOAM531oDdwlVU6Qvo6oDgvuulfqM5aUagZMXRpqqo+vr2eluShrGIOk
 3jgBrrtnFK9YxhPq59WYm8UQCLgZ4Bs=
X-Google-Smtp-Source: ABdhPJyjibBkf3VEiCIf+stCB5BwR6tTESMLEz8kXXlVYfI8lrDW0C+yP1xRxpPvxLhaqGcf3IRLdw==
X-Received: by 2002:a1c:de05:: with SMTP id v5mr13123534wmg.25.1615556608692; 
 Fri, 12 Mar 2021 05:43:28 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i3sm8226630wra.66.2021.03.12.05.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 05:43:28 -0800 (PST)
Subject: Re: [PULL 00/22] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210310214504.1183162-1-laurent@vivier.eu>
 <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
 <13bb89f8-7ffd-b22b-d6ee-8b9eb88c9575@amsat.org>
 <4f488d6d-4c93-1032-b293-42f4b3f4517c@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <77bd7942-a6b7-8948-dab6-cda06dd25ee2@amsat.org>
Date: Fri, 12 Mar 2021 14:43:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4f488d6d-4c93-1032-b293-42f4b3f4517c@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 12:05 PM, Laurent Vivier wrote:
> Le 12/03/2021 à 11:15, Philippe Mathieu-Daudé a écrit :
>> On 3/10/21 10:52 PM, Laurent Vivier wrote:
>>> Peter,
>>>
>>> my "git publish" has failed at patch 20 with:
>>>
>>> Requested action aborted
>>> Mails per session limit exceeded.
>>>
>>> I think my email provider has added new limits :(
>>
>> With GMail I could pass from the 20/session limit
>> to the 1000/day limit adding to ~/.gitconfig:
>>
>> [sendemail]
>>     smtpServer = smtp.gmail.com
>>     smtpBatchSize = 1
>>     smtpReloginDelay = 3
>>
> 
> Thank you,
> 
> I've set smtpBatchSize to 19. We will see what will happen next time...

I started using 20, then 3 and finally 1. Not sure why now,
but I remember I had to do this for some reason and it worked
better using "batch" of 1 patch.

Also initially I was using smtpReloginDelay=1 but had to increase
it up to 3sec.

Anyway this is specific to GMail.

