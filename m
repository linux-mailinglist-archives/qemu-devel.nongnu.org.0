Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A33B964D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 20:59:10 +0200 (CEST)
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz1u0-0005ul-U4
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 14:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kamal.mostafa@canonical.com>)
 id 1lz0q9-0002zU-PX
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:51:05 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <kamal.mostafa@canonical.com>)
 id 1lz0q6-00034m-Ar
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 13:51:05 -0400
Received: from mail-oi1-f197.google.com ([209.85.167.197])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kamal.mostafa@canonical.com>) id 1lz0pz-0005Cq-2i
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:50:55 +0000
Received: by mail-oi1-f197.google.com with SMTP id
 b185-20020acab2c20000b02901f6dd5f89fbso3643177oif.10
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 10:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hb5jXhUNe8PiwGYTA7IRxh9VDG1fm/eOMUKBPvugec=;
 b=hRd7Hme3N46gcZGXY3ZXLcldWnMKF/gruXs+KwZLN+swAAoM8vTQsWkxD1ybIINLKT
 cZynSoQLFP5SwmgYM5h2NWPXX+b18ocT3kwOcagNpqhfDfcpRQ3H3W7ZnT7pJRKH+s7w
 BbI/zi/oAZ3Yz6kf/NzNxBmHOsSKYCeqUN5WbiRUBMWDzrwvLg2FnACPhZwEpz7u6/7c
 toa78qisl7MUThiaQfFZ9JXA0W/0U6B8PUx5R2lrJ4McTskHFqxpIDuSRU4wjMj8ECr/
 C2gkNIROgivcIzCUdHf3HI+4AUAAugYMsOI14CIBBKCmVzRWgX8FQN9ZWwpba2YrjSSJ
 979A==
X-Gm-Message-State: AOAM5308NLBg61xQYLgN5b8AJWWI9VSY7KBEXdboZq2FwVxzsT2FX96u
 MdoNMpGHqeRa4MlCuVWOJCHLSYkOOLtD5+uAUoH8yReZHb0iXqjdJENnzW+v/BlLV2V/HK15Vks
 p9z8Q/5FucUuirAMChYpQzPC5dJzrPLb68c5OCTZY7Rs0VuE=
X-Received: by 2002:a9d:1b05:: with SMTP id l5mr942255otl.335.1625161853296;
 Thu, 01 Jul 2021 10:50:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0OedRYuOmfEiY7u/3GTDlRrzzs4zEuJPhDKNZri8Mxvg3JzXm5Wh5j5hzyBJml2bI6jt46uxh4T1BnVi8qqA=
X-Received: by 2002:a9d:1b05:: with SMTP id l5mr942241otl.335.1625161853037;
 Thu, 01 Jul 2021 10:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f2Nmu_XNjE8SM+jzfaNZfzyFowN3Cf8Lgw36FT+gqqPAg@mail.gmail.com>
In-Reply-To: <CAD14+f2Nmu_XNjE8SM+jzfaNZfzyFowN3Cf8Lgw36FT+gqqPAg@mail.gmail.com>
From: Kamal Mostafa <kamal@canonical.com>
Date: Thu, 1 Jul 2021 10:50:37 -0700
Message-ID: <CAEO-eVO_hEvGzoUdoExs67ybfQC0WgpwOLbg3n9fc+R4JfikZQ@mail.gmail.com>
Subject: Re: Possible io_uring regression with QEMU on Ubuntu's kernel
To: Juhyung Park <qkrwngud825@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f4066b05c6137a9f"
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=kamal.mostafa@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Jul 2021 14:57:57 -0400
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
Cc: Jens Axboe <axboe@kernel.dk>, Kamal Mostafa <kamal@canonical.com>,
 qemu-devel@nongnu.org, Stefan Bader <stefan.bader@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>,
 io-uring <io-uring@vger.kernel.org>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f4066b05c6137a9f
Content-Type: text/plain; charset="UTF-8"

Hi-

