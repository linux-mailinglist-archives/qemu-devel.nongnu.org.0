Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3963673C6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:51:38 +0200 (CEST)
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIsr-00058A-RV
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZIqS-0004GP-CF
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:49:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZIqP-00049E-5f
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:49:08 -0400
Received: by mail-wr1-x432.google.com with SMTP id c15so33574890wro.13
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bMfFqN8TdDSP36JLUYB8y+GLnt+KxPubkXvqVSc5LT8=;
 b=CtonrFC6od32J1M6N+pQUWg1N/g9SWVE6+d0k8Ql25iafC8MVI1xh1juF4OCcvyv7e
 o//cIGhQEEN6F2IQPYtng7rzkM32cLGFJgFZaB/ZHSTsYiK5Zy57P0BHA963ZZ990AOG
 qfjfZlKG8sN5srAphFYMOTXNTffsdAGcZpEOByZr/v5HAwyfHsoXWg+djxGWU2fAVjN5
 /KwFgjOWAfqpT4H2e2Jyg4SLxmCzhYl8EkXDRrCjmeAasiKujPkN7aiCZYiDmBLQPvXx
 xJ3/lhZK/rlI6u2mf5xMPqaUJGRCYbGDBiLvKal+RQiLJKnNinyxYA1IqgwNpJFjXerL
 ot5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bMfFqN8TdDSP36JLUYB8y+GLnt+KxPubkXvqVSc5LT8=;
 b=Ido2Qzqz0DR41eFO/Xn7IEphVgcpJE8m7ldH4bvBLsCLJ9x5QiXsybQpI0/kOdBh8p
 /AYlfjezQnKOJPcPQXRy+Ik+Xba/Kn0RZDx3zrg1k8uhc8hqmTZDu1LPdcM9Lv8gLfhB
 4L4+AEWyn1cE4vqK3LCjTeLAco15DxqUSJaB0FGOAy1789mYrhQsoOl6a1Y4yr8XfPiJ
 vW5A+UYQbeX4A3ob6expHsgXDkZ2euj2PnI9nUtDAoNxIzV/osHUxDRucUyUiol0xq82
 HbV/EedfhuRZ3e168bayqXj8MR4z4zPsOE+O9H0a7dqOsNzsmjJ2fwfyO2IERQTr07Ej
 ZefQ==
X-Gm-Message-State: AOAM531wiBkkxYS9K8w3i4/iKAnedpu1lBOorcOfPn8tHdOA+tSZ5Rhv
 Qz16qlLlWHniXPrBabDvf4b7gA==
X-Google-Smtp-Source: ABdhPJypePn6A6xXUB18JXIsYNKCdRTtgvmtw5oqxE3FX53wufm7Rha/4iE7XgVKryCO+ShxlKT4kw==
X-Received: by 2002:adf:c08c:: with SMTP id d12mr28685522wrf.399.1619034542822; 
 Wed, 21 Apr 2021 12:49:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm392281wrt.83.2021.04.21.12.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:49:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEF461FF7E;
 Wed, 21 Apr 2021 20:49:00 +0100 (BST)
References: <20210421132931.11127-1-alex.bennee@linaro.org>
 <0edb902de3407d276c264a87335550d4d0e8f93af530ff196e5bd69064b92a74@mu>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] tests/tcg: add a multiarch signals test to stress
 test signal delivery
Date: Wed, 21 Apr 2021 20:47:52 +0100
In-reply-to: <0edb902de3407d276c264a87335550d4d0e8f93af530ff196e5bd69064b92a74@mu>
Message-ID: <8735vj8llf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> This adds a simple signal test that combines the POSIX timer_create
>> with signal delivery across multiple threads.
>>
>> [AJB: So I wrote this in an attempt to flush out issues with the
>> s390x-linux-user handling. However I suspect I've done something wrong
>> or opened a can of signal handling worms.
>>
>> Nominally this runs fine on real hardware but I variously get failures
>> when running it under translation and while debugging QEMU running the
>> test. I've also exposed a shortcomming with the gdb stub when dealing
>> with guest TLS data so yay ;-). So I post this as an RFC in case
>> anyone else can offer insight or can verify they are seeing the same
>> strange behaviour?]
>
> To further document my confusion:
>
>   gdb --args $QEMU ./tests/tcg/$ARCH/signals
>
> will SEGV in generated code for every target I've run. This seems to be
> some sort of change of behaviour by running inside a debug
> environment.

This bit at least seems to be triggered by the page protections for
detecting SMC - I think. If you skip past them it triggers:

    if (is_write && info->si_signo =3D=3D SIGSEGV && info->si_code =3D=3D S=
EGV_ACCERR &&
        h2g_valid(address)) {
        switch (page_unprotect(h2g(address), pc)) {

and runs.

--=20
Alex Benn=C3=A9e

