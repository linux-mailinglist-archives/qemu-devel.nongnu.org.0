Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CEC30A396
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:54:11 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6UyI-00047b-TY
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Ux1-0003aM-BQ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:52:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6Uwz-0005Kc-Iu
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:52:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id f16so11865969wmq.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 00:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cL5ZadQ2nv/GRkl048mqvqLjCnOlcvma/m7p4c0kZDU=;
 b=i15+1y1WY+yEhXOr2Wcf6Vr64Q3+L9PYXQWtcDxkH23ira8PQMCpQFuyc0X6I5m8Kp
 HVVks6z6HTqzmW+0JYx7rT8rlKZaz6G+qCzNzYtJYLuT2qX0V47Z1eV+qa20f7xqeNFq
 nV88V/9eNXeT1/Emrcu6RFRS+BVI0q8xjO7iqNaWdxFOekmU3Xo3e2kmQDzz0S3aZaQC
 WAbdOTP7ypwskXAjMdNBCe99jIeWHPTdZkF74beVh5CLB+NCE8v/EJvQQpOPbk/douwC
 Wu/dJM7fyKOKHW6rcH7oSEETvTEQDvAyt6U2aDpqw9Roc41pkTJ/gmJjHjM8IZQxArAC
 9QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cL5ZadQ2nv/GRkl048mqvqLjCnOlcvma/m7p4c0kZDU=;
 b=l00x6hzE2wyemt1jAiybOTnCPqswTwu/WCWWrSMtFcUgWBH6eVSchdTg9rx79ZwiIv
 QALwUVaCk9cNqgw1YdNYwuTK7gNAlJ83JQHy/DrG9njlsuK4NialUS6cGUHqBUmL2p8W
 Bz+F1ftLgNs+3/C7iJrW2e/hOBlyNSj3GsV7ibY7+2fC8xmmYS7T9cAcJlVMhTLmHoPs
 78Pp0t0UeiPrII/9S6M8E7i0vwQvsY2CnZ+sX6s9lvqsvna3AfsQC4eve2qw5YX2gHJ+
 5ttvmXfRgfhcyCiCzBe4znjMju/3Novck7bKkkNZFG4m47pTw5JUxEfrk4CaW1dvQfeB
 Wg0Q==
X-Gm-Message-State: AOAM530fB9rQUWw3IJy/gox48R+oKIRYVOeXtrqjhDg8JLmVKuZ7l2eV
 6KsJEnu3Z8LIIOZC7YxGyj4r4g==
X-Google-Smtp-Source: ABdhPJyBHYK3AWHExKy2HaTXshQAbCV7Cm5tmXb1G7RiGQb6ThUZMpfLKwwW0hpth/njI49qQAq7VA==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr13565309wmh.131.1612169567319; 
 Mon, 01 Feb 2021 00:52:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t17sm8999353wmi.46.2021.02.01.00.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 00:52:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C96C1FF7E;
 Mon,  1 Feb 2021 08:52:45 +0000 (GMT)
References: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
 <87y2glry84.fsf@linaro.org>
 <56ff4770-3e01-ef72-e054-fdc93533a3b3@ispras.ru>
 <87y2ghmfb0.fsf@linaro.org>
 <08a7b260-b787-9528-d96a-3b6d8879248b@ispras.ru>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] util/log: flush TB cache when log level changes
Date: Mon, 01 Feb 2021 08:46:50 +0000
In-reply-to: <08a7b260-b787-9528-d96a-3b6d8879248b@ispras.ru>
Message-ID: <87a6so186a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> On 25.01.2021 14:09, Alex Benn=C3=A9e wrote:
>>=20
>> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
>>=20
>>> On 22.01.2021 14:42, Alex Benn=C3=A9e wrote:
>>>>
>>>> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
<snip>
>>>>>    #endif
>>>>> +    tb_flush_all();
>>>>> +
>>>>
>>>> I would call tb_flush(current_cpu) or first_cpu here. But two things:
>>>>
>>>>    - I'm not sure you have a CPU at all times qemu_set_log is called
>>>>    - It seems overly aggressive to throw away all translations every t=
ime
>>>>      the log level is changed. I would define a mask in log.h and have
>>>>      something like:
>>>
>>> Do you propose removing the parameter from tb_flush or omitting the loop
>>> from tb_flush_all?
>>=20
>> No tb_flush should keep the CPU interface. In normal usage from the
>> emulation we always have a CPU to call. However for qemu_set_log you
>> will need to find a CPU to call or bail out if you can't. Maybe
>
> It the following true? We can't get rid of CPU in tb_flush, because=20
> do_tb_flush must be executed in vCPU thread.
> Can one CPU break others execution in case of SMP? Can we move flush to=20
> BH somehow?

The flush has to execute in the CPU context because it uses the
exclusive mechanism to ensure all other CPUs are currently quiescent
before doing the flush. Currently the exclusive mechanism is only aware
of CPU threads and extending it would be essentially re-introducing a
BQL.

>
>> something like:
>>=20
>>    CPUStatus *cpu =3D current_cpu || first_cpu;
>>    if (cpu) {
>>        tb_flush(cpu);
>>    }
>>=20
>
> Then we'll have to expose all this CPU stuff to utils and add stubs for=20
> them.
>
>> my only worry is if qemu_set_log is called from outside a CPU context
>> (current_cpu will always be NULL) while first_cpu is in a exclusive
>> region. We could extend cpu_in_exclusive_context to be:
>>=20
>>    cpu =3D=3D current_cpu && cpu->in_exclusive_context
>>=20
>> but that seems a little icky to me. Paolo, any thoughts?
>>=20
>>>
>>>>     if (log_flags & LOG_TRANSLATION) {
>>>>         tb_flush();
>>>>     }
>>>>
>>>>>        /*
>>>>>         * In all cases we only log if qemu_loglevel is set.
>>>>>         * Also:
>>>>
>>>>
>>=20
>>=20


--=20
Alex Benn=C3=A9e

