Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83472F69F7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:52:52 +0100 (CET)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07jn-0006IY-T1
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l07ho-0004aB-FE
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:50:48 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l07hm-0006yl-L8
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:50:48 -0500
Received: by mail-wr1-x435.google.com with SMTP id a9so3420428wrt.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 10:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+0b1wpNw/luAIDnsul1iTYJdOSPFuzA0mFUnSRnmgFw=;
 b=Oud6ge6mQ5my/K32En5RtT8doTVdkvNpew0fUsccf2eV5V7mpMDrG20T/cAMaYkk1V
 hqg4VBHnLcvXCx1lXmEDuop2Q5CoXsZUnOu9+kJqHbmpBTncEm7MMD0AN1lOGhWAHmcF
 vqBvi78dgzd/1dUxmySlxft/8AQYOzDkGQ5yjZmNM3eemoMjrxsBpmL7aPoUFGOmjhS/
 P7DLO/g+wC5kK5k41G8gKs1fkG6kpe5QVkI0WtamR+CPQAsDAtpCRbecJ3PBM7TC1/z/
 F/mf9+ka53jMXXrerloh5+8ZhZaFfCecbYuId8LNiVeWysU+ACyIx90jK7fYXFl+kPTx
 B1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+0b1wpNw/luAIDnsul1iTYJdOSPFuzA0mFUnSRnmgFw=;
 b=bGFmbwJQCAIMuLZO4kvkEi24PtjNeScejysZx9BfSb1ZsGKbWGvVKH0wmHj7Wm8GNa
 tE/zS9WylcxMxSdoE2FXoGlki0tEtfWJ9hanHJc9viXRWO1DNpoutXqphVRKXt/oMv+n
 Tc3IkrmMe5GA+s1vJ/79zRcjCdmmJv1NEmShQXBWp1UkKGrzYbjx4bbNdUNPdCMyg+zy
 KAI+rJrx/+K9BsmuCLvN1aQ/N7yOd2bMOnfYXd1UpBHj4MC5RzUM8J89qAr0k2i8GJ24
 g7nTmCk/XNujsIEwjyOTK8dAklLjfmLb+QxsNOxZkuF85XrCAFqQr1UQAttvloS1eU1e
 +QkQ==
X-Gm-Message-State: AOAM530uqX337eUm9nRS6jwO451UPw36tttzFN6ZRonfJLsw67RkbTGs
 TRo8uzCxTY54RCnnzHKrXa/g5OMAXq0ndA==
X-Google-Smtp-Source: ABdhPJzSGHqlQJkohDseqBcV5UOJGeYzrWlWeraEplq0G3DVh7PEt005EPYBIHUkDiziJUpmSqRgeA==
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr9389811wrg.328.1610650244288; 
 Thu, 14 Jan 2021 10:50:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k9sm9669497wma.17.2021.01.14.10.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:50:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FE711FF7E;
 Thu, 14 Jan 2021 18:50:42 +0000 (GMT)
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-11-alex.bennee@linaro.org>
 <88ed23a1-06b2-ce13-842d-9aa1acb381a3@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 10/12] Fix build with new yank feature by adding stubs
Date: Thu, 14 Jan 2021 18:50:20 +0000
In-reply-to: <88ed23a1-06b2-ce13-842d-9aa1acb381a3@redhat.com>
Message-ID: <87a6tbl5dp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 1/14/21 5:57 PM, Alex Benn=C3=A9e wrote:
>> From: Lukas Straub <lukasstraub2@web.de>
>>=20
>
> Again:
>
> Fixes: 50186051f42 ("Introduce yank feature")
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Hmm I need to improve my tooling to pick up the Fixes and add a TODO.

>
>> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>> [AJB: tweak MAINTAINERS]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20210114141918.5201cc9c@gecko.fritz.box>
>> ---
>>  stubs/yank.c      | 29 +++++++++++++++++++++++++++++
>>  MAINTAINERS       |  1 +
>>  stubs/meson.build |  1 +
>>  3 files changed, 31 insertions(+)
>>  create mode 100644 stubs/yank.c
>>=20
>> diff --git a/stubs/yank.c b/stubs/yank.c
>> new file mode 100644
>> index 0000000000..6090416065
>> --- /dev/null
>> +++ b/stubs/yank.c
>> @@ -0,0 +1,29 @@
>> +#include "qemu/osdep.h"
>> +#include "qemu/yank.h"
>> +
>> +bool yank_register_instance(const YankInstance *instance, Error **errp)
>> +{
>> +    return true;
>> +}
>> +
>> +void yank_unregister_instance(const YankInstance *instance)
>> +{
>> +}
>> +
>> +void yank_register_function(const YankInstance *instance,
>> +                            YankFn *func,
>> +                            void *opaque)
>> +{
>> +}
>> +
>> +void yank_unregister_function(const YankInstance *instance,
>> +                              YankFn *func,
>> +                              void *opaque)
>> +{
>> +}
>> +
>> +void yank_generic_iochannel(void *opaque)
>> +{
>> +}
>> +
>> +
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cb0656aec3..07e4851aa4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2736,6 +2736,7 @@ Yank feature
>>  M: Lukas Straub <lukasstraub2@web.de>
>>  S: Odd fixes
>>  F: util/yank.c
>> +F: stubs/yank.c
>>  F: include/qemu/yank.h
>>  F: qapi/yank.json
>>=20=20
>> diff --git a/stubs/meson.build b/stubs/meson.build
>> index 80b1d81a31..1a656cd070 100644
>> --- a/stubs/meson.build
>> +++ b/stubs/meson.build
>> @@ -47,6 +47,7 @@ stub_ss.add(files('vm-stop.c'))
>>  stub_ss.add(files('win32-kbd-hook.c'))
>>  stub_ss.add(files('cpu-synchronize-state.c'))
>>  if have_block
>> +  stub_ss.add(files('yank.c'))
>>    stub_ss.add(files('replay-tools.c'))
>>  endif
>>  if have_system
>>=20


--=20
Alex Benn=C3=A9e

