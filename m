Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617764295C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 14:27:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2BUJ-0001BH-FF; Mon, 05 Dec 2022 08:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p2BU8-00018S-4L; Mon, 05 Dec 2022 08:26:21 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p2BTx-0007jh-Tx; Mon, 05 Dec 2022 08:26:11 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id l17so128721vkk.3;
 Mon, 05 Dec 2022 05:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/rasR3qa2ygFR07mbay0JFVyNPJqDYF5WrV7N5xohE=;
 b=S7KT4lg5Ckl/YuHiEFxJj6MT6SlfljiqyZhRIQMWQEbm+kGI1MgRCrBVbZS02P0bch
 WsDLc+xpiHAB9EOK2oxBYTKl78cuqyf+x9VXZsNs/BNsGyEe9q1ek2Wql7mGWXHo0Cg2
 aWW5QGB5ueGiYJPeJzra8SV0Ii3B67yxOEulxnyRyAGW5LBy2qKqyulQCG50XvkC/qJA
 oy8YFiEoK2TU56OEq27ELsRKR9foNBNmj0AMX/FWXBFQsYQpseuo8cVf7HQRsHcgZvzT
 d/PdM9r56NmOSxfiBIMR8sgK3QSUEaqukKUtdr4vlK8w9TNDIWmAgS9nBvMFwsUOmkhU
 LWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/rasR3qa2ygFR07mbay0JFVyNPJqDYF5WrV7N5xohE=;
 b=1DOHoaHz79fsOErjnecx9yarXBrI2W5uuiUHDqQLqoaL0T6UleEpH5kXmtkuSEU9z7
 ioZcdR/tej6s7rwNd9K9pgDUac0vy8zI/wdaBUbbI7k0zXdqGtQhe0b/z/c64ERt0zaZ
 NcGUnr4ZiipI0AnQgjAjFGFBf1/79C1TWaORPccxavfGaFwjTj+dBJYP6hYrihFj7MGw
 /skK/VVlFXO8emkdONVvTgS/1Hz6b2T8KM4x8wukNS5E0erYMCg2A7MHMxQ3pThXnaE6
 cM4CL9NHKA4gphMx0Tze7Bvl4XHHfH80etw3JBUKa5VQrUjQuhW/eD9XH67Dc352ieQ2
 Gzeg==
X-Gm-Message-State: ANoB5pnDGM1nvVmw+/4WtDDEhx1Sy1RzcaCcH5P/sVbmg3+2kPc6epjS
 AJpdBC686ORdi4iqTmfPVflY8NPNC4fsdvapCeo=
X-Google-Smtp-Source: AA0mqf7ucci/9Jh/CCbTq/52mEJ3neL/yb4P0CIVki6zzYfUqyNgfZMsLh3TcipUV0Xi9kBYmCe6Nc95i8yOYXznE4o=
X-Received: by 2002:a1f:a00e:0:b0:380:5dbd:1076 with SMTP id
 j14-20020a1fa00e000000b003805dbd1076mr36438302vke.22.1670246694308; Mon, 05
 Dec 2022 05:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20221027154504.20684-1-faithilikerun@gmail.com>
 <20221027154504.20684-4-faithilikerun@gmail.com>
 <CAJSP0QUSQ8MjkGn5SWRPbN+G+xoQH-Htm3BGCMOX_LV9Of=7Og@mail.gmail.com>
 <CAAAx-8LVtGtkReDz4xD37EEJ9Jf7Sk=u+Urse-g=zkAwXt14=A@mail.gmail.com>
 <Y43hobutvJ0vXWNB@fedora>
In-Reply-To: <Y43hobutvJ0vXWNB@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 5 Dec 2022 21:24:28 +0800
Message-ID: <CAAAx-8J6AMfPjuoPYb6LBSY8fiKRMCet+CdK1o_UcwFQ1sq1NA@mail.gmail.com>
Subject: Re: [PATCH v13 3/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Fam Zheng <fam@euphon.net>, 
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, 
 dmitry.fomichev@wdc.com, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa2d.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B412=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=B8=80 20:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Nov 30, 2022 at 10:24:10AM +0800, Sam Li wrote:
> > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=883=
0=E6=97=A5=E5=91=A8=E4=B8=89 10:01=E5=86=99=E9=81=93=EF=BC=9A
> > > On Thu, 27 Oct 2022 at 11:46, Sam Li <faithilikerun@gmail.com> wrote:
> > > > @@ -1374,9 +1428,11 @@ static int hdev_probe_blocksizes(BlockDriver=
State *bs, BlockSizes *bsz)
> > > >      int ret;
> > > >
> > > >      /* If DASD, get blocksizes */
> > > > +#ifndef CONFIG_BLKZONED
> > > >      if (check_for_dasd(s->fd) < 0) {
> > > >          return -ENOTSUP;
> > > >      }
> > > > +#endif
> > >
> > > What is the purpose of this #ifndef? .bdrv_probe_blocksizes() should
> > > only return block sizes for s390 DASD devices. I don't think zoned
> > > storage needs block size probing here.
> >
> > Zoned storage needs to be virtualized with the correct physical block
> > size and logical block size. And the probing here can guarantee that.
> > Or virtio-blk may send wrong block size to the guest. If manually set
> > block size in the command line as before, it is somewhat inaccurate.
>
> I see. I/O won't work if the guest block size differs from the physical
> zoned device's block size.
>
> However, we must not do this for regular host_device BlockDriverStates.
> The block size is manually controlled from those devices and defaults to
> 512B. That way the blocksize doesn't change across live migration and
> break the guest.
>
> Please use a run-time check instead of an #ifdef. Only probe blocksizes
> for dasd and zoned devices.

I see. Like this?

#ifndef CONFIG_BLKZONED
static int hdev_probe_zbd_blocksizes(BlockDriverState *bs, BlockSizes *bsz)=
{
    int ret;
    /* check zbd */
    ...
    /* probe zbd */
    ....    }
+#endif

