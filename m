Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5D4320A5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:55:07 +0200 (CEST)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcU2c-00061M-DS
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcU1S-0005L5-Di
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:53:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcU1Q-0007sU-M8
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:53:54 -0400
Received: by mail-wr1-x430.google.com with SMTP id o20so42031468wro.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s0RcbVza/2k0sOuRyx+m2nYcdnkJxRc+6mYESYdbMa0=;
 b=N2bj4EDL9vyCW06St13vqJYWmRYUgVdJ8+scJtOghglxHPDsmC2xtwdyOTQQW83fr1
 5QiEnFdsipN9ifOLnXtbP+sii4Qzq/lHvmaArUoHV56hTUq4UuwU19c5wTNpRV8uqGvZ
 wiAYMoeOMcY+6R6+GYr9wUchd9F6pTUUWQNhx/sM0P+548/PnRLXSFopUE3Q2USXWYge
 A/mlGxnqSFU4cRoQp2RponoGzYOguaqVpCSMY4Pk3Js0aX3BSoizHbD2DTYo0RELyA1l
 W997AVtcmai7uUrOlaCDTD2oTtuI5m9KY3qoBcObz9CoepSvtOauvxaIZa43XXZgACwN
 ZgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s0RcbVza/2k0sOuRyx+m2nYcdnkJxRc+6mYESYdbMa0=;
 b=gD8XNV1VjLk7f4uXdX3/P9u+/htjp/XMgGbDtqtftdwPpNnv6AbR4aWB0cPfMURq23
 CEVRa0tR0vxcgOqfA91xOWfFAdW7WqcZrz4w542KE1Hw7RDqs3ts6p4s/2rrFctfRDQ8
 nnPQXD1n4Q76amTV/MNUMap+RH3X2XG0MH5OC4B+WqRzOSVTppRpjLnHbMdPYHQqP32+
 X5RS2hb8BDX43DSOI7/H7rXz6J7m5R8XcVbdJG9MS0SKLIGoBDdiIhkmrlanayqMmX/R
 RptdRO3L8IYM8Tfw1T1DQoQrTCsX7pr/3dj8Wb3CUEFgWZCV7QRvqPEdcnn0biGF9rBt
 OlBw==
X-Gm-Message-State: AOAM533xVX5HjPZnC0GHKbASQL2DG5O5M46NYcoa4hWKdH5FARXjHAiU
 vCHvt+l3WHXFXQpAPbkCiBkEPQ==
X-Google-Smtp-Source: ABdhPJwr+LdmEtFBjEwepMLYVS3iKJBQJtkDjAUvSkoCCzasxpQoSJuIBx8A/KI0Y05pCMWYAwPhyw==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr36961041wri.62.1634568830073; 
 Mon, 18 Oct 2021 07:53:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a5sm12748264wrn.71.2021.10.18.07.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:53:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 99EA81FF96;
 Mon, 18 Oct 2021 15:53:47 +0100 (BST)
References: <20211018140226.838137-1-alex.bennee@linaro.org>
 <139066ae-053c-8e55-da76-2b69f51f0717@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
Date: Mon, 18 Oct 2021 15:53:09 +0100
In-reply-to: <139066ae-053c-8e55-da76-2b69f51f0717@redhat.com>
Message-ID: <87sfwyz8n8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Lukas =?utf-8?Q?J=C3=BCnger?= <lukas.junger@greensocs.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 18/10/21 16:02, Alex Benn=C3=A9e wrote:
>> While there are a number of uses in the code-base of the exit(0)
>> pattern it gets in the way of clean exit which can do all of it's
>> house-keeping. In particular it was reported that you can crash
>> plugins this way because TCG can still be running on other threads
>> when the atexit callback is called.
>> Use qemu_system_shutdown_request() instead. I did a gentle rename of
>> the runstate stub seeing as it now contains two functions.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reported-by: Lukas J=C3=BCnger <lukas.junger@greensocs.com>
>
> That won't work with -no-shutdown, but you can just call qmp_quit()
> instead.

How does calling qmp_quit() fix --no-shutdown? Isn't it just a thin
wrapper around the qemu_system_shutdown_request()?

>
> Paolo
>
>> ---
>>   chardev/char-mux.c                     | 3 ++-
>>   stubs/{runstate-check.c =3D> runstate.c} | 5 +++++
>>   stubs/meson.build                      | 2 +-
>>   3 files changed, 8 insertions(+), 2 deletions(-)
>>   rename stubs/{runstate-check.c =3D> runstate.c} (64%)
>> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
>> index ada0c6866f..a46897fcd5 100644
>> --- a/chardev/char-mux.c
>> +++ b/chardev/char-mux.c
>> @@ -28,6 +28,7 @@
>>   #include "qemu/option.h"
>>   #include "chardev/char.h"
>>   #include "sysemu/block-backend.h"
>> +#include "sysemu/runstate.h"
>>   #include "chardev-internal.h"
>>     /* MUX driver for serial I/O splitting */
>> @@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d=
, int ch)
>>               {
>>                    const char *term =3D  "QEMU: Terminated\n\r";
>>                    qemu_chr_write_all(chr, (uint8_t *)term, strlen(term)=
);
>> -                 exit(0);
>> +                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUT=
DOWN);
>>                    break;
>>               }
>>           case 's':
>> diff --git a/stubs/runstate-check.c b/stubs/runstate.c
>> similarity index 64%
>> rename from stubs/runstate-check.c
>> rename to stubs/runstate.c
>> index 2ccda2b70f..f47dbcd3e0 100644
>> --- a/stubs/runstate-check.c
>> +++ b/stubs/runstate.c
>> @@ -5,3 +5,8 @@ bool runstate_check(RunState state)
>>   {
>>       return state =3D=3D RUN_STATE_PRELAUNCH;
>>   }
>> +
>> +void qemu_system_shutdown_request(ShutdownCause reason)
>> +{
>> +    return;
>> +}
>> diff --git a/stubs/meson.build b/stubs/meson.build
>> index f6aa3aa94f..8f6a9f17e5 100644
>> --- a/stubs/meson.build
>> +++ b/stubs/meson.build
>> @@ -35,7 +35,7 @@ stub_ss.add(files('qtest.c'))
>>   stub_ss.add(files('ram-block.c'))
>>   stub_ss.add(files('ramfb.c'))
>>   stub_ss.add(files('replay.c'))
>> -stub_ss.add(files('runstate-check.c'))
>> +stub_ss.add(files('runstate.c'))
>>   stub_ss.add(files('sysbus.c'))
>>   stub_ss.add(files('target-get-monitor-def.c'))
>>   stub_ss.add(files('target-monitor-defs.c'))
>>=20


--=20
Alex Benn=C3=A9e

