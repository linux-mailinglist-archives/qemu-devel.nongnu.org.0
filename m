Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E834B016
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:20:01 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPsw4-0004gc-Sm
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lPsJS-0000er-A8
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lPsJN-0002JQ-SM
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 15:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616787600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3ab7//20xqQQ3aB2OAqHdWfmJL3macBfXAGpG4HdQk=;
 b=VjnZtiUDRTM65mTn1BfawhASEVEe3ij2Xd8+AnZk+ylzsW8TVvcl1QM7bLXi/138pkg82W
 ihO+HkanpCqOMYJUEI7o2A1W6Dljn48DWlxQGcjx/TB8M/04P77fdov0DiRlPS+aDJNeO6
 2dN5rA1jlT88Zl/Wv+9yPPk5lVoNl7g=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-04Sm7czBPDyDY1KpkEd_Fw-1; Fri, 26 Mar 2021 15:39:51 -0400
X-MC-Unique: 04Sm7czBPDyDY1KpkEd_Fw-1
Received: by mail-ot1-f70.google.com with SMTP id w15so4669476otm.23
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 12:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YIAN8C74pef3cfba2qF05puXRoiBy2odvlzSNYS+FnQ=;
 b=BvcpdM7ekmcaYZsBwUZ9yBVj5PIXWLxiv6ttLU940AoQMBS6d9njGuv9RUsEXFVIdB
 sCy84SLWZCPjViqZnR8WZdKTiKaXgq1qVeXjyepAWSMDNVKBvYp1MT2YWqShvWa1y2pk
 VkatpOr7lIFvw99m8N4Ctn8wTYyeDcmFyc79iE5Bol5oXoWh7js8F4uvr7EWUr5NMDrx
 WO/p9dS0RdYHuuGKT/YbK9WfzoxSiqZ1RAMzyHGneAVzIoaO/CH1sizKbPFIi/CtzG+8
 i/Q6diWxTQmz4MejdJrnoTnED+mCb9WntVPNO+jlBJM9WyrvM9zTQL7Y7Om2fyJLGKBZ
 uNAg==
X-Gm-Message-State: AOAM533tzGQvdcRrV0UJQDqaeY/VWIkyQ03KS4DXzZt1mZjckSWwlPjF
 /t/dghzWDXcL6FKHTlSiwqQLt5XluOOYkxN03LWo5DmRS+3rSeeDacGdwkbuT3caZZybMskiO8P
 R8oeEzfCxP6XXP81vm4e3kKG6QgpKmoI=
X-Received: by 2002:a9d:5f15:: with SMTP id f21mr11627315oti.226.1616787589835; 
 Fri, 26 Mar 2021 12:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykxGl/xS3QxwxrOhaBE/Ern0nrXDxVUcjaBI6G3ecXraE4x84QVKyUI3fWiINjSF9nk2+tK+zRuoxJfog0cOY=
X-Received: by 2002:a9d:5f15:: with SMTP id f21mr11627299oti.226.1616787589564; 
 Fri, 26 Mar 2021 12:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <2021032217253258728710@chinatelecom.cn>
 <0b01a688-f86b-0888-2c03-f4d55273b93f@redhat.com>
 <CAMRbyysT_s+AkskuAGvT7wXOQ+LaX3OkSYTo4UxtYKqE0cjBMg@mail.gmail.com>
 <2021032514064808224635@chinatelecom.cn>
 <CAMRbyyuuWLjKrCXAu5iRYSn5hV_0bytMy1JtjFuuU1aeFZVGqw@mail.gmail.com>
 <2021032608205626965639@chinatelecom.cn>
In-Reply-To: <2021032608205626965639@chinatelecom.cn>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 26 Mar 2021 22:39:33 +0300
Message-ID: <CAMRbyyvADB69zCy1C3+wYdqjEBmLZbuAq4O4kjJzed6exnMkvQ@mail.gmail.com>
Subject: Re: [PATCH V4] file-posix: allow -EBUSY error during ioctl(fd,
 BLKZEROOUT, range) on block
To: ChangLimin <changlm@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f41deb05be75b1fb"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
 qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 mreitz <mreitz@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f41deb05be75b1fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 3:21 AM ChangLimin <changlm@chinatelecom.cn> wrote:

> >On Thu, Mar 25, 2021 at 8:07 AM ChangLimin <changlm@chinatelecom.cn>
> wrote:
> >>On Wed, Mar 24, 2021 at 4:52 PM Max Reitz <mreitz@redhat.com> wrote:
> >>On 22.03.21 10:25, ChangLimin wrote:
> >>> For Linux 5.10/5.11, qemu write zeros to a multipath device using
> >>> ioctl(fd, BLKZEROOUT, range) with cache none or directsync return
> -EBUSY
> >>> permanently.
> >>
> >>So as far as I can track back the discussion, Kevin asked on v1 why we=
=E2=80=99d
> >>set has_write_zeroes to false, i.e. whether the EBUSY might not go away
> >>at some point, and if it did, whether we shouldn=E2=80=99t retry BLKZER=
OOUT then.
> >>You haven=E2=80=99t explicitly replied to that question (as far as I ca=
n see),
> >>so it kind of still stands.
> >>
> >>Implicitly, there are two conflicting answers in this patch: On one
> >>hand, the commit message says =E2=80=9Cpermanently=E2=80=9D, and this i=
s what you told
> >>Nir as a realistic case where this can occur.
> >
> >For Linux 5.10/5.11, the EBUSY is permanently, the reproduce step is
> below.
> >For other Linux version, the EBUSY may be temporary.
> >Because  Linux 5.10/5.11 is not used widely, so do not set
> has_write_zeroes to false.
> >
> >>I'm afraid ChangLimin did not answer my question. I'm looking for real
> >>world used case when qemu cannot write zeros to multipath device, when
> >>nobody else is using the device.
> >>
> >>I tried to reproduce this on Fedora (kernel 5.10) with qemu-img convert=
,
> >>once with a multipath device, and once with logical volume on a vg
> created
> >>on the multipath device, and I could not reproduce this issue.
> >
> >The following is steps to reproduct the issue on Fedora 34.
> >
> ># uname -a
> >Linux fedora-34 5.11.3-300.fc34.x86_64 #1 SMP Thu Mar 4 19:03:18 UTC 202=
1
> x86_64 x86_64 x86_64 GNU/Linux
> >
> >Is this the most recent kernel? I have 5.11.7 in fedora 32.
> >
> >
> ># qemu-img -V
> >qemu-img version 5.2.0 (qemu-5.2.0-5.fc34.1)
> >
> >1.  Login in an ISCSI LUN created using targetcli on ubuntu 20.04
> ># iscsiadm -m discovery -t st -p 192.169.1.109
> >192.169.1.109:3260,1 iqn.2003-01.org.linux-iscsi:lio-lv100
> >
> ># iscsiadm -m node -l -T iqn.2003-01.org.linux-iscsi:lio-lv100
> ># iscsiadm -m session
> >tcp: [1] 192.169.1.109:3260,1 iqn.2003-01.org.linux-iscsi:lio-lv100
> (non-flash)
> >
> >2. start multipathd service
> ># mpathconf --enable
> ># systemctl start multipathd
> >
> >3.  add multipath path
> ># multipath -a `/lib/udev/scsi_id -g /dev/sdb`   # sdb means the ISCSI L=
UN
> >wwid '36001405b76856e4816b48b99c6a77de3' added
> >
> ># multipathd add path /dev/sdb
> >ok
> >
> ># multipath -ll     # /dev/dm-1 is the multipath device based on /dev/sd=
b
> >mpatha (36001405bebfc3a0522541cda30220db9) dm-1 LIO-ORG,lv102
> >size=3D1.0G features=3D'0' hwhandler=3D'1 alua' wp=3Drw
> >`-+- policy=3D'service-time 0' prio=3D50 status=3Dactive
> >  `- 5:0:0:0  sdd  8:48   active ready running
> >
> >You are using user_friendly_names which is (sadly) the default.
> >But I don't think it should matter.
> >
> >4. qemu-img return EBUSY both to dm-1 and sdb
> ># wget
> http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img
> ># qemu-img convert -O raw -t none cirros-0.4.0-x86_64-disk.img /dev/dm-1
> >qemu-img: error while writing at byte 0: Device or resource busy
> >
> ># qemu-img convert -O raw -t none cirros-0.4.0-x86_64-disk.img /dev/sdb
> >qemu-img: error while writing at byte 0: Device or resource busy
> >
> >5. blkdiscard also return EBUSY  both to dm-1 and sdb
> ># blkdiscard -o 0 -l 4096 /dev/dm-1
> >blkdiscard: cannot open /dev/dm-1: Device or resource busy
> >
> ># blkdiscard -o 0 -l 4096 /dev/sdb
> >blkdiscard: cannot open /dev/sdb: No such file or directory
> >
> >6. dd write zero is good, because it does not use blkdiscard
> ># dd if=3D/dev/zero of=3D/dev/dm-1 bs=3D1M count=3D100 oflag=3Ddirect
> >100+0 records in
> >100+0 records out
> >104857600 bytes (105 MB, 100 MiB) copied, 2.33623 s, 44.9 MB/s
> >
> >7. The LUN should support blkdiscard feature, otherwise it will not writ=
e
> zero
> >with  ioctl(fd, BLKZEROOUT, range)
> >
> >Thanks!
> >
> >I could not reproduce this with kernel 5.10, but now I'm no 5.11:
> ># uname -r
> >5.11.7-100.fc32.x86_64
> >
> ># qemu-img --version
> >qemu-img version 5.2.0 (qemu-5.2.0-6.fc32.1)
> >Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
> >
> ># cat /etc/multipath.conf
> >defaults {
> >user_friendly_names no
> >find_multipaths no
> >}
> >
> >blacklist_exceptions {
> >        property "(SCSI_IDENT_|ID_WWN)"
> >}
> >
> >blacklist {
> >}
> >
> ># multipath -ll 36001405e884ab8ff4b44fdba6901099c
> >36001405e884ab8ff4b44fdba6901099c dm-8 LIO-ORG,3-09
> >size=3D6.0G features=3D'0' hwhandler=3D'1 alua' wp=3Drw
> >`-+- policy=3D'service-time 0' prio=3D50 status=3Dactive
> >  `- 1:0:0:9 sdk     8:160 active ready running
> >
> >$ lsblk /dev/sdk
> >NAME                                MAJ:MIN RM SIZE RO TYPE  MOUNTPOINT
> >sdk                                   8:160  0   6G  0 disk
> >=E2=94=94=E2=94=8036001405e884ab8ff4b44fdba6901099c 253:13   0   6G  0 m=
path
> >
> >$ virt-builder fedora-32 -o disk.img
> >[   2.9] Downloading: http://builder.libguestfs.org/fedora-32.xz
> >[   3.8] Planning how to build this image
> >[   3.8] Uncompressing
> >[  11.1] Opening the new disk
> >[  16.1] Setting a random seed
> >[  16.1] Setting passwords
> >virt-builder: Setting random password of root to TcikQqRxAaIqS1kF
> >[  17.0] Finishing off
> >                   Output file: disk.img
> >                   Output size: 6.0G
> >                 Output format: raw
> >            Total usable space: 5.4G
> >                    Free space: 4.0G (74%)
> >
> >$ qemu-img info disk.img
> >image: disk.img
> >file format: raw
> >virtual size: 6 GiB (6442450944 bytes)
> >disk size: 1.29 GiB
> >
> ># qemu-img convert -p -f raw -O raw -t none -T none disk.img
> /dev/mapper/36001405e884ab8ff4b44fdba6901099c
> >    (100.00/100%)
> >
> >Works.
> >
> ># lsblk /dev/sdk
> >NAME                                   MAJ:MIN RM  SIZE RO TYPE
>  MOUNTPOINT
> >sdk                                      8:160  0    6G  0 disk
> >=E2=94=94=E2=94=8036001405e884ab8ff4b44fdba6901099c    253:13   0    6G =
 0 mpath
