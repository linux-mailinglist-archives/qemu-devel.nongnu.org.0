Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAC1428E16
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:36:10 +0200 (CEST)
Received: from localhost ([::1]:47020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvTO-0007qu-2R
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZvRl-0006f4-GL
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:34:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mZvRi-0003iW-BI
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633959265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4p6Taqyg83RjDP+tp7Wb8ZY1fFS7/SAvpAN2FyXNpts=;
 b=J4gFpD0AmLjyTUfPZ7ZWrnWpA9zyce4gOmf/0kg8SJ9M8qAcvBgVq+Vxw7SUeHHPyNAeqg
 dnTj7wbq6qIQ6287xV5rS+Ln4bHFaBSq43+UeHtzBnneolINnoQZ6lWqhxBbawVL2O8R0d
 YsNf6Py9Jvik1sKgR9QB2kABPXBYhUY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Oj41_9DJMayOtISdxeK0Lw-1; Mon, 11 Oct 2021 09:34:23 -0400
X-MC-Unique: Oj41_9DJMayOtISdxeK0Lw-1
Received: by mail-ed1-f69.google.com with SMTP id
 p13-20020a056402044d00b003db3256e4f2so15993112edw.3
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4p6Taqyg83RjDP+tp7Wb8ZY1fFS7/SAvpAN2FyXNpts=;
 b=3rh1ZuFofYj95EXPv+MdxNZWMvLJF4a2FUreh4XPpz8CYgnSc0eun0XGFbUyh5iLg+
 /XszRD892qA4x3Mvm0QkBP7w4l8hHhCrk0Dp8z8RiVGVBd8TIbrwEaNMfFz3GYu+d9Nk
 enqfO46KcxINWAZHzJwpgI97TkP7ImiVwSywTynHzLJH+JbISOBA9UnI8G2fpKr0loM5
 kRzjfFIq7DJ7WkPdq4FWsI1KPKb8D9cMW57O9pcH02Zpejbid0Wouj36xV3XeCDjVC3u
 qoqAoMFQqvqo0A4PInQszw1M57WJuNlwDvuV+3hGsjQhvPftz2AuIOa5AlLOlr2CYbXu
 laEw==
X-Gm-Message-State: AOAM533Be8dU0QHkxIcxlP7f88M4grW/zyT73HIU7/j6G5P92CK4v5+h
 Mfg/ywUKCepZLHGgs9ee5zGXOn4kZcLMWdHAk360il2HweyQSFh8MxbJNePAYJ+qdsJpw6oPr5b
 o/EZIIWJ+peE9/AQ=
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr25028262ejd.268.1633959262413; 
 Mon, 11 Oct 2021 06:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFiGt6iJek9QKZsVSSGmhA8UwuPj5E65hbSr/ZZNQvCG31H4Hy83SzRNwBRy8hCeAElnW5+Q==
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr25028232ejd.268.1633959262149; 
 Mon, 11 Oct 2021 06:34:22 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id o15sm3525763ejj.10.2021.10.11.06.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:34:21 -0700 (PDT)
Date: Mon, 11 Oct 2021 09:34:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: ACPI endianness
Message-ID: <20211011093206-mutt-send-email-mst@kernel.org>
References: <957db5ec-fc70-418-44d9-da4f81f5b98@eik.bme.hu>
 <612d2f0b-f312-073d-b796-c76357ba51a2@redhat.com>
 <d8284c4-c2e7-15e9-bec5-b2f619e1e6ad@eik.bme.hu>
 <20211011080528-mutt-send-email-mst@kernel.org>
 <327dd794-f698-3187-c17d-80b33db664b@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <327dd794-f698-3187-c17d-80b33db664b@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 03:27:44PM +0200, BALATON Zoltan wrote:
> On Mon, 11 Oct 2021, Michael S. Tsirkin wrote:
> > On Mon, Oct 11, 2021 at 12:13:55PM +0200, BALATON Zoltan wrote:
> > > On Mon, 11 Oct 2021, Philippe Mathieu-Daudé wrote:
> > > > On 10/10/21 15:24, BALATON Zoltan wrote:
> > > > > Hello,
> > > > > 
> > > > > I'm trying to fix shutdown and reboot on pegasos2 which uses ACPI as
> > > > > part of the VIA VT8231 (similar to and modelled in hw/isa/vt82c686b.c)
> > > > > and found that the guest writes to ACPI PM1aCNT register come out with
> > > > > wrong endianness but not shure why. I have this:
> > > > > 
> > > > > $ qemu-system-ppc -M pegasos2 -monitor stdio
> > > > > (qemu) info mtree
> > > > > [...]
> > > > > memory-region: pci1-io
> > > > >   0000000000000000-000000000000ffff (prio 0, i/o): pci1-io
> > > > > [...]
> > > > >     0000000000000f00-0000000000000f7f (prio 0, i/o): via-pm
> > > > >       0000000000000f00-0000000000000f03 (prio 0, i/o): acpi-evt
> > > > >       0000000000000f04-0000000000000f05 (prio 0, i/o): acpi-cnt
> > > > >       0000000000000f08-0000000000000f0b (prio 0, i/o): acpi-tmr
> > > > > 
> > > > > memory-region: system
> > > > >   0000000000000000-ffffffffffffffff (prio 0, i/o): system
> > > > >     0000000000000000-000000001fffffff (prio 0, ram): pegasos2.ram
> > > > >     0000000080000000-00000000bfffffff (prio 0, i/o): alias pci1-mem0-win
> > > > > @pci1-mem 0000000080000000-00000000bfffffff
> > > > >     00000000c0000000-00000000dfffffff (prio 0, i/o): alias pci0-mem0-win
> > > > > @pci0-mem 00000000c0000000-00000000dfffffff
> > > > >     00000000f1000000-00000000f100ffff (prio 0, i/o): mv64361
> > > > >     00000000f8000000-00000000f8ffffff (prio 0, i/o): alias pci0-io-win
> > > > > @pci0-io 0000000000000000-0000000000ffffff
> > > > >     00000000f9000000-00000000f9ffffff (prio 0, i/o): alias pci0-mem1-win
> > > > > @pci0-mem 0000000000000000-0000000000ffffff
> > > > >     00000000fd000000-00000000fdffffff (prio 0, i/o): alias pci1-mem1-win
> > > > > @pci1-mem 0000000000000000-0000000000ffffff
> > > > >     00000000fe000000-00000000feffffff (prio 0, i/o): alias pci1-io-win
> > > > > @pci1-io 0000000000000000-0000000000ffffff
> > > > >     00000000ff800000-00000000ffffffff (prio 0, i/o): alias pci1-mem3-win
> > > > > @pci1-mem 00000000ff800000-00000000ffffffff
> > > > >     00000000fff00000-00000000fff7ffff (prio 0, rom): pegasos2.rom
> > > > > 
> > > > > The guest (which is big endian PPC and I think wotks on real hardware)
> > > > > writes to 0xf05 in the io region which should be the high byte of the
> > > > > little endian register but in the acpi code it comes out wrong, instead
> > > > > of 0x2800 I get in acpi_pm1_cnt_write: val=0x28
> > > > 
> > > > Looks like a northbridge issue (MV64340).
> > > > Does Pegasos2 enables bus swapping?
> > > > See hw/pci-host/mv64361.c:585:
> > > > 
> > > > static void warn_swap_bit(uint64_t val)
> > > > {
> > > >    if ((val & 0x3000000ULL) >> 24 != 1) {
> > > >        qemu_log_mask(LOG_UNIMP, "%s: Data swap not implemented", __func__);
> > > >    }
> > > > }
> > > 
> > > No, guests don't use this feature just byteswap themselves and write little
> > > endian values to the mapped io region. (Or in this case just write one byte
> > > of the 16 bit value, it specifically writes 0x28 to 0xf05.) That's why I
> > > think the device model should not byteswap itself so the acpi regions should
> > > be declared native endian and let the guest handle it. Some mentions I've
> > > found say that native endian means don't byteswap, little endian means
> > > byteswap if vcpu is big endian and big endian means byteswap if vcpu is
> > > little endian. Since guests already account for this and write little endian
> > > values to these regions there's no need to byteswap in device model and
> > > changing to native endian should not affect little endian machines so unless
> > > there's a better argument I'll try sending a patch.
> > > 
> > > Regards,
> > > BALATON Zoltan
> > 
> > native endian means endian-ness is open-coded in the device handler
> > itself.  I think you just found a bug in memory core.
> > 
> > static const MemoryRegionOps acpi_pm_cnt_ops = {
> >    .read = acpi_pm_cnt_read,
> >    .write = acpi_pm_cnt_write,
> >    .impl.min_access_size = 2,
> >    .valid.min_access_size = 1,
> >    .valid.max_access_size = 2,
> >    .endianness = DEVICE_LITTLE_ENDIAN,
> > };
> > 
> > 
> > Because of that     .impl.min_access_size = 2,
> > the 1 byte write should be converted to a 2 byte
> > read+2 byte write.
> > 
> > docs/devel/memory.rst just says:
> > - .impl.min_access_size, .impl.max_access_size define the access sizes
> >  (in bytes) supported by the *implementation*; other access sizes will be
> >  emulated using the ones available.  For example a 4-byte write will be
> >  emulated using four 1-byte writes, if .impl.max_access_size = 1.
> > 
> > 
> > 
> > Instead what we have is:
> > 
> > MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
> >                                         hwaddr addr,
> >                                         uint64_t data,
> >                                         MemOp op,
> >                                         MemTxAttrs attrs)
> > {
> >    unsigned size = memop_size(op);
> > 
> >    if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
> >        unassigned_mem_write(mr, addr, data, size);
> >        return MEMTX_DECODE_ERROR;
> >    }
> > 
> >    adjust_endianness(mr, &data, op);
> > 
> > 
> > ---
> > 
> > 
> > static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
> > {
> >    if ((op & MO_BSWAP) != devend_memop(mr->ops->endianness)) {
> >        switch (op & MO_SIZE) {
> >        case MO_8:
> >            break;
> >        case MO_16:
> >            *data = bswap16(*data);
> >            break;
> >        case MO_32:
> >            *data = bswap32(*data);
> >            break;
> >        case MO_64:
> >            *data = bswap64(*data);
> >            break;
> >        default:
> >            g_assert_not_reached();
> >        }
> >    }
> > }
> > 
> > so the byte swap is based on size before extending it to
> > .impl.min_access_size, not after.
> 
> OK thanks for the analysis, I'll wait what comes out of this.
> 
> > Also, no read happens which I suspect is also a bug,
> > but could be harmless ...
> 
> I did not check if a read happens or not but generally I think that may be
> another source of bugs if the memory core changes writes to read + write
> because for some devices a read might have side effects


IMHO if reads have side effects then devices should not set .impl.min_access_size
... but given we did not previously do the read, maybe we should keep
it that way at least for the time being.


> (like changing bits,
> clearing interrupt status, whatever) so the emulation would behave
> differently than real hardware if a guest tries to write such a register. So
> this may have problems either way even if this particular case is not
> affected by that and could just be "fixed" by declaring the regions native
> endian to disable this part of memory core or fixing that up to do byte
> swapping back and forth. I don't mind either way as long as it works.
> 
> Regards,
> BALATON Zoltan


