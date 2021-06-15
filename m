Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EB3A7A81
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:28:50 +0200 (CEST)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5NI-00009T-JV
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt5Lt-0007ES-8Y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:27:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt5Lq-00075B-JK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:27:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id z8so17524982wrp.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=8GgksroWPLtfjyt1Tw6J+k6EsKJ2FLOlt8bsIPRpHgQ=;
 b=cQmrums1hHSP2821EdkWU45YIo4KTNATFx0uaKbnWwk4i5qCWLOpBIPxjYqHN6tfbq
 iBxMXSiIP0bPMA09fqXfnAoElxplEVS8+YdFYhzoM0oI6L/rCkIqCHJizqXgF92mu7SL
 s3WUg06RlHuE4ob7luENFPu1nBuzU8vMnuDf30u24W+pZhgJto6ippPp4g+2aWPxXamv
 mwEJJjUsZuWvPcKfJU0eKv+IStJ0lTS0j91qXo6+Tw49/tOns4FAmJ/KYecQ7e21SU+D
 7JnTnO9zXJsmQKF8z2Ar/x1YVSKVxmkeU8N4sjQEra2xadmZVcoMl48EdWwdBJjMLLx+
 JNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=8GgksroWPLtfjyt1Tw6J+k6EsKJ2FLOlt8bsIPRpHgQ=;
 b=fQzuo+izy6dO0LtfORWFjovaGXbKC8MXuPkY11J4k3G1TQVm3OjLeINva6EiYrq5Y/
 sIHfTkRBpCLxsO6UamLgmG3eFaaL+zq7a+yCOiAVWMbkIMDwh2TBwTupZF4PTR1v+Y5O
 jm/Yvj8REhSSeHjnPPfUFHLVP9O8XY9oZbY3VRPz8BHrPqBtA+xraUNLwLYAwleanlH1
 4nDTSC5W9XnLpckEoNq32lcDRbo2Pdo7eV1qZP8CFQb8d5ZEYf1RcoaVDnY4kycd132z
 gbRsAtYlsdBAeRJfHL+GL99fj+62hLtx300Q1JX+WppYJ2it6HW6TK1eBIxVrS8wEdQi
 e3hQ==
X-Gm-Message-State: AOAM532gYC5qse0ADyDpoVLlLGrRCzrHuwQHJRJCt8BD2kmK1rN1ZHSK
 fl9jxE3psiOED4VeXuyqards5Q==
X-Google-Smtp-Source: ABdhPJx0rIHssUxSI+JzOB11/XOkYsvmTWNxffTOZl7v9svxsbjYroyV5IQukU9FMbZEfYYscgOxeg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr23695833wrr.374.1623749236150; 
 Tue, 15 Jun 2021 02:27:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u12sm18806467wrr.40.2021.06.15.02.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 02:27:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63C091FF7E;
 Tue, 15 Jun 2021 10:27:13 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 10:27:13 +0100
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 20:07:39 -0700")
Message-ID: <87sg1jiiku.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> The PSW_MASK_CC component of psw.mask was not handled properly
> in the creation or restoration of signal frames.

Still seeing issues running on s390x machine:

  05:00:29 [ajb@qemu01:~/l/q/b/debug] s390x/signal-fixes|=E2=80=A6 38 + ret=
ry.py -n 100 -c -- ./qemu-s390x ./tests/tcg/s390x-linux-user/signals
  ...
  ...
  Results summary:
  0: 62 times (62.00%), avg time 2.253 (0.00 varience/0.00 deviation)
  -11: 38 times (38.00%), avg time 0.251 (0.00 varience/0.00 deviation)
  Ran command 100 times, 62 passes

I don't get much from the backtrace, maybe the atomic triggered the seg?

  #0  0x0000000001016244 in vfprintf ()
  [Current thread is 1 (Thread 0x4001001910 (LWP 27308))]
  (gdb) bt
  #0  0x0000000001016244 in vfprintf ()
  #1  0x000000000101d484 in printf ()
  #2  0x0000000001000b2e in background_thread_func (arg=3D0x10a3620) at /ho=
me/ajb/lsrc/qemu.git/tests/tcg/multiarch/signals.c:65
  #3  0x0000000001003150 in start_thread (arg=3D0x4001001910) at pthread_cr=
eate.c:463
  #4  0x0000000001035b40 in thread_start ()
  (gdb) frame 2
  #2  0x0000000001000b2e in background_thread_func (arg=3D0x10a3620) at /ho=
me/ajb/lsrc/qemu.git/tests/tcg/multiarch/signals.c:65
  65          printf("thread%d: started\n", job->number);
  (gdb) info locals
  job =3D 0x10a3620
  (gdb) p job
  $1 =3D (ThreadJob *) 0x10a3620
  (gdb) p job->number
  $2 =3D 0
  (gdb) frame 0
  #0  0x0000000001016244 in vfprintf ()
  (gdb) x/5i $pc
  =3D> 0x1016244 <vfprintf+1316>:   asi     224(%r11),1
     0x101624a <vfprintf+1322>:   cgijne  %r1,0,0x1017570 <vfprintf+6224>
     0x1016250 <vfprintf+1328>:   lg      %r1,336(%r11)
     0x1016256 <vfprintf+1334>:   lghi    %r3,37
     0x101625a <vfprintf+1338>:   aghik   %r6,%r1,1
  (gdb) p/x $r11
  $3 =3D 0x4001000708
  (gdb) p/x $r11 + 224
  $4 =3D 0x40010007e8
  (gdb) x/1g $4
  0x40010007e8:   0x0000000000000000
  (gdb)

However running on x86 backend everything seems to be fine.

  Results summary:
  0: 200 times (100.00%), avg time 2.255 (0.00 varience/0.00 deviation)
  Ran command 200 times, 200 passes

>
>
> r~
>
>
> Richard Henderson (5):
>   target/s390x: Expose load_psw and get_psw_mask to cpu.h
>   target/s390x: Do not modify cpu state in s390_cpu_get_psw_mask
>   target/s390x: Improve s390_cpu_dump_state vs cc_op
>   target/s390x: Use s390_cpu_{set_psw,get_psw_mask} in gdbstub
>   linux-user/s390x: Save and restore psw.mask properly
>
>  target/s390x/cpu.h         |   3 ++
>  target/s390x/internal.h    |   5 --
>  linux-user/s390x/signal.c  |  37 ++++++++++++--
>  target/s390x/cc_helper.c   |   2 +-
>  target/s390x/excp_helper.c |  28 +++++-----
>  target/s390x/gdbstub.c     |  15 +-----
>  target/s390x/helper.c      | 101 ++++++++++++++++++++-----------------
>  target/s390x/sigp.c        |   3 +-
>  8 files changed, 110 insertions(+), 84 deletions(-)

--=20
Alex Benn=C3=A9e

