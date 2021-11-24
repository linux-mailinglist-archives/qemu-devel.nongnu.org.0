Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC845B8B2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:55:04 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppvc-0001g5-3P
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:55:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mppQR-00057O-9S
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:22:51 -0500
Received: from [2a00:1450:4864:20::335] (port=55217
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mppQN-0007IA-Sx
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:22:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id i12so1778841wmq.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 02:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qR80y/50OyxC6iRdQUFHCvdzVQLVh70IWwyXSzldhLA=;
 b=dqsmN9piCTMXkvhlNz9I8GAYYThKvShTVGAELaXGpea5heuVDtZtGCxKg3byFvruF9
 oxE4YlHmoVZNXq4hpKyImnVCdeawb5vjam13BHwmXGWqVJEVKRpHGk0zbo4iVxwk34Eq
 fBtSyTjOm5hjHpTXVjeSwFRp/drAhZLwzhNnP9oZUY4aOFFb8eZUffLuolGfRW3AihpP
 35AoAyFKNRhyDbqoq66WFEQThI/6KSRaOoqN8ZkksgEMYpQt6C1jM0HdGFrrVxsuErEe
 mW8imRHjtT9igPAYmuzqoflSU0m4ce0OPMrFSb/0EpYOfRdXAapz5nFbooHNQu6O1IIY
 RNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qR80y/50OyxC6iRdQUFHCvdzVQLVh70IWwyXSzldhLA=;
 b=CyzsvJHl5QZE0DcWRcL9zZJ2xcCtwnMsaTObr3bRAWF+rsafovVyq8Ru3QvVJAOGHI
 2ygF6Qajs0TySNc/9uFP5z1KXRJzjqDfq7cipCIUHIkoTJPtN3Gp4rZQ6zqa7eBSJFdQ
 8TAksKxWFqrlO4HBeEu+dIvzjtSkOK2gGwcisWVanUmGGHgO0MqgUXaqR2icIJeVJLRO
 ddj608fbQ7pAOWqWzBfGgKUrBF2iSEanHpTVWVzlgiWKPMaWgR9JmO4zUQkfbBK0NTHK
 FeZmybEAGboETLUc0OhIW2yofqxZZWfCdH476miMXadc1I5JIfSeoFp7bt1989c4lKZw
 z7Hw==
X-Gm-Message-State: AOAM533Xb1r/ZsiJ2GUeX8Pr1NTEO2d1CuzYM8vu5nwBUq9bKRupco8U
 CTKQnDBFHp6VYLtBWIq+nMiM0w==
X-Google-Smtp-Source: ABdhPJy/9xqTmtgLTh/xz3qJZxmYM8byhuYrtEypHt4oQfYirDGE63brjLQwXgvAQBF7yAqT/BQSvQ==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr13725000wmk.92.1637749365580; 
 Wed, 24 Nov 2021 02:22:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 10sm19483900wrb.75.2021.11.24.02.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:22:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C93121FF96;
 Wed, 24 Nov 2021 10:22:43 +0000 (GMT)
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-2-alex.bennee@linaro.org>
 <65658e1d-43cf-d61b-3064-32cf670d903e@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 1/7] softmmu: fix watchpoint-interrupt races
Date: Wed, 24 Nov 2021 10:22:08 +0000
In-reply-to: <65658e1d-43cf-d61b-3064-32cf670d903e@linaro.org>
Message-ID: <87bl29j1jg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/23/21 9:57 PM, Alex Benn=C3=A9e wrote:
>> From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>> Watchpoint may be processed in two phases. First one is detecting
>> the instruction with target memory access. And the second one is
>> executing only one instruction and setting the debug interrupt flag.
>> Hardware interrupts can break this sequence when they happen after
>> the first watchpoint phase.
>> This patch postpones the interrupt request until watchpoint is
>> processed.
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> Message-Id: <163662451431.125458.14945698834107669531.stgit@pasha-ThinkP=
ad-X280>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   accel/tcg/cpu-exec.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 2d14d02f6c..9cb892e326 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -742,6 +742,11 @@ static inline bool cpu_handle_interrupt(CPUState *c=
pu,
>>               qemu_mutex_unlock_iothread();
>>               return true;
>>           }
>> +        /* Process watchpoints first, or interrupts will ruin everythin=
g */
>> +        if (cpu->watchpoint_hit) {
>> +            qemu_mutex_unlock_iothread();
>> +            return false;
>> +        }
>
> I think this is redundant with the next patch.

OK I'll drop it. The function is getting messy anyway.

--=20
Alex Benn=C3=A9e