> >  =E2=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c1 253:14   0    1M =
 0 part
> >  =E2=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c2 253:15   0    1G =
 0 part
> >  =E2=94=9C=E2=94=8036001405e884ab8ff4b44fdba6901099c3 253:16   0  615M =
 0 part
> >  =E2=94=94=E2=94=8036001405e884ab8ff4b44fdba6901099c4 253:17   0  4.4G =
 0 part
> >
> ># qemu-img convert -p -f raw -O raw -t none -T none disk.img
> /dev/mapper/36001405e884ab8ff4b44fdba6901099c
> >    (100.00/100%)
> >
> >Works, wiping the partitions.
> >
> ># mount /dev/mapper/36001405e884ab8ff4b44fdba6901099c4 /tmp/mnt
> >
> ># mount | grep /dev/mapper/36001405e884ab8ff4b44fdba6901099c4
> >/dev/mapper/36001405e884ab8ff4b44fdba6901099c4 on /tmp/mnt type xfs
> (rw,relatime,seclabel,attr2,inode64,logbufs=3D8,logbsize=3D32k,noquota)
> >
> >This is invalid use, converting to device with mounted file system, but
> let's try:
> >
> ># qemu-img convert -p -f raw -O raw -t none -T none disk.img
> /dev/mapper/36001405e884ab8ff4b44fdba6901099c
> >    (100.00/100%)
> >
> >Still works?!
> >
> ># wipefs -a /dev/mapper/36001405e884ab8ff4b44fdba6901099c
> >wipefs: error: /dev/mapper/36001405e884ab8ff4b44fdba6901099c: probing
> initialization failed: Device or resource busy
> >
> ># blkdiscard /dev/mapper/36001405e884ab8ff4b44fdba6901099c
> >
> >Works.
> >
> >This the configuration of the LUN on the server side:
> >
> >   {
>
> >      "aio": false,
>
> >      "alua_tpgs": [
>
> >        {
>
> >          "alua_access_state": 0,
>
> >          "alua_access_status": 0,
>
> >          "alua_access_type": 3,
>
> >          "alua_support_active_nonoptimized": 1,
>
> >          "alua_support_active_optimized": 1,
>
> >          "alua_support_offline": 1,
>
> >          "alua_support_standby": 1,
>
> >          "alua_support_transitioning": 1,
>
> >          "alua_support_unavailable": 1,
>
> >          "alua_write_metadata": 0,
>
> >          "implicit_trans_secs": 0,
>
> >          "name": "default_tg_pt_gp",
>
> >          "nonop_delay_msecs": 100,
>
> >          "preferred": 0,
>
> >          "tg_pt_gp_id": 0,
>
> >          "trans_delay_msecs": 0
>
> >        }
>
> >      ],
>
> >      "attributes": {
>
> >        "block_size": 512,
>
> >        "emulate_3pc": 1,
>
> >        "emulate_caw": 1,
>
> >        "emulate_dpo": 1,
>
> >        "emulate_fua_read": 1,
>
> >        "emulate_fua_write": 1,
>
> >        "emulate_model_alias": 1,
>
> >        "emulate_pr": 1,
>
> >        "emulate_rest_reord": 0,
>
> >        "emulate_tas": 1,
>
> >        "emulate_tpu": 1,
>
> >        "emulate_tpws": 1,
>
> >        "emulate_ua_intlck_ctrl": 0,
>
> >        "emulate_write_cache": 1,
>
> >        "enforce_pr_isids": 1,
>
> >        "force_pr_aptpl": 0,
>
> >        "is_nonrot": 0,
>
> >        "max_unmap_block_desc_count": 1,
>
> >        "max_unmap_lba_count": 8192,
>
> >        "max_write_same_len": 65335,
>
> >        "optimal_sectors": 16384,
>
> >        "pi_prot_format": 0,
>
> >        "pi_prot_type": 0,
>
> >        "pi_prot_verify": 0,
>
> >        "queue_depth": 128,
>
> >        "unmap_granularity": 1,
>
> >        "unmap_granularity_alignment": 0,
>
> >        "unmap_zeroes_data": 0
>
> >      },
>
> >      "dev": "/target/3/09",
>
> >      "name": "3-09",
>
> >      "plugin": "fileio",
>
> >      "size": 6442450944,
>
> >      "write_back": true,
>
> >      "wwn": "e884ab8f-f4b4-4fdb-a690-1099c072c86d"
>
> >    },
>
> >
> >Maybe this upstream change is not in all downstream 5.11 kernels, or
> 5.11.7
> >already includes the fix?
>
> Linux 5.10.24/5.11.7 already merged the fix on 2021-03-17 by Greg
> Kroah-Hartman.
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-5.11.y&id=3D7e0815797656f029fab2edc309406cddf931b9d8
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-5.10.y&id=3Dd44c9780ed40db88626c9354868eab72159c7a7f
>
> # git describe d44c9780ed40db88626c9354868eab72159c7a7f
> v5.10.23-184-gd44c9780ed40
>
> # git describe 7e0815797656f029fab2edc309406cddf931b9d8
> v5.11.6-178-g7e0815797656
>

So this is practically fixed.

I don't think keeping a workaround for this in qemu is a good idea.

