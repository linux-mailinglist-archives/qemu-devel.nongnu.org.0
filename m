Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642DC17E0F5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 14:19:17 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBIJQ-0001kD-Fv
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 09:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBIIh-0001LS-Ey
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 09:18:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBIIg-0004Ea-6s
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 09:18:31 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33572)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBIIg-0004EJ-1L
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 09:18:30 -0400
Received: by mail-ot1-x342.google.com with SMTP id g15so3374727otr.0
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nx9lYHBwS5N43uajqNSbFD7clsNkZVpLoF7YxBQlceU=;
 b=ssNXrWdxDZdIMisxS7xlJ2S0YdlSpcEq3/vts+mqhWmrXTlWMAbnJ8Zr9cJ6rpG1jm
 rTe+MJt5rUTe0WKS3gYhucrPESdUBhr6seSYmSeojAmiL7I5+FaFpBgcHdaLjoIbETJK
 7d8iuC2MoFIWa2jmB3mDOBLLQKV0ZH83vBthf+qThDxcq+lL1VLj9DPliZGP160fouFn
 5WSW+kz672J+LTkhExEJgjSrjkYIX/UeifnTPInHUeZLQ3q40xpTS706asBigfvjDR4M
 rKeMvvmiMArqSTf730mIo+LxcAVGWqVEQM+aDbEJzTFezFSWIsPmXyAAipAw5lGUGer8
 9bDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nx9lYHBwS5N43uajqNSbFD7clsNkZVpLoF7YxBQlceU=;
 b=J2OWBP7wKWHdTTcJFLIUF4KX60G09WpsfNiARNoRZqqQZsscVkde78l318KHNbEzYD
 ViZvUdn5Z8xvAXZgCYigoNiMNZQlDhTgaSq+G78OeQscL3G0mMONsjovCo4v+7qcIIBz
 bDccQUVWr9zE+NG14BhpmrFf7o9u3iNlF/32tm95jr1U0buHFO+ESTr68pAogIx7/Tg6
 MinHSJyz9bSJ75wDTf65OluggKAWGzo4b5XCYG41labKekZhX3YvAMsm+X+fmQ2bCXBE
 iP85mXaYtSNUDhyq+t1VnFzWQHl8U6e6/ZqSYLi2ObdXuqZbx6GAqkt1KBRj1SumIA/S
 n9zA==
X-Gm-Message-State: ANhLgQ0ichjGLgveHUVymc0jveynOJsKqjjkqkCLUd804PHslhvv6rMN
 9CgvIZwC/8TybK3rn5N6ugxUXjZiU2Sl9oUzwqw6Jw==
X-Google-Smtp-Source: ADFU+vuaWbEaCHPioeUAsud3T6Glso5500OKWjvQthpQ49pt7WByJk6F1kT8xBfboR2FkW+4t/gIG4e0LFil/UpK9Vo=
X-Received: by 2002:a9d:76c9:: with SMTP id p9mr12939784otl.135.1583759909215; 
 Mon, 09 Mar 2020 06:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200309121103.20234-1-philmd@redhat.com>
 <20200309121103.20234-2-philmd@redhat.com>
 <CAFEAcA_OHcfsYueYRpXjihgwEDericqkzGqB1EBqaSULAC1YDw@mail.gmail.com>
 <8e996314-695f-a742-b318-9df5a4f2be1b@vivier.eu>
In-Reply-To: <8e996314-695f-a742-b318-9df5a4f2be1b@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 13:18:18 +0000
Message-ID: <CAFEAcA-sb5hFBuY1U=KrbsZdhNwQq3H__XBDK1nxmYB4hSGz0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpu: Do not reset a vCPU before it is created
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Michael Walle <michael@walle.cc>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Mar 2020 at 13:13, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 09/03/2020 =C3=A0 14:09, Peter Maydell a =C3=A9crit :
> > On Mon, 9 Mar 2020 at 12:11, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com> wrote:
> >>
> >> cpu_reset() might modify architecture-specific fields allocated
> >> by qemu_init_vcpu(). To avoid bugs similar to the one fixed in
> >> commit 00d0f7cb66 when introducing new architectures, move the
> >> cpu_reset() calls after qemu_init_vcpu().
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
> > Why do we need to call cpu_reset() from realize anyway?
> > Generally for devices this is incorrect as they should be
> > being reset by some other mechanism.
>
> I have this same change in my branch for q800 to set the initial PC and
> stack pointer read from memory on cold boot.
>
> Do we have another way to do that?

The expectation at the moment is that the board code should
register a reset function with qemu_register_reset() which
calls cpu_reset(). Relying on doing a reset in realize won't
work for the case where there's a QEMU system reset, because
we don't re-init/realize everything, we just call all the
reset hooks.

If m68k reads pc/sp from memory on reset you'll probably run
into the same reset-ordering vs hw/cpu/loader.c that Arm M-profile
has; we currently work around that in the arm reset function.
I had hoped that 3-phase reset would resolve this reset order
issue, but it has not turned out to be so easy.

thanks
-- PMM

