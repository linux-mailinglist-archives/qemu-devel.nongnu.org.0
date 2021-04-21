Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A202A367042
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 18:34:28 +0200 (CEST)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZFo1-0006wt-CR
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 12:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZFlz-0006Ma-AP
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:32:19 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZFlx-0005np-1F
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:32:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso1562155wmi.2
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rUPq1qAiavyLmkzqnrVkSjeWGL8RDEvYmUpWI64UGBc=;
 b=NCOwNnEC6mSethzLB22iIEaW1S299sFh3aa2DuBl/gW9FiKp7ypiczmXbP3oSKcMUA
 lz/RLdged7yuJVOFDRzOjDR3yZCXoDR7gnBe7U+4ve0o0deFjUovB7wTYCj3ISIf64JD
 b+2Fg9lOElDioMMVB3qMkGVI06/5LhC1t8xFA/ptWrA0Lc2bytkGHaXmgsJp738xBNa9
 87DR0aS25Kznuho9XXtEdxJTZAvwqQu4W/+JqKjmSFwaPxwQbumCSROmc0XiYbzVdiCY
 1ZNeHwu3wKlu0hmJji8PcGfvdVSGOme0F3I32APM6TSaZDmz/EqlUpeZDi4Z9Wzow7ct
 oj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rUPq1qAiavyLmkzqnrVkSjeWGL8RDEvYmUpWI64UGBc=;
 b=oGbsxbwEGJEA2MBgjtLX/InxAWJPob72xzYB/6JqArGRuZGZMiDXJBeinOyoSnYZu/
 UkzWeee01RcXgZ2hIBP3OG1ssMe+bSnKOJ5VCL5n9Eiw950Ieg858+QuSLG43aM3YYR7
 vx552UerYpzth0oYd1uqxbOWreHEK3cgdjWuh6dYlTMpYk+NXhU+tSb+3j3Moc6xU6q6
 b3hs9q1Lx2oN2WXaOcljp5fT0xQ5s3k5d9ctC0qIp72yTwZXnU3yWGcNR1Z9keTLZsiN
 YXjO8XK5PJL53yYcdUREOi7BRVn5cAc2rbh13AQupZzt9/wtg9PefTo8lyD6KgopQcVI
 zmjw==
X-Gm-Message-State: AOAM533hJ9NP0dQ5zTWQOwgLpKbQJyysdQ59FxlXnZrLNwhORyfP8bx9
 ZH7BRaWraEvmU8e2MbmLHX1e0A==
X-Google-Smtp-Source: ABdhPJy/C3jfg5SoZlXsItZ4Trd1rCWjoLAs/ejCBA0uMBuC3cbxN+Iiuo5jUnZ0RdV8JRJKj7zFXw==
X-Received: by 2002:a05:600c:2d56:: with SMTP id
 a22mr10708066wmg.175.1619022734893; 
 Wed, 21 Apr 2021 09:32:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm2765609wmh.0.2021.04.21.09.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 09:32:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F9951FF7E;
 Wed, 21 Apr 2021 17:32:13 +0100 (BST)
References: <20210421132931.11127-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] tests/tcg: add a multiarch signals test to stress
 test signal delivery
Date: Wed, 21 Apr 2021 17:21:32 +0100
In-reply-to: <20210421132931.11127-1-alex.bennee@linaro.org>
Message-ID: <875z0f8upe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This adds a simple signal test that combines the POSIX timer_create
> with signal delivery across multiple threads.
>
> [AJB: So I wrote this in an attempt to flush out issues with the
> s390x-linux-user handling. However I suspect I've done something wrong
> or opened a can of signal handling worms.
>
> Nominally this runs fine on real hardware but I variously get failures
> when running it under translation and while debugging QEMU running the
> test. I've also exposed a shortcomming with the gdb stub when dealing
> with guest TLS data so yay ;-). So I post this as an RFC in case
> anyone else can offer insight or can verify they are seeing the same
> strange behaviour?]

To further document my confusion:

  gdb --args $QEMU ./tests/tcg/$ARCH/signals

will SEGV in generated code for every target I've run. This seems to be
some sort of change of behaviour by running inside a debug environment.

Architectures that fail running normally:

./qemu-alpha tests/tcg/alpha-linux-user/signals
fish: =E2=80=9C./qemu-alpha tests/tcg/alpha-li=E2=80=A6=E2=80=9D terminated=
 by signal SIGILL (Illegal instruction)

./qemu-sparc64 tests/tcg/sparc64-linux-user/signals
thread0: started
thread1: started
thread2: started
thread3: started
thread4: started
thread5: started
thread6: started
thread7: started
thread8: started
thread9: started
thread0: saw 0 alarms from 0
...
(and hangs)

./qemu-s390x ./tests/tcg/s390x-linux-user/signals
fish: =E2=80=9C./qemu-s390x ./tests/tcg/s390x-=E2=80=A6=E2=80=9D terminated=
 by signal SIGSEGV (Address boundary error)

./qemu-sh4 ./tests/tcg/sh4-linux-user/signals
thread0: saw 87 alarms from 238
thread1: started
thread1: saw 0 alarms from 331
thread2: started
thread2: saw 0 alarms from 17088
thread3: started
thread3: saw 0 alarms from 17093
thread4: started
thread4: saw 0 alarms from 17098
thread5: started
thread5: saw 2 alarms from 17106
thread6: started
thread6: saw 0 alarms from 17108
thread7: started
thread7: saw 1 alarms from 17114
thread8: started
thread8: saw 0 alarms from 17118
thread9: started
thread9: saw 0 alarms from 17122
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
fish: =E2=80=9C./qemu-sh4 ./tests/tcg/sh4-linu=E2=80=A6=E2=80=9D terminated=
 by signal SIGSEGV (Address boundary error)

And another completely random data point while most arches see most
signals delivered to the main thread qemu-i386 actually sees quite a few
delivered to the other threads which is weird because I though the
signal delivery would be more of a host feature than anything else.

./qemu-i386 ./tests/tcg/i386-linux-user/signals
thread0: started
thread0: saw 134 alarms from 177
thread1: started
thread1: saw 0 alarms from 254
thread2: started
thread2: saw 1 alarms from 300
thread3: started
thread3: saw 1 alarms from 305
thread4: started
thread5: started
thread6: started
thread7: started
thread8: started
thread9: started
thread4: saw 80 alarms from 423
thread5: saw 7 alarms from 525
thread6: saw 4 alarms from 631
thread7: saw 6 alarms from 758
thread8: saw 4 alarms from 822
thread9: saw 635 alarms from 978


--=20
Alex Benn=C3=A9e

