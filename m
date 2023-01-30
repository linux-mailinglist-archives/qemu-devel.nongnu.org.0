Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2C6813BE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVSF-0004GP-Vc; Mon, 30 Jan 2023 09:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <loyou85@gmail.com>) id 1pMVS2-0004DS-8I
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:48:17 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <loyou85@gmail.com>) id 1pMVS0-0007Xj-Id
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:48:06 -0500
Received: by mail-ej1-x62f.google.com with SMTP id dr8so10813061ejc.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gT1diSxdZv5ZqmG614MZeTHLAeUoG8roo4fzyBZatw=;
 b=B9hcjcqTiSWPgMXu2fv8SWUXRSD8uWypngEmkJ0wMYn134VBCQ3qj+qFVhpoTK0NpX
 BpMkfaaeuB2rLZ5q/1rF6FiXVTdQtmLa/L0hxVoonHYAC2sxJiiUZBrwKie6VZp8ixgJ
 rSxQarHEP/t/6tFi8hHLMaZ84ReJMvVARhSWyzTVgrl2Xut5bg0vcYuU0Lu/BxFlKHUK
 Q1ZVcjEfbP707fK1s8yGdu3MoNoyhkFJjn8odBq/AsKyRgZsLkufnqMbEQPVKwvQ04Y9
 uGD5c4pskKjsD1JNYwxICJrfcIFUZSYasCVEhrvZzqvxmQD7xuvyIehlHJ1kT69QEnD4
 AHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5gT1diSxdZv5ZqmG614MZeTHLAeUoG8roo4fzyBZatw=;
 b=jACwVgf/VZlfwnwmrqAsVRlEsEu8mPFomDLjamX0SqNMMan5jNd1B0buBu7yOAY/Qp
 x4V+STU4OKFIGh2HT7/SjECZ4hipKDW0xmWJQ+w+jooyOcuD1gnQSi3xaKDO2kn3wdmN
 Ogdyqlb64F5tNuslCVwIojO6VGkzv600jzrWnC5kJrCci1fy8txwmrmK4RnbVMl/yZbM
 VX3//NljWaMMdwmWKRdKoxpxOR2ynqJTsrxAO9jtMFtKUyT1c4i2CL6CeXVvCg90Ah7U
 PXzFwuneI32+ww++yos7LYaFHK/+DMlrKsr91KNN+2XU/tOedNEQDsDMTlde6LXejzbj
 zFYQ==
X-Gm-Message-State: AO0yUKVCjw7/CeXWSHTxD1mwk/HxCghQH0vqgYmpabWcPkeZEG4k76zu
 6mLjQExxlYbFP/EkIf5JUjH2wMEdyDCBCxtHAEE=
X-Google-Smtp-Source: AK7set+dN+lrfG5kz0LgeKbZtRUp4grK6ip7j6K5iSQGs4GXk8jHu2A8dwIiD/f3i2zbHTjrS/Ib/WRRSk5e0p81Jp8=
X-Received: by 2002:a17:906:2f16:b0:87f:e638:cf68 with SMTP id
 v22-20020a1709062f1600b0087fe638cf68mr2504877eji.281.1675090082251; Mon, 30
 Jan 2023 06:48:02 -0800 (PST)
MIME-Version: 1.0
References: <1673954121-23942-1-git-send-email-loyou85@gmail.com>
 <20230124113029.7a02e5ff@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230124113029.7a02e5ff@imammedo.users.ipa.redhat.com>
From: Feng Sun <loyou85@gmail.com>
Date: Mon, 30 Jan 2023 22:47:25 +0800
Message-ID: <CAAiCvkiFL7PWYSF24YxaOvu_v2fFfaWkuaQgUBr_9AFwsxHOrQ@mail.gmail.com>
Subject: Re: [PATCH] acpi: Set maximum size to 64k for "etc/acpi/rsdp" blob
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, ani@anisinha.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=loyou85@gmail.com; helo=mail-ej1-x62f.google.com
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

