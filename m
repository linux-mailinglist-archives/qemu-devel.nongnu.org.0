Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E478D2EFDB8
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:33:59 +0100 (CET)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5wt-0000I2-03
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pl-0008HJ-22
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:37 -0500
Received: from indium.canonical.com ([91.189.90.7]:46528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5pg-0006ut-SA
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:36 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pZ-0006q5-Tx
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C559C2E8143
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:56 -0000
From: Launchpad Bug Tracker <1728635@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jnsnow nasastry th-huth
X-Launchpad-Bug-Reporter: R.Nageswara Sastry (nasastry)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150937733573.9476.8069037004745261138.malonedeb@wampee.canonical.com>
Message-Id: <161016587698.8490.2677420075811114730.malone@loganberry.canonical.com>
Subject: [Bug 1728635] Re: qemu-io crashes with SIGSEGV when did -c aio_write
 9233408 28160 on a image_fuzzer image
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 4f53a0e9dfbb512acb1369960e580373899a70f4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1728635 <1728635@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1728635

Title:
  qemu-io crashes with SIGSEGV when did  -c aio_write 9233408 28160 on a
  image_fuzzer image

Status in QEMU:
  Expired

Bug description:
  git is at HEAD a93ece47fd9edbd4558db24300056c9a57d3bcd4
  This is on ppc64le architecture.

  Re-production steps:

  1. Copy the attached file named test.img to a directory
  2. And customize the following command to point to the above directory an=
d run the same.
  # cp test.img copy.img
  # qemu/qemu-io <path to>/copy.img -c "aio_write 9233408 28160"

  from gdb:
  Program terminated with signal 11, Segmentation fault.
  #0  0x00003fffa0077644 in __memcpy_power7 () from /lib64/libc.so.6
  Missing separate debuginfos, use: debuginfo-install cyrus-sasl-lib-2.1.26=
-21.el7.ppc64le glib2-2.50.3-3.el7.ppc64le glibc-2.17-196.el7.ppc64le gmp-6=
.0.0-15.el7.ppc64le gnutls-3.3.26-9.el7.ppc64le keyutils-libs-1.5.8-3.el7.p=
pc64le krb5-libs-1.15.1-8.el7.ppc64le libaio-0.3.109-13.el7.ppc64le libcom_=
err-1.42.9-10.el7.ppc64le libcurl-7.29.0-42.el7.ppc64le libffi-3.0.13-18.el=
7.ppc64le libgcc-4.8.5-16.el7_4.1.ppc64le libidn-1.28-4.el7.ppc64le libseli=
nux-2.5-11.el7.ppc64le libssh2-1.4.3-10.el7_2.1.ppc64le libstdc++-4.8.5-16.=
el7_4.1.ppc64le libtasn1-4.10-1.el7.ppc64le nettle-2.7.1-8.el7.ppc64le nspr=
-4.13.1-1.0.el7_3.ppc64le nss-3.28.4-15.el7_4.ppc64le nss-softokn-freebl-3.=
28.3-8.el7_4.ppc64le nss-util-3.28.4-3.el7.ppc64le openldap-2.4.44-5.el7.pp=
c64le openssl-libs-1.0.2k-8.el7.ppc64le p11-kit-0.23.5-3.el7.ppc64le pcre-8=
.32-17.el7.ppc64le zlib-1.2.7-17.el7.ppc64le
  (gdb) bt
  #0  0x00003fffa0077644 in __memcpy_power7 () from /lib64/libc.so.6
  #1  0x0000000010056738 in qcow2_refcount_area (bs=3D0x25f56f60, start_off=
set=3D137438953472, additional_clusters=3D0, exact_size=3Dfalse, new_refblo=
ck_index=3D0,
      new_refblock_offset=3D524288) at block/qcow2-refcount.c:573
  #2  0x0000000010056374 in alloc_refcount_block (bs=3D0x25f56f60, cluster_=
index=3D0, refcount_block=3D0x3fff9dadf838) at block/qcow2-refcount.c:479
  #3  0x0000000010057520 in update_refcount (bs=3D0x25f56f60, offset=3D0, l=
ength=3D524288, addend=3D1, decrease=3Dfalse, type=3DQCOW2_DISCARD_NEVER)
      at block/qcow2-refcount.c:834
  #4  0x0000000010057c24 in qcow2_alloc_clusters (bs=3D0x25f56f60, size=3D5=
24288) at block/qcow2-refcount.c:996
  #5  0x0000000010063684 in do_alloc_cluster_offset (bs=3D0x25f56f60, guest=
_offset=3D9233408, host_offset=3D0x3fff9dadf9e0, nb_clusters=3D0x3fff9dadf9=
d8)
      at block/qcow2-cluster.c:1213
  #6  0x0000000010063afc in handle_alloc (bs=3D0x25f56f60, guest_offset=3D9=
233408, host_offset=3D0x3fff9dadfab0, bytes=3D0x3fff9dadfab8, m=3D0x3fff9da=
dfb60)
      at block/qcow2-cluster.c:1324
  #7  0x0000000010064178 in qcow2_alloc_cluster_offset (bs=3D0x25f56f60, of=