>Adding Ben, maybe he had more insight on the multipath side.
> >
> >>If I understand the kernel change correctly, this can happen when there
> is
> >>a mounted file system on top of the multipath device. I don't think we
> have
> >>a use case when qemu accesses a multipath device when the device is use=
d
> >>by a file system, but maybe I missed something.
> >>
> >>So that to me implies
> >>that we actually should not retry BLKZEROOUT, because the EBUSY will
> >>remain, and that condition won=E2=80=99t change while the block device =
is in use
> >>by qemu.
> >>
> >>On the other hand, in the code, you have decided not to reset
> >>has_write_zeroes to false, so the implementation will retry.
> >>
> >>EBUSY is usually a temporary error, so retrying makes sense. The questi=
on
> >>is if we really can write zeroes manually in this case?
> >>
> >>So I don=E2=80=99t quite understand.  Should we keep trying BLKZEROOUT =
or is
> >>there no chance of it working after it has at one point failed with
> >>EBUSY?  (Are there other cases besides what=E2=80=99s described in this=
 commit
> >>message where EBUSY might be returned and it is only temporary?)
> >>
> >>> Fallback to pwritev instead of exit for -EBUSY error.
> >>>
> >>> The issue was introduced in Linux 5.10:
> >>>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3D384d87ef2c954fc58e6c5fd8253e4a1984f5fe02
> >>>
> >>> Fixed in Linux 5.12:
> >>>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D56887cffe946bb0a90c74429fa94d6110a73119d
> >>>
> >>> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
> >>> ---
> >>>   block/file-posix.c | 8 ++++++--
> >>>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/block/file-posix.c b/block/file-posix.c
> >>> index 20e14f8e96..d4054ac9cb 100644
> >>> --- a/block/file-posix.c
> >>> +++ b/block/file-posix.c
> >>> @@ -1624,8 +1624,12 @@ static ssize_t
> >>> handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
> >>>           } while (errno =3D=3D EINTR);
> >>>
> >>>           ret =3D translate_err(-errno);
> >>> -        if (ret =3D=3D -ENOTSUP) {
> >>> -            s->has_write_zeroes =3D false;
> >>> +        switch (ret) {
> >>> +        case -ENOTSUP:
> >>> +            s->has_write_zeroes =3D false; /* fall through */
> >>> +        case -EBUSY: /* Linux 5.10/5.11 may return -EBUSY for
> multipath
> >>> devices */
> >>> +            return -ENOTSUP;
> >>> +            break;
> >>
> >>(Not sure why this break is here.)
> >>
> >>Max
> >>
> >>>           }
> >>>       }
> >>>   #endif
> >>> --
> >>> 2.27.0
> >>>
>
>

