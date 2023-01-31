Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD1682892
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMmmC-0004ME-33; Tue, 31 Jan 2023 04:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loyou85@gmail.com>) id 1pMmm9-0004Ly-Dq
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:18:01 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loyou85@gmail.com>) id 1pMmm7-00035d-0P
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:18:00 -0500
Received: by mail-ej1-x629.google.com with SMTP id ud5so39708790ejc.4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 01:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owk6MxgckIaRdXfjU+qRd6BGDJ+B6oXuLFBXjbbqdC8=;
 b=MBmvN44YJZOi8/OILaPYtYiUnkfy3sHEmPy+Hf1Jd7Mhe0MfkzfllDYNd9mPUz0CS9
 jCt4AAnSnYYYAn7yJp0cAc3QGUNWKZn8tQe6TY/EyNuKSDZ5EdK4wDvkAQ2tH2YaXACg
 BVkeQ6osScGLJO0t0jwJIwwjb63cM8Y08W0EO5M9Vl1l5MQ2BgINT0Jl5s6E5AHZ0eMP
 zh7/rmH2l1/jiYhpwD7KvY5lsg4WFiu2xafpp29a4oKcCljd174c3wIZkOLYNQbEV3nI
 5WzkPUUX4M2z8HQbPIpc4EuNs3sRQXKD9yc149+xy9shC7jad06Blo5WsmJBEB2Y+uAh
 ajiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=owk6MxgckIaRdXfjU+qRd6BGDJ+B6oXuLFBXjbbqdC8=;
 b=BCQcR5OCv+9qm3LN+EiEZBNDIl/ikNly7R/bh5nI5dkJamWnCudeLs8OVmG0ng8ei1
 lKk0j44eIwPVScE/CW8agphiHeY4TdtfAIHl07h3w2OHZ4PwyW0rvHUk5UbLCSQRPLlL
 /wj1uGpvxx5iMnH6Vd4tLlt3EMkxk8avjJLaffCHY4e+19Yp7VRpZK/8AYfXF4DFN4Do
 hB2GI/tgZH2LmhxllgzPNpisC0TG5wNFjJNZG/izoSYL3AJzl6BHpkF9XTR+K3RA3zc3
 v09ZiQdDkitgWRNjl2UT1KeGnTYSmlYRZpWm3VxLUe+eBcsiPY+GTaUQ886zsUQbfZJN
 zuZQ==
X-Gm-Message-State: AO0yUKVvn++X8Bp8dXI3FBO9Fo8bXmk4xNpQCdIXqfVKVudHFMIe93hI
 qJiVRClA8pU9dM7vdmrvwz1hZlGN9Vri/wza8nw=
X-Google-Smtp-Source: AK7set+2mTR0QaduMx7AvP4nDbo5foG5HfgiH/xeO+vGg9+nyAH7N48nWjOWkP5avb6TFx7lsZ2FbkexezW9xVNsOvs=
X-Received: by 2002:a17:906:dfef:b0:87e:fd9e:5c63 with SMTP id
 lc15-20020a170906dfef00b0087efd9e5c63mr3441369ejc.106.1675156677220; Tue, 31
 Jan 2023 01:17:57 -0800 (PST)
MIME-Version: 1.0
References: <1673954121-23942-1-git-send-email-loyou85@gmail.com>
 <20230124113029.7a02e5ff@imammedo.users.ipa.redhat.com>
 <CAAiCvkiFL7PWYSF24YxaOvu_v2fFfaWkuaQgUBr_9AFwsxHOrQ@mail.gmail.com>
 <20230130100531-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230130100531-mutt-send-email-mst@kernel.org>
