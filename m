Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C11471B4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:26:12 +0100 (CET)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iui7H-0006hl-AF
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iufdR-0004R6-0j
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iufdO-0006GK-Uh
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20418
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iufdO-0006G3-QK
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpF773c6jbAZ1Nh0JfYY7nGytGZIJ1sDHH2grbcAO9Q=;
 b=B6pktEHz87x9NzjM27I012izqYPHdc0IT/VMlOU0SP+pv5GxyWcK5F1InL2m/L2aftxZVB
 +ojrDxZ4pEACHtW1VEPKbRIW9V9sxgANljBaX6MnGOfq8kzo5ZHV4sDCG7/QrZUzOusMV8
 cd9lUc1/VvKj4oPOPbMEVMGwgLz/z40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-A_EG68K0OsSaz0TmpZHB6w-1; Thu, 23 Jan 2020 11:47:06 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 949628038B4;
 Thu, 23 Jan 2020 16:47:05 +0000 (UTC)
Received: from blue.redhat.com (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C95C35C554;
 Thu, 23 Jan 2020 16:47:02 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] qemu-nbd: Removed deprecated --partition option
Date: Thu, 23 Jan 2020 10:46:50 -0600
Message-Id: <20200123164650.1741798-3-eblake@redhat.com>
In-Reply-To: <20200123164650.1741798-1-eblake@redhat.com>
References: <20200123164650.1741798-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: A_EG68K0OsSaz0TmpZHB6w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 peter.maydell@linaro.org,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The option was deprecated in 4.0.0 (commit 0ae2d546); it's now been
long enough with no complaints to follow through with that process.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/interop/qemu-nbd.rst |  15 ++---
 qemu-deprecated.texi      |  49 ++++++--------
 qemu-nbd.c                | 133 +-------------------------------------
 3 files changed, 24 insertions(+), 173 deletions(-)

diff --git a/docs/interop/qemu-nbd.rst b/docs/interop/qemu-nbd.rst
index 873bb9e17d56..2e20f84cf025 100644
--- a/docs/interop/qemu-nbd.rst
+++ b/docs/interop/qemu-nbd.rst
@@ -72,13 +72,6 @@ driver options if ``--image-opts`` is specified.

   Export the disk as read-only.

-.. option:: -P, --partition=3DNUM
-
-  Deprecated: Only expose MBR partition *NUM*.  Understands physical
-  partitions 1-4 and logical partition 5. New code should instead use
-  :option:`--image-opts` with the raw driver wrapping a subset of the
-  original image.
-
 .. option:: -B, --bitmap=3DNAME

   If *filename* has a qcow2 persistent bitmap *NAME*, expose
@@ -224,14 +217,14 @@ a 1 megabyte subset of a raw file, using the export n=
ame 'subset':
     -t -x subset -p 10810 \
     --image-opts driver=3Draw,offset=3D1M,size=3D1M,file.driver=3Dfile,fil=
e.filename=3Dfile.raw

-Serve a read-only copy of just the first MBR partition of a guest
-image over a Unix socket with as many as 5 simultaneous readers, with
-a persistent process forked as a daemon:
+Serve a read-only copy of a guest image over a Unix socket with as
+many as 5 simultaneous readers, with a persistent process forked as a
+daemon:

 ::

   qemu-nbd --fork --persistent --shared=3D5 --socket=3D/path/to/sock \