--000000000000f41deb05be75b1fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgMzoy
MSBBTSBDaGFuZ0xpbWluICZsdDs8YSBocmVmPSJtYWlsdG86Y2hhbmdsbUBjaGluYXRlbGVjb20u
Y24iPmNoYW5nbG1AY2hpbmF0ZWxlY29tLmNuPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxl
PSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQs
MjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj48ZGl2PiZndDtPbiBUaHUsIE1hciAyNSwg
MjAyMSBhdCA4OjA3IEFNIENoYW5nTGltaW4gJmx0OzxhIGhyZWY9Im1haWx0bzpjaGFuZ2xtQGNo
aW5hdGVsZWNvbS5jbiIgdGFyZ2V0PSJfYmxhbmsiPmNoYW5nbG1AY2hpbmF0ZWxlY29tLmNuPC9h
PiZndDsgd3JvdGU6PC9kaXY+PGRpdj4mZ3Q7Jmd0O09uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDQ6
NTIgUE0gTWF4IFJlaXR6ICZsdDs8YSBocmVmPSJtYWlsdG86bXJlaXR6QHJlZGhhdC5jb20iIHRh
cmdldD0iX2JsYW5rIj5tcmVpdHpAcmVkaGF0LmNvbTwvYT4mZ3Q7IHdyb3RlOjwvZGl2PjxkaXY+
Jmd0OyZndDtPbiAyMi4wMy4yMSAxMDoyNSwgQ2hhbmdMaW1pbiB3cm90ZTo8L2Rpdj48ZGl2PiZn
dDsmZ3Q7Jmd0OyBGb3IgTGludXggNS4xMC81LjExLCBxZW11IHdyaXRlIHplcm9zIHRvIGEgbXVs
dGlwYXRoIGRldmljZSB1c2luZzwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IGlvY3RsKGZkLCBCTEta
RVJPT1VULCByYW5nZSkgd2l0aCBjYWNoZSBub25lIG9yIGRpcmVjdHN5bmMgcmV0dXJuIC1FQlVT
WTwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IHBlcm1hbmVudGx5LjwvZGl2PjxkaXY+Jmd0OyZndDs8
L2Rpdj48ZGl2PiZndDsmZ3Q7U28gYXMgZmFyIGFzIEkgY2FuIHRyYWNrIGJhY2sgdGhlIGRpc2N1
c3Npb24sIEtldmluIGFza2VkIG9uIHYxIHdoeSB3ZeKAmWTCoDwvZGl2PjxkaXY+Jmd0OyZndDtz
ZXQgaGFzX3dyaXRlX3plcm9lcyB0byBmYWxzZSwgaS5lLiB3aGV0aGVyIHRoZSBFQlVTWSBtaWdo
dCBub3QgZ28gYXdhecKgPC9kaXY+PGRpdj4mZ3Q7Jmd0O2F0IHNvbWUgcG9pbnQsIGFuZCBpZiBp
dCBkaWQsIHdoZXRoZXIgd2Ugc2hvdWxkbuKAmXQgcmV0cnkgQkxLWkVST09VVCB0aGVuLjwvZGl2
PjxkaXY+Jmd0OyZndDtZb3UgaGF2ZW7igJl0IGV4cGxpY2l0bHkgcmVwbGllZCB0byB0aGF0IHF1
ZXN0aW9uIChhcyBmYXIgYXMgSSBjYW4gc2VlKSzCoDwvZGl2PjxkaXY+Jmd0OyZndDtzbyBpdCBr
aW5kIG9mIHN0aWxsIHN0YW5kcy48L2Rpdj48ZGl2PiZndDsmZ3Q7PC9kaXY+PGRpdj4mZ3Q7Jmd0
O0ltcGxpY2l0bHksIHRoZXJlIGFyZSB0d28gY29uZmxpY3RpbmcgYW5zd2VycyBpbiB0aGlzIHBh
dGNoOiBPbiBvbmXCoDwvZGl2PjxkaXY+Jmd0OyZndDtoYW5kLCB0aGUgY29tbWl0IG1lc3NhZ2Ug
c2F5cyDigJxwZXJtYW5lbnRseeKAnSwgYW5kIHRoaXMgaXMgd2hhdCB5b3UgdG9sZMKgPC9kaXY+
PGRpdj4mZ3Q7Jmd0O05pciBhcyBhIHJlYWxpc3RpYyBjYXNlIHdoZXJlIHRoaXMgY2FuIG9jY3Vy
LsKgPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7Rm9yIExpbnV4IDUuMTAvNS4xMSwgdGhl
IEVCVVNZIGlzIHBlcm1hbmVudGx5LCB0aGUgcmVwcm9kdWNlIHN0ZXAgaXMgYmVsb3cuwqA8L2Rp
dj48ZGl2PiZndDtGb3Igb3RoZXIgTGludXggdmVyc2lvbiwgdGhlIEVCVVNZIG1heSBiZSB0ZW1w
b3JhcnkuwqA8L2Rpdj48ZGl2PiZndDtCZWNhdXNlIMKgTGludXggNS4xMC81LjExIGlzIG5vdCB1
c2VkIHdpZGVseSwgc28gZG8gbm90IHNldCBoYXNfd3JpdGVfemVyb2VzIHRvIGZhbHNlLjwvZGl2
PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OyZndDtJJiMzOTttIGFmcmFpZCBDaGFuZ0xpbWluIGRp
ZCBub3QgYW5zd2VyIG15IHF1ZXN0aW9uLiBJJiMzOTttIGxvb2tpbmcgZm9yIHJlYWw8L2Rpdj48
ZGl2PiZndDsmZ3Q7d29ybGQgdXNlZCBjYXNlIHdoZW4gcWVtdSBjYW5ub3Qgd3JpdGUgemVyb3Mg
dG8gbXVsdGlwYXRoIGRldmljZSwgd2hlbjwvZGl2PjxkaXY+Jmd0OyZndDtub2JvZHkgZWxzZSBp
cyB1c2luZyB0aGUgZGV2aWNlLjwvZGl2PjxkaXY+Jmd0OyZndDs8L2Rpdj48ZGl2PiZndDsmZ3Q7
SSB0cmllZCB0byByZXByb2R1Y2UgdGhpcyBvbiBGZWRvcmEgKGtlcm5lbCA1LjEwKSB3aXRoIHFl
bXUtaW1nIGNvbnZlcnQsPC9kaXY+PGRpdj4mZ3Q7Jmd0O29uY2Ugd2l0aCBhIG11bHRpcGF0aCBk
ZXZpY2UsIGFuZCBvbmNlIHdpdGggbG9naWNhbCB2b2x1bWUgb24gYSB2ZyBjcmVhdGVkPC9kaXY+
PGRpdj4mZ3Q7Jmd0O29uIHRoZSBtdWx0aXBhdGggZGV2aWNlLCBhbmQgSSBjb3VsZCBub3QgcmVw
cm9kdWNlIHRoaXMgaXNzdWUuPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7VGhlIGZvbGxv
d2luZyBpcyBzdGVwcyB0byByZXByb2R1Y3QgdGhlIGlzc3VlIG9uIEZlZG9yYSAzNC48L2Rpdj48
ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsjIHVuYW1lIC1hPC9kaXY+PGRpdj4mZ3Q7TGludXggZmVk
b3JhLTM0IDUuMTEuMy0zMDAuZmMzNC54ODZfNjQgIzEgU01QIFRodSBNYXIgNCAxOTowMzoxOCBV
VEMgMjAyMSB4ODZfNjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXg8L2Rpdj48ZGl2PiZndDs8L2Rp
dj48ZGl2PiZndDtJcyB0aGlzIHRoZSBtb3N0IHJlY2VudCBrZXJuZWw/IEkgaGF2ZSA1LjExLjcg
aW4gZmVkb3JhIDMyLjwvZGl2PjxkaXY+Jmd0O8KgPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4m
Z3Q7IyBxZW11LWltZyAtVjwvZGl2PjxkaXY+Jmd0O3FlbXUtaW1nIHZlcnNpb24gNS4yLjAgKHFl
bXUtNS4yLjAtNS5mYzM0LjEpPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7MS7CoCBMb2dp
biBpbiBhbiBJU0NTSSBMVU4gY3JlYXRlZCB1c2luZyB0YXJnZXRjbGkgb24gdWJ1bnR1IDIwLjA0
PC9kaXY+PGRpdj4mZ3Q7IyBpc2NzaWFkbSAtbSBkaXNjb3ZlcnkgLXQgc3QgLXAgMTkyLjE2OS4x
LjEwOTwvZGl2PjxkaXY+Jmd0OzxhIGhyZWY9Imh0dHA6Ly8xOTIuMTY5LjEuMTA5OjMyNjAiIHRh
cmdldD0iX2JsYW5rIj4xOTIuMTY5LjEuMTA5OjMyNjA8L2E+LDEgaXFuLjIwMDMtMDEub3JnLmxp
bnV4LWlzY3NpOmxpby1sdjEwMDwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OyMgaXNjc2lh
ZG0gLW0gbm9kZSAtbCAtVCBpcW4uMjAwMy0wMS5vcmcubGludXgtaXNjc2k6bGlvLWx2MTAwPC9k
aXY+PGRpdj4mZ3Q7IyBpc2NzaWFkbSAtbSBzZXNzaW9uPC9kaXY+PGRpdj4mZ3Q7dGNwOiBbMV0g
PGEgaHJlZj0iaHR0cDovLzE5Mi4xNjkuMS4xMDk6MzI2MCIgdGFyZ2V0PSJfYmxhbmsiPjE5Mi4x
NjkuMS4xMDk6MzI2MDwvYT4sMSBpcW4uMjAwMy0wMS5vcmcubGludXgtaXNjc2k6bGlvLWx2MTAw
IChub24tZmxhc2gpPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7Mi4gc3RhcnQgbXVsdGlw
YXRoZCBzZXJ2aWNlPC9kaXY+PGRpdj4mZ3Q7IyBtcGF0aGNvbmYgLS1lbmFibGU8L2Rpdj48ZGl2
PiZndDsjIHN5c3RlbWN0bCBzdGFydCBtdWx0aXBhdGhkPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRp
dj4mZ3Q7My4gwqBhZGQgbXVsdGlwYXRoIHBhdGg8L2Rpdj48ZGl2PiZndDsjIG11bHRpcGF0aCAt
YSBgL2xpYi91ZGV2L3Njc2lfaWQgLWcgL2Rldi9zZGJgIMKgICMgc2RiIG1lYW5zIHRoZSBJU0NT
SSBMVU48L2Rpdj48ZGl2PiZndDt3d2lkICYjMzk7MzYwMDE0MDViNzY4NTZlNDgxNmI0OGI5OWM2
YTc3ZGUzJiMzOTsgYWRkZWQ8L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsjIG11bHRpcGF0
aGQgYWRkIHBhdGggL2Rldi9zZGI8L2Rpdj48ZGl2PiZndDtvazwvZGl2PjxkaXY+Jmd0OzwvZGl2
PjxkaXY+Jmd0OyMgbXVsdGlwYXRoIC1sbCDCoCDCoCAjIC9kZXYvZG0tMSBpcyB0aGUgbXVsdGlw
YXRoIGRldmljZSBiYXNlZCBvbiAvZGV2L3NkYjwvZGl2PjxkaXY+Jmd0O21wYXRoYSAoMzYwMDE0
MDViZWJmYzNhMDUyMjU0MWNkYTMwMjIwZGI5KSBkbS0xIExJTy1PUkcsbHYxMDI8L2Rpdj48ZGl2
PiZndDtzaXplPTEuMEcgZmVhdHVyZXM9JiMzOTswJiMzOTsgaHdoYW5kbGVyPSYjMzk7MSBhbHVh
JiMzOTsgd3A9cnc8L2Rpdj48ZGl2PiZndDtgLSstIHBvbGljeT0mIzM5O3NlcnZpY2UtdGltZSAw
JiMzOTsgcHJpbz01MCBzdGF0dXM9YWN0aXZlPC9kaXY+PGRpdj4mZ3Q7IMKgYC0gNTowOjA6MCDC
oHNkZCDCoDg6NDggwqAgYWN0aXZlIHJlYWR5IHJ1bm5pbmc8L2Rpdj48ZGl2PiZndDs8L2Rpdj48
ZGl2PiZndDtZb3UgYXJlIHVzaW5nIHVzZXJfZnJpZW5kbHlfbmFtZXMgd2hpY2ggaXMgKHNhZGx5
KSB0aGUgZGVmYXVsdC48L2Rpdj48ZGl2PiZndDtCdXQgSSBkb24mIzM5O3QgdGhpbmsgaXQgc2hv
dWxkIG1hdHRlci48L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDs0LiBxZW11LWltZyByZXR1
cm4gRUJVU1kgYm90aCB0byBkbS0xIGFuZCBzZGI8L2Rpdj48ZGl2PiZndDsjIHdnZXQgPGEgaHJl
Zj0iaHR0cDovL2Rvd25sb2FkLmNpcnJvcy1jbG91ZC5uZXQvMC40LjAvY2lycm9zLTAuNC4wLXg4
Nl82NC1kaXNrLmltZyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9kb3dubG9hZC5jaXJyb3MtY2xv
dWQubmV0LzAuNC4wL2NpcnJvcy0wLjQuMC14ODZfNjQtZGlzay5pbWc8L2E+PC9kaXY+PGRpdj4m
Z3Q7IyBxZW11LWltZyBjb252ZXJ0IC1PIHJhdyAtdCBub25lIGNpcnJvcy0wLjQuMC14ODZfNjQt
ZGlzay5pbWcgL2Rldi9kbS0xPC9kaXY+PGRpdj4mZ3Q7cWVtdS1pbWc6IGVycm9yIHdoaWxlIHdy
aXRpbmcgYXQgYnl0ZSAwOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTwvZGl2PjxkaXY+Jmd0Ozwv
ZGl2PjxkaXY+Jmd0OyMgcWVtdS1pbWcgY29udmVydCAtTyByYXcgLXQgbm9uZSBjaXJyb3MtMC40
LjAteDg2XzY0LWRpc2suaW1nIC9kZXYvc2RiPC9kaXY+PGRpdj4mZ3Q7cWVtdS1pbWc6IGVycm9y
IHdoaWxlIHdyaXRpbmcgYXQgYnl0ZSAwOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTwvZGl2Pjxk
aXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OzUuIGJsa2Rpc2NhcmQgYWxzbyByZXR1cm4gRUJVU1kgwqBi
b3RoIHRvIGRtLTEgYW5kIHNkYjwvZGl2PjxkaXY+Jmd0OyMgYmxrZGlzY2FyZCAtbyAwIC1sIDQw
OTYgL2Rldi9kbS0xPC9kaXY+PGRpdj4mZ3Q7YmxrZGlzY2FyZDogY2Fubm90IG9wZW4gL2Rldi9k
bS0xOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0
OyMgYmxrZGlzY2FyZCAtbyAwIC1sIDQwOTYgL2Rldi9zZGI8L2Rpdj48ZGl2PiZndDtibGtkaXNj
YXJkOiBjYW5ub3Qgb3BlbiAvZGV2L3NkYjogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeTwvZGl2
PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OzYuIGRkIHdyaXRlIHplcm8gaXMgZ29vZCwgYmVjYXVz
ZSBpdCBkb2VzIG5vdCB1c2UgYmxrZGlzY2FyZDwvZGl2PjxkaXY+Jmd0OyMgZGQgaWY9L2Rldi96
ZXJvIG9mPS9kZXYvZG0tMSBicz0xTSBjb3VudD0xMDAgb2ZsYWc9ZGlyZWN0wqA8L2Rpdj48ZGl2
PiZndDsxMDArMCByZWNvcmRzIGluPC9kaXY+PGRpdj4mZ3Q7MTAwKzAgcmVjb3JkcyBvdXQ8L2Rp
dj48ZGl2PiZndDsxMDQ4NTc2MDAgYnl0ZXMgKDEwNSBNQiwgMTAwIE1pQikgY29waWVkLCAyLjMz
NjIzIHMsIDQ0LjkgTUIvczwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OzcuIFRoZSBMVU4g
c2hvdWxkIHN1cHBvcnQgYmxrZGlzY2FyZCBmZWF0dXJlLCBvdGhlcndpc2UgaXQgd2lsbCBub3Qg
d3JpdGUgemVyb8KgPC9kaXY+PGRpdj4mZ3Q7d2l0aCDCoGlvY3RsKGZkLCBCTEtaRVJPT1VULCBy
YW5nZSnCoDwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0O1RoYW5rcyE8L2Rpdj48ZGl2PiZn
dDs8L2Rpdj48ZGl2PiZndDtJIGNvdWxkIG5vdCByZXByb2R1Y2UgdGhpcyB3aXRoIGtlcm5lbCA1
LjEwLCBidXQgbm93IEkmIzM5O20gbm8gNS4xMTo8L2Rpdj48ZGl2PiZndDsjIHVuYW1lIC1yPC9k
aXY+PGRpdj4mZ3Q7NS4xMS43LTEwMC5mYzMyLng4Nl82NDwvZGl2PjxkaXY+Jmd0OzwvZGl2Pjxk
aXY+Jmd0OyMgcWVtdS1pbWcgLS12ZXJzaW9uPC9kaXY+PGRpdj4mZ3Q7cWVtdS1pbWcgdmVyc2lv
biA1LjIuMCAocWVtdS01LjIuMC02LmZjMzIuMSk8L2Rpdj48ZGl2PiZndDtDb3B5cmlnaHQgKGMp
IDIwMDMtMjAyMCBGYWJyaWNlIEJlbGxhcmQgYW5kIHRoZSBRRU1VIFByb2plY3QgZGV2ZWxvcGVy
czwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OyMgY2F0IC9ldGMvbXVsdGlwYXRoLmNvbmY8
L2Rpdj48ZGl2PiZndDtkZWZhdWx0cyB7PC9kaXY+PGRpdj4mZ3Q7dXNlcl9mcmllbmRseV9uYW1l
cyBubzwvZGl2PjxkaXY+Jmd0O2ZpbmRfbXVsdGlwYXRocyBubzwvZGl2PjxkaXY+Jmd0O308L2Rp
dj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDtibGFja2xpc3RfZXhjZXB0aW9ucyB7PC9kaXY+PGRp
dj4mZ3Q7IMKgIMKgIMKgIMKgcHJvcGVydHkgJnF1b3Q7KFNDU0lfSURFTlRffElEX1dXTikmcXVv
dDs8L2Rpdj48ZGl2PiZndDt9PC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7YmxhY2tsaXN0
IHs8L2Rpdj48ZGl2PiZndDt9PC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7IyBtdWx0aXBh
dGggLWxsIDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzwvZGl2PjxkaXY+Jmd0OzM2
MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YyBkbS04IExJTy1PUkcsMy0wOTwvZGl2Pjxk
aXY+Jmd0O3NpemU9Ni4wRyBmZWF0dXJlcz0mIzM5OzAmIzM5OyBod2hhbmRsZXI9JiMzOTsxIGFs
dWEmIzM5OyB3cD1ydzwvZGl2PjxkaXY+Jmd0O2AtKy0gcG9saWN5PSYjMzk7c2VydmljZS10aW1l
IDAmIzM5OyBwcmlvPTUwIHN0YXR1cz1hY3RpdmU8L2Rpdj48ZGl2PiZndDsgwqBgLSAxOjA6MDo5
IHNkayDCoCDCoCA4OjE2MCBhY3RpdmUgcmVhZHkgcnVubmluZzwvZGl2PjxkaXY+Jmd0OzwvZGl2
PjxkaXY+Jmd0OyQgbHNibGsgL2Rldi9zZGs8L2Rpdj48ZGl2PiZndDtOQU1FIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgTUFKOk1JTiBSTSBTSVpFIFJPIFRZ
UEUgwqBNT1VOVFBPSU5UPC9kaXY+PGRpdj4mZ3Q7c2RrIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDg6MTYwIMKgMCDCoCA2RyDCoDAgZGlzayDCoDwv
ZGl2PjxkaXY+Jmd0O+KUlOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YyAyNTM6
MTMgwqAgMCDCoCA2RyDCoDAgbXBhdGjCoDwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0OyQg
dmlydC1idWlsZGVyIGZlZG9yYS0zMiAtbyBkaXNrLmltZzwvZGl2PjxkaXY+Jmd0O1sgwqAgMi45
XSBEb3dubG9hZGluZzogPGEgaHJlZj0iaHR0cDovL2J1aWxkZXIubGliZ3Vlc3Rmcy5vcmcvZmVk
b3JhLTMyLnh6IiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2J1aWxkZXIubGliZ3Vlc3Rmcy5vcmcv
ZmVkb3JhLTMyLnh6PC9hPjwvZGl2PjxkaXY+Jmd0O1sgwqAgMy44XSBQbGFubmluZyBob3cgdG8g
YnVpbGQgdGhpcyBpbWFnZTwvZGl2PjxkaXY+Jmd0O1sgwqAgMy44XSBVbmNvbXByZXNzaW5nPC9k
aXY+PGRpdj4mZ3Q7WyDCoDExLjFdIE9wZW5pbmcgdGhlIG5ldyBkaXNrPC9kaXY+PGRpdj4mZ3Q7
WyDCoDE2LjFdIFNldHRpbmcgYSByYW5kb20gc2VlZDwvZGl2PjxkaXY+Jmd0O1sgwqAxNi4xXSBT
ZXR0aW5nIHBhc3N3b3JkczwvZGl2PjxkaXY+Jmd0O3ZpcnQtYnVpbGRlcjogU2V0dGluZyByYW5k
b20gcGFzc3dvcmQgb2Ygcm9vdCB0byBUY2lrUXFSeEFhSXFTMWtGPC9kaXY+PGRpdj4mZ3Q7WyDC
oDE3LjBdIEZpbmlzaGluZyBvZmY8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgT3V0cHV0IGZpbGU6IGRpc2suaW1nPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIE91dHB1dCBzaXplOiA2LjBHPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIE91dHB1dCBmb3JtYXQ6IHJhdzwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDC
oCDCoCDCoFRvdGFsIHVzYWJsZSBzcGFjZTogNS40RzwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEZyZWUgc3BhY2U6IDQuMEcgKDc0JSk8L2Rpdj48ZGl2PiZndDs8
L2Rpdj48ZGl2PiZndDskIHFlbXUtaW1nIGluZm8gZGlzay5pbWc8L2Rpdj48ZGl2PiZndDtpbWFn
ZTogZGlzay5pbWc8L2Rpdj48ZGl2PiZndDtmaWxlIGZvcm1hdDogcmF3PC9kaXY+PGRpdj4mZ3Q7
dmlydHVhbCBzaXplOiA2IEdpQiAoNjQ0MjQ1MDk0NCBieXRlcyk8L2Rpdj48ZGl2PiZndDtkaXNr
IHNpemU6IDEuMjkgR2lCPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7IyBxZW11LWltZyBj
b252ZXJ0IC1wIC1mIHJhdyAtTyByYXcgLXQgbm9uZSAtVCBub25lIGRpc2suaW1nIC9kZXYvbWFw
cGVyLzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzwvZGl2PjxkaXY+Jmd0OyDCoCDC
oCgxMDAuMDAvMTAwJSk8L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDtXb3Jrcy48L2Rpdj48
ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsjIGxzYmxrIC9kZXYvc2RrPC9kaXY+PGRpdj4mZ3Q7TkFN
RSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBNQUo6
TUlOIFJNIMKgU0laRSBSTyBUWVBFIMKgTU9VTlRQT0lOVDwvZGl2PjxkaXY+Jmd0O3NkayDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDg6MTYw
IMKgMCDCoCDCoDZHIMKgMCBkaXNrIMKgPC9kaXY+PGRpdj4mZ3Q74pSU4pSAMzYwMDE0MDVlODg0
YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljIMKgIMKgMjUzOjEzIMKgIDAgwqAgwqA2RyDCoDAgbXBhdGjC
oDwvZGl2PjxkaXY+Jmd0OyDCoOKUnOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5
YzEgMjUzOjE0IMKgIDAgwqAgwqAxTSDCoDAgcGFydCDCoDwvZGl2PjxkaXY+Jmd0OyDCoOKUnOKU
gDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzIgMjUzOjE1IMKgIDAgwqAgwqAxRyDC
oDAgcGFydCDCoDwvZGl2PjxkaXY+Jmd0OyDCoOKUnOKUgDM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZk
YmE2OTAxMDk5YzMgMjUzOjE2IMKgIDAgwqA2MTVNIMKgMCBwYXJ0IMKgPC9kaXY+PGRpdj4mZ3Q7
IMKg4pSU4pSAMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljNCAyNTM6MTcgwqAgMCDC
oDQuNEcgwqAwIHBhcnQgwqA8L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsjIHFlbXUtaW1n
IGNvbnZlcnQgLXAgLWYgcmF3IC1PIHJhdyAtdCBub25lIC1UIG5vbmUgZGlzay5pbWcgL2Rldi9t
YXBwZXIvMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljPC9kaXY+PGRpdj4mZ3Q7IMKg
IMKgKDEwMC4wMC8xMDAlKTwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0O1dvcmtzLCB3aXBp
bmcgdGhlIHBhcnRpdGlvbnMuPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7IyBtb3VudCAv
ZGV2L21hcHBlci8zNjAwMTQwNWU4ODRhYjhmZjRiNDRmZGJhNjkwMTA5OWM0IC90bXAvbW50PC9k
aXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7IyBtb3VudCB8IGdyZXAgL2Rldi9tYXBwZXIvMzYw
MDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljNDwvZGl2PjxkaXY+Jmd0Oy9kZXYvbWFwcGVy
LzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzQgb24gL3RtcC9tbnQgdHlwZSB4ZnMg
KHJ3LHJlbGF0aW1lLHNlY2xhYmVsLGF0dHIyLGlub2RlNjQsbG9nYnVmcz04LGxvZ2JzaXplPTMy
ayxub3F1b3RhKTwvZGl2PjxkaXY+Jmd0OzwvZGl2PjxkaXY+Jmd0O1RoaXMgaXMgaW52YWxpZCB1
c2UsIGNvbnZlcnRpbmcgdG8gZGV2aWNlIHdpdGggbW91bnRlZCBmaWxlIHN5c3RlbSwgYnV0IGxl
dCYjMzk7cyB0cnk6PC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7IyBxZW11LWltZyBjb252
ZXJ0IC1wIC1mIHJhdyAtTyByYXcgLXQgbm9uZSAtVCBub25lIGRpc2suaW1nIC9kZXYvbWFwcGVy
LzM2MDAxNDA1ZTg4NGFiOGZmNGI0NGZkYmE2OTAxMDk5YzwvZGl2PjxkaXY+Jmd0OyDCoCDCoCgx
MDAuMDAvMTAwJSk8L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDtTdGlsbCB3b3Jrcz8hPC9k
aXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7IyB3aXBlZnMgLWEgL2Rldi9tYXBwZXIvMzYwMDE0
MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljPC9kaXY+PGRpdj4mZ3Q7d2lwZWZzOiBlcnJvcjog
L2Rldi9tYXBwZXIvMzYwMDE0MDVlODg0YWI4ZmY0YjQ0ZmRiYTY5MDEwOTljOiBwcm9iaW5nIGlu
aXRpYWxpemF0aW9uIGZhaWxlZDogRGV2aWNlIG9yIHJlc291cmNlIGJ1c3k8L2Rpdj48ZGl2PiZn
dDs8L2Rpdj48ZGl2PiZndDsjIGJsa2Rpc2NhcmQgL2Rldi9tYXBwZXIvMzYwMDE0MDVlODg0YWI4
ZmY0YjQ0ZmRiYTY5MDEwOTljPC9kaXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7V29ya3MuPC9k
aXY+PGRpdj4mZ3Q7PC9kaXY+PGRpdj4mZ3Q7VGhpcyB0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUg
TFVOIG9uIHRoZSBzZXJ2ZXIgc2lkZTo8L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsgwqAg
eyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgJnF1b3Q7YWlvJnF1b3Q7OiBmYWxz
ZSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2Pjxk
aXY+Jmd0OyDCoCDCoCDCoCZxdW90O2FsdWFfdHBncyZxdW90OzogWyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoHsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoCDCoCZxdW90O2FsdWFfYWNjZXNzX3N0YXRl
JnF1b3Q7OiAwLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKg
IMKgIMKgIMKgJnF1b3Q7YWx1YV9hY2Nlc3Nfc3RhdHVzJnF1b3Q7OiAwLCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoCDCoCZxdW90O2FsdWFfYWNjZXNz
X3R5cGUmcXVvdDs6IDMsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj4mZ3Q7
IMKgIMKgIMKgIMKgIMKgJnF1b3Q7YWx1YV9zdXBwb3J0X2FjdGl2ZV9ub25vcHRpbWl6ZWQmcXVv
dDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgIMKgJnF1b3Q7YWx1YV9zdXBwb3J0
X2FjdGl2ZV9vcHRpbWl6ZWQmcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAg
wqAgwqAgwqAmcXVvdDthbHVhX3N1cHBvcnRfb2ZmbGluZSZxdW90OzogMSwgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAgwqAmcXVvdDthbHVhX3N1cHBvcnRf
c3RhbmRieSZxdW90OzogMSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAg
wqAgwqAgwqAgwqAmcXVvdDthbHVhX3N1cHBvcnRfdHJhbnNpdGlvbmluZyZxdW90OzogMSwgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAgwqAmcXVvdDthbHVhX3N1cHBvcnRf
dW5hdmFpbGFibGUmcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKg
IMKgIMKgIMKgJnF1b3Q7YWx1YV93cml0ZV9tZXRhZGF0YSZxdW90OzogMCwgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoCDCoCZxdW90O2ltcGxpY2l0X3Ry
YW5zX3NlY3MmcXVvdDs6IDAsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj48ZGl2PiZndDsg
wqAgwqAgwqAgwqAgwqAmcXVvdDtuYW1lJnF1b3Q7OiAmcXVvdDtkZWZhdWx0X3RnX3B0X2dwJnF1
b3Q7LCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgIMKgJnF1
b3Q7bm9ub3BfZGVsYXlfbXNlY3MmcXVvdDs6IDEwMCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwv
ZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoCDCoCZxdW90O3ByZWZlcnJlZCZxdW90OzogMCwgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDC
oCDCoCDCoCZxdW90O3RnX3B0X2dwX2lkJnF1b3Q7OiAwLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgIMKgJnF1b3Q7dHJhbnNfZGVs
YXlfbXNlY3MmcXVvdDs6IDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PiZn
dDsgwqAgwqAgwqAgwqB9IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqBdLCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2
PjxkaXY+Jmd0OyDCoCDCoCDCoCZxdW90O2F0dHJpYnV0ZXMmcXVvdDs6IHsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDC
oCZxdW90O2Jsb2NrX3NpemUmcXVvdDs6IDUxMiwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDtlbXVsYXRlXzNwYyZxdW90
OzogMSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+Jmd0
OyDCoCDCoCDCoCDCoCZxdW90O2VtdWxhdGVfY2F3JnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgJnF1b3Q7ZW11
bGF0ZV9kcG8mcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8
L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDtlbXVsYXRlX2Z1YV9yZWFkJnF1b3Q7OiAx
LCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDC
oCZxdW90O2VtdWxhdGVfZnVhX3dyaXRlJnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgJnF1b3Q7ZW11bGF0ZV9tb2RlbF9hbGlh
cyZxdW90OzogMSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDC
oCDCoCDCoCZxdW90O2VtdWxhdGVfcHImcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgJnF1b3Q7ZW11bGF0ZV9y
ZXN0X3Jlb3JkJnF1b3Q7OiAwLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2PjxkaXY+
Jmd0OyDCoCDCoCDCoCDCoCZxdW90O2VtdWxhdGVfdGFzJnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgJnF1b3Q7
ZW11bGF0ZV90cHUmcXVvdDs6IDEsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
wqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDtlbXVsYXRlX3Rwd3MmcXVvdDs6IDEs
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKg
IMKgIMKgJnF1b3Q7ZW11bGF0ZV91YV9pbnRsY2tfY3RybCZxdW90OzogMCwgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDtlbXVsYXRlX3dyaXRlX2Nh
Y2hlJnF1b3Q7OiAxLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKg
IMKgIMKgIMKgJnF1b3Q7ZW5mb3JjZV9wcl9pc2lkcyZxdW90OzogMSwgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDtmb3JjZV9wcl9h
cHRwbCZxdW90OzogMCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2
PiZndDsgwqAgwqAgwqAgwqAmcXVvdDtpc19ub25yb3QmcXVvdDs6IDAsIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVv
dDttYXhfdW5tYXBfYmxvY2tfZGVzY19jb3VudCZxdW90OzogMSwgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rp
dj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDttYXhfdW5tYXBfbGJhX2NvdW50JnF1b3Q7OiA4
MTkyLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoCZxdW90
O21heF93cml0ZV9zYW1lX2xlbiZxdW90OzogNjUzMzUsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9k
aXY+PGRpdj4mZ3Q7IMKgIMKgIMKgIMKgJnF1b3Q7b3B0aW1hbF9zZWN0b3JzJnF1b3Q7OiAxNjM4
NCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoCZx
dW90O3BpX3Byb3RfZm9ybWF0JnF1b3Q7OiAwLCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCDCoCZxdW90O3BpX3Byb3RfdHlwZSZxdW90Ozog
MCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAg
wqAgwqAgwqAmcXVvdDtwaV9wcm90X3ZlcmlmeSZxdW90OzogMCwgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDtxdWV1ZV9kZXB0
aCZxdW90OzogMTI4LCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoMKgPC9kaXY+PGRp
dj4mZ3Q7IMKgIMKgIMKgIMKgJnF1b3Q7dW5tYXBfZ3JhbnVsYXJpdHkmcXVvdDs6IDEsIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDt1
bm1hcF9ncmFudWxhcml0eV9hbGlnbm1lbnQmcXVvdDs6IDAsIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj48
ZGl2PiZndDsgwqAgwqAgwqAgwqAmcXVvdDt1bm1hcF96ZXJvZXNfZGF0YSZxdW90OzogMCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoH0sIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
PC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgJnF1b3Q7ZGV2JnF1b3Q7OiAmcXVvdDsvdGFyZ2V0LzMv
MDkmcXVvdDssIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj4mZ3Q7
IMKgIMKgIMKgJnF1b3Q7bmFtZSZxdW90OzogJnF1b3Q7My0wOSZxdW90OywgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+Jmd0OyDCoCDCoCDCoCZx
dW90O3BsdWdpbiZxdW90OzogJnF1b3Q7ZmlsZWlvJnF1b3Q7LCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgIMKgJnF1b3Q7c2l6ZSZxdW90
OzogNjQ0MjQ1MDk0NCwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoDwvZGl2
PjxkaXY+Jmd0OyDCoCDCoCDCoCZxdW90O3dyaXRlX2JhY2smcXVvdDs6IHRydWUsIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj48ZGl2PiZndDsgwqAgwqAgwqAmcXVv
dDt3d24mcXVvdDs6ICZxdW90O2U4ODRhYjhmLWY0YjQtNGZkYi1hNjkwLTEwOTljMDcyYzg2ZCZx
dW90OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oMKgPC9kaXY+PGRpdj4mZ3Q7IMKgIMKgfSwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PiZndDs8L2Rpdj48
ZGl2PiZndDtNYXliZSB0aGlzIHVwc3RyZWFtIGNoYW5nZSBpcyBub3QgaW4gYWxsIGRvd25zdHJl
YW0gNS4xMSBrZXJuZWxzLCBvciA1LjExLjc8L2Rpdj48ZGl2PiZndDthbHJlYWR5IGluY2x1ZGVz
IHRoZSBmaXg/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5MaW51eCA1LjEwLjI0LzUuMTEuNyBh
bHJlYWR5IG1lcmdlZCB0aGUgZml4IG9uIDIwMjEtMDMtMTcgYnkgR3JlZyBLcm9haC1IYXJ0bWFu
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2g9bGlu
dXgtNS4xMS55JmFtcDtpZD03ZTA4MTU3OTc2NTZmMDI5ZmFiMmVkYzMwOTQwNmNkZGY5MzFiOWQ4
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2g9bGludXgtNS4xMS55JmFtcDtpZD03
ZTA4MTU3OTc2NTZmMDI5ZmFiMmVkYzMwOTQwNmNkZGY5MzFiOWQ4PC9hPjwvZGl2PjxkaXY+PGEg
aHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3Rh
YmxlL2xpbnV4LmdpdC9jb21taXQvP2g9bGludXgtNS4xMC55JmFtcDtpZD1kNDRjOTc4MGVkNDBk
Yjg4NjI2YzkzNTQ4NjhlYWI3MjE1OWM3YTdmIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21t
aXQvP2g9bGludXgtNS4xMC55JmFtcDtpZD1kNDRjOTc4MGVkNDBkYjg4NjI2YzkzNTQ4NjhlYWI3
MjE1OWM3YTdmPC9hPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+IyBnaXQgZGVzY3JpYmUgZDQ0
Yzk3ODBlZDQwZGI4ODYyNmM5MzU0ODY4ZWFiNzIxNTljN2E3ZjwvZGl2PjxkaXY+djUuMTAuMjMt
MTg0LWdkNDRjOTc4MGVkNDA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiMgZ2l0IGRlc2NyaWJl
IDdlMDgxNTc5NzY1NmYwMjlmYWIyZWRjMzA5NDA2Y2RkZjkzMWI5ZDg8L2Rpdj48ZGl2PnY1LjEx
LjYtMTc4LWc3ZTA4MTU3OTc2NTY8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9k
aXY+PGRpdj5TbyB0aGlzIGlzIHByYWN0aWNhbGx5IGZpeGVkLjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SSBkb24mIzM5O3QgdGhpbmsga2VlcGluZyBhIHdvcmthcm91bmQgZm9yIHRoaXMgaW4g
cWVtdSBpcyBhIGdvb2QgaWRlYS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxl
ZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj48ZGl2
PiZndDtBZGRpbmcgQmVuLCBtYXliZSBoZSBoYWQgbW9yZSBpbnNpZ2h0IG9uIHRoZSBtdWx0aXBh
dGggc2lkZS48L2Rpdj48ZGl2PiZndDs8L2Rpdj48ZGl2PiZndDsmZ3Q7SWYgSSB1bmRlcnN0YW5k
IHRoZSBrZXJuZWwgY2hhbmdlIGNvcnJlY3RseSwgdGhpcyBjYW4gaGFwcGVuIHdoZW4gdGhlcmUg
aXM8L2Rpdj48ZGl2PiZndDsmZ3Q7YSBtb3VudGVkIGZpbGUgc3lzdGVtIG9uIHRvcCBvZiB0aGUg
bXVsdGlwYXRoIGRldmljZS4gSSBkb24mIzM5O3QgdGhpbmsgd2UgaGF2ZcKgPC9kaXY+PGRpdj4m
Z3Q7Jmd0O2EgdXNlIGNhc2Ugd2hlbiBxZW11IGFjY2Vzc2VzIGEgbXVsdGlwYXRoIGRldmljZSB3
aGVuIHRoZSBkZXZpY2UgaXMgdXNlZDwvZGl2PjxkaXY+Jmd0OyZndDtieSBhIGZpbGUgc3lzdGVt
LCBidXQgbWF5YmUgSSBtaXNzZWQgc29tZXRoaW5nLjwvZGl2PjxkaXY+Jmd0OyZndDvCoDwvZGl2
PjxkaXY+Jmd0OyZndDtTbyB0aGF0IHRvIG1lIGltcGxpZXPCoDwvZGl2PjxkaXY+Jmd0OyZndDt0
aGF0IHdlIGFjdHVhbGx5IHNob3VsZCBub3QgcmV0cnkgQkxLWkVST09VVCwgYmVjYXVzZSB0aGUg
RUJVU1kgd2lsbMKgPC9kaXY+PGRpdj4mZ3Q7Jmd0O3JlbWFpbiwgYW5kIHRoYXQgY29uZGl0aW9u
IHdvbuKAmXQgY2hhbmdlIHdoaWxlIHRoZSBibG9jayBkZXZpY2UgaXMgaW4gdXNlwqA8L2Rpdj48
ZGl2PiZndDsmZ3Q7YnkgcWVtdS48L2Rpdj48ZGl2PiZndDsmZ3Q7PC9kaXY+PGRpdj4mZ3Q7Jmd0
O09uIHRoZSBvdGhlciBoYW5kLCBpbiB0aGUgY29kZSwgeW91IGhhdmUgZGVjaWRlZCBub3QgdG8g
cmVzZXTCoDwvZGl2PjxkaXY+Jmd0OyZndDtoYXNfd3JpdGVfemVyb2VzIHRvIGZhbHNlLCBzbyB0
aGUgaW1wbGVtZW50YXRpb24gd2lsbCByZXRyeS48L2Rpdj48ZGl2PiZndDsmZ3Q7PC9kaXY+PGRp
dj4mZ3Q7Jmd0O0VCVVNZIGlzIHVzdWFsbHkgYSB0ZW1wb3JhcnkgZXJyb3IsIHNvIHJldHJ5aW5n
IG1ha2VzIHNlbnNlLiBUaGUgcXVlc3Rpb248L2Rpdj48ZGl2PiZndDsmZ3Q7aXMgaWYgd2UgcmVh
bGx5IGNhbiB3cml0ZSB6ZXJvZXMgbWFudWFsbHkgaW4gdGhpcyBjYXNlPzwvZGl2PjxkaXY+Jmd0
OyZndDvCoDwvZGl2PjxkaXY+Jmd0OyZndDtTbyBJIGRvbuKAmXQgcXVpdGUgdW5kZXJzdGFuZC7C
oCBTaG91bGQgd2Uga2VlcCB0cnlpbmcgQkxLWkVST09VVCBvciBpc8KgPC9kaXY+PGRpdj4mZ3Q7
Jmd0O3RoZXJlIG5vIGNoYW5jZSBvZiBpdCB3b3JraW5nIGFmdGVyIGl0IGhhcyBhdCBvbmUgcG9p
bnQgZmFpbGVkIHdpdGjCoDwvZGl2PjxkaXY+Jmd0OyZndDtFQlVTWT8gwqAoQXJlIHRoZXJlIG90
aGVyIGNhc2VzIGJlc2lkZXMgd2hhdOKAmXMgZGVzY3JpYmVkIGluIHRoaXMgY29tbWl0wqA8L2Rp
dj48ZGl2PiZndDsmZ3Q7bWVzc2FnZSB3aGVyZSBFQlVTWSBtaWdodCBiZSByZXR1cm5lZCBhbmQg
aXQgaXMgb25seSB0ZW1wb3Jhcnk/KTwvZGl2PjxkaXY+Jmd0OyZndDs8L2Rpdj48ZGl2PiZndDsm
Z3Q7Jmd0OyBGYWxsYmFjayB0byBwd3JpdGV2IGluc3RlYWQgb2YgZXhpdCBmb3IgLUVCVVNZIGVy
cm9yLjwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7wqA8L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0OyBUaGUg
aXNzdWUgd2FzIGludHJvZHVjZWQgaW4gTGludXggNS4xMDo8L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0
OyA8YSBocmVmPSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9Mzg0ZDg3ZWYyYzk1NGZjNThlNmM1ZmQ4MjUz
ZTRhMTk4NGY1ZmUwMiIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD0zODRkODdl
ZjJjOTU0ZmM1OGU2YzVmZDgyNTNlNGExOTg0ZjVmZTAyPC9hPjwvZGl2PjxkaXY+Jmd0OyZndDsm
Z3Q7wqA8L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0OyBGaXhlZCBpbiBMaW51eCA1LjEyOjwvZGl2Pjxk
aXY+Jmd0OyZndDsmZ3Q7IDxhIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTU2ODg3Y2ZmZTk0
NmJiMGE5MGM3NDQyOWZhOTRkNjExMGE3MzExOWQiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
Y29tbWl0Lz9pZD01Njg4N2NmZmU5NDZiYjBhOTBjNzQ0MjlmYTk0ZDYxMTBhNzMxMTlkPC9hPjwv
ZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7wqA8L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0OyBTaWduZWQtb2Zm
LWJ5OiBDaGFuZ0xpbWluICZsdDs8YSBocmVmPSJtYWlsdG86Y2hhbmdsbUBjaGluYXRlbGVjb20u
Y24iIHRhcmdldD0iX2JsYW5rIj5jaGFuZ2xtQGNoaW5hdGVsZWNvbS5jbjwvYT4mZ3Q7PC9kaXY+
PGRpdj4mZ3Q7Jmd0OyZndDsgLS0tPC9kaXY+PGRpdj4mZ3Q7Jmd0OyZndDsgwqAgYmxvY2svZmls
ZS1wb3NpeC5jIHwgOCArKysrKystLTwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IMKgIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pPC9kaXY+PGRpdj4mZ3Q7Jmd0
OyZndDvCoDwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IGRpZmYgLS1naXQgYS9ibG9jay9maWxlLXBv
c2l4LmMgYi9ibG9jay9maWxlLXBvc2l4LmM8L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0OyBpbmRleCAy
MGUxNGY4ZTk2Li5kNDA1NGFjOWNiIDEwMDY0NDwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IC0tLSBh
L2Jsb2NrL2ZpbGUtcG9zaXguYzwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7ICsrKyBiL2Jsb2NrL2Zp
bGUtcG9zaXguYzwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IEBAIC0xNjI0LDggKzE2MjQsMTIgQEAg
c3RhdGljIHNzaXplX3TCoDwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IGhhbmRsZV9haW9jYl93cml0
ZV96ZXJvZXNfYmxvY2soUmF3UG9zaXhBSU9EYXRhICphaW9jYik8L2Rpdj48ZGl2PiZndDsmZ3Q7
Jmd0OyDCoCDCoCDCoCDCoCDCoCB9IHdoaWxlIChlcnJubyA9PSBFSU5UUik7PC9kaXY+PGRpdj4m
Z3Q7Jmd0OyZndDvCoDwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IMKgIMKgIMKgIMKgIMKgIHJldCA9
IHRyYW5zbGF0ZV9lcnIoLWVycm5vKTs8L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0OyAtIMKgIMKgIMKg
IMKgaWYgKHJldCA9PSAtRU5PVFNVUCkgezwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7IC0gwqAgwqAg
wqAgwqAgwqAgwqBzLSZndDtoYXNfd3JpdGVfemVyb2VzID0gZmFsc2U7PC9kaXY+PGRpdj4mZ3Q7
Jmd0OyZndDsgKyDCoCDCoCDCoCDCoHN3aXRjaCAocmV0KSB7PC9kaXY+PGRpdj4mZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoGNhc2UgLUVOT1RTVVA6PC9kaXY+PGRpdj4mZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoHMtJmd0O2hhc193cml0ZV96ZXJvZXMgPSBmYWxzZTsgLyogZmFsbCB0
aHJvdWdoICovPC9kaXY+PGRpdj4mZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoGNhc2UgLUVCVVNZ
OiAvKiBMaW51eCA1LjEwLzUuMTEgbWF5IHJldHVybiAtRUJVU1kgZm9yIG11bHRpcGF0aMKgPC9k
aXY+PGRpdj4mZ3Q7Jmd0OyZndDsgZGV2aWNlcyAqLzwvZGl2PjxkaXY+Jmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVOT1RTVVA7PC9kaXY+PGRpdj4mZ3Q7Jmd0OyZndDsg
KyDCoCDCoCDCoCDCoCDCoCDCoGJyZWFrOzwvZGl2PjxkaXY+Jmd0OyZndDs8L2Rpdj48ZGl2PiZn
dDsmZ3Q7KE5vdCBzdXJlIHdoeSB0aGlzIGJyZWFrIGlzIGhlcmUuKTwvZGl2PjxkaXY+Jmd0OyZn
dDs8L2Rpdj48ZGl2PiZndDsmZ3Q7TWF4PC9kaXY+PGRpdj4mZ3Q7Jmd0OzwvZGl2PjxkaXY+Jmd0
OyZndDsmZ3Q7IMKgIMKgIMKgIMKgIMKgIH08L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0OyDCoCDCoCDC
oCB9PC9kaXY+PGRpdj4mZ3Q7Jmd0OyZndDsgwqAgI2VuZGlmPC9kaXY+PGRpdj4mZ3Q7Jmd0OyZn
dDsgLS08L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0OyAyLjI3LjA8L2Rpdj48ZGl2PiZndDsmZ3Q7Jmd0
O8KgPC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pg0K

--000000000000f41deb05be75b1fb--