From: Feng Sun <loyou85@gmail.com>
Date: Tue, 31 Jan 2023 17:17:20 +0800
Message-ID: <CAAiCvkiQS9L99Npzk5Ak0G67Fh3JiCbR50hBHR2Moz5Vz50gBA@mail.gmail.com>
Subject: Re: [PATCH] acpi: Set maximum size to 64k for "etc/acpi/rsdp" blob
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, ani@anisinha.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=loyou85@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Michael S. Tsirkin <mst@redhat.com> =E4=BA=8E2023=E5=B9=B41=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=B8=80 23:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 30, 2023 at 10:47:25PM +0800, Feng Sun wrote:
> > Igor Mammedov <imammedo@redhat.com> =E4=BA=8E2023=E5=B9=B41=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=BA=8C 18:30=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Tue, 17 Jan 2023 19:15:21 +0800
> > > Sun Feng <loyou85@gmail.com> wrote:
> > >
> > > > Migrate from aarch64 host with PAGE_SIZE 64k to 4k failed with foll=
owing errors:
> > > >
> > > > qmp_cmd_name: migrate-incoming, arguments: {"uri": "tcp:[::]:49152"=
}
> > > > {"timestamp": {"seconds": 1673922775, "microseconds": 534702}, "eve=
nt": "MIGRATION", "data": {"status": "setup"}}
> > > > {"timestamp": {"seconds": 1673922776, "microseconds": 53003}, "even=
t": "MIGRATION", "data": {"status": "active"}}
> > > > 2023-01-17T02:32:56.058827Z qemu-system-aarch64: Length too large: =
/rom@etc/acpi/rsdp: 0x10000 > 0x1000: Invalid argument
> > >
> > > this should mention/explain why it's happening.
> > >
> > > i.e we now have 4k limit for RSDP, but then source somehow managed to=
 start with 64k
> > > allocated to for RSDP. It looks like limit isn't working as expected =
to me.
> >
> > 4k limit should be romsize limit. I can see Rom '/rom@etc/acpi/rsdp'
> > with romsize:4096, datasize:36.
> > RAMBlock's used_length is set with datasize aligned to PAGE_SIZE, so
> > it become 64k when PAGE_SIZE is 64k.
> > ```
> > static
> > RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
> >                                   void (*resized)(const char*,
> >                                                   uint64_t length,
> >                                                   void *host),
> >                                   void *host, uint32_t ram_flags,
> >                                   MemoryRegion *mr, Error **errp)
> > {
> >     RAMBlock *new_block;
> >     Error *local_err =3D NULL;
> >
> >     assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
> >                           RAM_NORESERVE)) =3D=3D 0);
> >     assert(!host ^ (ram_flags & RAM_PREALLOC));
> >
> >     size =3D HOST_PAGE_ALIGN(size);
> >     max_size =3D HOST_PAGE_ALIGN(max_size);
> >     new_block =3D g_malloc0(sizeof(*new_block));
> >     new_block->mr =3D mr;
> >     new_block->resized =3D resized;
> >     new_block->used_length =3D size;
> > ```
> > So when migrate to 4k PAGE_SIZE, it will report the errors.
> >
> > ramblock information for PAGE_SIZE 64k and 4k.
> > ```
> > # getconf PAGE_SIZE
> > 65536
> > # virsh qemu-monitor-command testvm --hmp 'info ramblock'
> >               Block Name    PSize              Offset
> > Used              Total
> >            mach-virt.ram   64 KiB  0x0000000000000000
> > 0x0000000040000000 0x0000000040000000
> >              virt.flash0   64 KiB  0x0000000040000000
> > 0x0000000004000000 0x0000000004000000
> >              virt.flash1   64 KiB  0x0000000044000000
> > 0x0000000004000000 0x0000000004000000
> >     /rom@etc/acpi/tables   64 KiB  0x0000000048040000
> > 0x0000000000020000 0x0000000000200000
> > 0000:00:01.2:00.0/virtio-net-pci.rom   64 KiB  0x0000000048000000
> > 0x0000000000040000 0x0000000000040000
> >    /rom@etc/table-loader   64 KiB  0x0000000048240000
> > 0x0000000000010000 0x0000000000010000
> >       /rom@etc/acpi/rsdp   64 KiB  0x0000000048280000
> > 0x0000000000010000 0x0000000000010000
> >
> > # getconf PAGE_SIZE
> > 4096
> > # virsh qemu-monitor-command testvm --hmp 'info ramblock'
> >               Block Name    PSize              Offset
> > Used              Total
> >            mach-virt.ram    4 KiB  0x0000000000000000
> > 0x0000000800000000 0x0000000800000000
> >              virt.flash0    4 KiB  0x0000000800000000
> > 0x0000000004000000 0x0000000004000000
> >              virt.flash1    4 KiB  0x0000000804000000
> > 0x0000000004000000 0x0000000004000000
> >     /rom@etc/acpi/tables    4 KiB  0x0000000808000000
> > 0x0000000000020000 0x0000000000200000
> >    /rom@etc/table-loader    4 KiB  0x0000000808200000
> > 0x0000000000001000 0x0000000000010000
> >       /rom@etc/acpi/rsdp    4 KiB  0x0000000808240000
> > 0x0000000000001000 0x0000000000001000
> > ```
>
> Oh interesting. I don't remember why I decided to align in.
> What does the following do (warning: completely untested):
>
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cb998cdf23..5c732101b9 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2154,7 +2154,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, =
ram_addr_t max_size,
>                            RAM_NORESERVE)) =3D=3D 0);
>      assert(!host ^ (ram_flags & RAM_PREALLOC));
>
> -    size =3D HOST_PAGE_ALIGN(size);
> +    // size =3D HOST_PAGE_ALIGN(size);
>      max_size =3D HOST_PAGE_ALIGN(max_size);
>      new_block =3D g_malloc0(sizeof(*new_block));
>      new_block->mr =3D mr;
>

