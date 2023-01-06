Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7592660447
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 17:29:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDpZq-0002dQ-2S; Fri, 06 Jan 2023 11:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpZn-0002dC-Ir
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:28:15 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpZl-00029h-QD
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 11:28:15 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a30so1409841pfr.6
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 08:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XPvmZDo3wMujHNqKKILRAVd4+s1ij2cqF6+81Pa3jE=;
 b=xVbihMM5WZCsTJKtHV8G7m4TJ5/x85C/O0JKJB7pQxSn5gPk7TRL8rNZ8lMXn0FWH9
 K2KmmEZFZMfXuogAE+0IMf4bmdPGAD3+1GlO4PFy/ucFEPjmXfQoy2v4SbKwQbvZ01gG
 zvgM7H8bXWKQ6WSHvn1zYqPGqNnEOooszyG+BtvHsGbIZv0ct2Zm4XnhZnP+B9y1Lto/
 FN8zrkmIZKvzgd4IjGkQyE5rmg9zoHVZEACNtS5LZcXx0nvJmupa1kLZaJJ9yWvA5dk4
 C/ytXsSQ2ZVDhXCFYaxetBdV1J3Pm4BesGE69l8VBlzw3fshMEz3ygE8ohHttHVNtYMk
 1SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XPvmZDo3wMujHNqKKILRAVd4+s1ij2cqF6+81Pa3jE=;
 b=gXntKKrFaCCJDG51JKUifNPEocWQozOjuNemVelZWnokAY/Bj3kLb/gNWZiGmiZS5I
 1YDY6Cin9570S1X8S8yXGwwUKdU9vl4I6CfbUqjcUPsuRLqev0Hns79bsL1s8vw50ppW
 emFfLVRVJYIgBGEzfjEIb1gaR6wyCF+kkJiosc0iODec26uBKKZeFNhk4I09tmXBe2Gy
 jIob9RCakkVSkgFBUgEFszGh3RHlDOfgG3lsEkORjVry+GfIeAxmOsQknY0L/OnSRg2M
 COV1723cfcu4//oxHMV+2fKEpst12k3maq2hkTXDwdwuNcO1A2M1h62hPwrLvj1C54i9
 U75A==
X-Gm-Message-State: AFqh2kpvyQ/duSh84bHsXLz1mxPasaCb4fSOaev5MaZe3nJXdAE/hK8s
 8R//BMot1YkXdDya5EENcjYbzsl7iWJRj2CjETxIhw==
X-Google-Smtp-Source: AMrXdXtuJ/xiwGBA+/nZmPcTIEbXsCO/phWGM8noby7TJYbB/SMdGaGEWbUUg75/Q1MqoptU3NwGcIIC3jcepXVyr8s=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2566607pgd.192.1673022492045; Fri, 06
 Jan 2023 08:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
 <CAFEAcA-z7+X9-c43EmhoRBTrOYC9RtyHc5sgPamGRd_o+-tT_Q@mail.gmail.com>
 <871qo7pszr.fsf@linaro.org>
In-Reply-To: <871qo7pszr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 16:28:00 +0000
Message-ID: <CAFEAcA_9db5ijSTW1JBiC7kLUe+E=+OCAHg0xaoa-0p09Wbt3g@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-devel@nongnu.org, 
 bmeng.cn@gmail.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 6 Jan 2023 at 15:44, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > The semihosting API, at least for Arm, has a modeflags string so the
> > guest can say whether it wants to open O_BINARY or not:
> > https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihostin=
g.rst#sys-open-0x01
> >
> > So we need to plumb that down through the common semihosting code
> > into this function and set O_BINARY accordingly. Otherwise guest
> > code that asks for a text-mode file won't get one.
>
> We used to, in fact we still have a remnant of the code where we do:
>
>   #ifndef O_BINARY
>   #define O_BINARY 0
>   #endif
>
> I presume because the only places it exists in libc is wrapped in stuff
> like:
>
>   #if defined (__CYGWIN__)
>   #define O_BINARY      _FBINARY
>
> So the mapping got removed in a1a2a3e609 (semihosting: Remove
> GDB_O_BINARY) because GDB knows nothing of this and as far as I can tell
> neither does Linux whatever ISO C might say about it.
>
> Is this a host detail leakage to the guest? Should a semihosting app be
> caring about what fopen() modes the underlying host supports? At least a
> default O_BINARY for windows is most likely to DTRT.

I think the theory when the semihosting API was originally designed
decades ago was basically "when the guest does fopen(...) this
should act like it does on the host". So as a bit of portable
guest code you would say whether you wanted a binary or a text
file, and the effect would be that if you were running on Windows
and you output a text file then you'd get \r\n like the user
probably expected, and if on Linux you get \n.

The gdb remote protocol, on the other hand, assumes "all files
are binary", and the gdb source that implements the gdb remote
file I/O operations does "always set O_BINARY if it's defined":
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dgdb/remote-fi=
leio.c;h=3D3ff2a65b0ec6c7695f8659690a8f1dce9b5cdf5f;hb=3DHEAD#l141

So this is kind of an impedance mismatch problem -- the semihosting
API wants functionality that the gdb protocol can't give us.
But we don't have that mismatch issue if we're directly making
host filesystem calls, because there we can set O_BINARY or
not as we choose.

Alternatively, we could decide that our implementation of
semihosting consistently uses \n for the newline character
on all hosts, such that guests which try to write text files
on Windows hosts get the "wrong" newline type, but OTOH
get consistently the same file regardless of host and regardless
of whether semihosting is going via gdb or not. But if
we want to do that we should at least note in a comment
somewhere that that's a behaviour we've chosen, not something
that's happened by accident. Given Windows is less unfriendly
about dealing with \n-terminated files these days that might
not be an unreasonable choice.

-- PMM

