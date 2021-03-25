Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C82B349647
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:03:04 +0100 (CET)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSRq-0000L3-K6
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lPSEl-0007o9-Bz
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lPSEg-0005bv-S8
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616687365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UXDN6eI2n30MHOaTQbobqnIxWeCSOmaP/Hb1rEypgPI=;
 b=Zc7IJgVd5IV3R3/+6/+FenFNZK2lSye9uvRjc1HepWjh83aQY2abmZS8e2x+uwBkcNELee
 giYSrFXlVKEKeO+gHzJc/d1o0u/2RarOPgmJNWgNES0Yvn1oMkzsNxNZoslbNI0OxeyBIc
 oKKOh3itblUQ/y2BzQpCa2xc2KMLH9s=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-hbR69db0NQi-9lNdGCmz2w-1; Thu, 25 Mar 2021 11:49:17 -0400
X-MC-Unique: hbR69db0NQi-9lNdGCmz2w-1
Received: by mail-oi1-f198.google.com with SMTP id p203so1989052oif.17
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXDN6eI2n30MHOaTQbobqnIxWeCSOmaP/Hb1rEypgPI=;
 b=cgsQU9nqYUlmeQawBEDr/rw34knMkcl0ZKBxKr0qd2mzf+eZafPtjYaa3y5YuiE5ye
 MHdctae2MZsRWMtplxNxyo3u511rrrjoAuf0y3g+F//u5kKVgNfDXKH+Ww+R29iepQL/
 pRuiF6dqQrZNjtwtmWwhoyTUok2lodZX3gTRj3F0ASgiyqcgPwEQCCEg9DMAGvhMkofN
 DcQNa7lJ0mSIZv4Ajod20ejFYAqwwgmv1i9NajnABznahFYO7CLq4zwDfjouskBAGfUD
 AX/hQFG7GrBT8g89zqqkIzbABewHSPmmSwXFwzNl22tQ2hwXwX/MvxVJkRGwciegtkn6
 yFgA==
X-Gm-Message-State: AOAM532vCjS7FZb1wEFvCUPNtIexrPMyE6LIj8aIpOH3slNTngoB+Fk0
 FtVGVHxLc3sr46rFLE9QfwFyCG3CkL7NbT1l7DRRMkaBW++7qwMcTI2QAhS0OvaseRkzRtuGWLu
 MielKpgZm24daoIx2sT2hCimDMU0MZ4I=
X-Received: by 2002:aca:d884:: with SMTP id p126mr6630817oig.118.1616687354389; 
 Thu, 25 Mar 2021 08:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1dW3ySuC3Mctc3nGTML7wJzdS+GznTkU3KQ9UZ2Pj6NnGFPPQdAs1M6hFPZS37JAsfWGTxyvEGhDCyGme8ss=
X-Received: by 2002:aca:d884:: with SMTP id p126mr6630802oig.118.1616687354079; 
 Thu, 25 Mar 2021 08:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <2021032217253258728710@chinatelecom.cn>
 <0b01a688-f86b-0888-2c03-f4d55273b93f@redhat.com>
 <CAMRbyysT_s+AkskuAGvT7wXOQ+LaX3OkSYTo4UxtYKqE0cjBMg@mail.gmail.com>
 <2021032514064808224635@chinatelecom.cn>
In-Reply-To: <2021032514064808224635@chinatelecom.cn>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 25 Mar 2021 17:48:57 +0200
Message-ID: <CAMRbyyuuWLjKrCXAu5iRYSn5hV_0bytMy1JtjFuuU1aeFZVGqw@mail.gmail.com>
Subject: Re: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd,
 BLKZEROOUT, range) on block
To: ChangLimin <changlm@chinatelecom.cn>,
 Benjamin Marzinski <bmarzins@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000074022d05be5e5b42"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01,
 WEIRD_PORT=0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000074022d05be5e5b42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 8:07 AM ChangLimin <changlm@chinatelecom.cn> wrote:

> >On Wed, Mar 24, 2021 at 4:52 PM Max Reitz <mreitz@redhat.com> wrote:
> >On 22.03.21 10:25, ChangLimin wrote:
> >> For Linux 5.10/5.11, qemu write zeros to a multipath device using
> >> ioctl(fd, BLKZEROOUT, range) with cache none or directsync return -EBU=
SY
> >> permanently.
> >
> >So as far as I can track back the discussion, Kevin asked on v1 why we=
=E2=80=99d
> >set has_write_zeroes to false, i.e. whether the EBUSY might not go away
> >at some point, and if it did, whether we shouldn=E2=80=99t retry BLKZERO=
OUT then.
> >You haven=E2=80=99t explicitly replied to that question (as far as I can=
 see),
> >so it kind of still stands.
> >
> >Implicitly, there are two conflicting answers in this patch: On one
> >hand, the commit message says =E2=80=9Cpermanently=E2=80=9D, and this is=
 what you told
> >Nir as a realistic case where this can occur.
>
> For Linux 5.10/5.11, the EBUSY is permanently, the reproduce step is
> below.
> For other Linux version, the EBUSY may be temporary.
> Because  Linux 5.10/5.11 is not used widely, so do not set has_write_zero=
es
> to false.
>
> >I'm afraid ChangLimin did not answer my question. I'm looking for real
> >world used case when qemu cannot write zeros to multipath device, when
> >nobody else is using the device.
> >
> >I tried to reproduce this on Fedora (kernel 5.10) with qemu-img convert,
> >once with a multipath device, and once with logical volume on a vg creat=
ed
> >on the multipath device, and I could not reproduce this issue.
>
> The following is steps to reproduct the issue on Fedora 34.
>
> # uname -a
> Linux fedora-34 5.11.3-300.fc34.x86_64 #1 SMP Thu Mar 4 19:03:18 UTC 2021
> x86_64 x86_64 x86_64 GNU/Linux
>

Is this the most recent kernel? I have 5.11.7 in fedora 32.


>
> # qemu-img -V
> qemu-img version 5.2.0 (qemu-5.2.0-5.fc34.1)
>
> 1.  Login in an ISCSI LUN created using targetcli on ubuntu 20.04
> # iscsiadm -m discovery -t st -p 192.169.1.109
> 192.169.1.109:3260,1 iqn.2003-01.org.linux-iscsi:lio-lv100
>
> # iscsiadm -m node -l -T iqn.2003-01.org.linux-iscsi:lio-lv100
> # iscsiadm -m session
> tcp: [1] 192.169.1.109:3260,1 iqn.2003-01.org.linux-iscsi:lio-lv100
> (non-flash)
>
> 2. start multipathd service
> # mpathconf --enable
> # systemctl start multipathd
>
> 3.  add multipath path
> # multipath -a `/lib/udev/scsi_id -g /dev/sdb`   # sdb means the ISCSI LU=
N
> wwid '36001405b76856e4816b48b99c6a77de3' added
>
> # multipathd add path /dev/sdb
> ok
>
> # multipath -ll     # /dev/dm-1 is the multipath device based on /dev/sdb
> mpatha (36001405bebfc3a0522541cda30220db9) dm-1 LIO-ORG,lv102
> size=3D1.0G features=3D'0' hwhandler=3D'1 alua' wp=3Drw
> `-+- policy=3D'service-time 0' prio=3D50 status=3Dactive
>   `- 5:0:0:0  sdd  8:48   active ready running
>

You are using user_friendly_names which is (sadly) the default.
But I don't think it should matter.