Igor Mammedov <imammedo@redhat.com> =E4=BA=8E2023=E5=B9=B41=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=BA=8C 18:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 17 Jan 2023 19:15:21 +0800
> Sun Feng <loyou85@gmail.com> wrote:
>
> > Migrate from aarch64 host with PAGE_SIZE 64k to 4k failed with followin=
g errors:
> >
> > qmp_cmd_name: migrate-incoming, arguments: {"uri": "tcp:[::]:49152"}
> > {"timestamp": {"seconds": 1673922775, "microseconds": 534702}, "event":=
 "MIGRATION", "data": {"status": "setup"}}
> > {"timestamp": {"seconds": 1673922776, "microseconds": 53003}, "event": =
"MIGRATION", "data": {"status": "active"}}
> > 2023-01-17T02:32:56.058827Z qemu-system-aarch64: Length too large: /rom=
@etc/acpi/rsdp: 0x10000 > 0x1000: Invalid argument
>
> this should mention/explain why it's happening.
>
> i.e we now have 4k limit for RSDP, but then source somehow managed to sta=
rt with 64k
> allocated to for RSDP. It looks like limit isn't working as expected to m=
e.

4k limit should be romsize limit. I can see Rom '/rom@etc/acpi/rsdp'
with romsize:4096, datasize:36.
RAMBlock's used_length is set with datasize aligned to PAGE_SIZE, so
it become 64k when PAGE_SIZE is 64k.
```
static
RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
                                  void (*resized)(const char*,
                                                  uint64_t length,
                                                  void *host),
                                  void *host, uint32_t ram_flags,
                                  MemoryRegion *mr, Error **errp)
{
    RAMBlock *new_block;
    Error *local_err =3D NULL;

    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
                          RAM_NORESERVE)) =3D=3D 0);
    assert(!host ^ (ram_flags & RAM_PREALLOC));

    size =3D HOST_PAGE_ALIGN(size);
    max_size =3D HOST_PAGE_ALIGN(max_size);
    new_block =3D g_malloc0(sizeof(*new_block));
    new_block->mr =3D mr;
    new_block->resized =3D resized;
    new_block->used_length =3D size;
```
So when migrate to 4k PAGE_SIZE, it will report the errors.

ramblock information for PAGE_SIZE 64k and 4k.
```
# getconf PAGE_SIZE
65536
# virsh qemu-monitor-command testvm --hmp 'info ramblock'
              Block Name    PSize              Offset
Used              Total
           mach-virt.ram   64 KiB  0x0000000000000000
0x0000000040000000 0x0000000040000000
             virt.flash0   64 KiB  0x0000000040000000
0x0000000004000000 0x0000000004000000
             virt.flash1   64 KiB  0x0000000044000000
0x0000000004000000 0x0000000004000000
    /rom@etc/acpi/tables   64 KiB  0x0000000048040000
0x0000000000020000 0x0000000000200000
0000:00:01.2:00.0/virtio-net-pci.rom   64 KiB  0x0000000048000000
0x0000000000040000 0x0000000000040000
   /rom@etc/table-loader   64 KiB  0x0000000048240000
0x0000000000010000 0x0000000000010000
      /rom@etc/acpi/rsdp   64 KiB  0x0000000048280000
0x0000000000010000 0x0000000000010000

# getconf PAGE_SIZE
4096
# virsh qemu-monitor-command testvm --hmp 'info ramblock'
              Block Name    PSize              Offset
Used              Total
           mach-virt.ram    4 KiB  0x0000000000000000
0x0000000800000000 0x0000000800000000
             virt.flash0    4 KiB  0x0000000800000000
0x0000000004000000 0x0000000004000000
             virt.flash1    4 KiB  0x0000000804000000
0x0000000004000000 0x0000000004000000
    /rom@etc/acpi/tables    4 KiB  0x0000000808000000
0x0000000000020000 0x0000000000200000
   /rom@etc/table-loader    4 KiB  0x0000000808200000
0x0000000000001000 0x0000000000010000
      /rom@etc/acpi/rsdp    4 KiB  0x0000000808240000
0x0000000000001000 0x0000000000001000
```

--=20
Best wishes!

