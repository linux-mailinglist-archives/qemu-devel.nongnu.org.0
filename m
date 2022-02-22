Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356804BFBF4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:09:07 +0100 (CET)
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWmo-0002MH-AH
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:09:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nMWLa-0007NF-I3
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nMWLL-0005jW-FO
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645540841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gi5dFAaZXhTFEwQgoorsXH4QohyBD+5OYkcR2N/1Jkw=;
 b=hOj60Dz5LisZw7LelxuSXdcaLAm+tyu5eoI59Q0WQWN7f+9EvS/wTA5YoBExhJnXtodJck
 CQ7DDUSZdYe0OrNFq+65aVNSjX3mTucYNzhmLNTHiAN1eft6LlLiLU8BBMHVgkDJj/5JQA
 R9WdHJ2ELPCO0cGT+j6Pq6cv7Vco+pc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-jPCse1TXM4OTfVlNlVcz3w-1; Tue, 22 Feb 2022 09:40:38 -0500
X-MC-Unique: jPCse1TXM4OTfVlNlVcz3w-1
Received: by mail-wr1-f72.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so9020852wrp.10
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 06:40:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Gi5dFAaZXhTFEwQgoorsXH4QohyBD+5OYkcR2N/1Jkw=;
 b=ot+g6i8Xxyewucbps0UjiVQ75qVtt4yJJkbP7Ih+SF78jyTPiZMrSlvrMwnvKxeETf
 pEREXhsXbNRYvd6MPl4/8Qbqk6Pl0D/EwEukaQAcYqswOkaljBrchvNPphZYrlM2WFEE
 YNbijE0ZZ2RYI5uE79oIca7TkN11U6hgTf9Uefl+Tbg/C1jY0u5dbyR6e91giUSIGJDo
 VJTRblXxa4p9ExT6No9aX+98pzYoiSHM6aCjWPCbC4QyPP71ILLVOMKzvRY5bKOrBDO8
 lt1GSr0sk+wFpJgoL8C2eQX8WvvXYDAor+pwW8cJuSDxa5k0YOOp3r/Tn3us3sCC6XmN
 OAAw==
X-Gm-Message-State: AOAM532yr2rIg+vgybS4Wwr30B8bWOfN/iJKQ+JvGLUnHjKzUIJxWI9Q
 nGaHeqLo7vc2VG3UOSXACFp+9HxOdzllqvyQiBx2R1YGOxRFZf5YkBnQMFUEDjDizJ6RU3jHaym
 L9jgC33MDlNSzByI=
X-Received: by 2002:adf:f68d:0:b0:1e1:db49:a721 with SMTP id
 v13-20020adff68d000000b001e1db49a721mr20023471wrp.297.1645540836691; 
 Tue, 22 Feb 2022 06:40:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz97q4t+z06lZXOqGnUX8G+YQZAtoZqv+VIjgT4oX4o/jSnZ0g35rNDDxSwKfMs0UAaTlGjrw==
X-Received: by 2002:adf:f68d:0:b0:1e1:db49:a721 with SMTP id
 v13-20020adff68d000000b001e1db49a721mr20023453wrp.297.1645540836394; 
 Tue, 22 Feb 2022 06:40:36 -0800 (PST)
Received: from redhat.com ([2.55.129.240])
 by smtp.gmail.com with ESMTPSA id o12sm4234330wrh.89.2022.02.22.06.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:40:34 -0800 (PST)
Date: Tue, 22 Feb 2022 09:40:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20220222094021-mutt-send-email-mst@kernel.org>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220119041842-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 04:19:14AM -0500, Michael S. Tsirkin wrote:
> On Sat, Nov 13, 2021 at 07:47:20PM +0100, BALATON Zoltan wrote:
> > On Mon, 8 Nov 2021, BALATON Zoltan wrote:
> > > On Mon, 8 Nov 2021, Paolo Bonzini wrote:
> > > > On 11/8/21 15:30, Paolo Bonzini wrote:
> > > > > On 11/8/21 14:05, BALATON Zoltan wrote:
> > > > > > When using ACPI on big endian machine (such as ppc/pegasos2 which has
> > > > > > a VT8231 south bridge with ACPI) writes to ACPI registers come out
> > > > > > byte swapped. This may be caused by a bug in memory subsystem but
> > > > > > until that is fixed setting the ACPI memory regions to native endian
> > > > > > makes it usable for big endian machines. This fixes ACPI shutdown with
> > > > > > pegasos2 when using the board firmware for now.
> > > > > > This could be reverted when the memory layer is fixed.
> > > > > 
> > > > > What is the path to the swapped writes?  Even just a backtrace
> > > > > might be enough to understand what's going on, and especially
> > > > > where the bug is.
> > > > 
> > > > Ok, Michael pointed me at https://lore.kernel.org/all/20211011080528-mutt-send-email-mst@kernel.org/.
> > 
> > Ping? I haven't seen an alternative fix yet. If you don't have time now this
> > could be postponed to next version with the native endian work around for
> > now.
> > 
> > Regards,
> > BALATON Zoltan
> 
> Paolo, ping?

ping