4. qemu-img return EBUSY both to dm-1 and sdb
> # wget http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.im=
g
> # qemu-img convert -O raw -t none cirros-0.4.0-x86_64-disk.img /dev/dm-1
> qemu-img: error while writing at byte 0: Device or resource busy
>
> # qemu-img convert -O raw -t none cirros-0.4.0-x86_64-disk.img /dev/sdb
> qemu-img: error while writing at byte 0: Device or resource busy
>
> 5. blkdiscard also return EBUSY  both to dm-1 and sdb
> # blkdiscard -o 0 -l 4096 /dev/dm-1
> blkdiscard: cannot open /dev/dm-1: Device or resource busy
>
> # blkdiscard -o 0 -l 4096 /dev/sdb
> blkdiscard: cannot open /dev/sdb: No such file or directory
>
> 6. dd write zero is good, because it does not use blkdiscard
> # dd if=3D/dev/zero of=3D/dev/dm-1 bs=3D1M count=3D100 oflag=3Ddirect
> 100+0 records in
> 100+0 records out
> 104857600 bytes (105 MB, 100 MiB) copied, 2.33623 s, 44.9 MB/s
>
> 7. The LUN should support blkdiscard feature, otherwise it will not write
> zero
> with  ioctl(fd, BLKZEROOUT, range)
>

Thanks!

I could not reproduce this with kernel 5.10, but now I'm no 5.11:
# uname -r
5.11.7-100.fc32.x86_64

# qemu-img --version
qemu-img version 5.2.0 (qemu-5.2.0-6.fc32.1)
Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers

# cat /etc/multipath.conf
defaults {
user_friendly_names no
find_multipaths no
}

blacklist_exceptions {
        property "(SCSI_IDENT_|ID_WWN)"
}

blacklist {
}

# multipath -ll 36001405e884ab8ff4b44fdba6901099c
36001405e884ab8ff4b44fdba6901099c dm-8 LIO-ORG,3-09
size=3D6.0G features=3D'0' hwhandler=3D'1 alua' wp=3Drw
`-+- policy=3D'service-time 0' prio=3D50 status=3Dactive
  `- 1:0:0:9 sdk     8:160 active ready running

$ lsblk /dev/sdk
NAME                                MAJ:MIN RM SIZE RO TYPE  MOUNTPOINT
sdk                                   8:160  0   6G  0 disk
=E2=94=94=E2=94=8036001405e884ab8ff4b44fdba6901099c 253:13   0   6G  0 mpat=
h

$ virt-builder fedora-32 -o disk.img
[   2.9] Downloading: http://builder.libguestfs.org/fedora-32.xz
[   3.8] Planning how to build this image
[   3.8] Uncompressing
[  11.1] Opening the new disk
[  16.1] Setting a random seed
[  16.1] Setting passwords
virt-builder: Setting random password of root to TcikQqRxAaIqS1kF
[  17.0] Finishing off
                   Output file: disk.img
                   Output size: 6.0G
                 Output format: raw
            Total usable space: 5.4G
                    Free space: 4.0G (74%)

$ qemu-img info disk.img
image: disk.img
file format: raw
virtual size: 6 GiB (6442450944 bytes)
disk size: 1.29 GiB

# qemu-img convert -p -f raw -O raw -t none -T none disk.img
/dev/mapper/36001405e884ab8ff4b44fdba6901099c
    (100.00/100%)

Works.

# lsblk /dev/sdk
NAME                                   MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sdk                                      8:160  0    6G  0 disk
=E2=94=94=E2=94=8036001405e884ab8ff4b44fdba6901099c    253:13   0    6G  0 =
mpath
  =E2=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c1 253:14   0    1M  0 =
part
  =E2=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c2 253:15   0    1G  0 =
part
  =E2=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c3 253:16   0  615M  0 =
part
  =E2=94=94=E2=94=8036001405e884ab8ff4b44fdba6901099c4 253:17   0  4.4G  0 =
part

# qemu-img convert -p -f raw -O raw -t none -T none disk.img
/dev/mapper/36001405e884ab8ff4b44fdba6901099c
    (100.00/100%)

Works, wiping the partitions.

# mount /dev/mapper/36001405e884ab8ff4b44fdba6901099c4 /tmp/mnt

# mount | grep /dev/mapper/36001405e884ab8ff4b44fdba6901099c4
/dev/mapper/36001405e884ab8ff4b44fdba6901099c4 on /tmp/mnt type xfs
(rw,relatime,seclabel,attr2,inode64,logbufs=3D8,logbsize=3D32k,noquota)

This is invalid use, converting to device with mounted file system, but
let's try:

# qemu-img convert -p -f raw -O raw -t none -T none disk.img
/dev/mapper/36001405e884ab8ff4b44fdba6901099c
    (100.00/100%)

Still works?!

# wipefs -a /dev/mapper/36001405e884ab8ff4b44fdba6901099c
wipefs: error: /dev/mapper/36001405e884ab8ff4b44fdba6901099c: probing
initialization failed: Device or resource busy

# blkdiscard /dev/mapper/36001405e884ab8ff4b44fdba6901099c

Works.

This the configuration of the LUN on the server side:

   {

      "aio": false,

      "alua_tpgs": [

        {

          "alua_access_state": 0,

          "alua_access_status": 0,

          "alua_access_type": 3,

          "alua_support_active_nonoptimized": 1,

          "alua_support_active_optimized": 1,

          "alua_support_offline": 1,

          "alua_support_standby": 1,

          "alua_support_transitioning": 1,

          "alua_support_unavailable": 1,

          "alua_write_metadata": 0,

          "implicit_trans_secs": 0,

          "name": "default_tg_pt_gp",

          "nonop_delay_msecs": 100,

          "preferred": 0,

          "tg_pt_gp_id": 0,

          "trans_delay_msecs": 0

        }

      ],

      "attributes": {

        "block_size": 512,

        "emulate_3pc": 1,

        "emulate_caw": 1,

        "emulate_dpo": 1,

        "emulate_fua_read": 1,

        "emulate_fua_write": 1,

        "emulate_model_alias": 1,

        "emulate_pr": 1,

        "emulate_rest_reord": 0,

        "emulate_tas": 1,

        "emulate_tpu": 1,

        "emulate_tpws": 1,

        "emulate_ua_intlck_ctrl": 0,

        "emulate_write_cache": 1,

        "enforce_pr_isids": 1,

        "force_pr_aptpl": 0,

        "is_nonrot": 0,

        "max_unmap_block_desc_count": 1,

        "max_unmap_lba_count": 8192,

        "max_write_same_len": 65335,

        "optimal_sectors": 16384,

        "pi_prot_format": 0,

        "pi_prot_type": 0,

        "pi_prot_verify": 0,

        "queue_depth": 128,

        "unmap_granularity": 1,

        "unmap_granularity_alignment": 0,

        "unmap_zeroes_data": 0

      },

      "dev": "/target/3/09",

      "name": "3-09",

      "plugin": "fileio",

      "size": 6442450944,

      "write_back": true,

      "wwn": "e884ab8f-f4b4-4fdb-a690-1099c072c86d"

    },


Maybe this upstream change is not in all downstream 5.11 kernels, or 5.11.7
already includes the fix?

Adding Ben, maybe he had more insight on the multipath side.

