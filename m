Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB7931FD13
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 17:26:21 +0100 (CET)
Received: from localhost ([::1]:48428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD8bk-0007Ml-21
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 11:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lD8Ol-00058H-1F
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:12:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lD8Oi-00066M-Pv
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 11:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613751171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrtjwmB8HeHrmVVCGuf9HSULhddXDqYFM7daXgBBFQ0=;
 b=Ck1208zvA5E7af6+kCQZlNTCcQirJ4A1cO5ro8jy0Uf2Fkt4nXsp0iQgDYyDO/17mp/Tra
 KOhHC8dK/M6RGISj+e0EqEnO8Nj9m87xo3Cp9UXeozj/cpyRacDX+5LicZSY2n0ZEK+fFd
 ARE30DC6CRTV+vGDLUD8vAPRBq5xhPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-ViBBye6iMcGBnsDgHwuWxA-1; Fri, 19 Feb 2021 11:12:47 -0500
X-MC-Unique: ViBBye6iMcGBnsDgHwuWxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 333F9801965;
 Fri, 19 Feb 2021 16:12:45 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8F013470;
 Fri, 19 Feb 2021 16:12:44 +0000 (UTC)
Date: Fri, 19 Feb 2021 16:12:43 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PULL 00/19] riscv-to-apply queue
Message-ID: <20210219161243.GP30079@redhat.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
 <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
 <CAEUhbmXeYDkKiNnkffRoE8dZc_=-vByoQfr6gdSSUNubkCaB8Q@mail.gmail.com>
 <CAFEAcA8BwTO7OT91B=d1tZrk9+PMiSLTmKtiv_Yd2BNdb1syRQ@mail.gmail.com>
 <2bd4745b-03f2-220c-619f-2298d99038cc@amsat.org>
MIME-Version: 1.0
In-Reply-To: <2bd4745b-03f2-220c-619f-2298d99038cc@amsat.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 02:31:20PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> [+John/Richards/Paolo/Gueunter]
> 
> On 2/18/21 3:22 PM, Peter Maydell wrote:
> > On Thu, 18 Feb 2021 at 14:07, Bin Meng <bmeng.cn@gmail.com> wrote:
> >> On Thu, Feb 18, 2021 at 9:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >>> Fails to compile, 32 bit hosts:
> >>>
> >>> ../../hw/riscv/virt.c: In function 'virt_machine_init':
> >>> ../../hw/riscv/virt.c:621:43: error: comparison is always false due to
> >>> limited range of data type [-Werror=type-limits]
> >>>          if ((uint64_t)(machine->ram_size) > 10 * GiB) {
> >>>                                            ^
> >>> ../../hw/riscv/virt.c:623:33: error: large integer implicitly
> >>> truncated to unsigned type [-Werror=overflow]
> >>>              machine->ram_size = 10 * GiB;
> >>>                                  ^~
> >>
> >> This kind of error is tricky. I wonder whether we should deprecate
> >> 32-bit host support though.
> > 
> > 32-bit host is still not uncommon outside the x86 world...
> > 
> > The thing that makes this particular check awkward is that
> > machine->ram_size is a ram_addr_t, whose size is 64 bits if
> > either (a) the host is 64 bits or (b) CONFIG_XEN_BACKEND is
> > enabled, so it's effectively only 32-bits on 32-bit-not-x86.
> > 
> > It might be a good idea if we decided that we would just make
> > ram_addr_t 64-bits everywhere, to avoid this kind of "we
> > have an unusual config only on some more-obscure hosts" issue.
> > (We did that for hwaddr back in commit 4be403c8158e1 in 2012,
> > when it was still called target_phys_addr_t.) This change
> > would probably be a performance hit for 32-bit-non-x86 hosts;
> > it would be interesting to see whether it was measurably
> > significant.
> 
> You once explained me we have 'hwaddr' (physical address)
> of 64-bit because we can 64-bit buses on 32-bit targets.
> hwaddr is available in all emulation modes.
> 
> ram_addr_t is restricted to system emulation. I understand
> it as the limit addressable by a CPU.
> 
> Back to your comment, we only have 32-bit ram_addr_t on
> system-emulation on 32-bit (non-x86) hosts.
> 
> Question I asked yesterday on IRC, do you know if there
> is still interest in having system-emulation on 32-bit
> hosts?

For _Fedora_ we don't care about 32 bit at all.

For the broader ecosystem I have no idea, but it's worth mentioning
that all the RV32 systems so far have been embedded-type systems, many
lacking even virtual memory (so they don't run Linux), and with so
little RAM that virtualization is hardly possible.

At this point I'm sure someone will point to a huge RV32 system that I
didn't know about :-)

Rich.

> It is important to keep user-mode emulation on 32-bit hosts,
> but I doubt there are many uses of system-emulation on them
> (even less non non-x86 archs).
> 
> Regards,
> 
> Phil.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


