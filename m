Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C21699700
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:18:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSf5E-0001Zr-Ae; Thu, 16 Feb 2023 09:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pSf5B-0001ZM-Ry; Thu, 16 Feb 2023 09:17:57 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pSf59-0002Z5-ES; Thu, 16 Feb 2023 09:17:57 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-4c24993965eso26090677b3.12; 
 Thu, 16 Feb 2023 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhBv9GABcCLPLAB3BAMSMLOcOEJmP+kjvDjKQjuQi44=;
 b=fDROAyMvlMqt4TuPnyJmLFMNnHRpIJ4o4hrz0qDAXdw2oRI1Y6HKzZiM5SCy7oYFxl
 KpzJAj2tFg0cG9byE22vr+hSgt6IpOVCWGUp1U1b5Egns8tyKgRkkPhCG1SbH7LYv7t1
 uYk3ZppPiIlYF5b0WL6JF2Odid62A0ak9ewvGfvjGaaVQip6ErfZLS1a8MvUkTISrHmi
 v/FbpUJxUH+saE8bC2REkfd+j3ixzTHzCJZ3n0Bzt/5rfP8P4/yMOLMUOUOn1uajtqBO
 xh+0alJ+/NL6eJtC/EdI0ImCbTKvm5p2e7d64z5UaXLRhrzKa/2VJKli9tiDSUOqsY3q
 9XTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhBv9GABcCLPLAB3BAMSMLOcOEJmP+kjvDjKQjuQi44=;
 b=qDtlffFefWpdw4TuqTQNa9i0EYU5t0xfnBrYMXrVDq14mQdion4ZnU/v99jNUx99k9
 VgftwxHt/9ZMkemA/FGfoag3k7XyvbQIc7W9pQYBpCOlxo9IzNT5MzxXvMWv1rBqcNHE
 14ytINI/pG5jVG+FD5Vk2P1l7huabuWnyvvEtI9QGpUEllFOjOWlbCtGG/ftYlfoj4RB
 Q+ApFF5FZn/mlN+HIPtuIGaKUJ6vuonHekbX2udcn7/WW1wCk4GcXvSQNgx4wrz1x9bQ
 OuTgE1i6pwWibYla/lljFhj6BTQEXz89WAhcgLqGAOpI8In/YNAd4IpTWTnA962qyQbI
 UuAg==
X-Gm-Message-State: AO0yUKWcmJZUBo+NtMlPEWXzb5OJGzMpMPztQBrMIEtTwiPGcERFSGSr
 P1/4rekFb2WNbKmyviwHDPO7tFwmjS5lCNceD3M=
X-Google-Smtp-Source: AK7set9gBIoRcXvMKxw8fzlU80/lPP057NDsGs2iRw/nvtnK2jIql6oiS47uZwONe4k4mMAn9/cDUe+YL6sAJzs9nlo=
X-Received: by 2002:a81:7b85:0:b0:52f:cec:fea1 with SMTP id
 w127-20020a817b85000000b0052f0cecfea1mr859498ywc.111.1676557073440; Thu, 16
 Feb 2023 06:17:53 -0800 (PST)
MIME-Version: 1.0
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
 <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
In-Reply-To: <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Thu, 16 Feb 2023 17:17:17 +0300
Message-ID: <CAL77WPAdDyKFWP_Dqsz_xr7OCzHLTkw6VbYDMGobi8kek4e_8A@mail.gmail.com>
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, 
 Aaron Lauterer <a.lauterer@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Does additional comparison make a sense here: check for LBA =3D=3D 0 and
then check MBR signature bytes.
Additionally it=E2=80=99s easy to check buffer_is_zero() result or even pri=
nt
FIS contents under these conditions.
Data looks like a part of guest memory of 64bit Windows.

On Wed, Feb 15, 2023 at 1:53 PM Fiona Ebner <f.ebner@proxmox.com> wrote:
>
> Am 14.02.23 um 19:21 schrieb John Snow:
> > On Thu, Feb 2, 2023 at 7:08 AM Fiona Ebner <f.ebner@proxmox.com> wrote:
> >>
> >> Hi,
> >> over the years we've got 1-2 dozen reports[0] about suddenly
> >> missing/corrupted MBR/partition tables. The issue seems to be very rar=
e
> >> and there was no success in trying to reproduce it yet. I'm asking her=
e
> >> in the hope that somebody has seen something similar.
> >>
> >> The only commonality seems to be the use of an ide-hd drive with ahci =
bus.
> >>
> >> It does seem to happen with both Linux and Windows guests (one of the
> >> reports even mentions FreeBSD) and backing storages for the VMs includ=
e
> >> ZFS, RBD, LVM-Thin as well as file-based storages.
> >>
> >> Relevant part of an example configuration:
> >>
> >>>   -device 'ahci,id=3Dahci0,multifunction=3Don,bus=3Dpci.0,addr=3D0x7'=
 \