>If I understand the kernel change correctly, this can happen when there is
> >a mounted file system on top of the multipath device. I don't think we
> have
> >a use case when qemu accesses a multipath device when the device is used
> >by a file system, but maybe I missed something.
> >
> >So that to me implies
> >that we actually should not retry BLKZEROOUT, because the EBUSY will
> >remain, and that condition won=E2=80=99t change while the block device i=
s in use
> >by qemu.
> >
> >On the other hand, in the code, you have decided not to reset
> >has_write_zeroes to false, so the implementation will retry.
> >
> >EBUSY is usually a temporary error, so retrying makes sense. The questio=
n
> >is if we really can write zeroes manually in this case?
> >
> >So I don=E2=80=99t quite understand.  Should we keep trying BLKZEROOUT o=
r is
> >there no chance of it working after it has at one point failed with
> >EBUSY?  (Are there other cases besides what=E2=80=99s described in this =
commit
> >message where EBUSY might be returned and it is only temporary?)
> >
> >> Fallback to pwritev instead of exit for -EBUSY error.
> >>
> >> The issue was introduced in Linux 5.10:
> >>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02
> >>
> >> Fixed in Linux 5.12:
> >>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d
> >>
> >> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
> >> ---
> >>   block/file-posix.c | 8 ++++++--
> >>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/block/file-posix.c b/block/file-posix.c
> >> index 20e14f8e96..d4054ac9cb 100644
> >> --- a/block/file-posix.c
> >> +++ b/block/file-posix.c
> >> @@ -1624,8 +1624,12 @@ static ssize_t
> >> handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
> >>           } while (errno =3D=3D EINTR);
> >>
> >>           ret =3D translate_err(-errno);
> >> -        if (ret =3D=3D -ENOTSUP) {
> >> -            s->has_write_zeroes =3D false;
> >> +        switch (ret) {
> >> +        case -ENOTSUP:
> >> +            s->has_write_zeroes =3D false; /* fall through */
> >> +        case -EBUSY: /* Linux 5.10/5.11 may return -EBUSY for
> multipath
> >> devices */
> >> +            return -ENOTSUP;
> >> +            break;
> >
> >(Not sure why this break is here.)
> >
> >Max
> >
> >>           }
> >>       }
> >>   #endif
> >> --
> >> 2.27.0
> >>
>
>

