Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979B32036A
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 04:07:44 +0100 (CET)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDIcR-00022Q-4M
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 22:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDIbF-0000t0-8O
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 22:06:29 -0500
Received: from relay68.bu.edu ([128.197.228.73]:38118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDIbD-0007WY-66
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 22:06:28 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 11K35Nlk022855
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Feb 2021 22:05:26 -0500
Date: Fri, 19 Feb 2021 22:05:23 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Li Qiang <liq3ea@gmail.com>
Subject: Re: [PATCH] net: eepro100: validate various address values
Message-ID: <20210220030523.udksvp25u63apc2n@mozz.bu.edu>
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
 <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
 <CAKXe6SKrU_2zgw5YtcNw9uXd2gHFTSsLkDHyqqg=Z2uZj+e2AA@mail.gmail.com>
 <20210219021440.ub4qh3cnyv4cgswy@mozz.bu.edu>
 <CAKXe6SJ1UTKYZMKVrhiqs6Pno-0ehMU_9Zjg9dGs+jR_2VMMxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKXe6SJ1UTKYZMKVrhiqs6Pno-0ehMU_9Zjg9dGs+jR_2VMMxw@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Prasad J Pandit <pjp@fedoraproject.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>, Ruhr-University Bochum <bugs-syssec@rub.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210219 1243, Li Qiang wrote:
> Alexander Bulekov <alxndr@bu.edu> 于2021年2月19日周五 上午10:15写道：
> >
> > On 210219 1006, Li Qiang wrote:
> > > Alexander Bulekov <alxndr@bu.edu> 于2021年2月19日周五 上午9:56写道：
> > > >
> > > > On 210218 1441, Peter Maydell wrote:
> > > > > On Thu, 18 Feb 2021 at 14:13, P J P <ppandit@redhat.com> wrote:
> > > > > >
> > > > > > From: Prasad J Pandit <pjp@fedoraproject.org>
> > > > > >
> > > > > > While processing controller commands, eepro100 emulator gets
> > > > > > command unit(CU) base address OR receive unit (RU) base address
> > > > > > OR command block (CB) address from guest. If these values are not
> > > > > > checked, it may lead to an infinite loop kind of issues. Add checks
> > > > > > to avoid it.
> > >
> > >
> > > So could you please provide a backtrack?
> > >
> >
> > I don't know if you are asking me or Prasad, but here is the stacktrace
> 
> 
> Yes, a typical DMA reentry issue.
> Any progress to solve these DMA reentry issues? seems more and more
> this kind of issues.

Unfortuantely, I don't think there's a solution yet.

> Just return from the busy things as a new father and not focus this
> quite a time.

Congrats!

> 
> Thanks,
> Li Qiang
> 
> > for the one I provided:
> > ==2715275==ERROR: AddressSanitizer: stack-overflow on address
> > 0x7ffc5262ba28 (pc 0x55d83b103ac6 bp 0x7ffc5262c270 sp 0x7ffc5262ba30
> > T0)
> > #0 in __asan_memcpy (qemu-system-i386+0x2aa3ac6)
> > #1 in flatview_do_translate ../softmmu/physmem.c:518:12
> > #2 in flatview_translate ../softmmu/physmem.c:568:15
> > #3 in flatview_read ../softmmu/physmem.c:2878:10
> > #4 in address_space_read_full ../softmmu/physmem.c:2892:18
> > #5 in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
> > #6 in dma_memory_rw include/sysemu/dma.h:127:12
> > #7 in pci_dma_rw include/hw/pci/pci.h:803:12
> > #8 in pci_dma_read include/hw/pci/pci.h:821:12
> > #9 in read_cb ../hw/net/eepro100.c:726:5
> > #10 in action_command ../hw/net/eepro100.c:847:9
> > #11 in eepro100_cu_command ../hw/net/eepro100.c:969:13
> > #12 in eepro100_write_command ../hw/net/eepro100.c:1063:5
> > #13 in eepro100_write2 ../hw/net/eepro100.c:1510:9
> > #14 in eepro100_write ../hw/net/eepro100.c:1593:9
> > #15 in memory_region_write_accessor ../softmmu/memory.c:491:5
> > #16 in access_with_adjusted_size ../softmmu/memory.c:552:18
> > #17 in memory_region_dispatch_write ../softmmu/memory.c
> > #18 in flatview_write_continue ../softmmu/physmem.c:2776:23
> > #19 in flatview_write ../softmmu/physmem.c:2816:14
> > #20 in address_space_write ../softmmu/physmem.c:2908:18
> > #21 in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
> > #22 in dma_memory_rw include/sysemu/dma.h:127:12
> > #23 in dma_memory_write include/sysemu/dma.h:163:12
> > #24 in stw_le_dma include/sysemu/dma.h:259:1
> > #25 in stw_le_pci_dma include/hw/pci/pci.h:855:1
> > #26 in action_command ../hw/net/eepro100.c:913:9
> > #27 in eepro100_cu_command ../hw/net/eepro100.c:969:13
> > #28 in eepro100_write_command ../hw/net/eepro100.c:1063:5
> > #29 in eepro100_write2 ../hw/net/eepro100.c:1510:9
> > #30 in eepro100_write ../hw/net/eepro100.c:1593:9
> > ... till there's no more stack ...
> >
> > >
> > > Thanks,
> > > Li Qiang
> > >
> > > > > >
> > > > > > Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> > > > > > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > > > > > ---
> > > > > >  hw/net/eepro100.c | 8 +++++++-
> > > > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> > > > > > index 16e95ef9cc..afa1c9b2aa 100644
> > > > > > --- a/hw/net/eepro100.c
> > > > > > +++ b/hw/net/eepro100.c
> > > > > > @@ -843,7 +843,8 @@ static void action_command(EEPRO100State *s)
> > > > > >          bool bit_i;
> > > > > >          bool bit_nc;
> > > > > >          uint16_t ok_status = STATUS_OK;
> > > > > > -        s->cb_address = s->cu_base + s->cu_offset;
> > > > > > +        s->cb_address = s->cu_base + s->cu_offset;  /* uint32_t overflow */
> > > > > > +        assert (s->cb_address >= s->cu_base);
> > > > >
> > > > > We get these values from the guest; you can't just assert() on them.
> > > > > You need to do something else.
> > > > >
> > > > > My reading of the 8255x data sheet is that there is nothing
> > > > > in the hardware that forbids the guest from programming the
> > > > > device such that the cu_base + cu_offset wraps around:
> > > > > http://www.intel.com/content/dam/doc/manual/8255x-10-100-mbps-ethernet-controller-software-dev-manual.pdf
> > > > > -- page 30 says that this is all doing 32-bit arithmetic
> > > > > on addresses and doesn't say that there is any special case
> > > > > handling by the device of overflow of that addition.
> > > > >
> > > > > Your commit message isn't very clear about what the failure
> > > > > case is here, but I think the fix has to be something
> > > > > different from this.
> > > >
> > > > Maybe the infinite loop mentioned in the commit message is actually a
> > > > DMA recursion issue? I'm providing a reproducer for a DMA re-entracy
> > > > issue below. With this patch applied, the reproducer triggers the
> > > > assert(), rather than overflowing the stack, so maybe it is the same
> > > > issue?
> > > > -Alex
> > > >
> > > > cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
> > > > 512M -device i82559er,netdev=net0 -netdev user,id=net0 -nodefaults \
> > > > -qtest stdio
> > > > outl 0xcf8 0x80001014
> > > > outl 0xcfc 0xc000
> > > > outl 0xcf8 0x80001010
> > > > outl 0xcfc 0xe0020000
> > > > outl 0xcf8 0x80001004
> > > > outw 0xcfc 0x7
> > > > write 0x1ffffc0b 0x1 0x55
> > > > write 0x1ffffc0c 0x1 0xfc
> > > > write 0x1ffffc0d 0x1 0x46
> > > > write 0x1ffffc0e 0x1 0x07
> > > > write 0x746fc59 0x1 0x02
> > > > write 0x746fc5b 0x1 0x02
> > > > write 0x746fc5c 0x1 0xe0
> > > > write 0x4 0x1 0x07
> > > > write 0x5 0x1 0xfc
> > > > write 0x6 0x1 0xff
> > > > write 0x7 0x1 0x1f
> > > > outw 0xc002 0x20
> > > > EOF
> > > >
> > > > Formatted for committing a regression-test:
> > > >
> > > > static void test_fuzz(void)
> > > > {
> > > >     QTestState *s =
> > > >         qtest_init("-display none , -m 512M -device i82559er,netdev=net0 "
> > > >                    "-netdev user,id=net0 -nodefaults");
> > > >     qtest_outl(s, 0xcf8, 0x80001014);
> > > >     qtest_outl(s, 0xcfc, 0xc000);
> > > >     qtest_outl(s, 0xcf8, 0x80001010);
> > > >     qtest_outl(s, 0xcfc, 0xe0020000);
> > > >     qtest_outl(s, 0xcf8, 0x80001004);
> > > >     qtest_outw(s, 0xcfc, 0x7);
> > > >     qtest_bufwrite(s, 0x1ffffc0b, "\x55", 0x1);
> > > >     qtest_bufwrite(s, 0x1ffffc0c, "\xfc", 0x1);
> > > >     qtest_bufwrite(s, 0x1ffffc0d, "\x46", 0x1);
> > > >     qtest_bufwrite(s, 0x1ffffc0e, "\x07", 0x1);
> > > >     qtest_bufwrite(s, 0x746fc59, "\x02", 0x1);
> > > >     qtest_bufwrite(s, 0x746fc5b, "\x02", 0x1);
> > > >     qtest_bufwrite(s, 0x746fc5c, "\xe0", 0x1);
> > > >     qtest_bufwrite(s, 0x4, "\x07", 0x1);
> > > >     qtest_bufwrite(s, 0x5, "\xfc", 0x1);
> > > >     qtest_bufwrite(s, 0x6, "\xff", 0x1);
> > > >     qtest_bufwrite(s, 0x7, "\x1f", 0x1);
> > > >     qtest_outw(s, 0xc002, 0x20);
> > > >     qtest_quit(s);
> > > > }
> > > >
> > > >
> > > > >
> > > > > thanks
> > > > > -- PMM
> > > > >
> > > >

