Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69BC301573
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 14:36:54 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3J5y-0002xd-0p
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 08:36:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3J4d-0002Uq-2M
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:35:31 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3J4Z-0004Bu-Qh
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 08:35:30 -0500
Received: by mail-ed1-x531.google.com with SMTP id s11so9778064edd.5
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXBmJAckViMNjGEPuflnV9NY2VLlaKUEe2/zpzjoHGE=;
 b=FT74S1VRMSijtVNl6VYVuN9BT6EMfhgijHwEylMQAWwZ2BTEBabIsIuggOplOIp6Iv
 Cp9IANJS+LzVVd6gGXVyr/IIl/BZ6mcVs6UKmtibetEitLOQEQmXDWcDQCiiKx2JTmQN
 i47kaq6Mf5p3cJ0+XHCcHiXpfJf9GxuVWlJVfcJRuoj1Dp6mkV98LRkESAR9GkjL9quN
 FTeVyPotHV3Zymnd3YAmMpmOxNaumVF4dsyDOWm4YzmWvnFmzFrt8LMmBGbhPs4tDmJ5
 ttnddMtXnI6I502DVTBcI028DVfHl5OlXZbvhT8IR0m/s2huMArPpBt/6NOqgUpaaMSD
 2GHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXBmJAckViMNjGEPuflnV9NY2VLlaKUEe2/zpzjoHGE=;
 b=EA2rusGS7698MLG2EQbiTKufStuz3B5WvKh/rYEdJHqIHSeXWwTCTq7Rv/P236ZJfl
 YIY61COF9l5dhtYSpyETwseBHbNRh4H0t2/RctZ9zq6DCXig4QVA65ILCPd5TqfB8zhT
 Pb0wJd16S86yMoAJ4vS7NF1t/sbhk6tBxkgtNh8FDH3D7CkLtRUe+ZMbIgHHJPTSnfdW
 OOvXJQTDTMCBde0PGu0r1Rb9A7wZu/uaRtV9c4kA9eK+lpKudK0EJC/wDR1FcT9rJO/y
 DDHhJO7DjTSsTs2J/WI1CjGpKtSoHYnMyre01gu13VEV7TBFM2StXv768YFY3f6IDR4i
 A2tg==
X-Gm-Message-State: AOAM531ozBhrCvXEtNe2bt/ZwokJv32brPadCsy05u8qIfjOBy2e1CwT
 Bcq16bY9kK1VOOT35HX/Sa8nsIpvCIPYc72rKX4ksQ==
X-Google-Smtp-Source: ABdhPJwUsqUG9omfPZRBuKzMTU7GTZUDR9IE67zfC1xOzCVbBZk7f7Y4Ojlr8LDxK+t3r9OQyAFE+HV1olzp6VhoP2s=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr625907edv.100.1611408926238; 
 Sat, 23 Jan 2021 05:35:26 -0800 (PST)
MIME-Version: 1.0
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <fc35da77-a5c2-08dd-05f2-0ebe781b338c@redhat.com>
 <CAFEAcA8GWMh=Cbrnw4+mzbG7gkHLkeQKXCTGxev6iYu8Q8TkxQ@mail.gmail.com>
 <bd4c2b77-11f5-88aa-ff9b-63f5782e99cd@redhat.com>
In-Reply-To: <bd4c2b77-11f5-88aa-ff9b-63f5782e99cd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2021 13:35:14 +0000
Message-ID: <CAFEAcA_ZtJAQDiGRNeBzcmJ8mvrR-nDVGr=7ECHJmEogY-_T_Q@mail.gmail.com>
Subject: Re: Thread safety of coroutine-sigaltstack
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Jan 2021 at 00:06, Laszlo Ersek <lersek@redhat.com> wrote:
> On 01/22/21 11:14, Peter Maydell wrote:
> > I think (but have not checked) that that means we will build and
> > link the object file into the user-mode binaries if you happen
> > to build them in the same run as system-mode binaries,
>
> I did that, first running
>
>  ./configure \
>     --enable-debug \
>     --target-list==x86_64-softmmu,x86_64-linux-user \
>     --with-coroutine=sigaltstack
>
> Then I checked the "qemu-system-x86_64" and "qemu-x86_64" binaries with
> "nm". Only the former contains "coroutine_init":
>
> 00000000009725e4 t coroutine_init
>
> So I believe the coroutine object file(s) are not even linked into the
> user-mode emulators. (coroutine_init() is a constructor function, so I
> think it would be preserved otherwise, even if it had no explicit caller.)

I think the linker will only pull in a .o file from a static
library (for us, libqemuutil.a) if there's an explicit reference
to a real function that it needs; it won't pull it in merely because
it has a constructor function in it. I can't offhand find an official
docs reference for this, but here's a stack overflow question:
https://stackoverflow.com/questions/6589772/gcc-functions-with-constructor-attribute-are-not-being-linked

You can also touch the coroutine source file and watch the
build system rebuild the usermode binary. If you do a complete build,
then touch util/coroutine-ucontext.c, then do 'make -C builddir qemu-arm'
(or whatever usermode emulator you've configured) then:
 * we build coroutine-ucontext.c into
libqemuutil.a.p/util_coroutine-ucontext.c.o
 * we blow away libqemuutil.a and then run 'ar' to put a lot of .o
   files into it, including libqemuutil.a.p/util_coroutine-ucontext.c.o
 * we do some things with scripts/undefsym.py that aren't important here
 * we re-link qemu-arm with all its directly used objects and also with
   libqemuutil.a

So right now we aren't actually using the coroutine functions, but
if you did put in a call to one in code used by the usermode
emulator then that code would only fail to compile if you
were building the usermode emulators without either the tools
or the system emulators.

thanks
-- PMM