> > > I was about to say that here's the original thread:
> > > 
> > > https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01972.html
> > > 
> > > and here's the backtrace:
> > > 
> > > #0  acpi_pm1_cnt_write (val=40, ar=0x55555695f340) at ../hw/acpi/core.c:556
> > > #1  acpi_pm_cnt_write (opaque=0x55555695f340, addr=1, val=40, width=2)
> > > at ../hw/acpi/core.c:602
> > > #2  0x0000555555b3a82f in memory_region_write_accessor
> > >    (mr=mr@entry=0x55555695f590, addr=1,
> > > value=value@entry=0x7fffefffdd08, size=size@entry=2, shift=<optimized
> > > out>, mask=mask@entry=65535, attrs=...)
> > >    at ../softmmu/memory.c:492
> > > #3  0x0000555555b3813e in access_with_adjusted_size
> > >    (addr=addr@entry=1, value=value@entry=0x7fffefffdd08,
> > > size=size@entry=1, access_size_min=<optimized out>,
> > > access_size_max=<optimized out>, access_fn=
> > >    0x555555b3a7b0 <memory_region_write_accessor>, mr=0x55555695f590,
> > > attrs=...) at ../softmmu/memory.c:554
> > > #4  0x0000555555b3c449 in memory_region_dispatch_write
> > > (mr=mr@entry=0x55555695f590, addr=1, data=<optimized out>, op=<optimized
> > > out>, attrs=attrs@entry=...)
> > >    at ../softmmu/memory.c:1511
> > > #5  0x0000555555b2c121 in flatview_write_continue
> > >    (fv=fv@entry=0x7fff84d23b30, addr=addr@entry=4261416709,
> > > attrs=attrs@entry=..., ptr=ptr@entry=0x7fffefffdec0, len=len@entry=1,
> > > addr1=<optimized out>,
> > >     l=<optimized out>, mr=0x55555695f590) at host-utils.h:165
> > > #6  0x0000555555b2c399 in flatview_write (len=1, buf=0x7fffefffdec0,
> > > attrs=..., addr=4261416709, fv=0x7fff84d23b30) at
> > > ../softmmu/physmem.c:2822
> > > #7  subpage_write (opaque=<optimized out>, addr=<optimized out>,
> > > value=<optimized out>, len=1, attrs=...) at ../softmmu/physmem.c:2488
> > > #8  0x0000555555b380de in access_with_adjusted_size
> > >    (addr=addr@entry=3845, value=value@entry=0x7fffefffdf88,
> > > size=size@entry=1, access_size_min=<optimized out>,
> > > access_size_max=<optimized out>, access_fn=
> > >    0x555555b3aa80 <memory_region_write_with_attrs_accessor>,
> > > mr=0x7fff84710bb0, attrs=...) at ../softmmu/memory.c:549
> > > #9  0x0000555555b3c449 in memory_region_dispatch_write
> > > (mr=mr@entry=0x7fff84710bb0, addr=addr@entry=3845, data=<optimized out>,
> > > data@entry=40, op=op@entry=MO_8, attrs=...)
> > >    at ../softmmu/memory.c:1511
> > > #10 0x0000555555c07b4c in io_writex
> > >    (env=env@entry=0x55555666a820,
> > > iotlbentry=iotlbentry@entry=0x7fff843367f0, mmu_idx=1, val=val@entry=40,
> > > addr=addr@entry=4261416709,
> > >     retaddr=retaddr@entry=140736116523268, op=MO_8) at
> > > ../accel/tcg/cputlb.c:1420
> > > #11 0x0000555555c0b5df in store_helper (op=MO_8, retaddr=<optimized
> > > out>, oi=<optimized out>, val=40, addr=4261416709, env=0x55555666a820)
> > > at ../accel/tcg/cputlb.c:2355
> > > #12 full_stb_mmu (env=0x55555666a820, addr=4261416709, val=40,
> > > oi=<optimized out>, retaddr=140736116523268) at
> > > ../accel/tcg/cputlb.c:2404
> > > #13 0x00007fffae3b8104 in code_gen_buffer ()
> > > #14 0x0000555555bfcfab in cpu_tb_exec (cpu=cpu@entry=0x555556661360,
> > > itb=itb@entry=0x7fffae3b7fc0 <code_gen_buffer+56197011>,
> > > tb_exit=tb_exit@entry=0x7fffefffe668)
> > >    at ../accel/tcg/cpu-exec.c:357
> > > #15 0x0000555555bfe089 in cpu_loop_exec_tb (tb_exit=0x7fffefffe668,
> > > last_tb=<synthetic pointer>, tb=0x7fffae3b7fc0
> > > <code_gen_buffer+56197011>, cpu=0x555556661360)
> > >    at ../accel/tcg/cpu-exec.c:833
> > > #16 cpu_exec (cpu=cpu@entry=0x555556661360) at ../accel/tcg/cpu-exec.c:992
> > > #17 0x0000555555c1bba0 in tcg_cpus_exec (cpu=cpu@entry=0x555556661360)
> > > at ../accel/tcg/tcg-accel-ops.c:67
> > > #18 0x0000555555c1c3d7 in rr_cpu_thread_fn
> > > (arg=arg@entry=0x555556661360) at ../accel/tcg/tcg-accel-ops-rr.c:214
> > > #19 0x0000555555d5c049 in qemu_thread_start (args=0x7fffefffe750) at
> > > ../util/qemu-thread-posix.c:556
> > > #20 0x00007ffff6a95dea in start_thread () at /lib64/libpthread.so.0
> > > #21 0x00007ffff69c8fdf in clone () at /lib64/libc.so.6
> > > 
> 


