Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4888B2CA5E2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:39:41 +0100 (CET)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6oe-0005Oa-AG
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:39:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6no-0004aq-Dz
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:38:48 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk6nm-0005vc-O7
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:38:48 -0500
Received: by mail-ed1-x542.google.com with SMTP id b2so3503867edy.13
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsC6GsVJiLqPrUOX64utpZZU09t0XnUAVIJF2SWD/30=;
 b=kQtQbycmM6skcs5hwocRzk67vRxHCFlrEIUIU7j9gDs1wbckGjRGYVQHYl0TSMfxbg
 dwFHns3fmFa/cinCLTY9K2n/ABouMEQLBi+U4tO6wodXvQrEoLnQETJ3nWCrf2Dm7be4
 zwcp/k1icSGeEUPUhxqrEjRQKgxCmQVLkNDopSH7QbdzbOtWGMRwNPtoX68bh7sKOfrx
 lXD8/WSQFX8fXCRiyuDy5sUQ0ujCO4bxALbA7u46aphmlsXZvxdCSmiw1Wj/tbkhWplF
 KzmvsPCulcO+OtxsjXKfWdCnIKktdXC4TaLR0VXijxwBYmjnQGHuhWdcJ+JNGpxBKXfT
 a2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsC6GsVJiLqPrUOX64utpZZU09t0XnUAVIJF2SWD/30=;
 b=GzeCCAmWnCq979ZozpVV9kt/xWBxEQ75rxNq4Uqs48eMi2zRILcB8WN1riFFuu6JE8
 SQm7Ut/x2zCLXM91bHYRY5I1nhpZMYLS4UtleRnUWsFdMahyQPkOZg0796UPHwyWSBnu
 lFYHjS0auxc9+wWlssbRjP8lK7gr/Iu9RVBNztzONdEwKv3y99+3amVbPRxUFMZO4SG8
 K87R4pmkp1BdRjDOtJzKj/r9or1LdfJqh95LUkxRedtPJaK1GLOLoTKo5jjuBXk2NjL6
 yZNUmR9Pof8yeJRLnNyRBxFh8D8NHdNFG45/oGhwr+XhhZs/0u8ecSj/esHGYbLTMhw1
 HmXQ==
X-Gm-Message-State: AOAM533Lej3wRmm5AOInThrDh+bvrFmpjuu4SYKMsMdWZq9UT1eO1Ell
 Sn0e+tmJ+kK5AGBo4CM4nmGyy4uU6VNbYIw3HDaeBg==
X-Google-Smtp-Source: ABdhPJxMPQW7LJJS5pyVRbNSjcgs0+GsYDaPb/F2cn4/AJTkdE74agN/ofoQh/dGFF7x4uym2StOA7vl7Zijl+TAdow=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr3356535edb.100.1606833521805; 
 Tue, 01 Dec 2020 06:38:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <4393d426ae8f070c6be45ff0252bae2dca8bbd42.1605316268.git.ashish.kalra@amd.com>
 <CAFEAcA8=3ngeErUEaR-=qGQymKv5JSd-ZXz+hg7L46J_nWDUnQ@mail.gmail.com>
 <20201201142756.GA27617@ashkalra_ubuntu_server>
In-Reply-To: <20201201142756.GA27617@ashkalra_ubuntu_server>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 14:38:30 +0000
Message-ID: <CAFEAcA8tJ7NZ1xVeZUhxYYTpjiZ7GJzDtcUPBWVO5C8cgLURVw@mail.gmail.com>
Subject: Re: [PATCH 02/11] exec: Add new MemoryDebugOps.
To: Ashish Kalra <ashish.kalra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, ssg.sos.patches@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 14:28, Ashish Kalra <ashish.kalra@amd.com> wrote:
> On Tue, Dec 01, 2020 at 11:48:23AM +0000, Peter Maydell wrote:
> > This seems like a weird place to insert these hooks. Not
> > all debug related accesses are going to go via
> > cpu_memory_rw_debug(). For instance when the gdb stub is in
> > "PhyMemMode" and all addresses from the debugger are treated as
> > physical rather than virtual, gdbstub.c will call
> > cpu_physical_memory_write()/_read().
> >
> > I would have expected the "oh, this is a debug access, do
> > something special" to be at a lower level, so that any
> > address_space_* access to the guest memory with the debug
> > attribute gets the magic treatment, whether that was done
> > as a direct "read this physaddr" or via cpu_memory_rw_debug()
> > doing the virt-to-phys conversion first.
> >
>
> Actually, the earlier patch-set used to do this at a lower level,
> i.e., at the address_space level, but then Paolo's feedback on that
> was that we don't want to add debug specific hooks into generic code
> such as address_space_* interfaces, hence, these hooks are introduced at
> a higher level so that we can do this "debug" abstraction at
> cpu_memory_rw_debug() and adding new interfaces for physical memory
> read/write debugging such as cpu_physical_memory_rw_debug().

This seems to be mixing two separate designs, then. Either
you want to try to provide separate "debug" functions like this,
or you want to have a MemTxAttrs "debug" attribute, but you don't
need both. Personally I prefer the MemTxAttrs approach (and disagree
with Paolo :-)), because otherwise you're going to end up duplicating
a lot of functions, and the handling of "this memory is encrypted
and needs special handling" ends up being dealt with in various
layers of the code rather than being only in one place where the
lowest layer says "oh, debug access to encrypted memory, this is
how to do that".

> This seems logical too as cpu_memory_rw_debug() is invoked via the
> debugger, i.e., either gdbstub or qemu monitor, so this interface seems
> to be the right place to add these hooks.

Except that as noted, although all uses of cpu_memory_rw_debug()
are debug related, not all debug related accesses are to
cpu_memory_rw_debug()... The interesting characteristics of
cpu_memory_rw_debug() are (1) it takes a virtual address rather
than physical (2) it writes to ROMs (3) it refuses to write to
devices.

thanks
-- PMM