With additional change we can see actually used size with 'info ramblock',

--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1837,7 +1837,7 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t
newsize, Error **errp)

     assert(block);

-    newsize =3D HOST_PAGE_ALIGN(newsize);
+    //newsize =3D HOST_PAGE_ALIGN(newsize);

     if (block->used_length =3D=3D newsize) {
         /*

# virsh qemu-monitor-command testvm --hmp 'info ramblock'
              Block Name    PSize              Offset
Used              Total
           mach-virt.ram   64 KiB  0x0000000000000000
0x0000000800000000 0x0000000800000000
             virt.flash0   64 KiB  0x0000000800000000
0x0000000004000000 0x0000000004000000
             virt.flash1   64 KiB  0x0000000804000000
0x0000000004000000 0x0000000004000000
    /rom@etc/acpi/tables   64 KiB  0x0000000808000000
0x0000000000020000 0x0000000000200000
   /rom@etc/table-loader   64 KiB  0x0000000808200000
0x0000000000000b00 0x0000000000010000
      /rom@etc/acpi/rsdp   64 KiB  0x0000000808240000
0x0000000000000024 0x0000000000010000

but migration needs more changes. I fixed the following error during migrat=
ion:

qemu-system-aarch64: ../softmmu/physmem.c:1059:
cpu_physical_memory_test_and_clear_dirty: Assertion `start >=3D
ramblock->offset && start + length <=3D ramblock->offset +
ramblock->used_length' failed.
2023-01-31 04:09:40.934+0000: shutting down, reason=3Dcrashed

--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1055,7 +1055,7 @@ bool
cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
         ramblock =3D qemu_get_ram_block(start);
         /* Range sanity check on the ramblock */

         assert(start >=3D ramblock->offset &&
-               start + length <=3D ramblock->offset + ramblock->used_lengt=
h);
+               start + length <=3D ramblock->offset + ramblock->max_length=
);

         while (page < end) {
             unsigned long idx =3D page / DIRTY_MEMORY_BLOCK_SIZE;

but more issues still exist,

source:
2023-01-31T05:23:28.051615Z qemu-system-aarch64: failed to save
SaveStateEntry with id(name): 3(ram): -5
2023-01-31T05:23:28.053256Z qemu-system-aarch64: Unable to write to
socket: Bad file descriptor

target:
2023-01-31T05:23:28.049659Z qemu-system-aarch64: Received an
unexpected compressed page
2023-01-31T05:23:28.049709Z qemu-system-aarch64: error while loading
state for instance 0x0 of device 'ram'
2023-01-31T05:23:28.050095Z qemu-system-aarch64: load of migration
failed: Invalid argument

In my opinion, it would be a tricky way to set 64k and would not have
migration compatibility problems.
Of course, the best and appropriate way is to migrate with actual data size=
.
I am not quite familiar with migration codes, if needed, I can help to
do more migration patch tests.

