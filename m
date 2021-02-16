Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55D31C9A4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:28:20 +0100 (CET)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByWh-0004XW-6d
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lByTe-0002sb-Us
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:25:10 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lByTb-0005if-SE
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:25:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id o82so1496549wme.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CA/nf5YRp8crA0B/V6xoxaD3RPOPTL2eQ7dEW0chK6s=;
 b=K1hx24zneTPvdymB53ncKaP6FPFeY6iiDWaEqZPZxLC9EEfjBy5OioUlN/bft19Yjq
 2D5qs6610RQnim6H/TlIV4A/I/ogU6VZfKcjOLO5rV2NuDKDfSUFF6L8EnaifJzG1FVw
 j/JEh2+PKQ/jLCPgalnsxGEQucJjR49ZtotIiU3YtcLPtLujWYU61DAQFaTMb6P+BFsT
 tgo29p1grf2jO/DCsAtPQ4yTWPVETpf+5NXpVr+CuaUNYHDz0hpVYhojtufdnu/xxQZH
 1g7ySrBuDptm0qbg/VMAlQRfP7nzdwjClf1ppwpG2ctbrnXarg1OfVV21xpRhODiaZTM
 FC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CA/nf5YRp8crA0B/V6xoxaD3RPOPTL2eQ7dEW0chK6s=;
 b=jVjwAw+9vovAiIULMLRco6uyfczNk/+NCPEVj/yq6nrZOrPuLgqgx+90Whqp/Aw4QR
 Eu/j7qZW8OI0+ZKoeUR6rHzEK56r0d9JuRw/yX6qDOEt6jFRFcR/XkR/i8XX8T8QK+3t
 4Ob8qPEn93b2JkdtN+U9vjC/OAgz05hed2urRijUMl5U76gDCn06KscE+zyaBlSCxOac
 jlanUFtHPoko98NqulW8lMQXuvI8hMFkOB6NjOHmbPY2KzMBL9ls4t5oLNsRHYDusL6n
 sdndUG5XSVH/V55t0yebvKqzV2FseXnabP4enlbkKmYcmmVIqe3do5XUJ6mTXDYBjO92
 ra+g==
X-Gm-Message-State: AOAM532Oh0nVpvfsQFeajHaN3h0UNo1gHTWB1i5CTB/Iro6u0eJd9vnv
 72cvnBG98LO4gIaIZMY9K66w4w==
X-Google-Smtp-Source: ABdhPJwdaqT1inx9jpObmcXFQTHf08IqfNfIshGrORYeg3zvKZrXMX65NwLlB69AFrzzGO9Rka53Ig==
X-Received: by 2002:a7b:c410:: with SMTP id k16mr2985100wmi.48.1613474705915; 
 Tue, 16 Feb 2021 03:25:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j23sm3088609wmo.18.2021.02.16.03.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 03:25:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C5081FF7E;
 Tue, 16 Feb 2021 11:25:04 +0000 (GMT)
References: <SN6PR02MB420590EF08DD9FFA5DC81EB6B8C60@SN6PR02MB4205.namprd02.prod.outlook.com>
 <68c3529b-9710-0d78-13eb-608ff2ed2c2f@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: hexagon sysemu - library loading path feature
Date: Tue, 16 Feb 2021 11:17:55 +0000
In-reply-to: <68c3529b-9710-0d78-13eb-608ff2ed2c2f@amsat.org>
Message-ID: <87lfbotfu7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Brian Cain <bcain@quicinc.com>, Michael Lambert <mlambert@quicinc.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Sid Manning <sidneym@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Cc'ing Laurent and Alex.
>
> On 12/17/20 6:14 AM, Brian Cain wrote:
>> My team is working on sysemu support for Hexagon.  We've made some good =
progress so far and we'll work on upstreaming after Taylor=E2=80=99s hexago=
n linux-user patch series lands.
>>=20
>> The only use case we have focused on with sysemu is booting/running elf =
programs.  Both "-device loader,file=3D..." or "-kernel" are effective and =
work similarly.  We have implemented "angel calls" (semihosting) to do host=
 I/O.  We have not yet tried using the QEMU semihosting features/cmdline ar=
gs, but may explore that option.
>>=20
>> One feature we'd like to integrate is a guest library search path
>> feature.  The existing hexagon simulator program distributed in the
>> Hexagon SDK has a command line option, =E2=80=9C--usefs".  The manual st=
ates
>> that it =E2=80=9CCause[s] the simulator to search for files in the direc=
tory
>> with the specified path. It is used for accessing shared object files
>> that are loaded during program execution.=E2=80=9D  If the guest OS has a
>> loader that tries to resolve an executable or library's DT_NEEDED
>> shared object libraries, we would want QEMU angel calls to be able to
>> search a user specified host-path for the toolchain language support
>> libraries.

The current semihosting syscall ABI basically relies on the CWD of the
either the QEMU binary or the GDB process (if routing semihosting via
the gdbstub).

Are the Hexagon angel calls the same are ARM semihosting or are they
there own thing? Can you point me at a spec?

>> This feature is like the functionality in QEMU=E2=80=99s =E2=80=9CQEMU_L=
D_PREFIX=E2=80=9D
>> environment variable used by linux-userspace.  So, one idea was to
>> just (ab)use this interface to mean the same thing for sysemu.  We
>> could make it a target-specific hexagon feature, if it doesn=E2=80=99t m=
ake
>> sense to have it as target-independent.  And if it makes sense we
>> could qualify it like HEXAGON_QEMU_LD_PREFIX.

Let's leave QEMU_LD_PREFIX to user-space. We try and avoid adding new
environment variables - especially to system emulation. I think this is
something to expose via a properly modelled QOM property which then can
be tweaked via command line or HMP/QMP.

>> If not this environment variable, is there an existing QEMU feature
>> that maps well here?  Or is there a better interface that we should
>> consider instead?

Not really - we virtiofs but that is a guest visible device that allows
file-system pass-through to the host. However it does broadly assume a
Linux guest (although there is no reason it has to).

>>=20
>> -Brian
>>=20


--=20
Alex Benn=C3=A9e

