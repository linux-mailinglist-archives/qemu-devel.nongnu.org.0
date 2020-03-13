Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F5184A76
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 16:20:38 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCm74-0006gB-1U
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 11:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCm67-00069J-CD
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 11:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCm66-0002Oe-5H
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 11:19:39 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45369)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCm65-0002Mw-TX
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 11:19:38 -0400
Received: by mail-ot1-x341.google.com with SMTP id e9so3242534otr.12
 for <qemu-devel@nongnu.org>; Fri, 13 Mar 2020 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1NBaMBE5E/M3P6A7fKEAnS9p8dyD+5TDDACVFx4oZl8=;
 b=kI3mZ0WI9RwDQUGg8MvbCRGr7Whb03ziCKpitsb9cVzQwvV0OTOKDAQsoI0dAOIjlQ
 fe4L01Y5FiOrP54x38FmNuLt9c6q7YPGU4LnsWcHoYNWzmsk7ZOjjM3SSG1TtE3luqfR
 2EqcyeAtcBn/1oR33J2L8UtY0ttp/ytt9vV4jGAFQ/YbJKjbspg4hgXGCyaetrhZIo9j
 wCc6X0R+E9g0FGJCKpK3FbhOAEuOMtcluvxI7tb5UM0OvRDQLi517bIbWJJyOrtdFfH2
 uuObdlVoractHF2HfHsTdYv8UcA4vyX2iLYHSIfCNlm3jdo0dbp6gPhaxwV/iccaeLxd
 wd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1NBaMBE5E/M3P6A7fKEAnS9p8dyD+5TDDACVFx4oZl8=;
 b=q7/ZG51bjRtSVyI2qsDTyo2dg/dFViYD5rzuz+pjfz3/xtaZywvghwcyMvk4XVjncO
 TLjfMJ2tCey139/3wXefnDC8p/oLRJSgugcs+luA1kWaOnRRYBYP9bS20a8hLELAC/8u
 aRLPsi1XXlI49pbXeHxLiY+9BkBtTtql6TwVLbl41cget5jLxItsAUUj07PLsbRrewlD
 XJwPeJR5BN9JC6hAYc6+YyT73Sgs3WQfyR33USgxLBJh/v21GEi9/LWOvwuSgvrmALsd
 9oN49r62gg9C5OTfQUEoB4nglrkhSAw+9kYNVrfy2Ex0od0ykr7F8GsLPaiRKYPSaQB+
 2boA==
X-Gm-Message-State: ANhLgQ32PJu2eLtk7eC1BemO3aZRlIQ8amnG2WdUrGQej3WCbtxBB5HN
 s+ErXocVYj0de7ZZrcw2xGiWODaZAYHLmMH/kF4y1CY0J+w=
X-Google-Smtp-Source: ADFU+vszq1F9vUUE+9GmKp2mXcSYw6IQUTYsOGEUubhV3QICPHbV1PMM8M+HN6SaxWMXeurEDfkZz1S2ggs2XtXeDoM=
X-Received: by 2002:a05:6830:19e2:: with SMTP id
 t2mr10890370ott.97.1584112776806; 
 Fri, 13 Mar 2020 08:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <2159383.tmy0LfLZHX@basile.remlab.net>
 <CAFEAcA_nGY4_UQ7jMdxuZXR=_rpVZVCAMX+UzEoFtSpcCVy9Dg@mail.gmail.com>
 <3125680.9OkiO6kEAj@basile.remlab.net>
In-Reply-To: <3125680.9OkiO6kEAj@basile.remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 15:19:25 +0000
Message-ID: <CAFEAcA9L9qWdb9Qk4N00cEOOxAc056VVgMZW6jn-+1hDh3PhsQ@mail.gmail.com>
Subject: Re: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Mar 2020 at 15:17, R=C3=A9mi Denis-Courmont <remi@remlab.net> wr=
ote:
> It does not. I don't know about that seriers. The patches are part of the
> patchset that lead to my PAuth fixes a year ago. At that time, only beta =
spec
> was available, including obvious bugs (sysregs with duplicate opcodes),
> suspicious things (TCO being EL3) and generally being a beta. I thus sat =
on
> that part of the work until I now got time to rebase, clean and update to=
 the
> released spec.

Ah, I see.

> Meanwhile if there's a high-profile developer working on the same thing, =
I
> guess there's no point for me to carry on.

It does sound like Richard's implementation is further advanced.
If you're interested in testing or even reviewing Richard's
patchset that would definitely be appreciated.

thanks
-- PMM