fset=3D9233408, bytes=3D0x3fff9dadfb4c, host_offset=3D0x3fff9dadfb58, m=3D0=
x3fff9dadfb60)
      at block/qcow2-cluster.c:1511
  #8  0x000000001004d3f4 in qcow2_co_pwritev (bs=3D0x25f56f60, offset=3D923=
3408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3D0) at block/qcow2.c:1919
  #9  0x00000000100a9648 in bdrv_driver_pwritev (bs=3D0x25f56f60, offset=3D=
9233408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3D16) at block/io.c:898
  #10 0x00000000100ab630 in bdrv_aligned_pwritev (child=3D0x25f627f0, req=
=3D0x3fff9dadfdd8, offset=3D9233408, bytes=3D28160, align=3D1, qiov=3D0x25f=
6fa08, flags=3D16)
      at block/io.c:1440
  #11 0x00000000100ac4ac in bdrv_co_pwritev (child=3D0x25f627f0, offset=3D9=
233408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3DBDRV_REQ_FUA) at block/io=
.c:1691
  #12 0x000000001008da0c in blk_co_pwritev (blk=3D0x25f49410, offset=3D9233=
408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3DBDRV_REQ_FUA) at block/block=
-backend.c:1085
  #13 0x000000001008e718 in blk_aio_write_entry (opaque=3D0x25f6fa70) at bl=
ock/block-backend.c:1276
  #14 0x00000000101aa444 in coroutine_trampoline (i0=3D636902032, i1=3D0) a=
t util/coroutine-ucontext.c:79
  #15 0x00003fffa0022b9c in makecontext () from /lib64/libc.so.6
  #16 0x0000000000000000 in ?? ()
  (gdb) bt full
  #0  0x00003fffa0077644 in __memcpy_power7 () from /lib64/libc.so.6
  No symbol table info available.
  #1  0x0000000010056738 in qcow2_refcount_area (bs=3D0x25f56f60, start_off=
set=3D137438953472, additional_clusters=3D0, exact_size=3Dfalse, new_refblo=
ck_index=3D0,
      new_refblock_offset=3D524288) at block/qcow2-refcount.c:573
          s =3D 0x25f63210
          total_refblock_count_u64 =3D 2
          additional_refblock_count =3D 0
          total_refblock_count =3D 2
          table_size =3D 65536
          area_reftable_index =3D 1
          table_clusters =3D 1
          i =3D 0
          table_offset =3D 268870620
          block_offset =3D 70367094634128
          end_offset =3D 636891296
          ret =3D 636786432
          new_table =3D 0x3fff9d940010
          __PRETTY_FUNCTION__ =3D "qcow2_refcount_area"
          data =3D {d64 =3D 636841824, d32 =3D 1}
          old_table_offset =3D 70367094634552
          old_table_size =3D 636786432
  #2  0x0000000010056374 in alloc_refcount_block (bs=3D0x25f56f60, cluster_=
index=3D0, refcount_block=3D0x3fff9dadf838) at block/qcow2-refcount.c:479
          s =3D 0x25f63210
          refcount_table_index =3D 0
          ret =3D 0
          new_block =3D 524288
          blocks_used =3D 1
          meta_offset =3D 137438953472
  #3  0x0000000010057520 in update_refcount (bs=3D0x25f56f60, offset=3D0, l=
ength=3D524288, addend=3D1, decrease=3Dfalse, type=3DQCOW2_DISCARD_NEVER)
      at block/qcow2-refcount.c:834
          block_index =3D 268794524
          refcount =3D 4563798300
          cluster_index =3D 0
          table_index =3D 0
          s =3D 0x25f63210
          start =3D 0
          last =3D 0
          cluster_offset =3D 0
          refcount_block =3D 0x0
          old_table_index =3D -1
          ret =3D 0
  #4  0x0000000010057c24 in qcow2_alloc_clusters (bs=3D0x25f56f60, size=3D5=
24288) at block/qcow2-refcount.c:996
          offset =3D 0
          ret =3D 0
  #5  0x0000000010063684 in do_alloc_cluster_offset (bs=3D0x25f56f60, guest=
_offset=3D9233408, host_offset=3D0x3fff9dadf9e0, nb_clusters=3D0x3fff9dadf9=
d8)
      at block/qcow2-cluster.c:1213
          cluster_offset =3D 0
          s =3D 0x25f63210
  #6  0x0000000010063afc in handle_alloc (bs=3D0x25f56f60, guest_offset=3D9=
233408, host_offset=3D0x3fff9dadfab0, bytes=3D0x3fff9dadfab8, m=3D0x3fff9da=
dfb60)
      at block/qcow2-cluster.c:1324
  ---Type <return> to continue, or q <return> to quit---
          s =3D 0x25f63210
          l2_index =3D 17
          l2_table =3D 0x0
          entry =3D 0
          nb_clusters =3D 1
          ret =3D 0
          keep_old_clusters =3D false
          alloc_cluster_offset =3D 0
          __PRETTY_FUNCTION__ =3D "handle_alloc"
          requested_bytes =3D 73651285856
          avail_bytes =3D -1649542304
          nb_bytes =3D 16383
          old_m =3D 0x3fff00000000
  #7  0x0000000010064178 in qcow2_alloc_cluster_offset (bs=3D0x25f56f60, of=
