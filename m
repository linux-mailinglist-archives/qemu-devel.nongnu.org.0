Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BD183C45
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 23:19:52 +0100 (CET)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCWBD-0002Fn-Oq
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 18:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jCW9z-0000pQ-Jv
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 18:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jCW9x-0002gF-D2
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 18:18:34 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:41870)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jCW9x-0002ec-78; Thu, 12 Mar 2020 18:18:33 -0400
Received: by mail-vs1-xe41.google.com with SMTP id k188so4803610vsc.8;
 Thu, 12 Mar 2020 15:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YTsxPebLhJOXvZgqRuXZJBBSNDFAxW3YxtsYuyeObAs=;
 b=YiA/bHdiT7mesIIZfb+iirFJhcFhfSLKIybPQWPf1T9t6BK5iPkyPlcm28DUqA5S9I
 iVTCV4EC3eKpr/RRq+7dwOqlkFgI7L+7rsApiyBxUQwE/4GiFhzPOuuAo9I/nu6BXrSk
 dZzLZt7SD67vJs4PyGco8o4cmDqPCBsCpFTWJXgJGFGuJPjLq78kJ73AyU7+FbU04LEe
 XL4kmbDdvWZAJ31aNYxT4VVmNi8y7lPoUp5e9I744biiNdDqFviLkzhlo7667Rd6O9aS
 4TUl31RDnsoiZDYNQe2YJ+GwYDdIRdNzYDhQU4BvJ0zMTRjrkSA5pXm1KyMgzajZCenO
 cHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YTsxPebLhJOXvZgqRuXZJBBSNDFAxW3YxtsYuyeObAs=;
 b=Zx5hPA7WMD0UNVjJTXgS+h1fTYIYXYy5kaEzAMfC8DfBI1Vewk0xCpj/xBdqw4i+0m
 3WcR68xZAY4aJ8b2F9GpIuXTU6z4+8Lp+MU9zbodkRLYrjioyJeaKkGM4FEXa4J0suNl
 yM8fpOjua4bvpJb+Mj2YOoFUL3WntWGJ32DJ9ryz3x3FhyO6UihfsD4fW6rQklhpmZ/t
 etlNZ8dEY3WQ6wlXBHWgKVfjD9hOrkNaLAYmxU+YcDJ5Qx3Mdj9d1kONs2oPqq+G/IQl
 ISb3otcO5p25cMhSQaX4mtHPi9epWRo5JO4U1R1/IIkP3RcMeG1ujddSWB7MHBHgWncE
 J5kQ==
X-Gm-Message-State: ANhLgQ3ah3MWZZV1ga0ZBc2lxR3nXosnYn9QPf2ncnWACmhQOHx9W4uA
 VpIiRDfP6PYyBgCxqvqaINdxVLcifDu2y4vHI+l8hWQk
X-Google-Smtp-Source: ADFU+vtbO6Q/BerUcDBUWYH0U0RbplLyV39qIKZ89GEDMDCrbfOB8AaWZ292EAEethlK9RTtw3YiZALvVqfI+nicEVU=
X-Received: by 2002:a67:e09a:: with SMTP id f26mr5531613vsl.70.1584051509540; 
 Thu, 12 Mar 2020 15:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <c827880a47774cd3a6bcd59b79657f380da11d5d.1583284602.git.alistair.francis@wdc.com>
 <e8498727-03f8-7e04-efd3-c04763dcbfac@linaro.org>
In-Reply-To: <e8498727-03f8-7e04-efd3-c04763dcbfac@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Mar 2020 15:10:36 -0700
Message-ID: <CAKmqyKOnb+CpnugoUkeL_kabyiCfZCmWyNF9uV5GUBT_pek=0g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Don't set write permissions on dirty
 PTEs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e41
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 4, 2020 at 9:34 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/3/20 5:16 PM, Alistair Francis wrote:
> > The RISC-V spec specifies that when a write happens and the D bit is
> > clear the implementation will set the bit in the PTE. It does not
> > describe that the PTE being dirty means that we should provide write
> > access. This patch removes the write access granted to pages when the
> > dirty bit is set.
>
> The W bit by itself says we should provide write access.
>
> It is an implementation detail that we *withhold* write access when D is clear
> (etc) so that we can trap, so that we can properly set D in the future.
>
> The page table walk associated with a read is allowed to cache all of the
> information it finds in the PTE during that walk.  Which includes the D bit.
> If D is set, then we do not need to set it in future, so we do not need to
> trap, so we can immediately honor the W bit.

Ok, I understand what is going on here now. I agree that my patch is wrong.

>
> If the guest changes R/W/X within a PTE (e.g. for mprotect), it is obvious that
> a TLB flush for that page must be done.  It is no different if the guest
> changes A/D (e.g. for swapping).

Agreed.

>
> > Setting write permission on dirty PTEs results in userspace inside a
> > Hypervisor guest (VU) becoming corrupted. This appears to be because it
> > ends up with write permission in the second stage translation in cases
> > where we aren't doing a store.
>
> You've not really given any more information than last time this patch came around.
>
> I still think this must be a guest (or nested guest) bug related to clearing
> PTE bits and failing to flush the TLB properly.

It think so as well now. I have changed the Linux guest and Hypervisor
to be very aggressive with flushing but still can't get guest user
space working. I'll keep digging and see if I can figure out what's
going on.

>
> I don't see how it could be a qemu tlb flushing bug.  The only primitive,
> sfence.vma, is quite heavy-handed and explicitly local to the thread.

Yes, both sfence and hfence flush all TLBs, so that doesn't seem to be
the problem.

>
> It may be a bug in qemu's implementation of second stage paging.  Which is not
> yet upstream, and I haven't gone digging in the archives to find the patch.

It's upstream now, I have double checked it though and I can't see
anything wrong.

Alistair

>
>
> r~

