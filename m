Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9A157A0D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 14:20:16 +0100 (CET)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j18z1-0008Ox-HL
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 08:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j18yC-0007uF-M2
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j18yB-0000fl-9G
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:19:24 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37643)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j18yB-0000fK-2Z
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 08:19:23 -0500
Received: by mail-oi1-x243.google.com with SMTP id q84so9161708oic.4
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 05:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5jEPFD9HPWrfJhFXIwWs+zCONNzkL7FEsU6F1yfMKrk=;
 b=il25U0+ZwdnS60FU3ivI3TlWcsm/6GGbtsqAZlyDE0aUvG2gh8BcPTWm2J9wGlEsol
 KxtA1nnCbQ+wslkGShaSlxIxyAFzawffgY9LATx30iw5gJfiBlm5awoHq0gt8LTz21++
 nb0dOf+m1oZxlDtGma/xUVYeYLauQm7NEYWdrT5sUiDuTmmZHj+HrqraEmni50F86lay
 Ao4yjJc3v1f/LuHIKsY/EjcLjlI7/Gd2dn0opvZ/x7koZdZo23jVTtk+X0+St0PJ2RWi
 Z/SnLcsAU9H571FIsoGULI18UD5DWHaTIPUNlAY16k4h+rOv9yl/FXY9tD7skAQ4EMCA
 eB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5jEPFD9HPWrfJhFXIwWs+zCONNzkL7FEsU6F1yfMKrk=;
 b=aScn9iGTzTcNXW+diL0AZ84uxiZ+CcLZy0xh4z0ksmD5VeY9e2vLBhmuqMbM+suK2t
 I8XG7pdAxLpnctdPApkPOtFhXuSYnTbmgB5smkDw7pgGaPECe2gjqBcw01mZiKK54xjj
 j1fS4Prbas8+IUodhYLaEulR1aWtROcSGqOHfgtWSAVjDn6ETpXmEluSrUyzEArXN2Il
 dqh8wkppt8WRJRfsEWiwobp1JgzicSlMGbwyg5GOsgNL7w4LfbIk6undp1xSQ+OR7qsz
 k9nM0Y9NvTGmQ0/mNCSJIGQH6KHAPf4h/NnULBPhnXq25VBm2Pjjj6LQn7Li+Iv7xHwS
 c41w==
X-Gm-Message-State: APjAAAWlFXvwHBQCvkAOkC8qnVaNw761hZOvBwONkydw8MN7On4K1n7C
 cCZZab2SilhDLW7++9EeXaJAjClkMF/2Tc1JLjUVwA==
X-Google-Smtp-Source: APXvYqxeewqfduFItFCrpHpSE87sqy7wmGa3Cb/A454waZTnCI30l60Ydr7i3C7H371K9x/p/ZMb0MBDDbuWGb31XUQ=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr813348oiy.170.1581340762175; 
 Mon, 10 Feb 2020 05:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20200210120146.17631-1-peter.maydell@linaro.org>
 <875zge3a2b.fsf@zen.linaroharston>
In-Reply-To: <875zge3a2b.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2020 13:19:11 +0000
Message-ID: <CAFEAcA9d4XDaUQLwy4yYyTSz1nzQ49adTv9z4K8e29OsUh_21A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Implement ARMv8.1-VMID16 extension
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Feb 2020 at 12:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The ARMv8.1-VMID16 extension extends the VMID from 8 bits to 16 bits:
> >
> >  * the ID_AA64MMFR1_EL1.VMIDBits field specifies whether the VMID is
> >    8 or 16 bits
> >  * the VMID field in VTTBR_EL2 is extended to 16 bits
> >  * VTCR_EL2.VS lets the guest specify whether to use the full 16 bits,
> >    or use the backwards-compatible 8 bits
> >
> > For QEMU implementing this is trivial:
> >  * we do not track VMIDs in TLB entries, so we never use the VMID
> > field
>
> Not currently but does the VMID allow you to have per-guest page table
> caching? Last time I chatted to rth about potential performance wins we
> discussed how easy it would be to support this in the softmmu now we
> have indirect TLB lookups anyway. Given how much time is currently spent
> expensively re-populating tables we could keep the last couple of id
> tagged tables around for faster switching between sets of tables.

Yeah, in hardware the whole point of the VMID is to have per-guest
caching of VA-to-PA mappings in the TLB so you don't have to blow
them all away when you switch VM (just as ASID does for processes).
The difficulty with QEMU has always been that adding the "and is this
the right VMID/ASID" to the softmmu fastpath code would be expensive,
AIUI. If we ever come up with a clever plan for this it should be
no different if the VMID field is 16 vs 8 bits, though.

thanks
-- PMM