--00000000000074022d05be5e5b42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgODow
NyBBTSBDaGFuZ0xpbWluICZsdDs8YSBocmVmPSJtYWlsdG86Y2hhbmdsbUBjaGluYXRlbGVjb20u
Y24iPmNoYW5nbG1AY2hpbmF0ZWxlY29tLmNuPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj48ZGl2PiZndDtPbiBXZWQsIE1hciAyNCwg
MjAyMSBhdCA0OjUyIFBNIE1heCBSZWl0eiAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1yZWl0ekByZWRo
YXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+bXJlaXR6QHJlZGhhdC5jb208L2E+Jmd0OyB3cm90ZTo8
L2Rpdj48ZGl2PiZndDtPbiAyMi4wMy4yMSAxMDoyNSwgQ2hhbmdMaW1pbiB3cm90ZTo8L2Rpdj48
ZGl2PiZndDsmZ3Q7IEZvciBMaW51eCA1LjEwLzUuMTEsIHFlbXUgd3JpdGUgemVyb3MgdG8gYSBt
dWx0aXBhdGggZGV2aWNlIHVzaW5nPC9kaXY+PGRpdj4mZ3Q7Jmd0OyBpb2N0bChmZCwgQkxLWkVS
T09VVCwgcmFuZ2UpIHdpdGggY2FjaGUgbm9uZSBvciBkaXJlY3RzeW5jIHJldHVybiAtRUJVU1k8
L2Rpdj48ZGl2PiZndDsmZ3Q7IHBlcm1hbmVudGx5LjwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+
Jmd0O1NvIGFzIGZhciBhcyBJIGNhbiB0cmFjayBiYWNrIHRoZSBkaXNjdXNzaW9uLCBLZXZpbiBh
c2tlZCBvbiB2MSB3aHkgd2XigJlkwqA8L2Rpdj48ZGl2PiZndDtzZXQgaGFzX3dyaXRlX3plcm9l
cyB0byBmYWxzZSwgaS5lLiB3aGV0aGVyIHRoZSBFQlVTWSBtaWdodCBub3QgZ28gYXdhecKgPC9k
aXY+PGRpdj4mZ3Q7YXQgc29tZSBwb2ludCwgYW5kIGlmIGl0IGRpZCwgd2hldGhlciB3ZSBzaG91
bGRu4oCZdCByZXRyeSBCTEtaRVJPT1VUIHRoZW4uPC9kaXY+PGRpdj4mZ3Q7WW91IGhhdmVu4oCZ
dCBleHBsaWNpdGx5IHJlcGxpZWQgdG8gdGhhdCBxdWVzdGlvbiAoYXMgZmFyIGFzIEkgY2FuIHNl
ZSkswqA8L2Rpdj48ZGl2PiZndDtzbyBpdCBraW5kIG9mIHN0aWxsIHN0YW5kcy48L2Rpdj48ZGl2
PiZndDs8L2Rpdj48ZGl2PiZndDtJbXBsaWNpdGx5LCB0aGVyZSBhcmUgdHdvIGNvbmZsaWN0aW5n
IGFuc3dlcnMgaW4gdGhpcyBwYXRjaDogT24gb25lwqA8L2Rpdj48ZGl2PiZndDtoYW5kLCB0aGUg
Y29tbWl0IG1lc3NhZ2Ugc2F5cyDigJxwZXJtYW5lbnRseeKAnSwgYW5kIHRoaXMgaXMgd2hhdCB5
b3UgdG9sZMKgPC9kaXY+PGRpdj4mZ3Q7TmlyIGFzIGEgcmVhbGlzdGljIGNhc2Ugd2hlcmUgdGhp
cyBjYW4gb2NjdXIuwqA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkZvciBMaW51eCA1LjEwLzUu
MTEsIHRoZSBFQlVTWSBpcyBwZXJtYW5lbnRseSwgdGhlIHJlcHJvZHVjZSBzdGVwIGlzIGJlbG93
LsKgPC9kaXY+PGRpdj5Gb3Igb3RoZXIgTGludXggdmVyc2lvbizCoDxzcGFuIHN0eWxlPSJsaW5l
LWhlaWdodDoxLjU7YmFja2dyb3VuZC1jb2xvcjp0cmFuc3BhcmVudCI+dGhlIEVCVVNZIG1heSBi
ZcKgdGVtcG9yYXJ5LsKgPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0
OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij5CZWNhdXNlwqA8L3NwYW4+PHNwYW4g
c3R5bGU9ImxpbmUtaGVpZ2h0OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij7CoDwv
c3Bhbj48c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41O2JhY2tncm91bmQtY29sb3I6dHJhbnNw
YXJlbnQiPkxpbnV4IDUuMTAvNS4xMSBpcyBub3QgdXNlZCB3aWRlbHkswqA8L3NwYW4+PHNwYW4g
c3R5bGU9ImxpbmUtaGVpZ2h0OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij5zbyBk
byBub3Qgc2V0wqA8L3NwYW4+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNTtiYWNrZ3JvdW5k
LWNvbG9yOnRyYW5zcGFyZW50Ij5oYXNfd3JpdGVfemVyb2VzIHRvIGZhbHNlLjwvc3Bhbj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PiZndDtJJiMzOTttIGFmcmFpZCBDaGFuZ0xpbWluIGRpZCBu
b3QgYW5zd2VyIG15IHF1ZXN0aW9uLiBJJiMzOTttIGxvb2tpbmcgZm9yIHJlYWw8L2Rpdj48ZGl2
PiZndDt3b3JsZCB1c2VkIGNhc2Ugd2hlbiBxZW11IGNhbm5vdCB3cml0ZSB6ZXJvcyB0byBtdWx0
aXBhdGggZGV2aWNlLCB3aGVuPC9kaXY+PGRpdj4mZ3Q7bm9ib2R5IGVsc2UgaXMgdXNpbmcgdGhl
IGRldmljZS48L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDtJIHRyaWVkIHRvIHJlcHJvZHVj
ZSB0aGlzIG9uIEZlZG9yYSAoa2VybmVsIDUuMTApIHdpdGggcWVtdS1pbWcgY29udmVydCw8L2Rp
dj48ZGl2PiZndDtvbmNlIHdpdGggYSBtdWx0aXBhdGggZGV2aWNlLCBhbmQgb25jZSB3aXRoIGxv
Z2ljYWwgdm9sdW1lIG9uIGEgdmcgY3JlYXRlZDwvZGl2PjxkaXY+Jmd0O29uIHRoZSBtdWx0aXBh
dGggZGV2aWNlLCBhbmQgSSBjb3VsZCBub3QgcmVwcm9kdWNlIHRoaXMgaXNzdWUuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj48ZGl2PlRoZSBmb2xsb3dpbmcgaXMgc3RlcHMgdG8gcmVwcm9kdWN0
IHRoZSBpc3N1ZSBvbiBGZWRvcmEgMzQuPC9kaXY+PGRpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMg
dW5hbWUgLWE8L2Rpdj48ZGl2PkxpbnV4IGZlZG9yYS0zNCA1LjExLjMtMzAwLmZjMzQueDg2XzY0
ICMxIFNNUCBUaHUgTWFyIDQgMTk6MDM6MTggVVRDIDIwMjEgeDg2XzY0IHg4Nl82NCB4ODZfNjQg
R05VL0xpbnV4PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwv
ZGl2PjxkaXY+SXMgdGhpcyB0aGUgbW9zdCByZWNlbnQga2VybmVsPyBJIGhhdmUgNS4xMS43IGlu
IGZlZG9yYSAzMi48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXY+PGRpdj48ZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+IyBxZW11LWltZyAtVjwvZGl2PjxkaXY+cWVtdS1pbWcgdmVyc2lvbiA1
LjIuMCAocWVtdS01LjIuMC01LmZjMzQuMSk8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PjEuwqAgTG9naW4gaW4gYW4gSVNDU0kgTFVOIGNyZWF0ZWQgdXNpbmcgdGFyZ2V0Y2xpIG9uIHVi
dW50dSAyMC4wNDwvZGl2PjxkaXY+IyBpc2NzaWFkbSAtbSBkaXNjb3ZlcnkgLXQgc3QgLXAgMTky
LjE2OS4xLjEwOTwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cDovLzE5Mi4xNjkuMS4xMDk6MzI2MCIg
dGFyZ2V0PSJfYmxhbmsiPjE5Mi4xNjkuMS4xMDk6MzI2MDwvYT4sMSBpcW4uMjAwMy0wMS5vcmcu
bGludXgtaXNjc2k6bGlvLWx2MTAwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4jIGlzY3NpYWRt
IC1tIG5vZGUgLWwgLVTCoDxzcGFuIHN0eWxlPSJsaW5lLWhlaWdodDoxLjU7YmFja2dyb3VuZC1j
b2xvcjp0cmFuc3BhcmVudCI+aXFuLjIwMDMtMDEub3JnLmxpbnV4LWlzY3NpOmxpby1sdjEwMDwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50
Ij48ZGl2PiMgaXNjc2lhZG0gLW0gc2Vzc2lvbjwvZGl2PjxkaXY+dGNwOiBbMV0gPGEgaHJlZj0i
aHR0cDovLzE5Mi4xNjkuMS4xMDk6MzI2MCIgdGFyZ2V0PSJfYmxhbmsiPjE5Mi4xNjkuMS4xMDk6
MzI2MDwvYT4sMSBpcW4uMjAwMy0wMS5vcmcubGludXgtaXNjc2k6bGlvLWx2MTAwIChub24tZmxh
c2gpPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9Imxp
bmUtaGVpZ2h0OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij4yLiBzdGFydCBtdWx0
aXBhdGhkIHNlcnZpY2U8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1j
b2xvcjp0cmFuc3BhcmVudCI+IyBtcGF0aGNvbmbCoDwvc3Bhbj48c3BhbiBzdHlsZT0iYmFja2dy
b3VuZC1jb2xvcjp0cmFuc3BhcmVudCI+LS1lbmFibGU8L3NwYW4+PC9kaXY+PGRpdj4jIHN5c3Rl
bWN0bCBzdGFydCBtdWx0aXBhdGhkPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4zLiDCoGFkZCBt
dWx0aXBhdGggcGF0aDwvZGl2PjxkaXY+PGRpdj4jIG11bHRpcGF0aCAtYSBgL2xpYi91ZGV2L3Nj
c2lfaWQgLWcgL2Rldi9zZGJgIMKgICMgc2RiIG1lYW5zIHRoZSBJU0NTSSBMVU48L2Rpdj48ZGl2
Pnd3aWQgJiMzOTszNjAwMTQwNWI3Njg1NmU0ODE2YjQ4Yjk5YzZhNzdkZTMmIzM5OyBhZGRlZDwv
ZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdj4jIG11bHRpcGF0aGQgYWRkIHBhdGgg
L2Rldi9zZGI8L2Rpdj48ZGl2Pm9rPC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2
PiMgbXVsdGlwYXRoIC1sbCDCoCDCoCAjIC9kZXYvZG0tMSBpcyB0aGUgbXVsdGlwYXRoIGRldmlj
ZSBiYXNlZCBvbiAvZGV2L3NkYjwvZGl2PjxkaXY+bXBhdGhhICgzNjAwMTQwNWJlYmZjM2EwNTIy
NTQxY2RhMzAyMjBkYjkpIGRtLTEgTElPLU9SRyxsdjEwMjwvZGl2PjxkaXY+c2l6ZT0xLjBHIGZl
YXR1cmVzPSYjMzk7MCYjMzk7IGh3aGFuZGxlcj0mIzM5OzEgYWx1YSYjMzk7IHdwPXJ3PC9kaXY+
PGRpdj5gLSstIHBvbGljeT0mIzM5O3NlcnZpY2UtdGltZSAwJiMzOTsgcHJpbz01MCBzdGF0dXM9
YWN0aXZlPC9kaXY+PGRpdj7CoCBgLSA1OjA6MDowIMKgc2RkIMKgODo0OCDCoCBhY3RpdmUgcmVh
ZHkgcnVubmluZzwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48
L2Rpdj48ZGl2PllvdSBhcmUgdXNpbmcgdXNlcl9mcmllbmRseV9uYW1lcyB3aGljaCBpcyAoc2Fk
bHkpIHRoZSBkZWZhdWx0LjwvZGl2PjxkaXY+QnV0IEkgZG9uJiMzOTt0IHRoaW5rIGl0IHNob3Vs
ZCBtYXR0ZXIuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXY+PGRpdj48ZGl2PjQuIHFl
bXUtaW1nIHJldHVybiBFQlVTWSBib3RoIHRvIGRtLTEgYW5kIHNkYjwvZGl2PjxkaXY+IyB3Z2V0
wqA8YSBocmVmPSJodHRwOi8vZG93bmxvYWQuY2lycm9zLWNsb3VkLm5ldC8wLjQuMC9jaXJyb3Mt
MC40LjAteDg2XzY0LWRpc2suaW1nIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2Rvd25sb2FkLmNp
cnJvcy1jbG91ZC5uZXQvMC40LjAvY2lycm9zLTAuNC4wLXg4Nl82NC1kaXNrLmltZzwvYT48L2Rp
dj48ZGl2PiMgcWVtdS1pbWcgY29udmVydCAtTyByYXcgLXQgbm9uZcKgPHNwYW4gc3R5bGU9Imxp
bmUtaGVpZ2h0OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij5jaXJyb3MtMC40LjAt
eDg2XzY0LWRpc2suaW1nIC9kZXYvZG0tMTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJi
YWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij5xZW11LWltZzogZXJyb3Igd2hpbGUgd3JpdGlu
ZyBhdCBieXRlIDA6IERldmljZSBvciByZXNvdXJjZSBidXN5PC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6dHJhbnNwYXJlbnQiPjxicj48L3NwYW4+PC9kaXY+
PGRpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjp0cmFuc3BhcmVudCI+PGRpdj4jIHFl
bXUtaW1nIGNvbnZlcnQgLU8gcmF3IC10IG5vbmUgY2lycm9zLTAuNC4wLXg4Nl82NC1kaXNrLmlt
ZyAvZGV2L3NkYjwvZGl2PjxkaXY+cWVtdS1pbWc6IGVycm9yIHdoaWxlIHdyaXRpbmcgYXQgYnl0
ZSAwOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTwvZGl2PjxkaXY+PGJyPjwvZGl2Pjwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij41LiBi
bGtkaXNjYXJkIGFsc28gcmV0dXJuIEVCVVNZwqA8L3NwYW4+PHNwYW4gc3R5bGU9ImxpbmUtaGVp
Z2h0OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij7CoDwvc3Bhbj48c3BhbiBzdHls
ZT0ibGluZS1oZWlnaHQ6MS41O2JhY2tncm91bmQtY29sb3I6dHJhbnNwYXJlbnQiPmJvdGggdG8g
ZG0tMSBhbmQgc2RiPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29s
b3I6dHJhbnNwYXJlbnQiPiMgYmxrZGlzY2FyZCAtbyAwIC1sIDQwOTYgL2Rldi9kbS0xPC9zcGFu
PjwvZGl2PjxkaXY+YmxrZGlzY2FyZDogY2Fubm90IG9wZW4gL2Rldi9kbS0xOiBEZXZpY2Ugb3Ig
cmVzb3VyY2UgYnVzeTwvZGl2PjwvZGl2PjxkaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4jIGJsa2Rp
c2NhcmQgLW8gMCAtbCA0MDk2IC9kZXYvc2RiPC9kaXY+PGRpdj5ibGtkaXNjYXJkOiBjYW5ub3Qg
b3BlbiAvZGV2L3M8c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41O2JhY2tncm91bmQtY29sb3I6
dHJhbnNwYXJlbnQiPmRiOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5PC9zcGFuPjwvZGl2Pjwv
ZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRy
YW5zcGFyZW50Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0
OjEuNTtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50Ij42LiBkZCB3cml0ZSB6ZXJvIGlzIGdv
b2QsIGJlY2F1c2UgaXQgZG9lcyBub3QgdXNlIGJsa2Rpc2NhcmQ8L3NwYW4+PC9kaXY+PGRpdj48
c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjp0cmFuc3BhcmVudCI+IyBkZCBpZj0vZGV2L3pl
cm8gb2Y9L2Rldi9kbS0xIGJzPTFNIGNvdW50PTEwMCBvZmxhZz1kaXJlY3TCoDwvc3Bhbj48L2Rp
dj48ZGl2PjEwMCswIHJlY29yZHMgaW48L2Rpdj48ZGl2PjEwMCswIHJlY29yZHMgb3V0PC9kaXY+
PGRpdj4xMDQ4NTc2MDAgYnl0ZXMgKDEwNSBNQiwgMTAwIE1pQikgY29waWVkLCAyLjMzNjIzIHMs
IDQ0LjkgTUIvczwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Ny4gVGhlIExVTsKgc2hvdWxkIHN1
cHBvcnQgYmxrZGlzY2FyZCBmZWF0dXJlLCBvdGhlcndpc2UgaXQgd2lsbCBub3Qgd3JpdGUgemVy
b8KgPC9kaXY+PGRpdj53aXRowqA8c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41O2JhY2tncm91
bmQtY29sb3I6dHJhbnNwYXJlbnQiPsKgaW9jdGwoZmQsIEJMS1pFUk9PVVQsIHJhbmdlKTwvc3Bh
bj48c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6MS41O2JhY2tncm91bmQtY29sb3I6dHJhbnNwYXJl
bnQiPsKgPC9zcGFuPjwvZGl2PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2
PlRoYW5rcyE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgY291bGQgbm90IHJlcHJvZHVjZcKg
dGhpcyB3aXRoIGtlcm5lbCA1LjEwLCBidXQgbm93IEkmIzM5O20gbm8gNS4xMTo8L2Rpdj48ZGl2
PiMgdW5hbWUgLXI8YnI+NS4xMS43LTEwMC5mYzMyLng4Nl82NDxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PiMgcWVtdS1pbWcgLS12ZXJzaW9uPGJyPnFlbXUtaW1nIHZlcnNpb24gNS4yLjAg
KHFlbXUtNS4yLjAtNi5mYzMyLjEpPGJyPkNvcHlyaWdodCAoYykgMjAwMy0yMDIwIEZhYnJpY2Ug
QmVsbGFyZCBhbmQgdGhlIFFFTVUgUHJvamVjdCBkZXZlbG9wZXJzPGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+IyBjYXQgL2V0Yy9tdWx0aXBhdGguY29uZjxicj5kZWZhdWx0cyB7PGJyPgl1
c2VyX2ZyaWVuZGx5X25hbWVzIG5vPGJyPglmaW5kX211bHRpcGF0aHMgbm88YnI+fTxicj48YnI+
YmxhY2tsaXN0X2V4Y2VwdGlvbnMgezxicj7CoCDCoCDCoCDCoCBwcm9wZXJ0eSAmcXVvdDsoU0NT
SV9JREVOVF98SURfV1dOKSZxdW90Ozxicj59PGJyPjxicj5ibGFja2xpc3Qgezxicj59PGJyPjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+IyBtdWx0aXBhdGggLWxsIDM2MDAxNDA1ZTg4NGFiOGZm
NGI0NGZkYmE2OTAxMDk5Yzxicj4zNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5OWMgZG0t
OCBMSU8tT1JHLDMtMDk8YnI+c2l6ZT02LjBHIGZlYXR1cmVzPSYjMzk7MCYjMzk7IGh3aGFuZGxl
cj0mIzM5OzEgYWx1YSYjMzk7IHdwPXJ3PGJyPmAtKy0gcG9saWN5PSYjMzk7c2VydmljZS10aW1l
IDAmIzM5OyBwcmlvPTUwIHN0YXR1cz1hY3RpdmU8YnI+wqAgYC0gMTowOjA6OSBzZGsgwqAgwqAg
ODoxNjAgYWN0aXZlIHJlYWR5IHJ1bm5pbmc8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4k
IGxzYmxrIC9kZXYvc2RrPGJyPk5BTUUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBNQUo6TUlOIFJNIFNJWkUgUk8gVFlQRSDCoE1PVU5UUE9JTlQ8YnI+c2Rr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDg6MTYw
IMKgMCDCoCA2RyDCoDAgZGlzayDCoDxicj7ilJTilIAzNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJh
NjkwMTA5OWMgMjUzOjEzIMKgIDAgwqAgNkcgwqAwIG1wYXRowqA8YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj4kIHZpcnQtYnVpbGRlciBmZWRvcmEtMzIgLW8gZGlzay5pbWc8YnI+WyDCoCAy
LjldIERvd25sb2FkaW5nOiA8YSBocmVmPSJodHRwOi8vYnVpbGRlci5saWJndWVzdGZzLm9yZy9m
ZWRvcmEtMzIueHoiPmh0dHA6Ly9idWlsZGVyLmxpYmd1ZXN0ZnMub3JnL2ZlZG9yYS0zMi54ejwv
YT48YnI+WyDCoCAzLjhdIFBsYW5uaW5nIGhvdyB0byBidWlsZCB0aGlzIGltYWdlPGJyPlsgwqAg
My44XSBVbmNvbXByZXNzaW5nPGJyPlsgwqAxMS4xXSBPcGVuaW5nIHRoZSBuZXcgZGlzazxicj5b
IMKgMTYuMV0gU2V0dGluZyBhIHJhbmRvbSBzZWVkPGJyPlsgwqAxNi4xXSBTZXR0aW5nIHBhc3N3
b3Jkczxicj52aXJ0LWJ1aWxkZXI6IFNldHRpbmcgcmFuZG9tIHBhc3N3b3JkIG9mIHJvb3QgdG8g
VGNpa1FxUnhBYUlxUzFrRjxicj5bIMKgMTcuMF0gRmluaXNoaW5nIG9mZjxicj7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoE91dHB1dCBmaWxlOiBkaXNrLmltZzxicj7CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoE91dHB1dCBzaXplOiA2LjBHPGJyPsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgT3V0cHV0IGZvcm1hdDogcmF3PGJyPsKgIMKgIMKgIMKgIMKgIMKgIFRvdGFsIHVzYWJs
ZSBzcGFjZTogNS40Rzxicj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBGcmVlIHNwYWNl
OiA0LjBHICg3NCUpPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4kIHFlbXUtaW1nIGluZm8gZGlz
ay5pbWc8YnI+aW1hZ2U6IGRpc2suaW1nPGJyPmZpbGUgZm9ybWF0OiByYXc8YnI+dmlydHVhbCBz
aXplOiA2IEdpQiAoNjQ0MjQ1MDk0NCBieXRlcyk8YnI+ZGlzayBzaXplOiAxLjI5IEdpQjxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgcWVtdS1pbWcgY29udmVydCAtcCAtZiByYXcgLU8g
cmF3IC10IG5vbmUgLVQgbm9uZSBkaXNrLmltZyAvZGV2L21hcHBlci8zNjAwMTQwNWU4ODRhYjhm
ZjRiNDRmZGJhNjkwMTA5OWM8YnI+wqAgwqAgKDEwMC4wMC8xMDAlKTxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PldvcmtzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+IyBsc2JsayAvZGV2
L3Nkazxicj5OQU1FIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIE1BSjpNSU4gUk0gwqBTSVpFIFJPIFRZUEUgwqBNT1VOVFBPSU5UPGJyPnNkayDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDg6MTYw
IMKgMCDCoCDCoDZHIMKgMCBkaXNrIMKgPGJyPuKUlOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZk
YmE2OTAxMDk5YyDCoCDCoDI1MzoxMyDCoCAwIMKgIMKgNkcgwqAwIG1wYXRoIDxicj7CoCDilJzi
lIAzNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5OWMxIDI1MzoxNCDCoCAwIMKgIMKgMU0g
wqAwIHBhcnQgwqA8YnI+wqAg4pSc4pSAMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTlj
MiAyNTM6MTUgwqAgMCDCoCDCoDFHIMKgMCBwYXJ0IMKgPGJyPsKgIOKUnOKUgDM2MDAxNDA1ZTg4
NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzMgMjUzOjE2IMKgIDAgwqA2MTVNIMKgMCBwYXJ0IMKgPGJy
PsKgIOKUlOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzQgMjUzOjE3IMKgIDAg
wqA0LjRHIMKgMCBwYXJ0wqDCoDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgcWVtdS1p
bWcgY29udmVydCAtcCAtZiByYXcgLU8gcmF3IC10IG5vbmUgLVQgbm9uZSBkaXNrLmltZyAvZGV2
L21hcHBlci8zNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5OWM8YnI+wqAgwqAgKDEwMC4w
MC8xMDAlKTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+V29ya3MsIHdpcGluZyB0
aGUgcGFydGl0aW9ucy48L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgbW91bnQgL2Rl
di9tYXBwZXIvMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljNCAvdG1wL21udDxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgbW91bnQgfCBncmVwIC9kZXYvbWFwcGVyLzM2MDAx
NDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzQ8YnI+L2Rldi9tYXBwZXIvMzYwMDE0MDVlODg0
YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljNCBvbiAvdG1wL21udCB0eXBlIHhmcyAocncscmVsYXRpbWUs
c2VjbGFiZWwsYXR0cjIsaW5vZGU2NCxsb2didWZzPTgsbG9nYnNpemU9MzJrLG5vcXVvdGEpPGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhpcyBpcyBpbnZhbGlkIHVzZSwgY29udmVydGlu
ZyB0byBkZXZpY2Ugd2l0aCBtb3VudGVkIGZpbGUgc3lzdGVtLCBidXQgbGV0JiMzOTtzIHRyeTo8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgcWVtdS1pbWcgY29udmVydCAtcCAtZiByYXcgLU8g
cmF3IC10IG5vbmUgLVQgbm9uZSBkaXNrLmltZyAvZGV2L21hcHBlci8zNjAwMTQwNWU4ODRhYjhm
ZjRiNDRmZGJhNjkwMTA5OWM8YnI+wqAgwqAgKDEwMC4wMC8xMDAlKTxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlN0aWxsIHdvcmtzPyE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgd2lw
ZWZzIC1hIC9kZXYvbWFwcGVyLzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5Yzxicj53
aXBlZnM6IGVycm9yOiAvZGV2L21hcHBlci8zNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5
OWM6IHByb2JpbmcgaW5pdGlhbGl6YXRpb24gZmFpbGVkOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVz
eTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgYmxrZGlzY2FyZCAvZGV2L21hcHBlci8z
NjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5OWM8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5Xb3Jrcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoaXMgdGhlIGNvbmZpZ3VyYXRp
b24gb2YgdGhlIExVTiBvbiB0aGUgc2VydmVyIHNpZGU6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj7CoCDCoHsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKgIMKgICZxdW90O2FpbyZxdW90OzogZmFsc2UsIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDCoCDCoCAm
cXVvdDthbHVhX3RwZ3MmcXVvdDs6IFsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgeyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgJnF1b3Q7
YWx1YV9hY2Nlc3Nfc3RhdGUmcXVvdDs6IDAsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7C
oCDCoCDCoCDCoCDCoCAmcXVvdDthbHVhX2FjY2Vzc19zdGF0dXMmcXVvdDs6IDAsIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgIMKgICZxdW90O2FsdWFfYWNjZXNzX3R5cGUm
cXVvdDs6IDMsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgIMKgICZx
dW90O2FsdWFfc3VwcG9ydF9hY3RpdmVfbm9ub3B0aW1pemVkJnF1b3Q7OiAxLCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDC
oCDCoCDCoCDCoCAmcXVvdDthbHVhX3N1cHBvcnRfYWN0aXZlX29wdGltaXplZCZxdW90OzogMSwg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgPGJyPsKgIMKgIMKgIMKgIMKgICZxdW90O2FsdWFfc3VwcG9ydF9vZmZsaW5lJnF1b3Q7
OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCDCoCAmcXVvdDthbHVhX3N1
cHBvcnRfc3RhbmRieSZxdW90OzogMSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAg
wqAgwqAgJnF1b3Q7YWx1YV9zdXBwb3J0X3RyYW5zaXRpb25pbmcmcXVvdDs6IDEsIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgPGJyPsKgIMKgIMKgIMKgIMKgICZxdW90O2FsdWFfc3VwcG9ydF91bmF2YWlsYWJsZSZxdW90
OzogMSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgwqAgJnF1b3Q7YWx1YV93cml0ZV9t
ZXRhZGF0YSZxdW90OzogMCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKgIMKgIMKgIMKg
ICZxdW90O2ltcGxpY2l0X3RyYW5zX3NlY3MmcXVvdDs6IDAsIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IDxicj7CoCDCoCDCoCDCoCDCoCAmcXVvdDtuYW1lJnF1b3Q7OiAmcXVvdDtkZWZhdWx0X3RnX3B0
X2dwJnF1b3Q7LCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAgJnF1b3Q7bm9u
b3BfZGVsYXlfbXNlY3MmcXVvdDs6IDEwMCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKg
IMKgIMKgIMKgICZxdW90O3ByZWZlcnJlZCZxdW90OzogMCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKgIMKgIMKgIMKgICZxdW90O3RnX3B0X2dwX2lkJnF1b3Q7
OiAwLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgwqAg
JnF1b3Q7dHJhbnNfZGVsYXlfbXNlY3MmcXVvdDs6IDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqA8YnI+wqAgwqAgwqAgwqAgfSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgXSwgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAg
JnF1b3Q7YXR0cmlidXRlcyZxdW90OzogeyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgJnF1b3Q7YmxvY2tfc2l6ZSZxdW90OzogNTEyLCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCAmcXVvdDtl
bXVsYXRlXzNwYyZxdW90OzogMSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
PGJyPsKgIMKgIMKgIMKgICZxdW90O2VtdWxhdGVfY2F3JnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgJnF1b3Q7ZW11bGF0ZV9kcG8m
cXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDCoCDC
oCDCoCAmcXVvdDtlbXVsYXRlX2Z1YV9yZWFkJnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCAmcXVvdDtlbXVsYXRlX2Z1YV93cml0ZSZxdW90Ozog
MSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKgIMKgIMKgICZxdW90O2VtdWxh
dGVfbW9kZWxfYWxpYXMmcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDC
oCDCoCDCoCAmcXVvdDtlbXVsYXRlX3ByJnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCAmcXVvdDtlbXVsYXRlX3Jlc3RfcmVvcmQm
cXVvdDs6IDAsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgICZxdW90
O2VtdWxhdGVfdGFzJnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCA8YnI+wqAgwqAgwqAgwqAgJnF1b3Q7ZW11bGF0ZV90cHUmcXVvdDs6IDEsIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDCoCDCoCDCoCAmcXVvdDtlbXVsYXRlX3Rw
d3MmcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKg
IMKgIMKgICZxdW90O2VtdWxhdGVfdWFfaW50bGNrX2N0cmwmcXVvdDs6IDAsIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgICZxdW90O2VtdWxhdGVfd3JpdGVfY2FjaGUmcXVvdDs6
IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7CoCDCoCDCoCDCoCAmcXVvdDtlbmZvcmNl
X3ByX2lzaWRzJnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDC
oCDCoCDCoCAmcXVvdDtmb3JjZV9wcl9hcHRwbCZxdW90OzogMCwgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgJnF1b3Q7aXNfbm9ucm90JnF1b3Q7OiAwLCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgwqAgJnF1
b3Q7bWF4X3VubWFwX2Jsb2NrX2Rlc2NfY291bnQmcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJy
PsKgIMKgIMKgIMKgICZxdW90O21heF91bm1hcF9sYmFfY291bnQmcXVvdDs6IDgxOTIsIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgICZxdW90O21heF93cml0ZV9zYW1lX2xlbiZx
dW90OzogNjUzMzUsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKgIMKgIMKgICZxdW90O29w
dGltYWxfc2VjdG9ycyZxdW90OzogMTYzODQsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7C
oCDCoCDCoCDCoCAmcXVvdDtwaV9wcm90X2Zvcm1hdCZxdW90OzogMCwgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgwqAgJnF1b3Q7cGlfcHJvdF90eXBlJnF1b3Q7
OiAwLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDxicj7CoCDCoCDCoCDCoCAm
cXVvdDtwaV9wcm90X3ZlcmlmeSZxdW90OzogMCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqA8YnI+wqAgwqAgwqAgwqAgJnF1b3Q7cXVldWVfZGVwdGgmcXVvdDs6IDEyOCwgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKgIMKgIMKgICZxdW90O3VubWFwX2dy
YW51bGFyaXR5JnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAg
wqAgwqAgJnF1b3Q7dW5tYXBfZ3JhbnVsYXJpdHlfYWxpZ25tZW50JnF1b3Q7OiAwLCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCA8YnI+wqAgwqAgwqAgwqAgJnF1b3Q7dW5tYXBfemVyb2VzX2RhdGEmcXVvdDs6IDAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAgwqAgfSwgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8YnI+wqAgwqAg
wqAgJnF1b3Q7ZGV2JnF1b3Q7OiAmcXVvdDsvdGFyZ2V0LzMvMDkmcXVvdDssIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgPGJyPsKgIMKgIMKgICZxdW90O25hbWUmcXVvdDs6ICZxdW90
OzMtMDkmcXVvdDssIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxi
cj7CoCDCoCDCoCAmcXVvdDtwbHVnaW4mcXVvdDs6ICZxdW90O2ZpbGVpbyZxdW90OywgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKgIMKgICZxdW90O3NpemUmcXVv
dDs6IDY0NDI0NTA5NDQsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDxicj7C
oCDCoCDCoCAmcXVvdDt3cml0ZV9iYWNrJnF1b3Q7OiB0cnVlLCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCA8YnI+wqAgwqAgwqAgJnF1b3Q7d3duJnF1b3Q7OiAmcXVvdDtlODg0
YWI4Zi1mNGI0LTRmZGItYTY5MC0xMDk5YzA3MmM4NmQmcXVvdDsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPGJyPsKgIMKgIH0swqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDC
oDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk1heWJlIHRoaXMgdXBzdHJlYW0gY2hhbmdl
IGlzIG5vdCBpbiBhbGwgZG93bnN0cmVhbSA1LjExIGtlcm5lbHMsIG9yIDUuMTEuNzwvZGl2Pjxk
aXY+YWxyZWFkeSBpbmNsdWRlcyB0aGUgZml4PzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QWRk
aW5nIEJlbiwgbWF5YmUgaGUgaGFkIG1vcmUgaW5zaWdodMKgb24gdGhlIG11bHRpcGF0aCBzaWRl
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIw
NCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2PjxkaXY+Jmd0O0lmIEkgdW5kZXJzdGFu
ZCB0aGUga2VybmVsIGNoYW5nZSBjb3JyZWN0bHksIHRoaXMgY2FuIGhhcHBlbiB3aGVuIHRoZXJl
IGlzPC9kaXY+PGRpdj4mZ3Q7YSBtb3VudGVkIGZpbGUgc3lzdGVtIG9uIHRvcCBvZiB0aGUgbXVs
dGlwYXRoIGRldmljZS4gSSBkb24mIzM5O3QgdGhpbmsgd2UgaGF2ZcKgPC9kaXY+PGRpdj4mZ3Q7
YSB1c2UgY2FzZSB3aGVuIHFlbXUgYWNjZXNzZXMgYSBtdWx0aXBhdGggZGV2aWNlIHdoZW4gdGhl
IGRldmljZSBpcyB1c2VkPC9kaXY+PGRpdj4mZ3Q7YnkgYSBmaWxlIHN5c3RlbSwgYnV0IG1heWJl
IEkgbWlzc2VkIHNvbWV0aGluZy48L2Rpdj48ZGl2PiZndDvCoDwvZGl2PjxkaXY+Jmd0O1NvIHRo
YXQgdG8gbWUgaW1wbGllc8KgPC9kaXY+PGRpdj4mZ3Q7dGhhdCB3ZSBhY3R1YWxseSBzaG91bGQg
bm90IHJldHJ5IEJMS1pFUk9PVVQsIGJlY2F1c2UgdGhlIEVCVVNZIHdpbGzCoDwvZGl2PjxkaXY+
Jmd0O3JlbWFpbiwgYW5kIHRoYXQgY29uZGl0aW9uIHdvbuKAmXQgY2hhbmdlIHdoaWxlIHRoZSBi
bG9jayBkZXZpY2UgaXMgaW4gdXNlwqA8L2Rpdj48ZGl2PiZndDtieSBxZW11LjwvZGl2PjxkaXY+
Jmd0OzwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNTtiYWNrZ3JvdW5kLWNv
bG9yOnRyYW5zcGFyZW50Ij4mZ3Q7T24gdGhlIG90aGVyIGhhbmQsIGluIHRoZSBjb2RlLCB5b3Ug
aGF2ZSBkZWNpZGVkIG5vdCB0byByZXNldMKgPC9zcGFuPjwvZGl2PjxkaXY+Jmd0O2hhc193cml0
ZV96ZXJvZXMgdG8gZmFsc2UsIHNvIHRoZSBpbXBsZW1lbnRhdGlvbiB3aWxsIHJldHJ5LjwvZGl2
PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0O0VCVVNZIGlzIHVzdWFsbHkgYSB0ZW1wb3JhcnkgZXJy
b3IsIHNvIHJldHJ5aW5nIG1ha2VzIHNlbnNlLiBUaGUgcXVlc3Rpb248L2Rpdj48ZGl2PiZndDtp
cyBpZiB3ZSByZWFsbHkgY2FuIHdyaXRlIHplcm9lcyBtYW51YWxseSBpbiB0aGlzIGNhc2U/PC9k
aXY+PGRpdj4mZ3Q7wqA8L2Rpdj48ZGl2PiZndDtTbyBJIGRvbuKAmXQgcXVpdGUgdW5kZXJzdGFu
ZC7CoCBTaG91bGQgd2Uga2VlcCB0cnlpbmcgQkxLWkVST09VVCBvciBpc8KgPC9kaXY+PGRpdj4m
Z3Q7dGhlcmUgbm8gY2hhbmNlIG9mIGl0IHdvcmtpbmcgYWZ0ZXIgaXQgaGFzIGF0IG9uZSBwb2lu
dCBmYWlsZWQgd2l0aMKgPC9kaXY+PGRpdj4mZ3Q7RUJVU1k/IMKgKEFyZSB0aGVyZSBvdGhlciBj
YXNlcyBiZXNpZGVzIHdoYXTigJlzIGRlc2NyaWJlZCBpbiB0aGlzIGNvbW1pdMKgPC9kaXY+PGRp
dj4mZ3Q7bWVzc2FnZSB3aGVyZSBFQlVTWSBtaWdodCBiZSByZXR1cm5lZCBhbmQgaXQgaXMgb25s
eSB0ZW1wb3Jhcnk/KTwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OyZndDsgRmFsbGJhY2sg
dG8gcHdyaXRldiBpbnN0ZWFkIG9mIGV4aXQgZm9yIC1FQlVTWSBlcnJvci48L2Rpdj48ZGl2PiZn
dDsmZ3Q7wqA8L2Rpdj48ZGl2PiZndDsmZ3Q7IFRoZSBpc3N1ZSB3YXMgaW50cm9kdWNlZCBpbiBM
aW51eCA1LjEwOjwvZGl2PjxkaXY+Jmd0OyZndDsgPGEgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lk
PTM4NGQ4N2VmMmM5NTRmYzU4ZTZjNWZkODI1M2U0YTE5ODRmNWZlMDIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUv
bGludXguZ2l0L2NvbW1pdC8/aWQ9Mzg0ZDg3ZWYyYzk1NGZjNThlNmM1ZmQ4MjUzZTRhMTk4NGY1
ZmUwMjwvYT48L2Rpdj48ZGl2PiZndDsmZ3Q7wqA8L2Rpdj48ZGl2PiZndDsmZ3Q7IEZpeGVkIGlu
IExpbnV4IDUuMTI6PC9kaXY+PGRpdj4mZ3Q7Jmd0OyA8YSBocmVmPSJodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0
Lz9pZD01Njg4N2NmZmU5NDZiYjBhOTBjNzQ0MjlmYTk0ZDYxMTBhNzMxMTlkIiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NTY4ODdjZmZlOTQ2YmIwYTkwYzc0NDI5ZmE5NGQ2
MTEwYTczMTE5ZDwvYT48L2Rpdj48ZGl2PiZndDsmZ3Q7wqA8L2Rpdj48ZGl2PiZndDsmZ3Q7IFNp
Z25lZC1vZmYtYnk6IENoYW5nTGltaW4gJmx0OzxhIGhyZWY9Im1haWx0bzpjaGFuZ2xtQGNoaW5h
dGVsZWNvbS5jbiIgdGFyZ2V0PSJfYmxhbmsiPmNoYW5nbG1AY2hpbmF0ZWxlY29tLmNuPC9hPiZn
dDs8L2Rpdj48ZGl2PiZndDsmZ3Q7IC0tLTwvZGl2PjxkaXY+Jmd0OyZndDsgwqAgYmxvY2svZmls
ZS1wb3NpeC5jIHwgOCArKysrKystLTwvZGl2PjxkaXY+Jmd0OyZndDsgwqAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSk8L2Rpdj48ZGl2PiZndDsmZ3Q7wqA8
L2Rpdj48ZGl2PiZndDsmZ3Q7IGRpZmYgLS1naXQgYS9ibG9jay9maWxlLXBvc2l4LmMgYi9ibG9j
ay9maWxlLXBvc2l4LmM8L2Rpdj48ZGl2PiZndDsmZ3Q7IGluZGV4IDIwZTE0ZjhlOTYuLmQ0MDU0
YWM5Y2IgMTAwNjQ0PC9kaXY+PGRpdj4mZ3Q7Jmd0OyAtLS0gYS9ibG9jay9maWxlLXBvc2l4LmM8
L2Rpdj48ZGl2PiZndDsmZ3Q7ICsrKyBiL2Jsb2NrL2ZpbGUtcG9zaXguYzwvZGl2PjxkaXY+Jmd0
OyZndDsgQEAgLTE2MjQsOCArMTYyNCwxMiBAQCBzdGF0aWMgc3NpemVfdMKgPC9kaXY+PGRpdj4m
Z3Q7Jmd0OyBoYW5kbGVfYWlvY2Jfd3JpdGVfemVyb2VzX2Jsb2NrKFJhd1Bvc2l4QUlPRGF0YSAq
YWlvY2IpPC9kaXY+PGRpdj4mZ3Q7Jmd0OyDCoCDCoCDCoCDCoCDCoCB9IHdoaWxlIChlcnJubyA9
PSBFSU5UUik7PC9kaXY+PGRpdj4mZ3Q7Jmd0O8KgPC9kaXY+PGRpdj4mZ3Q7Jmd0OyDCoCDCoCDC
oCDCoCDCoCByZXQgPSB0cmFuc2xhdGVfZXJyKC1lcnJubyk7PC9kaXY+PGRpdj4mZ3Q7Jmd0OyAt
IMKgIMKgIMKgIMKgaWYgKHJldCA9PSAtRU5PVFNVUCkgezwvZGl2PjxkaXY+Jmd0OyZndDsgLSDC
oCDCoCDCoCDCoCDCoCDCoHMtJmd0O2hhc193cml0ZV96ZXJvZXMgPSBmYWxzZTs8L2Rpdj48ZGl2
PiZndDsmZ3Q7ICsgwqAgwqAgwqAgwqBzd2l0Y2ggKHJldCkgezwvZGl2PjxkaXY+Jmd0OyZndDsg
KyDCoCDCoCDCoCDCoGNhc2UgLUVOT1RTVVA6PC9kaXY+PGRpdj4mZ3Q7Jmd0OyArIMKgIMKgIMKg
IMKgIMKgIMKgcy0mZ3Q7aGFzX3dyaXRlX3plcm9lcyA9IGZhbHNlOyAvKiBmYWxsIHRocm91Z2gg
Ki88L2Rpdj48ZGl2PiZndDsmZ3Q7ICsgwqAgwqAgwqAgwqBjYXNlIC1FQlVTWTogLyogTGludXgg
NS4xMC81LjExIG1heSByZXR1cm4gLUVCVVNZIGZvciBtdWx0aXBhdGjCoDwvZGl2PjxkaXY+Jmd0
OyZndDsgZGV2aWNlcyAqLzwvZGl2PjxkaXY+Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybiAtRU5PVFNVUDs8L2Rpdj48ZGl2PiZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqBicmVh
azs8L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsoTm90IHN1cmUgd2h5IHRoaXMgYnJlYWsg
aXMgaGVyZS4pPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7TWF4PC9kaXY+PGRpdj4mZ3Q7
PC9kaXY+PGRpdj4mZ3Q7Jmd0OyDCoCDCoCDCoCDCoCDCoCB9PC9kaXY+PGRpdj4mZ3Q7Jmd0OyDC
oCDCoCDCoCB9PC9kaXY+PGRpdj4mZ3Q7Jmd0OyDCoCAjZW5kaWY8L2Rpdj48ZGl2PiZndDsmZ3Q7
IC0tPC9kaXY+PGRpdj4mZ3Q7Jmd0OyAyLjI3LjA8L2Rpdj48ZGl2PiZndDsmZ3Q7wqA8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+DQo=
--00000000000074022d05be5e5b42--