> >>>   -drive 'file=3D/dev/zvol/myzpool/vm-168-disk-0,if=3Dnone,id=3Ddrive=
-sata0,format=3Draw,cache=3Dnone,aio=3Dio_uring,detect-zeroes=3Don' \
> >>>   -device 'ide-hd,bus=3Dahci0.0,drive=3Ddrive-sata0,id=3Dsata0' \
> >>
> >> The first reports are from before io_uring was used and there are also
> >> reports with writeback cache mode and discard=3Don,detect-zeroes=3Dunm=
ap.
> >>
> >> Some reports say that the issue occurred under high IO load.
> >>
> >> Many reports suspect backups causing the issue. Our backup mechanism
> >> uses backup_job_create() for each drive and runs the jobs sequentially=
.
> >> It uses a custom block driver as the backup target which just forwards
> >> the writes to the actual target which can be a file or our backup serv=
er.
> >> (If you really want to see the details, apply the patches in [1] and s=
ee
> >> pve-backup.c and block/backup-dump.c).
> >>
> >> Of course, the backup job will read sector 0 of the source disk, but I
> >> really can't see where a stray write would happen, why the issue would
> >> trigger so rarely or why seemingly only ide-hd+ahci would be affected.
> >>
> >> So again, just asking if somebody has seen something similar or has a
> >> hunch of what the cause might be.
> >>
> >
> > Hi Floria;
> >
> > I'm sorry to say that I haven't worked on the block devices (or
> > backup) for a little while now, so I am not immediately sure what
> > might be causing this problem. In general, I advise against using AHCI
> > in production as better performance (and dev support) can be achieved
> > through virtio.
>
> Yes, we also recommend using virtio-{scsi,blk}-pci to our users and most
> do. Still, some use AHCI, I'd guess mostly for Windows, but not only.
>
> > Still, I am not sure why the combination of AHCI with
> > backup_job_create() would be corrupting the early sectors of the disk.
>
> It's not clear that backup itself is causing the issue. Some of the
> reports do correlate it with backup, but there are no precise timestamps
> when the corruption happened. It might be that the additional IO during
> backup is somehow triggering the issue.
>
> > Do you have any analysis on how much data gets corrupted? Is it the
> > first sector only, the first few? Has anyone taken a peek at the
> > backing storage to see if there are any interesting patterns that can
> > be observed? (Zeroes, garbage, old data?)
>
> It does seem to be the first sector only, but it's not entirely clear.
> Many of the affected users said that after fixing the partition table
> with TestDisk, the VMs booted/worked normally again. We only have dumps
> for the first MiB of three images. In this case, all Windows with Ceph
> RBD images.
>
> See below[0] for the dumps. One was a valid MBR and matched the latest
> good backup, so that VM didn't boot for some other reason, not sure if
> even related to this bug. I did not include this one. One was completely
> empty and one contained other data in the first 512 Bytes, then again
> zeroes, but those zeroes are nothing special AFAIK.
>
> > Have any errors or warnings been observed in either the guest or the
> > host that might offer some clues?
>
> There is a single user who seemed to have hardware issues, and I'd be
> inclined to blame those in that case. But none of the other users
> reported any errors or warnings, though I can't say if any checked
> inside the guests.
>
> > Is there any commonality in the storage format being used? Is it
> > qcow2? Is it network-backed?
>
> There are reports with local ZFS volumes, local LVM-Thin volumes, RBD
> images, qcow2 on NFS. So no pattern to be seen.
>
> > Apologies for the "tier 1" questions.
>
> Thank you for your time!
>
> Best Regards,
> Fiona
>
> @Aaron (had access to the broken images): please correct me/add anything
> relevant I missed. Are the broken VMs/backups still present? If yes, can
> we ask the user to check the logs inside?
>
> [0]:
> > febner@enia ~/Downloads % hexdump -C dump-vm-120.raw
> > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > *
> > 00100000
> > febner@enia ~/Downloads % hexdump -C dump-vm-130.raw
> > 00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > *
> > 000000c0  00 00 19 03 46 4d 66 6e  00 00 00 00 00 00 00 00  |....FMfn..=
......|
> > 000000d0  04 f2 7a 01 00 00 00 00  00 00 00 00 00 00 00 00  |..z.......=
......|
> > 000000e0  f0 a4 01 00 00 00 00 00  c8 4d 5b 99 0c 81 ff ff  |.........M=
[.....|
> > 000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > 00000100  00 42 e1 38 0d da ff ff  00 bc b4 3b 0d da ff ff  |.B.8......=
.;....|
> > 00000110  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > 00000120  78 00 00 00 01 00 00 00  a8 00 aa 00 00 00 00 00  |x.........=
......|
> > 00000130  a0 71 ba b0 0c 81 ff ff  2e 00 2e 00 00 00 00 00  |.q........=
......|
> > 00000140  a0 71 ba b0 0c 81 ff ff  00 00 00 00 00 00 00 00  |.q........=
......|
> > 00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > *
> > 000001a0  5c 00 44 00 65 00 76 00  69 00 63 00 65 00 5c 00  |\.D.e.v.i.=
c.e.\.|
> > 000001b0  48 00 61 00 72 00 64 00  64 00 69 00 73 00 6b 00  |H.a.r.d.d.=
i.s.k.|
> > 000001c0  56 00 6f 00 6c 00 75 00  6d 00 65 00 32 00 5c 00  |V.o.l.u.m.=
e.2.\.|
> > 000001d0  57 00 69 00 6e 00 64 00  6f 00 77 00 73 00 5c 00  |W.i.n.d.o.=
w.s.\.|
> > 000001e0  4d 00 69 00 63 00 72 00  6f 00 73 00 6f 00 66 00  |M.i.c.r.o.=
s.o.f.|
> > 000001f0  74 00 2e 00 4e 00 45 00  54 00 5c 00 46 00 72 00  |t...N.E.T.=
\.F.r.|
> > 00000200  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > *
> > 00100000
>
>