Thanks very much for reporting this.  We picked up that patch ("io_uring:
don't mark S_ISBLK async work as unbounded") for our Ubuntu v5.8 kernel
from linux-stable/v5.10.31.  Since it's not clear that it's appropriate for
v5.8 (or even v5.10-stable?) we'll revert it from Ubuntu v5.8 if you can
confirm that actually fixes the problem.

Here's a test build of that (5.8.0-59 with that commit reverted).  The full
set of packages is provided, but you probably only actually need to install
the linux-image and linux-modules[-extra] deb's. We'll stand by for your
results:
https://kernel.ubuntu.com/~kamal/uringrevert0/

Thanks again,

 -Kamal Mostafa (Canonical Kernel Team)

On Wed, Jun 30, 2021 at 1:47 AM Juhyung Park <qkrwngud825@gmail.com> wrote:

> Hi everyone.
>
> With the latest Ubuntu 20.04's HWE kernel 5.8.0-59, I'm noticing some
> weirdness when using QEMU/libvirt with the following storage
> configuration:
>
> <disk type="block" device="disk">
>   <driver name="qemu" type="raw" cache="none" io="io_uring"
> discard="unmap" detect_zeroes="unmap"/>
>   <source
> dev="/dev/disk/by-id/md-uuid-df271a1e:9dfb7edb:8dc4fbb8:c43e652f-part1"
> index="1"/>
>   <backingStore/>
>   <target dev="vda" bus="virtio"/>
>   <alias name="virtio-disk0"/>
>   <address type="pci" domain="0x0000" bus="0x07" slot="0x00"
> function="0x0"/>
> </disk>
>
> QEMU version is 5.2+dfsg-9ubuntu3 and libvirt version is 7.0.0-2ubuntu2.
>
> The guest VM is unable to handle I/O properly with io_uring, and
> nuking io="io_uring" fixes the issue.
> On one machine (EPYC 7742), the partition table cannot be read and on
> another (Ryzen 9 3950X), ext4 detects weirdness with journaling and
> ultimately remounts the guest disk to R/O:
>
> [    2.712321] virtio_blk virtio5: [vda] 3906519775 512-byte logical
> blocks (2.00 TB/1.82 TiB)
> [    2.714054] vda: detected capacity change from 0 to 2000138124800
> [    2.963671] blk_update_request: I/O error, dev vda, sector 0 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.964909] Buffer I/O error on dev vda, logical block 0, async page
> read
> [    2.966021] blk_update_request: I/O error, dev vda, sector 1 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.967177] Buffer I/O error on dev vda, logical block 1, async page
> read
> [    2.968330] blk_update_request: I/O error, dev vda, sector 2 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.969504] Buffer I/O error on dev vda, logical block 2, async page
> read
> [    2.970767] blk_update_request: I/O error, dev vda, sector 3 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.971624] Buffer I/O error on dev vda, logical block 3, async page
> read
> [    2.972170] blk_update_request: I/O error, dev vda, sector 4 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.972728] Buffer I/O error on dev vda, logical block 4, async page
> read
> [    2.973308] blk_update_request: I/O error, dev vda, sector 5 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.973920] Buffer I/O error on dev vda, logical block 5, async page
> read
> [    2.974496] blk_update_request: I/O error, dev vda, sector 6 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.975093] Buffer I/O error on dev vda, logical block 6, async page
> read
> [    2.975685] blk_update_request: I/O error, dev vda, sector 7 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.976295] Buffer I/O error on dev vda, logical block 7, async page
> read
> [    2.980074] blk_update_request: I/O error, dev vda, sector 0 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.981104] Buffer I/O error on dev vda, logical block 0, async page
> read
> [    2.981786] blk_update_request: I/O error, dev vda, sector 1 op
> 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [    2.982083] ixgbe 0000:06:00.0: Multiqueue Enabled: Rx Queue count
> = 63, Tx Queue count = 63 XDP Queue count = 0
> [    2.982442] Buffer I/O error on dev vda, logical block 1, async page
> read
> [    2.983642] ldm_validate_partition_table(): Disk read failed.
>
> Kernel 5.8.0-55 is fine, and the only io_uring-related change between
> 5.8.0-55 and 5.8.0-59 is the commit 4b982bd0f383 ("io_uring: don't
> mark S_ISBLK async work as unbounded").
>
> The weird thing is that this commit was first introduced with v5.12,
> but neither the mainline v5.12.0 or v5.13.0 is affected by this issue.
>
> I guess one of these commits following the backported commit from
> v5.12 fixes the issue, but that's just a guess. It might be another
> earlier commit:
> c7d95613c7d6 io_uring: fix early sqd_list removal sqpoll hangs
> 9728463737db io_uring: fix rw req completion
> 6ad7f2332e84 io_uring: clear F_REISSUE right after getting it
> e82ad4853948 io_uring: fix !CONFIG_BLOCK compilation failure
> 230d50d448ac io_uring: move reissue into regular IO path
> 07204f21577a io_uring: fix EIOCBQUEUED iter revert
> 696ee88a7c50 io_uring/io-wq: protect against sprintf overflow
>
> It would be much appreciated if Jens could give pointers to Canonical
> developers on how to fix the issue, and hopefully a suggestion to
> prevent this from happening again.
>
> Thanks,
> Regards
>

--000000000000f4066b05c6137a9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi-</div><div><br></div>Thanks very much for reportin=
g this.=C2=A0 We picked up that patch (&quot;io_uring: don&#39;t mark S_ISB=
LK async work as unbounded&quot;) for our Ubuntu v5.8 kernel from linux-sta=
ble/v5.10.31.=C2=A0 Since it&#39;s not clear that it&#39;s appropriate for =
v5.8 (or even v5.10-stable?) we&#39;ll revert it from Ubuntu v5.8 if you ca=
n confirm=C2=A0that actually fixes the problem.<div><br></div><div>Here&#39=
;s a test build of that (5.8.0-59 with that commit reverted).=C2=A0 The ful=
l set of packages is provided, but you probably only actually need to insta=
ll the linux-image and linux-modules[-extra] deb&#39;s. We&#39;ll stand by =
for your results:</div><div><a href=3D"https://kernel.ubuntu.com/~kamal/uri=
ngrevert0/">https://kernel.ubuntu.com/~kamal/uringrevert0/</a></div><div><b=
r></div><div>Thanks again,</div><div><br></div><div>=C2=A0-Kamal Mostafa (C=
anonical Kernel Team)<br><div><br></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jun 30, 2021 at 1:47 AM Juhyung Park =
&lt;<a href=3D"mailto:qkrwngud825@gmail.com">qkrwngud825@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi everyo=
ne.<br>
<br>
With the latest Ubuntu 20.04&#39;s HWE kernel 5.8.0-59, I&#39;m noticing so=
me<br>
weirdness when using QEMU/libvirt with the following storage<br>
configuration:<br>
<br>
&lt;disk type=3D&quot;block&quot; device=3D&quot;disk&quot;&gt;<br>
=C2=A0 &lt;driver name=3D&quot;qemu&quot; type=3D&quot;raw&quot; cache=3D&q=
uot;none&quot; io=3D&quot;io_uring&quot;<br>
discard=3D&quot;unmap&quot; detect_zeroes=3D&quot;unmap&quot;/&gt;<br>
=C2=A0 &lt;source dev=3D&quot;/dev/disk/by-id/md-uuid-df271a1e:9dfb7edb:8dc=
4fbb8:c43e652f-part1&quot;<br>
index=3D&quot;1&quot;/&gt;<br>
=C2=A0 &lt;backingStore/&gt;<br>
=C2=A0 &lt;target dev=3D&quot;vda&quot; bus=3D&quot;virtio&quot;/&gt;<br>
=C2=A0 &lt;alias name=3D&quot;virtio-disk0&quot;/&gt;<br>
=C2=A0 &lt;address type=3D&quot;pci&quot; domain=3D&quot;0x0000&quot; bus=
=3D&quot;0x07&quot; slot=3D&quot;0x00&quot; function=3D&quot;0x0&quot;/&gt;=
<br>
&lt;/disk&gt;<br>
<br>
QEMU version is 5.2+dfsg-9ubuntu3 and libvirt version is 7.0.0-2ubuntu2.<br=
>
<br>
The guest VM is unable to handle I/O properly with io_uring, and<br>
nuking io=3D&quot;io_uring&quot; fixes the issue.<br>
On one machine (EPYC 7742), the partition table cannot be read and on<br>
another (Ryzen 9 3950X), ext4 detects weirdness with journaling and<br>
ultimately remounts the guest disk to R/O:<br>
<br>
[=C2=A0 =C2=A0 2.712321] virtio_blk virtio5: [vda] 3906519775 512-byte logi=
cal<br>
blocks (2.00 TB/1.82 TiB)<br>
[=C2=A0 =C2=A0 2.714054] vda: detected capacity change from 0 to 2000138124=
800<br>
[=C2=A0 =C2=A0 2.963671] blk_update_request: I/O error, dev vda, sector 0 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.964909] Buffer I/O error on dev vda, logical block 0, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.966021] blk_update_request: I/O error, dev vda, sector 1 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.967177] Buffer I/O error on dev vda, logical block 1, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.968330] blk_update_request: I/O error, dev vda, sector 2 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.969504] Buffer I/O error on dev vda, logical block 2, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.970767] blk_update_request: I/O error, dev vda, sector 3 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.971624] Buffer I/O error on dev vda, logical block 3, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.972170] blk_update_request: I/O error, dev vda, sector 4 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.972728] Buffer I/O error on dev vda, logical block 4, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.973308] blk_update_request: I/O error, dev vda, sector 5 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.973920] Buffer I/O error on dev vda, logical block 5, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.974496] blk_update_request: I/O error, dev vda, sector 6 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.975093] Buffer I/O error on dev vda, logical block 6, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.975685] blk_update_request: I/O error, dev vda, sector 7 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.976295] Buffer I/O error on dev vda, logical block 7, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.980074] blk_update_request: I/O error, dev vda, sector 0 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.981104] Buffer I/O error on dev vda, logical block 0, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.981786] blk_update_request: I/O error, dev vda, sector 1 o=
p<br>
0x0:(READ) flags 0x0 phys_seg 1 prio class 0<br>
[=C2=A0 =C2=A0 2.982083] ixgbe 0000:06:00.0: Multiqueue Enabled: Rx Queue c=
ount<br>
=3D 63, Tx Queue count =3D 63 XDP Queue count =3D 0<br>
[=C2=A0 =C2=A0 2.982442] Buffer I/O error on dev vda, logical block 1, asyn=
c page read<br>
[=C2=A0 =C2=A0 2.983642] ldm_validate_partition_table(): Disk read failed.<=
br>
<br>
Kernel 5.8.0-55 is fine, and the only io_uring-related change between<br>
5.8.0-55 and 5.8.0-59 is the commit 4b982bd0f383 (&quot;io_uring: don&#39;t=
<br>
mark S_ISBLK async work as unbounded&quot;).<br>
<br>
The weird thing is that this commit was first introduced with v5.12,<br>
but neither the mainline v5.12.0 or v5.13.0 is affected by this issue.<br>
<br>
I guess one of these commits following the backported commit from<br>
v5.12 fixes the issue, but that&#39;s just a guess. It might be another<br>
earlier commit:<br>
c7d95613c7d6 io_uring: fix early sqd_list removal sqpoll hangs<br>
9728463737db io_uring: fix rw req completion<br>
6ad7f2332e84 io_uring: clear F_REISSUE right after getting it<br>
e82ad4853948 io_uring: fix !CONFIG_BLOCK compilation failure<br>
230d50d448ac io_uring: move reissue into regular IO path<br>
07204f21577a io_uring: fix EIOCBQUEUED iter revert<br>
696ee88a7c50 io_uring/io-wq: protect against sprintf overflow<br>
<br>
It would be much appreciated if Jens could give pointers to Canonical<br>
developers on how to fix the issue, and hopefully a suggestion to<br>
prevent this from happening again.<br>
<br>
Thanks,<br>
Regards<br>
</blockquote></div></div></div>

--000000000000f4066b05c6137a9f--