fset=3D9233408, bytes=3D0x3fff9dadfb4c, host_offset=3D0x3fff9dadfb58, m=3D0=
x3fff9dadfb60)
      at block/qcow2-cluster.c:1511
          s =3D 0x25f63210
          start =3D 9233408
          remaining =3D 28160
          cluster_offset =3D 0
          cur_bytes =3D 28160
          ret =3D 0
          __PRETTY_FUNCTION__ =3D "qcow2_alloc_cluster_offset"
  #8  0x000000001004d3f4 in qcow2_co_pwritev (bs=3D0x25f56f60, offset=3D923=
3408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3D0) at block/qcow2.c:1919
          s =3D 0x25f63210
          offset_in_cluster =3D 320512
          ret =3D 0
          cur_bytes =3D 28160
          cluster_offset =3D 0
          hd_qiov =3D {iov =3D 0x25f285a0, niov =3D 0, nalloc =3D 1, size =
=3D 0}
          bytes_done =3D 0
          cluster_data =3D 0x0
          l2meta =3D 0x0
          __PRETTY_FUNCTION__ =3D "qcow2_co_pwritev"
  #9  0x00000000100a9648 in bdrv_driver_pwritev (bs=3D0x25f56f60, offset=3D=
9233408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3D16) at block/io.c:898
          drv =3D 0x102036f0 <bdrv_qcow2>
          sector_num =3D 636854560
          nb_sectors =3D 598850083
          ret =3D -1802855680
          __PRETTY_FUNCTION__ =3D "bdrv_driver_pwritev"
  #10 0x00000000100ab630 in bdrv_aligned_pwritev (child=3D0x25f627f0, req=
=3D0x3fff9dadfdd8, offset=3D9233408, bytes=3D28160, align=3D1, qiov=3D0x25f=
6fa08, flags=3D16)
      at block/io.c:1440
          bs =3D 0x25f56f60
          drv =3D 0x102036f0 <bdrv_qcow2>
          waited =3D false
          ret =3D 0
          end_sector =3D 18089
          bytes_remaining =3D 28160
          max_transfer =3D 2147483647
          __PRETTY_FUNCTION__ =3D "bdrv_aligned_pwritev"
  #11 0x00000000100ac4ac in bdrv_co_pwritev (child=3D0x25f627f0, offset=3D9=
233408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3DBDRV_REQ_FUA) at block/io=
.c:1691
  ---Type <return> to continue, or q <return> to quit---
          bs =3D 0x25f56f60
          req =3D {bs =3D 0x25f56f60, offset =3D 9233408, bytes =3D 28160, =
type =3D BDRV_TRACKED_WRITE, serialising =3D false, overlap_offset =3D 9233=
408,
            overlap_bytes =3D 28160, list =3D {le_next =3D 0x0, le_prev =3D=
 0x25f5a1d8}, co =3D 0x25f65a90, wait_queue =3D {entries =3D {sqh_first =3D=
 0x0,
                sqh_last =3D 0x3fff9dadfe20}}, waiting_for =3D 0x0}
          align =3D 1
          head_buf =3D 0x0
          tail_buf =3D 0x0
          local_qiov =3D {iov =3D 0x3fff9dadfdb0, niov =3D -1649541648, nal=
loc =3D 16383, size =3D 9233408}
          use_local_qiov =3D false
          ret =3D 0
          __PRETTY_FUNCTION__ =3D "bdrv_co_pwritev"
  #12 0x000000001008da0c in blk_co_pwritev (blk=3D0x25f49410, offset=3D9233=
408, bytes=3D28160, qiov=3D0x25f6fa08, flags=3DBDRV_REQ_FUA) at block/block=
-backend.c:1085
          ret =3D 0
          bs =3D 0x25f56f60
  #13 0x000000001008e718 in blk_aio_write_entry (opaque=3D0x25f6fa70) at bl=
ock/block-backend.c:1276
          acb =3D 0x25f6fa70
          rwco =3D 0x25f6fa98
          __PRETTY_FUNCTION__ =3D "blk_aio_write_entry"
  #14 0x00000000101aa444 in coroutine_trampoline (i0=3D636902032, i1=3D0) a=
t util/coroutine-ucontext.c:79
          arg =3D {p =3D 0x25f65a90, i =3D {636902032, 0}}
          self =3D 0x25f65a90
          co =3D 0x25f65a90
  #15 0x00003fffa0022b9c in makecontext () from /lib64/libc.so.6
  No symbol table info available.
  #16 0x0000000000000000 in ?? ()
  No symbol table info available.

  Will be attaching image_fuzzer image

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1728635/+subscriptions

