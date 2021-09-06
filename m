Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A87401E59
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 18:31:45 +0200 (CEST)
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNHWy-000777-8O
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 12:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNHUu-0006Po-No
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mNHUr-0007ni-Hv
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630945764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BmWneU3zbQzqPhov5TQ8YD2HcdPokQ4sYMrsXs7qmjc=;
 b=LhUzhLCaIcucLDTRKOmjyIZIG1sdPlGVK42TIjxDPi6SYS0G5ta3Jglbq2DlKeQQv0ZWay
 B1LE9M1UI+CFHFWGoTLD99X4Eh3NC09bnQqey7yGHcyre2ej5lRkLbfQ/yOTuQCgnTCr78
 rXKeh1H+9qk4ZiXQmqecaoCktxgDHhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-rvAto1mmOyG1q5zn_xc6Hg-1; Mon, 06 Sep 2021 12:29:21 -0400
X-MC-Unique: rvAto1mmOyG1q5zn_xc6Hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA10B10054F6
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 16:29:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8FF60CA1;
 Mon,  6 Sep 2021 16:29:17 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Update FUSE block export blog post
Date: Mon,  6 Sep 2021 18:29:16 +0200
Message-Id: <20210906162916.21714-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Klaus Kiwi <kkiwi@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because I forgot to CC Thomas on the discussion adding this post, it was
merged prematurely.  This patch updates the post to incorporate the
feedback I received on it:

- Title change: This article mostly deals with presenting a guest image
  in one image format as a raw image, so the title should reflect that;
  there is much less focus on exporting block devices from a live VM

- Mention libguestfs, and contrast against it; make a note that
  libguestfs provides security that FUSE exports cannot provide

- Have a full example in the intro, to show where we are going with this
  post

- Some heading depths changed (nesting did not really make sense)

- Be more explicit that by "file mounts" I do not mean a filesystem with
  a root directory and a single file in it

- Explicitly mention that "/" is a directory without a name, to
  illustrate the fact that root nodes do not have names

- Short intro for "QEMU block exports", explaining its place in this
  post

- Make all exports writable

- Use "exp0" as export ID to get shorter lines that fit better into 80
  characters

- Reference the intro example in the intro of "Mounting an image on
  itself"

- Show "qemu-fuse-disk-export.py" in *italic* instead of as `code`
  (because I had all other command names in *italic*)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 _posts/2021-08-22-fuse-blkexport.md | 145 ++++++++++++++++++++++------
 1 file changed, 117 insertions(+), 28 deletions(-)

diff --git a/_posts/2021-08-22-fuse-blkexport.md b/_posts/2021-08-22-fuse-blkexport.md
index 7e8066e..1db6e74 100644
--- a/_posts/2021-08-22-fuse-blkexport.md
+++ b/_posts/2021-08-22-fuse-blkexport.md
@@ -1,30 +1,55 @@
 ---
 layout: post
-title:  "Exporting block devices as raw image files with FUSE"
+title:  "Presenting guest images as raw image files with FUSE"
 date:   2021-08-22 14:00:00 +0200
 author: Hanna Reitz
 categories: [storage, features, tutorials]
 ---
 Sometimes, there is a VM disk image whose contents you want to manipulate
