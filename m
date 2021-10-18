Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C664323DC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:29:12 +0200 (CEST)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVVf-0003Lg-AO
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcVId-0003fz-VC
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:15:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcVIc-0001Pi-2i
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:15:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t2so42479784wrb.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=oQnmjTNEK55bzDecZXZoX8mAfxOvafsHzczRq4T4z70=;
 b=kZ6eAbjyQmi7RJqf7bQTcfnTvDPPGRORiyJd/jnv/NBaOaJJurLQaqU9knq88VFiUA
 oPZ6H1+5MuzEtnDcnEv/AwiKJutq8GurUjBhBbngI5g6f9fMSXgt3PDP4otOHHkVNaNw
 PPlbMIH7V0aQpyxt+xySMqcWGbqIvW5inWLlGr2sVWlMvp5bEtuVzcsnXnE2suF/6hv2
 ef3jwlQ6o09u4ZyH6MmL0vldEr5gv4V9CXoXC5GbnNE1XaPC8vJVSnXynUCYmpeyEMOd
 VGOJTcYJYlk+uYQDSfcvlKWcvwsObIVgz0u6qV9YqXk7fvRQEX8XNpYXqOnYgwpNXFed
 eYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=oQnmjTNEK55bzDecZXZoX8mAfxOvafsHzczRq4T4z70=;
 b=Quav8aoDJYlI9BjnRU3Ol00nyU6GfC9C2hEidLkB9JCBo6wL8gB7VinRWtd6HIvaNM
 Y5QJzh+/KMF3/UhXN6xgBPhCvlXDL4grOEyMpcfqY8t4SWXF4GVkdgpqhzRFZ/3J4D3T
 qTXuDx8ujsuKAklY11jwsX9ZCq0eNnmua0KdKhvgIIUPgkYX+fHFKSTXSejyKjGy02bG
 5SY8vdYvfarGZFtdHX1QCtjk4mtDk60KDIdBNbJXtDqG9C7D/K2dpfIO2CfNSPGgs9eW
 2P0So8KuCVgdO1RG46ymDqEsGtqt9WEPvjlI9OL/1uOzNHVZy6Z1HkDDp5q3CdllbfU+
 3M7Q==
X-Gm-Message-State: AOAM533/1qaqXA7iqlOwewolCihY1T+Qa5JmwYJzfTojevvNHhPBAofA
 PFeeXFAmr9d5hUoTuyLzXeBKEg==
X-Google-Smtp-Source: ABdhPJzVet4KXCwbLnqoNHUyLbQkT5KgXoR7+RirnAdxTNrSfuOUGOgP26UO34PLwATJKkEEXdzA/g==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr37164237wri.178.1634573739634; 
 Mon, 18 Oct 2021 09:15:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o26sm18561951wmc.17.2021.10.18.09.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:15:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED96F1FF96;
 Mon, 18 Oct 2021 17:15:37 +0100 (BST)
References: <20211018140226.838137-1-alex.bennee@linaro.org>
 <c40b635d-bfb9-8360-0151-4ea683eac402@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH] chardev: don't exit() straight away on C-a x
Date: Mon, 18 Oct 2021 17:14:26 +0100
In-reply-to: <c40b635d-bfb9-8360-0151-4ea683eac402@redhat.com>
Message-ID: <87o87mz4uu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Lukas =?utf-8?Q?J=C3=BCnger?= <lukas.junger@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/18/21 16:02, Alex Benn=C3=A9e wrote:
>> While there are a number of uses in the code-base of the exit(0)
>> pattern it gets in the way of clean exit which can do all of it's
>> house-keeping. In particular it was reported that you can crash
>> plugins this way because TCG can still be running on other threads
>> when the atexit callback is called.
>>=20
>> Use qemu_system_shutdown_request() instead. I did a gentle rename of
>> the runstate stub seeing as it now contains two functions.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reported-by: Lukas J=C3=BCnger <lukas.junger@greensocs.com>
>> ---
>>  chardev/char-mux.c                     | 3 ++-
>>  stubs/{runstate-check.c =3D> runstate.c} | 5 +++++
>>  stubs/meson.build                      | 2 +-
>>  3 files changed, 8 insertions(+), 2 deletions(-)
>>  rename stubs/{runstate-check.c =3D> runstate.c} (64%)
>>=20
>> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
>> index ada0c6866f..a46897fcd5 100644
>> --- a/chardev/char-mux.c
>> +++ b/chardev/char-mux.c
>> @@ -28,6 +28,7 @@
>>  #include "qemu/option.h"
>>  #include "chardev/char.h"
>>  #include "sysemu/block-backend.h"
>> +#include "sysemu/runstate.h"
>>  #include "chardev-internal.h"
>>=20=20
>>  /* MUX driver for serial I/O splitting */
>> @@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d=
, int ch)
>>              {
>>                   const char *term =3D  "QEMU: Terminated\n\r";
>>                   qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
>> -                 exit(0);
>> +                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUT=
DOWN);
>>                   break;
>>              }
>>          case 's':
>> diff --git a/stubs/runstate-check.c b/stubs/runstate.c
>> similarity index 64%
>> rename from stubs/runstate-check.c
>> rename to stubs/runstate.c
>> index 2ccda2b70f..f47dbcd3e0 100644
>> --- a/stubs/runstate-check.c
>> +++ b/stubs/runstate.c
>> @@ -5,3 +5,8 @@ bool runstate_check(RunState state)
>>  {
>>      return state =3D=3D RUN_STATE_PRELAUNCH;
>>  }
>> +
>> +void qemu_system_shutdown_request(ShutdownCause reason)
>> +{
>> +    return;
>> +}
>
> Hmm this isn't a stub anymore, this is the user-mode implementation.

It is? I don't think any of the chardev code touches user-mode, I had to
add this because apparently other binaries link the libchardev code.

> I'd rather have some shared user/ or meanwhile duplicate it in
> both bsd-user/linux-user (even if the implementation is empty)
> instead of a stub.
>
>> diff --git a/stubs/meson.build b/stubs/meson.build
>> index f6aa3aa94f..8f6a9f17e5 100644
>> --- a/stubs/meson.build
>> +++ b/stubs/meson.build
>> @@ -35,7 +35,7 @@ stub_ss.add(files('qtest.c'))
>>  stub_ss.add(files('ram-block.c'))
>>  stub_ss.add(files('ramfb.c'))
>>  stub_ss.add(files('replay.c'))
>> -stub_ss.add(files('runstate-check.c'))
>> +stub_ss.add(files('runstate.c'))
>>  stub_ss.add(files('sysbus.c'))
>>  stub_ss.add(files('target-get-monitor-def.c'))
>>  stub_ss.add(files('target-monitor-defs.c'))
>>=20


--=20
Alex Benn=C3=A9e

