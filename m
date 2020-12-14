Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F22D9D75
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:18:59 +0100 (CET)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korUw-0007Xz-Md
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1korKs-0005Rp-QB
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:08:36 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1korKq-0005pj-T6
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:08:34 -0500
Received: by mail-wm1-x341.google.com with SMTP id k10so14436994wmi.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2X+xNMSqC4G5MktIytH2AlHSRFLV3eN5pVK17pVeHqw=;
 b=JQEJIDsgZm75Cw4njVll/gHVdr5cQhnjOpxQzBPKevbaLkf+JP4GqAZCoSkv8Uwu0f
 UwNzkUjkXxn7+huwMHeh90nXwnsWEighn/9WdHjb5ZLmpxbTuS6XP1BcO42obSDxZlCw
 tMK9fMnGzkPgZIbpyGIblDEitPozGAQQs79Tz7KIP6bagMjSIVlLbjoB4lECCKkX/RNT
 /YSc7hJCBDhhGdxkSJErvMEHPMixAFTTjxhbioc/NIxf9vctXwqo/nqqPDX337jNwTwc
 IL+7j/jvALwG1+9x21LIBH97iidumxtyC5T2JQ07TPEW52HO8CXqClOun0YM1b3BAJqY
 CEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2X+xNMSqC4G5MktIytH2AlHSRFLV3eN5pVK17pVeHqw=;
 b=kKNj5ltDUdjser1BvyKNx/kaEnTkI/Di1FGFWLy/Qd/BVS1aBtHLHHVMONPqIH66qH
 nPPpgqajSBrXH2jaIWEJfvKmUjZO7i1Bcz+4TVTyVO0V/5HNA3zazgn9MMkzHqR7DUCY
 Uofw1MvkFjN9f4OiN3odhm8XVcpfMxGjU0i4kLWuaeGnjbm01OnEIG5grF45dptinubE
 Uksvn4hb/ved0+VTKA78cgpGKR3iUobjMiKjf0aK7sCM/T03SGk8GungjVB9BV/M9JPo
 85erKdeujA1zUjcz9eMhX+M428ttyywX0U3lW1FZ8G1u1jUKFW7G7MY+CV0iSW5VN1aQ
 QGmw==
X-Gm-Message-State: AOAM533gt/kABtUGqX+K2dhyHGAFzh6qAyu9N4Kt8FarQHGx1zCnCWoG
 8WrVfxD6wCyXZI99CdEWA9SXjg==
X-Google-Smtp-Source: ABdhPJwqkWm3ICEtIRybIbNmag0g9kK/F5ldg4LwPCzdmj/5SmmnWCf+jij9rF3fIULSn/ZAlQjLkg==
X-Received: by 2002:a1c:a9c4:: with SMTP id
 s187mr28936956wme.116.1607965711060; 
 Mon, 14 Dec 2020 09:08:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c81sm33646864wmd.6.2020.12.14.09.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 09:08:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 079F91FF7E;
 Mon, 14 Dec 2020 17:08:29 +0000 (GMT)
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-3-alex.bennee@linaro.org>
 <CAFEAcA_2N=bMikxfHQWoX=rOOockSAAjpbBf8upm=w-LWp4KqQ@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 2/6] configure: gate our use of GDB to 8.3.1 or above
Date: Mon, 14 Dec 2020 17:05:56 +0000
In-reply-to: <CAFEAcA_2N=bMikxfHQWoX=rOOockSAAjpbBf8upm=w-LWp4KqQ@mail.gmail.com>
Message-ID: <87r1nstiwj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 14 Dec 2020 at 15:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Certain earlier versions of GDB have (possibly distro) derived issues
>> when running against multiarch guests. Also given the problem of
>> clashing ports it is preferable to use socket comms rather than TCP
>> ports for testing.
>
> What's a "multiarch guest" ?

I guess non-native guest would be another way of saying it. There is
some hoop jumping to deal with the fact that some arches package up a
fully featured multiarch aware gdb and some package up the multiarch one
as a separate gdb-multiarch package.

> Incidentally I think the problem I have been running into
> with the Ubuntu gdb 8.1 is that it doesn't support registers
> larger than 64 bytes, and if AArch64 QEMU is emulating SVE
> then it tries to expose registers bigger than that to the
> gdbstub.

So this is a missing patch from Ubuntu's gdb?

We could just peg the sha1 test to cortex-a57 - your are likely not
getting the SVE tests running unless you have the compilers to build
them (or using docker).

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