-without booting the VM.  For raw images, that process is usually fairly simple,
-because most Linux systems bring tools for the job, e.g.:
+without booting the VM.  One way of doing this is to use
+[libguestfs](https://libguestfs.org), which can boot a minimal Linux VM to
+provide the host with secure access to the disk’s contents.  For example,
+[*guestmount*](https://libguestfs.org/guestmount.1.html) allows you to mount a
+guest filesystem on the host, without requiring root rights.
+
+However, maybe you cannot or do not want to use libguestfs, e.g. because you do
+not have KVM available in your environment, and so it becomes too slow; or
+because you do not want to go through a guest OS, but want to access the raw
+image data directly on the host, with minimal overhead.
+
+**Note**: Guest images can generally be arbitrarily modified by VM guests.  If
+you have an image to which an untrusted guest had write access at some point,
+you must treat any data and metadata on this image as potentially having been
+modified in a malicious manner.  Parsing anything must be done carefully and
+with caution.  Note that many existing tools are not careful in this regard, for
+example, filesystem drivers generally deliberately do not have protection
+against maliciously corrupted filesystems.  This is why in contrast accessing an
+image through libguestfs is considered secure, because the actual access happens
+in a libvirt-managed VM guest.
+
+From this point, we assume you are aware of the security caveats and still want
+to access and manipulate image data on the host.
+
+Now, unless your image is already in raw format, you will be faced with the
+problem of getting it into raw format.  The tools that you might want to use for
+image manipulation generally only work on raw images (because that is how block
+device files appear), like:
 * *dd* to just copy data to and from given offsets,
 * *parted* to manipulate the partition table,
 * *kpartx* to present all partitions as block devices,
 * *mount* to access filesystems’ contents.
 
-Sadly, but naturally, such tools only work for raw images, and not for images
-e.g. in QEMU’s qcow2 format.  To access such an image’s content, the format has
-to be translated to create a raw image, for example by:
+So if you want to use such tools on image files e.g. in QEMU’s qcow2 format, you
+will need to translate them into raw images first, for example by:
 * Exporting the image file with `qemu-nbd -c` as an NBD block device file,
 * Converting between image formats using `qemu-img convert`,
 * Accessing the image from a guest, where it appears as a normal block device.
 
 Unfortunately, none of these methods is perfect: `qemu-nbd -c` generally
-requires root rights, converting to a temporary raw copy requires additional
-disk space and the conversion process takes time, and accessing the image from a
-guest is just quite cumbersome in general (and also specifically something that
-we set out to avoid in the first sentence of this blog post).
+requires root rights; converting to a temporary raw copy requires additional
+disk space and the conversion process takes time; and accessing the image from a
+guest is basically what libguestfs does (i.e., if that is what you want, then
+you should probably use libguestfs).
 
 As of QEMU 6.0, there is another method, namely FUSE block exports.
 Conceptually, these are rather similar to using `qemu-nbd -c`, but they do not
@@ -42,15 +67,67 @@ mounting remote directories from a machine accessible via SSH.
 
 QEMU can use FUSE to make a virtual block device appear as a normal file on the
 host, so that tools like *kpartx* can interact with it regardless of the image
-format.
+format, like in the following example:
 
-## Background information
+```
+$ qemu-img create -f raw foo.img 20G
+Formatting 'foo.img', fmt=raw size=21474836480
+
+$ parted -s foo.img \
+    'mklabel msdos' \
+    'mkpart primary ext4 2048s 100%'
+
+$ qemu-img convert -p -f raw -O qcow2 foo.img foo.qcow2 && rm foo.img
+    (100.00/100%)
+
+$ file foo.qcow2
+foo.qcow2: QEMU QCOW2 Image (v3), 21474836480 bytes
+
+$ sudo kpartx -l foo.qcow2
+
+$ qemu-storage-daemon \
+    --blockdev node-name=prot-node,driver=file,filename=foo.qcow2 \
+    --blockdev node-name=fmt-node,driver=qcow2,file=prot-node \
+    --export \
+    type=fuse,id=exp0,node-name=fmt-node,mountpoint=foo.qcow2,writable=on \
+    &
+[1] 200495
+
+$ file foo.qcow2
+foo.qcow2: DOS/MBR boot sector; partition 1 : ID=0x83, start-CHS (0x10,0,1),
+end-CHS (0x3ff,3,32), startsector 2048, 41940992 sectors
 
-### File mounts
+$ sudo kpartx -av foo.qcow2
+add map loop0p1 (254:0): 0 41940992 linear 7:0 2048
+```
+
+In this example, we create a partition on a newly created raw image.  We then
+convert this raw image to qcow2 and discard the original.  Because a tool like
+*kpartx* cannot parse the qcow2 format, it reports no partitions to be present
+in `foo.qcow2`.
+
+Using the QEMU storage daemon, we then create a FUSE export for the image that
+apparently turns it into a raw image, which makes the content and thus the
+partitions visible to *file* and *kpartx*.  Now, we can use *kpartx* to access
+the partition in `foo.qcow2` under `/dev/mapper/loop0p1`.
+
+So how does this work?  How can the QEMU storage daemon make a qcow2 image
+appear as a raw image?
+
+## File mounts
 
-A perhaps little-known fact is that, on Linux, filesystems do not need to have
-a root directory, they only need to have a root node.  A filesystem that only
-provides a single regular file is perfectly valid.
+To transparently translate a file into a different format, like we did above, we
+make use of two little-known facts about filesystems and the VFS on Linux.  The
+first one of these we can explain immediately, for the second one we will need
+some more information about how FUSE exports work, so that secret will be lifted
+later (down in the “Mounting an image on itself” section).
+
+Here is the first secret: Filesystems do not need to have a root directory.
+They only need a root node.  A regular file is a node, so a filesystem that only
+consists of a single regular file is perfectly valid.
+
+Note that this is not about filesystems with just a single file in their root
+directory, but about filesystems that really *do not have* a root directory.
 
 Conceptually, every filesystem is a tree, and mounting works by replacing one
 subtree of the global VFS tree by the mounted filesystem’s tree.  Normally, a
@@ -65,7 +142,8 @@ shadowed by the new filesystem (showing `/foo/x` and `/foo/y`).
 
 Note that a filesystem’s root node generally has no name.  After mounting, the
 filesystem’s root directory’s name is determined by the original name of the
-mount point.
+mount point.  (“/” is not a name.  It specifically is a directory without a
+name.)
 
 Because a tree does not need to have multiple nodes but may consist of just a
 single leaf, a filesystem with a file for its root node works just as well,
@@ -81,7 +159,10 @@ point for it must also be a regular file (`/foo/a` in our example), and just
 like before, the content of `/foo/a` is shadowed, and when opening it, one will
 instead see the contents of FS B’s unnamed root node.
 
-### QEMU block exports
+## QEMU block exports
+
+Before we can see what FUSE exports are and how they work, we should explore
+QEMU block exports in general.
 
 QEMU allows exporting block nodes via various protocols (as of 6.0: NBD,
 vhost-user, FUSE).  A block node is an element of QEMU’s block graph (see e.g.
@@ -108,7 +189,7 @@ The command line to achieve the above could look something like this:
 $ qemu-system-x86_64 \
     -blockdev node-name=prot-node,driver=file,filename=$image_path \
     -blockdev node-name=fmt-node,driver=qcow2,file=prot-node \
-    -device virtio-blk,drive=fmt-node
+    -device virtio-blk,drive=fmt-node,share-rw=on
 ```
 
 Besides attaching guest devices to block nodes, you can also export them for
@@ -131,9 +212,10 @@ the QEMU instance above, then you could do this:
     "execute": "block-export-add",
     "arguments": {
         "type": "nbd",
-        "id": "fmt-node-export",
+        "id": "exp0",
         "node-name": "fmt-node",
-        "name": "guest-disk"
+        "name": "guest-disk",
+        "writable": true
     }
 }
 ```
@@ -168,7 +250,8 @@ $ qemu-storage-daemon \
     --blockdev node-name=prot-node,driver=file,filename=$image_path \
     --blockdev node-name=fmt-node,driver=qcow2,file=prot-node \
     --nbd-server addr.type=inet,addr.host=localhost,addr.port=10809 \
-    --export type=nbd,id=fmt-node-export,node-name=fmt-node,name=guest-disk
+    --export \
+    type=nbd,id=exp0,node-name=fmt-node,name=guest-disk,writable=on
 ```
 
 Which creates the following block graph:
@@ -194,7 +277,8 @@ $ touch mount-point
 $ qemu-storage-daemon \
   --blockdev node-name=prot-node,driver=file,filename=$image_path \
   --blockdev node-name=fmt-node,driver=qcow2,file=prot-node \
-  --export type=fuse,id=fmt-node-export,node-name=fmt-node,mountpoint=mount-point
+  --export \
+  type=fuse,id=exp0,node-name=fmt-node,mountpoint=mount-point,writable=on
 ```
 
 The mount point now appears as the raw VM disk that is stored in the qcow2
@@ -237,7 +321,11 @@ disk size: 0 B
 ## Mounting an image on itself
 
 So far, we have seen what FUSE exports are, how they work, and how they can be
-used.  Now let’s add an interesting twist.
+used.  However, in the very first example in this blog post, we did not export
+the raw image on some empty regular file that just serves as a mount point – no,
+we turned the original qcow2 image itself into a raw image.
+
+How does that work?
 
 ### What happens to the old tree under a mount point?
 
@@ -330,7 +418,8 @@ Format specific information:
 
 $ qemu-storage-daemon --blockdev \
    node-name=node0,driver=qcow2,file.driver=file,file.filename=foo.qcow2 \
-   --export type=fuse,id=node0-export,node-name=node0,mountpoint=foo.qcow2 &
+   --export \
+   type=fuse,id=node0-export,node-name=node0,mountpoint=foo.qcow2,writable=on &
 [1] 40843
 
 $ qemu-img info foo.qcow2
@@ -355,17 +444,17 @@ that opens the image by name (i.e. `open("foo.qcow2")`) will open the raw disk
 image exported by QEMU.  Therefore, it looks like the qcow2 image is in raw
 format now.
 
-### `qemu-fuse-disk-export.py`
+### *qemu-fuse-disk-export.py*
 
 Because the QEMU storage daemon command line tends to become kind of long, I’ve
 written a script to facilitate the process:
-[qemu-fuse-disk-export.py](https://gitlab.com/hreitz/qemu-scripts/-/blob/main/qemu-fuse-disk-export.py)
+[*qemu-fuse-disk-export.py*](https://gitlab.com/hreitz/qemu-scripts/-/blob/main/qemu-fuse-disk-export.py)
 ([direct download link](https://gitlab.com/hreitz/qemu-scripts/-/raw/main/qemu-fuse-disk-export.py?inline=false)).
 This script automatically detects the image format, and its `--daemonize` option
 allows safe use in scripts, where it is important that the process blocks until
 the export is fully set up.
 
-Using `qemu-fuse-disk-export.py`, the above example looks like this:
+Using *qemu-fuse-disk-export.py*, the above example looks like this:
 ```
 $ qemu-img info foo.qcow2 | grep 'file format'
 file format: qcow2
-- 
2.31.1


