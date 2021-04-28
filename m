Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB036DF60
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:07:37 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpX3-0000tG-Uz
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbpV4-0000DZ-Q9
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:05:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbpUv-0004cO-Gk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:05:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id x7so64181910wrw.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7SynPtWa8teW8+N3TMCb547MW5V4waKQW4Ad18jQe88=;
 b=RxNE4NMxVikktd5et25jWDFySi2hlOpox0gDdCn2zrUaYzLEZEiFrJEMXmAnTgTem3
 1MYFqaHCJn8MuNMGdG1n5Mmou/8gi+WVbGPErbu5zrXsm47DluQZGjDJ1yUnIyzheoo1
 zErakTGxrjOhNjsNu97dAuO6V8ah3hSdYExv1xvqph3ZRtZcMGFhiKujRaMmtPuswOAT
 7wgAHZ0VFYVREJKjOnrETSUkhZkiUuMRiIkBTy92POFqll86GxXQ2caQZfjYGGqR//t8
 vLJUm3ijP/mdtTB9gkQz39rgJq9i9t04r+HpMnm75ONEaaGmQ5hzHx9i86PcAYGKJubX
 ++Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7SynPtWa8teW8+N3TMCb547MW5V4waKQW4Ad18jQe88=;
 b=n8YT7qG9X4yh2WxApZo+Hs7MztbLLQuXIErVFJBBMfncMAmMCOEKrSBrg8tG1cOt1e
 EnBPbDJglnmBbs/NCW9qPE4x8qzFDiM+g8hNuakDnw9PB2mCE0+HCU1bhYRZ1NNURbsR
 CSQ13tJfvDp8HU6oTTQxeWulsWOnhHkAaN721cxrjK3qK2NyjFo1w1W2U1dMPvLRV58/
 SwaBnJvMHs/F/aMcC+HQQhenmnJmoSGqp0WCN7ZmWAm4CeKtCMbJ5GhMSPvyDtnd7ol7
 sVYkHMfem+rrkzIyCav3/sd1U1pUA+oYHo1NYpi0FKWaidcMOoZhxmL2Es0oo/+DLPCO
 MU5Q==
X-Gm-Message-State: AOAM530AIk3M1xhO2XfHsC7A8lsytFuWaSnD1w0KmtpCYuVftlB1nyoW
 tt+zn3OAW1WW3wCalRm0CXi3oQ==
X-Google-Smtp-Source: ABdhPJx1JqJoInSNBrFyYPLGuYs4KQz7FcxcFZArktXXUCZxqnxt6XJFK2krgD/zQY0f8WX3Kd6nTg==
X-Received: by 2002:adf:f1cf:: with SMTP id z15mr11922021wro.97.1619636718011; 
 Wed, 28 Apr 2021 12:05:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s21sm689891wmc.10.2021.04.28.12.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:05:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B5881FF7E;
 Wed, 28 Apr 2021 20:05:16 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com>
 <874kfqs5gl.fsf@linaro.org>
 <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if
 TCG is selected
Date: Wed, 28 Apr 2021 20:04:54 +0100
In-reply-to: <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com>
Message-ID: <871raus00j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/28/21 7:06 PM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Alex, Richard, do you mind reviewing this one please?
>>=20
>> Isn't it already merged (with my r-b tag no less ;-)
>>=20
>>   f77147cd4de8c726f89b2702f7a9d0c9711d8875
>
> See ...
>
>>   Author:     Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
>>=20
>>>
>>> On 4/15/21 6:33 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>
>>>> The previous attempt (commit f77147cd4de) doesn't work as
>
> ... ^ this comment :(

Ahh - my tooling was confused having searched by the subject title ;-)

>
>>>> expected, as we still have CONFIG_TCG=3D1 when using:
>>>>
>>>>   configure --disable-system --disable-user
>>>>
>>>> Now than we have removed the use of CONFIG_TCG from target-dependent
>>>> files in tests/qtest/, we can remove the unconditional definition of
>>>> CONFIG_TCG in config_host.
>>>>
>>>> This avoid to build a bunch of unrequired objects when building with
>>>> --disable-tcg (in particular the softfloat tests):
>>>>
>>>> Before:
>>>>
>>>>   $ make
>>>>   [1/812] Generating trace-qom.h with a custom command
>>>>   ...
>>>>
>>>> After:
>>>>
>>>>   $ make
>>>>   [1/349] Generating trace-qom.h with a custom command
>>>>   ...
>>>>
>>>> A difference of 463 objects...
>>>>
>>>> Reported-by: Claudio Fontana <cfontana@suse.de>
>>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>> v3: Include Paolo's feedback:
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
>>>> therefore o not include Alex's R-b tag.
>>>>
>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Cc: Emilio G. Cota <cota@braap.org>
>>>> ---
>>>>  meson.build | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index c6f4b0cf5e8..623cbe50685 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -262,7 +262,6 @@
>>>>                          language: ['c', 'cpp', 'objc'])
>>>>=20=20
>>>>    accelerators +=3D 'CONFIG_TCG'
>>>> -  config_host +=3D { 'CONFIG_TCG': 'y' }
>>>>  endif
>>>>=20=20
>>>>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
>>>>
>>=20
>>=20


--=20
Alex Benn=C3=A9e