-    --partition=3D1 --read-only --format=3Dqcow2 file.qcow2
+    --read-only --format=3Dqcow2 file.qcow2

 Expose the guest-visible contents of a qcow2 file via a block device
 /dev/nbd0 (and possibly creating /dev/nbd0p1 and friends for
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 358eb6deebdc..f152e8816164 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -319,37 +319,6 @@ The above, converted to the current supported format:

 @section Related binaries

-@subsection qemu-nbd --partition (since 4.0.0)
-
-The ``qemu-nbd --partition $digit'' code (also spelled @option{-P})
-can only handle MBR partitions, and has never correctly handled
-logical partitions beyond partition 5.  If you know the offset and
-length of the partition (perhaps by using @code{sfdisk} within the
-guest), you can achieve the effect of exporting just that subset of
-the disk by use of the @option{--image-opts} option with a raw
-blockdev using the @code{offset} and @code{size} parameters layered on
-top of any other existing blockdev. For example, if partition 1 is
-100MiB long starting at 1MiB, the old command:
-
-@code{qemu-nbd -t -P 1 -f qcow2 file.qcow2}
-
-can be rewritten as:
-
-@code{qemu-nbd -t --image-opts driver=3Draw,offset=3D1M,size=3D100M,file.d=
river=3Dqcow2,file.file.driver=3Dfile,file.file.filename=3Dfile.qcow2}
-
-Alternatively, the @code{nbdkit} project provides a more powerful
-partition filter on top of its nbd plugin, which can be used to select
-an arbitrary MBR or GPT partition on top of any other full-image NBD
-export.  Using this to rewrite the above example results in:
-
-@code{qemu-nbd -t -k /tmp/sock -f qcow2 file.qcow2 &}
-@code{nbdkit -f --filter=3Dpartition nbd socket=3D/tmp/sock partition=3D1}
-
-Note that if you are exposing the export via /dev/nbd0, it is easier
-to just export the entire image and then mount only /dev/nbd0p1 than
-it is to reinvoke @command{qemu-nbd -c /dev/nbd0} limited to just a
-subset of the image.
-
 @subsection qemu-img convert -n -o (since 4.2.0)

 All options specified in @option{-o} are image creation options, so
@@ -406,3 +375,21 @@ trouble after a recent upgrade.

 The "autoload" parameter has been ignored since 2.12.0. All bitmaps
 are automatically loaded from qcow2 images.
+
+@section Related binaries
+
+@subsection qemu-nbd --partition (removed in 5.0.0)
+
+The ``qemu-nbd --partition $digit'' code (also spelled @option{-P})
+could only handle MBR partitions, and never correctly handled logical
+partitions beyond partition 5.  Exporting a partition can still be
+done by utilizing the @option{--image-opts} option with a raw blockdev
+using the @code{offset} and @code{size} parameters layered on top of
+any other existing blockdev. For example, if partition 1 is 100MiB
+long starting at 1MiB, the old command:
+
+@code{qemu-nbd -t -P 1 -f qcow2 file.qcow2}
+
+can be rewritten as:
+
+@code{qemu-nbd -t --image-opts driver=3Draw,offset=3D1M,size=3D100M,file.d=
river=3Dqcow2,file.file.driver=3Dfile,file.file.filename=3Dfile.qcow2}
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 108a51f7eb01..a04930770ff7 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -100,7 +100,6 @@ static void usage(const char *name)
 "\n"
 "Exposing part of the image:\n"
 "  -o, --offset=3DOFFSET       offset into the image\n"
-"  -P, --partition=3DNUM       only expose partition NUM\n"
 "  -B, --bitmap=3DNAME         expose a persistent dirty bitmap\n"
 "\n"
 "General purpose options:\n"
@@ -156,96 +155,6 @@ QEMU_COPYRIGHT "\n"
     , name);
 }

-struct partition_record
-{
-    uint8_t bootable;
-    uint8_t start_head;
-    uint32_t start_cylinder;
-    uint8_t start_sector;
-    uint8_t system;
-    uint8_t end_head;
-    uint8_t end_cylinder;
-    uint8_t end_sector;
-    uint32_t start_sector_abs;
-    uint32_t nb_sectors_abs;
-};
-
-static void read_partition(uint8_t *p, struct partition_record *r)
-{
-    r->bootable =3D p[0];
-    r->start_head =3D p[1];
-    r->start_cylinder =3D p[3] | ((p[2] << 2) & 0x0300);
-    r->start_sector =3D p[2] & 0x3f;
-    r->system =3D p[4];
-    r->end_head =3D p[5];
-    r->end_cylinder =3D p[7] | ((p[6] << 2) & 0x300);
-    r->end_sector =3D p[6] & 0x3f;
-
-    r->start_sector_abs =3D ldl_le_p(p + 8);
-    r->nb_sectors_abs   =3D ldl_le_p(p + 12);
-}
-
-static int find_partition(BlockBackend *blk, int partition,
-                          uint64_t *offset, uint64_t *size)
-{
-    struct partition_record mbr[4];
-    uint8_t data[MBR_SIZE];
-    int i;
-    int ext_partnum =3D 4;
-    int ret;
-
-    ret =3D blk_pread(blk, 0, data, sizeof(data));
-    if (ret < 0) {
-        error_report("error while reading: %s", strerror(-ret));
-        exit(EXIT_FAILURE);
-    }
-
-    if (data[510] !=3D 0x55 || data[511] !=3D 0xaa) {
-        return -EINVAL;
-    }
-
-    for (i =3D 0; i < 4; i++) {
-        read_partition(&data[446 + 16 * i], &mbr[i]);
-
-        if (!mbr[i].system || !mbr[i].nb_sectors_abs) {
-            continue;
-        }
-
-        if (mbr[i].system =3D=3D 0xF || mbr[i].system =3D=3D 0x5) {
-            struct partition_record ext[4];
-            uint8_t data1[MBR_SIZE];
-            int j;
-
-            ret =3D blk_pread(blk, mbr[i].start_sector_abs * MBR_SIZE,
-                            data1, sizeof(data1));
-            if (ret < 0) {
-                error_report("error while reading: %s", strerror(-ret));
-                exit(EXIT_FAILURE);
-            }
-
-            for (j =3D 0; j < 4; j++) {
-                read_partition(&data1[446 + 16 * j], &ext[j]);
-                if (!ext[j].system || !ext[j].nb_sectors_abs) {
-                    continue;
-                }
-
-                if ((ext_partnum + j + 1) =3D=3D partition) {
-                    *offset =3D (uint64_t)ext[j].start_sector_abs << 9;
-                    *size =3D (uint64_t)ext[j].nb_sectors_abs << 9;
-                    return 0;
-                }
-            }
-            ext_partnum +=3D 4;
-        } else if ((i + 1) =3D=3D partition) {
-            *offset =3D (uint64_t)mbr[i].start_sector_abs << 9;
-            *size =3D (uint64_t)mbr[i].nb_sectors_abs << 9;
-            return 0;
-        }
-    }
-
-    return -ENOENT;
-}
-
 static void termsig_handler(int signum)
 {
     atomic_cmpxchg(&state, RUNNING, TERMINATE);
@@ -617,7 +526,7 @@ int main(int argc, char **argv)
     int64_t fd_size;
     QemuOpts *sn_opts =3D NULL;
     const char *sn_id_or_name =3D NULL;
-    const char *sopt =3D "hVb:o:p:rsnP:c:dvk:e:f:tl:x:T:D:B:L";
+    const char *sopt =3D "hVb:o:p:rsnc:dvk:e:f:tl:x:T:D:B:L";
     struct option lopt[] =3D {
         { "help", no_argument, NULL, 'h' },
         { "version", no_argument, NULL, 'V' },
@@ -626,7 +535,6 @@ int main(int argc, char **argv)
         { "socket", required_argument, NULL, 'k' },
         { "offset", required_argument, NULL, 'o' },
         { "read-only", no_argument, NULL, 'r' },
-        { "partition", required_argument, NULL, 'P' },
         { "bitmap", required_argument, NULL, 'B' },
         { "connect", required_argument, NULL, 'c' },
         { "disconnect", no_argument, NULL, 'd' },
@@ -657,7 +565,6 @@ int main(int argc, char **argv)
     int ch;
     int opt_ind =3D 0;
     int flags =3D BDRV_O_RDWR;
-    int partition =3D 0;
     int ret =3D 0;
     bool seen_cache =3D false;
     bool seen_discard =3D false;
@@ -793,15 +700,6 @@ int main(int argc, char **argv)
             readonly =3D true;
             flags &=3D ~BDRV_O_RDWR;
             break;
-        case 'P':
-            warn_report("The '-P' option is deprecated; use --image-opts w=
ith "
-                        "a raw device wrapper for subset exports instead")=
;
-            if (qemu_strtoi(optarg, NULL, 0, &partition) < 0 ||
-                partition < 1 || partition > 8) {
-                error_report("Invalid partition '%s'", optarg);
-                exit(EXIT_FAILURE);
-            }
-            break;
         case 'B':
             bitmap =3D optarg;
             break;
@@ -898,7 +796,7 @@ int main(int argc, char **argv)
             error_report("List mode is incompatible with a file name");
             exit(EXIT_FAILURE);
         }
-        if (export_name || export_description || dev_offset || partition |=
|
+        if (export_name || export_description || dev_offset ||
             device || disconnect || fmt || sn_id_or_name || bitmap ||
             seen_aio || seen_discard || seen_cache) {
             error_report("List mode is incompatible with per-device settin=
gs");
@@ -1162,33 +1060,6 @@ int main(int argc, char **argv)
     }
     fd_size -=3D dev_offset;

-    if (partition) {
-        uint64_t limit;
-
-        if (dev_offset) {
-            error_report("Cannot request partition and offset together");
-            exit(EXIT_FAILURE);
-        }
-        ret =3D find_partition(blk, partition, &dev_offset, &limit);
-        if (ret < 0) {
-            error_report("Could not find partition %d: %s", partition,
-                         strerror(-ret));
-            exit(EXIT_FAILURE);
-        }
-        /*
-         * MBR partition limits are (32-bit << 9); this assert lets
-         * the compiler know that we can't overflow 64 bits.
-         */
-        assert(dev_offset + limit >=3D dev_offset);
-        if (dev_offset + limit > fd_size) {
-            error_report("Discovered partition %d at offset %" PRIu64
-                         " size %" PRIu64 ", but size exceeds file length =
%"
-                         PRId64, partition, dev_offset, limit, fd_size);
-            exit(EXIT_FAILURE);
-        }
-        fd_size =3D limit;
-    }
-
     export =3D nbd_export_new(bs, dev_offset, fd_size, export_name,
                             export_description, bitmap, readonly, shared >=
 1,
                             nbd_export_closed, writethrough, NULL,
--=20
2.24.1


