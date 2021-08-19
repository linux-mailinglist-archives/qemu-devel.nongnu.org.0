Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067623F1FDA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 20:26:15 +0200 (CEST)
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGmk1-00064i-Il
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 14:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkiwi@redhat.com>) id 1mGmh3-0005K3-N5
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 14:23:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkiwi@redhat.com>) id 1mGmgt-0006RN-KK
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 14:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629397376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sYNuQqB1MeytKiDq5GM6a0NHfZCi0TTLNQ2dUcayjDc=;
 b=GFQleMOkAAXDSikNKTfp8pdDZTf3KElBgdY09Wt03o96JYg+ZleE3nHMEH/lTq2pYC+zs9
 yKOARg/PHhapatN8+z+0IbZm83iVUArFlzuuexUmOCfJgIhTh7Aj9FWc9q36HKvh4m90pz
 4Lz0j9iScpLGw8OR8sJV1BYAkgHFOhE=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-EfoonbrrMGGwkLtdnEYQLQ-1; Thu, 19 Aug 2021 14:22:49 -0400
X-MC-Unique: EfoonbrrMGGwkLtdnEYQLQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 w17-20020a1f94110000b0290285e7c6e9ecso1279327vkd.17
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 11:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYNuQqB1MeytKiDq5GM6a0NHfZCi0TTLNQ2dUcayjDc=;
 b=KTCHcVzKcC2mV/Gl3MyVZMBG3VIHkcKCzrDg8B338NZRqCBi4xy/mkzm31y7rvg3FK
 rr+oMkY/LjrI2/VU3vpIotCxg2nquzGDrBLhEIFtSJV7bfM9S0UDdmJ77fSlzts8fVL/
 1DYpkwtPMpEwuxwdfqebyllLTh+DnKY1gu8P+F+DfrPUL89/hR6uW5bnZnoZEMw6Ybky
 5y2l9vkCNEnpvdJGtuXzG4kP76x+T29eQeqrJKdz1t6Ll8IppEVp9nBVDeAyQeJxm7wY
 QqKT/d3VVhaTmAZfHnEhusAGZO0ppRwCFWU/zSA8lLOJACy5HCilcC3RHEUDsi06bFiH
 41bA==
X-Gm-Message-State: AOAM533nnkNk6aXs41GJ2TrA+nrRzgu/dt9yuIvAPLc+FD005MgafLWz
 E0cPNP1b54BCYwnDMPWhATNVYEs33zcptFTLPjQTUYRLtRMKaxSAWzt8XYJIGIc2YoM4tPsX48G
 fkxi6MMr4j+1y1hs47VuYu0trglLGU7Q=
X-Received: by 2002:a67:f70d:: with SMTP id m13mr14471318vso.32.1629397368558; 
 Thu, 19 Aug 2021 11:22:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1s++5INnet8FKwOX1opra08Ta2/OuA4EKreD66CEom1wl0+D2kidQF9ZE5L2HcXWb+ZvGAaH5XoX+kS5F7ZA=
X-Received: by 2002:a67:f70d:: with SMTP id m13mr14471215vso.32.1629397366949; 
 Thu, 19 Aug 2021 11:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210819102501.69638-1-hreitz@redhat.com>
In-Reply-To: <20210819102501.69638-1-hreitz@redhat.com>
From: Klaus Kiwi <kkiwi@redhat.com>
Date: Thu, 19 Aug 2021 15:22:35 -0300
Message-ID: <CAELHpAD81hgKbvRV=R7jaLyi8Nwi-edd+mJ8arhXAp2=iAiokg@mail.gmail.com>
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkiwi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004165f905c9eda3bd"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kkiwi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004165f905c9eda3bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 7:27 AM Hanna Reitz <hreitz@redhat.com> wrote:

> This post explains when FUSE block exports are useful, how they work,
> and that it is fun to export an image file on its own path so it looks
> like your image file (in whatever format it was) is a raw image now.
>
>
Thanks Hanna, great work. Even if you explained this to me multiple times,
thanks to this I think I now finally understand *how* it works.


> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> You can also find this patch here:
> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
>
> My first patch to qemu-web, so I hope I am not doing anything overly
> stupid here (adding SVGs with extremely long lines comes to mind)...
> ---
>  _posts/2021-08-18-fuse-blkexport.md       | 488 ++++++++++++++++++++++
>  screenshots/2021-08-18-block-graph-a.svg  |   2 +
>  screenshots/2021-08-18-block-graph-b.svg  |   2 +
>  screenshots/2021-08-18-block-graph-c.svg  |   2 +
>  screenshots/2021-08-18-block-graph-d.svg  |   2 +
>  screenshots/2021-08-18-block-graph-e.svg  |   2 +
>  screenshots/2021-08-18-root-directory.svg |   2 +
>  screenshots/2021-08-18-root-file.svg      |   2 +
>  8 files changed, 502 insertions(+)
>  create mode 100644 _posts/2021-08-18-fuse-blkexport.md
>  create mode 100644 screenshots/2021-08-18-block-graph-a.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-b.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-c.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-d.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-e.svg
>  create mode 100644 screenshots/2021-08-18-root-directory.svg
>  create mode 100644 screenshots/2021-08-18-root-file.svg
>
> diff --git a/_posts/2021-08-18-fuse-blkexport.md
> b/_posts/2021-08-18-fuse-blkexport.md
> new file mode 100644
> index 0000000..e6a55d0
> --- /dev/null
> +++ b/_posts/2021-08-18-fuse-blkexport.md
> @@ -0,0 +1,488 @@
> +---
> +layout: post
> +title:  "Exporting block devices as raw image files with FUSE"
> +date:   2021-08-18 18:00:00 +0200
> +author: Hanna Reitz
> +categories: [storage, features, tutorials]
>

Non-fatal, but I feel that the title doesn't summarize all that this' blog
posts is about.
An alternate suggestion might be in the lines of "A look into QEMU's FUSE
export
feature, and how to use it to manipulate guest images".



> +---
> +Sometimes, there is a VM disk image whose contents you want to manipulat=
e
> +without booting the VM.  For raw images, that process is usually fairly
> simple,
> +because most Linux systems bring tools for the job, e.g.:
> +* *dd* to just copy data to and from given offsets,
> +* *parted* to manipulate the partition table,
> +* *kpartx* to present all partitions as block devices,
> +* *mount* to access filesystems=E2=80=99 contents.
> +
> +Sadly, but naturally, such tools only work for raw images, and not for
> images
> +e.g. in QEMU=E2=80=99s qcow2 format.  To access such an image=E2=80=99s =
content, the
> format has
> +to be translated to create a raw image, for example by:
> +* Exporting the image file with `qemu-nbd -c` as an NBD block device fil=
e,
> +* Converting between image formats using `qemu-img convert`,
> +* Accessing the image from a guest, where it appears as a normal block
> device.
> +
>
Guessing that this would be the best place to mention
guestmount/libguestfs, as Stefan
mentioned in another reply to this thread?

Bonus points if you can identify (dis)advantages, similarly to that you did
below
with the other methods.


> +Unfortunately, none of these methods is perfect: `qemu-nbd -c` generally
> +requires root rights, converting to a temporary raw copy requires
> additional
> +disk space and the conversion process takes time, and accessing the imag=
e
> from a
> +guest is just quite cumbersome in general (and also specifically
> something that
> +we set out to avoid in the first sentence of this blog post).
> +
> +As of QEMU 6.0, there is another method, namely FUSE block exports.
> +Conceptually, these are rather similar to using `qemu-nbd -c`, but they
> do not
> +require root rights.
> +
> +**Note**: FUSE block exports are a feature that can be enabled or disabl=
ed
> +during the build process with `--enable-fuse` or `--disable-fuse`,
> respectively;
> +omitting either configure option will enable the feature if and only if
> libfuse3
> +is present.  It is possible that the QEMU build you are using does not
> have FUSE
> +block export support, because it was not compiled in.
> +
> +FUSE (*Filesystem in Userspace*) is a technology to let userspace
> processes
> +provide filesystem drivers.  For example, *sshfs* is a program that allo=
ws
> +mounting remote directories from a machine accessible via SSH.
> +
>

Nitpicking but maybe FUSE here could link to another tutorial/wikipedia pag=
e
with more info?


> +QEMU can use FUSE to make a virtual block device appear as a normal file
> on the
> +host, so that tools like *kpartx* can interact with it regardless of the
> image
> +format.
> +
> +## Background information
> +
> +### File mounts
>
> I must confess that, as I've gone through the document, this felt a bit
like breaking
the flow (probably due to my pre-conceptions of always mounting a resource
into
some directory to see it's content, which I guess was what I was expecting
this
would go before talking about mounting files).

I understand now, however, that this introduction is necessary, but perhaps
something like "Before we are able to use QEMU's FUSE exports, we need to
clarify
some fundamental concepts on the VFS and mountpoints: It is a little-known
fact
that <...>" would help me understand the flow better here.


> +A perhaps little-known fact is that, on Linux, filesystems do not need t=
o
> have
> +a root directory, they only need to have a root node.  A filesystem that
> only
> +provides a single regular file is perfectly valid.
> +
> +Conceptually, every filesystem is a tree, and mounting works by replacin=
g
> one
> +subtree of the global VFS tree by the mounted filesystem=E2=80=99s tree.
> Normally, a
> +filesystem=E2=80=99s root node is a directory, like in the following exa=
mple:
> +
> +|![Regular filesystem: Root directory is mounted to a directory mount
> point](/screenshots/2021-08-18-root-directory.svg)|
> +|:--:|
> +|*Fig. 1: Mounting a regular filesystem with a directory as its root
> node*|
> +
> +Here, the directory `/foo` and its content (the files `/foo/a` and
> `/foo/b`) are
> +shadowed by the new filesystem (showing `/foo/x` and `/foo/y`).
> +
>

Must confess that I wish there were a better term for it than 'shadowed
directory'
or 'shadowed file', avoiding potential confusion with things like
/etc/shadow or
'shadow memory'.. But I couldn't think if any.


> +Note that a filesystem=E2=80=99s root node generally has no name.  After
> mounting, the
> +filesystem=E2=80=99s root directory=E2=80=99s name is determined by the =
original name of
> the
> +mount point.
> +
> +Because a tree does not need to have multiple nodes but may consist of
> just a
> +single leaf, a filesystem with a file for its root node works just as
> well,
> +though:
> +
> +|![Mounting a file root node to a regular file mount
> point](/screenshots/2021-08-18-root-file.svg)|
> +|:--:|
> +|*Fig. 2: Mounting a filesystem with a regular (unnamed) file as its roo=
t
> node*|
> +
> +Here, FS B only consists of a single node, a regular file with no name.
> (As
> +above, a filesystem=E2=80=99s root node is generally unnamed.) Consequen=
tly, the
> mount
> +point for it must also be a regular file (`/foo/a` in our example), and
> just
> +like before, the content of `/foo/a` is shadowed, and when opening it,
> one will
> +instead see the contents of FS B=E2=80=99s unnamed root node.
> +
> +### QEMU block exports
> +
> +QEMU allows exporting block nodes via various protocols (as of 6.0: NBD,
> +vhost-user, FUSE).  A block node is an element of QEMU=E2=80=99s block g=
raph (see
> e.g.
> +[Managing the New Block Layer](
> http://events17.linuxfoundation.org/sites/events/files/slides/talk\_11.pd=
f
> ),
> +a talk given at KVM Forum 2017), which can for example be attached to
> guest
> +devices.  Here is a very simple example:
> +
> +|![Block graph: image file <-> file node (label: prot-node) <-> qcow2
> node (label: fmt-node) <-> virtio-blk guest
> device](/screenshots/2021-08-18-block-graph-a.svg)|
> +|:--:|
> +|*Fig. 3: A simple block graph for attaching a qcow2 image to a
> virtio-blk guest device*|
> +
> +This is the simplest example for a block graph that connects a
> *virtio-blk*
> +guest device to a qcow2 image file.  The *file* block driver, instanced
> in the
> +form of a block node named *prot-node*, accesses the actual file and
> provides
> +the node above it access to the raw content.  This node above, named
> *fmt-node*,
> +is handled by the *qcow2* block driver, which is capable of interpreting
> the
> +qcow2 format.  Parents of this node will therefore see the actual conten=
t
> of the
> +virtual disk that is represented by the qcow2 image.  There is only one
> parent
> +here, which is the *virtio-blk* guest device, which will thus see the
> virtual
> +disk.
> +
> +The command line to achieve the above could look something like this:
> +```
> +$ qemu-system-x86_64 \
> +    -blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$image_path=
 \
> +    -blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-node \
> +    -device virtio-blk,drive=3Dfmt-node
> +```
> +
> +Besides attaching guest devices to block nodes, you can also export them
> for
> +users outside of qemu, for example via NBD.  Say you have a QMP channel
> open for
> +the QEMU instance above, then you could do this:
>

As much as I hate to say it, wouldn't it be better to give the example
below using
(legacy?) qemu monitor commands, instead of JSON? Unless it cannot be done
that way
of course, they feel more intuitive/recognizable to me I think.

+```json
> +{
> +    "execute": "nbd-server-start",
> +    "arguments": {
> +        "addr": {
> +            "type": "inet",
> +            "data": {
> +                "host": "localhost",
> +                "port": "10809"
> +            }
> +        }
> +    }
> +}
> +{
> +    "execute": "block-export-add",
> +    "arguments": {
> +        "type": "nbd",
> +        "id": "fmt-node-export",
> +        "node-name": "fmt-node",
> +        "name": "guest-disk"
> +    }
> +}
> +```
> +
> +This opens an NBD server on `localhost:10809`, which exports *fmt-node*
> (under
> +the NBD export name *guest-disk*).  The block graph looks as follows:
> +
> +|![Same block graph as fig. 3, but with an NBD server attached to
> fmt-node](/screenshots/2021-08-18-block-graph-b.svg)|
> +|:--:|
> +|*Fig. 4: Block graph extended by an NBD server*|
> +
> +NBD clients connecting to this server will see the raw disk as seen by t=
he
> +guest =E2=80=93 we have *exported* the guest disk:
> +
> +```
> +$ qemu-img info nbd://localhost/guest-disk
> +image: nbd://localhost:10809/guest-disk
> +file format: raw
> +virtual size: 20 GiB (21474836480 bytes)
> +disk size: unavailable
> +```
> +
> +### QEMU storage daemon
> +
> +If you are not running a guest, and so do not need guest devices, but al=
l
> you
> +want is to use the QEMU block layer (for example to interpret the qcow2
> format)
> +and export nodes from the block graph, then you can use the more
> lightweight
> +QEMU storage daemon instead of a full-blown QEMU process:
> +
> +```
> +$ qemu-storage-daemon \
> +    --blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$image_pat=
h \
> +    --blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-node \
> +    --nbd-server addr.type=3Dinet,addr.host=3Dlocalhost,addr.port=3D1080=
9 \
> +    --export
> type=3Dnbd,id=3Dfmt-node-export,node-name=3Dfmt-node,name=3Dguest-disk
> +```
> +
> +Which creates the following block graph:
> +
> +|![Block graph: image file <-> file node (label: prot-node) <-> qcow2
> node (label: fmt-node) <-> NBD
> server](/screenshots/2021-08-18-block-graph-c.svg)|
> +|:--:|
> +|*Fig. 5: Exporting a qcow2 image over NBD*|
> +
> +## FUSE block exports
> +
> +Besides NBD exports, QEMU also supports vhost-user and FUSE exports.
> FUSE block
> +exports make QEMU become a FUSE driver that provides a filesystem that
> consists
> +of only a single node, namely a regular file that has the raw contents o=
f
> the
> +exported block node.  QEMU will automatically mount this filesystem on a
> given
> +existing regular file (which acts as the mount point, as described in th=
e
> +=E2=80=9CFile mounts=E2=80=9D section).
> +
> +Thus, FUSE exports can be used like this:
> +
> +```
> +$ touch mount-point
> +
> +$ qemu-storage-daemon \
> +    --blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$image_pat=
h \
> +    --blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-node \
> +    --export
> type=3Dfuse,id=3Dfmt-node-export,node-name=3Dfmt-node,mountpoint=3Dmount-=
point
> +```
> +
> +The mount point now appears as the raw VM disk that is stored in the qco=
w2
> +image:
> +```
> +$ qemu-img info mount-point
> +image: mount-point
> +file format: raw
> +virtual size: 20 GiB (21474836480 bytes)
> +disk size: 196 KiB
> +```
> +
> +And *mount* tells us that this is indeed its own filesystem:
> +```
> +$ mount | grep mount-point
> +/dev/fuse on /tmp/mount-point type fuse
> (rw,nosuid,nodev,relatime,user_id=3D1000,group_id=3D100,default_permissio=
ns,allow_other,max_read=3D67108864)
> +```
> +
> +The block graph looks like this:
> +
> +|![Block graph: image file <-> file node (label: prot-node) <-> qcow2
> node (label: fmt-node) <-> FUSE server <-> exported
> file](/screenshots/2021-08-18-block-graph-d.svg)|
> +|:--:|
> +|*Fig. 6: Exporting a qcow2 image over FUSE*|
> +
> +Closing the storage daemon (e.g. with Ctrl-C) automatically unmounts the
> export,
> +turning the mount point back into an empty normal file:
> +
> +```
> +$ mount | grep -c mount-point
> +0
> +
> +$ qemu-img info mount-point
> +image: mount-point
> +file format: raw
> +virtual size: 0 B (0 bytes)
> +disk size: 0 B
> +```
> +
> +## Mounting an image on itself
> +
> +So far, we have seen what FUSE exports are, how they work, and how they
> can be
> +used.  Now let=E2=80=99s add an interesting twist.
> +
> +### What happens to the old tree under a mount point?
> +
> +Mounting a filesystem only shadows the mount point=E2=80=99s original co=
ntent, it
> does
> +not remove it.  The original content can no longer be looked up via its
> +(absolute) path, but it is still there, much like a file that has been
> unlinked
> +but is still open in some process.  Here is an example:
> +
> +First, create some file in some directory, and have some process keep it
> open:
> +
> +```
> +$ mkdir foo
> +
> +$ echo 'Is anyone there?' > foo/bar
> +
> +$ irb
> +irb(main):001:0> f =3D File.open('foo/bar', 'r+')
> +=3D> #<File:foo/bar>
> +irb(main):002:0> ^Z
> +[1]  + 35494 suspended  irb
> +```
> +
> +Next, mount something on the directory:
> +
> +```
> +$ sudo mount -t tmpfs tmpfs foo
> +```
> +
> +The file cannot be found anymore (because *foo*=E2=80=99s content is sha=
dowed by
> the
> +mounted filesystem), but the process who kept it open can still read fro=
m
> it,
> +and write to it:
> +```
> +$ ls foo
> +
> +$ cat foo/bar
> +cat: foo/bar: No such file or directory
> +
> +$ fg
> +f.read
> +irb(main):002:0> f.read
> +=3D> "Is anyone there?\n"
> +irb(main):003:0> f.puts('Hello from the shadows!')
> +=3D> nil
> +irb(main):004:0> exit
> +
> +$ ls foo
> +
> +$ cat foo/bar
> +cat: foo/bar: No such file or directory
> +```
> +
> +Unmounting the filesystem lets us see our file again, with its updated
> content:
> +```
> +$ sudo umount foo
> +
> +$ ls foo
> +bar
> +
> +$ cat foo/bar
> +Is anyone there?
> +Hello from the shadows!
> +```
> +
> +### Letting a FUSE export shadow its image file
> +
> +The same principle applies to file mounts: The original inode is shadowe=
d
> (along
> +with its content), but it is still there for any process that opened it
> before
> +the mount occurred.  Because QEMU (or the storage daemon) opens the imag=
e
> file
> +before mounting the FUSE export, you can therefore specify an image=E2=
=80=99s
> path as
> +the mount point for its corresponding export:
> +
> +```
> +$ qemu-img create -f qcow2 foo.qcow2 20G
> +Formatting 'foo.qcow2', fmt=3Dqcow2 cluster_size=3D65536 extended_l2=3Do=
ff
> compression_type=3Dzlib size=3D21474836480 lazy_refcounts=3Doff refcount_=
bits=3D16
> +
> +$ qemu-img info foo.qcow2
> +image: foo.qcow2
> +file format: qcow2
> +virtual size: 20 GiB (21474836480 bytes)
> +disk size: 196 KiB
> +cluster_size: 65536
> +Format specific information:
> +    compat: 1.1
> +    compression type: zlib
> +    lazy refcounts: false
> +    refcount bits: 16
> +    corrupt: false
> +    extended l2: false
> +
> +$ qemu-storage-daemon \
> +    --blockdev
> node-name=3Dnode0,driver=3Dqcow2,file.driver=3Dfile,file.filename=3Dfoo.q=
cow2 \
> +    --export
> type=3Dfuse,id=3Dnode0-export,node-name=3Dnode0,mountpoint=3Dfoo.qcow2 &
> +[1] 40843
> +
> +$ qemu-img info foo.qcow2
> +image: foo.qcow2
> +file format: raw
> +virtual size: 20 GiB (21474836480 bytes)
> +disk size: 196 KiB
> +
> +$ kill %1
> +[1]  + 40843 done       qemu-storage-daemon --blockdev  --export
> +```
> +
> +In graph form, that looks like this:
> +
> +|![Two graphs: First, foo.qcow2 is opened by QEMU; second, a FUSE server
> exports the raw disk under foo.qcow2, thus shadowing the original
> foo.qcow2](/screenshots/2021-08-18-block-graph-e.svg)|
> +|:--:|
> +|*Fig. 6: Exporting a qcow2 image via FUSE on its own path*|
> +
> +QEMU (or the storage daemon in this case) keeps the original (qcow2) fil=
e
> open,
> +and so it keeps access to it, even after the mount.  However, any other
> process
> +that opens the image by name (i.e. `open("foo.qcow2")`) will open the ra=
w
> disk
> +image exported by QEMU.  Therefore, it looks like the qcow2 image is in
> raw
> +format now.
> +
> +### `qemu-fuse-disk-export.py`
> +
> +Because the QEMU storage daemon command line tends to become kind of
> long, I=E2=80=99ve
> +written a script to facilitate the process:
> +[qemu-fuse-disk-export.py](
> https://gitlab.com/hreitz/qemu-scripts/-/blob/main/qemu-fuse-disk-export.=
py
> )
> +([direct download link](
> https://gitlab.com/hreitz/qemu-scripts/-/raw/main/qemu-fuse-disk-export.p=
y?inline=3Dfalse)
> ).
> +This script automatically detects the image format, and its `--daemonize=
`
> option
> +allows safe use in scripts, where it is important that the process block=
s
> until
> +the export is fully set up.
> +
> +Using `qemu-fuse-disk-export.py`, the above example looks like this:
> +```
> +$ qemu-img info foo.qcow2 | grep 'file format'
> +file format: qcow2
> +
> +$ qemu-fuse-disk-export.py foo.qcow2 &
> +[1] 13339
> +All exports set up, ^C to revert
> +
> +$ qemu-img info foo.qcow2 | grep 'file format'
> +file format: raw
> +
> +$ kill -SIGINT %1
> +[1]  + 13339 done       qemu-fuse-disk-export.py foo.qcow2
> +
> +$ qemu-img info foo.qcow2 | grep 'file format'
> +file format: qcow2
> +```
> +
> +Or, with `--daemonize`/`-d`:
> +```
> +$ qemu-img info foo.qcow2 | grep 'file format'
> +file format: qcow2
> +
> +$ qemu-fuse-disk-export.py -dp qfde.pid foo.qcow2
> +
> +$ qemu-img info foo.qcow2 | grep 'file format'
> +file format: raw
> +
> +$ kill -SIGINT $(cat qfde.pid)
> +
> +$ qemu-img info foo.qcow2 | grep 'file format'
> +file format: qcow2
> +```
> +
> +## Bringing it all together
> +
> +Now we know how to make disk images in any format understood by QEMU
> appear as
> +raw images.  We can thus run any application on them that works with suc=
h
> raw
> +disk images:
> +
> +```
> +$ qemu-fuse-disk-export.py \
> +    -dp qfde.pid \
> +    Arch-Linux-x86_64-basic-20210711.28787.qcow2
> +
> +$ parted Arch-Linux-x86_64-basic-20210711.28787.qcow2 p
> +WARNING: You are not superuser.  Watch out for permissions.
> +Model:  (file)
> +Disk /tmp/Arch-Linux-x86_64-basic-20210711.28787.qcow2: 42.9GB
> +Sector size (logical/physical): 512B/512B
> +Partition Table: gpt
> +Disk Flags:
> +
> +Number  Start   End     Size    File system  Name  Flags
> + 1      1049kB  2097kB  1049kB                     bios_grub
> + 2      2097kB  42.9GB  42.9GB  btrfs
> +
> +$ sudo kpartx -av Arch-Linux-x86_64-basic-20210711.28787.qcow2
> +add map loop0p1 (254:0): 0 2048 linear 7:0 2048
> +add map loop0p2 (254:1): 0 83881951 linear 7:0 4096
> +
> +$ sudo mount /dev/mapper/loop0p2 /mnt/tmp
> +
> +$ ls /mnt/tmp
> +bin   boot  dev  etc  home  lib  lib64  mnt  opt  proc  root  run  sbin
> srv
> +swap  sys   tmp  usr  var
> +
> +$ echo 'Hello, qcow2 image!' > /mnt/tmp/home/arch/hello
> +
> +$ sudo umount /mnt/tmp
> +
> +$ sudo kpartx -d Arch-Linux-x86_64-basic-20210711.28787.qcow2
> +loop deleted : /dev/loop0
> +
> +$ kill -SIGINT $(cat qfde.pid)
> +```
> +
> +And launching the image, in the guest we see:
> +```
> +[arch@archlinux ~] cat hello
> +Hello, qcow2 image!
> +```
> +
> +## A note on `allow_other`
> +
> +In the example presented in the above section, we access the exported
> image with
> +a different user than the one who exported it (to be specific, we export
> it as a
> +normal user, and then access it as root).  This does not work prior to
> QEMU 6.1:
> +
> +```
> +$ qemu-fuse-disk-export.py -dp qfde.pid foo.qcow2
> +
> +$ sudo stat foo.qcow2
> +stat: cannot statx 'foo.qcow2': Permission denied
> +```
> +
> +QEMU 6.1 has introduced support for FUSE=E2=80=99s `allow_other` mount o=
ption.
> Without
> +that option, only the user who exported the image has access to it.  By
> default,
> +if the system allows for non-root users to add `allow_other` to FUSE mou=
nt
> +options, QEMU will add it, and otherwise omit it.  It does so by simply
> +attempting to mount the export with `allow_other` first, and if that
> fails, it
> +will try again without.  (You can also force the behavior with the
> +`allow_other=3D(on|off|auto)` export parameter.)
> +
> +Non-root users can pass `allow_other` if and only if `/etc/fuse.conf`
> contains
> +the `user_allow_other` option.
> +
> +## Conclusion
> +
> +As shown in this blog post, FUSE block exports are a relatively simple
> way to
> +access images in any format understood by QEMU as if they were raw image=
s.
> +Any tool that can manipulate raw disk images can thus manipulate images
> in any
> +format, simply by having the QEMU storage daemon provide a translation
> layer.
> +By mounting the FUSE export on the original image path, this translation
> layer
> +will effectively be invisible, and the original image will look like it
> is in
> +raw format, so it can directly be accessed by those tools.
> +
> +The current main disadvantage of FUSE exports is that they offer
> relatively bad
> +performance.  That should be fine as long as your use case is just light
> +manipulation of some VM images, like manually modifying some files on
> them.
> +However, we did not yet really try to optimize performance, so if more
> serious
> +use cases appear that would require better performance, we can try.
> diff --git a/screenshots/2021-08-18-block-graph-a.svg
> b/screenshots/2021-08-18-block-graph-a.svg
> new file mode 100644
> index 0000000..bea1ba3
>

The rest of it is very didactic and educational - thanks!  And since none
of my comments are critical:

Reviewed-by: Klaus Heinrich Kiwi <kkiwi@redhat.com>

(Not that it matters much)

 -Klaus


> --- /dev/null
> +++ b/screenshots/2021-08-18-block-graph-a.svg
> @@ -0,0 +1,2 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg id=3D"svg5" width=3D"93.084mm" height=3D"112.19mm" version=3D"1.1"
> viewBox=3D"0 0 93.084 112.19" xmlns=3D"http://www.w3.org/2000/svg"><defs
> id=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"a=
uto"><path
> id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-4.017=
7
> 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z"
> fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round"
> stroke-width=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"vis=
ible"
> orient=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7=
186
> 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7
> 8.0354z" fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D=
"round"
> stroke-width=3D".625"/></marker></defs><g id=3D"text31368" fill=3D"#80240=
0"
> stroke-width=3D".26458px" aria-label=3D"QEMU process"><path id=3D"path725=
2"
> d=3D"m72.021 7.6476q-0.75792 0-1.2058 0.565-0.44442 0.565-0.44442 1.54 0
> 0.97152 0.44442 1.5365 0.44786 0.565 1.2058 0.565 0.75792 0 1.1989-0.565
> 0.44442-0.565 0.44442-1.5365
> 0-0.97496-0.44442-1.54-0.44097-0.565-1.1989-0.565zm0.97496 4.5785 0.9164
> 1.0025h-0.8406l-0.76137-0.82338q-0.11369 0.0069-0.1757 0.01034-0.05857
> 0.0034-0.11369 0.0034-1.0852 0-1.7363-0.72347-0.64768-0.72692-0.64768-1.9=
43
> 0-1.2196 0.64768-1.943 0.65112-0.72692 1.7363-0.72692 1.0818 0 1.7294
> 0.72692 0.64768 0.72347 0.64768 1.943 0 0.89573-0.36174 1.5331-0.35829
> 0.63734-1.0404 0.94051z"/><path id=3D"path7254" d=3D"m75.487
> 7.1756h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495v1.8638h2.6183=
v0.58567h-3.3142z"/><path
> id=3D"path7256" d=3D"m79.945 7.1756h1.037l1.3126 3.5002
> 1.3195-3.5002h1.037v5.1435h-0.67868v-4.5165l-1.3264
> 3.5278h-0.69936l-1.3264-3.5278v4.5165h-0.67524z"/><path id=3D"path7258"
> d=3D"m85.953 7.1756h0.69936v3.1247q0 0.82682 0.29972 1.192 0.29972 0.3617=
4
> 0.97152 0.36174 0.66835 0 0.96807-0.36174 0.29972-0.36518
> 0.29972-1.192v-3.1247h0.69936v3.2108q0 1.006-0.49954 1.5193-0.49609
> 0.51332-1.4676 0.51332-0.97496
> 0-1.4745-0.51332-0.49609-0.51332-0.49609-1.5193z"/><path id=3D"path7260"
> d=3D"m67.594 18.916v2.0464h-0.63734v-5.3261h0.63734v0.58567q0.19982-0.344=
51
> 0.50298-0.50988 0.30661-0.16881 0.73036-0.16881 0.7028 0 1.1403 0.55811
> 0.44097 0.55811 0.44097 1.4676t-0.44097 1.4676q-0.43753 0.5581-1.1403
> 0.5581-0.42375
> 0-0.73036-0.16536-0.30317-0.16881-0.50298-0.51332zm2.1566-1.347q0-0.69936=
-0.28939-1.0955-0.28594-0.39963-0.78893-0.39963t-0.79237
> 0.39963q-0.28594 0.39619-0.28594 1.0955t0.28594 1.099q0.28939 0.39619
> 0.79237 0.39619t0.78893-0.39619q0.28939-0.39963 0.28939-1.099z"/><path
> id=3D"path7262" d=3D"m73.695
> 16.229q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.=
53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path7264" d=3D"m75.701
> 16.081q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283
> 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68558-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82682
> 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198
> 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path7266" d=3D"m81.299
> 15.785v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825
> 0.06201-0.60289 0.06201-0.87161
> 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848
> 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857
> 0.54088 0.17914z"/><path id=3D"path7268" d=3D"m85.702
> 17.408v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35485 0.34106
> 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path7270=
"
> d=3D"m89.202
> 15.75v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.06=
89-0.47198
> 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96
> 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774
> 0.40997 0.28594 0.26183 0.28594 0.7338 0 0.53744-0.42719 0.85094-0.42375
> 0.3135-1.1679 0.3135-0.31006
> 0-0.64768-0.06201-0.33418-0.05857-0.70625-0.17914v-0.65457q0.3514 0.18259
> 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158
> 0.24116-0.15503 0.24116-0.43408
> 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q=
-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624
> 0-0.54433 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146
> 0.05168t0.57189 0.15503z"/><path id=3D"path7272" d=3D"m92.878
> 15.75v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.06=
89-0.47198
> 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96
> 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774
> 0.40997 0.28594 0.26183 0.28594 0.7338 0 0.53744-0.42719 0.85094-0.42375
> 0.3135-1.1679 0.3135-0.31006
> 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259
> 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158
> 0.24116-0.15503 0.24116-0.43408
> 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q=
-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624
> 0-0.54433 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146
> 0.05168t0.57189 0.15503z"/></g><rect id=3D"rect991" x=3D"15.436" y=3D"33.=
475"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text3313"
> stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=3D"path7275" d=3D=
"m22.055
> 38.496q0 0.69935 0.28594 1.099 0.28939 0.39619 0.79237
> 0.39619t0.79237-0.39619q0.28939-0.39963 0.28939-1.099
> 0-0.69936-0.28939-1.0955-0.28939-0.39963-0.79237-0.39963t-0.79237
> 0.39963q-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982
> 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936
> 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676 0-0.90951 0.43753-1.4676
> 0.44097-0.55811 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536
> 0.50643 0.50987v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path7277"
> d=3D"m28.932
> 36.711v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825
> 0.06201-0.60289 0.06201-0.87161
> 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848
> 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857
> 0.54088 0.17914z"/><path id=3D"path7279" d=3D"m31.529 37.008q-0.50987 0-0=
.80615
> 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628
> 0.39619 0.8096 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0886q0-0.68558-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82682
> 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198
> 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path7281" d=3D"m33.982
> 36.563h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371
> 3.1626h-0.74759z"/><path id=3D"path7283" d=3D"m40.81
> 39.836h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68558-0.69246 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494t0.66835-0.08613q0.79926 0 1.2747 0.39963 0.47542 0.39963
> 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064
> 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164 0.47542-1.3022
> 1.3333z"/></g><rect id=3D"rect9379" x=3D"15.436" y=3D"62.186" width=3D"33=
.768"
> height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"none" stop-color=3D=
"#000000"
> stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"text9383"
> stroke-width=3D".26458px" aria-label=3D"file"><path id=3D"path7303" d=3D"=
m30.837
> 65.488v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-=
0.49265h0.60634v-0.26872q0-0.63045
> 0.29628-0.93018 0.29972-0.30317
> 0.9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091
> 0.1378-0.13091
> 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path
> id=3D"path7305" d=3D"m32.163 63.986h0.6339v5.3606h-0.6339z"/><path
> id=3D"path7307" d=3D"m37.424 67.259v0.31006h-2.9146q0.04134 0.65457 0.392=
74
> 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957
> 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936
> 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.5581 1.3815-0.5581 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g22369"
> transform=3D"translate(78.903 34.429)" fill=3D"none" stroke=3D"#000"
> stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.06h10.715=
l3.1067
> 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path21920"
> d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round"
> style=3D"paint-order:normal"/></g><g id=3D"g25195" transform=3D"translate=
(84.24
> 30.251)"><rect id=3D"rect22371" x=3D"-75.456" y=3D"-25.487" width=3D"47.0=
71"
> height=3D"13.398" fill=3D"none" stop-color=3D"#000000" stroke=3D"#808080"
> stroke-width=3D".52917"/><g id=3D"text22477" fill=3D"#808080"
> stroke-width=3D".26458px" aria-label=3D"virtio-blk"><path id=3D"path7231"
> d=3D"m-67.446-20.016h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469
> 3.8585h-0.86127z"/><path id=3D"path7233"
> d=3D"m-62.815-20.016h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.63=
39z"/><path
> id=3D"path7235"
> d=3D"m-58.619-19.424q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02411z"/><path id=3D"path7237"
> d=3D"m-57.327-21.112v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.127=
47
> 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.73381
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path7239"
> d=3D"m-55.188-20.016h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.63=
39z"/><path
> id=3D"path7241" d=3D"m-51.733-19.572q-0.50987 0-0.80615 0.39963-0.29628
> 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096
> 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68558-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82682
> 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198
> 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path7243"
> d=3D"m-49.1-18.373h1.8569v0.565h-1.8569z"/><path id=3D"path7245"
> d=3D"m-43.464-18.084q0-0.69936-0.28939-1.0955-0.28594-0.39963-0.78893-0.3=
9963-0.50298
> 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955t0.28594 1.099q0.28939
> 0.39619 0.79237 0.39619t0.78893-0.39619q0.28939-0.39963
> 0.28939-1.099zm-2.1566-1.347q0.19982-0.34451 0.50298-0.50988
> 0.30661-0.16881 0.73036-0.16881 0.7028 0 1.1403 0.55811 0.44097 0.55811
> 0.44097 1.4676t-0.44097 1.4676q-0.43753 0.55811-1.1403 0.55811-0.42375
> 0-0.73036-0.16536-0.30317-0.16881-0.50298-0.51332v0.57878h-0.63734v-5.360=
6h0.63734z"/><path
> id=3D"path7247" d=3D"m-41.756-21.518h0.6339v5.3606h-0.6339z"/><path
> id=3D"path7249" d=3D"m-39.819-21.518h0.63734v3.166l1.8914-1.664h0.8096l-2=
.0464
> 1.8052 2.1325
> 2.0533h-0.82682l-1.9603-1.8845v1.8845h-0.63734z"/></g></g><rect
> id=3D"rect23797" x=3D".26458" y=3D".26458" width=3D"64.111" height=3D"83.=
942"
> rx=3D"5.2917" ry=3D"5.4057" fill=3D"none" stop-color=3D"#000000" stroke=
=3D"#802400"
> stroke-dasharray=3D"2.11666, 2.11666" stroke-linecap=3D"round"
> stroke-width=3D".52917"/><path id=3D"path24007" d=3D"m32.315 80.657v10.83=
7"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><path id=3D"path25180" d=3D"m32.315 52.012v=
9.2246"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><path id=3D"path25334" d=3D"m32.315 19.127v=
13.399"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><rect id=3D"rect35415" x=3D"17.503" y=3D"71=
.251"
> width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd"
> stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".529"/><g id=3D"text35918" stroke-width=3D".26458px"
> aria-label=3D"prot-node"><path id=3D"path7310" d=3D"m21.06
> 76.592v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116
> 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067
> 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823
> 0.39067-0.29662
> 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.489=
55-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466
> 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733
> 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path
> id=3D"path7312" d=3D"m25.331
> 74.711q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.37=
62
> 0-0.57878 0.24598-0.20016 0.24357-0.20016
> 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598
> 0.36415-0.36415 0.22428-0.12058 0.54501-0.12058 0.04582 0 0.10129 0.0072
> 0.05547 0.0048 0.12299 0.01688z"/><path id=3D"path7314" d=3D"m26.735
> 74.608q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0
> 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.2074-0.28215-0.56=
19-0.28215zm0-0.3762q0.57878
> 0 0.90916 0.3762t0.33038 1.0418q0 0.66318-0.33038 1.0418-0.33038
> 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path7316" d=3D"m29.149
> 73.53v0.76688h0.91398v0.34486h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34486=
h0.32556v-0.76688z"/><path
> id=3D"path7318" d=3D"m30.422 75.447h1.2998v0.3955h-1.2998z"/><path
> id=3D"path7320" d=3D"m34.674
> 75.367v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291t-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path7322" d=3D"m36.605
> 74.608q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.20739-0.27974 0.20739-0.76206
> 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 =
0
> 0.90916 0.3762t0.33038 1.0418q0 0.66318-0.33038 1.0418-0.33038
> 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path7324" d=3D"m40.358
> 74.707v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.5546=
6
> 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path7326" d=3D"m4=
4.026
> 75.536v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69936 0.24839 0.23874
> 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10128-0.48955 0.15434-0.2508
> 0.05305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><rect
> id=3D"rect38770" x=3D"17.503" y=3D"42.585" width=3D"29.634" height=3D"8.4=
415"
> fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000=
"
> stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text38774"
> stroke-width=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path7286" d=
=3D"m22.93
> 44.774v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 0.09646-0.09164
> 0.34726v0.23875h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-=
0.34485h0.42444v-0.1881q0-0.45096
> 0.20981-0.65595 0.20981-0.2074 0.66559-0.2074z"/><path id=3D"path7288"
> d=3D"m25.405 46.343q0.1664-0.29904 0.39791-0.44132t0.54501-0.14228q0.4220=
2 0
> 0.65112 0.29662 0.2291 0.29421 0.2291
> 0.83922v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636t-0.41961-0.1881=
q-0.34485
> 0-0.54501 0.2291t-0.20016
> 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0=
.42444-0.1881-0.34003
> 0-0.54019 0.23151-0.20016 0.2291-0.20016
> 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839
> 0.36415-0.36656t0.50402-0.11817q0.29421 0 0.49919 0.14952 0.2074 0.14952
> 0.30627 0.43408z"/><path id=3D"path7290" d=3D"m28.552
> 45.058v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path7292" d=3D"m29.825 46.975h1.2998v0.3955h-1.2998z"/><path
> id=3D"path7294" d=3D"m34.077
> 46.896v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291t-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path7296" d=3D"m36.008
> 46.136q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0
> 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.2074-0.28215-0.56=
19-0.28215zm0-0.3762q0.57878
> 0 0.90916 0.3762t0.33038 1.0418q0 0.66318-0.33038 1.0418-0.33038
> 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path7298" d=3D"m39.761
> 46.235v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.5546=
6
> 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path7300" d=3D"m4=
3.429
> 47.065v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69936 0.24839 0.23874
> 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><g id=3D"text877=
"
> stroke-width=3D".26458px" aria-label=3D"qcow2 image file"><path id=3D"pat=
h7204"
> d=3D"m52.492 98.541q0 0.69936 0.28594 1.099 0.28939 0.39618 0.79237
> 0.39618t0.79237-0.39618q0.28939-0.39963
> 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963t-0.79237
> 0.39963q-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982
> 0.34451-0.50643 0.51332-0.30317 0.16537-0.73036 0.16537-0.69936
> 0-1.1403-0.55811-0.43753-0.5581-0.43753-1.4676t0.43753-1.4676q0.44097-0.5=
5811
> 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643
> 0.50987v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path7206" d=3D"m59.=
368
> 96.757v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18603-0.2825
> 0.062-0.60289 0.062-0.87161 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.47=
8
> 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189
> 0.06201 0.27905 0.05857 0.54088 0.17914z"/><path id=3D"path7208" d=3D"m61=
.966
> 97.053q-0.50988 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.6924=
6
> 0.29283 1.0921 0.29628 0.39618 0.8096 0.39618 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82682
> 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198
> 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path7210" d=3D"m64.419
> 96.609h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371
> 3.1626h-0.74759z"/><path id=3D"path7212" d=3D"m71.247
> 99.882h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68558-0.69246 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494t0.66835-0.08613q0.79926 0 1.2747 0.39963 0.47542 0.39963
> 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064
> 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164 0.47542-1.3022
> 1.3333z"/><path id=3D"path7214" d=3D"m46.098
> 103.78h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.8027h-0.6339z"/><path
> id=3D"path7216" d=3D"m51.062 104.53q0.23771-0.42719
> 0.56844-0.63045t0.77859-0.20326q0.60289 0 0.93018 0.42375 0.32728 0.4203
> 0.32728
> 1.1989v2.3289h-0.63734v-2.3082q0-0.55466-0.19637-0.82338-0.19637-0.26871-=
0.59945-0.26871-0.49265
> 0-0.77859 0.32728t-0.28594
> 0.89228v2.1808h-0.63734v-2.3082q0-0.5581-0.19637-0.82338-0.19637-0.26871-=
0.60634-0.26871-0.48576
> 0-0.7717 0.33073-0.28594 0.32728-0.28594
> 0.88883v2.1808h-0.63734v-3.8585h0.63734v0.59944q0.21704-0.35484
> 0.52021-0.52365t0.72003-0.16881q0.4203 0 0.71314 0.2136 0.29628 0.21359
> 0.43753 0.62011z"/><path id=3D"path7218" d=3D"m56.684 105.7q-0.76826 0-1.=
0645
> 0.1757t-0.29628 0.59944q0 0.33762 0.22049 0.53744 0.22393 0.19637 0.60634
> 0.19637 0.5271 0 0.84405-0.37207 0.32039-0.37552
> 0.32039-0.99563v-0.14125zm1.2644-0.26183v2.2014h-0.6339v-0.58567q-0.21704
> 0.3514-0.54088 0.52021-0.32384 0.16537-0.79237 0.16537-0.59256
> 0-0.94396-0.33073-0.34795-0.33418-0.34795-0.89228 0-0.65113 0.43408-0.981=
86
> 0.43753-0.33073
> 1.3022-0.33073h0.88884v-0.062q0-0.43753-0.28939-0.67524-0.28594-0.24115-0=
.80615-0.24115-0.33073
> 0-0.64423 0.0792t-0.60289 0.23771v-0.58566q0.34795-0.13436 0.67524-0.1998=
2
> 0.32728-0.0689 0.63734-0.0689 0.83716 0 1.2506 0.43408 0.41341 0.43408
> 0.41341 1.316z"/><path id=3D"path7220" d=3D"m61.793
> 105.67q0-0.68902-0.28594-1.068-0.2825-0.37896-0.79582-0.37896-0.50988
> 0-0.79582 0.37896-0.2825 0.37896-0.2825 1.068 0 0.68557 0.2825 1.0645
> 0.28594 0.37896 0.79582 0.37896 0.51332 0 0.79582-0.37896 0.28594-0.37896
> 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642-0.43753
> 0.48231-1.3401 0.48231-0.33418
> 0-0.63045-0.0517-0.29628-0.0482-0.57533-0.15158v-0.61667q0.27905 0.15158
> 0.55122 0.22393 0.27216 0.0723 0.55466 0.0723 0.62356 0 0.93362-0.32728
> 0.31006-0.32384 0.31006-0.98185v-0.31351q-0.19637 0.34107-0.50298
> 0.50988t-0.73381 0.16881q-0.70969
> 0-1.1438-0.54088t-0.43408-1.4332q0-0.89573
> 0.43408-1.4366t1.1438-0.54088q0.42719 0 0.73381 0.16881t0.50298
> 0.50987v-0.58566h0.6339z"/><path id=3D"path7222" d=3D"m67.033
> 105.56v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106
> 0.9853 0.34106 0.36518 0 0.70624-0.0896 0.34451-0.0896
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22048-0.35829
> 0.0758-0.72692 0.0758-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31005-0.=
75103-0.31005-0.53055
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path7224=
"
> d=3D"m73.434
> 103.78v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-=
0.49265h0.60634v-0.26872q0-0.63045
> 0.29628-0.93018 0.29972-0.30316
> 0.9164-0.30316h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091
> 0.1378-0.13091
> 0.49609v0.34107zm-0.63734-1.4952h0.63734v0.8027h-0.63734z"/><path
> id=3D"path7226" d=3D"m74.761 102.28h0.6339v5.3606h-0.6339z"/><path
> id=3D"path7228" d=3D"m80.021 105.56v0.31006h-2.9146q0.04134 0.65457 0.392=
74
> 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.0896
> 0.34451-0.0896 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936
> 0.22048-0.35829 0.0758-0.72692 0.0758-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31005-0.=
75103-0.31005-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g></svg>
> diff --git a/screenshots/2021-08-18-block-graph-b.svg
> b/screenshots/2021-08-18-block-graph-b.svg
> new file mode 100644
> index 0000000..5bf98af
> --- /dev/null
> +++ b/screenshots/2021-08-18-block-graph-b.svg
> @@ -0,0 +1,2 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg id=3D"svg5" width=3D"93.084mm" height=3D"112.19mm" version=3D"1.1"
> viewBox=3D"0 0 93.084 112.19" xmlns=3D"http://www.w3.org/2000/svg"><defs
> id=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"a=
uto"><path
> id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-4.017=
7
> 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z"
> fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round"
> stroke-width=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"vis=
ible"
> orient=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7=
186
> 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7
> 8.0354z" fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D=
"round"
> stroke-width=3D".625"/></marker></defs><rect id=3D"rect991" x=3D"15.436"
> y=3D"33.475" width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.894=
8"
> fill=3D"none" stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".529=
17"/><g
> id=3D"text3313" stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=
=3D"path96"
> d=3D"m22.055 38.496q0 0.69935 0.28594 1.099 0.28939 0.39619 0.79237 0.396=
19
> 0.50298 0 0.79237-0.39619 0.28939-0.39963 0.28939-1.099
> 0-0.69936-0.28939-1.0955-0.28939-0.39963-0.79237-0.39963-0.50298 0-0.7923=
7
> 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982
> 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936
> 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676 0-0.90951 0.43753-1.4676
> 0.44097-0.55811 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536
> 0.50643 0.50987v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path98"
> d=3D"m28.932
> 36.711v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825
> 0.06201-0.60289 0.06201-0.87161
> 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848
> 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857
> 0.54088 0.17914z"/><path id=3D"path100" d=3D"m31.529 37.008q-0.50987 0-0.=
80615
> 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628
> 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963
> 0.29628-1.0886
> 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path102" d=3D"m33.982
> 36.563h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371
> 3.1626h-0.74759z"/><path id=3D"path104" d=3D"m40.81
> 39.836h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68558-0.69246 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963
> 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713
> 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164
> 0.47542-1.3022 1.3333z"/></g><rect id=3D"rect9379" x=3D"15.436" y=3D"62.1=
86"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text9383"
> stroke-width=3D".26458px" aria-label=3D"file"><path id=3D"path124" d=3D"m=
30.837
> 65.488v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-=
0.49265h0.60634v-0.26872q0-0.63045
> 0.29628-0.93018 0.29972-0.30317
> 0.9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091
> 0.1378-0.13091
> 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path
> id=3D"path126" d=3D"m32.163 63.986h0.6339v5.3606h-0.6339z"/><path id=3D"p=
ath128"
> d=3D"m37.424 67.259v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.5581 1.3815-0.5581 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g22369"
> transform=3D"translate(78.903 34.429)" fill=3D"none" stroke=3D"#000"
> stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.06h10.715=
l3.1067
> 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path21920"
> d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round"
> style=3D"paint-order:normal"/></g><g id=3D"g25195" transform=3D"translate=
(84.24
> 30.251)"><rect id=3D"rect22371" x=3D"-75.456" y=3D"-25.487" width=3D"47.0=
71"
> height=3D"13.398" fill=3D"none" stop-color=3D"#000000" stroke=3D"#808080"
> stroke-width=3D".52917"/><g id=3D"text22477" fill=3D"#808080"
> stroke-width=3D".26458px" aria-label=3D"virtio-blk"><path id=3D"path75"
> d=3D"m-67.446-20.016h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469
> 3.8585h-0.86127z"/><path id=3D"path77"
> d=3D"m-62.815-20.016h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.63=
39z"/><path
> id=3D"path79"
> d=3D"m-58.619-19.424q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02411z"/><path id=3D"path81"
> d=3D"m-57.327-21.112v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.127=
47
> 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.73381
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path83"
> d=3D"m-55.188-20.016h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.63=
39z"/><path
> id=3D"path85" d=3D"m-51.733-19.572q-0.50987 0-0.80615 0.39963-0.29628
> 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096
> 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path87"
> d=3D"m-49.1-18.373h1.8569v0.565h-1.8569z"/><path id=3D"path89"
> d=3D"m-43.464-18.084q0-0.69936-0.28939-1.0955-0.28594-0.39963-0.78893-0.3=
9963-0.50298
> 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955t0.28594 1.099q0.28939
> 0.39619 0.79237 0.39619 0.50298 0 0.78893-0.39619 0.28939-0.39963
> 0.28939-1.099zm-2.1566-1.347q0.19982-0.34451 0.50298-0.50988
> 0.30661-0.16881 0.73036-0.16881 0.7028 0 1.1403 0.55811 0.44097 0.55811
> 0.44097 1.4676t-0.44097 1.4676q-0.43753 0.55811-1.1403 0.55811-0.42375
> 0-0.73036-0.16536-0.30317-0.16881-0.50298-0.51332v0.57878h-0.63734v-5.360=
6h0.63734z"/><path
> id=3D"path91" d=3D"m-41.756-21.518h0.6339v5.3606h-0.6339z"/><path id=3D"p=
ath93"
> d=3D"m-39.819-21.518h0.63734v3.166l1.8914-1.664h0.8096l-2.0464 1.8052 2.1=
325
> 2.0533h-0.82682l-1.9603-1.8845v1.8845h-0.63734z"/></g></g><rect
> id=3D"rect23797" x=3D".26458" y=3D".26458" width=3D"76.401" height=3D"83.=
942"
> rx=3D"6.3061" ry=3D"5.4057" fill=3D"none" stop-color=3D"#000000" stroke=
=3D"#802400"
> stroke-dasharray=3D"2.11666, 2.11666" stroke-linecap=3D"round"
> stroke-width=3D".52917"/><path id=3D"path24007" d=3D"m32.315 80.657v10.83=
7"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><path id=3D"path25180" d=3D"m32.315 52.012v=
9.2246"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><path id=3D"path25334" d=3D"m32.315 19.127v=
13.399"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><rect id=3D"rect35415" x=3D"17.503" y=3D"71=
.251"
> width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd"
> stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".529"/><g id=3D"text35918" stroke-width=3D".26458px"
> aria-label=3D"prot-node"><path id=3D"path131" d=3D"m21.06
> 76.592v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116
> 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067
> 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823
> 0.39067-0.29662
> 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.489=
55-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466
> 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733
> 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path
> id=3D"path133" d=3D"m25.331
> 74.711q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.37=
62
> 0-0.57878 0.24598-0.20016 0.24357-0.20016
> 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598
> 0.36415-0.36415 0.22428-0.12058 0.54501-0.12058 0.04582 0 0.10129 0.0072
> 0.05547 0.0048 0.12299 0.01688z"/><path id=3D"path135" d=3D"m26.735
> 74.608q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0
> 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.2074-0.28215-0.56=
19-0.28215zm0-0.3762q0.57878
> 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path137" d=3D"m29.149
> 73.53v0.76688h0.91398v0.34486h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34486=
h0.32556v-0.76688z"/><path
> id=3D"path139" d=3D"m30.422 75.447h1.2998v0.3955h-1.2998z"/><path id=3D"p=
ath141"
> d=3D"m34.674
> 75.367v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291t-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path143" d=3D"m36.605
> 74.608q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.20739-0.27974 0.20739-0.76206
> 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 =
0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path145" d=3D"m40.358
> 74.707v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.5546=
6
> 0.27733 0.35209 0 0.55466-0.27733 0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974-0.35209
> 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path147"
> d=3D"m44.026 75.536v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69936 0.2483=
9
> 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10128-0.48955 0.15434-0.2508
> 0.05305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><rect
> id=3D"rect38770" x=3D"17.503" y=3D"42.585" width=3D"29.634" height=3D"8.4=
415"
> fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000=
"
> stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text38774"
> stroke-width=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path107" d=
=3D"m22.93
> 44.774v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 0.09646-0.09164
> 0.34726v0.23875h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-=
0.34485h0.42444v-0.1881q0-0.45096
> 0.20981-0.65595 0.20981-0.2074 0.66559-0.2074z"/><path id=3D"path109"
> d=3D"m25.405 46.343q0.1664-0.29904 0.39791-0.44132 0.23151-0.14228
> 0.54501-0.14228 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291
> 0.83922v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-=
0.41961-0.1881-0.34485
> 0-0.54501 0.2291t-0.20016
> 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0=
.42444-0.1881-0.34003
> 0-0.54019 0.23151-0.20016 0.2291-0.20016
> 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839
> 0.36415-0.36656t0.50402-0.11817q0.29421 0 0.49919 0.14952 0.2074 0.14952
> 0.30627 0.43408z"/><path id=3D"path111" d=3D"m28.552
> 45.058v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path113" d=3D"m29.825 46.975h1.2998v0.3955h-1.2998z"/><path id=3D"p=
ath115"
> d=3D"m34.077
> 46.896v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14952-0.19051-=
0.44855-0.19051-0.35932
> 0-0.56672 0.2291-0.2074 0.2291-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path117" d=3D"m36.008
> 46.136q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0
> 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.2074-0.28215-0.56=
19-0.28215zm0-0.3762q0.57878
> 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path119" d=3D"m39.761
> 46.235v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.5546=
6
> 0.27733 0.35209 0 0.55466-0.27733 0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974-0.35209
> 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path121"
> d=3D"m43.429 47.065v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69936 0.2483=
9
> 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><g id=3D"g4466"
> transform=3D"translate(1.1863 -2.0666)"><rect id=3D"rect951" x=3D"61.379"
> y=3D"16.76" width=3D"28.304" height=3D"19.996" fill=3D"#fff" fill-rule=3D=
"evenodd"
> stop-color=3D"#000000" stroke=3D"#808080" stroke-width=3D".52917"/><g
> id=3D"text955" fill=3D"#808080" stroke-width=3D".26458px" aria-label=3D"N=
BD
> server"><path id=3D"path56" d=3D"m68.257 20.548h0.93707l2.2807
> 4.3029v-4.3029h0.67524v5.1435h-0.93707l-2.2807-4.3029v4.3029h-0.67524z"/>=
<path
> id=3D"path58" d=3D"m74.231 23.235v1.8845h1.1162q0.56155 0 0.83027-0.23082
> 0.27216-0.23427 0.27216-0.71314
> 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1153v1.550=
3h1.0301q0.50988
> 0 0.75792-0.18948 0.25149-0.19293 0.25149-0.58567
> 0-0.3893-0.25149-0.58222-0.24805-0.19293-0.75792-0.19293zm-0.69591-0.5718=
9h1.7777q0.79582
> 0 1.2265 0.33073 0.43064 0.33073 0.43064 0.94051 0 0.47198-0.22049
> 0.75103-0.22049 0.27905-0.64768 0.34796 0.51332 0.11024 0.79582 0.46164
> 0.28594 0.34796 0.28594 0.87161 0 0.68902-0.46853 1.0645-0.46853
> 0.37552-1.3333 0.37552h-1.8466z"/><path id=3D"path60" d=3D"m79.071
> 21.12v3.9998h0.8406q1.0645 0 1.5572-0.48231 0.49609-0.48231 0.49609-1.522=
7
> 0-1.0335-0.49609-1.5124-0.49265-0.48231-1.5572-0.48231zm-0.69591-0.57189h=
1.4297q1.4952
> 0 2.1945 0.62356 0.69936 0.62012 0.69936 1.943 0 1.3298-0.7028
> 1.9534-0.7028 0.62356-2.1911 0.62356h-1.4297z"/><path id=3D"path62"
> d=3D"m67.297
> 29.002v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.0=
689-0.47198
> 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96
> 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774
> 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.85094-0.42375
> 0.3135-1.1679 0.3135-0.31006
> 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259
> 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158
> 0.24116-0.15503 0.24116-0.43408
> 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q=
-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624
> 0-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146
> 0.05168 0.31006 0.05168 0.57189 0.15503z"/><path id=3D"path64" d=3D"m71.8=
14
> 30.659v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35485 0.34106
> 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.1447-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path66"
> d=3D"m75.09
> 29.481q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.=
53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01033
> 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path68" d=3D"m75.3
> 28.889h0.67179l1.2058 3.2384 1.2058-3.2384h0.6718l-1.4469
> 3.8585h-0.86127z"/><path id=3D"path70" d=3D"m83.231
> 30.659v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106
> 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.1447-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path72"
> d=3D"m86.507
> 29.481q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.=
53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01033
> 0.07924 0.0069 0.1757 0.02412z"/></g></g><path id=3D"path4501" d=3D"m42.5=
42
> 32.486c0-7.5272 6.2582-7.9595 6.2582-7.9595h12.801" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/></svg>
> diff --git a/screenshots/2021-08-18-block-graph-c.svg
> b/screenshots/2021-08-18-block-graph-c.svg
> new file mode 100644
> index 0000000..bcdf868
> --- /dev/null
> +++ b/screenshots/2021-08-18-block-graph-c.svg
> @@ -0,0 +1,2 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg id=3D"svg5" width=3D"46.756mm" height=3D"107.74mm" version=3D"1.1"
> viewBox=3D"0 0 46.756 107.74" xmlns=3D"http://www.w3.org/2000/svg"><defs
> id=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"a=
uto"><path
> id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-4.017=
7
> 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z"
> fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round"
> stroke-width=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"vis=
ible"
> orient=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7=
186
> 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7
> 8.0354z" fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D=
"round"
> stroke-width=3D".625"/></marker></defs><rect id=3D"rect23797" x=3D".26458=
"
> y=3D"9.1324" width=3D"46.227" height=3D"70.624" rx=3D"3.8155" ry=3D"4.548=
1"
> fill=3D"none" stop-color=3D"#000000" stroke=3D"#802400"
> stroke-dasharray=3D"2.11666, 2.11666" stroke-linecap=3D"round"
> stroke-width=3D".52917"/><rect id=3D"rect991" x=3D"6.494" y=3D"29.025"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text3313"
> stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=3D"path54" d=3D"m=
13.113
> 34.046q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237
> 0.39619t0.79237-0.39619q0.28939-0.39963
> 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963t-0.79237
> 0.39963q-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982
> 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69935
> 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0.=
5581
> 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643
> 0.50988v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path56" d=3D"m19.99
> 32.261v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54432-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54432-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825
> 0.06201-0.60289 0.06201-0.87161
> 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848
> 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857
> 0.54088 0.17914z"/><path id=3D"path58" d=3D"m22.587 32.557q-0.50987 0-0.8=
0615
> 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619
> 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198
> 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path60" d=3D"m25.04
> 32.113h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371
> 3.1626h-0.74759z"/><path id=3D"path62" d=3D"m31.868
> 35.386h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68557-0.69246 0.86127-0.89228 0.33418-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963
> 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713
> 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164
> 0.47542-1.3022 1.3333z"/></g><rect id=3D"rect9379" x=3D"6.494" y=3D"57.73=
6"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text9383"
> stroke-width=3D".26458px" aria-label=3D"file"><path id=3D"path82" d=3D"m2=
1.895
> 61.038v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-=
0.49265h0.60634v-0.26872q0-0.63045
> 0.29628-0.93018 0.29972-0.30317
> 0.9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091
> 0.1378-0.13091
> 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path
> id=3D"path84" d=3D"m23.221 59.536h0.6339v5.3606h-0.6339z"/><path id=3D"pa=
th86"
> d=3D"m28.482 62.809v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g22369"
> transform=3D"translate(69.961 29.979)" fill=3D"none" stroke=3D"#000"
> stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.06h10.715=
l3.1067
> 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path21920"
> d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round"
> style=3D"paint-order:normal"/></g><g id=3D"g25195" transform=3D"translate=
(75.298
> 30.046)"><rect id=3D"rect22371" x=3D"-66.56" y=3D"-29.781" width=3D"29.28=
"
> height=3D"17.692" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#0000=
00"
> stroke=3D"#808080" stroke-width=3D".52917"/><g id=3D"text22477" fill=3D"#=
808080"
> stroke-width=3D".26458px" aria-label=3D"NBD server"><path id=3D"path35"
> d=3D"m-59.195-27.145h0.93707l2.2807
> 4.3029v-4.3029h0.67524v5.1435h-0.93707l-2.2807-4.3029v4.3029h-0.67524z"/>=
<path
> id=3D"path37" d=3D"m-53.221-24.458v1.8845h1.1162q0.56155 0 0.83027-0.2308=
2
> 0.27216-0.23427 0.27216-0.71314
> 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1153v1.550=
3h1.0301q0.50988
> 0 0.75792-0.18948 0.25149-0.19292 0.25149-0.58567
> 0-0.3893-0.25149-0.58222-0.24805-0.19293-0.75792-0.19293zm-0.69591-0.5718=
9h1.7777q0.79582
> 0 1.2265 0.33073 0.43064 0.33073 0.43064 0.94051 0 0.47198-0.22049
> 0.75103-0.22049 0.27905-0.64768 0.34795 0.51332 0.11024 0.79582 0.46164
> 0.28594 0.34795 0.28594 0.87161 0 0.68902-0.46853 1.0645-0.46853
> 0.37552-1.3333 0.37552h-1.8466z"/><path id=3D"path39"
> d=3D"m-48.38-26.573v3.9998h0.8406q1.0645 0 1.5572-0.48231 0.49609-0.48231
> 0.49609-1.5227
> 0-1.0335-0.49609-1.5124-0.49265-0.48231-1.5572-0.48231zm-0.69591-0.57189h=
1.4297q1.4952
> 0 2.1945 0.62356 0.69936 0.62012 0.69936 1.943 0 1.3298-0.7028
> 1.9534-0.7028 0.62356-2.1911 0.62356h-1.4297z"/><path id=3D"path41"
> d=3D"m-60.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.06=
89-0.59945-0.0689-0.47198
> 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96
> 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774
> 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.85094-0.42375
> 0.3135-1.1679 0.3135-0.31006
> 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259
> 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158
> 0.24116-0.15503 0.24116-0.43408
> 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q=
-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624
> 0-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146
> 0.05168t0.57189 0.15503z"/><path id=3D"path43"
> d=3D"m-55.638-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35=
484
> 0.34106 0.9853 0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path45"
> d=3D"m-52.361-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path47"
> d=3D"m-52.151-18.805h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469
> 3.8585h-0.86128z"/><path id=3D"path49"
> d=3D"m-44.22-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path51"
> d=3D"m-40.944-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02412z"/></g></g><path id=3D"path24007" d=3D"m23.=
373
> 76.207v10.837" fill=3D"none" marker-end=3D"url(#Arrow1Mend)"
> marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1=
.05833,
> 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path
> id=3D"path25180" d=3D"m23.373 47.562v9.2246" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><path id=3D"path25334" d=3D"m23.373 18.929v=
9.1469"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2=
Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><rect id=3D"rect35415" x=3D"8.5609" y=3D"66=
.8"
> width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd"
> stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".529"/><g id=3D"text35918" stroke-width=3D".26458px"
> aria-label=3D"prot-node"><path id=3D"path89" d=3D"m12.118
> 72.142v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116
> 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067
> 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823
> 0.39067-0.29662
> 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.489=
55-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974-0.35209
> 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257
> 0.27733 0.55466 0.27733 0.35209 0 0.55225-0.27733 0.20257-0.27974
> 0.20257-0.76929z"/><path id=3D"path91" d=3D"m16.389
> 70.261q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19292-0.0217-0.37=
62
> 0-0.57878 0.24598-0.20016 0.24357-0.20016
> 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598
> 0.36415-0.36415 0.22428-0.12058 0.54502-0.12058 0.04582 0 0.10128 0.0072
> 0.05547 0.0048 0.12299 0.01688z"/><path id=3D"path93" d=3D"m17.793
> 70.157q-0.35691 0-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.20739-0.28215-0.5619-0.28215zm0-0.3762q0.57878 =
0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path95" d=3D"m20.207
> 69.08v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path97" d=3D"m21.48 70.997h1.2998v0.3955h-1.2998z"/><path id=3D"pat=
h99"
> d=3D"m25.732
> 70.917v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291t-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path101" d=3D"m27.663
> 70.157q-0.35691 0-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path103" d=3D"m31.416
> 70.256v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29904 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.5546=
6
> 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path105" d=3D"m35=
.084
> 71.086v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.23874
> 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23875 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><rect
> id=3D"rect38770" x=3D"8.5609" y=3D"38.135" width=3D"29.634" height=3D"8.4=
415"
> fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000=
"
> stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text38774"
> stroke-width=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path65" d=
=3D"m13.988
> 40.323v0.36897h-0.42444q-0.23875 0-0.3328 0.09646-0.09164 0.09646-0.09164
> 0.34727v0.23874h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-=
0.34485h0.42444v-0.1881q0-0.45096
> 0.20981-0.65595 0.20981-0.20739 0.66559-0.20739z"/><path id=3D"path67"
> d=3D"m16.463 41.893q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228
> 0.54501-0.14228 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291
> 0.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-=
0.41961-0.1881-0.34486
> 0-0.54502 0.2291t-0.20016
> 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0=
.42444-0.1881-0.34003
> 0-0.54019 0.23151-0.20016 0.2291-0.20016
> 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839
> 0.36415-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.4992 0.14952
> 0.20739 0.14952 0.30627 0.43408z"/><path id=3D"path69" d=3D"m19.61
> 40.608v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path71" d=3D"m20.883 42.525h1.2998v0.3955h-1.2998z"/><path id=3D"pa=
th73"
> d=3D"m25.135
> 42.446v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291t-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70418 0.28939
> 0.23875 0.28698 0.23875 0.84646z"/><path id=3D"path75" d=3D"m27.066
> 41.686q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.20739-0.28215-0.5619-0.28215zm0-0.3762q0.57878 =
0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path77" d=3D"m30.819
> 41.785v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273
> 0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576
> 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733
> 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path79" d=3D"m34.=
487
> 42.614v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.23874
> 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g></svg>
> diff --git a/screenshots/2021-08-18-block-graph-d.svg
> b/screenshots/2021-08-18-block-graph-d.svg
> new file mode 100644
> index 0000000..67c1e81
> --- /dev/null
> +++ b/screenshots/2021-08-18-block-graph-d.svg
> @@ -0,0 +1,2 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg id=3D"svg5" width=3D"105.13mm" height=3D"108.92mm" version=3D"1.1"
> viewBox=3D"0 0 105.13 108.92" xmlns=3D"http://www.w3.org/2000/svg"><defs
> id=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"a=
uto"><path
> id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-4.017=
7
> 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z"
> fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round"
> stroke-width=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"vis=
ible"
> orient=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7=
186
> 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7
> 8.0354z" fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D=
"round"
> stroke-width=3D".625"/></marker></defs><rect id=3D"rect23797" x=3D".26458=
"
> y=3D".26458" width=3D"58.32" height=3D"70.624" rx=3D"4.8137" ry=3D"4.5481=
"
> fill=3D"none" stop-color=3D"#000000" stroke=3D"#802400"
> stroke-dasharray=3D"2.11666, 2.11666" stroke-linecap=3D"round"
> stroke-width=3D".52917"/><rect id=3D"rect991" x=3D"6.4942" y=3D"20.157"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text3313"
> stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=3D"path64" d=3D"m=
13.113
> 25.178q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0
> 0.79237-0.39619 0.28939-0.39963
> 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963-0.50298
> 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982
> 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936
> 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0.=
5581
> 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643
> 0.50988v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path66" d=3D"m19.99
> 23.393v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825
> 0.06201-0.60289 0.06201-0.87161
> 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848
> 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857
> 0.54088 0.17914z"/><path id=3D"path68" d=3D"m22.587 23.69q-0.50988 0-0.80=
615
> 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619
> 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path70" d=3D"m25.04
> 23.245h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371
> 3.1626h-0.74759z"/><path id=3D"path72" d=3D"m31.868
> 26.518h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68558-0.69246 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963
> 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713
> 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164
> 0.47542-1.3022 1.3333z"/></g><rect id=3D"rect9379" x=3D"6.4942" y=3D"48.8=
68"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text9383"
> stroke-width=3D".26458px" aria-label=3D"file"><path id=3D"path92" d=3D"m2=
1.895
> 52.17v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0=
.49265h0.60634v-0.26872q0-0.63045
> 0.29628-0.93018 0.29972-0.30317
> 0.9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091
> 0.1378-0.13091
> 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path
> id=3D"path94" d=3D"m23.221 50.668h0.6339v5.3606h-0.6339z"/><path id=3D"pa=
th96"
> d=3D"m28.482 53.941v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g22369"
> transform=3D"translate(69.961 21.111)" fill=3D"none" stroke=3D"#000"
> stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.06h10.715=
l3.1067
> 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path21920"
> d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round"
> style=3D"paint-order:normal"/></g><g id=3D"g25195" transform=3D"translate=
(110.44
> 35.205)"><rect id=3D"rect22371" x=3D"-66.56" y=3D"-29.781" width=3D"29.28=
"
> height=3D"17.692" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#0000=
00"
> stroke=3D"#808080" stroke-width=3D".52917"/><g id=3D"text22477" fill=3D"#=
808080"
> stroke-width=3D".26458px" aria-label=3D"FUSE server"><path id=3D"path43"
> d=3D"m-60.499-27.145h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2=
.4564h-0.69591z"/><path
> id=3D"path45" d=3D"m-56.519-27.145h0.69936v3.1247q0 0.82682 0.29972 1.192
> 0.29972 0.36174 0.97152 0.36174 0.66835 0 0.96807-0.36174 0.29972-0.36518
> 0.29972-1.192v-3.1247h0.69936v3.2108q0 1.006-0.49954 1.5193-0.49609
> 0.51332-1.4676 0.51332-0.97496
> 0-1.4745-0.51332-0.49609-0.51332-0.49609-1.5193z"/><path id=3D"path47"
> d=3D"m-48.193-26.976v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093=
02-0.67868-0.09302-0.56844
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17226 0.77859 0.27905l0.4203 0.08613q0.77859 0.14814 1.1472
> 0.52366 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.08268-0.40997-0.08268-0.85094-0.2446v-0.71658q0.42375 0.23771
> 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.3204l-0.42375-0.08268q=
-0.77859-0.15503-1.1265-0.48576-0.34796-0.33073-0.34796-0.91984
> 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725
> 0.06546 0.37552 0.06546 0.76826 0.19637z"/><path id=3D"path49"
> d=3D"m-46.797-27.145h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495=
v1.8638h2.6183v0.58567h-3.3142z"/><path
> id=3D"path51"
> d=3D"m-60.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.06=
89-0.59945-0.0689-0.47198
> 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96
> 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774
> 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.85094-0.42375
> 0.3135-1.1679 0.3135-0.31006
> 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259
> 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158
> 0.24116-0.15503 0.24116-0.43408
> 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q=
-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624
> 0-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146
> 0.05168t0.57189 0.15503z"/><path id=3D"path53"
> d=3D"m-55.638-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35=
484
> 0.34106 0.9853 0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path55"
> d=3D"m-52.361-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path57"
> d=3D"m-52.151-18.805h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469
> 3.8585h-0.86128z"/><path id=3D"path59"
> d=3D"m-44.22-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path61"
> d=3D"m-40.944-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02412z"/></g></g><path id=3D"path24007" d=3D"m23.=
373
> 67.339v10.837" fill=3D"none" marker-end=3D"url(#Arrow1Mend)"
> marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1=
.05833,
> 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path
> id=3D"path25180" d=3D"m23.373 38.694v9.2246" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><rect id=3D"rect35415" x=3D"8.561" y=3D"57.=
933"
> width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd"
> stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".529"/><g id=3D"text35918" stroke-width=3D".26458px"
> aria-label=3D"prot-node"><path id=3D"path99" d=3D"m12.118
> 63.274v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116
> 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067
> 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823
> 0.39067-0.29662
> 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.489=
55-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466
> 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733
> 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path
> id=3D"path101" d=3D"m16.389
> 61.393q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.37=
62
> 0-0.57878 0.24598-0.20016 0.24357-0.20016
> 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598
> 0.36415-0.36415 0.22428-0.12058 0.54501-0.12058 0.04582 0 0.10129 0.0072
> 0.05547 0.0048 0.12299 0.01688z"/><path id=3D"path103" d=3D"m17.793
> 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path105" d=3D"m20.207
> 60.212v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path107" d=3D"m21.48 62.129h1.2998v0.3955h-1.2998z"/><path id=3D"pa=
th109"
> d=3D"m25.732
> 62.049v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291-0.20739 0.2291-0.20739
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path111" d=3D"m27.663
> 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path113" d=3D"m31.416
> 61.389v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.5546=
6
> 0.27733 0.35209 0 0.55466-0.27733 0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974-0.35209
> 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path115"
> d=3D"m35.084 62.218v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.2483=
9
> 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><rect
> id=3D"rect38770" x=3D"8.561" y=3D"29.267" width=3D"29.634" height=3D"8.44=
15"
> fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000=
"
> stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text38774"
> stroke-width=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path75" d=
=3D"m13.989
> 31.456v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 0.09646-0.09164
> 0.34727v0.23874h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-=
0.34485h0.42444v-0.1881q0-0.45096
> 0.20981-0.65595 0.20981-0.20739 0.66559-0.20739z"/><path id=3D"path77"
> d=3D"m16.463 33.026q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228
> 0.54501-0.14228 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291
> 0.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-=
0.41961-0.1881-0.34485
> 0-0.54501 0.2291t-0.20016
> 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0=
.42444-0.1881-0.34003
> 0-0.54019 0.23151-0.20016 0.2291-0.20016
> 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839
> 0.36415-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.49919 0.14952
> 0.2074 0.14952 0.30627 0.43408z"/><path id=3D"path79" d=3D"m19.61
> 31.74v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path81" d=3D"m20.883 33.657h1.2998v0.3955h-1.2998z"/><path id=3D"pa=
th83"
> d=3D"m25.135
> 33.578v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14952-0.19051-=
0.44855-0.19051-0.35932
> 0-0.56672 0.2291-0.2074 0.2291-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path85" d=3D"m27.067
> 32.818q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path87" d=3D"m30.819
> 32.917v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273
> 0.30868-0.39067 0.79823-0.39067 0.29904 0 0.51125 0.11817 0.21463 0.11576
> 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733
> 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path89" d=3D"m34.=
487
> 33.747v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.23874
> 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><path
> id=3D"path8203" d=3D"m23.908 19.196c0-8.7692 8.1536-8.1536
> 8.1536-8.1536h10.854" fill=3D"none" marker-end=3D"url(#Arrow1Mend)"
> marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1=
.05833,
> 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"g=
9231"
> transform=3D"translate(128.75 21.111)" fill=3D"none" stroke=3D"#0081cf"
> stroke-width=3D".52917"><path id=3D"path9227" d=3D"m-53.494 58.06h10.715l=
3.1067
> 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path9229"
> d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round"
> style=3D"paint-order:normal"/></g><path id=3D"path9233" d=3D"m74.123
> 14.397c8.7692 0 8.1536 8.1536 8.1536 8.1536v55.724" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><g id=3D"text9935" stroke-width=3D".26458px=
"
> aria-label=3D"$image_path"><path id=3D"path118" d=3D"m2.3853
> 105.12v1.4952q0.37896-0.0103 0.59256-0.21015 0.2136-0.19981 0.2136-0.5443=
2
> 0-0.3204-0.19293-0.4961-0.19293-0.17914-0.61323-0.2446zm-0.34451-0.65457v=
-1.4228q-0.35829
> 0.0138-0.56155 0.2067-0.19982 0.19293-0.19982 0.51677 0 0.29628 0.18604
> 0.46853 0.18948 0.17226 0.57533 0.23082zm0.34451
> 3.6897h-0.34451l-0.00345-1.037q-0.3514-0.0172-0.69935-0.0965-0.34451-0.07=
92-0.68213-0.22049v-0.62012q0.34451
> 0.2136 0.69246 0.32729 0.3514 0.11368 0.69246
> 0.12057v-1.5778q-0.68902-0.1068-1.037-0.4203-0.34795-0.31351-0.34795-0.83=
027
> 0-0.54088 0.36174-0.86127 0.36518-0.32384
> 1.0232-0.37208v-0.80959h0.34451l0.00345 0.80959q0.27216 0.0172 0.55122
> 0.0689t0.56844
> 0.14125v0.596q-0.29283-0.14814-0.57189-0.22738-0.27561-0.0827-0.55122-0.0=
965v1.4848q0.70969
> 0.10679 1.0818 0.44097 0.37207 0.33417 0.37207 0.86472 0 0.53054-0.40308
> 0.88539-0.39963 0.35484-1.0473 0.38585z"/><path id=3D"path120" d=3D"m5.13=
11
> 103.26h1.6226v3.3659h1.2575v0.49265h-3.1488v-0.49265h1.2575v-2.8732h-0.98=
874zm0.98874-1.5021h0.6339v0.8027h-0.6339z"/><path
> id=3D"path122" d=3D"m10.826 103.66q0.11713-0.24805 0.29628-0.36518
> 0.18259-0.12058 0.43753-0.12058 0.46509 0 0.65457 0.36174 0.19292 0.35829
> 0.19292
> 1.3539v2.2359h-0.57878v-2.2083q0-0.81649-0.09302-1.0129-0.08957-0.19981-0=
.33073-0.19981-0.27561
> 0-0.37896 0.21359-0.09991 0.21015-0.09991
> 0.99908v2.2083h-0.57878v-2.2083q0-0.82682-0.09991-1.0198-0.09646-0.19292-=
0.3514-0.19292-0.25149
> 0-0.3514 0.21359-0.096463 0.21015-0.096463
> 0.99908v2.2083h-0.57532v-3.8585h0.57533v0.33073q0.11369-0.20671
> 0.2825-0.31351 0.17225-0.11024 0.3893-0.11024 0.26183 0 0.43408 0.12058
> 0.1757 0.12058 0.27216 0.36518z"/><path id=3D"path124" d=3D"m15.163
> 105.18h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19292-0.27905 0.5787=
8
> 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222 0.19292 0.52366 0
> 0.82338-0.36173 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33418-0.3514-0.89228 0-0.64424 0.43064-0.97841
> 0.43408-0.33418
> 1.2712-0.33418h0.85094v-0.0999q-0.0034-0.46165-0.23427-0.66835-0.23082-0.=
21015-0.73725-0.21015-0.32384
> 0-0.65457 0.093t-0.64423 0.27217v-0.6339q0.3514-0.13436 0.67179-0.19982
> 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125
> 0.55122 0.42375 0.13091 0.17225 0.18604 0.42719 0.05512 0.25149 0.05512
> 0.75792z"/><path id=3D"path126" d=3D"m19.948
> 105.16q0-0.71314-0.23427-1.0818-0.23082-0.37207-0.67524-0.37207-0.46509
> 0-0.70969 0.37207-0.2446 0.36862-0.2446 1.0818 0 0.71313 0.2446 1.0886
> 0.24805 0.37207 0.71658 0.37207 0.43753 0 0.66835-0.37552 0.23427-0.37551
> 0.23427-1.0852zm0.6339 1.7122q0 0.86817-0.40997 1.316-0.40997
> 0.44786-1.2058 0.44786-0.26183
> 0-0.54777-0.0482t-0.57189-0.14125v-0.62701q0.33762 0.15848 0.61323 0.2342=
7
> 0.27561 0.0758 0.50643 0.0758 0.51332 0 0.74759-0.27905 0.23427-0.27905
> 0.23427-0.88539v-0.45824q-0.15158 0.32384-0.41341 0.48231-0.26183
> 0.15848-0.63734 0.15848-0.67524
> 0-1.0783-0.54088-0.40308-0.54088-0.40308-1.4469 0-0.90951 0.40308-1.4504
> 0.40308-0.54088 1.0783-0.54088 0.37207 0 0.63045 0.14814 0.25838 0.14814
> 0.4203 0.4582v-0.49954h0.6339z"/><path id=3D"path128" d=3D"m25.071
> 105.03v0.31006h-2.7457v0.0207q0 0.63045 0.32728 0.97496 0.33073 0.34451
> 0.93018 0.34451 0.30317 0 0.6339-0.0965 0.33073-0.0965
> 0.70624-0.29283v0.63045q-0.36174 0.14814-0.69936 0.22048-0.33417
> 0.0758-0.64768 0.0758-0.89917
> 0-1.4056-0.53744-0.50643-0.54088-0.50643-1.4883 0-0.92329 0.49609-1.4745
> 0.49609-0.55122 1.3229-0.55122 0.73725 0 1.161 0.49954 0.42719 0.49954
> 0.42719
> 1.3643zm-0.6339-0.18604q-0.01378-0.5581-0.26527-0.84749-0.24805-0.29283-0=
.71658-0.29283-0.4582
> 0-0.75448 0.30317-0.29628 0.30316-0.3514 0.8406z"/><path id=3D"path130"
> d=3D"m29.736 108.51v0.27561h-4.2478v-0.27561z"/><path id=3D"path132" d=3D=
"m31.028
> 106.64v1.9534h-0.63734v-5.3261h0.63734v0.49265q0.15847-0.28595
> 0.4203-0.43408 0.26527-0.15159 0.60978-0.15159 0.69936 0 1.0955 0.54088
> 0.39963 0.54088 0.39963 1.4986 0 0.94051-0.39963 1.478-0.39963
> 0.53399-1.0955 0.53399-0.3514
> 0-0.61667-0.14814-0.26183-0.15159-0.41341-0.43753zm1.8604-1.44q0-0.73725-=
0.23427-1.1128-0.23082-0.37551-0.68902-0.37551-0.46164
> 0-0.69935 0.37896-0.23771 0.37551-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.68902-0.37551 0.23427-0.37552
> 0.23427-1.1128z"/><path id=3D"path134" d=3D"m36.402 105.18h-0.21015q-0.55=
466
> 0-0.83716 0.19637-0.27905 0.19292-0.27905 0.57878 0 0.34795 0.21015 0.540=
88
> 0.21015 0.19292 0.58222 0.19292 0.52366 0 0.82338-0.36173 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33418-0.3514-0.89228 0-0.64424 0.43064-0.97841
> 0.43408-0.33418
> 1.2712-0.33418h0.85094v-0.0999q-0.0034-0.46165-0.23427-0.66835-0.23082-0.=
21015-0.73725-0.21015-0.32384
> 0-0.65457 0.093t-0.64423 0.27217v-0.6339q0.3514-0.13436 0.67179-0.19982
> 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125
> 0.55122 0.42375 0.13091 0.17225 0.18604 0.42719 0.05512 0.25149 0.05512
> 0.75792z"/><path id=3D"path136" d=3D"m40.347
> 102.17v1.0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0.596 0.161=
92
> 0.16881 0.565 0.16881h0.71314v0.50643h-0.77515q-0.71314
> 0-1.006-0.28594-0.29283-0.28595-0.29283-0.9853v-2.0946h-1.0301v-0.49265h1=
.0301v-1.0955z"/><path
> id=3D"path138" d=3D"m46.1
> 104.73v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-0.76481t-0.57189-0.2446q=
-0.44442
> 0-0.68557 0.31695-0.23771 0.3135-0.23771
> 0.90261v2.1808h-0.6339v-5.3606h0.6339v2.0808q0.16881-0.33073 0.4582-0.499=
54
> 0.28939-0.17226 0.68557-0.17226 0.58911 0 0.8785 0.3893 0.29283 0.38585
> 0.29283 1.1713z"/></g><g id=3D"text14411" fill=3D"#0081cf"
> stroke-width=3D".26458px" aria-label=3D"mount-point"><path id=3D"path141"
> d=3D"m61.294 103.66q0.11713-0.24805 0.29628-0.36518 0.18259-0.12058
> 0.43753-0.12058 0.46509 0 0.65457 0.36174 0.19292 0.35829 0.19292
> 1.3539v2.2359h-0.57878v-2.2083q0-0.81649-0.09302-1.0129-0.08957-0.19981-0=
.33073-0.19981-0.27561
> 0-0.37896 0.21359-0.09991 0.21015-0.09991
> 0.99908v2.2083h-0.57878v-2.2083q0-0.82682-0.09991-1.0198-0.09646-0.19292-=
0.3514-0.19292-0.25149
> 0-0.3514 0.21359-0.09646 0.21015-0.09646
> 0.99908v2.2083h-0.57533v-3.8585h0.57533v0.33073q0.11369-0.20671
> 0.2825-0.31351 0.17226-0.11024 0.3893-0.11024 0.26183 0 0.43408 0.12058
> 0.1757 0.12058 0.27216 0.36518z"/><path id=3D"path143" d=3D"m65.335
> 103.71q-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338
> 0.24805 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551
> 0.24805-0.37897 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51677-1.2299 0.51677-0.80271
> 0-1.2265-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853
> 0.42375-1.5055t1.2265-0.52021z"/><path id=3D"path145" d=3D"m68.133
> 105.66v-2.3909h0.6339v2.3909q0 0.52021 0.18259 0.76481 0.18604 0.2446
> 0.57189 0.2446 0.44786 0 0.68557-0.3135 0.23771-0.31695
> 0.23771-0.90606v-2.1808h0.63734v3.8516h-0.63734v-0.57878q-0.16881
> 0.33418-0.46164 0.50643-0.28939 0.17226-0.67868 0.17226-0.59256
> 0-0.88194-0.38585-0.28939-0.3893-0.28939-1.1748z"/><path id=3D"path147"
> d=3D"m75.33
> 104.73v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-0.76481-0.18259-0.2446-0=
.57189-0.2446-0.44442
> 0-0.68557 0.31695-0.23771 0.3135-0.23771
> 0.90261v2.1808h-0.6339v-3.8585h0.6339v0.57878q0.16881-0.33073
> 0.4582-0.49954 0.28939-0.17226 0.68558-0.17226 0.58911 0 0.8785 0.3893
> 0.29283 0.38585 0.29283 1.1713z"/><path id=3D"path149" d=3D"m78.072
> 102.17v1.0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0.596 0.161=
92
> 0.16881 0.565 0.16881h0.71314v0.50643h-0.77515q-0.71314
> 0-1.006-0.28594-0.29283-0.28595-0.29283-0.9853v-2.0946h-1.0301v-0.49265h1=
.0301v-1.0955z"/><path
> id=3D"path151" d=3D"m81.431 104.91h1.7949v0.565h-1.7949z"/><path id=3D"pa=
th153"
> d=3D"m85.744 106.64v1.9534h-0.63734v-5.3261h0.63734v0.49265q0.15847-0.285=
95
> 0.4203-0.43408 0.26527-0.15159 0.60978-0.15159 0.69936 0 1.0955 0.54088
> 0.39963 0.54088 0.39963 1.4986 0 0.94051-0.39963 1.478-0.39963
> 0.53399-1.0955 0.53399-0.3514
> 0-0.61667-0.14814-0.26183-0.15159-0.41341-0.43753zm1.8604-1.44q0-0.73725-=
0.23427-1.1128-0.23082-0.37551-0.68902-0.37551-0.46164
> 0-0.69936 0.37896-0.23771 0.37551-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69936 0.37896 0.4582 0 0.68902-0.37551 0.23427-0.37552
> 0.23427-1.1128z"/><path id=3D"path155" d=3D"m90.822 103.71q-0.48231 0-0.7=
3036
> 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24805
> 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551 0.24805-0.37897
> 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51677-1.2299 0.51677-0.80271
> 0-1.2265-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853
> 0.42375-1.5055t1.2265-0.52021z"/><path id=3D"path157" d=3D"m93.83
> 103.26h1.6226v3.3659h1.2575v0.49265h-3.1488v-0.49265h1.2575v-2.8732h-0.98=
874zm0.98874-1.5021h0.6339v0.8027h-0.6339z"/><path
> id=3D"path159" d=3D"m100.82
> 104.73v2.3909h-0.63735v-2.3909q0-0.52021-0.18259-0.76481-0.18259-0.2446-0=
.57189-0.2446-0.44442
> 0-0.68558 0.31695-0.23771 0.3135-0.23771
> 0.90261v2.1808h-0.6339v-3.8585h0.6339v0.57878q0.16881-0.33073
> 0.4582-0.49954 0.28939-0.17226 0.68557-0.17226 0.58911 0 0.8785 0.3893
> 0.29284 0.38585 0.29284 1.1713z"/><path id=3D"path161" d=3D"m103.56
> 102.17v1.0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0.596t0.565
> 0.16881h0.71314v0.50643h-0.77515q-0.71314
> 0-1.006-0.28594-0.29283-0.28595-0.29283-0.9853v-2.0946h-1.0301v-0.49265h1=
.0301v-1.0955z"/></g></svg>
> diff --git a/screenshots/2021-08-18-block-graph-e.svg
> b/screenshots/2021-08-18-block-graph-e.svg
> new file mode 100644
> index 0000000..4bcc615
> --- /dev/null
> +++ b/screenshots/2021-08-18-block-graph-e.svg
> @@ -0,0 +1,2 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg id=3D"svg5" width=3D"195.9mm" height=3D"108.74mm" version=3D"1.1" v=
iewBox=3D"0
> 0 195.9 108.74" xmlns=3D"http://www.w3.org/2000/svg"><defs
> id=3D"defs2"><marker id=3D"Arrow2Mstart" overflow=3D"visible" orient=3D"a=
uto"><path
> id=3D"path24651" transform=3D"scale(.6)" d=3D"m8.7186 4.0337-10.926-4.017=
7
> 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z"
> fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round"
> stroke-width=3D".625"/></marker><marker id=3D"Arrow1Mend" overflow=3D"vis=
ible"
> orient=3D"auto"><path id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7=
186
> 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7
> 8.0354z" fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D=
"round"
> stroke-width=3D".625"/></marker></defs><rect id=3D"rect23797" x=3D"114.19=
"
> y=3D".26458" width=3D"58.32" height=3D"70.624" rx=3D"5.2917" ry=3D"5.2917=
"
> fill=3D"none" stop-color=3D"#000000" stroke=3D"#802400"
> stroke-dasharray=3D"2.11666, 2.11666" stroke-linecap=3D"round"
> stroke-width=3D".52917"/><rect id=3D"rect991" x=3D"120.42" y=3D"20.157"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text3313"
> stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=3D"path89" d=3D"m=
127.04
> 25.178q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50299 0
> 0.79237-0.39619 0.28939-0.39963
> 0.28939-1.099t-0.28939-1.0955q-0.28938-0.39963-0.79237-0.39963-0.50298
> 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19981
> 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69935
> 0-1.1403-0.55811-0.43752-0.55811-0.43752-1.4676t0.43752-1.4676q0.44098-0.=
5581
> 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30662 0.16536 0.50643
> 0.50988v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path91" d=3D"m133.9=
1
> 23.393v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54432-0=
.07579-0.61668
> 0-0.95774 0.39274-0.34107 0.3893-0.34107 1.0955t0.34107 1.099q0.34106
> 0.3893 0.95774 0.3893 0.2756 0 0.54432-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55121 0.18604-0.2825
> 0.06201-0.6029 0.06201-0.87161 0-1.3849-0.54777t-0.51332-1.4779q0-0.94396
> 0.51677-1.4848 0.52021-0.54088 1.4228-0.54088 0.29284 0 0.57189 0.06201
> 0.27905 0.05857 0.54088 0.17914z"/><path id=3D"path93" d=3D"m136.51
> 23.69q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29284
> 1.0921q0.29628 0.39619 0.80959 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82683
> 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198
> 0.53744-1.2988 0.53744-0.83026
> 0-1.3022-0.53744-0.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path95" d=3D"m138.97
> 23.245h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74758l-0.83027-3.1626-0.83372
> 3.1626h-0.74758z"/><path id=3D"path97" d=3D"m145.79
> 26.518h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68558-0.69246 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28595-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963
> 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713
> 0.2825-0.43063 0.66835-0.0861 0.09991-0.54778 0.57878-0.46164
> 0.47542-1.3022 1.3333z"/></g><rect id=3D"rect9379" x=3D"120.42" y=3D"48.8=
68"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text9383"
> stroke-width=3D".26458px" aria-label=3D"file"><path id=3D"path117" d=3D"m=
135.82
> 52.17v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0=
.49265h0.60634v-0.26872q0-0.63045
> 0.29628-0.93018 0.29972-0.30317
> 0.91639-0.30317h0.63735v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13092
> 0.1378-0.13092
> 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path
> id=3D"path119" d=3D"m137.15 50.668h0.6339v5.3606h-0.6339z"/><path id=3D"p=
ath121"
> d=3D"m142.41 53.941v0.31006h-2.9146q0.0413 0.65457 0.39275 0.99908 0.3548=
4
> 0.34106 0.98529 0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34107 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72691 0.07579-0.92329
> 0-1.4642-0.53744-0.53743-0.53744-0.53743-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.7786 0 1.2299 0.50298 0.45476 0.49954
> 0.45476 1.3608zm-0.6339-0.18604q-7e-3
> -0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53055 0-0.85094
> 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g22369"
> transform=3D"translate(183.89 21.111)" fill=3D"none" stroke=3D"#aaa"
> stroke-width=3D".52917"><path id=3D"rect18531" d=3D"m-53.494 58.06h10.715=
l3.1067
> 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path21920"
> d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round"
> style=3D"paint-order:normal"/></g><g id=3D"g25195" transform=3D"translate=
(224.36
> 35.205)"><rect id=3D"rect22371" x=3D"-66.56" y=3D"-29.781" width=3D"29.28=
"
> height=3D"17.692" fill=3D"#fff" fill-rule=3D"evenodd" stop-color=3D"#0000=
00"
> stroke=3D"#808080" stroke-width=3D".52917"/><g id=3D"text22477" fill=3D"#=
808080"
> stroke-width=3D".26458px" aria-label=3D"FUSE server"><path id=3D"path68"
> d=3D"m-60.499-27.145h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2=
.4564h-0.69591z"/><path
> id=3D"path70" d=3D"m-56.519-27.145h0.69936v3.1247q0 0.82682 0.29972 1.192
> 0.29972 0.36174 0.97152 0.36174 0.66835 0 0.96807-0.36174 0.29972-0.36518
> 0.29972-1.192v-3.1247h0.69936v3.2108q0 1.006-0.49954 1.5193-0.49609
> 0.51332-1.4676 0.51332-0.97496
> 0-1.4745-0.51332-0.49609-0.51332-0.49609-1.5193z"/><path id=3D"path72"
> d=3D"m-48.193-26.976v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093=
02-0.67868-0.09302-0.56844
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17226 0.77859 0.27905l0.4203 0.08613q0.77859 0.14814 1.1472
> 0.52366 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.08268-0.40997-0.08268-0.85094-0.2446v-0.71658q0.42375 0.23771
> 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.3204l-0.42375-0.08268q=
-0.77859-0.15503-1.1265-0.48576-0.34796-0.33073-0.34796-0.91984
> 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725
> 0.06546 0.37552 0.06546 0.76826 0.19637z"/><path id=3D"path74"
> d=3D"m-46.797-27.145h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495=
v1.8638h2.6183v0.58567h-3.3142z"/><path
> id=3D"path76"
> d=3D"m-60.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.06=
89-0.59945-0.0689-0.47198
> 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96
> 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774
> 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.85094-0.42375
> 0.3135-1.1679 0.3135-0.31006
> 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259
> 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158
> 0.24116-0.15503 0.24116-0.43408
> 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q=
-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624
> 0-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146
> 0.05168t0.57189 0.15503z"/><path id=3D"path78"
> d=3D"m-55.638-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35=
484
> 0.34106 0.9853 0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path80"
> d=3D"m-52.361-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path82"
> d=3D"m-52.151-18.805h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469
> 3.8585h-0.86128z"/><path id=3D"path84"
> d=3D"m-44.22-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path86"
> d=3D"m-40.944-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034
> 0.07924 0.0069 0.1757 0.02412z"/></g></g><path id=3D"path24007" d=3D"m137=
.3
> 67.339v10.837" fill=3D"none" marker-end=3D"url(#Arrow1Mend)"
> marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1=
.05833,
> 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path
> id=3D"path25180" d=3D"m137.3 38.694v9.2246" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><rect id=3D"rect35415" x=3D"122.49" y=3D"57=
.933"
> width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd"
> stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".529"/><g id=3D"text35918" stroke-width=3D".26458px"
> aria-label=3D"prot-node"><path id=3D"path124" d=3D"m126.04
> 63.274v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116
> 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067
> 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823
> 0.39067-0.29662
> 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.489=
55-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466
> 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733
> 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path
> id=3D"path126" d=3D"m130.31
> 61.393q-0.0748-0.04341-0.16398-0.0627-0.0868-0.0217-0.19293-0.0217-0.3762
> 0-0.57877 0.24598-0.20016 0.24357-0.20016
> 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598
> 0.36414-0.36415 0.22428-0.12058 0.54502-0.12058 0.0458 0 0.10128 0.0072
> 0.0555 0.0048 0.12299 0.01688z"/><path id=3D"path128" d=3D"m131.72
> 61.29q-0.35692 0-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498
> 0.76447q0.20739 0.27733 0.56672 0.27733 0.3545 0 0.56189-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.20739-0.28215-0.56189-0.28215zm0-0.3762q0.57877=
 0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33039 0.3762-0.90916 0.3762-0.58119
> 0-0.91158-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33039-0.3762 0.91158-0.3762z"/><path id=3D"path130" d=3D"m134.13
> 60.212v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.0892 0.42444
> 0.0916 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19533-0.19293-0.19533-0.69936v-1.4662h-0.32557v-0.34485=
h0.32557v-0.76688z"/><path
> id=3D"path132" d=3D"m135.4 62.129h1.2998v0.3955h-1.2998z"/><path id=3D"pa=
th134"
> d=3D"m139.66
> 62.049v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291-0.20739 0.2291-0.20739
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46544 0 0.70418 0.28939
> 0.23875 0.28698 0.23875 0.84646z"/><path id=3D"path136" d=3D"m141.59
> 61.29q-0.35691 0-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.20739-0.27974 0.20739-0.76206
> 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 =
0
> 0.90916 0.3762 0.33039 0.3762 0.33039 1.0418 0 0.66318-0.33039
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path138" d=3D"m145.34
> 61.389v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.512 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466
> 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path140" d=3D"m14=
9.01
> 62.218v0.21704h-2.0402q0.0289 0.4582 0.27492 0.69935 0.24839 0.23874
> 0.68971 0.23874 0.25562 0 0.49437-0.0627 0.24115-0.0627
> 0.47749-0.1881v0.41961q-0.23875 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31832 0.34968 0.31832 0.95257zm-0.44372-0.13022q-5e-3
> -0.36415-0.20499-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.5956=
6
> 0.20981-0.22186 0.20981-0.25562 0.59083z"/></g><rect id=3D"rect38770"
> x=3D"122.49" y=3D"29.267" width=3D"29.634" height=3D"8.4415" fill=3D"#fff=
"
> fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text38774"
> stroke-width=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path100" d=
=3D"m127.91
> 31.456v0.36897h-0.42443q-0.23875 0-0.3328 0.09646-0.0916 0.09646-0.0916
> 0.34727v0.23874h0.73071v0.34485h-0.73071v2.3561h-0.44614v-2.3561h-0.42443=
v-0.34485h0.42443v-0.1881q0-0.45096
> 0.20981-0.65595 0.2098-0.20739 0.66559-0.20739z"/><path id=3D"path102"
> d=3D"m130.39 33.026q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228
> 0.54501-0.14228 0.42203 0 0.65113 0.29662 0.2291 0.29421 0.2291
> 0.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-=
0.41962-0.1881-0.34485
> 0-0.54501 0.2291t-0.20016
> 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0=
.42443-0.1881-0.34004
> 0-0.5402 0.23151-0.20016 0.2291-0.20016
> 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839
> 0.36415-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.49919 0.14952
> 0.2074 0.14952 0.30627 0.43408z"/><path id=3D"path104" d=3D"m133.53
> 31.74v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.0892 0.42444
> 0.0916 0.09405 0.36897 0.09405h0.45578v0.37138h-0.45575q-0.51367
> 0-0.70901-0.19051-0.19533-0.19293-0.19533-0.69936v-1.4662h-0.32556v-0.344=
85h0.32556v-0.76688z"/><path
> id=3D"path106" d=3D"m134.81 33.657h1.2998v0.3955h-1.2998z"/><path id=3D"p=
ath108"
> d=3D"m139.06
> 33.578v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14951-0.19051-=
0.44855-0.19051-0.35932
> 0-0.56672 0.2291-0.20739 0.2291-0.20739
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70417 0.28939
> 0.23875 0.28698 0.23875 0.84646z"/><path id=3D"path110" d=3D"m140.99
> 32.818q-0.35691 0-0.5643 0.27974-0.2074 0.27733-0.2074 0.76206t0.20499
> 0.76447q0.20739 0.27733 0.56671 0.27733 0.3545 0 0.5619-0.27974
> 0.20739-0.27974 0.20739-0.76206
> 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 =
0
> 0.90916 0.3762 0.33039 0.3762 0.33039 1.0418 0 0.66318-0.33039
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58118
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33039-0.3762 0.91157-0.3762z"/><path id=3D"path112" d=3D"m144.74
> 32.917v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273
> 0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576
> 0.3545 0.35691zm-1.512 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733
> 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path114" d=3D"m14=
8.41
> 33.747v0.21704h-2.0402q0.0289 0.4582 0.27492 0.69935 0.24839 0.23874
> 0.68971 0.23874 0.25562 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463
> 0-1.0249-0.3762-0.37621-0.3762-0.37621-1.0177 0-0.66318 0.35691-1.0514
> 0.35933-0.39067 0.96704-0.39067 0.54502 0 0.86093 0.35209 0.31833 0.34968
> 0.31833 0.95257zm-0.44373-0.13022q-5e-3
> -0.36415-0.20498-0.58119-0.19775-0.21704-0.52573-0.21704-0.37138 0-0.5956=
5
> 0.20981-0.22187 0.20981-0.25563 0.59083z"/></g><path id=3D"path8203"
> d=3D"m137.83 19.196c0-8.7692 8.1536-8.1536 8.1536-8.1536h10.854" fill=3D"=
none"
> marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><g id=3D"g9231" transform=3D"translate(186.=
33
> 23.805)" fill=3D"#fff" fill-rule=3D"evenodd" stroke=3D"#0081cf"><path
> id=3D"path9227" d=3D"m-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z"
> stop-color=3D"#000000" stroke-width=3D".52917"/><path id=3D"path9229" d=
=3D"m-42.779
> 58.06v3.41l3.1067 1e-6z" stroke-linecap=3D"round" stroke-linejoin=3D"roun=
d"
> stroke-width=3D".529" style=3D"paint-order:normal"/></g><g id=3D"text9935=
"
> fill=3D"#0081cf" stroke-width=3D".26458px" aria-label=3D"foo.qcow2"><path
> id=3D"path143" d=3D"m121.81 101.76v0.5271h-0.72002q-0.34107 0-0.47543
> 0.14125-0.13091 0.1378-0.13091
> 0.49264v0.34107h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.=
49265h1.0301v-0.26872q0-0.6339
> 0.28939-0.93362 0.29283-0.29972 0.90951-0.29972z"/><path id=3D"path145"
> d=3D"m124.52 103.71q-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.=
1128
> 0 0.7338 0.24805 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0
> 0.7338-0.37551 0.24805-0.37897 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24804-0.37551-0.7338-0.37551zm0-0.53744q0.8027=
1
> 0 1.2264 0.52021 0.4272 0.52021 0.4272 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51677-1.2299 0.51677-0.80271
> 0-1.2265-0.51677-0.42374-0.52021-0.42374-1.509 0-0.9853 0.42374-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path147" d=3D"m128.77
> 103.71q-0.48231 0-0.73036 0.37551-0.24804 0.37552-0.24804 1.1128 0 0.7338
> 0.24804 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551
> 0.24805-0.37897 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42374 0.51677-1.2299 0.51677-0.8027
> 0-1.2264-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853
> 0.42375-1.5055t1.2264-0.52021z"/><path id=3D"path149" d=3D"m132.58
> 106.07h0.86817v1.0508h-0.86817z"/><path id=3D"path151" d=3D"m136.29 105.2=
1q0
> 0.73725 0.23082 1.1128 0.23427 0.37551 0.69246 0.37551 0.4582 0
> 0.69247-0.37551 0.23771-0.37896
> 0.23771-1.1128t-0.23771-1.1093q-0.23427-0.37896-0.69247-0.37896-0.45819
> 0-0.69246 0.37551-0.23082 0.37552-0.23082 1.1128zm1.8535 1.4332q-0.15503
> 0.28594-0.4203 0.44097-0.26183 0.15159-0.60978 0.15159-0.69247
> 0-1.0955-0.53399-0.39964-0.53744-0.39964-1.478 0-0.95774 0.39964-1.4986
> 0.39963-0.54088 1.0955-0.54088 0.34451 0 0.60633 0.15159 0.26528 0.14814
> 0.42375 0.43408v-0.49265h0.63734v5.3261h-0.63734z"/><path id=3D"path153"
> d=3D"m143.05 106.93q-0.25494 0.14814-0.5271 0.22048-0.26872 0.0758-0.5512=
1
> 0.0758-0.89573
> 0-1.4022-0.53744-0.50298-0.53743-0.50298-1.4883t0.50298-1.4883q0.50643-0.=
53744
> 1.4022-0.53744 0.27905 0 0.54432 0.0724t0.53399
> 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.0999-0.57188-0.=
0999-0.59601
> 0-0.9164 0.38585t-0.32039 1.1024q0 0.71313 0.32039 1.1024 0.32384 0.38585
> 0.9164 0.38585 0.33072 0 0.59255-0.0999 0.26183-0.10335
> 0.48576-0.31695z"/><path id=3D"path155" d=3D"m145.76 103.71q-0.48232 0-0.=
73036
> 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24804
> 0.37551 0.73036 0.37551 0.48576 0 0.7338-0.37551 0.24805-0.37897
> 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24804-0.37551-0.7338-0.37551zm0-0.53744q0.8027=
 0
> 1.2264 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42374
> 1.509-0.42375 0.51677-1.2299 0.51677-0.80271
> 0-1.2265-0.51677-0.42374-0.52021-0.42374-1.509 0-0.9853 0.42374-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path157" d=3D"m147.89
> 103.26h0.62701l0.67179 3.1178 0.55122-1.9913h0.54088l0.55811 1.9913
> 0.67179-3.1178h0.62701l-0.90262 3.8585h-0.60634l-0.61667-2.1153-0.61323
> 2.1153h-0.60633z"/><path id=3D"path159" d=3D"m153.42
> 106.54h2.3633v0.58567h-3.1247v-0.58567q0.64424-0.67868
> 1.1266-1.1989t0.6649-0.73381q0.34451-0.4203 0.46509-0.67868 0.12058-0.261=
83
> 0.12058-0.53399
> 0-0.43064-0.25494-0.67524-0.25149-0.2446-0.69246-0.2446-0.31351 0-0.65802
> 0.11368-0.34451 0.11369-0.73036 0.34451v-0.7028q0.35485-0.16881
> 0.69591-0.25493 0.34451-0.0861 0.67869-0.0861 0.75447 0 1.2127 0.40308
> 0.46165 0.39963 0.46165 1.0508 0 0.33073-0.15503 0.66146-0.15159
> 0.33073-0.4961 0.73036-0.19292 0.22393-0.56155 0.62012-0.36518
> 0.39618-1.1162 1.1851z"/></g><rect id=3D"rect876" x=3D".26458" y=3D"13.71=
4"
> width=3D"46.311" height=3D"57.175" rx=3D"5.2917" ry=3D"5.2917" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#802400" stroke-dasharray=3D"2.11666, 2.=
11666"
> stroke-linecap=3D"round" stroke-width=3D".52917"/><rect id=3D"rect878" x=
=3D"6.5361"
> y=3D"20.157" width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.894=
8"
> fill=3D"none" stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".529=
17"/><g
> id=3D"text882" stroke-width=3D".26458px" aria-label=3D"qcow2"><path id=3D=
"path265"
> d=3D"m13.155 25.178q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.396=
19
> 0.50298 0 0.79237-0.39619 0.28939-0.39963
> 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963-0.50298
> 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982
> 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936
> 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0.=
5581
> 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643
> 0.50988v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path267" d=3D"m20.0=
32
> 23.393v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825
> 0.06201-0.60289 0.06201-0.87161
> 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848
> 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857
> 0.54088 0.17914z"/><path id=3D"path269" d=3D"m22.629 23.69q-0.50988 0-0.8=
0615
> 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619
> 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path271" d=3D"m25.082
> 23.245h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371
> 3.1626h-0.74759z"/><path id=3D"path273" d=3D"m31.91
> 26.518h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68557-0.69246 0.86127-0.89228 0.33418-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963
> 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713
> 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164
> 0.47542-1.3022 1.3333z"/></g><rect id=3D"rect884" x=3D"6.5361" y=3D"48.86=
8"
> width=3D"33.768" height=3D"13.398" rx=3D"1.7964" ry=3D"1.8948" fill=3D"no=
ne"
> stop-color=3D"#000000" stroke=3D"#000" stroke-width=3D".52917"/><g id=3D"=
text888"
> stroke-width=3D".26458px" aria-label=3D"file"><path id=3D"path276" d=3D"m=
21.937
> 52.17v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0=
.49265h0.60634v-0.26872q0-0.63045
> 0.29628-0.93018 0.29972-0.30317
> 0.9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091
> 0.1378-0.13091
> 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z"/><path
> id=3D"path278" d=3D"m23.263 50.668h0.6339v5.3606h-0.6339z"/><path id=3D"p=
ath280"
> d=3D"m28.524 53.941v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69935 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/></g><g id=3D"g894"
> transform=3D"translate(70.003 21.111)" fill=3D"none" stroke=3D"#000"
> stroke-width=3D".52917"><path id=3D"path890" d=3D"m-53.494 58.06h10.715l3=
.1067
> 3.4104v16.022h-13.822z" stop-color=3D"#000000"/><path id=3D"path892"
> d=3D"m-42.779 58.06v3.41l3.1067 1e-6" stroke-linecap=3D"round"
> style=3D"paint-order:normal"/></g><path id=3D"path906" d=3D"m23.415
> 67.339v10.837" fill=3D"none" marker-end=3D"url(#Arrow1Mend)"
> marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1=
.05833,
> 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path
> id=3D"path908" d=3D"m23.415 38.694v9.2246" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" marker-start=3D"url(#Arrow2Mstart)"
> stroke=3D"#000" stroke-dasharray=3D"1.05833, 1.05833" stroke-width=3D".52=
917"
> style=3D"paint-order:normal"/><rect id=3D"rect910" x=3D"8.603" y=3D"57.93=
3"
> width=3D"29.634" height=3D"8.4415" fill=3D"#fff" fill-rule=3D"evenodd"
> stop-color=3D"#000000" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".529"/><g id=3D"text914" stroke-width=3D".26458px"
> aria-label=3D"prot-node"><path id=3D"path283" d=3D"m12.16
> 63.274v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116
> 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067
> 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823
> 0.39067-0.29662
> 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.489=
55-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466
> 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733
> 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.76929z"/><path
> id=3D"path285" d=3D"m16.431
> 61.393q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.37=
62
> 0-0.57878 0.24598-0.20016 0.24357-0.20016
> 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598
> 0.36415-0.36415 0.22428-0.12058 0.54501-0.12058 0.04582 0 0.10129 0.0072
> 0.05547 0.0048 0.12299 0.01688z"/><path id=3D"path287" d=3D"m17.835
> 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path289" d=3D"m20.249
> 60.212v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path291" d=3D"m21.522 62.129h1.2998v0.3955h-1.2998z"/><path id=3D"p=
ath293"
> d=3D"m25.774
> 62.049v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051=
q-0.35932
> 0-0.56672 0.2291t-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path295" d=3D"m27.705
> 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.20739-0.27974 0.20739-0.76206
> 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 =
0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path297" d=3D"m31.458
> 61.389v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0=
.39067
> 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545
> 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.5546=
6
> 0.27733 0.35209 0 0.55466-0.27733 0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974-0.35209
> 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path299"
> d=3D"m35.126 62.218v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.2483=
9
> 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><rect id=3D"rect=
916"
> x=3D"8.603" y=3D"29.267" width=3D"29.634" height=3D"8.4415" fill=3D"#fff"
> fill-rule=3D"evenodd" stop-color=3D"#000000" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".529"/><g id=3D"text920"
> stroke-width=3D".26458px" aria-label=3D"fmt-node"><path id=3D"path248" d=
=3D"m14.031
> 31.456v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 0.09646-0.09164
> 0.34727v0.23874h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-=
0.34485h0.42444v-0.1881q0-0.45096
> 0.20981-0.65595 0.20981-0.20739 0.66559-0.20739z"/><path id=3D"path250"
> d=3D"m16.505 33.026q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228
> 0.54501-0.14228 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291
> 0.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-=
0.41961-0.1881-0.34485
> 0-0.54501 0.2291t-0.20016
> 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0=
.42444-0.1881-0.34003
> 0-0.54019 0.23151-0.20016 0.2291-0.20016
> 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839
> 0.36415-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.49919 0.14952
> 0.2074 0.14952 0.30627 0.43408z"/><path id=3D"path252" d=3D"m19.652
> 31.74v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444
> 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366
> 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34485=
h0.32556v-0.76688z"/><path
> id=3D"path254" d=3D"m20.925 33.657h1.2998v0.3955h-1.2998z"/><path id=3D"p=
ath256"
> d=3D"m25.177
> 33.578v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14952-0.19051-=
0.44855-0.19051-0.35932
> 0-0.56672 0.2291-0.2074 0.2291-0.2074
> 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357
> 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939
> 0.23874 0.28698 0.23874 0.84646z"/><path id=3D"path258" d=3D"m27.108
> 32.818q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498
> 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974
> 0.2074-0.27974 0.2074-0.76206
> 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0
> 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038
> 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119
> 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418
> 0.33038-0.3762 0.91157-0.3762z"/><path id=3D"path260" d=3D"m30.861
> 32.917v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545
> 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955
> 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273
> 0.30868-0.39067 0.79823-0.39067 0.29904 0 0.51125 0.11817 0.21463 0.11576
> 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733
> 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974
> 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.5546=
6
> 0.27974q-0.20016 0.27733-0.20016 0.76688z"/><path id=3D"path262" d=3D"m34=
.529
> 33.747v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.23874
> 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627
> 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508
> 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.017=
7
> 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.8609=
3
> 0.35209 0.31833 0.34968 0.31833
> 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704=
-0.52572-0.21704-0.37138
> 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z"/></g><g id=3D"text934=
"
> stroke-width=3D".26458px" aria-label=3D"foo.qcow2"><path id=3D"path162"
> d=3D"m7.9308 101.76v0.5271h-0.72003q-0.34106 0-0.47542 0.14125-0.13091
> 0.1378-0.13091
> 0.49264v0.34107h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.=
49265h1.0301v-0.26872q0-0.6339
> 0.28939-0.93362 0.29283-0.29972 0.90951-0.29972z"/><path id=3D"path164"
> d=3D"m10.639 103.71q-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.=
1128
> 0 0.7338 0.24805 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0
> 0.7338-0.37551 0.24805-0.37897 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.7338-0.37551zm0-0.53744q0.8027=
1
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51677-1.2299 0.51677-0.80271
> 0-1.2265-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853
> 0.42375-1.5055t1.2265-0.52021z"/><path id=3D"path166" d=3D"m14.886
> 103.71q-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338
> 0.24805 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551
> 0.24805-0.37897 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51677-1.2299 0.51677-0.80271
> 0-1.2265-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853
> 0.42375-1.5055t1.2265-0.52021z"/><path id=3D"path168" d=3D"m18.697
> 106.07h0.86816v1.0508h-0.86816z"/><path id=3D"path170" d=3D"m22.404 105.2=
1q0
> 0.73725 0.23082 1.1128 0.23427 0.37551 0.69246
> 0.37551t0.69246-0.37551q0.23771-0.37896
> 0.23771-1.1128t-0.23771-1.1093q-0.23427-0.37896-0.69246-0.37896t-0.69246
> 0.37551q-0.23082 0.37552-0.23082 1.1128zm1.8535 1.4332q-0.15503
> 0.28594-0.4203 0.44097-0.26183 0.15159-0.60978 0.15159-0.69246
> 0-1.0955-0.53399-0.39963-0.53744-0.39963-1.478 0-0.95774 0.39963-1.4986
> 0.39963-0.54088 1.0955-0.54088 0.34451 0 0.60634 0.15159 0.26527 0.14814
> 0.42375 0.43408v-0.49265h0.63734v5.3261h-0.63734z"/><path id=3D"path172"
> d=3D"m29.163 106.93q-0.25494 0.14814-0.5271 0.22048-0.26872 0.0758-0.5512=
2
> 0.0758-0.89573
> 0-1.4022-0.53744-0.50298-0.53743-0.50298-1.4883t0.50298-1.4883q0.50643-0.=
53744
> 1.4022-0.53744 0.27905 0 0.54432 0.0724 0.26527 0.0724 0.53399
> 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.0999-0.57189-0.=
0999-0.596
> 0-0.9164 0.38585t-0.32039 1.1024q0 0.71313 0.32039 1.1024 0.32384 0.38585
> 0.9164 0.38585 0.33073 0 0.59256-0.0999 0.26183-0.10335
> 0.48576-0.31695z"/><path id=3D"path174" d=3D"m31.878 103.71q-0.48231 0-0.=
73036
> 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24805
> 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551 0.24805-0.37897
> 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51677-1.2299 0.51677-0.80271
> 0-1.2265-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853
> 0.42375-1.5055t1.2265-0.52021z"/><path id=3D"path176" d=3D"m34.003
> 103.26h0.62701l0.67179 3.1178 0.55122-1.9913h0.54088l0.55811 1.9913
> 0.67179-3.1178h0.62701l-0.90262 3.8585h-0.60634l-0.61667-2.1153-0.61323
> 2.1153h-0.60634z"/><path id=3D"path178" d=3D"m39.536
> 106.54h2.3633v0.58567h-3.1247v-0.58567q0.64423-0.67868 1.1265-1.1989
> 0.48231-0.52021 0.6649-0.73381 0.34451-0.4203 0.46509-0.67868
> 0.12058-0.26183 0.12058-0.53399
> 0-0.43064-0.25494-0.67524-0.25149-0.2446-0.69246-0.2446-0.3135 0-0.65801
> 0.11368-0.34451 0.11369-0.73036 0.34451v-0.7028q0.35484-0.16881
> 0.69591-0.25493 0.34451-0.0861 0.67868-0.0861 0.75448 0 1.2127 0.40308
> 0.46164 0.39963 0.46164 1.0508 0 0.33073-0.15503 0.66146-0.15158
> 0.33073-0.49609 0.73036-0.19293 0.22393-0.56155 0.62012-0.36518
> 0.39618-1.1162 1.1851z"/></g><path id=3D"path3010" d=3D"m188.01 14.34c8.4=
834 0
> 7.5897 6.5118 7.5897 6.5118v64.293c0 7.1845-7.0725 6.5115-7.0725
> 6.5115h-40.896" fill=3D"none" marker-end=3D"url(#Arrow1Mend)"
> marker-start=3D"url(#Arrow2Mstart)" stroke=3D"#000" stroke-dasharray=3D"1=
.05833,
> 1.05833" stroke-width=3D".52917" style=3D"paint-order:normal"/><path
> id=3D"path5636" d=3D"m52.435 42.311h54.899" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D"1.0583" style=3D"paint-order:normal"/><g id=3D"text10276"
> stroke-width=3D".26458px" aria-label=3D"Exporting foo.qcow2  via FUSE on
> itself"><path id=3D"path181" d=3D"m64.283
> 22.613h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495v1.8638h2.6183=
v0.58567h-3.3142z"/><path
> id=3D"path183" d=3D"m71.92 23.898-1.3953 1.8776 1.4676
> 1.9809h-0.74759l-1.1231-1.5158-1.1231
> 1.5158h-0.74759l1.4986-2.0188-1.3711-1.8397h0.74759l1.0232 1.3746
> 1.0232-1.3746z"/><path id=3D"path185" d=3D"m73.502
> 27.178v2.0464h-0.63734v-5.3261h0.63734v0.58567q0.19982-0.34451
> 0.50298-0.50987 0.30661-0.16881 0.73036-0.16881 0.7028 0 1.1403 0.55811
> 0.44097 0.55811 0.44097 1.4676 0 0.9095-0.44097 1.4676-0.43753
> 0.55811-1.1403 0.55811-0.42375
> 0-0.73036-0.16536-0.30317-0.16881-0.50298-0.51332zm2.1566-1.347q0-0.69936=
-0.28939-1.0955-0.28594-0.39963-0.78893-0.39963t-0.79237
> 0.39963q-0.28594 0.39619-0.28594 1.0955 0 0.69935 0.28594 1.099 0.28939
> 0.39619 0.79237 0.39619t0.78893-0.39619q0.28939-0.39963
> 0.28939-1.099z"/><path id=3D"path187" d=3D"m78.862 24.343q-0.50988 0-0.80=
615
> 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628
> 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963
> 0.29628-1.0886
> 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path189" d=3D"m83.92
> 24.491q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.=
53744
> 0-0.82682 0.3514-0.28594 0.34796-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01033
> 0.07924 0.0069 0.1757 0.02412z"/><path id=3D"path191" d=3D"m85.212
> 22.803v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634
> 0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.7338
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path193" d=3D"m87.351
> 23.898h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z"/><path
> id=3D"path195" d=3D"m92.519
> 25.428v2.3289h-0.6339v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728t-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34796
> 0.53399-0.52021 0.31006-0.17226 0.71314-0.17226 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path197" d=3D"m96.322
> 25.783q0-0.68902-0.28594-1.068-0.2825-0.37896-0.79582-0.37896-0.50987
> 0-0.79582 0.37896-0.2825 0.37896-0.2825 1.068 0 0.68558 0.2825 1.0645
> 0.28594 0.37896 0.79582 0.37896 0.51332 0 0.79582-0.37896 0.28594-0.37896
> 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642-0.43753
> 0.48231-1.3401 0.48231-0.33418
> 0-0.63045-0.05168-0.29628-0.04823-0.57533-0.15158v-0.61667q0.27905 0.1515=
8
> 0.55122 0.22393 0.27216 0.07235 0.55466 0.07235 0.62356 0 0.93362-0.32728
> 0.31006-0.32384 0.31006-0.98185v-0.3135q-0.19637 0.34106-0.50298
> 0.50987-0.30661 0.16881-0.73381 0.16881-0.70969
> 0-1.1438-0.54088-0.43408-0.54088-0.43408-1.4332 0-0.89572 0.43408-1.4366
> 0.43408-0.54088 1.1438-0.54088 0.42719 0 0.73381 0.16881 0.30661 0.16881
> 0.50298 0.50987v-0.58567h0.6339z"/><path id=3D"path199" d=3D"m65.127
> 30.863v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091
> 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.63734v-3.3659h-0.60634v-=
0.49265h0.60634v-0.26872q0-0.64423
> 0.29972-0.93707 0.29972-0.29628 0.95085-0.29628z"/><path id=3D"path201"
> d=3D"m67.152 32.809q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628
> 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0
> 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path203" d=3D"m71.469
> 32.809q-0.50988 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283
> 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963
> 0.29628-0.39963 0.29628-1.0887
> 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path205" d=3D"m74.256
> 35.349h0.72692v0.87506h-0.72692z"/><path id=3D"path207" d=3D"m76.788 34.2=
98q0
> 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0
> 0.79237-0.39619 0.28939-0.39963
> 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.79237-0.39963-0.50298
> 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 1.347q-0.19982
> 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69936
> 0-1.1403-0.5581-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0.5=
5811
> 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643
> 0.50988v-0.58567h0.6339v5.3261h-0.6339z"/><path id=3D"path209" d=3D"m83.6=
65
> 32.513v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0=
.07579-0.61667
> 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106
> 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579
> 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825
> 0.06201-0.60289 0.06201-0.87161
> 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848
> 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857
> 0.54088 0.17914z"/><path id=3D"path211" d=3D"m86.262 32.809q-0.50988 0-0.=
80615
> 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619
> 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path213" d=3D"m88.715
> 32.365h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011
> 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371
> 3.1626h-0.74759z"/><path id=3D"path215" d=3D"m95.543
> 35.638h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099
> 0.68557-0.69246 0.86127-0.89228 0.33418-0.37552 0.46509-0.6339
> 0.13436-0.26183 0.13436-0.51332
> 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.692=
46
> 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881
> 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963
> 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713
> 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164
> 0.47542-1.3022 1.3333z"/><path id=3D"path217" d=3D"m65.373
> 49.298h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469
> 3.8585h-0.86128z"/><path id=3D"path219" d=3D"m70.003
> 49.298h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z"/><path
> id=3D"path221" d=3D"m73.717 51.217q-0.76826 0-1.0645 0.1757-0.29628
> 0.1757-0.29628 0.59945 0 0.33762 0.22049 0.53744 0.22393 0.19637 0.60634
> 0.19637 0.5271 0 0.84405-0.37207 0.32039-0.37552
> 0.32039-0.99563v-0.14125zm1.2644-0.26183v2.2014h-0.6339v-0.58567q-0.21704
> 0.3514-0.54088 0.52021-0.32384 0.16536-0.79237 0.16536-0.59256
> 0-0.94396-0.33073-0.34796-0.33418-0.34796-0.89228 0-0.65112 0.43408-0.981=
85
> 0.43753-0.33073
> 1.3022-0.33073h0.88884v-0.06201q0-0.43753-0.28939-0.67524-0.28594-0.24116=
-0.80615-0.24116-0.33073
> 0-0.64423 0.07924-0.3135 0.07924-0.60289 0.23771v-0.58567q0.34796-0.13436
> 0.67524-0.19982 0.32728-0.0689 0.63734-0.0689 0.83716 0 1.2506 0.43408
> 0.41341 0.43408 0.41341 1.316z"/><path id=3D"path223" d=3D"m78.557
> 48.013h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.69591=
z"/><path
> id=3D"path225" d=3D"m82.536 48.013h0.69936v3.1247q0 0.82682 0.29972 1.192
> 0.29972 0.36174 0.97152 0.36174 0.66835 0 0.96807-0.36174 0.29972-0.36518
> 0.29972-1.192v-3.1247h0.69936v3.2108q0 1.006-0.49954 1.5193-0.49609
> 0.51332-1.4676 0.51332-0.97496
> 0-1.4745-0.51332-0.49609-0.51332-0.49609-1.5193z"/><path id=3D"path227"
> d=3D"m90.863
> 48.182v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.09302-0.67868-0.0=
9302-0.56844
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17226 0.77859 0.27905l0.4203 0.08613q0.77859 0.14814 1.1472
> 0.52366 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.08268-0.40997-0.08268-0.85094-0.2446v-0.71658q0.42375 0.23771
> 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.3204l-0.42375-0.08268q=
-0.77859-0.15503-1.1265-0.48576-0.34796-0.33073-0.34796-0.91984
> 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725
> 0.06546t0.76826 0.19637z"/><path id=3D"path229" d=3D"m92.258
> 48.013h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495v1.8638h2.6183=
v0.58567h-3.3142z"/><path
> id=3D"path231" d=3D"m68.644 58.21q-0.50987 0-0.80615 0.39963-0.29628
> 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096
> 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path233" d=3D"m74.673
> 59.295v2.3289h-0.6339v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728-0.29628 0.32728-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34796
> 0.53399-0.52021 0.31006-0.17226 0.71314-0.17226 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path235" d=3D"m78.18
> 57.765h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z"/><path
> id=3D"path237" d=3D"m80.767 56.67v1.0955h1.3057v0.49265h-1.3057v2.0946q0
> 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271
> 0.13436h0.65112v0.53054h-0.65112q-0.73381
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path239" d=3D"m85.367
> 57.879v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.0=
689-0.47198
> 0-0.70969 0.1447-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.3479=
6
> 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774
> 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.85094-0.42375
> 0.3135-1.1679 0.3135-0.31006
> 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.17915v-0.65457q0.3514 0.18259
> 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158
> 0.24116-0.15503 0.24116-0.43408
> 0-0.25838-0.1757-0.39619-0.17225-0.1378-0.76137-0.26527l-0.22049-0.05168q=
-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624
> 0-0.54433 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146
> 0.05168t0.57189 0.15503z"/><path id=3D"path241" d=3D"m89.883
> 59.536v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106
> 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.07579-0.72692 0.07579-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.=
75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path243"
> d=3D"m90.924 56.263h0.6339v5.3606h-0.6339z"/><path id=3D"path245" d=3D"m9=
4.837
> 56.263v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091
> 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.63734v-3.3659h-0.60634v-=
0.49265h0.60634v-0.26872q0-0.64423
> 0.29972-0.93707 0.29972-0.29628 0.95085-0.29628z"/></g></svg>
> diff --git a/screenshots/2021-08-18-root-directory.svg
> b/screenshots/2021-08-18-root-directory.svg
> new file mode 100644
> index 0000000..f9449f1
> --- /dev/null
> +++ b/screenshots/2021-08-18-root-directory.svg
> @@ -0,0 +1,2 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg id=3D"svg5" width=3D"149.08mm" height=3D"64.908mm" version=3D"1.1"
> viewBox=3D"0 0 149.08 64.908" xmlns=3D"http://www.w3.org/2000/svg"><defs
> id=3D"defs2"><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=3D"aut=
o"><path
> id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.0337-10.926-4.01=
77
> 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z"
> fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round"
> stroke-width=3D".625"/></marker><marker id=3D"ArrowRedMend" overflow=3D"v=
isible"
> orient=3D"auto"><path id=3D"path53977" transform=3D"scale(.6) rotate(180)
> translate(0)" d=3D"m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.7455
> 2.3721-1.7354 5.6175-6e-7 8.0354z" fill=3D"#0081cf" fill-rule=3D"evenodd"
> stroke-linejoin=3D"round" stroke-width=3D".625"/></marker></defs><g
> id=3D"text10527" stroke-width=3D".26458px" aria-label=3D"/  foo/    a    =
b  bar/
>   c    d"><path id=3D"path79" d=3D"m5.3131 16.476h0.65457l-2.7078
> 5.7981h-0.65801z"/><path id=3D"path81" d=3D"m14.408
> 23.435v0.5271h-0.72003q-0.34106 0-0.47542 0.14125-0.13091 0.1378-0.13091
> 0.49265v0.34106h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.=
49265h1.0301v-0.26872q0-0.6339
> 0.28939-0.93362 0.29283-0.29972 0.90951-0.29972z"/><path id=3D"path83"
> d=3D"m17.116 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.=
1128
> 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0
> 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51676-1.2299 0.51676-0.80271
> 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path85" d=3D"m21.364
> 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.7338=
1
> 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0 0.73381-0.37552
> 0.24805-0.37896 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51676-1.2299 0.51676-0.80271
> 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path87" d=3D"m26.552
> 23.652h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path89" d=3D"m21.66
> 34.032h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.5787=
8
> 0 0.34796 0.21015 0.54088 0.21015 0.19293 0.58222 0.19293 0.52365 0
> 0.82338-0.36174 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50987-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33417
> 1.2712-0.33417h0.85094v-0.09991q-0.0034-0.46164-0.23427-0.66835-0.23082-0=
.21015-0.73725-0.21015-0.32384
> 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436
> 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125
> 0.34106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512
> 0.25149 0.05512 0.75792z"/><path id=3D"path91" d=3D"m22.404
> 41.222q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46164
> 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69936 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552
> 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408
> 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963 0.53399
> 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099
> 0.54088-0.34451
> 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path
> id=3D"path93" d=3D"m13.909
> 48.398q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46164
> 0-0.69935 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552
> 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408
> 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963 0.53399
> 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099
> 0.54088-0.34451
> 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path
> id=3D"path95" d=3D"m17.412 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.2=
7905
> 0.19293-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222
> 0.19292 0.52366 0 0.82338-0.36174 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33418
> 1.2712-0.33418h0.85094v-0.09991q-0.0034-0.46164-0.23427-0.66835-0.23082-0=
.21015-0.73725-0.21015-0.32384
> 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436
> 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125
> 0.34106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512
> 0.25149 0.05512 0.75792z"/><path id=3D"path97" d=3D"m23.221
> 47.261q-0.20326-0.15848-0.41341-0.23082-0.21015-0.07235-0.46164-0.07235-0=
.59256
> 0-0.90606 0.37207-0.3135 0.37207-0.3135
> 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.75448q0.15847-0.40997
> 0.48576-0.62701 0.33073-0.22049 0.78204-0.22049 0.23427 0 0.43753
> 0.05857t0.3893 0.18259z"/><path id=3D"path99" d=3D"m26.552
> 45.18h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path101" d=3D"m22.89=
7
> 57.303q-0.25494 0.14814-0.5271 0.22049-0.26872 0.07579-0.55122
> 0.07579-0.89572
> 0-1.4022-0.53744-0.50298-0.53744-0.50298-1.4883t0.50298-1.4883q0.50643-0.=
53744
> 1.4022-0.53744 0.27905 0 0.54433 0.07235 0.26527 0.07235 0.53399
> 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-0=
.09991-0.596
> 0-0.9164 0.38585t-0.32039 1.1024q0 0.71314 0.32039 1.1024 0.32384 0.38585
> 0.9164 0.38585 0.33073 0 0.59256-0.09991 0.26183-0.10335
> 0.48576-0.31695z"/><path id=3D"path103" d=3D"m22.198
> 61.31v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15848 0.28594-0.42375
> 0.43753-0.26183 0.14814-0.60634 0.14814-0.69936
> 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1.4745
> 0.40308-0.53744 1.099-0.53744 0.34796 0 0.61323 0.15158 0.26527 0.14814
> 0.41686 0.43408zm-1.8638 1.4401q0 0.73725 0.23427 1.1128 0.23427 0.37552
> 0.69246 0.37552t0.69591-0.37896q0.24116-0.37896 0.24116-1.1093
> 0-0.73381-0.24116-1.1093-0.23771-0.37896-0.69591-0.37896t-0.69246
> 0.37552q-0.23427 0.37552-0.23427 1.1128z"/></g><path id=3D"path25696"
> d=3D"m4.5344 23.535v22.663" fill=3D"none" stroke=3D"#000" stroke-linecap=
=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path259=
58"
> d=3D"m4.5344 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path27085" d=3D"m4.5344 46.199c=
0 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path274=
90"
> d=3D"m13.266 30.8-0.0056 8.5867" fill=3D"none" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path27629" d=3D"m13.26 32.462c0=
 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path278=
44"
> d=3D"m13.26 39.387c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path28236" d=3D"m13.266 52.334-=
0.0056
> 8.5867" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path282=
38"
> d=3D"m13.26 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path28240" d=3D"m13.26 60.92c0 =
1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"text31368"
> stroke-width=3D".26458px" aria-label=3D"VFS tree:"><path id=3D"path62" d=
=3D"m2.096
> 5.3688-1.9637-5.1435h0.72692l1.6295 4.3305 1.633-4.3305h0.72347l-1.9603
> 5.1435z"/><path id=3D"path64" d=3D"m5.5962
> 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.6959=
1z"/><path
> id=3D"path66" d=3D"m12.614
> 0.39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093018-0.67868-0=
.093018-0.56844
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472
> 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42375 0.237=
71
> 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.08268=
2q-0.77859-0.15503-1.1265-0.48576t-0.34795-0.91984q0-0.68213
> 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.065457
> 0.37552 0.065457 0.76826 0.19637z"/><path id=3D"path68" d=3D"m16.851
> 0.41479v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634
> 0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.7338
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path70" d=3D"m21.227
> 2.1029q-0.1068-0.062012-0.23427-0.089573-0.12402-0.031006-0.27561-0.03100=
6-0.53744
> 0-0.82682 0.3514-0.28594 0.34795-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17225 0.77859-0.17225 0.06546 0 0.14469 0.01033=
5
> 0.07924 0.00689 0.1757 0.024116z"/><path id=3D"path72" d=3D"m25.037
> 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106
> 0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.075792-0.72692 0.075792-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0.31006-0=
.75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path74"
> d=3D"m29.378 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.075792-0.72692 0.075792-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0.31006-0=
.75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path76"
> d=3D"m30.58
> 4.4938h0.72692v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z"/></g=
><g
> id=3D"text36298" fill=3D"#0081cf" stroke-width=3D".26458px" aria-label=3D=
"/  x
> y"><path id=3D"path115" d=3D"m58.664 16.476h0.65457l-2.7078
> 5.7981h-0.65801z"/><path id=3D"path117" d=3D"m67.949 24.937-1.3815 1.8466
> 1.5158 2.0119h-0.73381l-1.13-1.5468-1.1265
> 1.5468h-0.73381l1.5158-2.0119-1.3815-1.8466h0.7028l1.0232 1.3953
> 1.0163-1.3953z"/><path id=3D"path119" d=3D"m67.053 34.731q-0.15848
> 0.40308-0.40308 1.0611-0.34106 0.90951-0.4582 1.1093-0.15847
> 0.26872-0.39619 0.40308t-0.55466 0.13436h-0.50987v-0.53055h0.37552q0.2790=
5
> 0 0.43753-0.16192 0.15847-0.16192
> 0.40308-0.83716l-1.4917-3.7965h0.67179l1.1438 3.0179
> 1.1265-3.0179h0.67179z"/></g><path id=3D"path36300" d=3D"m57.886 23.535v9=
.5655"
> fill=3D"none" stroke=3D"#0081cf" stroke-linecap=3D"round" stroke-width=3D=
".52917"
> style=3D"paint-order:normal"/><path id=3D"path36302" d=3D"m57.886 24.564c=
0 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#ArrowRedMend)" stroke=3D"#0081cf" stroke-linecap=3D"ro=
und"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path363=
04"
> d=3D"m57.886 33.101c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#ArrowRedMend)" stroke=3D"#0081cf"
> stroke-linecap=3D"round" stroke-width=3D".52917" style=3D"paint-order:nor=
mal"/><g
> id=3D"text36320" stroke-width=3D".26458px" aria-label=3D"FS A:"><path
> id=3D"path106" d=3D"m53.733
> 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.6959=
1z"/><path
> id=3D"path108" d=3D"m60.75
> 0.39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093018-0.67868-0=
.093018-0.56844
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472
> 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42375 0.237=
71
> 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.08268=
2q-0.77859-0.15503-1.1265-0.48576-0.34795-0.33073-0.34795-0.91984
> 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725
> 0.065457 0.37552 0.065457 0.76826 0.19637z"/><path id=3D"path110" d=3D"m6=
6.107
> 0.91088-0.94396 2.5597h1.8914zm-0.39274-0.68557h0.78893l1.9603
> 5.1435h-0.72347l-0.46853-1.3195h-2.3186l-0.46853 1.3195h-0.7338z"/><path
> id=3D"path112" d=3D"m69.225
> 4.4938h0.72692v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z"/></g=
><g
> id=3D"text44877" stroke-width=3D".26458px" aria-label=3D"Mounting FS Aon
> /foo:"><path id=3D"path122" d=3D"m98.949 0.34933h1.037l1.3126 3.5002
> 1.3195-3.5002h1.037v5.1435h-0.67869v-4.5165l-1.3264
> 3.5278h-0.69935l-1.3264-3.5278v4.5165h-0.67524z"/><path id=3D"path124"
> d=3D"m106.5 2.0788q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0=
887
> 0 0.69246 0.29284 1.0921 0.29627 0.39619 0.80959 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82683
> 0 1.2988 0.53744 0.47197 0.53744 0.47197 1.4883 0 0.9474-0.47197
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83026
> 0-1.3022-0.53744-0.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path126" d=3D"m109.26
> 3.9701v-2.3358h0.6339v2.3117q0 0.54777 0.2136 0.82338 0.21359 0.27216
> 0.64079 0.27216 0.51332 0 0.80959-0.32728 0.29973-0.32728
> 0.29973-0.89228v-2.1876h0.63389v3.8585h-0.63389v-0.59256q-0.23082
> 0.3514-0.53744 0.52365-0.30317 0.16881-0.70624 0.16881-0.66491
> 0-1.0094-0.41341-0.34451-0.41341-0.34451-1.2092z"/><path id=3D"path128"
> d=3D"m117
> 3.164v2.3289h-0.63389v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728t-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795
> 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path130" d=3D"m118.9
> 0.53881v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634
> 0.13091 0.13436 0.5271 0.13436h0.65112v0.53055h-0.65112q-0.73381
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path132" d=3D"m121.04
> 1.6344h0.63389v3.8585h-0.63389zm0-1.5021h0.63389v0.80271h-0.63389z"/><pat=
h
> id=3D"path134" d=3D"m126.2
> 3.164v2.3289h-0.63389v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728t-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795
> 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path136" d=3D"m130.01
> 3.5188q0-0.68902-0.28594-1.068-0.2825-0.37896-0.79582-0.37896-0.50987
> 0-0.79582 0.37896-0.2825 0.37896-0.2825 1.068 0 0.68557 0.2825 1.0645
> 0.28595 0.37896 0.79582 0.37896 0.51332 0 0.79582-0.37896 0.28594-0.37896
> 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642-0.43753
> 0.48231-1.3401 0.48231-0.33418
> 0-0.63045-0.051677-0.29628-0.048231-0.57534-0.15158v-0.61667q0.27906
> 0.15158 0.55122 0.22393 0.27216 0.072347 0.55466 0.072347 0.62356 0
> 0.93362-0.32728 0.31006-0.32384 0.31006-0.98185v-0.3135q-0.19637
> 0.34106-0.50298 0.50987-0.30662 0.16881-0.73381 0.16881-0.70969
> 0-1.1438-0.54088-0.43408-0.54088-0.43408-1.4332 0-0.89573 0.43408-1.4366
> 0.43408-0.54088 1.1438-0.54088 0.42719 0 0.73381 0.16881 0.30661 0.16881
> 0.50298 0.50987v-0.58567h0.6339z"/><path id=3D"path138" d=3D"m134.22
> 0.34933h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.6959=
1z"/><path
> id=3D"path140" d=3D"m141.23
> 0.51814v0.67868q-0.39618-0.18948-0.74758-0.2825t-0.67869-0.093018q-0.5684=
4
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17225 0.77859 0.27905l0.42031 0.086127q0.77859 0.14814 1.1472
> 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42374 0.237=
71
> 0.83026 0.35829 0.40653 0.12058 0.79927 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42374-0.08268=
2q-0.77859-0.15503-1.1266-0.48576-0.34795-0.33073-0.34795-0.91984
> 0-0.68213 0.47886-1.0749 0.48232-0.39274 1.3264-0.39274 0.36173 0 0.73725
> 0.065457 0.37551 0.065457 0.76825 0.19637z"/><path id=3D"path142" d=3D"m1=
46.59
> 1.0349-0.94395 2.5597h1.8914zm-0.39274-0.68557h0.78893l1.9603
> 5.1435h-0.72347l-0.46854-1.3195h-2.3186l-0.46853 1.3195h-0.73381z"/><path
> id=3D"path144" d=3D"m112.34 9.2549q-0.50987 0-0.80615 0.39963-0.29628
> 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619
> 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82682
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path146" d=3D"m118.37
> 10.34v2.3289h-0.6339v-2.3082q0-0.54777-0.21359-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728t-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795
> 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path148" d=3D"m123
> 7.5255h0.58566l-1.7914 5.7981h-0.58566z"/><path id=3D"path150" d=3D"m126.=
21
> 7.3084v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13092 0.1378-0.13092
> 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.63734v-3.3659h-0.60634v-=
0.49265h0.60634v-0.26872q0-0.64423
> 0.29972-0.93707 0.29973-0.29628 0.95085-0.29628z"/><path id=3D"path152"
> d=3D"m128.23 9.2549q-0.50988 0-0.80616 0.39963-0.29628 0.39619-0.29628
> 1.0887t0.29284 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0
> 0.8027-0.39963 0.29628-0.39963 0.29628-1.0887
> 0-0.68557-0.29628-1.0852-0.29627-0.40308-0.8027-0.40308zm0-0.53744q0.8268=
2
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path154" d=3D"m132.55
> 9.2549q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29284
> 1.0921q0.29627 0.39619 0.80959 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82683
> 0 1.2988 0.53744 0.47197 0.53744 0.47197 1.4883 0 0.9474-0.47197
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83026
> 0-1.3022-0.53744-0.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path156" d=3D"m135.53
> 11.794h0.72691v0.87506h-0.72691zm0-2.7733h0.72691v0.87505h-0.72691z"/></g=
><g
> id=3D"text45567" stroke-width=3D".26458px" aria-label=3D"/          bar/ =
   c
> d"><path id=3D"path172" d=3D"m113.98 16.476h0.65457l-2.7078
> 5.7981h-0.65801z"/><path id=3D"path174" d=3D"m122.57
> 48.398q0-0.73725-0.23427-1.1128-0.23426-0.37552-0.69246-0.37552-0.46165
> 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69936 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552
> 0.23427-1.1128zm-1.8638-1.4401q0.15159-0.2825 0.41686-0.43408
> 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963 0.53399
> 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099
> 0.54088-0.34451
> 0-0.60979-0.14814-0.26182-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path
> id=3D"path176" d=3D"m126.08 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.=
27905
> 0.19293-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222
> 0.19292 0.52366 0 0.82338-0.36174 0.29973-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-3e-3
> -0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.6545=
7
> 0.09302t-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982
> 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34107 0.14125
> 0.55122 0.42375 0.13091 0.17226 0.18603 0.42719 0.0551 0.25149 0.0551
> 0.75792z"/><path id=3D"path178" d=3D"m131.89
> 47.261q-0.20326-0.15848-0.41341-0.23082-0.21015-0.07235-0.46165-0.07235-0=
.59255
> 0-0.90606 0.37207-0.3135 0.37207-0.3135
> 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.75448q0.15847-0.40997
> 0.48576-0.62701 0.33073-0.22049 0.78203-0.22049 0.23427 0 0.43753
> 0.05857t0.3893 0.18259z"/><path id=3D"path180" d=3D"m135.22
> 45.18h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path182" d=3D"m131.5=
6
> 57.303q-0.25494 0.14814-0.5271 0.22049-0.26872 0.07579-0.55122
> 0.07579-0.89572
> 0-1.4022-0.53744-0.50299-0.53744-0.50299-1.4883t0.50299-1.4883q0.50643-0.=
53744
> 1.4022-0.53744 0.27906 0 0.54433 0.07235t0.53399
> 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-0=
.09991-0.596
> 0-0.91639 0.38585-0.3204 0.38585-0.3204 1.1024 0 0.71314 0.3204 1.1024
> 0.32384 0.38585 0.91639 0.38585 0.33073 0 0.59256-0.09991 0.26183-0.10335
> 0.48576-0.31695z"/><path id=3D"path184" d=3D"m130.86
> 61.31v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15847 0.28594-0.42374
> 0.43753-0.26183 0.14814-0.60634 0.14814-0.69935
> 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40307-1.4745
> 0.40308-0.53744 1.099-0.53744 0.34795 0 0.61323 0.15158 0.26527 0.14814
> 0.41685 0.43408zm-1.8638 1.4401q0 0.73725 0.23426 1.1128 0.23427 0.37552
> 0.69247 0.37552t0.69591-0.37896q0.24115-0.37896 0.24115-1.1093
> 0-0.73381-0.24115-1.1093-0.23771-0.37896-0.69591-0.37896t-0.69247
> 0.37552q-0.23426 0.37552-0.23426 1.1128z"/></g><path id=3D"path45569"
> d=3D"m113.2 23.535v22.663" fill=3D"none" stroke=3D"#000" stroke-linecap=
=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path455=
71"
> d=3D"m113.2 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path45573" d=3D"m113.2 46.199c0=
 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path455=
75"
> d=3D"m121.93 30.8-6e-3 8.5867" fill=3D"none" stroke=3D"#0081cf"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path45577" d=3D"m121.93 32.462c=
0 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#ArrowRedMend)" stroke=3D"#0081cf" stroke-linecap=3D"ro=
und"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path455=
79"
> d=3D"m121.93 39.387c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#ArrowRedMend)" stroke=3D"#0081cf"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path45581" d=3D"m121.93 52.334-=
6e-3
> 8.5867" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path455=
83"
> d=3D"m121.93 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path45585" d=3D"m121.93 60.92c0=
 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"text49419"
> fill=3D"#0081cf" stroke-width=3D".26458px" aria-label=3D"  foo/    x    y=
"><path
> id=3D"path159" d=3D"m123.07 23.435v0.5271h-0.72003q-0.34106 0-0.47542
> 0.14125-0.13091 0.1378-0.13091
> 0.49265v0.34106h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.=
49265h1.0301v-0.26872q0-0.6339
> 0.28939-0.93362 0.29283-0.29972 0.9095-0.29972z"/><path id=3D"path161"
> d=3D"m125.78 25.381q-0.48232 0-0.73037 0.37552-0.24804 0.37552-0.24804 1.=
1128
> 0 0.73381 0.24804 1.1128 0.24805 0.37552 0.73037 0.37552 0.48575 0
> 0.7338-0.37552 0.24805-0.37896 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.7338-0.37552zm0-0.53744q0.8027=
 0
> 1.2264 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42374 0.51676-1.2299 0.51676-0.80271
> 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path163" d=3D"m130.03
> 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.7338=
1
> 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0 0.73381-0.37552
> 0.24804-0.37896 0.24804-1.1128
> 0-0.73725-0.24804-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51676-1.2299 0.51676-0.80271
> 0-1.2264-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055
> 0.42374-0.52021 1.2264-0.52021z"/><path id=3D"path165" d=3D"m135.22
> 23.652h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path167" d=3D"m131.=
76
> 32.113-1.3815 1.8466 1.5158 2.0119h-0.73381l-1.13-1.5468-1.1266
> 1.5468h-0.7338l1.5158-2.0119-1.3815-1.8466h0.7028l1.0232 1.3953
> 1.0163-1.3953z"/><path id=3D"path169" d=3D"m130.86 41.907q-0.15847
> 0.40308-0.40307 1.0611-0.34107 0.9095-0.4582 1.1093-0.15847 0.26872-0.396=
19
> 0.40308-0.23771 0.13436-0.55466 0.13436h-0.50987v-0.53054h0.37551q0.27906=
 0
> 0.43753-0.16192 0.15848-0.16192
> 0.40308-0.83716l-1.4917-3.7965h0.67179l1.1438 3.0179
> 1.1265-3.0179h0.6718z"/></g></svg>
> diff --git a/screenshots/2021-08-18-root-file.svg
> b/screenshots/2021-08-18-root-file.svg
> new file mode 100644
> index 0000000..b7b2797
> --- /dev/null
> +++ b/screenshots/2021-08-18-root-file.svg
> @@ -0,0 +1,2 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg id=3D"svg5" width=3D"149.08mm" height=3D"64.908mm" version=3D"1.1"
> viewBox=3D"0 0 149.08 64.908" xmlns=3D"http://www.w3.org/2000/svg"><defs
> id=3D"defs2"><marker id=3D"Arrow1Mend" overflow=3D"visible" orient=3D"aut=
o"><path
> id=3D"path26121" transform=3D"scale(-.6)" d=3D"m8.7186 4.0337-10.926-4.01=
77
> 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z"
> fill=3D"context-stroke" fill-rule=3D"evenodd" stroke-linejoin=3D"round"
> stroke-width=3D".625"/></marker></defs><g id=3D"text10527"
> stroke-width=3D".26458px" aria-label=3D"/  foo/    a    b  bar/    c
> d"><path id=3D"path71" d=3D"m5.3131 16.476h0.65457l-2.7078
> 5.7981h-0.65801z"/><path id=3D"path73" d=3D"m14.408
> 23.435v0.5271h-0.72003q-0.34106 0-0.47542 0.14125-0.13091 0.1378-0.13091
> 0.49265v0.34106h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.=
49265h1.0301v-0.26872q0-0.6339
> 0.28939-0.93362 0.29283-0.29972 0.90951-0.29972z"/><path id=3D"path75"
> d=3D"m17.116 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.=
1128
> 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0
> 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51676-1.2299 0.51676-0.80271
> 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path77" d=3D"m21.364
> 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.7338=
1
> 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0 0.73381-0.37552
> 0.24805-0.37896 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51676-1.2299 0.51676-0.80271
> 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path79" d=3D"m26.552
> 23.652h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path81" d=3D"m21.66
> 34.032h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.5787=
8
> 0 0.34796 0.21015 0.54088 0.21015 0.19293 0.58222 0.19293 0.52365 0
> 0.82338-0.36174 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50987-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33417
> 1.2712-0.33417h0.85094v-0.09991q-0.0034-0.46164-0.23427-0.66835-0.23082-0=
.21015-0.73725-0.21015-0.32384
> 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436
> 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125
> 0.34106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512
> 0.25149 0.05512 0.75792z"/><path id=3D"path83" d=3D"m22.404
> 41.222q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46164
> 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69936 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552
> 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408
> 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963 0.53399
> 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099
> 0.54088-0.34451
> 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path
> id=3D"path85" d=3D"m13.909
> 48.398q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46164
> 0-0.69935 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552
> 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408
> 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963 0.53399
> 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099
> 0.54088-0.34451
> 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path
> id=3D"path87" d=3D"m17.412 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.2=
7905
> 0.19293-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222
> 0.19292 0.52366 0 0.82338-0.36174 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33418
> 1.2712-0.33418h0.85094v-0.09991q-0.0034-0.46164-0.23427-0.66835-0.23082-0=
.21015-0.73725-0.21015-0.32384
> 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436
> 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125
> 0.34106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512
> 0.25149 0.05512 0.75792z"/><path id=3D"path89" d=3D"m23.221
> 47.261q-0.20326-0.15848-0.41341-0.23082-0.21015-0.07235-0.46164-0.07235-0=
.59256
> 0-0.90606 0.37207-0.3135 0.37207-0.3135
> 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.75448q0.15847-0.40997
> 0.48576-0.62701 0.33073-0.22049 0.78204-0.22049 0.23427 0 0.43753
> 0.05857t0.3893 0.18259z"/><path id=3D"path91" d=3D"m26.552
> 45.18h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path93" d=3D"m22.897
> 57.303q-0.25494 0.14814-0.5271 0.22049-0.26872 0.07579-0.55122
> 0.07579-0.89572
> 0-1.4022-0.53744-0.50298-0.53744-0.50298-1.4883t0.50298-1.4883q0.50643-0.=
53744
> 1.4022-0.53744 0.27905 0 0.54433 0.07235 0.26527 0.07235 0.53399
> 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-0=
.09991-0.596
> 0-0.9164 0.38585t-0.32039 1.1024q0 0.71314 0.32039 1.1024 0.32384 0.38585
> 0.9164 0.38585 0.33073 0 0.59256-0.09991 0.26183-0.10335
> 0.48576-0.31695z"/><path id=3D"path95" d=3D"m22.198
> 61.31v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15848 0.28594-0.42375
> 0.43753-0.26183 0.14814-0.60634 0.14814-0.69936
> 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1.4745
> 0.40308-0.53744 1.099-0.53744 0.34796 0 0.61323 0.15158 0.26527 0.14814
> 0.41686 0.43408zm-1.8638 1.4401q0 0.73725 0.23427 1.1128 0.23427 0.37552
> 0.69246 0.37552t0.69591-0.37896q0.24116-0.37896 0.24116-1.1093
> 0-0.73381-0.24116-1.1093-0.23771-0.37896-0.69591-0.37896t-0.69246
> 0.37552q-0.23427 0.37552-0.23427 1.1128z"/></g><path id=3D"path25696"
> d=3D"m4.5344 23.535v22.663" fill=3D"none" stroke=3D"#000" stroke-linecap=
=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path259=
58"
> d=3D"m4.5344 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path27085" d=3D"m4.5344 46.199c=
0 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path274=
90"
> d=3D"m13.266 30.8-0.0056 8.5867" fill=3D"none" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path27629" d=3D"m13.26 32.462c0=
 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path278=
44"
> d=3D"m13.26 39.387c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path28236" d=3D"m13.266 52.334-=
0.0056
> 8.5867" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path282=
38"
> d=3D"m13.26 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path28240" d=3D"m13.26 60.92c0 =
1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"text31368"
> stroke-width=3D".26458px" aria-label=3D"VFS tree:"><path id=3D"path54" d=
=3D"m2.096
> 5.3688-1.9637-5.1435h0.72692l1.6295 4.3305 1.633-4.3305h0.72347l-1.9603
> 5.1435z"/><path id=3D"path56" d=3D"m5.5962
> 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.6959=
1z"/><path
> id=3D"path58" d=3D"m12.614
> 0.39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093018-0.67868-0=
.093018-0.56844
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472
> 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42375 0.237=
71
> 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.08268=
2q-0.77859-0.15503-1.1265-0.48576t-0.34795-0.91984q0-0.68213
> 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.065457
> 0.37552 0.065457 0.76826 0.19637z"/><path id=3D"path60" d=3D"m16.851
> 0.41479v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634
> 0.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.7338
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path62" d=3D"m21.227
> 2.1029q-0.1068-0.062012-0.23427-0.089573-0.12402-0.031006-0.27561-0.03100=
6-0.53744
> 0-0.82682 0.3514-0.28594 0.34795-0.28594
> 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514
> 0.52021-0.52021 0.32039-0.17225 0.77859-0.17225 0.06546 0 0.14469 0.01033=
5
> 0.07924 0.00689 0.1757 0.024116z"/><path id=3D"path64" d=3D"m25.037
> 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106
> 0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.075792-0.72692 0.075792-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0.31006-0=
.75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path66"
> d=3D"m29.378 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.354=
84
> 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573
> 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829
> 0.075792-0.72692 0.075792-0.92329
> 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021
> 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954
> 0.45475
> 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0.31006-0=
.75103-0.31006-0.53054
> 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z"/><path id=3D"path68"
> d=3D"m30.58
> 4.4938h0.72692v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z"/></g=
><g
> id=3D"text36298" fill=3D"#0081cf" stroke-width=3D".26458px"
> aria-label=3D"(unnamed)"><path id=3D"path107" d=3D"m51.063 16.265q-0.4582
> 0.78548-0.68557 1.5675-0.22393 0.77859-0.22393 1.571 0 0.78893 0.22393
> 1.571 0.22738 0.78204 0.68557
> 1.5744h-0.55122q-0.52021-0.81993-0.77515-1.5951-0.25494-0.77859-0.25494-1=
.5503
> 0-0.76826 0.25494-1.5468 0.25494-0.77859 0.77515-1.5916z"/><path
> id=3D"path109" d=3D"m52.934 20.158v-2.3909h0.6339v2.3909q0 0.52021 0.1825=
9
> 0.76481 0.18604 0.2446 0.57189 0.2446 0.44786 0 0.68557-0.3135
> 0.23771-0.31695
> 0.23771-0.90606v-2.1807h0.63734v3.8516h-0.63734v-0.57878q-0.16881
> 0.33417-0.46164 0.50643-0.28939 0.17226-0.67868 0.17226-0.59256
> 0-0.88194-0.38585-0.28939-0.3893-0.28939-1.1748z"/><path id=3D"path111"
> d=3D"m60.13
> 19.228v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-0.76481-0.18259-0.2446-0=
.57189-0.2446-0.44442
> 0-0.68557 0.31695-0.23771 0.3135-0.23771
> 0.90262v2.1807h-0.6339v-3.8585h0.6339v0.57878q0.16881-0.33073
> 0.4582-0.49954 0.28939-0.17226 0.68557-0.17226 0.58911 0 0.8785 0.3893
> 0.29283 0.38585 0.29283 1.1713z"/><path id=3D"path113" d=3D"m64.378
> 19.228v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-0.76481-0.18259-0.2446-0=
.57189-0.2446-0.44442
> 0-0.68558 0.31695-0.23771 0.3135-0.23771
> 0.90262v2.1807h-0.6339v-3.8585h0.6339v0.57878q0.16881-0.33073
> 0.4582-0.49954 0.28939-0.17226 0.68558-0.17226 0.58911 0 0.8785 0.3893
> 0.29283 0.38585 0.29283 1.1713z"/><path id=3D"path115" d=3D"m67.424
> 19.68h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19292-0.27905 0.57878=
 0
> 0.34796 0.21015 0.54088 0.21015 0.19293 0.58222 0.19293 0.52366 0
> 0.82338-0.36174 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50987-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33417
> 1.2712-0.33417h0.85094v-0.09991q-0.0034-0.46164-0.23427-0.66835-0.23082-0=
.21015-0.73725-0.21015-0.32384
> 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436
> 0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125
> 0.34106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512
> 0.25149 0.05512 0.75792z"/><path id=3D"path117" d=3D"m71.582
> 18.153q0.11713-0.24805 0.29628-0.36518 0.18259-0.12058 0.43753-0.12058
> 0.46509 0 0.65457 0.36174 0.19292 0.35829 0.19292
> 1.3539v2.2359h-0.57878v-2.2083q0-0.81649-0.09302-1.0129-0.08957-0.19982-0=
.33073-0.19982-0.27561
> 0-0.37896 0.2136-0.09991 0.21015-0.09991
> 0.99908v2.2083h-0.57878v-2.2083q0-0.82682-0.09991-1.0197-0.09646-0.19292-=
0.3514-0.19292-0.25149
> 0-0.3514 0.2136-0.09646 0.21015-0.09646
> 0.99908v2.2083h-0.57533v-3.8585h0.57533v0.33073q0.11369-0.20671
> 0.2825-0.3135 0.17225-0.11024 0.3893-0.11024 0.26183 0 0.43408 0.12058
> 0.1757 0.12058 0.27216 0.36518z"/><path id=3D"path119" d=3D"m77.332
> 19.531v0.31006h-2.7457v0.02067q0 0.63045 0.32728 0.97496 0.33073 0.34451
> 0.93018 0.34451 0.30317 0 0.6339-0.09646 0.33073-0.09646
> 0.70624-0.29283v0.63045q-0.36174 0.14814-0.69936 0.22049-0.33418
> 0.07579-0.64768 0.07579-0.89917
> 0-1.4056-0.53744-0.50643-0.54088-0.50643-1.4883 0-0.92329 0.49609-1.4745
> 0.49609-0.55122 1.3229-0.55122 0.73725 0 1.161 0.49954 0.42719 0.49954
> 0.42719
> 1.3643zm-0.6339-0.18604q-0.01378-0.55811-0.26527-0.84749-0.24805-0.29283-=
0.71658-0.29283-0.4582
> 0-0.75448 0.30317-0.29628 0.30317-0.3514 0.8406z"/><path id=3D"path121"
> d=3D"m80.705 18.253v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15848
> 0.28594-0.42375 0.43753-0.26183 0.14814-0.60634 0.14814-0.69935
> 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1.4745
> 0.40308-0.53744 1.099-0.53744 0.34796 0 0.61323 0.15158 0.26527 0.14814
> 0.41686 0.43408zm-1.8638 1.44q0 0.73725 0.23427 1.1128 0.23427 0.37552
> 0.69246 0.37552t0.69591-0.37896q0.24116-0.37896 0.24116-1.1093
> 0-0.7338-0.24116-1.1093-0.23771-0.37896-0.69591-0.37896t-0.69246
> 0.37552q-0.23427 0.37552-0.23427 1.1128z"/><path id=3D"path123" d=3D"m83.=
195
> 16.265h0.55122q0.52021 0.81304 0.77515 1.5916t0.25494 1.5468q0
> 0.77515-0.25494 1.5537t-0.77515 1.5916h-0.55122q0.4582-0.79926
> 0.68213-1.5813 0.22738-0.78204 0.22738-1.5641
> 0-0.78548-0.22738-1.5675-0.22393-0.78204-0.68213-1.571z"/></g><g
> id=3D"text36320" stroke-width=3D".26458px" aria-label=3D"FS B:"><path id=
=3D"path98"
> d=3D"m58.036
> 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.6959=
1z"/><path
> id=3D"path100" d=3D"m65.053
> 0.39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093018-0.67868-0=
.093018-0.56844
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472
> 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42375 0.237=
71
> 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.08268=
2q-0.77859-0.15503-1.1265-0.48576-0.34795-0.33073-0.34795-0.91984
> 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725
> 0.065457 0.37552 0.065457 0.76826 0.19637z"/><path id=3D"path102" d=3D"m6=
9.387
> 2.9125v1.8845h1.1162q0.56155 0 0.83027-0.23082 0.27216-0.23427
> 0.27216-0.71314
> 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1153v1.550=
3h1.0301q0.50987
> 0 0.75792-0.18948 0.25149-0.19293 0.25149-0.58567
> 0-0.3893-0.25149-0.58222-0.24805-0.19293-0.75792-0.19293zm-0.69591-0.5718=
9h1.7777q0.79582
> 0 1.2265 0.33073t0.43064 0.94051q0 0.47198-0.22049 0.75103t-0.64768
> 0.34795q0.51332 0.11024 0.79582 0.46164 0.28594 0.34795 0.28594 0.87161 0
> 0.68902-0.46853 1.0645-0.46853 0.37552-1.3333 0.37552h-1.8466z"/><path
> id=3D"path104" d=3D"m73.666
> 4.4938h0.72692v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z"/></g=
><g
> id=3D"text44877" stroke-width=3D".26458px" aria-label=3D"Mounting FS Bon
> /foo/a:"><path id=3D"path126" d=3D"m98.942 0.34933h1.037l1.3126 3.5002
> 1.3195-3.5002h1.037v5.1435h-0.67869v-4.5165l-1.3264
> 3.5278h-0.69935l-1.3264-3.5278v4.5165h-0.67524z"/><path id=3D"path128"
> d=3D"m106.5 2.0788q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0=
887
> 0 0.69246 0.29284 1.0921 0.29627 0.39619 0.80959 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82683
> 0 1.2988 0.53744 0.47197 0.53744 0.47197 1.4883 0 0.9474-0.47197
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83026
> 0-1.3022-0.53744-0.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path130" d=3D"m109.25
> 3.9701v-2.3358h0.6339v2.3117q0 0.54777 0.2136 0.82338 0.21359 0.27216
> 0.64079 0.27216 0.51331 0 0.80959-0.32728 0.29973-0.32728
> 0.29973-0.89228v-2.1876h0.63389v3.8585h-0.63389v-0.59256q-0.23082
> 0.3514-0.53744 0.52365-0.30317 0.16881-0.70624 0.16881-0.66491
> 0-1.0094-0.41341-0.34451-0.41341-0.34451-1.2092z"/><path id=3D"path132"
> d=3D"m117
> 3.164v2.3289h-0.6339v-2.3082q0-0.54777-0.21359-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728t-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795
> 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path134" d=3D"m118.89
> 0.53881v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634
> 0.13091 0.13436 0.5271 0.13436h0.65112v0.53055h-0.65112q-0.73381
> 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z"/><path
> id=3D"path136" d=3D"m121.03
> 1.6344h0.63389v3.8585h-0.63389zm0-1.5021h0.63389v0.80271h-0.63389z"/><pat=
h
> id=3D"path138" d=3D"m126.2
> 3.164v2.3289h-0.6339v-2.3082q0-0.54777-0.21359-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728t-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795
> 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path140" d=3D"m130
> 3.5188q0-0.68902-0.28594-1.068-0.2825-0.37896-0.79582-0.37896-0.50987
> 0-0.79582 0.37896-0.2825 0.37896-0.2825 1.068 0 0.68557 0.2825 1.0645
> 0.28595 0.37896 0.79582 0.37896 0.51332 0 0.79582-0.37896 0.28594-0.37896
> 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642-0.43753
> 0.48231-1.3401 0.48231-0.33418
> 0-0.63045-0.051677-0.29628-0.048231-0.57534-0.15158v-0.61667q0.27906
> 0.15158 0.55122 0.22393 0.27216 0.072347 0.55466 0.072347 0.62356 0
> 0.93362-0.32728 0.31006-0.32384 0.31006-0.98185v-0.3135q-0.19637
> 0.34106-0.50298 0.50987-0.30662 0.16881-0.73381 0.16881-0.70969
> 0-1.1438-0.54088-0.43408-0.54088-0.43408-1.4332 0-0.89573 0.43408-1.4366
> 0.43408-0.54088 1.1438-0.54088 0.42719 0 0.73381 0.16881 0.30661 0.16881
> 0.50298 0.50987v-0.58567h0.6339z"/><path id=3D"path142" d=3D"m134.21
> 0.34933h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.6959=
1z"/><path
> id=3D"path144" d=3D"m141.23
> 0.51814v0.67868q-0.39618-0.18948-0.74758-0.2825t-0.67869-0.093018q-0.5684=
4
> 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.5167=
6
> 0.20671 0.17225 0.77859 0.27905l0.42031 0.086127q0.77859 0.14814 1.1472
> 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954
> 0.38585-1.4676 0.38585-0.36518
> 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42374 0.237=
71
> 0.83026 0.35829 0.40653 0.12058 0.79927 0.12058 0.596 0 0.91984-0.23427
> 0.32384-0.23427 0.32384-0.66835
> 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42374-0.08268=
2q-0.77859-0.15503-1.1266-0.48576-0.34795-0.33073-0.34795-0.91984
> 0-0.68213 0.47886-1.0749 0.48232-0.39274 1.3264-0.39274 0.36173 0 0.73725
> 0.065457 0.37551 0.065457 0.76825 0.19637z"/><path id=3D"path146" d=3D"m1=
45.56
> 3.0365v1.8845h1.1162q0.56155 0 0.83027-0.23082 0.27216-0.23427
> 0.27216-0.71314
> 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1153v1.550=
3h1.0301q0.50988
> 0 0.75792-0.18948 0.2515-0.19293 0.2515-0.58567
> 0-0.3893-0.2515-0.58222-0.24804-0.19293-0.75792-0.19293zm-0.69591-0.57189=
h1.7777q0.79582
> 0 1.2264 0.33073 0.43064 0.33073 0.43064 0.94051 0 0.47198-0.22049
> 0.75103-0.22048 0.27905-0.64767 0.34795 0.51332 0.11024 0.79581 0.46164
> 0.28595 0.34795 0.28595 0.87161 0 0.68902-0.46854 1.0645-0.46853
> 0.37552-1.3332 0.37552h-1.8466z"/><path id=3D"path148" d=3D"m108.99
> 9.2549q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283
> 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0
> 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0=
.80271-0.40308zm0-0.53744q0.82683
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47197 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883
> 0.47197-0.53744 1.3022-0.53744z"/><path id=3D"path150" d=3D"m115.02
> 10.34v2.3289h-0.63389v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.6=
4079-0.27216-0.51332
> 0-0.8096 0.32728t-0.29628
> 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795
> 0.534-0.52021 0.31005-0.17225 0.71313-0.17225 0.6649 0 1.006 0.41341
> 0.34106 0.40997 0.34106 1.2092z"/><path id=3D"path152" d=3D"m119.65
> 7.5255h0.58567l-1.7914 5.7981h-0.58567z"/><path id=3D"path154" d=3D"m122.=
86
> 7.3084v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091
> 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.63735v-3.3659h-0.60633v-=
0.49265h0.60633v-0.26872q0-0.64423
> 0.29973-0.93707 0.29972-0.29628 0.95084-0.29628z"/><path id=3D"path156"
> d=3D"m124.88 9.2549q-0.50988 0-0.80615 0.39963-0.29628 0.39619-0.29628
> 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0
> 0.80271-0.39963 0.29627-0.39963 0.29627-1.0887
> 0-0.68557-0.29627-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path158" d=3D"m129.2
> 9.2549q-0.50988 0-0.80616 0.39963-0.29627 0.39619-0.29627 1.0887t0.29283
> 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.8027-0.39963
> 0.29628-0.39963 0.29628-1.0887
> 0-0.68557-0.29628-1.0852-0.29627-0.40308-0.8027-0.40308zm0-0.53744q0.8268=
2
> 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198
> 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027
> 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883
> 0.47198-0.53744 1.3022-0.53744z"/><path id=3D"path160" d=3D"m133.15
> 7.5255h0.58567l-1.7915 5.7981h-0.58566z"/><path id=3D"path162" d=3D"m136.=
15
> 10.729q-0.76825 0-1.0645 0.1757t-0.29628 0.59945q0 0.33762 0.22049 0.5374=
4
> 0.22393 0.19637 0.60633 0.19637 0.5271 0 0.84405-0.37207 0.3204-0.37552
> 0.3204-0.99563v-0.14125zm1.2644-0.26183v2.2014h-0.63389v-0.58567q-0.21704
> 0.3514-0.54088 0.52021-0.32384 0.16536-0.79238 0.16536-0.59255
> 0-0.94395-0.33073-0.34796-0.33417-0.34796-0.89228 0-0.65112 0.43408-0.981=
85
> 0.43753-0.33073
> 1.3022-0.33073h0.88884v-0.06201q0-0.43753-0.28939-0.67524-0.28594-0.24116=
-0.80615-0.24116-0.33073
> 0-0.64424 0.079237-0.3135 0.079237-0.60289 0.23771v-0.58567q0.34796-0.134=
36
> 0.67524-0.19982 0.32728-0.068902 0.63734-0.068902 0.83716 0 1.2506
> 0.43408t0.41341 1.316z"/><path id=3D"path164" d=3D"m138.88
> 11.794h0.72691v0.87506h-0.72691zm0-2.7733h0.72691v0.87505h-0.72691z"/></g=
><g
> id=3D"text18565" stroke-width=3D".26458px" aria-label=3D"/  foo/    b  ba=
r/    c
>   d"><path id=3D"path167" d=3D"m114.16 16.476h0.65457l-2.7078
> 5.7981h-0.65801z"/><path id=3D"path169" d=3D"m123.25
> 23.435v0.5271h-0.72003q-0.34106 0-0.47542 0.14125-0.13092 0.1378-0.13092
> 0.49265v0.34106h1.3264v0.49265h-1.3264v3.3659h-0.63389v-3.3659h-1.0301v-0=
.49265h1.0301v-0.26872q0-0.6339
> 0.28938-0.93362 0.29284-0.29972 0.90951-0.29972z"/><path id=3D"path171"
> d=3D"m125.96 25.381q-0.48231 0-0.73036 0.37552-0.24804 0.37552-0.24804 1.=
1128
> 0 0.73381 0.24804 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0
> 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.802=
71
> 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375
> 1.509-0.42374 0.51676-1.2299 0.51676-0.8027
> 0-1.2264-0.51676-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055
> 0.42375-0.52021 1.2264-0.52021z"/><path id=3D"path173" d=3D"m130.21
> 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.7338=
1
> 0.24805 1.1128 0.24805 0.37552 0.73036 0.37552 0.48576 0 0.7338-0.37552
> 0.24805-0.37896 0.24805-1.1128
> 0-0.73725-0.24805-1.1128-0.24804-0.37552-0.7338-0.37552zm0-0.53744q0.8027=
1
> 0 1.2264 0.52021 0.4272 0.52021 0.4272 1.5055 0 0.98874-0.42375
> 1.509-0.42375 0.51676-1.2299 0.51676-0.80271
> 0-1.2265-0.51676-0.42374-0.52021-0.42374-1.509 0-0.9853 0.42374-1.5055
> 0.42375-0.52021 1.2265-0.52021z"/><path id=3D"path175" d=3D"m135.4
> 23.652h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path177" d=3D"m131.=
25
> 41.222q0-0.73725-0.23427-1.1128-0.23426-0.37552-0.69246-0.37552-0.46165
> 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69936 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552
> 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408
> 0.26872-0.15158 0.62012-0.15158 0.6959 0 1.0955 0.53744 0.39963 0.53399
> 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099
> 0.54088-0.3445
> 0-0.60978-0.14814-0.26182-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path
> id=3D"path179" d=3D"m122.75
> 48.398q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46165
> 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093
> 0.23771 0.37896 0.69936 0.37896 0.45819 0 0.69246-0.37552 0.23427-0.37552
> 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408
> 0.26871-0.15158 0.62011-0.15158 0.69591 0 1.0955 0.53744 0.39964 0.53399
> 0.39964 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099
> 0.54088-0.34451
> 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h=
0.6339z"/><path
> id=3D"path181" d=3D"m126.26 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.=
27905
> 0.19293-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222
> 0.19292 0.52366 0 0.82338-0.36174 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-3e-3
> -0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.6545=
7
> 0.09302t-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982
> 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125
> 0.55121 0.42375 0.13092 0.17226 0.18604 0.42719 0.0551 0.25149 0.0551
> 0.75792z"/><path id=3D"path183" d=3D"m132.07
> 47.261q-0.20326-0.15848-0.41342-0.23082-0.21015-0.07235-0.46164-0.07235-0=
.59255
> 0-0.90606 0.37207-0.3135 0.37207-0.3135
> 1.0749v1.9189h-0.63735v-3.8585h0.63735v0.75448q0.15847-0.40997
> 0.48576-0.62701 0.33073-0.22049 0.78203-0.22049 0.23427 0 0.43753
> 0.05857t0.3893 0.18259z"/><path id=3D"path185" d=3D"m135.4
> 45.18h0.65457l-2.7078 5.7981h-0.65801z"/><path id=3D"path187" d=3D"m131.7=
4
> 57.303q-0.25494 0.14814-0.5271 0.22049-0.26872 0.07579-0.55122
> 0.07579-0.89572
> 0-1.4022-0.53744-0.50299-0.53744-0.50299-1.4883t0.50299-1.4883q0.50643-0.=
53744
> 1.4022-0.53744 0.27905 0 0.54433 0.07235 0.26527 0.07235 0.53399
> 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-0=
.09991-0.596
> 0-0.91639 0.38585-0.3204 0.38585-0.3204 1.1024 0 0.71314 0.3204 1.1024
> 0.32384 0.38585 0.91639 0.38585 0.33073 0 0.59256-0.09991 0.26183-0.10335
> 0.48576-0.31695z"/><path id=3D"path189" d=3D"m131.04
> 61.31v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15847 0.28594-0.42374
> 0.43753-0.26183 0.14814-0.60634 0.14814-0.69936
> 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40307-1.4745
> 0.40308-0.53744 1.099-0.53744 0.34795 0 0.61323 0.15158 0.26527 0.14814
> 0.41685 0.43408zm-1.8638 1.4401q0 0.73725 0.23427 1.1128t0.69247
> 0.37552q0.45819 0 0.69591-0.37896 0.24115-0.37896 0.24115-1.1093
> 0-0.73381-0.24115-1.1093-0.23772-0.37896-0.69591-0.37896-0.4582 0-0.69247
> 0.37552t-0.23427 1.1128z"/></g><path id=3D"path18567" d=3D"m113.38
> 23.535v22.663" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path185=
69"
> d=3D"m113.38 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path18571" d=3D"m113.38 46.199c=
0 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path185=
73"
> d=3D"m122.11 30.8-6e-3 8.5867" fill=3D"none" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path18575" d=3D"m122.11 32.462c=
0 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path185=
77"
> d=3D"m122.11 39.387c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path18579" d=3D"m122.11 52.334-=
6e-3
> 8.5867" fill=3D"none" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><path id=3D"path185=
81"
> d=3D"m122.11 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019"
> fill=3D"none" marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000"
> stroke-linecap=3D"round" stroke-width=3D".52917"
> style=3D"paint-order:normal"/><path id=3D"path18583" d=3D"m122.11 60.92c0=
 1.5071
> 1.5429 1.4354 1.5429 1.4354l3.846-0.0019" fill=3D"none"
> marker-end=3D"url(#Arrow1Mend)" stroke=3D"#000" stroke-linecap=3D"round"
> stroke-width=3D".52917" style=3D"paint-order:normal"/><g id=3D"text22069"
> fill=3D"#0081cf" stroke-width=3D".26458px" aria-label=3D"a"><path id=3D"p=
ath192"
> d=3D"m130.57 33.771h-0.21015q-0.55466 0-0.83716 0.19637-0.27905
> 0.19292-0.27905 0.57878 0 0.34796 0.21015 0.54088 0.21015 0.19292 0.58222
> 0.19292 0.52365 0 0.82338-0.36174 0.29972-0.36518
> 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326
> 0.34451-0.51332 0.50988-0.30662 0.16192-0.74759 0.16192-0.58911
> 0-0.94051-0.33073-0.3514-0.33418-0.3514-0.89228 0-0.64423 0.43064-0.97841
> 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-3e-3
> -0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.6545=
7
> 0.09302t-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982
> 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125
> 0.55121 0.42375 0.13092 0.17226 0.18604 0.42719 0.0551 0.25149 0.0551
> 0.75792z"/></g></svg>
> --
> 2.31.1
>
>
>

--=20
Klaus Heinrich Kiwi <kkiwi@redhat.com>
Manager, Software Engineering - Red Hat Virtualization

--0000000000004165f905c9eda3bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 7:27 AM Hanna=
 Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">This post explains when FUSE block exports are useful, how they wor=
k,<br>
and that it is fun to export an image file on its own path so it looks<br>
like your image file (in whatever format it was) is a raw image now.<br>
<br></blockquote><div><br></div><div>Thanks Hanna, great work. Even if you =
explained this to me multiple times,</div><div>thanks to this I think I now=
 finally understand *how* it works.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Signed-off-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=
=3D"_blank">hreitz@redhat.com</a>&gt;<br>
---<br>
You can also find this patch here:<br>
<a href=3D"https://gitlab.com/hreitz/qemu-web" rel=3D"noreferrer" target=3D=
"_blank">https://gitlab.com/hreitz/qemu-web</a> fuse-blkexport-v1<br>
<br>
My first patch to qemu-web, so I hope I am not doing anything overly<br>
stupid here (adding SVGs with extremely long lines comes to mind)...<br>
---<br>
=C2=A0_posts/2021-08-18-fuse-blkexport.md=C2=A0 =C2=A0 =C2=A0 =C2=A0| 488 +=
+++++++++++++++++++++<br>
=C2=A0screenshots/2021-08-18-block-graph-a.svg=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0screenshots/2021-08-18-block-graph-b.svg=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0screenshots/2021-08-18-block-graph-c.svg=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0screenshots/2021-08-18-block-graph-d.svg=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0screenshots/2021-08-18-block-graph-e.svg=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0screenshots/2021-08-18-root-directory.svg |=C2=A0 =C2=A02 +<br>
=C2=A0screenshots/2021-08-18-root-file.svg=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A08 files changed, 502 insertions(+)<br>
=C2=A0create mode 100644 _posts/2021-08-18-fuse-blkexport.md<br>
=C2=A0create mode 100644 screenshots/2021-08-18-block-graph-a.svg<br>
=C2=A0create mode 100644 screenshots/2021-08-18-block-graph-b.svg<br>
=C2=A0create mode 100644 screenshots/2021-08-18-block-graph-c.svg<br>
=C2=A0create mode 100644 screenshots/2021-08-18-block-graph-d.svg<br>
=C2=A0create mode 100644 screenshots/2021-08-18-block-graph-e.svg<br>
=C2=A0create mode 100644 screenshots/2021-08-18-root-directory.svg<br>
=C2=A0create mode 100644 screenshots/2021-08-18-root-file.svg<br>
<br>
diff --git a/_posts/2021-08-18-fuse-blkexport.md b/_posts/2021-08-18-fuse-b=
lkexport.md<br>
new file mode 100644<br>
index 0000000..e6a55d0<br>
--- /dev/null<br>
+++ b/_posts/2021-08-18-fuse-blkexport.md<br>
@@ -0,0 +1,488 @@<br>
+---<br>
+layout: post<br>
+title:=C2=A0 &quot;Exporting block devices as raw image files with FUSE&qu=
ot;<br>
+date:=C2=A0 =C2=A02021-08-18 18:00:00 +0200<br>
+author: Hanna Reitz<br>
+categories: [storage, features, tutorials]<br>
</blockquote><div><br></div><div>Non-fatal, but I feel that the title doesn=
&#39;t summarize all that this&#39; blog posts is about.</div><div>An alter=
nate suggestion might be in the lines of &quot;A look into QEMU&#39;s FUSE =
export</div><div>feature, and how to use it to manipulate guest images&quot=
;.<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">+---<br>
+Sometimes, there is a VM disk image whose contents you want to manipulate<=
br>
+without booting the VM.=C2=A0 For raw images, that process is usually fair=
ly simple,<br>
+because most Linux systems bring tools for the job, e.g.:<br>
+* *dd* to just copy data to and from given offsets,<br>
+* *parted* to manipulate the partition table,<br>
+* *kpartx* to present all partitions as block devices,<br>
+* *mount* to access filesystems=E2=80=99 contents.<br>
+<br>
+Sadly, but naturally, such tools only work for raw images, and not for ima=
ges<br>
+e.g. in QEMU=E2=80=99s qcow2 format.=C2=A0 To access such an image=E2=80=
=99s content, the format has<br>
+to be translated to create a raw image, for example by:<br>
+* Exporting the image file with `qemu-nbd -c` as an NBD block device file,=
<br>
+* Converting between image formats using `qemu-img convert`,<br>
+* Accessing the image from a guest, where it appears as a normal block dev=
ice.<br>
+<br></blockquote><div>Guessing that this would be the best place to mentio=
n guestmount/libguestfs, as Stefan</div><div>mentioned in another reply to =
this thread?</div><div><br></div><div>Bonus points if you can identify (dis=
)advantages, similarly to that you did below</div><div>with the other metho=
ds.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+Unfortunately, none of these methods is perfect: `qemu-nbd -c` generally<b=
r>
+requires root rights, converting to a temporary raw copy requires addition=
al<br>
+disk space and the conversion process takes time, and accessing the image =
from a<br>
+guest is just quite cumbersome in general (and also specifically something=
 that<br>
+we set out to avoid in the first sentence of this blog post).<br>
+<br>
+As of QEMU 6.0, there is another method, namely FUSE block exports.<br>
+Conceptually, these are rather similar to using `qemu-nbd -c`, but they do=
 not<br>
+require root rights.<br>
+<br>
+**Note**: FUSE block exports are a feature that can be enabled or disabled=
<br>
+during the build process with `--enable-fuse` or `--disable-fuse`, respect=
ively;<br>
+omitting either configure option will enable the feature if and only if li=
bfuse3<br>
+is present.=C2=A0 It is possible that the QEMU build you are using does no=
t have FUSE<br>
+block export support, because it was not compiled in.<br>
+<br>
+FUSE (*Filesystem in Userspace*) is a technology to let userspace processe=
s<br>
+provide filesystem drivers.=C2=A0 For example, *sshfs* is a program that a=
llows<br>
+mounting remote directories from a machine accessible via SSH.<br>
+<br></blockquote><div><br></div><div>Nitpicking but maybe FUSE here could =
link to another tutorial/wikipedia page</div><div>with more info?</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+QEMU can use FUSE to make a virtual block device appear as a normal file o=
n the<br>
+host, so that tools like *kpartx* can interact with it regardless of the i=
mage<br>
+format.<br>
+<br>
+## Background information<br>
+<br>
+### File mounts<br><br></blockquote><div>I must confess that, as I&#39;ve =
gone through the document, this felt a bit like breaking</div><div>the flow=
 (probably due to my pre-conceptions of always mounting a resource into</di=
v><div>some directory to see it&#39;s content, which I guess was what I was=
 expecting this</div><div>would go before talking about mounting files).</d=
iv><div><br></div><div>I understand now, however, that this introduction is=
 necessary, but perhaps</div><div>something like &quot;Before we are able t=
o use QEMU&#39;s FUSE exports, we need to clarify</div><div>some fundamenta=
l concepts on the VFS and mountpoints: It is a little-known fact</div><div>=
that &lt;...&gt;&quot; would help me understand the flow better here.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+A perhaps little-known fact is that, on Linux, filesystems do not need to =
have<br>
+a root directory, they only need to have a root node.=C2=A0 A filesystem t=
hat only<br>
+provides a single regular file is perfectly valid.<br>
+<br>
+Conceptually, every filesystem is a tree, and mounting works by replacing =
one<br>
+subtree of the global VFS tree by the mounted filesystem=E2=80=99s tree.=
=C2=A0 Normally, a<br>
+filesystem=E2=80=99s root node is a directory, like in the following examp=
le:<br>
+<br>
+|![Regular filesystem: Root directory is mounted to a directory mount poin=
t](/screenshots/2021-08-18-root-directory.svg)|<br>
+|:--:|<br>
+|*Fig. 1: Mounting a regular filesystem with a directory as its root node*=
|<br>
+<br>
+Here, the directory `/foo` and its content (the files `/foo/a` and `/foo/b=
`) are<br>
+shadowed by the new filesystem (showing `/foo/x` and `/foo/y`).<br>
+<br></blockquote><div><br></div><div>Must confess that I wish there were a=
 better term for it than &#39;shadowed directory&#39;</div><div>or &#39;sha=
dowed file&#39;, avoiding potential confusion with things like /etc/shadow =
or</div><div>&#39;shadow memory&#39;.. But I couldn&#39;t think if any.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+Note that a filesystem=E2=80=99s root node generally has no name.=C2=A0 Af=
ter mounting, the<br>
+filesystem=E2=80=99s root directory=E2=80=99s name is determined by the or=
iginal name of the<br>
+mount point.<br>
+<br>
+Because a tree does not need to have multiple nodes but may consist of jus=
t a<br>
+single leaf, a filesystem with a file for its root node works just as well=
,<br>
+though:<br>
+<br>
+|![Mounting a file root node to a regular file mount point](/screenshots/2=
021-08-18-root-file.svg)|<br>
+|:--:|<br>
+|*Fig. 2: Mounting a filesystem with a regular (unnamed) file as its root =
node*|<br>
+<br>
+Here, FS B only consists of a single node, a regular file with no name.=C2=
=A0 (As<br>
+above, a filesystem=E2=80=99s root node is generally unnamed.) Consequentl=
y, the mount<br>
+point for it must also be a regular file (`/foo/a` in our example), and ju=
st<br>
+like before, the content of `/foo/a` is shadowed, and when opening it, one=
 will<br>
+instead see the contents of FS B=E2=80=99s unnamed root node.<br>
+<br>
+### QEMU block exports<br>
+<br>
+QEMU allows exporting block nodes via various protocols (as of 6.0: NBD,<b=
r>
+vhost-user, FUSE).=C2=A0 A block node is an element of QEMU=E2=80=99s bloc=
k graph (see e.g.<br>
+[Managing the New Block Layer](<a href=3D"http://events17.linuxfoundation.=
org/sites/events/files/slides/talk%5C_11.pdf" rel=3D"noreferrer" target=3D"=
_blank">http://events17.linuxfoundation.org/sites/events/files/slides/talk\=
_11.pdf</a>),<br>
+a talk given at KVM Forum 2017), which can for example be attached to gues=
t<br>
+devices.=C2=A0 Here is a very simple example:<br>
+<br>
+|![Block graph: image file &lt;-&gt; file node (label: prot-node) &lt;-&gt=
; qcow2 node (label: fmt-node) &lt;-&gt; virtio-blk guest device](/screensh=
ots/2021-08-18-block-graph-a.svg)|<br>
+|:--:|<br>
+|*Fig. 3: A simple block graph for attaching a qcow2 image to a virtio-blk=
 guest device*|<br>
+<br>
+This is the simplest example for a block graph that connects a *virtio-blk=
*<br>
+guest device to a qcow2 image file.=C2=A0 The *file* block driver, instanc=
ed in the<br>
+form of a block node named *prot-node*, accesses the actual file and provi=
des<br>
+the node above it access to the raw content.=C2=A0 This node above, named =
*fmt-node*,<br>
+is handled by the *qcow2* block driver, which is capable of interpreting t=
he<br>
+qcow2 format.=C2=A0 Parents of this node will therefore see the actual con=
tent of the<br>
+virtual disk that is represented by the qcow2 image.=C2=A0 There is only o=
ne parent<br>
+here, which is the *virtio-blk* guest device, which will thus see the virt=
ual<br>
+disk.<br>
+<br>
+The command line to achieve the above could look something like this:<br>
+```<br>
+$ qemu-system-x86_64 \<br>
+=C2=A0 =C2=A0 -blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$im=
age_path \<br>
+=C2=A0 =C2=A0 -blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-no=
de \<br>
+=C2=A0 =C2=A0 -device virtio-blk,drive=3Dfmt-node<br>
+```<br>
+<br>
+Besides attaching guest devices to block nodes, you can also export them f=
or<br>
+users outside of qemu, for example via NBD.=C2=A0 Say you have a QMP chann=
el open for<br>
+the QEMU instance above, then you could do this:<br></blockquote><div><br>=
</div><div>As much as I hate to say it, wouldn&#39;t it be better to give t=
he example below using</div><div>(legacy?) qemu monitor commands, instead o=
f JSON? Unless it cannot be done that way</div><div>of course, they feel mo=
re intuitive/recognizable to me I think.</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+```json<br>
+{<br>
+=C2=A0 =C2=A0 &quot;execute&quot;: &quot;nbd-server-start&quot;,<br>
+=C2=A0 =C2=A0 &quot;arguments&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;addr&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;inet&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;data&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;host&quot;: =
&quot;localhost&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;port&quot;: =
&quot;10809&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+{<br>
+=C2=A0 =C2=A0 &quot;execute&quot;: &quot;block-export-add&quot;,<br>
+=C2=A0 =C2=A0 &quot;arguments&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;nbd&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;id&quot;: &quot;fmt-node-export&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;node-name&quot;: &quot;fmt-node&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;guest-disk&quot;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+```<br>
+<br>
+This opens an NBD server on `localhost:10809`, which exports *fmt-node* (u=
nder<br>
+the NBD export name *guest-disk*).=C2=A0 The block graph looks as follows:=
<br>
+<br>
+|![Same block graph as fig. 3, but with an NBD server attached to fmt-node=
](/screenshots/2021-08-18-block-graph-b.svg)|<br>
+|:--:|<br>
+|*Fig. 4: Block graph extended by an NBD server*|<br>
+<br>
+NBD clients connecting to this server will see the raw disk as seen by the=
<br>
+guest =E2=80=93 we have *exported* the guest disk:<br>
+<br>
+```<br>
+$ qemu-img info nbd://localhost/guest-disk<br>
+image: nbd://localhost:10809/guest-disk<br>
+file format: raw<br>
+virtual size: 20 GiB (21474836480 bytes)<br>
+disk size: unavailable<br>
+```<br>
+<br>
+### QEMU storage daemon<br>
+<br>
+If you are not running a guest, and so do not need guest devices, but all =
you<br>
+want is to use the QEMU block layer (for example to interpret the qcow2 fo=
rmat)<br>
+and export nodes from the block graph, then you can use the more lightweig=
ht<br>
+QEMU storage daemon instead of a full-blown QEMU process:<br>
+<br>
+```<br>
+$ qemu-storage-daemon \<br>
+=C2=A0 =C2=A0 --blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$i=
mage_path \<br>
+=C2=A0 =C2=A0 --blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-n=
ode \<br>
+=C2=A0 =C2=A0 --nbd-server addr.type=3Dinet,addr.host=3Dlocalhost,addr.por=
t=3D10809 \<br>
+=C2=A0 =C2=A0 --export type=3Dnbd,id=3Dfmt-node-export,node-name=3Dfmt-nod=
e,name=3Dguest-disk<br>
+```<br>
+<br>
+Which creates the following block graph:<br>
+<br>
+|![Block graph: image file &lt;-&gt; file node (label: prot-node) &lt;-&gt=
; qcow2 node (label: fmt-node) &lt;-&gt; NBD server](/screenshots/2021-08-1=
8-block-graph-c.svg)|<br>
+|:--:|<br>
+|*Fig. 5: Exporting a qcow2 image over NBD*|<br>
+<br>
+## FUSE block exports<br>
+<br>
+Besides NBD exports, QEMU also supports vhost-user and FUSE exports.=C2=A0=
 FUSE block<br>
+exports make QEMU become a FUSE driver that provides a filesystem that con=
sists<br>
+of only a single node, namely a regular file that has the raw contents of =
the<br>
+exported block node.=C2=A0 QEMU will automatically mount this filesystem o=
n a given<br>
+existing regular file (which acts as the mount point, as described in the<=
br>
+=E2=80=9CFile mounts=E2=80=9D section).<br>
+<br>
+Thus, FUSE exports can be used like this:<br>
+<br>
+```<br>
+$ touch mount-point<br>
+<br>
+$ qemu-storage-daemon \<br>
+=C2=A0 =C2=A0 --blockdev node-name=3Dprot-node,driver=3Dfile,filename=3D$i=
mage_path \<br>
+=C2=A0 =C2=A0 --blockdev node-name=3Dfmt-node,driver=3Dqcow2,file=3Dprot-n=
ode \<br>
+=C2=A0 =C2=A0 --export type=3Dfuse,id=3Dfmt-node-export,node-name=3Dfmt-no=
de,mountpoint=3Dmount-point<br>
+```<br>
+<br>
+The mount point now appears as the raw VM disk that is stored in the qcow2=
<br>
+image:<br>
+```<br>
+$ qemu-img info mount-point<br>
+image: mount-point<br>
+file format: raw<br>
+virtual size: 20 GiB (21474836480 bytes)<br>
+disk size: 196 KiB<br>
+```<br>
+<br>
+And *mount* tells us that this is indeed its own filesystem:<br>
+```<br>
+$ mount | grep mount-point<br>
+/dev/fuse on /tmp/mount-point type fuse (rw,nosuid,nodev,relatime,user_id=
=3D1000,group_id=3D100,default_permissions,allow_other,max_read=3D67108864)=
<br>
+```<br>
+<br>
+The block graph looks like this:<br>
+<br>
+|![Block graph: image file &lt;-&gt; file node (label: prot-node) &lt;-&gt=
; qcow2 node (label: fmt-node) &lt;-&gt; FUSE server &lt;-&gt; exported fil=
e](/screenshots/2021-08-18-block-graph-d.svg)|<br>
+|:--:|<br>
+|*Fig. 6: Exporting a qcow2 image over FUSE*|<br>
+<br>
+Closing the storage daemon (e.g. with Ctrl-C) automatically unmounts the e=
xport,<br>
+turning the mount point back into an empty normal file:<br>
+<br>
+```<br>
+$ mount | grep -c mount-point<br>
+0<br>
+<br>
+$ qemu-img info mount-point<br>
+image: mount-point<br>
+file format: raw<br>
+virtual size: 0 B (0 bytes)<br>
+disk size: 0 B<br>
+```<br>
+<br>
+## Mounting an image on itself<br>
+<br>
+So far, we have seen what FUSE exports are, how they work, and how they ca=
n be<br>
+used.=C2=A0 Now let=E2=80=99s add an interesting twist.<br>
+<br>
+### What happens to the old tree under a mount point?<br>
+<br>
+Mounting a filesystem only shadows the mount point=E2=80=99s original cont=
ent, it does<br>
+not remove it.=C2=A0 The original content can no longer be looked up via i=
ts<br>
+(absolute) path, but it is still there, much like a file that has been unl=
inked<br>
+but is still open in some process.=C2=A0 Here is an example:<br>
+<br>
+First, create some file in some directory, and have some process keep it o=
pen:<br>
+<br>
+```<br>
+$ mkdir foo<br>
+<br>
+$ echo &#39;Is anyone there?&#39; &gt; foo/bar<br>
+<br>
+$ irb<br>
+irb(main):001:0&gt; f =3D File.open(&#39;foo/bar&#39;, &#39;r+&#39;)<br>
+=3D&gt; #&lt;File:foo/bar&gt;<br>
+irb(main):002:0&gt; ^Z<br>
+[1]=C2=A0 + 35494 suspended=C2=A0 irb<br>
+```<br>
+<br>
+Next, mount something on the directory:<br>
+<br>
+```<br>
+$ sudo mount -t tmpfs tmpfs foo<br>
+```<br>
+<br>
+The file cannot be found anymore (because *foo*=E2=80=99s content is shado=
wed by the<br>
+mounted filesystem), but the process who kept it open can still read from =
it,<br>
+and write to it:<br>
+```<br>
+$ ls foo<br>
+<br>
+$ cat foo/bar<br>
+cat: foo/bar: No such file or directory<br>
+<br>
+$ fg<br>
+f.read<br>
+irb(main):002:0&gt; f.read<br>
+=3D&gt; &quot;Is anyone there?\n&quot;<br>
+irb(main):003:0&gt; f.puts(&#39;Hello from the shadows!&#39;)<br>
+=3D&gt; nil<br>
+irb(main):004:0&gt; exit<br>
+<br>
+$ ls foo<br>
+<br>
+$ cat foo/bar<br>
+cat: foo/bar: No such file or directory<br>
+```<br>
+<br>
+Unmounting the filesystem lets us see our file again, with its updated con=
tent:<br>
+```<br>
+$ sudo umount foo<br>
+<br>
+$ ls foo<br>
+bar<br>
+<br>
+$ cat foo/bar<br>
+Is anyone there?<br>
+Hello from the shadows!<br>
+```<br>
+<br>
+### Letting a FUSE export shadow its image file<br>
+<br>
+The same principle applies to file mounts: The original inode is shadowed =
(along<br>
+with its content), but it is still there for any process that opened it be=
fore<br>
+the mount occurred.=C2=A0 Because QEMU (or the storage daemon) opens the i=
mage file<br>
+before mounting the FUSE export, you can therefore specify an image=E2=80=
=99s path as<br>
+the mount point for its corresponding export:<br>
+<br>
+```<br>
+$ qemu-img create -f qcow2 foo.qcow2 20G<br>
+Formatting &#39;foo.qcow2&#39;, fmt=3Dqcow2 cluster_size=3D65536 extended_=
l2=3Doff compression_type=3Dzlib size=3D21474836480 lazy_refcounts=3Doff re=
fcount_bits=3D16<br>
+<br>
+$ qemu-img info foo.qcow2<br>
+image: foo.qcow2<br>
+file format: qcow2<br>
+virtual size: 20 GiB (21474836480 bytes)<br>
+disk size: 196 KiB<br>
+cluster_size: 65536<br>
+Format specific information:<br>
+=C2=A0 =C2=A0 compat: 1.1<br>
+=C2=A0 =C2=A0 compression type: zlib<br>
+=C2=A0 =C2=A0 lazy refcounts: false<br>
+=C2=A0 =C2=A0 refcount bits: 16<br>
+=C2=A0 =C2=A0 corrupt: false<br>
+=C2=A0 =C2=A0 extended l2: false<br>
+<br>
+$ qemu-storage-daemon \<br>
+=C2=A0 =C2=A0 --blockdev node-name=3Dnode0,driver=3Dqcow2,file.driver=3Dfi=
le,file.filename=3Dfoo.qcow2 \<br>
+=C2=A0 =C2=A0 --export type=3Dfuse,id=3Dnode0-export,node-name=3Dnode0,mou=
ntpoint=3Dfoo.qcow2 &amp;<br>
+[1] 40843<br>
+<br>
+$ qemu-img info foo.qcow2<br>
+image: foo.qcow2<br>
+file format: raw<br>
+virtual size: 20 GiB (21474836480 bytes)<br>
+disk size: 196 KiB<br>
+<br>
+$ kill %1<br>
+[1]=C2=A0 + 40843 done=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-storage-daemon --blo=
ckdev=C2=A0 --export<br>
+```<br>
+<br>
+In graph form, that looks like this:<br>
+<br>
+|![Two graphs: First, foo.qcow2 is opened by QEMU; second, a FUSE server e=
xports the raw disk under foo.qcow2, thus shadowing the original foo.qcow2]=
(/screenshots/2021-08-18-block-graph-e.svg)|<br>
+|:--:|<br>
+|*Fig. 6: Exporting a qcow2 image via FUSE on its own path*|<br>
+<br>
+QEMU (or the storage daemon in this case) keeps the original (qcow2) file =
open,<br>
+and so it keeps access to it, even after the mount.=C2=A0 However, any oth=
er process<br>
+that opens the image by name (i.e. `open(&quot;foo.qcow2&quot;)`) will ope=
n the raw disk<br>
+image exported by QEMU.=C2=A0 Therefore, it looks like the qcow2 image is =
in raw<br>
+format now.<br>
+<br>
+### `qemu-fuse-disk-export.py`<br>
+<br>
+Because the QEMU storage daemon command line tends to become kind of long,=
 I=E2=80=99ve<br>
+written a script to facilitate the process:<br>
+[qemu-fuse-disk-export.py](<a href=3D"https://gitlab.com/hreitz/qemu-scrip=
ts/-/blob/main/qemu-fuse-disk-export.py" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.com/hreitz/qemu-scripts/-/blob/main/qemu-fuse-disk-export=
.py</a>)<br>
+([direct download link](<a href=3D"https://gitlab.com/hreitz/qemu-scripts/=
-/raw/main/qemu-fuse-disk-export.py?inline=3Dfalse)" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/hreitz/qemu-scripts/-/raw/main/qemu-fuse-=
disk-export.py?inline=3Dfalse)</a>).<br>
+This script automatically detects the image format, and its `--daemonize` =
option<br>
+allows safe use in scripts, where it is important that the process blocks =
until<br>
+the export is fully set up.<br>
+<br>
+Using `qemu-fuse-disk-export.py`, the above example looks like this:<br>
+```<br>
+$ qemu-img info foo.qcow2 | grep &#39;file format&#39;<br>
+file format: qcow2<br>
+<br>
+$ qemu-fuse-disk-export.py foo.qcow2 &amp;<br>
+[1] 13339<br>
+All exports set up, ^C to revert<br>
+<br>
+$ qemu-img info foo.qcow2 | grep &#39;file format&#39;<br>
+file format: raw<br>
+<br>
+$ kill -SIGINT %1<br>
+[1]=C2=A0 + 13339 done=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-fuse-disk-export.py =
foo.qcow2<br>
+<br>
+$ qemu-img info foo.qcow2 | grep &#39;file format&#39;<br>
+file format: qcow2<br>
+```<br>
+<br>
+Or, with `--daemonize`/`-d`:<br>
+```<br>
+$ qemu-img info foo.qcow2 | grep &#39;file format&#39;<br>
+file format: qcow2<br>
+<br>
+$ qemu-fuse-disk-export.py -dp qfde.pid foo.qcow2<br>
+<br>
+$ qemu-img info foo.qcow2 | grep &#39;file format&#39;<br>
+file format: raw<br>
+<br>
+$ kill -SIGINT $(cat qfde.pid)<br>
+<br>
+$ qemu-img info foo.qcow2 | grep &#39;file format&#39;<br>
+file format: qcow2<br>
+```<br>
+<br>
+## Bringing it all together<br>
+<br>
+Now we know how to make disk images in any format understood by QEMU appea=
r as<br>
+raw images.=C2=A0 We can thus run any application on them that works with =
such raw<br>
+disk images:<br>
+<br>
+```<br>
+$ qemu-fuse-disk-export.py \<br>
+=C2=A0 =C2=A0 -dp qfde.pid \<br>
+=C2=A0 =C2=A0 Arch-Linux-x86_64-basic-20210711.28787.qcow2<br>
+<br>
+$ parted Arch-Linux-x86_64-basic-20210711.28787.qcow2 p<br>
+WARNING: You are not superuser.=C2=A0 Watch out for permissions.<br>
+Model:=C2=A0 (file)<br>
+Disk /tmp/Arch-Linux-x86_64-basic-20210711.28787.qcow2: 42.9GB<br>
+Sector size (logical/physical): 512B/512B<br>
+Partition Table: gpt<br>
+Disk Flags:<br>
+<br>
+Number=C2=A0 Start=C2=A0 =C2=A0End=C2=A0 =C2=A0 =C2=A0Size=C2=A0 =C2=A0 Fi=
le system=C2=A0 Name=C2=A0 Flags<br>
+ 1=C2=A0 =C2=A0 =C2=A0 1049kB=C2=A0 2097kB=C2=A0 1049kB=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bios_grub<br>
+ 2=C2=A0 =C2=A0 =C2=A0 2097kB=C2=A0 42.9GB=C2=A0 42.9GB=C2=A0 btrfs<br>
+<br>
+$ sudo kpartx -av Arch-Linux-x86_64-basic-20210711.28787.qcow2<br>
+add map loop0p1 (254:0): 0 2048 linear 7:0 2048<br>
+add map loop0p2 (254:1): 0 83881951 linear 7:0 4096<br>
+<br>
+$ sudo mount /dev/mapper/loop0p2 /mnt/tmp<br>
+<br>
+$ ls /mnt/tmp<br>
+bin=C2=A0 =C2=A0boot=C2=A0 dev=C2=A0 etc=C2=A0 home=C2=A0 lib=C2=A0 lib64=
=C2=A0 mnt=C2=A0 opt=C2=A0 proc=C2=A0 root=C2=A0 run=C2=A0 sbin=C2=A0 srv<b=
r>
+swap=C2=A0 sys=C2=A0 =C2=A0tmp=C2=A0 usr=C2=A0 var<br>
+<br>
+$ echo &#39;Hello, qcow2 image!&#39; &gt; /mnt/tmp/home/arch/hello<br>
+<br>
+$ sudo umount /mnt/tmp<br>
+<br>
+$ sudo kpartx -d Arch-Linux-x86_64-basic-20210711.28787.qcow2<br>
+loop deleted : /dev/loop0<br>
+<br>
+$ kill -SIGINT $(cat qfde.pid)<br>
+```<br>
+<br>
+And launching the image, in the guest we see:<br>
+```<br>
+[arch@archlinux ~] cat hello<br>
+Hello, qcow2 image!<br>
+```<br>
+<br>
+## A note on `allow_other`<br>
+<br>
+In the example presented in the above section, we access the exported imag=
e with<br>
+a different user than the one who exported it (to be specific, we export i=
t as a<br>
+normal user, and then access it as root).=C2=A0 This does not work prior t=
o QEMU 6.1:<br>
+<br>
+```<br>
+$ qemu-fuse-disk-export.py -dp qfde.pid foo.qcow2<br>
+<br>
+$ sudo stat foo.qcow2<br>
+stat: cannot statx &#39;foo.qcow2&#39;: Permission denied<br>
+```<br>
+<br>
+QEMU 6.1 has introduced support for FUSE=E2=80=99s `allow_other` mount opt=
ion.=C2=A0 Without<br>
+that option, only the user who exported the image has access to it.=C2=A0 =
By default,<br>
+if the system allows for non-root users to add `allow_other` to FUSE mount=
<br>
+options, QEMU will add it, and otherwise omit it.=C2=A0 It does so by simp=
ly<br>
+attempting to mount the export with `allow_other` first, and if that fails=
, it<br>
+will try again without.=C2=A0 (You can also force the behavior with the<br=
>
+`allow_other=3D(on|off|auto)` export parameter.)<br>
+<br>
+Non-root users can pass `allow_other` if and only if `/etc/fuse.conf` cont=
ains<br>
+the `user_allow_other` option.<br>
+<br>
+## Conclusion<br>
+<br>
+As shown in this blog post, FUSE block exports are a relatively simple way=
 to<br>
+access images in any format understood by QEMU as if they were raw images.=
<br>
+Any tool that can manipulate raw disk images can thus manipulate images in=
 any<br>
+format, simply by having the QEMU storage daemon provide a translation lay=
er.<br>
+By mounting the FUSE export on the original image path, this translation l=
ayer<br>
+will effectively be invisible, and the original image will look like it is=
 in<br>
+raw format, so it can directly be accessed by those tools.<br>
+<br>
+The current main disadvantage of FUSE exports is that they offer relativel=
y bad<br>
+performance.=C2=A0 That should be fine as long as your use case is just li=
ght<br>
+manipulation of some VM images, like manually modifying some files on them=
.<br>
+However, we did not yet really try to optimize performance, so if more ser=
ious<br>
+use cases appear that would require better performance, we can try.<br>
diff --git a/screenshots/2021-08-18-block-graph-a.svg b/screenshots/2021-08=
-18-block-graph-a.svg<br>
new file mode 100644<br>
index 0000000..bea1ba3<br></blockquote><div><br></div><div>The rest of it i=
s very didactic and educational - thanks!=C2=A0 And since none of my commen=
ts are critical:</div><div>=C2=A0</div><div>Reviewed-by: Klaus Heinrich Kiw=
i &lt;<a href=3D"mailto:kkiwi@redhat.com" target=3D"_blank">kkiwi@redhat.co=
m</a>&gt;</div><div><br></div><div>(Not that it matters much)</div><div><br=
></div><div>=C2=A0-Klaus</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
--- /dev/null<br>
+++ b/screenshots/2021-08-18-block-graph-a.svg<br>
@@ -0,0 +1,2 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;svg id=3D&quot;svg5&quot; width=3D&quot;93.084mm&quot; height=3D&quot;=
112.19mm&quot; version=3D&quot;1.1&quot; viewBox=3D&quot;0 0 93.084 112.19&=
quot; xmlns=3D&quot;<a href=3D"http://www.w3.org/2000/svg" rel=3D"noreferre=
r" target=3D"_blank">http://www.w3.org/2000/svg</a>&quot;&gt;&lt;defs id=3D=
&quot;defs2&quot;&gt;&lt;marker id=3D&quot;Arrow2Mstart&quot; overflow=3D&q=
uot;visible&quot; orient=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path2465=
1&quot; transform=3D&quot;scale(.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4=
.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D=
&quot;context-stroke&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=
=3D&quot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt=
;marker id=3D&quot;Arrow1Mend&quot; overflow=3D&quot;visible&quot; orient=
=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path26121&quot; transform=3D&quo=
t;scale(-.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.=
7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&quot;context-stroke&qu=
ot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=3D&quot;round&quot; str=
oke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt;/defs&gt;&lt;g id=3D&qu=
ot;text31368&quot; fill=3D&quot;#802400&quot; stroke-width=3D&quot;.26458px=
&quot; aria-label=3D&quot;QEMU process&quot;&gt;&lt;path id=3D&quot;path725=
2&quot; d=3D&quot;m72.021 7.6476q-0.75792 0-1.2058 0.565-0.44442 0.565-0.44=
442 1.54 0 0.97152 0.44442 1.5365 0.44786 0.565 1.2058 0.565 0.75792 0 1.19=
89-0.565 0.44442-0.565 0.44442-1.5365 0-0.97496-0.44442-1.54-0.44097-0.565-=
1.1989-0.565zm0.97496 4.5785 0.9164 1.0025h-0.8406l-0.76137-0.82338q-0.1136=
9 0.0069-0.1757 0.01034-0.05857 0.0034-0.11369 0.0034-1.0852 0-1.7363-0.723=
47-0.64768-0.72692-0.64768-1.943 0-1.2196 0.64768-1.943 0.65112-0.72692 1.7=
363-0.72692 1.0818 0 1.7294 0.72692 0.64768 0.72347 0.64768 1.943 0 0.89573=
-0.36174 1.5331-0.35829 0.63734-1.0404 0.94051z&quot;/&gt;&lt;path id=3D&qu=
ot;path7254&quot; d=3D&quot;m75.487 7.1756h3.2522v0.58567h-2.5563v1.5227h2.=
4495v0.58567h-2.4495v1.8638h2.6183v0.58567h-3.3142z&quot;/&gt;&lt;path id=
=3D&quot;path7256&quot; d=3D&quot;m79.945 7.1756h1.037l1.3126 3.5002 1.3195=
-3.5002h1.037v5.1435h-0.67868v-4.5165l-1.3264 3.5278h-0.69936l-1.3264-3.527=
8v4.5165h-0.67524z&quot;/&gt;&lt;path id=3D&quot;path7258&quot; d=3D&quot;m=
85.953 7.1756h0.69936v3.1247q0 0.82682 0.29972 1.192 0.29972 0.36174 0.9715=
2 0.36174 0.66835 0 0.96807-0.36174 0.29972-0.36518 0.29972-1.192v-3.1247h0=
.69936v3.2108q0 1.006-0.49954 1.5193-0.49609 0.51332-1.4676 0.51332-0.97496=
 0-1.4745-0.51332-0.49609-0.51332-0.49609-1.5193z&quot;/&gt;&lt;path id=3D&=
quot;path7260&quot; d=3D&quot;m67.594 18.916v2.0464h-0.63734v-5.3261h0.6373=
4v0.58567q0.19982-0.34451 0.50298-0.50988 0.30661-0.16881 0.73036-0.16881 0=
.7028 0 1.1403 0.55811 0.44097 0.55811 0.44097 1.4676t-0.44097 1.4676q-0.43=
753 0.5581-1.1403 0.5581-0.42375 0-0.73036-0.16536-0.30317-0.16881-0.50298-=
0.51332zm2.1566-1.347q0-0.69936-0.28939-1.0955-0.28594-0.39963-0.78893-0.39=
963t-0.79237 0.39963q-0.28594 0.39619-0.28594 1.0955t0.28594 1.099q0.28939 =
0.39619 0.79237 0.39619t0.78893-0.39619q0.28939-0.39963 0.28939-1.099z&quot=
;/&gt;&lt;path id=3D&quot;path7262&quot; d=3D&quot;m73.695 16.229q-0.1068-0=
.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.82682 0.=
3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945=
q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0=
.14469 0.01034 0.07924 0.0069 0.1757 0.02412z&quot;/&gt;&lt;path id=3D&quot=
;path7264&quot; d=3D&quot;m75.701 16.081q-0.50987 0-0.80615 0.39963-0.29628=
 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.506=
43 0 0.80271-0.39963t0.29628-1.0887q0-0.68558-0.29628-1.0852-0.29628-0.4030=
8-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744t0.47198 1.4883q0 0.94=
74-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0=
.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.30=
22-0.53744z&quot;/&gt;&lt;path id=3D&quot;path7266&quot; d=3D&quot;m81.299 =
15.785v0.59256q-0.26872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0.0=
7579-0.61667 0-0.95774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q=
0.34106 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579 0.5=
4088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604-0.2825 0.06201-0.6028=
9 0.06201-0.87161 0-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396=
 0.51676-1.4848 0.52021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.=
27905 0.05857 0.54088 0.17914z&quot;/&gt;&lt;path id=3D&quot;path7268&quot;=
 d=3D&quot;m85.702 17.408v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0=
.35485 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.6=
8213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.726=
92 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474=
 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.4=
5475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.8302=
7-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-=
0.36518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path7270&quot; d=3D&quot;m89=
.202 15.75v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0=
.0689-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0=
.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14=
469 0.95774 0.40997 0.28594 0.26183 0.28594 0.7338 0 0.53744-0.42719 0.8509=
4-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.33418-0.05857-0.=
70625-0.17914v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106 0.08957 0.675=
24 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-0.43408 0-0.25=
838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q-0.58911=
-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.54433 0.38585-=
0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05168t0.57189 0.15=
503z&quot;/&gt;&lt;path id=3D&quot;path7272&quot; d=3D&quot;m92.878 15.75v0=
.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.0689-0.4719=
8 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774 =
0.40997 0.28594 0.26183 0.28594 0.7338 0 0.53744-0.42719 0.85094-0.42375 0.=
3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.1791=
4v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 0=
.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-0.43408 0-0.25838-0.1757-0=
.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q-0.58911-0.12402-0.8=
5094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.54433 0.38585-0.8406 0.385=
85-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05168t0.57189 0.15503z&quot;/&=
gt;&lt;/g&gt;&lt;rect id=3D&quot;rect991&quot; x=3D&quot;15.436&quot; y=3D&=
quot;33.475&quot; width=3D&quot;33.768&quot; height=3D&quot;13.398&quot; rx=
=3D&quot;1.7964&quot; ry=3D&quot;1.8948&quot; fill=3D&quot;none&quot; stop-=
color=3D&quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;=
.52917&quot;/&gt;&lt;g id=3D&quot;text3313&quot; stroke-width=3D&quot;.2645=
8px&quot; aria-label=3D&quot;qcow2&quot;&gt;&lt;path id=3D&quot;path7275&qu=
ot; d=3D&quot;m22.055 38.496q0 0.69935 0.28594 1.099 0.28939 0.39619 0.7923=
7 0.39619t0.79237-0.39619q0.28939-0.39963 0.28939-1.099 0-0.69936-0.28939-1=
.0955-0.28939-0.39963-0.79237-0.39963t-0.79237 0.39963q-0.28594 0.39619-0.2=
8594 1.0955zm2.1601 1.347q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-=
0.73036 0.16536-0.69936 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676 0-0=
.90951 0.43753-1.4676 0.44097-0.55811 1.1403-0.55811 0.42719 0 0.73036 0.16=
881 0.30661 0.16536 0.50643 0.50987v-0.58567h0.6339v5.3261h-0.6339z&quot;/&=
gt;&lt;path id=3D&quot;path7277&quot; d=3D&quot;m28.932 36.711v0.59256q-0.2=
6872-0.14814-0.54088-0.22049-0.26872-0.07579-0.54433-0.07579-0.61667 0-0.95=
774 0.39274-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0.95=
774 0.3893 0.27561 0 0.54433-0.07235 0.27216-0.07579 0.54088-0.22393v0.5856=
7q-0.26527 0.12402-0.55122 0.18604-0.2825 0.06201-0.60289 0.06201-0.87161 0=
-1.3849-0.54777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.5=
2021-0.54088 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.540=
88 0.17914z&quot;/&gt;&lt;path id=3D&quot;path7279&quot; d=3D&quot;m31.529 =
37.008q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 =
0.29283 1.0921 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963t0.2=
9628-1.0886q0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.5=
3744q0.82682 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.4719=
8 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1=
.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&l=
t;path id=3D&quot;path7281&quot; d=3D&quot;m33.982 36.563h0.6339l0.79237 3.=
011 0.78893-3.011h0.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585=
h-0.74759l-0.83027-3.1626-0.83371 3.1626h-0.74759z&quot;/&gt;&lt;path id=3D=
&quot;path7283&quot; d=3D&quot;m40.81 39.836h2.4288v0.58567h-3.266v-0.58567=
q0.39619-0.40997 1.0783-1.099 0.68558-0.69246 0.86128-0.89228 0.33417-0.375=
52 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.40997-0.28939-0.66835=
-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.11369-0.36174 0.11369-=
0.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494t0.66835-0.08613q0.79=
926 0 1.2747 0.39963 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.6028=
9-0.11713 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164 0.=
47542-1.3022 1.3333z&quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect9379&quot;=
 x=3D&quot;15.436&quot; y=3D&quot;62.186&quot; width=3D&quot;33.768&quot; h=
eight=3D&quot;13.398&quot; rx=3D&quot;1.7964&quot; ry=3D&quot;1.8948&quot; =
fill=3D&quot;none&quot; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#00=
0&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;g id=3D&quot;text9383&quo=
t; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;file&quot;&gt;&lt=
;path id=3D&quot;path7303&quot; d=3D&quot;m30.837 65.488v3.8585h-0.63734v-3=
.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-=
0.63045 0.29628-0.93018 0.29972-0.30317 0.9164-0.30317h0.63734v0.5271h-0.60=
634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106zm-0.63=
734-1.4952h0.63734v0.80271h-0.63734z&quot;/&gt;&lt;path id=3D&quot;path7305=
&quot; d=3D&quot;m32.163 63.986h0.6339v5.3606h-0.6339z&quot;/&gt;&lt;path i=
d=3D&quot;path7307&quot; d=3D&quot;m37.424 67.259v0.31006h-2.9146q0.04134 0=
.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.0=
8957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.220=
49-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744=
-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.5581 1.3815-0.5581 0.7785=
9 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-=
0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.=
29972-0.31695 0.29972-0.36518 0.84405z&quot;/&gt;&lt;/g&gt;&lt;g id=3D&quot=
;g22369&quot; transform=3D&quot;translate(78.903 34.429)&quot; fill=3D&quot=
;none&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&quot;&gt;=
&lt;path id=3D&quot;rect18531&quot; d=3D&quot;m-53.494 58.06h10.715l3.1067 =
3.4104v16.022h-13.822z&quot; stop-color=3D&quot;#000000&quot;/&gt;&lt;path =
id=3D&quot;path21920&quot; d=3D&quot;m-42.779 58.06v3.41l3.1067 1e-6&quot; =
stroke-linecap=3D&quot;round&quot; style=3D&quot;paint-order:normal&quot;/&=
gt;&lt;/g&gt;&lt;g id=3D&quot;g25195&quot; transform=3D&quot;translate(84.2=
4 30.251)&quot;&gt;&lt;rect id=3D&quot;rect22371&quot; x=3D&quot;-75.456&qu=
ot; y=3D&quot;-25.487&quot; width=3D&quot;47.071&quot; height=3D&quot;13.39=
8&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&quot; stroke=3D&=
quot;#808080&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;g id=3D&quot;t=
ext22477&quot; fill=3D&quot;#808080&quot; stroke-width=3D&quot;.26458px&quo=
t; aria-label=3D&quot;virtio-blk&quot;&gt;&lt;path id=3D&quot;path7231&quot=
; d=3D&quot;m-67.446-20.016h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.=
4469 3.8585h-0.86127z&quot;/&gt;&lt;path id=3D&quot;path7233&quot; d=3D&quo=
t;m-62.815-20.016h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z&q=
uot;/&gt;&lt;path id=3D&quot;path7235&quot; d=3D&quot;m-58.619-19.424q-0.10=
68-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.8268=
2 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.5=
9945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546=
 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02411z&quot;/&gt;&lt;path id=3D&=
quot;path7237&quot; d=3D&quot;m-57.327-21.112v1.0955h1.3057v0.49265h-1.3057=
v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.=
53054h-0.65112q-0.73381 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2=
.0946h-0.46509v-0.49265h0.46509v-1.0955z&quot;/&gt;&lt;path id=3D&quot;path=
7239&quot; d=3D&quot;m-55.188-20.016h0.6339v3.8585h-0.6339zm0-1.5021h0.6339=
v0.80271h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path7241&quot; d=3D&quot;m-=
51.733-19.572q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0=
.69246 0.29283 1.0921 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39=
963t0.29628-1.0887q0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308=
zm0-0.53744q0.82682 0 1.2988 0.53744t0.47198 1.4883q0 0.9474-0.47198 1.4883=
-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.=
46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;=
/&gt;&lt;path id=3D&quot;path7243&quot; d=3D&quot;m-49.1-18.373h1.8569v0.56=
5h-1.8569z&quot;/&gt;&lt;path id=3D&quot;path7245&quot; d=3D&quot;m-43.464-=
18.084q0-0.69936-0.28939-1.0955-0.28594-0.39963-0.78893-0.39963-0.50298 0-0=
.79237 0.39963-0.28594 0.39619-0.28594 1.0955t0.28594 1.099q0.28939 0.39619=
 0.79237 0.39619t0.78893-0.39619q0.28939-0.39963 0.28939-1.099zm-2.1566-1.3=
47q0.19982-0.34451 0.50298-0.50988 0.30661-0.16881 0.73036-0.16881 0.7028 0=
 1.1403 0.55811 0.44097 0.55811 0.44097 1.4676t-0.44097 1.4676q-0.43753 0.5=
5811-1.1403 0.55811-0.42375 0-0.73036-0.16536-0.30317-0.16881-0.50298-0.513=
32v0.57878h-0.63734v-5.3606h0.63734z&quot;/&gt;&lt;path id=3D&quot;path7247=
&quot; d=3D&quot;m-41.756-21.518h0.6339v5.3606h-0.6339z&quot;/&gt;&lt;path =
id=3D&quot;path7249&quot; d=3D&quot;m-39.819-21.518h0.63734v3.166l1.8914-1.=
664h0.8096l-2.0464 1.8052 2.1325 2.0533h-0.82682l-1.9603-1.8845v1.8845h-0.6=
3734z&quot;/&gt;&lt;/g&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect23797&quot; x=
=3D&quot;.26458&quot; y=3D&quot;.26458&quot; width=3D&quot;64.111&quot; hei=
ght=3D&quot;83.942&quot; rx=3D&quot;5.2917&quot; ry=3D&quot;5.4057&quot; fi=
ll=3D&quot;none&quot; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#8024=
00&quot; stroke-dasharray=3D&quot;2.11666, 2.11666&quot; stroke-linecap=3D&=
quot;round&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;path id=3D&quot;=
path24007&quot; d=3D&quot;m32.315 80.657v10.837&quot; fill=3D&quot;none&quo=
t; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arro=
w2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833,=
 1.05833&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:=
normal&quot;/&gt;&lt;path id=3D&quot;path25180&quot; d=3D&quot;m32.315 52.0=
12v9.2246&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)=
&quot; marker-start=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&qu=
ot; stroke-dasharray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.5=
2917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;p=
ath25334&quot; d=3D&quot;m32.315 19.127v13.399&quot; fill=3D&quot;none&quot=
; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arrow=
2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833, =
1.05833&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:n=
ormal&quot;/&gt;&lt;rect id=3D&quot;rect35415&quot; x=3D&quot;17.503&quot; =
y=3D&quot;71.251&quot; width=3D&quot;29.634&quot; height=3D&quot;8.4415&quo=
t; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=3D&qu=
ot;#000000&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quo=
t; stroke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text35918&quot; str=
oke-width=3D&quot;.26458px&quot; aria-label=3D&quot;prot-node&quot;&gt;&lt;=
path id=3D&quot;path7310&quot; d=3D&quot;m21.06 76.592v1.4325h-0.44614v-3.7=
283h0.44614v0.40997q0.13987-0.24116 0.35209-0.35691 0.21463-0.11817 0.51125=
-0.11817 0.49196 0 0.79823 0.39067 0.30868 0.39067 0.30868 1.0273t-0.30868 =
1.0273q-0.30627 0.39067-0.79823 0.39067-0.29662 0-0.51125-0.11576-0.21222-0=
.11817-0.35209-0.35932zm1.5096-0.94292q0-0.48955-0.20257-0.76688-0.20016-0.=
27974-0.55225-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688t0.2=
0016 0.76929q0.20257 0.27733 0.55466 0.27733t0.55225-0.27733q0.20257-0.2797=
4 0.20257-0.76929z&quot;/&gt;&lt;path id=3D&quot;path7312&quot; d=3D&quot;m=
25.331 74.711q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217=
-0.3762 0-0.57878 0.24598-0.20016 0.24357-0.20016 0.70177v1.4228h-0.44614v-=
2.701h0.44614v0.41961q0.13987-0.24598 0.36415-0.36415 0.22428-0.12058 0.545=
01-0.12058 0.04582 0 0.10129 0.0072 0.05547 0.0048 0.12299 0.01688z&quot;/&=
gt;&lt;path id=3D&quot;path7314&quot; d=3D&quot;m26.735 74.608q-0.35691 0-0=
.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733=
 0.56672 0.27733 0.3545 0 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.7=
5964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762t0.330=
38 1.0418q0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-=
0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33=
038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path7316&quot; d=
=3D&quot;m29.149 73.53v0.76688h0.91398v0.34486h-0.91398v1.4662q0 0.33038 0.=
08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.5=
1366 0-0.709-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34=
486h0.32556v-0.76688z&quot;/&gt;&lt;path id=3D&quot;path7318&quot; d=3D&quo=
t;m30.422 75.447h1.2998v0.3955h-1.2998z&quot;/&gt;&lt;path id=3D&quot;path7=
320&quot; d=3D&quot;m34.674 75.367v1.6302h-0.44373v-1.6158q0-0.38344-0.1495=
2-0.57395t-0.44855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h=
-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.1=
2058 0.4992-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.846=
46z&quot;/&gt;&lt;path id=3D&quot;path7322&quot; d=3D&quot;m36.605 74.608q-=
0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2=
074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.20739-0.27974 0.20739=
-0.76206 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0=
.57878 0 0.90916 0.3762t0.33038 1.0418q0 0.66318-0.33038 1.0418-0.33038 0.3=
762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 =
0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path =
id=3D&quot;path7324&quot; d=3D&quot;m40.358 74.707v-1.4614h0.44373v3.7524h-=
0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.=
11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.02=
73q0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.1157=
6 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733=
 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0=
.76688q-0.20257-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0=
.20016 0.76688z&quot;/&gt;&lt;path id=3D&quot;path7326&quot; d=3D&quot;m44.=
026 75.536v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69936 0.24839 0.23874 0=
.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.419=
61q-0.23874 0.10128-0.48955 0.15434-0.2508 0.05305-0.50884 0.05305-0.6463 0=
-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932=
-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 0.31833 =
0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704-0=
.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z&q=
uot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect38770&quot; x=3D&quot;17.503&quo=
t; y=3D&quot;42.585&quot; width=3D&quot;29.634&quot; height=3D&quot;8.4415&=
quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=3D=
&quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&=
quot; stroke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text38774&quot; =
stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;fmt-node&quot;&gt;&l=
t;path id=3D&quot;path7286&quot; d=3D&quot;m22.93 44.774v0.36897h-0.42444q-=
0.23874 0-0.3328 0.09646-0.09164 0.09646-0.09164 0.34726v0.23875h0.7307v0.3=
4485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-0.34485h0.42444v-0.1881q0-0.=
45096 0.20981-0.65595 0.20981-0.2074 0.66559-0.2074z&quot;/&gt;&lt;path id=
=3D&quot;path7288&quot; d=3D&quot;m25.405 46.343q0.1664-0.29904 0.39791-0.4=
4132t0.54501-0.14228q0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291 0.8392=
2v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636t-0.41961-0.1881q-0.3448=
5 0-0.54501 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.1374=
6-0.57636-0.13746-0.1881-0.42444-0.1881-0.34003 0-0.54019 0.23151-0.20016 0=
.2291-0.20016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.2483=
9 0.36415-0.36656t0.50402-0.11817q0.29421 0 0.49919 0.14952 0.2074 0.14952 =
0.30627 0.43408z&quot;/&gt;&lt;path id=3D&quot;path7290&quot; d=3D&quot;m28=
.552 45.058v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.424=
44 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.70=
9-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34485h0.32556=
v-0.76688z&quot;/&gt;&lt;path id=3D&quot;path7292&quot; d=3D&quot;m29.825 4=
6.975h1.2998v0.3955h-1.2998z&quot;/&gt;&lt;path id=3D&quot;path7294&quot; d=
=3D&quot;m34.077 46.896v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-=
0.44855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h-0.44614v-2=
.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.4991=
9-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z&quot;/=
&gt;&lt;path id=3D&quot;path7296&quot; d=3D&quot;m36.008 46.136q-0.35691 0-=
0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.2773=
3 0.56672 0.27733 0.3545 0 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.=
75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762t0.33=
038 1.0418q0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0=
-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.3=
3038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path7298&quot; d=
=3D&quot;m39.761 46.235v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0=
.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.3=
9067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0.39067 0.79823-=
0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0=
.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733t0.55466-0.=
27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.5=
5466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688z&quot;/&gt;&=
lt;path id=3D&quot;path7300&quot; d=3D&quot;m43.429 47.065v0.21704h-2.0402q=
0.02894 0.4582 0.27492 0.69936 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.=
49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955=
 0.15434-0.2508 0.05305-0.50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.376=
2-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.=
54501 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-=
0.0048-0.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.=
59566 0.20981-0.22186 0.20981-0.25563 0.59083z&quot;/&gt;&lt;/g&gt;&lt;g id=
=3D&quot;text877&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&qu=
ot;qcow2 image file&quot;&gt;&lt;path id=3D&quot;path7204&quot; d=3D&quot;m=
52.492 98.541q0 0.69936 0.28594 1.099 0.28939 0.39618 0.79237 0.39618t0.792=
37-0.39618q0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0=
.79237-0.39963t-0.79237 0.39963q-0.28594 0.39619-0.28594 1.0955zm2.1601 1.3=
47q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16537-0.73036 0.16537-0.69936=
 0-1.1403-0.55811-0.43753-0.5581-0.43753-1.4676t0.43753-1.4676q0.44097-0.55=
811 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.5098=
7v-0.58567h0.6339v5.3261h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path7206&qu=
ot; d=3D&quot;m59.368 96.757v0.59256q-0.26872-0.14814-0.54088-0.22049-0.268=
72-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.39274-0.34106 0.3893-0.34106=
 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.072=
35 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18603=
-0.2825 0.062-0.60289 0.062-0.87161 0-1.3849-0.54777-0.51332-0.54777-0.5133=
2-1.478 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4228-0.54088 0.29283 0 0=
.57189 0.06201 0.27905 0.05857 0.54088 0.17914z&quot;/&gt;&lt;path id=3D&qu=
ot;path7208&quot; d=3D&quot;m61.966 97.053q-0.50988 0-0.80615 0.39963-0.296=
28 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39618 0.8096 0=
.39618 0.50643 0 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.=
29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744t0.47198 1=
.4883q0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.30=
22-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-=
0.53744 1.3022-0.53744z&quot;/&gt;&lt;path id=3D&quot;path7210&quot; d=3D&q=
uot;m64.419 96.609h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011=
 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371 3.162=
6h-0.74759z&quot;/&gt;&lt;path id=3D&quot;path7212&quot; d=3D&quot;m71.247 =
99.882h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68558-=
0.69246 0.86128-0.89228 0.33417-0.37552 0.46509-0.6339 0.13436-0.26183 0.13=
436-0.51332 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.327=
28 0-0.69246 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881=
 0.78548-0.25494t0.66835-0.08613q0.79926 0 1.2747 0.39963 0.47542 0.39963 0=
.47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064 0.66835-0.086=
13 0.09991-0.54777 0.57878-0.46164 0.47542-1.3022 1.3333z&quot;/&gt;&lt;pat=
h id=3D&quot;path7214&quot; d=3D&quot;m46.098 103.78h0.6339v3.8585h-0.6339z=
m0-1.5021h0.6339v0.8027h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path7216&quo=
t; d=3D&quot;m51.062 104.53q0.23771-0.42719 0.56844-0.63045t0.77859-0.20326=
q0.60289 0 0.93018 0.42375 0.32728 0.4203 0.32728 1.1989v2.3289h-0.63734v-2=
.3082q0-0.55466-0.19637-0.82338-0.19637-0.26871-0.59945-0.26871-0.49265 0-0=
.77859 0.32728t-0.28594 0.89228v2.1808h-0.63734v-2.3082q0-0.5581-0.19637-0.=
82338-0.19637-0.26871-0.60634-0.26871-0.48576 0-0.7717 0.33073-0.28594 0.32=
728-0.28594 0.88883v2.1808h-0.63734v-3.8585h0.63734v0.59944q0.21704-0.35484=
 0.52021-0.52365t0.72003-0.16881q0.4203 0 0.71314 0.2136 0.29628 0.21359 0.=
43753 0.62011z&quot;/&gt;&lt;path id=3D&quot;path7218&quot; d=3D&quot;m56.6=
84 105.7q-0.76826 0-1.0645 0.1757t-0.29628 0.59944q0 0.33762 0.22049 0.5374=
4 0.22393 0.19637 0.60634 0.19637 0.5271 0 0.84405-0.37207 0.32039-0.37552 =
0.32039-0.99563v-0.14125zm1.2644-0.26183v2.2014h-0.6339v-0.58567q-0.21704 0=
.3514-0.54088 0.52021-0.32384 0.16537-0.79237 0.16537-0.59256 0-0.94396-0.3=
3073-0.34795-0.33418-0.34795-0.89228 0-0.65113 0.43408-0.98186 0.43753-0.33=
073 1.3022-0.33073h0.88884v-0.062q0-0.43753-0.28939-0.67524-0.28594-0.24115=
-0.80615-0.24115-0.33073 0-0.64423 0.0792t-0.60289 0.23771v-0.58566q0.34795=
-0.13436 0.67524-0.19982 0.32728-0.0689 0.63734-0.0689 0.83716 0 1.2506 0.4=
3408 0.41341 0.43408 0.41341 1.316z&quot;/&gt;&lt;path id=3D&quot;path7220&=
quot; d=3D&quot;m61.793 105.67q0-0.68902-0.28594-1.068-0.2825-0.37896-0.795=
82-0.37896-0.50988 0-0.79582 0.37896-0.2825 0.37896-0.2825 1.068 0 0.68557 =
0.2825 1.0645 0.28594 0.37896 0.79582 0.37896 0.51332 0 0.79582-0.37896 0.2=
8594-0.37896 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642-0.43753 =
0.48231-1.3401 0.48231-0.33418 0-0.63045-0.0517-0.29628-0.0482-0.57533-0.15=
158v-0.61667q0.27905 0.15158 0.55122 0.22393 0.27216 0.0723 0.55466 0.0723 =
0.62356 0 0.93362-0.32728 0.31006-0.32384 0.31006-0.98185v-0.31351q-0.19637=
 0.34107-0.50298 0.50988t-0.73381 0.16881q-0.70969 0-1.1438-0.54088t-0.4340=
8-1.4332q0-0.89573 0.43408-1.4366t1.1438-0.54088q0.42719 0 0.73381 0.16881t=
0.50298 0.50987v-0.58566h0.6339z&quot;/&gt;&lt;path id=3D&quot;path7222&quo=
t; d=3D&quot;m67.033 105.56v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908=
 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.0896 0.34451-0.0896 0.6=
8213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22048-0.35829 0.0758-0.7269=
2 0.0758-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0=
.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.454=
75 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-=
0.2825-0.31005-0.75103-0.31005-0.53055 0-0.85094 0.29972-0.31695 0.29972-0.=
36518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path7224&quot; d=3D&quot;m73.4=
34 103.78v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v=
-0.49265h0.60634v-0.26872q0-0.63045 0.29628-0.93018 0.29972-0.30316 0.9164-=
0.30316h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.=
13091 0.49609v0.34107zm-0.63734-1.4952h0.63734v0.8027h-0.63734z&quot;/&gt;&=
lt;path id=3D&quot;path7226&quot; d=3D&quot;m74.761 102.28h0.6339v5.3606h-0=
.6339z&quot;/&gt;&lt;path id=3D&quot;path7228&quot; d=3D&quot;m80.021 105.5=
6v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.=
34106 0.36518 0 0.70624-0.0896 0.34451-0.0896 0.68213-0.26872v0.59945q-0.34=
106 0.14469-0.69936 0.22048-0.35829 0.0758-0.72692 0.0758-0.92329 0-1.4642-=
0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55=
811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608z=
m-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31005-0.75103-0.3=
1005-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot;/&gt;&=
lt;/g&gt;&lt;/svg&gt;<br>
diff --git a/screenshots/2021-08-18-block-graph-b.svg b/screenshots/2021-08=
-18-block-graph-b.svg<br>
new file mode 100644<br>
index 0000000..5bf98af<br>
--- /dev/null<br>
+++ b/screenshots/2021-08-18-block-graph-b.svg<br>
@@ -0,0 +1,2 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;svg id=3D&quot;svg5&quot; width=3D&quot;93.084mm&quot; height=3D&quot;=
112.19mm&quot; version=3D&quot;1.1&quot; viewBox=3D&quot;0 0 93.084 112.19&=
quot; xmlns=3D&quot;<a href=3D"http://www.w3.org/2000/svg" rel=3D"noreferre=
r" target=3D"_blank">http://www.w3.org/2000/svg</a>&quot;&gt;&lt;defs id=3D=
&quot;defs2&quot;&gt;&lt;marker id=3D&quot;Arrow2Mstart&quot; overflow=3D&q=
uot;visible&quot; orient=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path2465=
1&quot; transform=3D&quot;scale(.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4=
.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D=
&quot;context-stroke&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=
=3D&quot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt=
;marker id=3D&quot;Arrow1Mend&quot; overflow=3D&quot;visible&quot; orient=
=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path26121&quot; transform=3D&quo=
t;scale(-.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.=
7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&quot;context-stroke&qu=
ot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=3D&quot;round&quot; str=
oke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt;/defs&gt;&lt;rect id=3D=
&quot;rect991&quot; x=3D&quot;15.436&quot; y=3D&quot;33.475&quot; width=3D&=
quot;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;1.7964&quot; ry=3D=
&quot;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&quot;=
 stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;g id=
=3D&quot;text3313&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&q=
uot;qcow2&quot;&gt;&lt;path id=3D&quot;path96&quot; d=3D&quot;m22.055 38.49=
6q0 0.69935 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0 0.79237=
-0.39619 0.28939-0.39963 0.28939-1.099 0-0.69936-0.28939-1.0955-0.28939-0.3=
9963-0.79237-0.39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.09=
55zm2.1601 1.347q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0=
.16536-0.69936 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676 0-0.90951 0.=
43753-1.4676 0.44097-0.55811 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.306=
61 0.16536 0.50643 0.50987v-0.58567h0.6339v5.3261h-0.6339z&quot;/&gt;&lt;pa=
th id=3D&quot;path98&quot; d=3D&quot;m28.932 36.711v0.59256q-0.26872-0.1481=
4-0.54088-0.22049-0.26872-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.39274=
-0.34106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 =
0.27561 0 0.54433-0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 =
0.12402-0.55122 0.18604-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.5=
4777-0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.5408=
8 1.4228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z=
&quot;/&gt;&lt;path id=3D&quot;path100&quot; d=3D&quot;m31.529 37.008q-0.50=
987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.09=
21 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963=
 0.29628-1.0886 0-0.68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0=
-0.53744q0.82682 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0=
.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.468=
53-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0=
.53744z&quot;/&gt;&lt;path id=3D&quot;path102&quot; d=3D&quot;m33.982 36.56=
3h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011 0.78893-3.011h0.=
6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.83371 3.1626h-0.74759z&quot;=
/&gt;&lt;path id=3D&quot;path104&quot; d=3D&quot;m40.81 39.836h2.4288v0.585=
67h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68558-0.69246 0.86128-0.8=
9228 0.33417-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.409=
97-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.1136=
9-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494 0.=
36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963 0.47542 0.39963 0.47=
542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43064 0.66835-0.08613 =
0.09991-0.54777 0.57878-0.46164 0.47542-1.3022 1.3333z&quot;/&gt;&lt;/g&gt;=
&lt;rect id=3D&quot;rect9379&quot; x=3D&quot;15.436&quot; y=3D&quot;62.186&=
quot; width=3D&quot;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;1.7=
964&quot; ry=3D&quot;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&quo=
t;#000000&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&quot;=
/&gt;&lt;g id=3D&quot;text9383&quot; stroke-width=3D&quot;.26458px&quot; ar=
ia-label=3D&quot;file&quot;&gt;&lt;path id=3D&quot;path124&quot; d=3D&quot;=
m30.837 65.488v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.6=
0634v-0.49265h0.60634v-0.26872q0-0.63045 0.29628-0.93018 0.29972-0.30317 0.=
9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.13=
78-0.13091 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z&quot;=
/&gt;&lt;path id=3D&quot;path126&quot; d=3D&quot;m32.163 63.986h0.6339v5.36=
06h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path128&quot; d=3D&quot;m37.424 6=
7.259v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.985=
3 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945=
q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0=
-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51=
332-0.5581 1.3815-0.5581 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1=
.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.751=
03-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot;=
/&gt;&lt;/g&gt;&lt;g id=3D&quot;g22369&quot; transform=3D&quot;translate(78=
.903 34.429)&quot; fill=3D&quot;none&quot; stroke=3D&quot;#000&quot; stroke=
-width=3D&quot;.52917&quot;&gt;&lt;path id=3D&quot;rect18531&quot; d=3D&quo=
t;m-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z&quot; stop-color=3D&q=
uot;#000000&quot;/&gt;&lt;path id=3D&quot;path21920&quot; d=3D&quot;m-42.77=
9 58.06v3.41l3.1067 1e-6&quot; stroke-linecap=3D&quot;round&quot; style=3D&=
quot;paint-order:normal&quot;/&gt;&lt;/g&gt;&lt;g id=3D&quot;g25195&quot; t=
ransform=3D&quot;translate(84.24 30.251)&quot;&gt;&lt;rect id=3D&quot;rect2=
2371&quot; x=3D&quot;-75.456&quot; y=3D&quot;-25.487&quot; width=3D&quot;47=
.071&quot; height=3D&quot;13.398&quot; fill=3D&quot;none&quot; stop-color=
=3D&quot;#000000&quot; stroke=3D&quot;#808080&quot; stroke-width=3D&quot;.5=
2917&quot;/&gt;&lt;g id=3D&quot;text22477&quot; fill=3D&quot;#808080&quot; =
stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;virtio-blk&quot;&gt;=
&lt;path id=3D&quot;path75&quot; d=3D&quot;m-67.446-20.016h0.67179l1.2058 3=
.2384 1.2058-3.2384h0.67179l-1.4469 3.8585h-0.86127z&quot;/&gt;&lt;path id=
=3D&quot;path77&quot; d=3D&quot;m-62.815-20.016h0.6339v3.8585h-0.6339zm0-1.=
5021h0.6339v0.80271h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path79&quot; d=
=3D&quot;m-58.619-19.424q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.=
27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.032=
6h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0=
.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02=
411z&quot;/&gt;&lt;path id=3D&quot;path81&quot; d=3D&quot;m-57.327-21.112v1=
.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.134=
36 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.73381 0-1.0129-0.27216-0.2790=
5-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.49265h0.46509v-1.0955z&quot;/=
&gt;&lt;path id=3D&quot;path83&quot; d=3D&quot;m-55.188-20.016h0.6339v3.858=
5h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z&quot;/&gt;&lt;path id=3D&quot;p=
ath85&quot; d=3D&quot;m-51.733-19.572q-0.50987 0-0.80615 0.39963-0.29628 0.=
39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096 0.3961=
9 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68558-0.2962=
8-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.5374=
4 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.=
2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95=
085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;path id=3D=
&quot;path87&quot; d=3D&quot;m-49.1-18.373h1.8569v0.565h-1.8569z&quot;/&gt;=
&lt;path id=3D&quot;path89&quot; d=3D&quot;m-43.464-18.084q0-0.69936-0.2893=
9-1.0955-0.28594-0.39963-0.78893-0.39963-0.50298 0-0.79237 0.39963-0.28594 =
0.39619-0.28594 1.0955t0.28594 1.099q0.28939 0.39619 0.79237 0.39619 0.5029=
8 0 0.78893-0.39619 0.28939-0.39963 0.28939-1.099zm-2.1566-1.347q0.19982-0.=
34451 0.50298-0.50988 0.30661-0.16881 0.73036-0.16881 0.7028 0 1.1403 0.558=
11 0.44097 0.55811 0.44097 1.4676t-0.44097 1.4676q-0.43753 0.55811-1.1403 0=
.55811-0.42375 0-0.73036-0.16536-0.30317-0.16881-0.50298-0.51332v0.57878h-0=
.63734v-5.3606h0.63734z&quot;/&gt;&lt;path id=3D&quot;path91&quot; d=3D&quo=
t;m-41.756-21.518h0.6339v5.3606h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path=
93&quot; d=3D&quot;m-39.819-21.518h0.63734v3.166l1.8914-1.664h0.8096l-2.046=
4 1.8052 2.1325 2.0533h-0.82682l-1.9603-1.8845v1.8845h-0.63734z&quot;/&gt;&=
lt;/g&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect23797&quot; x=3D&quot;.26458&quo=
t; y=3D&quot;.26458&quot; width=3D&quot;76.401&quot; height=3D&quot;83.942&=
quot; rx=3D&quot;6.3061&quot; ry=3D&quot;5.4057&quot; fill=3D&quot;none&quo=
t; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#802400&quot; stroke-das=
harray=3D&quot;2.11666, 2.11666&quot; stroke-linecap=3D&quot;round&quot; st=
roke-width=3D&quot;.52917&quot;/&gt;&lt;path id=3D&quot;path24007&quot; d=
=3D&quot;m32.315 80.657v10.837&quot; fill=3D&quot;none&quot; marker-end=3D&=
quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arrow2Mstart)&quot; s=
troke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833, 1.05833&quot; st=
roke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;=
&lt;path id=3D&quot;path25180&quot; d=3D&quot;m32.315 52.012v9.2246&quot; f=
ill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-sta=
rt=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dashar=
ray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.52917&quot; style=
=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path25334&quot; d=
=3D&quot;m32.315 19.127v13.399&quot; fill=3D&quot;none&quot; marker-end=3D&=
quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arrow2Mstart)&quot; s=
troke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833, 1.05833&quot; st=
roke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;=
&lt;rect id=3D&quot;rect35415&quot; x=3D&quot;17.503&quot; y=3D&quot;71.251=
&quot; width=3D&quot;29.634&quot; height=3D&quot;8.4415&quot; fill=3D&quot;=
#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=3D&quot;#000000&quot;=
 stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=
=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text35918&quot; stroke-width=3D&qu=
ot;.26458px&quot; aria-label=3D&quot;prot-node&quot;&gt;&lt;path id=3D&quot=
;path131&quot; d=3D&quot;m21.06 76.592v1.4325h-0.44614v-3.7283h0.44614v0.40=
997q0.13987-0.24116 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817 0.49196=
 0 0.79823 0.39067 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-0.30627 =
0.39067-0.79823 0.39067-0.29662 0-0.51125-0.11576-0.21222-0.11817-0.35209-0=
.35932zm1.5096-0.94292q0-0.48955-0.20257-0.76688-0.20016-0.27974-0.55225-0.=
27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.2=
0257 0.27733 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.20257-0.7692=
9z&quot;/&gt;&lt;path id=3D&quot;path133&quot; d=3D&quot;m25.331 74.711q-0.=
07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.3762 0-0.57878=
 0.24598-0.20016 0.24357-0.20016 0.70177v1.4228h-0.44614v-2.701h0.44614v0.4=
1961q0.13987-0.24598 0.36415-0.36415 0.22428-0.12058 0.54501-0.12058 0.0458=
2 0 0.10129 0.0072 0.05547 0.0048 0.12299 0.01688z&quot;/&gt;&lt;path id=3D=
&quot;path135&quot; d=3D&quot;m26.735 74.608q-0.35691 0-0.56431 0.27974-0.2=
074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0=
.3545 0 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.75964-0.2074-0.2821=
5-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 =
1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.9=
1157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038=
-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path137&quot; d=3D&qu=
ot;m29.149 73.53v0.76688h0.91398v0.34486h-0.91398v1.4662q0 0.33038 0.08923 =
0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366 0=
-0.709-0.19051-0.19534-0.19292-0.19534-0.69935v-1.4662h-0.32556v-0.34486h0.=
32556v-0.76688z&quot;/&gt;&lt;path id=3D&quot;path139&quot; d=3D&quot;m30.4=
22 75.447h1.2998v0.3955h-1.2998z&quot;/&gt;&lt;path id=3D&quot;path141&quot=
; d=3D&quot;m34.674 75.367v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.5739=
5t-0.44855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h-0.44614=
v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.4=
992-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z&quot=
;/&gt;&lt;path id=3D&quot;path143&quot; d=3D&quot;m36.605 74.608q-0.35691 0=
-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.277=
33 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.20739-0.27974 0.20739-0.76206 =
0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 =
0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.330=
38 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1=
.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt=
;path id=3D&quot;path145&quot; d=3D&quot;m40.358 74.707v-1.4614h0.44373v3.7=
524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.511=
25 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627=
-1.0273q0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0=
.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.=
27733 0.55466 0.27733 0.35209 0 0.55466-0.27733 0.20257-0.27974 0.20257-0.7=
6929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.27974-0.35209 0-0.55466 0.=
27974-0.20016 0.27733-0.20016 0.76688z&quot;/&gt;&lt;path id=3D&quot;path14=
7&quot; d=3D&quot;m44.026 75.536v0.21704h-2.0402q0.02894 0.4582 0.27492 0.6=
9936 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.062=
7 0.47749-0.1881v0.41961q-0.23874 0.10128-0.48955 0.15434-0.2508 0.05305-0.=
50884 0.05305-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 =
0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.=
31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.5=
8119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20=
981-0.25563 0.59083z&quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect38770&quot=
; x=3D&quot;17.503&quot; y=3D&quot;42.585&quot; width=3D&quot;29.634&quot; =
height=3D&quot;8.4415&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;eveno=
dd&quot; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-=
linecap=3D&quot;round&quot; stroke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D=
&quot;text38774&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quo=
t;fmt-node&quot;&gt;&lt;path id=3D&quot;path107&quot; d=3D&quot;m22.93 44.7=
74v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 0.09646-0.09164 0.347=
26v0.23875h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-0.34485=
h0.42444v-0.1881q0-0.45096 0.20981-0.65595 0.20981-0.2074 0.66559-0.2074z&q=
uot;/&gt;&lt;path id=3D&quot;path109&quot; d=3D&quot;m25.405 46.343q0.1664-=
0.29904 0.39791-0.44132 0.23151-0.14228 0.54501-0.14228 0.42202 0 0.65112 0=
.29662 0.2291 0.29421 0.2291 0.83922v1.6302h-0.44614v-1.6158q0-0.38826-0.13=
746-0.57636-0.13746-0.1881-0.41961-0.1881-0.34485 0-0.54501 0.2291t-0.20016=
 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0.=
42444-0.1881-0.34003 0-0.54019 0.23151-0.20016 0.2291-0.20016 0.62218v1.526=
5h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839 0.36415-0.36656t0.50402-0=
.11817q0.29421 0 0.49919 0.14952 0.2074 0.14952 0.30627 0.43408z&quot;/&gt;=
&lt;path id=3D&quot;path111&quot; d=3D&quot;m28.552 45.058v0.76688h0.91398v=
0.34485h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0=
.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19292-0.=
19534-0.69935v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z&quot;/&gt;&lt;pat=
h id=3D&quot;path113&quot; d=3D&quot;m29.825 46.975h1.2998v0.3955h-1.2998z&=
quot;/&gt;&lt;path id=3D&quot;path115&quot; d=3D&quot;m34.077 46.896v1.6302=
h-0.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14952-0.19051-0.44855-0.19051=
-0.35932 0-0.56672 0.2291-0.2074 0.2291-0.2074 0.6246v1.5265h-0.44614v-2.70=
1h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.49919-0=
.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z&quot;/&gt=
;&lt;path id=3D&quot;path117&quot; d=3D&quot;m36.008 46.136q-0.35691 0-0.56=
431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.=
56672 0.27733 0.3545 0 0.5619-0.27974t0.2074-0.76206q0-0.4799-0.2074-0.7596=
4-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 =
0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.376=
2-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797=
-1.0418 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path11=
9&quot; d=3D&quot;m39.761 46.235v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-=
0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.=
79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0.39067=
 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm=
-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733 0=
.35209 0 0.55466-0.27733 0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-=
0.20257-0.27974-0.55466-0.27974-0.35209 0-0.55466 0.27974-0.20016 0.27733-0=
.20016 0.76688z&quot;/&gt;&lt;path id=3D&quot;path121&quot; d=3D&quot;m43.4=
29 47.065v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69936 0.24839 0.23874 0.=
68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.4196=
1q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05305-0.50884 0.05305-0.6463 0-=
1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-=
0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 0.31833 0=
.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704-0.=
52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z&qu=
ot;/&gt;&lt;/g&gt;&lt;g id=3D&quot;g4466&quot; transform=3D&quot;translate(=
1.1863 -2.0666)&quot;&gt;&lt;rect id=3D&quot;rect951&quot; x=3D&quot;61.379=
&quot; y=3D&quot;16.76&quot; width=3D&quot;28.304&quot; height=3D&quot;19.9=
96&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=
=3D&quot;#000000&quot; stroke=3D&quot;#808080&quot; stroke-width=3D&quot;.5=
2917&quot;/&gt;&lt;g id=3D&quot;text955&quot; fill=3D&quot;#808080&quot; st=
roke-width=3D&quot;.26458px&quot; aria-label=3D&quot;NBD server&quot;&gt;&l=
t;path id=3D&quot;path56&quot; d=3D&quot;m68.257 20.548h0.93707l2.2807 4.30=
29v-4.3029h0.67524v5.1435h-0.93707l-2.2807-4.3029v4.3029h-0.67524z&quot;/&g=
t;&lt;path id=3D&quot;path58&quot; d=3D&quot;m74.231 23.235v1.8845h1.1162q0=
.56155 0 0.83027-0.23082 0.27216-0.23427 0.27216-0.71314 0-0.48231-0.27216-=
0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1153v1.5503h1.0301q0.50988 0 0=
.75792-0.18948 0.25149-0.19293 0.25149-0.58567 0-0.3893-0.25149-0.58222-0.2=
4805-0.19293-0.75792-0.19293zm-0.69591-0.57189h1.7777q0.79582 0 1.2265 0.33=
073 0.43064 0.33073 0.43064 0.94051 0 0.47198-0.22049 0.75103-0.22049 0.279=
05-0.64768 0.34796 0.51332 0.11024 0.79582 0.46164 0.28594 0.34796 0.28594 =
0.87161 0 0.68902-0.46853 1.0645-0.46853 0.37552-1.3333 0.37552h-1.8466z&qu=
ot;/&gt;&lt;path id=3D&quot;path60&quot; d=3D&quot;m79.071 21.12v3.9998h0.8=
406q1.0645 0 1.5572-0.48231 0.49609-0.48231 0.49609-1.5227 0-1.0335-0.49609=
-1.5124-0.49265-0.48231-1.5572-0.48231zm-0.69591-0.57189h1.4297q1.4952 0 2.=
1945 0.62356 0.69936 0.62012 0.69936 1.943 0 1.3298-0.7028 1.9534-0.7028 0.=
62356-2.1911 0.62356h-1.4297z&quot;/&gt;&lt;path id=3D&quot;path62&quot; d=
=3D&quot;m67.297 29.002v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0=
689-0.59945-0.0689-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.4340=
8 0 0.22049 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823=
q0.67524 0.14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-=
0.42719 0.85094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.33=
417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106=
 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-=
0.43408 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.=
05168q-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.=
54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.0516=
8 0.31006 0.05168 0.57189 0.15503z&quot;/&gt;&lt;path id=3D&quot;path64&quo=
t; d=3D&quot;m71.814 30.659v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908=
 0.35485 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0=
.68213-0.26872v0.59945q-0.34106 0.1447-0.69936 0.22049-0.35829 0.07579-0.72=
692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.947=
4 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.=
45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.830=
27-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972=
-0.36518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path66&quot; d=3D&quot;m75.=
09 29.481q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0=
.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8=
585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-=
0.17226 0.06546 0 0.14469 0.01033 0.07924 0.0069 0.1757 0.02412z&quot;/&gt;=
&lt;path id=3D&quot;path68&quot; d=3D&quot;m75.3 28.889h0.67179l1.2058 3.23=
84 1.2058-3.2384h0.6718l-1.4469 3.8585h-0.86127z&quot;/&gt;&lt;path id=3D&q=
uot;path70&quot; d=3D&quot;m83.231 30.659v0.31006h-2.9146q0.04134 0.65457 0=
.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.3=
4451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.1447-0.69936 0.22049-0.3582=
9 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-=
1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2=
299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021=
-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0=
.31695 0.29972-0.36518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path72&quot; =
d=3D&quot;m86.507 29.481q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.=
27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.032=
6h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0=
.17226 0.77859-0.17226 0.06546 0 0.14469 0.01033 0.07924 0.0069 0.1757 0.02=
412z&quot;/&gt;&lt;/g&gt;&lt;/g&gt;&lt;path id=3D&quot;path4501&quot; d=3D&=
quot;m42.542 32.486c0-7.5272 6.2582-7.9595 6.2582-7.9595h12.801&quot; fill=
=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=
=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dasharra=
y=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.52917&quot; style=3D=
&quot;paint-order:normal&quot;/&gt;&lt;/svg&gt;<br>
diff --git a/screenshots/2021-08-18-block-graph-c.svg b/screenshots/2021-08=
-18-block-graph-c.svg<br>
new file mode 100644<br>
index 0000000..bcdf868<br>
--- /dev/null<br>
+++ b/screenshots/2021-08-18-block-graph-c.svg<br>
@@ -0,0 +1,2 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;svg id=3D&quot;svg5&quot; width=3D&quot;46.756mm&quot; height=3D&quot;=
107.74mm&quot; version=3D&quot;1.1&quot; viewBox=3D&quot;0 0 46.756 107.74&=
quot; xmlns=3D&quot;<a href=3D"http://www.w3.org/2000/svg" rel=3D"noreferre=
r" target=3D"_blank">http://www.w3.org/2000/svg</a>&quot;&gt;&lt;defs id=3D=
&quot;defs2&quot;&gt;&lt;marker id=3D&quot;Arrow2Mstart&quot; overflow=3D&q=
uot;visible&quot; orient=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path2465=
1&quot; transform=3D&quot;scale(.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4=
.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D=
&quot;context-stroke&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=
=3D&quot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt=
;marker id=3D&quot;Arrow1Mend&quot; overflow=3D&quot;visible&quot; orient=
=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path26121&quot; transform=3D&quo=
t;scale(-.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.=
7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&quot;context-stroke&qu=
ot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=3D&quot;round&quot; str=
oke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt;/defs&gt;&lt;rect id=3D=
&quot;rect23797&quot; x=3D&quot;.26458&quot; y=3D&quot;9.1324&quot; width=
=3D&quot;46.227&quot; height=3D&quot;70.624&quot; rx=3D&quot;3.8155&quot; r=
y=3D&quot;4.5481&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&q=
uot; stroke=3D&quot;#802400&quot; stroke-dasharray=3D&quot;2.11666, 2.11666=
&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot;=
/&gt;&lt;rect id=3D&quot;rect991&quot; x=3D&quot;6.494&quot; y=3D&quot;29.0=
25&quot; width=3D&quot;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;=
1.7964&quot; ry=3D&quot;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&=
quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&qu=
ot;/&gt;&lt;g id=3D&quot;text3313&quot; stroke-width=3D&quot;.26458px&quot;=
 aria-label=3D&quot;qcow2&quot;&gt;&lt;path id=3D&quot;path54&quot; d=3D&qu=
ot;m13.113 34.046q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619t0=
.79237-0.39619q0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.399=
63-0.79237-0.39963t-0.79237 0.39963q-0.28594 0.39619-0.28594 1.0955zm2.1601=
 1.347q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.6=
9935 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097=
-0.5581 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.5=
0988v-0.58567h0.6339v5.3261h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path56&q=
uot; d=3D&quot;m19.99 32.261v0.59256q-0.26872-0.14814-0.54088-0.22049-0.268=
72-0.07579-0.54432-0.07579-0.61667 0-0.95774 0.39274-0.34106 0.3893-0.34106=
 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.27561 0 0.54432-0.072=
35 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.18604=
-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.54777-0.51332-0.54777-0.=
51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4228-0.54088 0.2928=
3 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z&quot;/&gt;&lt;path id=
=3D&quot;path58&quot; d=3D&quot;m22.587 32.557q-0.50987 0-0.80615 0.39963-0=
.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619=
 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68557-0.29628=
-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744=
t0.47198 1.4883q0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83=
027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.488=
3 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;path id=3D&quot;path60&quot=
; d=3D&quot;m25.04 32.113h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.7923=
7 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l-0.83027-3.1626-0.8337=
1 3.1626h-0.74759z&quot;/&gt;&lt;path id=3D&quot;path62&quot; d=3D&quot;m31=
.868 35.386h2.4288v0.58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.6=
8557-0.69246 0.86127-0.89228 0.33418-0.37552 0.46509-0.6339 0.13436-0.26183=
 0.13436-0.51332 0-0.40997-0.28939-0.66835-0.28594-0.25838-0.74759-0.25838-=
0.32728 0-0.69246 0.11369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.=
16881 0.78548-0.25494 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39=
963 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-=
0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46164 0.47542-1.3022 1.33=
33z&quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect9379&quot; x=3D&quot;6.494&=
quot; y=3D&quot;57.736&quot; width=3D&quot;33.768&quot; height=3D&quot;13.3=
98&quot; rx=3D&quot;1.7964&quot; ry=3D&quot;1.8948&quot; fill=3D&quot;none&=
quot; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-wid=
th=3D&quot;.52917&quot;/&gt;&lt;g id=3D&quot;text9383&quot; stroke-width=3D=
&quot;.26458px&quot; aria-label=3D&quot;file&quot;&gt;&lt;path id=3D&quot;p=
ath82&quot; d=3D&quot;m21.895 61.038v3.8585h-0.63734v-3.3659h-1.7398v3.3659=
h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-0.63045 0.29628-0.93=
018 0.29972-0.30317 0.9164-0.30317h0.63734v0.5271h-0.60634q-0.34106 0-0.475=
42 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106zm-0.63734-1.4952h0.63734v0=
.80271h-0.63734z&quot;/&gt;&lt;path id=3D&quot;path84&quot; d=3D&quot;m23.2=
21 59.536h0.6339v5.3606h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path86&quot;=
 d=3D&quot;m28.482 62.809v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0=
.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.6=
8213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.726=
92 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474=
 0.50988-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.4=
5475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.8302=
7-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-=
0.36518 0.84405z&quot;/&gt;&lt;/g&gt;&lt;g id=3D&quot;g22369&quot; transfor=
m=3D&quot;translate(69.961 29.979)&quot; fill=3D&quot;none&quot; stroke=3D&=
quot;#000&quot; stroke-width=3D&quot;.52917&quot;&gt;&lt;path id=3D&quot;re=
ct18531&quot; d=3D&quot;m-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z=
&quot; stop-color=3D&quot;#000000&quot;/&gt;&lt;path id=3D&quot;path21920&q=
uot; d=3D&quot;m-42.779 58.06v3.41l3.1067 1e-6&quot; stroke-linecap=3D&quot=
;round&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;/g&gt;&lt;g id=
=3D&quot;g25195&quot; transform=3D&quot;translate(75.298 30.046)&quot;&gt;&=
lt;rect id=3D&quot;rect22371&quot; x=3D&quot;-66.56&quot; y=3D&quot;-29.781=
&quot; width=3D&quot;29.28&quot; height=3D&quot;17.692&quot; fill=3D&quot;#=
fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=3D&quot;#000000&quot; =
stroke=3D&quot;#808080&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;g id=
=3D&quot;text22477&quot; fill=3D&quot;#808080&quot; stroke-width=3D&quot;.2=
6458px&quot; aria-label=3D&quot;NBD server&quot;&gt;&lt;path id=3D&quot;pat=
h35&quot; d=3D&quot;m-59.195-27.145h0.93707l2.2807 4.3029v-4.3029h0.67524v5=
.1435h-0.93707l-2.2807-4.3029v4.3029h-0.67524z&quot;/&gt;&lt;path id=3D&quo=
t;path37&quot; d=3D&quot;m-53.221-24.458v1.8845h1.1162q0.56155 0 0.83027-0.=
23082 0.27216-0.23427 0.27216-0.71314 0-0.48231-0.27216-0.70969-0.26872-0.2=
3082-0.83027-0.23082zm0-2.1153v1.5503h1.0301q0.50988 0 0.75792-0.18948 0.25=
149-0.19292 0.25149-0.58567 0-0.3893-0.25149-0.58222-0.24805-0.19293-0.7579=
2-0.19293zm-0.69591-0.57189h1.7777q0.79582 0 1.2265 0.33073 0.43064 0.33073=
 0.43064 0.94051 0 0.47198-0.22049 0.75103-0.22049 0.27905-0.64768 0.34795 =
0.51332 0.11024 0.79582 0.46164 0.28594 0.34795 0.28594 0.87161 0 0.68902-0=
.46853 1.0645-0.46853 0.37552-1.3333 0.37552h-1.8466z&quot;/&gt;&lt;path id=
=3D&quot;path39&quot; d=3D&quot;m-48.38-26.573v3.9998h0.8406q1.0645 0 1.557=
2-0.48231 0.49609-0.48231 0.49609-1.5227 0-1.0335-0.49609-1.5124-0.49265-0.=
48231-1.5572-0.48231zm-0.69591-0.57189h1.4297q1.4952 0 2.1945 0.62356 0.699=
36 0.62012 0.69936 1.943 0 1.3298-0.7028 1.9534-0.7028 0.62356-2.1911 0.623=
56h-1.4297z&quot;/&gt;&lt;path id=3D&quot;path41&quot; d=3D&quot;m-60.154-1=
8.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.0689=
-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.1688=
1 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0=
.95774 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.85094-0.=
42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.33417-0.05857-0.7062=
4-0.17914v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106 0.08957 0.67524 0=
.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-0.43408 0-0.25838-=
0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q-0.58911-0.1=
2402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.54432 0.38585-0.84=
06 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05168t0.57189 0.15503z=
&quot;/&gt;&lt;path id=3D&quot;path43&quot; d=3D&quot;m-55.638-17.034v0.310=
06h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0=
.36518 0 0.70625-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0=
.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.5=
3744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811=
 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0=
.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.3100=
6-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot;/&gt;&lt;=
path id=3D&quot;path45&quot; d=3D&quot;m-52.361-18.212q-0.1068-0.06201-0.23=
427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.82682 0.3514-0.2859=
4 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.=
3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01=
034 0.07924 0.0069 0.1757 0.02412z&quot;/&gt;&lt;path id=3D&quot;path47&quo=
t; d=3D&quot;m-52.151-18.805h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1=
.4469 3.8585h-0.86128z&quot;/&gt;&lt;path id=3D&quot;path49&quot; d=3D&quot=
;m-44.22-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.3=
4106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.68213-0.268=
72v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579=
-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1=
.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.499=
54 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0=
.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.=
84405z&quot;/&gt;&lt;path id=3D&quot;path51&quot; d=3D&quot;m-40.944-18.212=
q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-=
0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.637=
34v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0=
.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02412z&quot;/&gt;&lt;/g&gt=
;&lt;/g&gt;&lt;path id=3D&quot;path24007&quot; d=3D&quot;m23.373 76.207v10.=
837&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot;=
 marker-start=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; st=
roke-dasharray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.52917&q=
uot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path251=
80&quot; d=3D&quot;m23.373 47.562v9.2246&quot; fill=3D&quot;none&quot; mark=
er-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arrow2Mstar=
t)&quot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833, 1.0583=
3&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&=
quot;/&gt;&lt;path id=3D&quot;path25334&quot; d=3D&quot;m23.373 18.929v9.14=
69&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; =
marker-start=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; str=
oke-dasharray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.52917&qu=
ot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;rect id=3D&quot;rect3541=
5&quot; x=3D&quot;8.5609&quot; y=3D&quot;66.8&quot; width=3D&quot;29.634&qu=
ot; height=3D&quot;8.4415&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;e=
venodd&quot; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#000&quot; str=
oke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.529&quot;/&gt;&lt;g i=
d=3D&quot;text35918&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D=
&quot;prot-node&quot;&gt;&lt;path id=3D&quot;path89&quot; d=3D&quot;m12.118=
 72.142v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116 0.35209-0.3=
5691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067 0.30868 0.39=
067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823 0.39067-0.29662=
 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.4895=
5-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974-0.35209 0-0.55466 0.27974=
-0.20016 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733 0.55466 0.=
27733 0.35209 0 0.55225-0.27733 0.20257-0.27974 0.20257-0.76929z&quot;/&gt;=
&lt;path id=3D&quot;path91&quot; d=3D&quot;m16.389 70.261q-0.07476-0.04341-=
0.16399-0.0627-0.08682-0.0217-0.19292-0.0217-0.3762 0-0.57878 0.24598-0.200=
16 0.24357-0.20016 0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0=
.24598 0.36415-0.36415 0.22428-0.12058 0.54502-0.12058 0.04582 0 0.10128 0.=
0072 0.05547 0.0048 0.12299 0.01688z&quot;/&gt;&lt;path id=3D&quot;path93&q=
uot; d=3D&quot;m17.793 70.157q-0.35691 0-0.56431 0.27974-0.20739 0.27733-0.=
20739 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.561=
9-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.20739-0.2=
8215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.330=
38 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-=
0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33=
038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path95&quot; d=3D&=
quot;m20.207 69.08v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.0892=
3 0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366=
 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34485h=
0.32556v-0.76688z&quot;/&gt;&lt;path id=3D&quot;path97&quot; d=3D&quot;m21.=
48 70.997h1.2998v0.3955h-1.2998z&quot;/&gt;&lt;path id=3D&quot;path99&quot;=
 d=3D&quot;m25.732 70.917v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395=
t-0.44855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074 0.6246v1.5265h-0.44614v=
-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.49=
919-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.28698 0.23874 0.84646z&quot=
;/&gt;&lt;path id=3D&quot;path101&quot; d=3D&quot;m27.663 70.157q-0.35691 0=
-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498 0.76447q0.2074 0.2=
7733 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 =
0-0.4799-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0=
.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.3303=
8 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.=
0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;=
path id=3D&quot;path103&quot; d=3D&quot;m31.416 70.256v-1.4614h0.44373v3.75=
24h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.5112=
5 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627-=
1.0273q0.30868-0.39067 0.79823-0.39067 0.29904 0 0.51125 0.11817 0.21463 0.=
11576 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.2=
7733 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.202=
57-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.277=
33-0.20016 0.76688z&quot;/&gt;&lt;path id=3D&quot;path105&quot; d=3D&quot;m=
35.084 71.086v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.2387=
4 0.68971 0.23874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.=
41961q-0.23875 0.10129-0.48955 0.15434-0.2508 0.05306-0.50884 0.05306-0.646=
3 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35=
932-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 0.318=
33 0.95257zm-0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.2170=
4-0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083=
z&quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect38770&quot; x=3D&quot;8.5609&=
quot; y=3D&quot;38.135&quot; width=3D&quot;29.634&quot; height=3D&quot;8.44=
15&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=
=3D&quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;rou=
nd&quot; stroke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text38774&quo=
t; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;fmt-node&quot;&gt=
;&lt;path id=3D&quot;path65&quot; d=3D&quot;m13.988 40.323v0.36897h-0.42444=
q-0.23875 0-0.3328 0.09646-0.09164 0.09646-0.09164 0.34727v0.23874h0.7307v0=
.34485h-0.7307v2.3561h-0.44614v-2.3561h-0.42444v-0.34485h0.42444v-0.1881q0-=
0.45096 0.20981-0.65595 0.20981-0.20739 0.66559-0.20739z&quot;/&gt;&lt;path=
 id=3D&quot;path67&quot; d=3D&quot;m16.463 41.893q0.1664-0.29903 0.39791-0.=
44132 0.23151-0.14228 0.54501-0.14228 0.42202 0 0.65112 0.29662 0.2291 0.29=
421 0.2291 0.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.1374=
6-0.1881-0.41961-0.1881-0.34486 0-0.54502 0.2291t-0.20016 0.6246v1.5265h-0.=
44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0.42444-0.1881-0.340=
03 0-0.54019 0.23151-0.20016 0.2291-0.20016 0.62218v1.5265h-0.44614v-2.701h=
0.44614v0.41961q0.15193-0.24839 0.36415-0.36656 0.21222-0.11817 0.50402-0.1=
1817 0.29421 0 0.4992 0.14952 0.20739 0.14952 0.30627 0.43408z&quot;/&gt;&l=
t;path id=3D&quot;path69&quot; d=3D&quot;m19.61 40.608v0.76688h0.91398v0.34=
485h-0.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.094=
05h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19293-0.1953=
4-0.69936v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z&quot;/&gt;&lt;path id=
=3D&quot;path71&quot; d=3D&quot;m20.883 42.525h1.2998v0.3955h-1.2998z&quot;=
/&gt;&lt;path id=3D&quot;path73&quot; d=3D&quot;m25.135 42.446v1.6302h-0.44=
373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051q-0.35932 0-0.56672 0=
.2291t-0.2074 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357=
 0.37379-0.36415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70418 0.28939 0=
.23875 0.28698 0.23875 0.84646z&quot;/&gt;&lt;path id=3D&quot;path75&quot; =
d=3D&quot;m27.066 41.686q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0=
.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.279=
74 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.20739-0.28215-0.=
5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.04=
18 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157=
-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3=
762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path77&quot; d=3D&quot;m3=
0.819 41.785v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.35=
45 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.3062=
7-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273 0.30868-0.39067 0.79823-0=
.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.=
94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733t0.55466-0.2=
7733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55=
466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688z&quot;/&gt;&l=
t;path id=3D&quot;path79&quot; d=3D&quot;m34.487 42.614v0.21704h-2.0402q0.0=
2894 0.4582 0.27492 0.69935 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.494=
37-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.=
15434-0.2508 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0=
.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.545=
01 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0=
048-0.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.595=
66 0.20981-0.22186 0.20981-0.25563 0.59083z&quot;/&gt;&lt;/g&gt;&lt;/svg&gt=
;<br>
diff --git a/screenshots/2021-08-18-block-graph-d.svg b/screenshots/2021-08=
-18-block-graph-d.svg<br>
new file mode 100644<br>
index 0000000..67c1e81<br>
--- /dev/null<br>
+++ b/screenshots/2021-08-18-block-graph-d.svg<br>
@@ -0,0 +1,2 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;svg id=3D&quot;svg5&quot; width=3D&quot;105.13mm&quot; height=3D&quot;=
108.92mm&quot; version=3D&quot;1.1&quot; viewBox=3D&quot;0 0 105.13 108.92&=
quot; xmlns=3D&quot;<a href=3D"http://www.w3.org/2000/svg" rel=3D"noreferre=
r" target=3D"_blank">http://www.w3.org/2000/svg</a>&quot;&gt;&lt;defs id=3D=
&quot;defs2&quot;&gt;&lt;marker id=3D&quot;Arrow2Mstart&quot; overflow=3D&q=
uot;visible&quot; orient=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path2465=
1&quot; transform=3D&quot;scale(.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4=
.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D=
&quot;context-stroke&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=
=3D&quot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt=
;marker id=3D&quot;Arrow1Mend&quot; overflow=3D&quot;visible&quot; orient=
=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path26121&quot; transform=3D&quo=
t;scale(-.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.=
7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&quot;context-stroke&qu=
ot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=3D&quot;round&quot; str=
oke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt;/defs&gt;&lt;rect id=3D=
&quot;rect23797&quot; x=3D&quot;.26458&quot; y=3D&quot;.26458&quot; width=
=3D&quot;58.32&quot; height=3D&quot;70.624&quot; rx=3D&quot;4.8137&quot; ry=
=3D&quot;4.5481&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&qu=
ot; stroke=3D&quot;#802400&quot; stroke-dasharray=3D&quot;2.11666, 2.11666&=
quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot;/=
&gt;&lt;rect id=3D&quot;rect991&quot; x=3D&quot;6.4942&quot; y=3D&quot;20.1=
57&quot; width=3D&quot;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;=
1.7964&quot; ry=3D&quot;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&=
quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&qu=
ot;/&gt;&lt;g id=3D&quot;text3313&quot; stroke-width=3D&quot;.26458px&quot;=
 aria-label=3D&quot;qcow2&quot;&gt;&lt;path id=3D&quot;path64&quot; d=3D&qu=
ot;m13.113 25.178q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0=
.50298 0 0.79237-0.39619 0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.2=
8939-0.39963-0.79237-0.39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28=
594 1.0955zm2.1601 1.347q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-0=
.73036 0.16536-0.69936 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676t0.43=
753-1.4676q0.44097-0.5581 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30661 0=
.16536 0.50643 0.50988v-0.58567h0.6339v5.3261h-0.6339z&quot;/&gt;&lt;path i=
d=3D&quot;path66&quot; d=3D&quot;m19.99 23.393v0.59256q-0.26872-0.14814-0.5=
4088-0.22049-0.26872-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.39274-0.34=
106 0.3893-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.275=
61 0 0.54433-0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.124=
02-0.55122 0.18604-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.54777-=
0.51332-0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4=
228-0.54088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z&quot=
;/&gt;&lt;path id=3D&quot;path68&quot; d=3D&quot;m22.587 23.69q-0.50988 0-0=
.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.3961=
9 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0=
-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 =
0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.4=
7198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.4685=
3-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt=
;&lt;path id=3D&quot;path70&quot; d=3D&quot;m25.04 23.245h0.6339l0.79237 3.=
011 0.78893-3.011h0.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585=
h-0.74759l-0.83027-3.1626-0.83371 3.1626h-0.74759z&quot;/&gt;&lt;path id=3D=
&quot;path72&quot; d=3D&quot;m31.868 26.518h2.4288v0.58567h-3.266v-0.58567q=
0.39619-0.40997 1.0783-1.099 0.68558-0.69246 0.86128-0.89228 0.33417-0.3755=
2 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.40997-0.28939-0.66835-=
0.28594-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.11369-0.36174 0.11369-0=
.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494 0.36518-0.08613 0.668=
35-0.08613 0.79926 0 1.2747 0.39963 0.47542 0.39963 0.47542 1.068 0 0.31695=
-0.12058 0.60289-0.11713 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.5=
7878-0.46164 0.47542-1.3022 1.3333z&quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot=
;rect9379&quot; x=3D&quot;6.4942&quot; y=3D&quot;48.868&quot; width=3D&quot=
;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;1.7964&quot; ry=3D&quo=
t;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&quot; str=
oke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;g id=3D&qu=
ot;text9383&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;fi=
le&quot;&gt;&lt;path id=3D&quot;path92&quot; d=3D&quot;m21.895 52.17v3.8585=
h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634=
v-0.26872q0-0.63045 0.29628-0.93018 0.29972-0.30317 0.9164-0.30317h0.63734v=
0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.=
34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z&quot;/&gt;&lt;path id=3D&q=
uot;path94&quot; d=3D&quot;m23.221 50.668h0.6339v5.3606h-0.6339z&quot;/&gt;=
&lt;path id=3D&quot;path96&quot; d=3D&quot;m28.482 53.941v0.31006h-2.9146q0=
.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.7=
0624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-0.699=
36 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53744=
-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.51332-0.55811 1.3815-0.55=
811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.1860=
4q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-=
0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot;/&gt;&lt;/g&gt;&lt;g =
id=3D&quot;g22369&quot; transform=3D&quot;translate(69.961 21.111)&quot; fi=
ll=3D&quot;none&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917=
&quot;&gt;&lt;path id=3D&quot;rect18531&quot; d=3D&quot;m-53.494 58.06h10.7=
15l3.1067 3.4104v16.022h-13.822z&quot; stop-color=3D&quot;#000000&quot;/&gt=
;&lt;path id=3D&quot;path21920&quot; d=3D&quot;m-42.779 58.06v3.41l3.1067 1=
e-6&quot; stroke-linecap=3D&quot;round&quot; style=3D&quot;paint-order:norm=
al&quot;/&gt;&lt;/g&gt;&lt;g id=3D&quot;g25195&quot; transform=3D&quot;tran=
slate(110.44 35.205)&quot;&gt;&lt;rect id=3D&quot;rect22371&quot; x=3D&quot=
;-66.56&quot; y=3D&quot;-29.781&quot; width=3D&quot;29.28&quot; height=3D&q=
uot;17.692&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; st=
op-color=3D&quot;#000000&quot; stroke=3D&quot;#808080&quot; stroke-width=3D=
&quot;.52917&quot;/&gt;&lt;g id=3D&quot;text22477&quot; fill=3D&quot;#80808=
0&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;FUSE server&=
quot;&gt;&lt;path id=3D&quot;path43&quot; d=3D&quot;m-60.499-27.145h2.9559v=
0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.69591z&quot;/&gt;&lt;=
path id=3D&quot;path45&quot; d=3D&quot;m-56.519-27.145h0.69936v3.1247q0 0.8=
2682 0.29972 1.192 0.29972 0.36174 0.97152 0.36174 0.66835 0 0.96807-0.3617=
4 0.29972-0.36518 0.29972-1.192v-3.1247h0.69936v3.2108q0 1.006-0.49954 1.51=
93-0.49609 0.51332-1.4676 0.51332-0.97496 0-1.4745-0.51332-0.49609-0.51332-=
0.49609-1.5193z&quot;/&gt;&lt;path id=3D&quot;path47&quot; d=3D&quot;m-48.1=
93-26.976v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.09302-0.67868-0.=
09302-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.=
20326 0.51676 0.20671 0.17226 0.77859 0.27905l0.4203 0.08613q0.77859 0.1481=
4 1.1472 0.52366 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0=
.49954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.08268-0.40997-0.08268-0.8=
5094-0.2446v-0.71658q0.42375 0.23771 0.83027 0.35829 0.40652 0.12058 0.7992=
6 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896=
-0.23427-0.59256-0.23082-0.2136-0.76137-0.3204l-0.42375-0.08268q-0.77859-0.=
15503-1.1265-0.48576-0.34796-0.33073-0.34796-0.91984 0-0.68213 0.47887-1.07=
49 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.06546 0.37552 0.06546=
 0.76826 0.19637z&quot;/&gt;&lt;path id=3D&quot;path49&quot; d=3D&quot;m-46=
.797-27.145h3.2522v0.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495v1.8638h2.6=
183v0.58567h-3.3142z&quot;/&gt;&lt;path id=3D&quot;path51&quot; d=3D&quot;m=
-60.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.599=
45-0.0689-0.47198 0-0.70969 0.14469-0.23427 0.14469-0.23427 0.43408 0 0.220=
49 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 =
0.14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0=
.85094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.33417-0.058=
57-0.70624-0.17914v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106 0.08957 =
0.67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-0.43408 0=
-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.26527l-0.22049-0.05168q-0.=
58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.54432 0.3=
8585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05168t0.57189=
 0.15503z&quot;/&gt;&lt;path id=3D&quot;path53&quot; d=3D&quot;m-55.638-17.=
034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 =
0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-=
0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1=
.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.5133=
2-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1=
.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.751=
03-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot;=
/&gt;&lt;path id=3D&quot;path55&quot; d=3D&quot;m-52.361-18.212q-0.1068-0.0=
6201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0.53744 0-0.82682 0.35=
14-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0=
.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.1=
4469 0.01034 0.07924 0.0069 0.1757 0.02412z&quot;/&gt;&lt;path id=3D&quot;p=
ath57&quot; d=3D&quot;m-52.151-18.805h0.67179l1.2058 3.2384 1.2058-3.2384h0=
.67179l-1.4469 3.8585h-0.86128z&quot;/&gt;&lt;path id=3D&quot;path59&quot; =
d=3D&quot;m-44.22-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.=
35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.08957 0.34451-0.08957 0.68=
213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.7269=
2 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 =
0.50988-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45=
475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.83027=
-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0=
.36518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path61&quot; d=3D&quot;m-40.9=
44-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.03101-0=
.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v-3.8=
585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77859-=
0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02412z&quot;/&gt;=
&lt;/g&gt;&lt;/g&gt;&lt;path id=3D&quot;path24007&quot; d=3D&quot;m23.373 6=
7.339v10.837&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Me=
nd)&quot; marker-start=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000=
&quot; stroke-dasharray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot=
;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quo=
t;path25180&quot; d=3D&quot;m23.373 38.694v9.2246&quot; fill=3D&quot;none&q=
uot; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Ar=
row2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.0583=
3, 1.05833&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-orde=
r:normal&quot;/&gt;&lt;rect id=3D&quot;rect35415&quot; x=3D&quot;8.561&quot=
; y=3D&quot;57.933&quot; width=3D&quot;29.634&quot; height=3D&quot;8.4415&q=
uot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=3D&=
quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&q=
uot; stroke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text35918&quot; s=
troke-width=3D&quot;.26458px&quot; aria-label=3D&quot;prot-node&quot;&gt;&l=
t;path id=3D&quot;path99&quot; d=3D&quot;m12.118 63.274v1.4325h-0.44614v-3.=
7283h0.44614v0.40997q0.13987-0.24116 0.35209-0.35691 0.21463-0.11817 0.5112=
5-0.11817 0.49196 0 0.79823 0.39067 0.30868 0.39067 0.30868 1.0273t-0.30868=
 1.0273q-0.30627 0.39067-0.79823 0.39067-0.29662 0-0.51125-0.11576-0.21222-=
0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.48955-0.20257-0.76688-0.20016-0=
.27974-0.55225-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688t0.=
20016 0.76929q0.20257 0.27733 0.55466 0.27733t0.55225-0.27733q0.20257-0.279=
74 0.20257-0.76929z&quot;/&gt;&lt;path id=3D&quot;path101&quot; d=3D&quot;m=
16.389 61.393q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217=
-0.3762 0-0.57878 0.24598-0.20016 0.24357-0.20016 0.70177v1.4228h-0.44614v-=
2.701h0.44614v0.41961q0.13987-0.24598 0.36415-0.36415 0.22428-0.12058 0.545=
01-0.12058 0.04582 0 0.10129 0.0072 0.05547 0.0048 0.12299 0.01688z&quot;/&=
gt;&lt;path id=3D&quot;path103&quot; d=3D&quot;m17.793 61.29q-0.35691 0-0.5=
6431 0.27974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0=
.56672 0.27733 0.3545 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.47=
99-0.2074-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916=
 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.37=
62-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0=
-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path i=
d=3D&quot;path105&quot; d=3D&quot;m20.207 60.212v0.76688h0.91398v0.34485h-0=
.91398v1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.4=
5579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19292-0.19534-0.69=
935v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z&quot;/&gt;&lt;path id=3D&qu=
ot;path107&quot; d=3D&quot;m21.48 62.129h1.2998v0.3955h-1.2998z&quot;/&gt;&=
lt;path id=3D&quot;path109&quot; d=3D&quot;m25.732 62.049v1.6302h-0.44373v-=
1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.19051q-0.35932 0-0.56672 0.2291=
-0.20739 0.2291-0.20739 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.159=
16-0.24357 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.7041=
8 0.28939 0.23874 0.28698 0.23874 0.84646z&quot;/&gt;&lt;path id=3D&quot;pa=
th111&quot; d=3D&quot;m27.663 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.277=
33-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0=
.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.2074-=
0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.=
33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119=
 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0=
.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path113&quot; d=
=3D&quot;m31.416 61.389v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0=
.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.3=
9067-0.30627-0.39067-0.30627-1.0273t0.30627-1.0273q0.30868-0.39067 0.79823-=
0.39067 0.29903 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0=
.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733 0.35209 0 =
0.55466-0.27733 0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0=
.27974-0.55466-0.27974-0.35209 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.=
76688z&quot;/&gt;&lt;path id=3D&quot;path115&quot; d=3D&quot;m35.084 62.218=
v0.21704h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.23874 0.68971 0.2=
3874 0.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.2387=
4 0.10129-0.48955 0.15434-0.2508 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.=
3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0=
.96704-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-=
0.44373-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.2=
1704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z&quot;/&gt;&=
lt;/g&gt;&lt;rect id=3D&quot;rect38770&quot; x=3D&quot;8.561&quot; y=3D&quo=
t;29.267&quot; width=3D&quot;29.634&quot; height=3D&quot;8.4415&quot; fill=
=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=3D&quot;#000=
000&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stro=
ke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text38774&quot; stroke-wid=
th=3D&quot;.26458px&quot; aria-label=3D&quot;fmt-node&quot;&gt;&lt;path id=
=3D&quot;path75&quot; d=3D&quot;m13.989 31.456v0.36897h-0.42444q-0.23874 0-=
0.3328 0.09646-0.09164 0.09646-0.09164 0.34727v0.23874h0.7307v0.34485h-0.73=
07v2.3561h-0.44614v-2.3561h-0.42444v-0.34485h0.42444v-0.1881q0-0.45096 0.20=
981-0.65595 0.20981-0.20739 0.66559-0.20739z&quot;/&gt;&lt;path id=3D&quot;=
path77&quot; d=3D&quot;m16.463 33.026q0.1664-0.29903 0.39791-0.44132 0.2315=
1-0.14228 0.54501-0.14228 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291 0=
.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-0.4=
1961-0.1881-0.34485 0-0.54501 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.615=
8q0-0.39067-0.13746-0.57636-0.13746-0.1881-0.42444-0.1881-0.34003 0-0.54019=
 0.23151-0.20016 0.2291-0.20016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41=
961q0.15193-0.24839 0.36415-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421=
 0 0.49919 0.14952 0.2074 0.14952 0.30627 0.43408z&quot;/&gt;&lt;path id=3D=
&quot;path79&quot; d=3D&quot;m19.61 31.74v0.76688h0.91398v0.34485h-0.91398v=
1.4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.=
37138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.=
4662h-0.32556v-0.34485h0.32556v-0.76688z&quot;/&gt;&lt;path id=3D&quot;path=
81&quot; d=3D&quot;m20.883 33.657h1.2998v0.3955h-1.2998z&quot;/&gt;&lt;path=
 id=3D&quot;path83&quot; d=3D&quot;m25.135 33.578v1.6302h-0.44373v-1.6158q0=
-0.38344-0.14952-0.57395-0.14952-0.19051-0.44855-0.19051-0.35932 0-0.56672 =
0.2291-0.2074 0.2291-0.2074 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0=
.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.=
70418 0.28939 0.23874 0.28698 0.23874 0.84646z&quot;/&gt;&lt;path id=3D&quo=
t;path85&quot; d=3D&quot;m27.067 32.818q-0.35691 0-0.56431 0.27974-0.2074 0=
.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545=
 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.2=
074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.376=
2 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.5=
8119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.04=
18 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path87&quot=
; d=3D&quot;m30.819 32.917v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.1398=
7 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-=
0.39067-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273 0.30868-0.3=
9067 0.79823-0.39067 0.29904 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.356=
91zm-1.5121 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.277=
33t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.2025=
7-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688=
z&quot;/&gt;&lt;path id=3D&quot;path89&quot; d=3D&quot;m34.487 33.747v0.217=
04h-2.0402q0.02894 0.4582 0.27492 0.69935 0.24839 0.23874 0.68971 0.23874 0=
.25563 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10=
129-0.48955 0.15434-0.2508 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0=
.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704=
-0.39067 0.54501 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.4437=
3-0.13022q-0.0048-0.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0=
.37138 0-0.59566 0.20981-0.22186 0.20981-0.25563 0.59083z&quot;/&gt;&lt;/g&=
gt;&lt;path id=3D&quot;path8203&quot; d=3D&quot;m23.908 19.196c0-8.7692 8.1=
536-8.1536 8.1536-8.1536h10.854&quot; fill=3D&quot;none&quot; marker-end=3D=
&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arrow2Mstart)&quot; =
stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833, 1.05833&quot; s=
troke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt=
;&lt;g id=3D&quot;g9231&quot; transform=3D&quot;translate(128.75 21.111)&qu=
ot; fill=3D&quot;none&quot; stroke=3D&quot;#0081cf&quot; stroke-width=3D&qu=
ot;.52917&quot;&gt;&lt;path id=3D&quot;path9227&quot; d=3D&quot;m-53.494 58=
.06h10.715l3.1067 3.4104v16.022h-13.822z&quot; stop-color=3D&quot;#000000&q=
uot;/&gt;&lt;path id=3D&quot;path9229&quot; d=3D&quot;m-42.779 58.06v3.41l3=
.1067 1e-6&quot; stroke-linecap=3D&quot;round&quot; style=3D&quot;paint-ord=
er:normal&quot;/&gt;&lt;/g&gt;&lt;path id=3D&quot;path9233&quot; d=3D&quot;=
m74.123 14.397c8.7692 0 8.1536 8.1536 8.1536 8.1536v55.724&quot; fill=3D&qu=
ot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quo=
t;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&qu=
ot;1.05833, 1.05833&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;p=
aint-order:normal&quot;/&gt;&lt;g id=3D&quot;text9935&quot; stroke-width=3D=
&quot;.26458px&quot; aria-label=3D&quot;$image_path&quot;&gt;&lt;path id=3D=
&quot;path118&quot; d=3D&quot;m2.3853 105.12v1.4952q0.37896-0.0103 0.59256-=
0.21015 0.2136-0.19981 0.2136-0.54432 0-0.3204-0.19293-0.4961-0.19293-0.179=
14-0.61323-0.2446zm-0.34451-0.65457v-1.4228q-0.35829 0.0138-0.56155 0.2067-=
0.19982 0.19293-0.19982 0.51677 0 0.29628 0.18604 0.46853 0.18948 0.17226 0=
.57533 0.23082zm0.34451 3.6897h-0.34451l-0.00345-1.037q-0.3514-0.0172-0.699=
35-0.0965-0.34451-0.0792-0.68213-0.22049v-0.62012q0.34451 0.2136 0.69246 0.=
32729 0.3514 0.11368 0.69246 0.12057v-1.5778q-0.68902-0.1068-1.037-0.4203-0=
.34795-0.31351-0.34795-0.83027 0-0.54088 0.36174-0.86127 0.36518-0.32384 1.=
0232-0.37208v-0.80959h0.34451l0.00345 0.80959q0.27216 0.0172 0.55122 0.0689=
t0.56844 0.14125v0.596q-0.29283-0.14814-0.57189-0.22738-0.27561-0.0827-0.55=
122-0.0965v1.4848q0.70969 0.10679 1.0818 0.44097 0.37207 0.33417 0.37207 0.=
86472 0 0.53054-0.40308 0.88539-0.39963 0.35484-1.0473 0.38585z&quot;/&gt;&=
lt;path id=3D&quot;path120&quot; d=3D&quot;m5.1311 103.26h1.6226v3.3659h1.2=
575v0.49265h-3.1488v-0.49265h1.2575v-2.8732h-0.98874zm0.98874-1.5021h0.6339=
v0.8027h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path122&quot; d=3D&quot;m10.=
826 103.66q0.11713-0.24805 0.29628-0.36518 0.18259-0.12058 0.43753-0.12058 =
0.46509 0 0.65457 0.36174 0.19292 0.35829 0.19292 1.3539v2.2359h-0.57878v-2=
.2083q0-0.81649-0.09302-1.0129-0.08957-0.19981-0.33073-0.19981-0.27561 0-0.=
37896 0.21359-0.09991 0.21015-0.09991 0.99908v2.2083h-0.57878v-2.2083q0-0.8=
2682-0.09991-1.0198-0.09646-0.19292-0.3514-0.19292-0.25149 0-0.3514 0.21359=
-0.096463 0.21015-0.096463 0.99908v2.2083h-0.57532v-3.8585h0.57533v0.33073q=
0.11369-0.20671 0.2825-0.31351 0.17225-0.11024 0.3893-0.11024 0.26183 0 0.4=
3408 0.12058 0.1757 0.12058 0.27216 0.36518z&quot;/&gt;&lt;path id=3D&quot;=
path124&quot; d=3D&quot;m15.163 105.18h-0.21015q-0.55466 0-0.83716 0.19637-=
0.27905 0.19292-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0=
.58222 0.19292 0.52366 0 0.82338-0.36173 0.29972-0.36518 0.30317-1.006v-0.1=
4125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50=
988-0.30661 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.3341=
8-0.3514-0.89228 0-0.64424 0.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0=
.85094v-0.0999q-0.0034-0.46165-0.23427-0.66835-0.23082-0.21015-0.73725-0.21=
015-0.32384 0-0.65457 0.093t-0.64423 0.27217v-0.6339q0.3514-0.13436 0.67179=
-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.=
14125 0.55122 0.42375 0.13091 0.17225 0.18604 0.42719 0.05512 0.25149 0.055=
12 0.75792z&quot;/&gt;&lt;path id=3D&quot;path126&quot; d=3D&quot;m19.948 1=
05.16q0-0.71314-0.23427-1.0818-0.23082-0.37207-0.67524-0.37207-0.46509 0-0.=
70969 0.37207-0.2446 0.36862-0.2446 1.0818 0 0.71313 0.2446 1.0886 0.24805 =
0.37207 0.71658 0.37207 0.43753 0 0.66835-0.37552 0.23427-0.37551 0.23427-1=
.0852zm0.6339 1.7122q0 0.86817-0.40997 1.316-0.40997 0.44786-1.2058 0.44786=
-0.26183 0-0.54777-0.0482t-0.57189-0.14125v-0.62701q0.33762 0.15848 0.61323=
 0.23427 0.27561 0.0758 0.50643 0.0758 0.51332 0 0.74759-0.27905 0.23427-0.=
27905 0.23427-0.88539v-0.45824q-0.15158 0.32384-0.41341 0.48231-0.26183 0.1=
5848-0.63734 0.15848-0.67524 0-1.0783-0.54088-0.40308-0.54088-0.40308-1.446=
9 0-0.90951 0.40308-1.4504 0.40308-0.54088 1.0783-0.54088 0.37207 0 0.63045=
 0.14814 0.25838 0.14814 0.4203 0.4582v-0.49954h0.6339z&quot;/&gt;&lt;path =
id=3D&quot;path128&quot; d=3D&quot;m25.071 105.03v0.31006h-2.7457v0.0207q0 =
0.63045 0.32728 0.97496 0.33073 0.34451 0.93018 0.34451 0.30317 0 0.6339-0.=
0965 0.33073-0.0965 0.70624-0.29283v0.63045q-0.36174 0.14814-0.69936 0.2204=
8-0.33417 0.0758-0.64768 0.0758-0.89917 0-1.4056-0.53744-0.50643-0.54088-0.=
50643-1.4883 0-0.92329 0.49609-1.4745 0.49609-0.55122 1.3229-0.55122 0.7372=
5 0 1.161 0.49954 0.42719 0.49954 0.42719 1.3643zm-0.6339-0.18604q-0.01378-=
0.5581-0.26527-0.84749-0.24805-0.29283-0.71658-0.29283-0.4582 0-0.75448 0.3=
0317-0.29628 0.30316-0.3514 0.8406z&quot;/&gt;&lt;path id=3D&quot;path130&q=
uot; d=3D&quot;m29.736 108.51v0.27561h-4.2478v-0.27561z&quot;/&gt;&lt;path =
id=3D&quot;path132&quot; d=3D&quot;m31.028 106.64v1.9534h-0.63734v-5.3261h0=
.63734v0.49265q0.15847-0.28595 0.4203-0.43408 0.26527-0.15159 0.60978-0.151=
59 0.69936 0 1.0955 0.54088 0.39963 0.54088 0.39963 1.4986 0 0.94051-0.3996=
3 1.478-0.39963 0.53399-1.0955 0.53399-0.3514 0-0.61667-0.14814-0.26183-0.1=
5159-0.41341-0.43753zm1.8604-1.44q0-0.73725-0.23427-1.1128-0.23082-0.37551-=
0.68902-0.37551-0.46164 0-0.69935 0.37896-0.23771 0.37551-0.23771 1.1093 0 =
0.73036 0.23771 1.1093 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.68902-0.3=
7551 0.23427-0.37552 0.23427-1.1128z&quot;/&gt;&lt;path id=3D&quot;path134&=
quot; d=3D&quot;m36.402 105.18h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 =
0.19292-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222 0=
.19292 0.52366 0 0.82338-0.36173 0.29972-0.36518 0.30317-1.006v-0.14125zm1.=
2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.30=
661 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33418-0.3514=
-0.89228 0-0.64424 0.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0.85094v-=
0.0999q-0.0034-0.46165-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32=
384 0-0.65457 0.093t-0.64423 0.27217v-0.6339q0.3514-0.13436 0.67179-0.19982=
 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.=
55122 0.42375 0.13091 0.17225 0.18604 0.42719 0.05512 0.25149 0.05512 0.757=
92z&quot;/&gt;&lt;path id=3D&quot;path136&quot; d=3D&quot;m40.347 102.17v1.=
0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0.596 0.16192 0.16881 =
0.565 0.16881h0.71314v0.50643h-0.77515q-0.71314 0-1.006-0.28594-0.29283-0.2=
8595-0.29283-0.9853v-2.0946h-1.0301v-0.49265h1.0301v-1.0955z&quot;/&gt;&lt;=
path id=3D&quot;path138&quot; d=3D&quot;m46.1 104.73v2.3909h-0.63734v-2.390=
9q0-0.52021-0.18259-0.76481t-0.57189-0.2446q-0.44442 0-0.68557 0.31695-0.23=
771 0.3135-0.23771 0.90261v2.1808h-0.6339v-5.3606h0.6339v2.0808q0.16881-0.3=
3073 0.4582-0.49954 0.28939-0.17226 0.68557-0.17226 0.58911 0 0.8785 0.3893=
 0.29283 0.38585 0.29283 1.1713z&quot;/&gt;&lt;/g&gt;&lt;g id=3D&quot;text1=
4411&quot; fill=3D&quot;#0081cf&quot; stroke-width=3D&quot;.26458px&quot; a=
ria-label=3D&quot;mount-point&quot;&gt;&lt;path id=3D&quot;path141&quot; d=
=3D&quot;m61.294 103.66q0.11713-0.24805 0.29628-0.36518 0.18259-0.12058 0.4=
3753-0.12058 0.46509 0 0.65457 0.36174 0.19292 0.35829 0.19292 1.3539v2.235=
9h-0.57878v-2.2083q0-0.81649-0.09302-1.0129-0.08957-0.19981-0.33073-0.19981=
-0.27561 0-0.37896 0.21359-0.09991 0.21015-0.09991 0.99908v2.2083h-0.57878v=
-2.2083q0-0.82682-0.09991-1.0198-0.09646-0.19292-0.3514-0.19292-0.25149 0-0=
.3514 0.21359-0.09646 0.21015-0.09646 0.99908v2.2083h-0.57533v-3.8585h0.575=
33v0.33073q0.11369-0.20671 0.2825-0.31351 0.17226-0.11024 0.3893-0.11024 0.=
26183 0 0.43408 0.12058 0.1757 0.12058 0.27216 0.36518z&quot;/&gt;&lt;path =
id=3D&quot;path143&quot; d=3D&quot;m65.335 103.71q-0.48231 0-0.73036 0.3755=
1-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24805 0.37551 0.=
73036 0.37551 0.48576 0 0.73381-0.37551 0.24805-0.37897 0.24805-1.1128 0-0.=
73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.80271 0 1=
.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.4237=
5 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-0.42375-0.52021-0.42375-1=
.509 0-0.9853 0.42375-1.5055t1.2265-0.52021z&quot;/&gt;&lt;path id=3D&quot;=
path145&quot; d=3D&quot;m68.133 105.66v-2.3909h0.6339v2.3909q0 0.52021 0.18=
259 0.76481 0.18604 0.2446 0.57189 0.2446 0.44786 0 0.68557-0.3135 0.23771-=
0.31695 0.23771-0.90606v-2.1808h0.63734v3.8516h-0.63734v-0.57878q-0.16881 0=
.33418-0.46164 0.50643-0.28939 0.17226-0.67868 0.17226-0.59256 0-0.88194-0.=
38585-0.28939-0.3893-0.28939-1.1748z&quot;/&gt;&lt;path id=3D&quot;path147&=
quot; d=3D&quot;m75.33 104.73v2.3909h-0.63734v-2.3909q0-0.52021-0.18259-0.7=
6481-0.18259-0.2446-0.57189-0.2446-0.44442 0-0.68557 0.31695-0.23771 0.3135=
-0.23771 0.90261v2.1808h-0.6339v-3.8585h0.6339v0.57878q0.16881-0.33073 0.45=
82-0.49954 0.28939-0.17226 0.68558-0.17226 0.58911 0 0.8785 0.3893 0.29283 =
0.38585 0.29283 1.1713z&quot;/&gt;&lt;path id=3D&quot;path149&quot; d=3D&qu=
ot;m78.072 102.17v1.0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0.=
596 0.16192 0.16881 0.565 0.16881h0.71314v0.50643h-0.77515q-0.71314 0-1.006=
-0.28594-0.29283-0.28595-0.29283-0.9853v-2.0946h-1.0301v-0.49265h1.0301v-1.=
0955z&quot;/&gt;&lt;path id=3D&quot;path151&quot; d=3D&quot;m81.431 104.91h=
1.7949v0.565h-1.7949z&quot;/&gt;&lt;path id=3D&quot;path153&quot; d=3D&quot=
;m85.744 106.64v1.9534h-0.63734v-5.3261h0.63734v0.49265q0.15847-0.28595 0.4=
203-0.43408 0.26527-0.15159 0.60978-0.15159 0.69936 0 1.0955 0.54088 0.3996=
3 0.54088 0.39963 1.4986 0 0.94051-0.39963 1.478-0.39963 0.53399-1.0955 0.5=
3399-0.3514 0-0.61667-0.14814-0.26183-0.15159-0.41341-0.43753zm1.8604-1.44q=
0-0.73725-0.23427-1.1128-0.23082-0.37551-0.68902-0.37551-0.46164 0-0.69936 =
0.37896-0.23771 0.37551-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.3=
7896 0.69936 0.37896 0.4582 0 0.68902-0.37551 0.23427-0.37552 0.23427-1.112=
8z&quot;/&gt;&lt;path id=3D&quot;path155&quot; d=3D&quot;m90.822 103.71q-0.=
48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1=
128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551 0.24805-0.378=
97 0.24805-1.1128 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551z=
m0-0.53744q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.9887=
4-0.42375 1.509-0.42375 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-0.4=
2375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055t1.2265-0.52021z&quot;/&g=
t;&lt;path id=3D&quot;path157&quot; d=3D&quot;m93.83 103.26h1.6226v3.3659h1=
.2575v0.49265h-3.1488v-0.49265h1.2575v-2.8732h-0.98874zm0.98874-1.5021h0.63=
39v0.8027h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path159&quot; d=3D&quot;m1=
00.82 104.73v2.3909h-0.63735v-2.3909q0-0.52021-0.18259-0.76481-0.18259-0.24=
46-0.57189-0.2446-0.44442 0-0.68558 0.31695-0.23771 0.3135-0.23771 0.90261v=
2.1808h-0.6339v-3.8585h0.6339v0.57878q0.16881-0.33073 0.4582-0.49954 0.2893=
9-0.17226 0.68557-0.17226 0.58911 0 0.8785 0.3893 0.29284 0.38585 0.29284 1=
.1713z&quot;/&gt;&lt;path id=3D&quot;path161&quot; d=3D&quot;m103.56 102.17=
v1.0955h1.4401v0.49265h-1.4401v2.0946q0 0.42719 0.16192 0.596t0.565 0.16881=
h0.71314v0.50643h-0.77515q-0.71314 0-1.006-0.28594-0.29283-0.28595-0.29283-=
0.9853v-2.0946h-1.0301v-0.49265h1.0301v-1.0955z&quot;/&gt;&lt;/g&gt;&lt;/sv=
g&gt;<br>
diff --git a/screenshots/2021-08-18-block-graph-e.svg b/screenshots/2021-08=
-18-block-graph-e.svg<br>
new file mode 100644<br>
index 0000000..4bcc615<br>
--- /dev/null<br>
+++ b/screenshots/2021-08-18-block-graph-e.svg<br>
@@ -0,0 +1,2 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;svg id=3D&quot;svg5&quot; width=3D&quot;195.9mm&quot; height=3D&quot;1=
08.74mm&quot; version=3D&quot;1.1&quot; viewBox=3D&quot;0 0 195.9 108.74&qu=
ot; xmlns=3D&quot;<a href=3D"http://www.w3.org/2000/svg" rel=3D"noreferrer"=
 target=3D"_blank">http://www.w3.org/2000/svg</a>&quot;&gt;&lt;defs id=3D&q=
uot;defs2&quot;&gt;&lt;marker id=3D&quot;Arrow2Mstart&quot; overflow=3D&quo=
t;visible&quot; orient=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path24651&=
quot; transform=3D&quot;scale(.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.0=
177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&q=
uot;context-stroke&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=3D=
&quot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt;ma=
rker id=3D&quot;Arrow1Mend&quot; overflow=3D&quot;visible&quot; orient=3D&q=
uot;auto&quot;&gt;&lt;path id=3D&quot;path26121&quot; transform=3D&quot;sca=
le(-.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.0177 10.926-4.0177c-1.7455 =
2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&quot;context-stroke&quot; f=
ill-rule=3D&quot;evenodd&quot; stroke-linejoin=3D&quot;round&quot; stroke-w=
idth=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt;/defs&gt;&lt;rect id=3D&quot=
;rect23797&quot; x=3D&quot;114.19&quot; y=3D&quot;.26458&quot; width=3D&quo=
t;58.32&quot; height=3D&quot;70.624&quot; rx=3D&quot;5.2917&quot; ry=3D&quo=
t;5.2917&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&quot; str=
oke=3D&quot;#802400&quot; stroke-dasharray=3D&quot;2.11666, 2.11666&quot; s=
troke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt=
;rect id=3D&quot;rect991&quot; x=3D&quot;120.42&quot; y=3D&quot;20.157&quot=
; width=3D&quot;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;1.7964&=
quot; ry=3D&quot;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#0=
00000&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&quot;/&gt=
;&lt;g id=3D&quot;text3313&quot; stroke-width=3D&quot;.26458px&quot; aria-l=
abel=3D&quot;qcow2&quot;&gt;&lt;path id=3D&quot;path89&quot; d=3D&quot;m127=
.04 25.178q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50299 =
0 0.79237-0.39619 0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28938-0.=
39963-0.79237-0.39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0=
955zm2.1601 1.347q-0.19981 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 =
0.16536-0.69935 0-1.1403-0.55811-0.43752-0.55811-0.43752-1.4676t0.43752-1.4=
676q0.44098-0.5581 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30662 0.16536 =
0.50643 0.50988v-0.58567h0.6339v5.3261h-0.6339z&quot;/&gt;&lt;path id=3D&qu=
ot;path91&quot; d=3D&quot;m133.91 23.393v0.59256q-0.26872-0.14814-0.54088-0=
.22049-0.26872-0.07579-0.54432-0.07579-0.61668 0-0.95774 0.39274-0.34107 0.=
3893-0.34107 1.0955t0.34107 1.099q0.34106 0.3893 0.95774 0.3893 0.2756 0 0.=
54432-0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55=
121 0.18604-0.2825 0.06201-0.6029 0.06201-0.87161 0-1.3849-0.54777t-0.51332=
-1.4779q0-0.94396 0.51677-1.4848 0.52021-0.54088 1.4228-0.54088 0.29284 0 0=
.57189 0.06201 0.27905 0.05857 0.54088 0.17914z&quot;/&gt;&lt;path id=3D&qu=
ot;path93&quot; d=3D&quot;m136.51 23.69q-0.50987 0-0.80615 0.39963-0.29628 =
0.39619-0.29628 1.0887t0.29284 1.0921q0.29628 0.39619 0.80959 0.39619 0.506=
43 0 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.4030=
8-0.80271-0.40308zm0-0.53744q0.82683 0 1.2988 0.53744t0.47198 1.4883q0 0.94=
74-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83026 0-1.3022-0.53744-0=
.46854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883 0.47198-0.53744 1.30=
22-0.53744z&quot;/&gt;&lt;path id=3D&quot;path95&quot; d=3D&quot;m138.97 23=
.245h0.6339l0.79237 3.011 0.78893-3.011h0.74759l0.79237 3.011 0.78893-3.011=
h0.6339l-1.0094 3.8585h-0.74758l-0.83027-3.1626-0.83372 3.1626h-0.74758z&qu=
ot;/&gt;&lt;path id=3D&quot;path97&quot; d=3D&quot;m145.79 26.518h2.4288v0.=
58567h-3.266v-0.58567q0.39619-0.40997 1.0783-1.099 0.68558-0.69246 0.86128-=
0.89228 0.33417-0.37552 0.46509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.=
40997-0.28939-0.66835-0.28595-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.1=
1369-0.36174 0.11369-0.77515 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494=
 0.36518-0.08613 0.66835-0.08613 0.79926 0 1.2747 0.39963 0.47542 0.39963 0=
.47542 1.068 0 0.31695-0.12058 0.60289-0.11713 0.2825-0.43063 0.66835-0.086=
1 0.09991-0.54778 0.57878-0.46164 0.47542-1.3022 1.3333z&quot;/&gt;&lt;/g&g=
t;&lt;rect id=3D&quot;rect9379&quot; x=3D&quot;120.42&quot; y=3D&quot;48.86=
8&quot; width=3D&quot;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;1=
.7964&quot; ry=3D&quot;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&q=
uot;#000000&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&quo=
t;/&gt;&lt;g id=3D&quot;text9383&quot; stroke-width=3D&quot;.26458px&quot; =
aria-label=3D&quot;file&quot;&gt;&lt;path id=3D&quot;path117&quot; d=3D&quo=
t;m135.82 52.17v3.8585h-0.63734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.=
60634v-0.49265h0.60634v-0.26872q0-0.63045 0.29628-0.93018 0.29972-0.30317 0=
.91639-0.30317h0.63735v0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13092 0.=
1378-0.13092 0.49609v0.34106zm-0.63734-1.4952h0.63734v0.80271h-0.63734z&quo=
t;/&gt;&lt;path id=3D&quot;path119&quot; d=3D&quot;m137.15 50.668h0.6339v5.=
3606h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path121&quot; d=3D&quot;m142.41=
 53.941v0.31006h-2.9146q0.0413 0.65457 0.39275 0.99908 0.35484 0.34106 0.98=
529 0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957 0.68213-0.26872v0.599=
45q-0.34107 0.14469-0.69936 0.22049-0.35829 0.07579-0.72691 0.07579-0.92329=
 0-1.4642-0.53744-0.53743-0.53744-0.53743-1.4538 0-0.9474 0.50987-1.5021 0.=
51332-0.55811 1.3815-0.55811 0.7786 0 1.2299 0.50298 0.45476 0.49954 0.4547=
6 1.3608zm-0.6339-0.18604q-7e-3 -0.52021-0.29283-0.83027-0.2825-0.31006-0.7=
5103-0.31006-0.53055 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quo=
t;/&gt;&lt;/g&gt;&lt;g id=3D&quot;g22369&quot; transform=3D&quot;translate(=
183.89 21.111)&quot; fill=3D&quot;none&quot; stroke=3D&quot;#aaa&quot; stro=
ke-width=3D&quot;.52917&quot;&gt;&lt;path id=3D&quot;rect18531&quot; d=3D&q=
uot;m-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z&quot; stop-color=3D=
&quot;#000000&quot;/&gt;&lt;path id=3D&quot;path21920&quot; d=3D&quot;m-42.=
779 58.06v3.41l3.1067 1e-6&quot; stroke-linecap=3D&quot;round&quot; style=
=3D&quot;paint-order:normal&quot;/&gt;&lt;/g&gt;&lt;g id=3D&quot;g25195&quo=
t; transform=3D&quot;translate(224.36 35.205)&quot;&gt;&lt;rect id=3D&quot;=
rect22371&quot; x=3D&quot;-66.56&quot; y=3D&quot;-29.781&quot; width=3D&quo=
t;29.28&quot; height=3D&quot;17.692&quot; fill=3D&quot;#fff&quot; fill-rule=
=3D&quot;evenodd&quot; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#808=
080&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;g id=3D&quot;text22477&=
quot; fill=3D&quot;#808080&quot; stroke-width=3D&quot;.26458px&quot; aria-l=
abel=3D&quot;FUSE server&quot;&gt;&lt;path id=3D&quot;path68&quot; d=3D&quo=
t;m-60.499-27.145h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564=
h-0.69591z&quot;/&gt;&lt;path id=3D&quot;path70&quot; d=3D&quot;m-56.519-27=
.145h0.69936v3.1247q0 0.82682 0.29972 1.192 0.29972 0.36174 0.97152 0.36174=
 0.66835 0 0.96807-0.36174 0.29972-0.36518 0.29972-1.192v-3.1247h0.69936v3.=
2108q0 1.006-0.49954 1.5193-0.49609 0.51332-1.4676 0.51332-0.97496 0-1.4745=
-0.51332-0.49609-0.51332-0.49609-1.5193z&quot;/&gt;&lt;path id=3D&quot;path=
72&quot; d=3D&quot;m-48.193-26.976v0.67868q-0.39619-0.18948-0.74759-0.2825-=
0.3514-0.09302-0.67868-0.09302-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.3=
0661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.17226 0.77859 0.27905l0.42=
03 0.08613q0.77859 0.14814 1.1472 0.52366 0.37207 0.37207 0.37207 0.99908 0=
 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.=
08268-0.40997-0.08268-0.85094-0.2446v-0.71658q0.42375 0.23771 0.83027 0.358=
29 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 =
0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.3204l-0.=
42375-0.08268q-0.77859-0.15503-1.1265-0.48576-0.34796-0.33073-0.34796-0.919=
84 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.7372=
5 0.06546 0.37552 0.06546 0.76826 0.19637z&quot;/&gt;&lt;path id=3D&quot;pa=
th74&quot; d=3D&quot;m-46.797-27.145h3.2522v0.58567h-2.5563v1.5227h2.4495v0=
.58567h-2.4495v1.8638h2.6183v0.58567h-3.3142z&quot;/&gt;&lt;path id=3D&quot=
;path76&quot; d=3D&quot;m-60.154-18.691v0.59945q-0.26872-0.1378-0.55811-0.2=
0671-0.28939-0.0689-0.59945-0.0689-0.47198 0-0.70969 0.14469-0.23427 0.1446=
9-0.23427 0.43408 0 0.22049 0.16881 0.34796 0.16881 0.12402 0.67868 0.23771=
l0.21704 0.04823q0.67524 0.14469 0.95774 0.40997 0.28594 0.26183 0.28594 0.=
73381 0 0.53744-0.42719 0.85094-0.42375 0.3135-1.1679 0.3135-0.31006 0-0.64=
768-0.06201-0.33417-0.05857-0.70624-0.17914v-0.65457q0.3514 0.18259 0.69246=
 0.27561 0.34106 0.08957 0.67524 0.08957 0.44786 0 0.68902-0.15158 0.24116-=
0.15503 0.24116-0.43408 0-0.25838-0.1757-0.39619-0.17226-0.1378-0.76137-0.2=
6527l-0.22049-0.05168q-0.58911-0.12402-0.85094-0.37896-0.26183-0.25838-0.26=
183-0.70624 0-0.54432 0.38585-0.8406 0.38585-0.29628 1.0955-0.29628 0.3514 =
0 0.66146 0.05168t0.57189 0.15503z&quot;/&gt;&lt;path id=3D&quot;path78&quo=
t; d=3D&quot;m-55.638-17.034v0.31006h-2.9146q0.04134 0.65457 0.39274 0.9990=
8 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70625-0.08957 0.34451-0.08957 =
0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.07579-0.=
72692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9=
474 0.50987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 =
0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.0069-0.52021-0.29283-0.8=
3027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.299=
72-0.36518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path80&quot; d=3D&quot;m-=
52.361-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27561-0.031=
01-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h-0.63734v=
-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.17226 0.77=
859-0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0.1757 0.02412z&quot;/=
&gt;&lt;path id=3D&quot;path82&quot; d=3D&quot;m-52.151-18.805h0.67179l1.20=
58 3.2384 1.2058-3.2384h0.67179l-1.4469 3.8585h-0.86128z&quot;/&gt;&lt;path=
 id=3D&quot;path84&quot; d=3D&quot;m-44.22-17.034v0.31006h-2.9146q0.04134 0=
.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624-0.0=
8957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69936 0.220=
49-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.53744=
-0.53744-1.4538 0-0.9474 0.50988-1.5021 0.51332-0.55811 1.3815-0.55811 0.77=
859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.006=
9-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 =
0.29972-0.31695 0.29972-0.36518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path=
86&quot; d=3D&quot;m-40.944-18.212q-0.1068-0.06201-0.23427-0.08957-0.12402-=
0.03101-0.27561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.=
0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021=
 0.32039-0.17226 0.77859-0.17226 0.06546 0 0.14469 0.01034 0.07924 0.0069 0=
.1757 0.02412z&quot;/&gt;&lt;/g&gt;&lt;/g&gt;&lt;path id=3D&quot;path24007&=
quot; d=3D&quot;m137.3 67.339v10.837&quot; fill=3D&quot;none&quot; marker-e=
nd=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arrow2Mstart)&q=
uot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833, 1.05833&qu=
ot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot=
;/&gt;&lt;path id=3D&quot;path25180&quot; d=3D&quot;m137.3 38.694v9.2246&qu=
ot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; marke=
r-start=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-d=
asharray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.52917&quot; s=
tyle=3D&quot;paint-order:normal&quot;/&gt;&lt;rect id=3D&quot;rect35415&quo=
t; x=3D&quot;122.49&quot; y=3D&quot;57.933&quot; width=3D&quot;29.634&quot;=
 height=3D&quot;8.4415&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;even=
odd&quot; stop-color=3D&quot;#000000&quot; stroke=3D&quot;#000&quot; stroke=
-linecap=3D&quot;round&quot; stroke-width=3D&quot;.529&quot;/&gt;&lt;g id=
=3D&quot;text35918&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&=
quot;prot-node&quot;&gt;&lt;path id=3D&quot;path124&quot; d=3D&quot;m126.04=
 63.274v1.4325h-0.44614v-3.7283h0.44614v0.40997q0.13987-0.24116 0.35209-0.3=
5691 0.21463-0.11817 0.51125-0.11817 0.49196 0 0.79823 0.39067 0.30868 0.39=
067 0.30868 1.0273t-0.30868 1.0273q-0.30627 0.39067-0.79823 0.39067-0.29662=
 0-0.51125-0.11576-0.21222-0.11817-0.35209-0.35932zm1.5096-0.94292q0-0.4895=
5-0.20257-0.76688-0.20016-0.27974-0.55225-0.27974t-0.55466 0.27974q-0.20016=
 0.27733-0.20016 0.76688t0.20016 0.76929q0.20257 0.27733 0.55466 0.27733t0.=
55225-0.27733q0.20257-0.27974 0.20257-0.76929z&quot;/&gt;&lt;path id=3D&quo=
t;path126&quot; d=3D&quot;m130.31 61.393q-0.0748-0.04341-0.16398-0.0627-0.0=
868-0.0217-0.19293-0.0217-0.3762 0-0.57877 0.24598-0.20016 0.24357-0.20016 =
0.70177v1.4228h-0.44614v-2.701h0.44614v0.41961q0.13987-0.24598 0.36414-0.36=
415 0.22428-0.12058 0.54502-0.12058 0.0458 0 0.10128 0.0072 0.0555 0.0048 0=
.12299 0.01688z&quot;/&gt;&lt;path id=3D&quot;path128&quot; d=3D&quot;m131.=
72 61.29q-0.35692 0-0.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498=
 0.76447q0.20739 0.27733 0.56672 0.27733 0.3545 0 0.56189-0.27974 0.2074-0.=
27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.20739-0.28215-0.56189-0.2821=
5zm0-0.3762q0.57877 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.6631=
8-0.33038 1.0418-0.33039 0.3762-0.90916 0.3762-0.58119 0-0.91158-0.3762-0.3=
2797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33039-0.3762 0.91158=
-0.3762z&quot;/&gt;&lt;path id=3D&quot;path130&quot; d=3D&quot;m134.13 60.2=
12v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.0892 0.42444 0.0916 =
0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.51366 0-0.709-0.19051-0=
.19533-0.19293-0.19533-0.69936v-1.4662h-0.32557v-0.34485h0.32557v-0.76688z&=
quot;/&gt;&lt;path id=3D&quot;path132&quot; d=3D&quot;m135.4 62.129h1.2998v=
0.3955h-1.2998z&quot;/&gt;&lt;path id=3D&quot;path134&quot; d=3D&quot;m139.=
66 62.049v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-0.57395t-0.44855-0.1905=
1q-0.35932 0-0.56672 0.2291-0.20739 0.2291-0.20739 0.6246v1.5265h-0.44614v-=
2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.499=
19-0.12058 0.46544 0 0.70418 0.28939 0.23875 0.28698 0.23875 0.84646z&quot;=
/&gt;&lt;path id=3D&quot;path136&quot; d=3D&quot;m141.59 61.29q-0.35691 0-0=
.56431 0.27974-0.20739 0.27733-0.20739 0.76206t0.20498 0.76447q0.2074 0.277=
33 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.20739-0.27974 0.20739-0.76206 =
0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 =
0.90916 0.3762 0.33039 0.3762 0.33039 1.0418 0 0.66318-0.33039 1.0418-0.330=
38 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1=
.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt=
;path id=3D&quot;path138&quot; d=3D&quot;m145.34 61.389v-1.4614h0.44373v3.7=
524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.511=
25 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273t0.30627=
-1.0273q0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.21463 0=
.11576 0.3545 0.35691zm-1.512 0.94292q0 0.48955 0.20016 0.76929 0.20257 0.2=
7733 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.202=
57-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.277=
33-0.20016 0.76688z&quot;/&gt;&lt;path id=3D&quot;path140&quot; d=3D&quot;m=
149.01 62.218v0.21704h-2.0402q0.0289 0.4582 0.27492 0.69935 0.24839 0.23874=
 0.68971 0.23874 0.25562 0 0.49437-0.0627 0.24115-0.0627 0.47749-0.1881v0.4=
1961q-0.23875 0.10129-0.48955 0.15434-0.2508 0.05306-0.50884 0.05306-0.6463=
 0-1.0249-0.3762-0.3762-0.3762-0.3762-1.0177 0-0.66318 0.35691-1.0514 0.359=
32-0.39067 0.96704-0.39067 0.54501 0 0.86093 0.35209 0.31832 0.34968 0.3183=
2 0.95257zm-0.44372-0.13022q-5e-3 -0.36415-0.20499-0.58119-0.19775-0.21704-=
0.52572-0.21704-0.37138 0-0.59566 0.20981-0.22186 0.20981-0.25562 0.59083z&=
quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect38770&quot; x=3D&quot;122.49&qu=
ot; y=3D&quot;29.267&quot; width=3D&quot;29.634&quot; height=3D&quot;8.4415=
&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=
=3D&quot;#000000&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;rou=
nd&quot; stroke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text38774&quo=
t; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;fmt-node&quot;&gt=
;&lt;path id=3D&quot;path100&quot; d=3D&quot;m127.91 31.456v0.36897h-0.4244=
3q-0.23875 0-0.3328 0.09646-0.0916 0.09646-0.0916 0.34727v0.23874h0.73071v0=
.34485h-0.73071v2.3561h-0.44614v-2.3561h-0.42443v-0.34485h0.42443v-0.1881q0=
-0.45096 0.20981-0.65595 0.2098-0.20739 0.66559-0.20739z&quot;/&gt;&lt;path=
 id=3D&quot;path102&quot; d=3D&quot;m130.39 33.026q0.1664-0.29903 0.39791-0=
.44132 0.23151-0.14228 0.54501-0.14228 0.42203 0 0.65113 0.29662 0.2291 0.2=
9421 0.2291 0.83923v1.6302h-0.44614v-1.6158q0-0.38826-0.13746-0.57636-0.137=
46-0.1881-0.41962-0.1881-0.34485 0-0.54501 0.2291t-0.20016 0.6246v1.5265h-0=
.44614v-1.6158q0-0.39067-0.13746-0.57636-0.13746-0.1881-0.42443-0.1881-0.34=
004 0-0.5402 0.23151-0.20016 0.2291-0.20016 0.62218v1.5265h-0.44614v-2.701h=
0.44614v0.41961q0.15193-0.24839 0.36415-0.36656 0.21222-0.11817 0.50402-0.1=
1817 0.29421 0 0.49919 0.14952 0.2074 0.14952 0.30627 0.43408z&quot;/&gt;&l=
t;path id=3D&quot;path104&quot; d=3D&quot;m133.53 31.74v0.76688h0.91398v0.3=
4485h-0.91398v1.4662q0 0.33038 0.0892 0.42444 0.0916 0.09405 0.36897 0.0940=
5h0.45578v0.37138h-0.45575q-0.51367 0-0.70901-0.19051-0.19533-0.19293-0.195=
33-0.69936v-1.4662h-0.32556v-0.34485h0.32556v-0.76688z&quot;/&gt;&lt;path i=
d=3D&quot;path106&quot; d=3D&quot;m134.81 33.657h1.2998v0.3955h-1.2998z&quo=
t;/&gt;&lt;path id=3D&quot;path108&quot; d=3D&quot;m139.06 33.578v1.6302h-0=
.44373v-1.6158q0-0.38344-0.14952-0.57395-0.14951-0.19051-0.44855-0.19051-0.=
35932 0-0.56672 0.2291-0.20739 0.2291-0.20739 0.6246v1.5265h-0.44614v-2.701=
h0.44614v0.41961q0.15916-0.24357 0.37379-0.36415 0.21704-0.12058 0.4992-0.1=
2058 0.46543 0 0.70417 0.28939 0.23875 0.28698 0.23875 0.84646z&quot;/&gt;&=
lt;path id=3D&quot;path110&quot; d=3D&quot;m140.99 32.818q-0.35691 0-0.5643=
 0.27974-0.2074 0.27733-0.2074 0.76206t0.20499 0.76447q0.20739 0.27733 0.56=
671 0.27733 0.3545 0 0.5619-0.27974 0.20739-0.27974 0.20739-0.76206 0-0.479=
9-0.20739-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916=
 0.3762 0.33039 0.3762 0.33039 1.0418 0 0.66318-0.33039 1.0418-0.33038 0.37=
62-0.90916 0.3762-0.58118 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0=
-0.66559 0.32797-1.0418 0.33039-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path i=
d=3D&quot;path112&quot; d=3D&quot;m144.74 32.917v-1.4614h0.44373v3.7524h-0.=
44373v-0.40514q-0.13987 0.24116-0.3545 0.35932-0.21222 0.11576-0.51125 0.11=
576-0.48955 0-0.79823-0.39067-0.30627-0.39067-0.30627-1.0273 0-0.63665 0.30=
627-1.0273 0.30868-0.39067 0.79823-0.39067 0.29903 0 0.51125 0.11817 0.2146=
3 0.11576 0.3545 0.35691zm-1.512 0.94292q0 0.48955 0.20016 0.76929 0.20257 =
0.27733 0.55466 0.27733t0.55466-0.27733q0.20257-0.27974 0.20257-0.76929t-0.=
20257-0.76688q-0.20257-0.27974-0.55466-0.27974t-0.55466 0.27974q-0.20016 0.=
27733-0.20016 0.76688z&quot;/&gt;&lt;path id=3D&quot;path114&quot; d=3D&quo=
t;m148.41 33.747v0.21704h-2.0402q0.0289 0.4582 0.27492 0.69935 0.24839 0.23=
874 0.68971 0.23874 0.25562 0 0.49437-0.0627 0.24116-0.0627 0.47749-0.1881v=
0.41961q-0.23874 0.10129-0.48955 0.15434-0.2508 0.05306-0.50884 0.05306-0.6=
463 0-1.0249-0.3762-0.37621-0.3762-0.37621-1.0177 0-0.66318 0.35691-1.0514 =
0.35933-0.39067 0.96704-0.39067 0.54502 0 0.86093 0.35209 0.31833 0.34968 0=
.31833 0.95257zm-0.44373-0.13022q-5e-3 -0.36415-0.20498-0.58119-0.19775-0.2=
1704-0.52573-0.21704-0.37138 0-0.59565 0.20981-0.22187 0.20981-0.25563 0.59=
083z&quot;/&gt;&lt;/g&gt;&lt;path id=3D&quot;path8203&quot; d=3D&quot;m137.=
83 19.196c0-8.7692 8.1536-8.1536 8.1536-8.1536h10.854&quot; fill=3D&quot;no=
ne&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url=
(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.=
05833, 1.05833&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-=
order:normal&quot;/&gt;&lt;g id=3D&quot;g9231&quot; transform=3D&quot;trans=
late(186.33 23.805)&quot; fill=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd=
&quot; stroke=3D&quot;#0081cf&quot;&gt;&lt;path id=3D&quot;path9227&quot; d=
=3D&quot;m-53.494 58.06h10.715l3.1067 3.4104v16.022h-13.822z&quot; stop-col=
or=3D&quot;#000000&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;path id=
=3D&quot;path9229&quot; d=3D&quot;m-42.779 58.06v3.41l3.1067 1e-6z&quot; st=
roke-linecap=3D&quot;round&quot; stroke-linejoin=3D&quot;round&quot; stroke=
-width=3D&quot;.529&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;/g=
&gt;&lt;g id=3D&quot;text9935&quot; fill=3D&quot;#0081cf&quot; stroke-width=
=3D&quot;.26458px&quot; aria-label=3D&quot;foo.qcow2&quot;&gt;&lt;path id=
=3D&quot;path143&quot; d=3D&quot;m121.81 101.76v0.5271h-0.72002q-0.34107 0-=
0.47543 0.14125-0.13091 0.1378-0.13091 0.49264v0.34107h1.3264v0.49265h-1.32=
64v3.3659h-0.6339v-3.3659h-1.0301v-0.49265h1.0301v-0.26872q0-0.6339 0.28939=
-0.93362 0.29283-0.29972 0.90951-0.29972z&quot;/&gt;&lt;path id=3D&quot;pat=
h145&quot; d=3D&quot;m124.52 103.71q-0.48231 0-0.73036 0.37551-0.24805 0.37=
552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24805 0.37551 0.73036 0.37551 =
0.48576 0 0.7338-0.37551 0.24805-0.37897 0.24805-1.1128 0-0.73725-0.24805-1=
.1128-0.24804-0.37551-0.7338-0.37551zm0-0.53744q0.80271 0 1.2264 0.52021 0.=
4272 0.52021 0.4272 1.5055 0 0.98874-0.42375 1.509-0.42375 0.51677-1.2299 0=
.51677-0.80271 0-1.2265-0.51677-0.42374-0.52021-0.42374-1.509 0-0.9853 0.42=
374-1.5055 0.42375-0.52021 1.2265-0.52021z&quot;/&gt;&lt;path id=3D&quot;pa=
th147&quot; d=3D&quot;m128.77 103.71q-0.48231 0-0.73036 0.37551-0.24804 0.3=
7552-0.24804 1.1128 0 0.7338 0.24804 1.1128 0.24805 0.37551 0.73036 0.37551=
 0.48576 0 0.73381-0.37551 0.24805-0.37897 0.24805-1.1128 0-0.73725-0.24805=
-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.80271 0 1.2265 0.52021=
 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42374 0.51677-1.2=
299 0.51677-0.8027 0-1.2264-0.51677-0.42375-0.52021-0.42375-1.509 0-0.9853 =
0.42375-1.5055t1.2264-0.52021z&quot;/&gt;&lt;path id=3D&quot;path149&quot; =
d=3D&quot;m132.58 106.07h0.86817v1.0508h-0.86817z&quot;/&gt;&lt;path id=3D&=
quot;path151&quot; d=3D&quot;m136.29 105.21q0 0.73725 0.23082 1.1128 0.2342=
7 0.37551 0.69246 0.37551 0.4582 0 0.69247-0.37551 0.23771-0.37896 0.23771-=
1.1128t-0.23771-1.1093q-0.23427-0.37896-0.69247-0.37896-0.45819 0-0.69246 0=
.37551-0.23082 0.37552-0.23082 1.1128zm1.8535 1.4332q-0.15503 0.28594-0.420=
3 0.44097-0.26183 0.15159-0.60978 0.15159-0.69247 0-1.0955-0.53399-0.39964-=
0.53744-0.39964-1.478 0-0.95774 0.39964-1.4986 0.39963-0.54088 1.0955-0.540=
88 0.34451 0 0.60633 0.15159 0.26528 0.14814 0.42375 0.43408v-0.49265h0.637=
34v5.3261h-0.63734z&quot;/&gt;&lt;path id=3D&quot;path153&quot; d=3D&quot;m=
143.05 106.93q-0.25494 0.14814-0.5271 0.22048-0.26872 0.0758-0.55121 0.0758=
-0.89573 0-1.4022-0.53744-0.50298-0.53743-0.50298-1.4883t0.50298-1.4883q0.5=
0643-0.53744 1.4022-0.53744 0.27905 0 0.54432 0.0724t0.53399 0.22393v0.6649=
q-0.25149-0.22393-0.50643-0.32384-0.25149-0.0999-0.57188-0.0999-0.59601 0-0=
.9164 0.38585t-0.32039 1.1024q0 0.71313 0.32039 1.1024 0.32384 0.38585 0.91=
64 0.38585 0.33072 0 0.59255-0.0999 0.26183-0.10335 0.48576-0.31695z&quot;/=
&gt;&lt;path id=3D&quot;path155&quot; d=3D&quot;m145.76 103.71q-0.48232 0-0=
.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.248=
04 0.37551 0.73036 0.37551 0.48576 0 0.7338-0.37551 0.24805-0.37897 0.24805=
-1.1128 0-0.73725-0.24805-1.1128-0.24804-0.37551-0.7338-0.37551zm0-0.53744q=
0.8027 0 1.2264 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42374 1.=
509-0.42375 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-0.42374-0.52021=
-0.42374-1.509 0-0.9853 0.42374-1.5055 0.42375-0.52021 1.2265-0.52021z&quot=
;/&gt;&lt;path id=3D&quot;path157&quot; d=3D&quot;m147.89 103.26h0.62701l0.=
67179 3.1178 0.55122-1.9913h0.54088l0.55811 1.9913 0.67179-3.1178h0.62701l-=
0.90262 3.8585h-0.60634l-0.61667-2.1153-0.61323 2.1153h-0.60633z&quot;/&gt;=
&lt;path id=3D&quot;path159&quot; d=3D&quot;m153.42 106.54h2.3633v0.58567h-=
3.1247v-0.58567q0.64424-0.67868 1.1266-1.1989t0.6649-0.73381q0.34451-0.4203=
 0.46509-0.67868 0.12058-0.26183 0.12058-0.53399 0-0.43064-0.25494-0.67524-=
0.25149-0.2446-0.69246-0.2446-0.31351 0-0.65802 0.11368-0.34451 0.11369-0.7=
3036 0.34451v-0.7028q0.35485-0.16881 0.69591-0.25493 0.34451-0.0861 0.67869=
-0.0861 0.75447 0 1.2127 0.40308 0.46165 0.39963 0.46165 1.0508 0 0.33073-0=
.15503 0.66146-0.15159 0.33073-0.4961 0.73036-0.19292 0.22393-0.56155 0.620=
12-0.36518 0.39618-1.1162 1.1851z&quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;r=
ect876&quot; x=3D&quot;.26458&quot; y=3D&quot;13.714&quot; width=3D&quot;46=
.311&quot; height=3D&quot;57.175&quot; rx=3D&quot;5.2917&quot; ry=3D&quot;5=
.2917&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&quot; stroke=
=3D&quot;#802400&quot; stroke-dasharray=3D&quot;2.11666, 2.11666&quot; stro=
ke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;re=
ct id=3D&quot;rect878&quot; x=3D&quot;6.5361&quot; y=3D&quot;20.157&quot; w=
idth=3D&quot;33.768&quot; height=3D&quot;13.398&quot; rx=3D&quot;1.7964&quo=
t; ry=3D&quot;1.8948&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#0000=
00&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&quot;/&gt;&l=
t;g id=3D&quot;text882&quot; stroke-width=3D&quot;.26458px&quot; aria-label=
=3D&quot;qcow2&quot;&gt;&lt;path id=3D&quot;path265&quot; d=3D&quot;m13.155=
 25.178q0 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0 0=
.79237-0.39619 0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.399=
63-0.79237-0.39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955=
zm2.1601 1.347q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.1=
6536-0.69936 0-1.1403-0.55811-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676=
q0.44097-0.5581 1.1403-0.5581 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.5=
0643 0.50988v-0.58567h0.6339v5.3261h-0.6339z&quot;/&gt;&lt;path id=3D&quot;=
path267&quot; d=3D&quot;m20.032 23.393v0.59256q-0.26872-0.14814-0.54088-0.2=
2049-0.26872-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.39274-0.34106 0.38=
93-0.34106 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.27561 0 0.5=
4433-0.07235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402-0.551=
22 0.18604-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.54777-0.51332-=
0.54777-0.51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4228-0.54=
088 0.29283 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z&quot;/&gt;&l=
t;path id=3D&quot;path269&quot; d=3D&quot;m22.629 23.69q-0.50988 0-0.80615 =
0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.809=
6 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.6855=
7-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.298=
8 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.=
53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.488=
3 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;pa=
th id=3D&quot;path271&quot; d=3D&quot;m25.082 23.245h0.6339l0.79237 3.011 0=
.78893-3.011h0.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.7=
4759l-0.83027-3.1626-0.83371 3.1626h-0.74759z&quot;/&gt;&lt;path id=3D&quot=
;path273&quot; d=3D&quot;m31.91 26.518h2.4288v0.58567h-3.266v-0.58567q0.396=
19-0.40997 1.0783-1.099 0.68557-0.69246 0.86127-0.89228 0.33418-0.37552 0.4=
6509-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.40997-0.28939-0.66835-0.285=
94-0.25838-0.74759-0.25838-0.32728 0-0.69246 0.11369-0.36174 0.11369-0.7751=
5 0.34451v-0.7028q0.4203-0.16881 0.78548-0.25494 0.36518-0.08613 0.66835-0.=
08613 0.79926 0 1.2747 0.39963 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12=
058 0.60289-0.11713 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-=
0.46164 0.47542-1.3022 1.3333z&quot;/&gt;&lt;/g&gt;&lt;rect id=3D&quot;rect=
884&quot; x=3D&quot;6.5361&quot; y=3D&quot;48.868&quot; width=3D&quot;33.76=
8&quot; height=3D&quot;13.398&quot; rx=3D&quot;1.7964&quot; ry=3D&quot;1.89=
48&quot; fill=3D&quot;none&quot; stop-color=3D&quot;#000000&quot; stroke=3D=
&quot;#000&quot; stroke-width=3D&quot;.52917&quot;/&gt;&lt;g id=3D&quot;tex=
t888&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;file&quot=
;&gt;&lt;path id=3D&quot;path276&quot; d=3D&quot;m21.937 52.17v3.8585h-0.63=
734v-3.3659h-1.7398v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.26=
872q0-0.63045 0.29628-0.93018 0.29972-0.30317 0.9164-0.30317h0.63734v0.5271=
h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106z=
m-0.63734-1.4952h0.63734v0.80271h-0.63734z&quot;/&gt;&lt;path id=3D&quot;pa=
th278&quot; d=3D&quot;m23.263 50.668h0.6339v5.3606h-0.6339z&quot;/&gt;&lt;p=
ath id=3D&quot;path280&quot; d=3D&quot;m28.524 53.941v0.31006h-2.9146q0.041=
34 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 0 0.70624=
-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-0.69935 0=
.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.53744-0.5=
3744-0.53744-1.4538 0-0.9474 0.50988-1.5021 0.51332-0.55811 1.3815-0.55811 =
0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0=
.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.53054 0-0.85=
094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot;/&gt;&lt;/g&gt;&lt;g id=
=3D&quot;g894&quot; transform=3D&quot;translate(70.003 21.111)&quot; fill=
=3D&quot;none&quot; stroke=3D&quot;#000&quot; stroke-width=3D&quot;.52917&q=
uot;&gt;&lt;path id=3D&quot;path890&quot; d=3D&quot;m-53.494 58.06h10.715l3=
.1067 3.4104v16.022h-13.822z&quot; stop-color=3D&quot;#000000&quot;/&gt;&lt=
;path id=3D&quot;path892&quot; d=3D&quot;m-42.779 58.06v3.41l3.1067 1e-6&qu=
ot; stroke-linecap=3D&quot;round&quot; style=3D&quot;paint-order:normal&quo=
t;/&gt;&lt;/g&gt;&lt;path id=3D&quot;path906&quot; d=3D&quot;m23.415 67.339=
v10.837&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&q=
uot; marker-start=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot=
; stroke-dasharray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.529=
17&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;pat=
h908&quot; d=3D&quot;m23.415 38.694v9.2246&quot; fill=3D&quot;none&quot; ma=
rker-end=3D&quot;url(#Arrow1Mend)&quot; marker-start=3D&quot;url(#Arrow2Mst=
art)&quot; stroke=3D&quot;#000&quot; stroke-dasharray=3D&quot;1.05833, 1.05=
833&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:norma=
l&quot;/&gt;&lt;rect id=3D&quot;rect910&quot; x=3D&quot;8.603&quot; y=3D&qu=
ot;57.933&quot; width=3D&quot;29.634&quot; height=3D&quot;8.4415&quot; fill=
=3D&quot;#fff&quot; fill-rule=3D&quot;evenodd&quot; stop-color=3D&quot;#000=
000&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stro=
ke-width=3D&quot;.529&quot;/&gt;&lt;g id=3D&quot;text914&quot; stroke-width=
=3D&quot;.26458px&quot; aria-label=3D&quot;prot-node&quot;&gt;&lt;path id=
=3D&quot;path283&quot; d=3D&quot;m12.16 63.274v1.4325h-0.44614v-3.7283h0.44=
614v0.40997q0.13987-0.24116 0.35209-0.35691 0.21463-0.11817 0.51125-0.11817=
 0.49196 0 0.79823 0.39067 0.30868 0.39067 0.30868 1.0273t-0.30868 1.0273q-=
0.30627 0.39067-0.79823 0.39067-0.29662 0-0.51125-0.11576-0.21222-0.11817-0=
.35209-0.35932zm1.5096-0.94292q0-0.48955-0.20257-0.76688-0.20016-0.27974-0.=
55225-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688t0.20016 0.7=
6929q0.20257 0.27733 0.55466 0.27733t0.55225-0.27733q0.20257-0.27974 0.2025=
7-0.76929z&quot;/&gt;&lt;path id=3D&quot;path285&quot; d=3D&quot;m16.431 61=
.393q-0.07476-0.04341-0.16399-0.0627-0.08682-0.0217-0.19293-0.0217-0.3762 0=
-0.57878 0.24598-0.20016 0.24357-0.20016 0.70177v1.4228h-0.44614v-2.701h0.4=
4614v0.41961q0.13987-0.24598 0.36415-0.36415 0.22428-0.12058 0.54501-0.1205=
8 0.04582 0 0.10129 0.0072 0.05547 0.0048 0.12299 0.01688z&quot;/&gt;&lt;pa=
th id=3D&quot;path287&quot; d=3D&quot;m17.835 61.29q-0.35691 0-0.56431 0.27=
974-0.2074 0.27733-0.2074 0.76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.=
27733 0.3545 0 0.5619-0.27974 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074=
-0.75964-0.2074-0.28215-0.5619-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0=
.33038 0.3762 0.33038 1.0418 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.9091=
6 0.3762-0.58119 0-0.91157-0.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 =
0.32797-1.0418 0.33038-0.3762 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot=
;path289&quot; d=3D&quot;m20.249 60.212v0.76688h0.91398v0.34485h-0.91398v1.=
4662q0 0.33038 0.08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.37=
138h-0.45579q-0.51366 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.46=
62h-0.32556v-0.34485h0.32556v-0.76688z&quot;/&gt;&lt;path id=3D&quot;path29=
1&quot; d=3D&quot;m21.522 62.129h1.2998v0.3955h-1.2998z&quot;/&gt;&lt;path =
id=3D&quot;path293&quot; d=3D&quot;m25.774 62.049v1.6302h-0.44373v-1.6158q0=
-0.38344-0.14952-0.57395t-0.44855-0.19051q-0.35932 0-0.56672 0.2291t-0.2074=
 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.37379-0.36=
415 0.21704-0.12058 0.4992-0.12058 0.46543 0 0.70418 0.28939 0.23874 0.2869=
8 0.23874 0.84646z&quot;/&gt;&lt;path id=3D&quot;path295&quot; d=3D&quot;m2=
7.705 61.29q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.76206t0.2049=
8 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.27974 0.20739-0.=
27974 0.20739-0.76206 0-0.4799-0.20739-0.75964-0.2074-0.28215-0.5619-0.2821=
5zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418 0 0.6631=
8-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0.3762-0.3=
2797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.3762 0.91157=
-0.3762z&quot;/&gt;&lt;path id=3D&quot;path297&quot; d=3D&quot;m31.458 61.3=
89v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.3545 0.35932=
-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.30627-0.39067-=
0.30627-1.0273t0.30627-1.0273q0.30868-0.39067 0.79823-0.39067 0.29903 0 0.5=
1125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.94292q0 0.48955 0.20=
016 0.76929 0.20257 0.27733 0.55466 0.27733 0.35209 0 0.55466-0.27733 0.202=
57-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.55466-0.2797=
4-0.35209 0-0.55466 0.27974-0.20016 0.27733-0.20016 0.76688z&quot;/&gt;&lt;=
path id=3D&quot;path299&quot; d=3D&quot;m35.126 62.218v0.21704h-2.0402q0.02=
894 0.4582 0.27492 0.69935 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.4943=
7-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.1=
5434-0.2508 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0.=
3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.5450=
1 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.00=
48-0.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.5956=
6 0.20981-0.22186 0.20981-0.25563 0.59083z&quot;/&gt;&lt;/g&gt;&lt;rect id=
=3D&quot;rect916&quot; x=3D&quot;8.603&quot; y=3D&quot;29.267&quot; width=
=3D&quot;29.634&quot; height=3D&quot;8.4415&quot; fill=3D&quot;#fff&quot; f=
ill-rule=3D&quot;evenodd&quot; stop-color=3D&quot;#000000&quot; stroke=3D&q=
uot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.529=
&quot;/&gt;&lt;g id=3D&quot;text920&quot; stroke-width=3D&quot;.26458px&quo=
t; aria-label=3D&quot;fmt-node&quot;&gt;&lt;path id=3D&quot;path248&quot; d=
=3D&quot;m14.031 31.456v0.36897h-0.42444q-0.23874 0-0.3328 0.09646-0.09164 =
0.09646-0.09164 0.34727v0.23874h0.7307v0.34485h-0.7307v2.3561h-0.44614v-2.3=
561h-0.42444v-0.34485h0.42444v-0.1881q0-0.45096 0.20981-0.65595 0.20981-0.2=
0739 0.66559-0.20739z&quot;/&gt;&lt;path id=3D&quot;path250&quot; d=3D&quot=
;m16.505 33.026q0.1664-0.29903 0.39791-0.44132 0.23151-0.14228 0.54501-0.14=
228 0.42202 0 0.65112 0.29662 0.2291 0.29421 0.2291 0.83923v1.6302h-0.44614=
v-1.6158q0-0.38826-0.13746-0.57636-0.13746-0.1881-0.41961-0.1881-0.34485 0-=
0.54501 0.2291t-0.20016 0.6246v1.5265h-0.44614v-1.6158q0-0.39067-0.13746-0.=
57636-0.13746-0.1881-0.42444-0.1881-0.34003 0-0.54019 0.23151-0.20016 0.229=
1-0.20016 0.62218v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15193-0.24839 0.=
36415-0.36656 0.21222-0.11817 0.50402-0.11817 0.29421 0 0.49919 0.14952 0.2=
074 0.14952 0.30627 0.43408z&quot;/&gt;&lt;path id=3D&quot;path252&quot; d=
=3D&quot;m19.652 31.74v0.76688h0.91398v0.34485h-0.91398v1.4662q0 0.33038 0.=
08923 0.42444 0.09164 0.09405 0.36897 0.09405h0.45579v0.37138h-0.45579q-0.5=
1366 0-0.709-0.19051-0.19534-0.19293-0.19534-0.69936v-1.4662h-0.32556v-0.34=
485h0.32556v-0.76688z&quot;/&gt;&lt;path id=3D&quot;path254&quot; d=3D&quot=
;m20.925 33.657h1.2998v0.3955h-1.2998z&quot;/&gt;&lt;path id=3D&quot;path25=
6&quot; d=3D&quot;m25.177 33.578v1.6302h-0.44373v-1.6158q0-0.38344-0.14952-=
0.57395-0.14952-0.19051-0.44855-0.19051-0.35932 0-0.56672 0.2291-0.2074 0.2=
291-0.2074 0.6246v1.5265h-0.44614v-2.701h0.44614v0.41961q0.15916-0.24357 0.=
37379-0.36415 0.21704-0.12058 0.49919-0.12058 0.46543 0 0.70418 0.28939 0.2=
3874 0.28698 0.23874 0.84646z&quot;/&gt;&lt;path id=3D&quot;path258&quot; d=
=3D&quot;m27.108 32.818q-0.35691 0-0.56431 0.27974-0.2074 0.27733-0.2074 0.=
76206t0.20498 0.76447q0.2074 0.27733 0.56672 0.27733 0.3545 0 0.5619-0.2797=
4 0.2074-0.27974 0.2074-0.76206 0-0.4799-0.2074-0.75964-0.2074-0.28215-0.56=
19-0.28215zm0-0.3762q0.57878 0 0.90916 0.3762 0.33038 0.3762 0.33038 1.0418=
 0 0.66318-0.33038 1.0418-0.33038 0.3762-0.90916 0.3762-0.58119 0-0.91157-0=
.3762-0.32797-0.37862-0.32797-1.0418 0-0.66559 0.32797-1.0418 0.33038-0.376=
2 0.91157-0.3762z&quot;/&gt;&lt;path id=3D&quot;path260&quot; d=3D&quot;m30=
.861 32.917v-1.4614h0.44373v3.7524h-0.44373v-0.40514q-0.13987 0.24116-0.354=
5 0.35932-0.21222 0.11576-0.51125 0.11576-0.48955 0-0.79823-0.39067-0.30627=
-0.39067-0.30627-1.0273 0-0.63665 0.30627-1.0273 0.30868-0.39067 0.79823-0.=
39067 0.29904 0 0.51125 0.11817 0.21463 0.11576 0.3545 0.35691zm-1.5121 0.9=
4292q0 0.48955 0.20016 0.76929 0.20257 0.27733 0.55466 0.27733t0.55466-0.27=
733q0.20257-0.27974 0.20257-0.76929t-0.20257-0.76688q-0.20257-0.27974-0.554=
66-0.27974t-0.55466 0.27974q-0.20016 0.27733-0.20016 0.76688z&quot;/&gt;&lt=
;path id=3D&quot;path262&quot; d=3D&quot;m34.529 33.747v0.21704h-2.0402q0.0=
2894 0.4582 0.27492 0.69935 0.24839 0.23874 0.68971 0.23874 0.25563 0 0.494=
37-0.0627 0.24116-0.0627 0.47749-0.1881v0.41961q-0.23874 0.10129-0.48955 0.=
15434-0.2508 0.05306-0.50884 0.05306-0.6463 0-1.0249-0.3762-0.3762-0.3762-0=
.3762-1.0177 0-0.66318 0.35691-1.0514 0.35932-0.39067 0.96704-0.39067 0.545=
01 0 0.86093 0.35209 0.31833 0.34968 0.31833 0.95257zm-0.44373-0.13022q-0.0=
048-0.36415-0.20498-0.58119-0.19775-0.21704-0.52572-0.21704-0.37138 0-0.595=
66 0.20981-0.22186 0.20981-0.25563 0.59083z&quot;/&gt;&lt;/g&gt;&lt;g id=3D=
&quot;text934&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;=
foo.qcow2&quot;&gt;&lt;path id=3D&quot;path162&quot; d=3D&quot;m7.9308 101.=
76v0.5271h-0.72003q-0.34106 0-0.47542 0.14125-0.13091 0.1378-0.13091 0.4926=
4v0.34107h1.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.49265h1.=
0301v-0.26872q0-0.6339 0.28939-0.93362 0.29283-0.29972 0.90951-0.29972z&quo=
t;/&gt;&lt;path id=3D&quot;path164&quot; d=3D&quot;m10.639 103.71q-0.48231 =
0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.=
24805 0.37551 0.73036 0.37551 0.48576 0 0.7338-0.37551 0.24805-0.37897 0.24=
805-1.1128 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.7338-0.37551zm0-0.537=
44q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.4237=
5 1.509-0.42375 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-0.42375-0.5=
2021-0.42375-1.509 0-0.9853 0.42375-1.5055t1.2265-0.52021z&quot;/&gt;&lt;pa=
th id=3D&quot;path166&quot; d=3D&quot;m14.886 103.71q-0.48231 0-0.73036 0.3=
7551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805 1.1128 0.24805 0.37551=
 0.73036 0.37551 0.48576 0 0.73381-0.37551 0.24805-0.37897 0.24805-1.1128 0=
-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37551zm0-0.53744q0.80271 =
0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.4=
2375 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677-0.42375-0.52021-0.4237=
5-1.509 0-0.9853 0.42375-1.5055t1.2265-0.52021z&quot;/&gt;&lt;path id=3D&qu=
ot;path168&quot; d=3D&quot;m18.697 106.07h0.86816v1.0508h-0.86816z&quot;/&g=
t;&lt;path id=3D&quot;path170&quot; d=3D&quot;m22.404 105.21q0 0.73725 0.23=
082 1.1128 0.23427 0.37551 0.69246 0.37551t0.69246-0.37551q0.23771-0.37896 =
0.23771-1.1128t-0.23771-1.1093q-0.23427-0.37896-0.69246-0.37896t-0.69246 0.=
37551q-0.23082 0.37552-0.23082 1.1128zm1.8535 1.4332q-0.15503 0.28594-0.420=
3 0.44097-0.26183 0.15159-0.60978 0.15159-0.69246 0-1.0955-0.53399-0.39963-=
0.53744-0.39963-1.478 0-0.95774 0.39963-1.4986 0.39963-0.54088 1.0955-0.540=
88 0.34451 0 0.60634 0.15159 0.26527 0.14814 0.42375 0.43408v-0.49265h0.637=
34v5.3261h-0.63734z&quot;/&gt;&lt;path id=3D&quot;path172&quot; d=3D&quot;m=
29.163 106.93q-0.25494 0.14814-0.5271 0.22048-0.26872 0.0758-0.55122 0.0758=
-0.89573 0-1.4022-0.53744-0.50298-0.53743-0.50298-1.4883t0.50298-1.4883q0.5=
0643-0.53744 1.4022-0.53744 0.27905 0 0.54432 0.0724 0.26527 0.0724 0.53399=
 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25149-0.0999-0.57189-0.0=
999-0.596 0-0.9164 0.38585t-0.32039 1.1024q0 0.71313 0.32039 1.1024 0.32384=
 0.38585 0.9164 0.38585 0.33073 0 0.59256-0.0999 0.26183-0.10335 0.48576-0.=
31695z&quot;/&gt;&lt;path id=3D&quot;path174&quot; d=3D&quot;m31.878 103.71=
q-0.48231 0-0.73036 0.37551-0.24805 0.37552-0.24805 1.1128 0 0.7338 0.24805=
 1.1128 0.24805 0.37551 0.73036 0.37551 0.48576 0 0.73381-0.37551 0.24805-0=
.37897 0.24805-1.1128 0-0.73725-0.24805-1.1128-0.24805-0.37551-0.73381-0.37=
551zm0-0.53744q0.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.=
98874-0.42375 1.509-0.42375 0.51677-1.2299 0.51677-0.80271 0-1.2265-0.51677=
-0.42375-0.52021-0.42375-1.509 0-0.9853 0.42375-1.5055t1.2265-0.52021z&quot=
;/&gt;&lt;path id=3D&quot;path176&quot; d=3D&quot;m34.003 103.26h0.62701l0.=
67179 3.1178 0.55122-1.9913h0.54088l0.55811 1.9913 0.67179-3.1178h0.62701l-=
0.90262 3.8585h-0.60634l-0.61667-2.1153-0.61323 2.1153h-0.60634z&quot;/&gt;=
&lt;path id=3D&quot;path178&quot; d=3D&quot;m39.536 106.54h2.3633v0.58567h-=
3.1247v-0.58567q0.64423-0.67868 1.1265-1.1989 0.48231-0.52021 0.6649-0.7338=
1 0.34451-0.4203 0.46509-0.67868 0.12058-0.26183 0.12058-0.53399 0-0.43064-=
0.25494-0.67524-0.25149-0.2446-0.69246-0.2446-0.3135 0-0.65801 0.11368-0.34=
451 0.11369-0.73036 0.34451v-0.7028q0.35484-0.16881 0.69591-0.25493 0.34451=
-0.0861 0.67868-0.0861 0.75448 0 1.2127 0.40308 0.46164 0.39963 0.46164 1.0=
508 0 0.33073-0.15503 0.66146-0.15158 0.33073-0.49609 0.73036-0.19293 0.223=
93-0.56155 0.62012-0.36518 0.39618-1.1162 1.1851z&quot;/&gt;&lt;/g&gt;&lt;p=
ath id=3D&quot;path3010&quot; d=3D&quot;m188.01 14.34c8.4834 0 7.5897 6.511=
8 7.5897 6.5118v64.293c0 7.1845-7.0725 6.5115-7.0725 6.5115h-40.896&quot; f=
ill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; marker-sta=
rt=3D&quot;url(#Arrow2Mstart)&quot; stroke=3D&quot;#000&quot; stroke-dashar=
ray=3D&quot;1.05833, 1.05833&quot; stroke-width=3D&quot;.52917&quot; style=
=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path5636&quot; d=
=3D&quot;m52.435 42.311h54.899&quot; fill=3D&quot;none&quot; marker-end=3D&=
quot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quo=
t;round&quot; stroke-width=3D&quot;1.0583&quot; style=3D&quot;paint-order:n=
ormal&quot;/&gt;&lt;g id=3D&quot;text10276&quot; stroke-width=3D&quot;.2645=
8px&quot; aria-label=3D&quot;Exporting foo.qcow2=C2=A0 via FUSE on itself&q=
uot;&gt;&lt;path id=3D&quot;path181&quot; d=3D&quot;m64.283 22.613h3.2522v0=
.58567h-2.5563v1.5227h2.4495v0.58567h-2.4495v1.8638h2.6183v0.58567h-3.3142z=
&quot;/&gt;&lt;path id=3D&quot;path183&quot; d=3D&quot;m71.92 23.898-1.3953=
 1.8776 1.4676 1.9809h-0.74759l-1.1231-1.5158-1.1231 1.5158h-0.74759l1.4986=
-2.0188-1.3711-1.8397h0.74759l1.0232 1.3746 1.0232-1.3746z&quot;/&gt;&lt;pa=
th id=3D&quot;path185&quot; d=3D&quot;m73.502 27.178v2.0464h-0.63734v-5.326=
1h0.63734v0.58567q0.19982-0.34451 0.50298-0.50987 0.30661-0.16881 0.73036-0=
.16881 0.7028 0 1.1403 0.55811 0.44097 0.55811 0.44097 1.4676 0 0.9095-0.44=
097 1.4676-0.43753 0.55811-1.1403 0.55811-0.42375 0-0.73036-0.16536-0.30317=
-0.16881-0.50298-0.51332zm2.1566-1.347q0-0.69936-0.28939-1.0955-0.28594-0.3=
9963-0.78893-0.39963t-0.79237 0.39963q-0.28594 0.39619-0.28594 1.0955 0 0.6=
9935 0.28594 1.099 0.28939 0.39619 0.79237 0.39619t0.78893-0.39619q0.28939-=
0.39963 0.28939-1.099z&quot;/&gt;&lt;path id=3D&quot;path187&quot; d=3D&quo=
t;m78.862 24.343q-0.50988 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 =
0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0=
.39963 0.29628-0.39963 0.29628-1.0886 0-0.68558-0.29628-1.0852-0.29628-0.40=
308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744 0.47198 0.53744 0.4=
7198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 =
0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.=
47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;path id=3D&quot;path189&quot; d=
=3D&quot;m83.92 24.491q-0.1068-0.06201-0.23427-0.08957-0.12402-0.03101-0.27=
561-0.03101-0.53744 0-0.82682 0.3514-0.28594 0.34796-0.28594 1.0025v2.0326h=
-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021 0.32039-0.1=
7226 0.77859-0.17226 0.06546 0 0.14469 0.01033 0.07924 0.0069 0.1757 0.0241=
2z&quot;/&gt;&lt;path id=3D&quot;path191&quot; d=3D&quot;m85.212 22.803v1.0=
955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436=
 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.7338 0-1.0129-0.27216-0.27905-0=
.27561-0.27905-0.99908v-2.0946h-0.46509v-0.49265h0.46509v-1.0955z&quot;/&gt=
;&lt;path id=3D&quot;path193&quot; d=3D&quot;m87.351 23.898h0.6339v3.8585h-=
0.6339zm0-1.5021h0.6339v0.80271h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path=
195&quot; d=3D&quot;m92.519 25.428v2.3289h-0.6339v-2.3082q0-0.54777-0.2136-=
0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 0.=
89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34796 0.53399-0.520=
21 0.31006-0.17226 0.71314-0.17226 0.6649 0 1.006 0.41341 0.34106 0.40997 0=
.34106 1.2092z&quot;/&gt;&lt;path id=3D&quot;path197&quot; d=3D&quot;m96.32=
2 25.783q0-0.68902-0.28594-1.068-0.2825-0.37896-0.79582-0.37896-0.50987 0-0=
.79582 0.37896-0.2825 0.37896-0.2825 1.068 0 0.68558 0.2825 1.0645 0.28594 =
0.37896 0.79582 0.37896 0.51332 0 0.79582-0.37896 0.28594-0.37896 0.28594-1=
.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642-0.43753 0.48231-1.3401 0.48231=
-0.33418 0-0.63045-0.05168-0.29628-0.04823-0.57533-0.15158v-0.61667q0.27905=
 0.15158 0.55122 0.22393 0.27216 0.07235 0.55466 0.07235 0.62356 0 0.93362-=
0.32728 0.31006-0.32384 0.31006-0.98185v-0.3135q-0.19637 0.34106-0.50298 0.=
50987-0.30661 0.16881-0.73381 0.16881-0.70969 0-1.1438-0.54088-0.43408-0.54=
088-0.43408-1.4332 0-0.89572 0.43408-1.4366 0.43408-0.54088 1.1438-0.54088 =
0.42719 0 0.73381 0.16881 0.30661 0.16881 0.50298 0.50987v-0.58567h0.6339z&=
quot;/&gt;&lt;path id=3D&quot;path199&quot; d=3D&quot;m65.127 30.863v0.5271=
h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106h=
1.0439v0.49265h-1.0439v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0=
.26872q0-0.64423 0.29972-0.93707 0.29972-0.29628 0.95085-0.29628z&quot;/&gt=
;&lt;path id=3D&quot;path201&quot; d=3D&quot;m67.152 32.809q-0.50987 0-0.80=
615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0=
.8096 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.=
68558-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1=
.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.4719=
8 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1=
.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&l=
t;path id=3D&quot;path203&quot; d=3D&quot;m71.469 32.809q-0.50988 0-0.80615=
 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.80=
96 0.39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.685=
58-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.29=
88 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0=
.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.48=
83 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;p=
ath id=3D&quot;path205&quot; d=3D&quot;m74.256 35.349h0.72692v0.87506h-0.72=
692z&quot;/&gt;&lt;path id=3D&quot;path207&quot; d=3D&quot;m76.788 34.298q0=
 0.69936 0.28594 1.099 0.28939 0.39619 0.79237 0.39619 0.50298 0 0.79237-0.=
39619 0.28939-0.39963 0.28939-1.099t-0.28939-1.0955q-0.28939-0.39963-0.7923=
7-0.39963-0.50298 0-0.79237 0.39963-0.28594 0.39619-0.28594 1.0955zm2.1601 =
1.347q-0.19982 0.34451-0.50643 0.51332-0.30317 0.16536-0.73036 0.16536-0.69=
936 0-1.1403-0.5581-0.43753-0.55811-0.43753-1.4676t0.43753-1.4676q0.44097-0=
.55811 1.1403-0.55811 0.42719 0 0.73036 0.16881 0.30661 0.16536 0.50643 0.5=
0988v-0.58567h0.6339v5.3261h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path209&=
quot; d=3D&quot;m83.665 32.513v0.59256q-0.26872-0.14814-0.54088-0.22049-0.2=
6872-0.07579-0.54433-0.07579-0.61667 0-0.95774 0.39274-0.34106 0.3893-0.341=
06 1.0955t0.34106 1.099q0.34106 0.3893 0.95774 0.3893 0.27561 0 0.54433-0.0=
7235 0.27216-0.07579 0.54088-0.22393v0.58567q-0.26527 0.12402-0.55122 0.186=
04-0.2825 0.06201-0.60289 0.06201-0.87161 0-1.3849-0.54777-0.51332-0.54777-=
0.51332-1.4779 0-0.94396 0.51676-1.4848 0.52021-0.54088 1.4228-0.54088 0.29=
283 0 0.57189 0.06201 0.27905 0.05857 0.54088 0.17914z&quot;/&gt;&lt;path i=
d=3D&quot;path211&quot; d=3D&quot;m86.262 32.809q-0.50988 0-0.80615 0.39963=
-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.8096 0.396=
19 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68558-0.296=
28-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.537=
44 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1=
.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.9=
5085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;path id=
=3D&quot;path213&quot; d=3D&quot;m88.715 32.365h0.6339l0.79237 3.011 0.7889=
3-3.011h0.74759l0.79237 3.011 0.78893-3.011h0.6339l-1.0094 3.8585h-0.74759l=
-0.83027-3.1626-0.83371 3.1626h-0.74759z&quot;/&gt;&lt;path id=3D&quot;path=
215&quot; d=3D&quot;m95.543 35.638h2.4288v0.58567h-3.266v-0.58567q0.39619-0=
.40997 1.0783-1.099 0.68557-0.69246 0.86127-0.89228 0.33418-0.37552 0.46509=
-0.6339 0.13436-0.26183 0.13436-0.51332 0-0.40997-0.28939-0.66835-0.28594-0=
.25838-0.74759-0.25838-0.32728 0-0.69246 0.11369-0.36174 0.11369-0.77515 0.=
34451v-0.7028q0.4203-0.16881 0.78548-0.25494 0.36518-0.08613 0.66835-0.0861=
3 0.79926 0 1.2747 0.39963 0.47542 0.39963 0.47542 1.068 0 0.31695-0.12058 =
0.60289-0.11713 0.2825-0.43064 0.66835-0.08613 0.09991-0.54777 0.57878-0.46=
164 0.47542-1.3022 1.3333z&quot;/&gt;&lt;path id=3D&quot;path217&quot; d=3D=
&quot;m65.373 49.298h0.67179l1.2058 3.2384 1.2058-3.2384h0.67179l-1.4469 3.=
8585h-0.86128z&quot;/&gt;&lt;path id=3D&quot;path219&quot; d=3D&quot;m70.00=
3 49.298h0.6339v3.8585h-0.6339zm0-1.5021h0.6339v0.80271h-0.6339z&quot;/&gt;=
&lt;path id=3D&quot;path221&quot; d=3D&quot;m73.717 51.217q-0.76826 0-1.064=
5 0.1757-0.29628 0.1757-0.29628 0.59945 0 0.33762 0.22049 0.53744 0.22393 0=
.19637 0.60634 0.19637 0.5271 0 0.84405-0.37207 0.32039-0.37552 0.32039-0.9=
9563v-0.14125zm1.2644-0.26183v2.2014h-0.6339v-0.58567q-0.21704 0.3514-0.540=
88 0.52021-0.32384 0.16536-0.79237 0.16536-0.59256 0-0.94396-0.33073-0.3479=
6-0.33418-0.34796-0.89228 0-0.65112 0.43408-0.98185 0.43753-0.33073 1.3022-=
0.33073h0.88884v-0.06201q0-0.43753-0.28939-0.67524-0.28594-0.24116-0.80615-=
0.24116-0.33073 0-0.64423 0.07924-0.3135 0.07924-0.60289 0.23771v-0.58567q0=
.34796-0.13436 0.67524-0.19982 0.32728-0.0689 0.63734-0.0689 0.83716 0 1.25=
06 0.43408 0.41341 0.43408 0.41341 1.316z&quot;/&gt;&lt;path id=3D&quot;pat=
h223&quot; d=3D&quot;m78.557 48.013h2.9559v0.58567h-2.26v1.5158h2.0395v0.58=
567h-2.0395v2.4564h-0.69591z&quot;/&gt;&lt;path id=3D&quot;path225&quot; d=
=3D&quot;m82.536 48.013h0.69936v3.1247q0 0.82682 0.29972 1.192 0.29972 0.36=
174 0.97152 0.36174 0.66835 0 0.96807-0.36174 0.29972-0.36518 0.29972-1.192=
v-3.1247h0.69936v3.2108q0 1.006-0.49954 1.5193-0.49609 0.51332-1.4676 0.513=
32-0.97496 0-1.4745-0.51332-0.49609-0.51332-0.49609-1.5193z&quot;/&gt;&lt;p=
ath id=3D&quot;path227&quot; d=3D&quot;m90.863 48.182v0.67868q-0.39619-0.18=
948-0.74759-0.2825-0.3514-0.09302-0.67868-0.09302-0.56844 0-0.8785 0.22049-=
0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.17226 0=
.77859 0.27905l0.4203 0.08613q0.77859 0.14814 1.1472 0.52366 0.37207 0.3720=
7 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0.38585-0=
.36518 0-0.77859-0.08268-0.40997-0.08268-0.85094-0.2446v-0.71658q0.42375 0.=
23771 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.234=
27 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23082-0.2136=
-0.76137-0.3204l-0.42375-0.08268q-0.77859-0.15503-1.1265-0.48576-0.34796-0.=
33073-0.34796-0.91984 0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.392=
74 0.36174 0 0.73725 0.06546t0.76826 0.19637z&quot;/&gt;&lt;path id=3D&quot=
;path229&quot; d=3D&quot;m92.258 48.013h3.2522v0.58567h-2.5563v1.5227h2.449=
5v0.58567h-2.4495v1.8638h2.6183v0.58567h-3.3142z&quot;/&gt;&lt;path id=3D&q=
uot;path231&quot; d=3D&quot;m68.644 58.21q-0.50987 0-0.80615 0.39963-0.2962=
8 0.39619-0.29628 1.0887 0 0.69246 0.29283 1.0921 0.29628 0.39619 0.8096 0.=
39619 0.50643 0 0.80271-0.39963 0.29628-0.39963 0.29628-1.0887 0-0.68558-0.=
29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.=
53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.5374=
4-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-=
0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;path i=
d=3D&quot;path233&quot; d=3D&quot;m74.673 59.295v2.3289h-0.6339v-2.3082q0-0=
.54777-0.2136-0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.327=
28-0.29628 0.32728-0.29628 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q=
0.22738-0.34796 0.53399-0.52021 0.31006-0.17226 0.71314-0.17226 0.6649 0 1.=
006 0.41341 0.34106 0.40997 0.34106 1.2092z&quot;/&gt;&lt;path id=3D&quot;p=
ath235&quot; d=3D&quot;m78.18 57.765h0.6339v3.8585h-0.6339zm0-1.5021h0.6339=
v0.80271h-0.6339z&quot;/&gt;&lt;path id=3D&quot;path237&quot; d=3D&quot;m80=
.767 56.67v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12747 0.60634 0=
.13091 0.13436 0.5271 0.13436h0.65112v0.53054h-0.65112q-0.73381 0-1.0129-0.=
27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.49265h0.46509v-1.=
0955z&quot;/&gt;&lt;path id=3D&quot;path239&quot; d=3D&quot;m85.367 57.879v=
0.59945q-0.26872-0.1378-0.55811-0.20671-0.28939-0.0689-0.59945-0.0689-0.471=
98 0-0.70969 0.1447-0.23427 0.14469-0.23427 0.43408 0 0.22049 0.16881 0.347=
96 0.16881 0.12402 0.67868 0.23771l0.21704 0.04823q0.67524 0.14469 0.95774 =
0.40997 0.28594 0.26183 0.28594 0.73381 0 0.53744-0.42719 0.85094-0.42375 0=
.3135-1.1679 0.3135-0.31006 0-0.64768-0.06201-0.33417-0.05857-0.70624-0.179=
15v-0.65457q0.3514 0.18259 0.69246 0.27561 0.34106 0.08957 0.67524 0.08957 =
0.44786 0 0.68902-0.15158 0.24116-0.15503 0.24116-0.43408 0-0.25838-0.1757-=
0.39619-0.17225-0.1378-0.76137-0.26527l-0.22049-0.05168q-0.58911-0.12402-0.=
85094-0.37896-0.26183-0.25838-0.26183-0.70624 0-0.54433 0.38585-0.8406 0.38=
585-0.29628 1.0955-0.29628 0.3514 0 0.66146 0.05168t0.57189 0.15503z&quot;/=
&gt;&lt;path id=3D&quot;path241&quot; d=3D&quot;m89.883 59.536v0.31006h-2.9=
146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34106 0.36518 =
0 0.70624-0.08957 0.34451-0.08957 0.68213-0.26872v0.59945q-0.34106 0.14469-=
0.69936 0.22049-0.35829 0.07579-0.72692 0.07579-0.92329 0-1.4642-0.53744-0.=
53744-0.53744-0.53744-1.4538 0-0.9474 0.50988-1.5021 0.51332-0.55811 1.3815=
-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1.3608zm-0.6339-0=
.18604q-0.0069-0.52021-0.29283-0.83027-0.2825-0.31006-0.75103-0.31006-0.530=
54 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot;/&gt;&lt;path id=
=3D&quot;path243&quot; d=3D&quot;m90.924 56.263h0.6339v5.3606h-0.6339z&quot=
;/&gt;&lt;path id=3D&quot;path245&quot; d=3D&quot;m94.837 56.263v0.5271h-0.=
60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.34106h1.04=
39v0.49265h-1.0439v3.3659h-0.63734v-3.3659h-0.60634v-0.49265h0.60634v-0.268=
72q0-0.64423 0.29972-0.93707 0.29972-0.29628 0.95085-0.29628z&quot;/&gt;&lt=
;/g&gt;&lt;/svg&gt;<br>
diff --git a/screenshots/2021-08-18-root-directory.svg b/screenshots/2021-0=
8-18-root-directory.svg<br>
new file mode 100644<br>
index 0000000..f9449f1<br>
--- /dev/null<br>
+++ b/screenshots/2021-08-18-root-directory.svg<br>
@@ -0,0 +1,2 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;svg id=3D&quot;svg5&quot; width=3D&quot;149.08mm&quot; height=3D&quot;=
64.908mm&quot; version=3D&quot;1.1&quot; viewBox=3D&quot;0 0 149.08 64.908&=
quot; xmlns=3D&quot;<a href=3D"http://www.w3.org/2000/svg" rel=3D"noreferre=
r" target=3D"_blank">http://www.w3.org/2000/svg</a>&quot;&gt;&lt;defs id=3D=
&quot;defs2&quot;&gt;&lt;marker id=3D&quot;Arrow1Mend&quot; overflow=3D&quo=
t;visible&quot; orient=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path26121&=
quot; transform=3D&quot;scale(-.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.=
0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&=
quot;context-stroke&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=
=3D&quot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt=
;marker id=3D&quot;ArrowRedMend&quot; overflow=3D&quot;visible&quot; orient=
=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path53977&quot; transform=3D&quo=
t;scale(.6) rotate(180) translate(0)&quot; d=3D&quot;m8.7186 4.0337-10.926-=
4.0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=
=3D&quot;#0081cf&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=3D&q=
uot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt;/def=
s&gt;&lt;g id=3D&quot;text10527&quot; stroke-width=3D&quot;.26458px&quot; a=
ria-label=3D&quot;/=C2=A0 foo/=C2=A0=C2=A0 =C2=A0a=C2=A0 =C2=A0 b=C2=A0 bar=
/=C2=A0 =C2=A0 c=C2=A0 =C2=A0 d&quot;&gt;&lt;path id=3D&quot;path79&quot; d=
=3D&quot;m5.3131 16.476h0.65457l-2.7078 5.7981h-0.65801z&quot;/&gt;&lt;path=
 id=3D&quot;path81&quot; d=3D&quot;m14.408 23.435v0.5271h-0.72003q-0.34106 =
0-0.47542 0.14125-0.13091 0.1378-0.13091 0.49265v0.34106h1.3264v0.49265h-1.=
3264v3.3659h-0.6339v-3.3659h-1.0301v-0.49265h1.0301v-0.26872q0-0.6339 0.289=
39-0.93362 0.29283-0.29972 0.90951-0.29972z&quot;/&gt;&lt;path id=3D&quot;p=
ath83&quot; d=3D&quot;m17.116 25.381q-0.48231 0-0.73036 0.37552-0.24805 0.3=
7552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.73036 0.3755=
2 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.73725-0.2480=
5-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.80271 0 1.2265 0.5202=
1 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42375 0.51676-1.=
2299 0.51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-0.985=
3 0.42375-1.5055 0.42375-0.52021 1.2265-0.52021z&quot;/&gt;&lt;path id=3D&q=
uot;path85&quot; d=3D&quot;m21.364 25.381q-0.48231 0-0.73036 0.37552-0.2480=
5 0.37552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.73036 0=
.37552 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.73725-0=
.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.80271 0 1.2265 0=
.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42375 0.516=
76-1.2299 0.51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 0-=
0.9853 0.42375-1.5055 0.42375-0.52021 1.2265-0.52021z&quot;/&gt;&lt;path id=
=3D&quot;path87&quot; d=3D&quot;m26.552 23.652h0.65457l-2.7078 5.7981h-0.65=
801z&quot;/&gt;&lt;path id=3D&quot;path89&quot; d=3D&quot;m21.66 34.032h-0.=
21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.57878 0 0.34796 =
0.21015 0.54088 0.21015 0.19293 0.58222 0.19293 0.52365 0 0.82338-0.36174 0=
.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57=
189q-0.20326 0.34451-0.51332 0.50987-0.30661 0.16192-0.74759 0.16192-0.5891=
1 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-0.97841=
 0.43408-0.33417 1.2712-0.33417h0.85094v-0.09991q-0.0034-0.46164-0.23427-0.=
66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.09302-0.33073 0.0=
9302-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0.32384-0.0689 =
0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.55122 0.42375 0.=
13091 0.17226 0.18604 0.42719 0.05512 0.25149 0.05512 0.75792z&quot;/&gt;&l=
t;path id=3D&quot;path91&quot; d=3D&quot;m22.404 41.222q0-0.73725-0.23427-1=
.1128-0.23427-0.37552-0.69246-0.37552-0.46164 0-0.69936 0.37896-0.23771 0.3=
7552-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69936 0.3789=
6 0.4582 0 0.69246-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.8638-1.4401q0=
.15158-0.2825 0.41686-0.43408 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0=
955 0.53744 0.39963 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963=
 0.54088-1.099 0.54088-0.34451 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.4=
3753v0.48576h-0.6339v-5.3606h0.6339z&quot;/&gt;&lt;path id=3D&quot;path93&q=
uot; d=3D&quot;m13.909 48.398q0-0.73725-0.23427-1.1128-0.23427-0.37552-0.69=
246-0.37552-0.46164 0-0.69935 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73=
036 0.23771 1.1093 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.69246-0.37552=
 0.23427-0.37552 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43=
408 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963 0.5339=
9 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099 0.54088-0.3=
4451 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.36=
06h0.6339z&quot;/&gt;&lt;path id=3D&quot;path95&quot; d=3D&quot;m17.412 48.=
384h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.57878 0 0=
.34795 0.21015 0.54088 0.21015 0.19292 0.58222 0.19292 0.52366 0 0.82338-0.=
36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.6373=
4v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 0.16192=
-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-=
0.97841 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-0.0034-0.46164-0.2=
3427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.09302-0.33=
073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0.32384-=
0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.55122 0.4=
2375 0.13091 0.17226 0.18604 0.42719 0.05512 0.25149 0.05512 0.75792z&quot;=
/&gt;&lt;path id=3D&quot;path97&quot; d=3D&quot;m23.221 47.261q-0.20326-0.1=
5848-0.41341-0.23082-0.21015-0.07235-0.46164-0.07235-0.59256 0-0.90606 0.37=
207-0.3135 0.37207-0.3135 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.75448q0.=
15847-0.40997 0.48576-0.62701 0.33073-0.22049 0.78204-0.22049 0.23427 0 0.4=
3753 0.05857t0.3893 0.18259z&quot;/&gt;&lt;path id=3D&quot;path99&quot; d=
=3D&quot;m26.552 45.18h0.65457l-2.7078 5.7981h-0.65801z&quot;/&gt;&lt;path =
id=3D&quot;path101&quot; d=3D&quot;m22.897 57.303q-0.25494 0.14814-0.5271 0=
.22049-0.26872 0.07579-0.55122 0.07579-0.89572 0-1.4022-0.53744-0.50298-0.5=
3744-0.50298-1.4883t0.50298-1.4883q0.50643-0.53744 1.4022-0.53744 0.27905 0=
 0.54433 0.07235 0.26527 0.07235 0.53399 0.22393v0.6649q-0.25149-0.22393-0.=
50643-0.32384-0.25149-0.09991-0.57189-0.09991-0.596 0-0.9164 0.38585t-0.320=
39 1.1024q0 0.71314 0.32039 1.1024 0.32384 0.38585 0.9164 0.38585 0.33073 0=
 0.59256-0.09991 0.26183-0.10335 0.48576-0.31695z&quot;/&gt;&lt;path id=3D&=
quot;path103&quot; d=3D&quot;m22.198 61.31v-1.9947h0.6339v5.3606h-0.6339v-0=
.48576q-0.15848 0.28594-0.42375 0.43753-0.26183 0.14814-0.60634 0.14814-0.6=
9936 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1.47=
45 0.40308-0.53744 1.099-0.53744 0.34796 0 0.61323 0.15158 0.26527 0.14814 =
0.41686 0.43408zm-1.8638 1.4401q0 0.73725 0.23427 1.1128 0.23427 0.37552 0.=
69246 0.37552t0.69591-0.37896q0.24116-0.37896 0.24116-1.1093 0-0.73381-0.24=
116-1.1093-0.23771-0.37896-0.69591-0.37896t-0.69246 0.37552q-0.23427 0.3755=
2-0.23427 1.1128z&quot;/&gt;&lt;/g&gt;&lt;path id=3D&quot;path25696&quot; d=
=3D&quot;m4.5344 23.535v22.663&quot; fill=3D&quot;none&quot; stroke=3D&quot=
;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&=
quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path25=
958&quot; d=3D&quot;m4.5344 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.8=
46-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)=
&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-=
width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;p=
ath id=3D&quot;path27085&quot; d=3D&quot;m4.5344 46.199c0 1.5071 1.5429 1.4=
354 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&=
quot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quo=
t;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:n=
ormal&quot;/&gt;&lt;path id=3D&quot;path27490&quot; d=3D&quot;m13.266 30.8-=
0.0056 8.5867&quot; fill=3D&quot;none&quot; stroke=3D&quot;#000&quot; strok=
e-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&qu=
ot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path27629&quot; d=3D&qu=
ot;m13.26 32.462c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; fi=
ll=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; stroke=3D&q=
uot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.529=
17&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;pat=
h27844&quot; d=3D&quot;m13.26 39.387c0 1.5071 1.5429 1.4354 1.5429 1.4354l3=
.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Men=
d)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; strok=
e-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt=
;path id=3D&quot;path28236&quot; d=3D&quot;m13.266 52.334-0.0056 8.5867&quo=
t; fill=3D&quot;none&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot=
;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:no=
rmal&quot;/&gt;&lt;path id=3D&quot;path28238&quot; d=3D&quot;m13.26 53.996c=
0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&q=
uot; marker-end=3D&quot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; st=
roke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D=
&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path28240&quot; d=3D=
&quot;m13.26 60.92c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; =
fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; stroke=3D=
&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.5=
2917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;g id=3D&quot;text=
31368&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;VFS tree=
:&quot;&gt;&lt;path id=3D&quot;path62&quot; d=3D&quot;m2.096 5.3688-1.9637-=
5.1435h0.72692l1.6295 4.3305 1.633-4.3305h0.72347l-1.9603 5.1435z&quot;/&gt=
;&lt;path id=3D&quot;path64&quot; d=3D&quot;m5.5962 0.22531h2.9559v0.58567h=
-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.69591z&quot;/&gt;&lt;path id=
=3D&quot;path66&quot; d=3D&quot;m12.614 0.39412v0.67868q-0.39619-0.18948-0.=
74759-0.2825-0.3514-0.093018-0.67868-0.093018-0.56844 0-0.8785 0.22049-0.30=
661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.17225 0.778=
59 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472 0.52365 0.37207 0.37207 0=
.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0.38585-0.36=
518 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42375 0.2=
3771 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984-0.2342=
7 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23082-0.2136-=
0.76137-0.32039l-0.42375-0.082682q-0.77859-0.15503-1.1265-0.48576t-0.34795-=
0.91984q0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0=
.73725 0.065457 0.37552 0.065457 0.76826 0.19637z&quot;/&gt;&lt;path id=3D&=
quot;path68&quot; d=3D&quot;m16.851 0.41479v1.0955h1.3057v0.49265h-1.3057v2=
.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.53=
054h-0.65112q-0.7338 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.09=
46h-0.46509v-0.49265h0.46509v-1.0955z&quot;/&gt;&lt;path id=3D&quot;path70&=
quot; d=3D&quot;m21.227 2.1029q-0.1068-0.062012-0.23427-0.089573-0.12402-0.=
031006-0.27561-0.031006-0.53744 0-0.82682 0.3514-0.28594 0.34795-0.28594 1.=
0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-0.52021=
 0.32039-0.17225 0.77859-0.17225 0.06546 0 0.14469 0.010335 0.07924 0.00689=
 0.1757 0.024116z&quot;/&gt;&lt;path id=3D&quot;path72&quot; d=3D&quot;m25.=
037 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 =
0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573 0.68213-0.26872v=
0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.075792-0.72692 0.075792-=
0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.=
5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.4995=
4 0.45475 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0=
.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.=
84405z&quot;/&gt;&lt;path id=3D&quot;path74&quot; d=3D&quot;m29.378 3.2811v=
0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.9853 0.34=
106 0.36518 0 0.70624-0.089573 0.34451-0.089573 0.68213-0.26872v0.59945q-0.=
34106 0.14469-0.69936 0.22049-0.35829 0.075792-0.72692 0.075792-0.92329 0-1=
.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021 0.5133=
2-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.45475 1=
.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0.31006-0.75=
103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.84405z&quot=
;/&gt;&lt;path id=3D&quot;path76&quot; d=3D&quot;m30.58 4.4938h0.72692v0.87=
505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z&quot;/&gt;&lt;/g&gt;&lt;g =
id=3D&quot;text36298&quot; fill=3D&quot;#0081cf&quot; stroke-width=3D&quot;=
.26458px&quot; aria-label=3D&quot;/=C2=A0 x=C2=A0 y&quot;&gt;&lt;path id=3D=
&quot;path115&quot; d=3D&quot;m58.664 16.476h0.65457l-2.7078 5.7981h-0.6580=
1z&quot;/&gt;&lt;path id=3D&quot;path117&quot; d=3D&quot;m67.949 24.937-1.3=
815 1.8466 1.5158 2.0119h-0.73381l-1.13-1.5468-1.1265 1.5468h-0.73381l1.515=
8-2.0119-1.3815-1.8466h0.7028l1.0232 1.3953 1.0163-1.3953z&quot;/&gt;&lt;pa=
th id=3D&quot;path119&quot; d=3D&quot;m67.053 34.731q-0.15848 0.40308-0.403=
08 1.0611-0.34106 0.90951-0.4582 1.1093-0.15847 0.26872-0.39619 0.40308t-0.=
55466 0.13436h-0.50987v-0.53055h0.37552q0.27905 0 0.43753-0.16192 0.15847-0=
.16192 0.40308-0.83716l-1.4917-3.7965h0.67179l1.1438 3.0179 1.1265-3.0179h0=
.67179z&quot;/&gt;&lt;/g&gt;&lt;path id=3D&quot;path36300&quot; d=3D&quot;m=
57.886 23.535v9.5655&quot; fill=3D&quot;none&quot; stroke=3D&quot;#0081cf&q=
uot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; s=
tyle=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path36302&quo=
t; d=3D&quot;m57.886 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.00=
19&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#ArrowRedMend)&quot=
; stroke=3D&quot;#0081cf&quot; stroke-linecap=3D&quot;round&quot; stroke-wi=
dth=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;pat=
h id=3D&quot;path36304&quot; d=3D&quot;m57.886 33.101c0 1.5071 1.5429 1.435=
4 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&qu=
ot;url(#ArrowRedMend)&quot; stroke=3D&quot;#0081cf&quot; stroke-linecap=3D&=
quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-orde=
r:normal&quot;/&gt;&lt;g id=3D&quot;text36320&quot; stroke-width=3D&quot;.2=
6458px&quot; aria-label=3D&quot;FS A:&quot;&gt;&lt;path id=3D&quot;path106&=
quot; d=3D&quot;m53.733 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h=
-2.0395v2.4564h-0.69591z&quot;/&gt;&lt;path id=3D&quot;path108&quot; d=3D&q=
uot;m60.75 0.39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093018-=
0.67868-0.093018-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0=
 0.34106 0.20326 0.51676 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q0.=
77859 0.14814 1.1472 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50=
298 1.1334-0.49954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.082682-0.4099=
7-0.082682-0.85094-0.2446v-0.71658q0.42375 0.23771 0.83027 0.35829 0.40652 =
0.12058 0.79926 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.6=
6835 0-0.37896-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.08=
2682q-0.77859-0.15503-1.1265-0.48576-0.34795-0.33073-0.34795-0.91984 0-0.68=
213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.06545=
7 0.37552 0.065457 0.76826 0.19637z&quot;/&gt;&lt;path id=3D&quot;path110&q=
uot; d=3D&quot;m66.107 0.91088-0.94396 2.5597h1.8914zm-0.39274-0.68557h0.78=
893l1.9603 5.1435h-0.72347l-0.46853-1.3195h-2.3186l-0.46853 1.3195h-0.7338z=
&quot;/&gt;&lt;path id=3D&quot;path112&quot; d=3D&quot;m69.225 4.4938h0.726=
92v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z&quot;/&gt;&lt;/g&gt=
;&lt;g id=3D&quot;text44877&quot; stroke-width=3D&quot;.26458px&quot; aria-=
label=3D&quot;Mounting FS Aon /foo:&quot;&gt;&lt;path id=3D&quot;path122&qu=
ot; d=3D&quot;m98.949 0.34933h1.037l1.3126 3.5002 1.3195-3.5002h1.037v5.143=
5h-0.67869v-4.5165l-1.3264 3.5278h-0.69935l-1.3264-3.5278v4.5165h-0.67524z&=
quot;/&gt;&lt;path id=3D&quot;path124&quot; d=3D&quot;m106.5 2.0788q-0.5098=
7 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29284 1.0921=
 0.29627 0.39619 0.80959 0.39619 0.50643 0 0.80271-0.39963t0.29628-1.0887q0=
-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82683 =
0 1.2988 0.53744 0.47197 0.53744 0.47197 1.4883 0 0.9474-0.47197 1.4883-0.4=
7198 0.53744-1.2988 0.53744-0.83026 0-1.3022-0.53744-0.46854-0.54088-0.4685=
4-1.4883 0-0.95085 0.46854-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt=
;&lt;path id=3D&quot;path126&quot; d=3D&quot;m109.26 3.9701v-2.3358h0.6339v=
2.3117q0 0.54777 0.2136 0.82338 0.21359 0.27216 0.64079 0.27216 0.51332 0 0=
.80959-0.32728 0.29973-0.32728 0.29973-0.89228v-2.1876h0.63389v3.8585h-0.63=
389v-0.59256q-0.23082 0.3514-0.53744 0.52365-0.30317 0.16881-0.70624 0.1688=
1-0.66491 0-1.0094-0.41341-0.34451-0.41341-0.34451-1.2092z&quot;/&gt;&lt;pa=
th id=3D&quot;path128&quot; d=3D&quot;m117 3.164v2.3289h-0.63389v-2.3082q0-=
0.54777-0.2136-0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32=
728t-0.29628 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.3479=
5 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341 0.=
34106 0.40997 0.34106 1.2092z&quot;/&gt;&lt;path id=3D&quot;path130&quot; d=
=3D&quot;m118.9 0.53881v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.12=
747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.53055h-0.65112q-0.7338=
1 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.4926=
5h0.46509v-1.0955z&quot;/&gt;&lt;path id=3D&quot;path132&quot; d=3D&quot;m1=
21.04 1.6344h0.63389v3.8585h-0.63389zm0-1.5021h0.63389v0.80271h-0.63389z&qu=
ot;/&gt;&lt;path id=3D&quot;path134&quot; d=3D&quot;m126.2 3.164v2.3289h-0.=
63389v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.64079-0.27216-0.513=
32 0-0.8096 0.32728t-0.29628 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.5994=
5q0.22738-0.34795 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 =
1.006 0.41341 0.34106 0.40997 0.34106 1.2092z&quot;/&gt;&lt;path id=3D&quot=
;path136&quot; d=3D&quot;m130.01 3.5188q0-0.68902-0.28594-1.068-0.2825-0.37=
896-0.79582-0.37896-0.50987 0-0.79582 0.37896-0.2825 0.37896-0.2825 1.068 0=
 0.68557 0.2825 1.0645 0.28595 0.37896 0.79582 0.37896 0.51332 0 0.79582-0.=
37896 0.28594-0.37896 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642=
-0.43753 0.48231-1.3401 0.48231-0.33418 0-0.63045-0.051677-0.29628-0.048231=
-0.57534-0.15158v-0.61667q0.27906 0.15158 0.55122 0.22393 0.27216 0.072347 =
0.55466 0.072347 0.62356 0 0.93362-0.32728 0.31006-0.32384 0.31006-0.98185v=
-0.3135q-0.19637 0.34106-0.50298 0.50987-0.30662 0.16881-0.73381 0.16881-0.=
70969 0-1.1438-0.54088-0.43408-0.54088-0.43408-1.4332 0-0.89573 0.43408-1.4=
366 0.43408-0.54088 1.1438-0.54088 0.42719 0 0.73381 0.16881 0.30661 0.1688=
1 0.50298 0.50987v-0.58567h0.6339z&quot;/&gt;&lt;path id=3D&quot;path138&qu=
ot; d=3D&quot;m134.22 0.34933h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2=
.0395v2.4564h-0.69591z&quot;/&gt;&lt;path id=3D&quot;path140&quot; d=3D&quo=
t;m141.23 0.51814v0.67868q-0.39618-0.18948-0.74758-0.2825t-0.67869-0.093018=
q-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.2032=
6 0.51676 0.20671 0.17225 0.77859 0.27905l0.42031 0.086127q0.77859 0.14814 =
1.1472 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.4=
9954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.082682-0.40997-0.082682-0.8=
5094-0.2446v-0.71658q0.42374 0.23771 0.83026 0.35829 0.40653 0.12058 0.7992=
7 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896=
-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42374-0.082682q-0.77859-=
0.15503-1.1266-0.48576-0.34795-0.33073-0.34795-0.91984 0-0.68213 0.47886-1.=
0749 0.48232-0.39274 1.3264-0.39274 0.36173 0 0.73725 0.065457 0.37551 0.06=
5457 0.76825 0.19637z&quot;/&gt;&lt;path id=3D&quot;path142&quot; d=3D&quot=
;m146.59 1.0349-0.94395 2.5597h1.8914zm-0.39274-0.68557h0.78893l1.9603 5.14=
35h-0.72347l-0.46854-1.3195h-2.3186l-0.46853 1.3195h-0.73381z&quot;/&gt;&lt=
;path id=3D&quot;path144&quot; d=3D&quot;m112.34 9.2549q-0.50987 0-0.80615 =
0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.39619 0.809=
6 0.39619 0.50643 0 0.80271-0.39963t0.29628-1.0887q0-0.68557-0.29628-1.0852=
-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744 0.4719=
8 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.5=
3744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46=
853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&lt;path id=3D&quot;pa=
th146&quot; d=3D&quot;m118.37 10.34v2.3289h-0.6339v-2.3082q0-0.54777-0.2135=
9-0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32728t-0.29628 =
0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.34795 0.53399-0.5=
2021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341 0.34106 0.40997=
 0.34106 1.2092z&quot;/&gt;&lt;path id=3D&quot;path148&quot; d=3D&quot;m123=
 7.5255h0.58566l-1.7914 5.7981h-0.58566z&quot;/&gt;&lt;path id=3D&quot;path=
150&quot; d=3D&quot;m126.21 7.3084v0.5271h-0.60634q-0.34106 0-0.47542 0.137=
8-0.13092 0.1378-0.13092 0.49609v0.34106h1.0439v0.49265h-1.0439v3.3659h-0.6=
3734v-3.3659h-0.60634v-0.49265h0.60634v-0.26872q0-0.64423 0.29972-0.93707 0=
.29973-0.29628 0.95085-0.29628z&quot;/&gt;&lt;path id=3D&quot;path152&quot;=
 d=3D&quot;m128.23 9.2549q-0.50988 0-0.80616 0.39963-0.29628 0.39619-0.2962=
8 1.0887t0.29284 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.8027-0.3=
9963 0.29628-0.39963 0.29628-1.0887 0-0.68557-0.29628-1.0852-0.29627-0.4030=
8-0.8027-0.40308zm0-0.53744q0.82682 0 1.2988 0.53744 0.47198 0.53744 0.4719=
8 1.4883 0 0.9474-0.47198 1.4883-0.47198 0.53744-1.2988 0.53744-0.83027 0-1=
.3022-0.53744-0.46853-0.54088-0.46853-1.4883 0-0.95085 0.46853-1.4883 0.471=
98-0.53744 1.3022-0.53744z&quot;/&gt;&lt;path id=3D&quot;path154&quot; d=3D=
&quot;m132.55 9.2549q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0=
887t0.29284 1.0921q0.29627 0.39619 0.80959 0.39619 0.50643 0 0.80271-0.3996=
3t0.29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm=
0-0.53744q0.82683 0 1.2988 0.53744 0.47197 0.53744 0.47197 1.4883 0 0.9474-=
0.47197 1.4883-0.47198 0.53744-1.2988 0.53744-0.83026 0-1.3022-0.53744-0.46=
854-0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883 0.47198-0.53744 1.3022-=
0.53744z&quot;/&gt;&lt;path id=3D&quot;path156&quot; d=3D&quot;m135.53 11.7=
94h0.72691v0.87506h-0.72691zm0-2.7733h0.72691v0.87505h-0.72691z&quot;/&gt;&=
lt;/g&gt;&lt;g id=3D&quot;text45567&quot; stroke-width=3D&quot;.26458px&quo=
t; aria-label=3D&quot;/=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bar/=C2=A0 =
=C2=A0 c=C2=A0 =C2=A0 d&quot;&gt;&lt;path id=3D&quot;path172&quot; d=3D&quo=
t;m113.98 16.476h0.65457l-2.7078 5.7981h-0.65801z&quot;/&gt;&lt;path id=3D&=
quot;path174&quot; d=3D&quot;m122.57 48.398q0-0.73725-0.23427-1.1128-0.2342=
6-0.37552-0.69246-0.37552-0.46165 0-0.69936 0.37896-0.23771 0.37552-0.23771=
 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69936 0.37896 0.4582 0 0=
.69246-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.8638-1.4401q0.15159-0.282=
5 0.41686-0.43408 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 =
0.39963 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.0=
99 0.54088-0.34451 0-0.60979-0.14814-0.26182-0.15158-0.4203-0.43753v0.48576=
h-0.6339v-5.3606h0.6339z&quot;/&gt;&lt;path id=3D&quot;path176&quot; d=3D&q=
uot;m126.08 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27=
905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222 0.19292 0.523=
66 0 0.82338-0.36174 0.29973-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183=
v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.30661 0.16192-=
0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0=
.64423 0.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-3e-=
3 -0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.6545=
7 0.09302t-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0.32384-0=
.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34107 0.14125 0.55122 0.42=
375 0.13091 0.17226 0.18603 0.42719 0.0551 0.25149 0.0551 0.75792z&quot;/&g=
t;&lt;path id=3D&quot;path178&quot; d=3D&quot;m131.89 47.261q-0.20326-0.158=
48-0.41341-0.23082-0.21015-0.07235-0.46165-0.07235-0.59255 0-0.90606 0.3720=
7-0.3135 0.37207-0.3135 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.75448q0.15=
847-0.40997 0.48576-0.62701 0.33073-0.22049 0.78203-0.22049 0.23427 0 0.437=
53 0.05857t0.3893 0.18259z&quot;/&gt;&lt;path id=3D&quot;path180&quot; d=3D=
&quot;m135.22 45.18h0.65457l-2.7078 5.7981h-0.65801z&quot;/&gt;&lt;path id=
=3D&quot;path182&quot; d=3D&quot;m131.56 57.303q-0.25494 0.14814-0.5271 0.2=
2049-0.26872 0.07579-0.55122 0.07579-0.89572 0-1.4022-0.53744-0.50299-0.537=
44-0.50299-1.4883t0.50299-1.4883q0.50643-0.53744 1.4022-0.53744 0.27906 0 0=
.54433 0.07235t0.53399 0.22393v0.6649q-0.25149-0.22393-0.50643-0.32384-0.25=
149-0.09991-0.57189-0.09991-0.596 0-0.91639 0.38585-0.3204 0.38585-0.3204 1=
.1024 0 0.71314 0.3204 1.1024 0.32384 0.38585 0.91639 0.38585 0.33073 0 0.5=
9256-0.09991 0.26183-0.10335 0.48576-0.31695z&quot;/&gt;&lt;path id=3D&quot=
;path184&quot; d=3D&quot;m130.86 61.31v-1.9947h0.6339v5.3606h-0.6339v-0.485=
76q-0.15847 0.28594-0.42374 0.43753-0.26183 0.14814-0.60634 0.14814-0.69935=
 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40307-1.4745 0=
.40308-0.53744 1.099-0.53744 0.34795 0 0.61323 0.15158 0.26527 0.14814 0.41=
685 0.43408zm-1.8638 1.4401q0 0.73725 0.23426 1.1128 0.23427 0.37552 0.6924=
7 0.37552t0.69591-0.37896q0.24115-0.37896 0.24115-1.1093 0-0.73381-0.24115-=
1.1093-0.23771-0.37896-0.69591-0.37896t-0.69247 0.37552q-0.23426 0.37552-0.=
23426 1.1128z&quot;/&gt;&lt;/g&gt;&lt;path id=3D&quot;path45569&quot; d=3D&=
quot;m113.2 23.535v22.663&quot; fill=3D&quot;none&quot; stroke=3D&quot;#000=
&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot;=
 style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path45571&q=
uot; d=3D&quot;m113.2 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0=
019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot;=
 stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=
=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path i=
d=3D&quot;path45573&quot; d=3D&quot;m113.2 46.199c0 1.5071 1.5429 1.4354 1.=
5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;u=
rl(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;roun=
d&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&=
quot;/&gt;&lt;path id=3D&quot;path45575&quot; d=3D&quot;m121.93 30.8-6e-3 8=
.5867&quot; fill=3D&quot;none&quot; stroke=3D&quot;#0081cf&quot; stroke-lin=
ecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;pa=
int-order:normal&quot;/&gt;&lt;path id=3D&quot;path45577&quot; d=3D&quot;m1=
21.93 32.462c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; fill=
=3D&quot;none&quot; marker-end=3D&quot;url(#ArrowRedMend)&quot; stroke=3D&q=
uot;#0081cf&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.=
52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;=
path45579&quot; d=3D&quot;m121.93 39.387c0 1.5071 1.5429 1.4354 1.5429 1.43=
54l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow=
RedMend)&quot; stroke=3D&quot;#0081cf&quot; stroke-linecap=3D&quot;round&qu=
ot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot=
;/&gt;&lt;path id=3D&quot;path45581&quot; d=3D&quot;m121.93 52.334-6e-3 8.5=
867&quot; fill=3D&quot;none&quot; stroke=3D&quot;#000&quot; stroke-linecap=
=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-=
order:normal&quot;/&gt;&lt;path id=3D&quot;path45583&quot; d=3D&quot;m121.9=
3 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; fill=3D&qu=
ot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000=
&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot;=
 style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path45585&q=
uot; d=3D&quot;m121.93 60.92c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0=
019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot;=
 stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=
=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;g id=
=3D&quot;text49419&quot; fill=3D&quot;#0081cf&quot; stroke-width=3D&quot;.2=
6458px&quot; aria-label=3D&quot;=C2=A0 foo/=C2=A0 =C2=A0 x=C2=A0 =C2=A0 y&q=
uot;&gt;&lt;path id=3D&quot;path159&quot; d=3D&quot;m123.07 23.435v0.5271h-=
0.72003q-0.34106 0-0.47542 0.14125-0.13091 0.1378-0.13091 0.49265v0.34106h1=
.3264v0.49265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.49265h1.0301v-0.268=
72q0-0.6339 0.28939-0.93362 0.29283-0.29972 0.9095-0.29972z&quot;/&gt;&lt;p=
ath id=3D&quot;path161&quot; d=3D&quot;m125.78 25.381q-0.48232 0-0.73037 0.=
37552-0.24804 0.37552-0.24804 1.1128 0 0.73381 0.24804 1.1128 0.24805 0.375=
52 0.73037 0.37552 0.48575 0 0.7338-0.37552 0.24805-0.37896 0.24805-1.1128 =
0-0.73725-0.24805-1.1128-0.24805-0.37552-0.7338-0.37552zm0-0.53744q0.8027 0=
 1.2264 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42=
374 0.51676-1.2299 0.51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375=
-1.509 0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2265-0.52021z&quot;/&gt;&l=
t;path id=3D&quot;path163&quot; d=3D&quot;m130.03 25.381q-0.48231 0-0.73036=
 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.=
37552 0.73036 0.37552 0.48576 0 0.73381-0.37552 0.24804-0.37896 0.24804-1.1=
128 0-0.73725-0.24804-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.8=
0271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.50=
9-0.42375 0.51676-1.2299 0.51676-0.80271 0-1.2264-0.51676-0.42375-0.52021-0=
.42375-1.509 0-0.9853 0.42375-1.5055 0.42374-0.52021 1.2264-0.52021z&quot;/=
&gt;&lt;path id=3D&quot;path165&quot; d=3D&quot;m135.22 23.652h0.65457l-2.7=
078 5.7981h-0.65801z&quot;/&gt;&lt;path id=3D&quot;path167&quot; d=3D&quot;=
m131.76 32.113-1.3815 1.8466 1.5158 2.0119h-0.73381l-1.13-1.5468-1.1266 1.5=
468h-0.7338l1.5158-2.0119-1.3815-1.8466h0.7028l1.0232 1.3953 1.0163-1.3953z=
&quot;/&gt;&lt;path id=3D&quot;path169&quot; d=3D&quot;m130.86 41.907q-0.15=
847 0.40308-0.40307 1.0611-0.34107 0.9095-0.4582 1.1093-0.15847 0.26872-0.3=
9619 0.40308-0.23771 0.13436-0.55466 0.13436h-0.50987v-0.53054h0.37551q0.27=
906 0 0.43753-0.16192 0.15848-0.16192 0.40308-0.83716l-1.4917-3.7965h0.6717=
9l1.1438 3.0179 1.1265-3.0179h0.6718z&quot;/&gt;&lt;/g&gt;&lt;/svg&gt;<br>
diff --git a/screenshots/2021-08-18-root-file.svg b/screenshots/2021-08-18-=
root-file.svg<br>
new file mode 100644<br>
index 0000000..b7b2797<br>
--- /dev/null<br>
+++ b/screenshots/2021-08-18-root-file.svg<br>
@@ -0,0 +1,2 @@<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;svg id=3D&quot;svg5&quot; width=3D&quot;149.08mm&quot; height=3D&quot;=
64.908mm&quot; version=3D&quot;1.1&quot; viewBox=3D&quot;0 0 149.08 64.908&=
quot; xmlns=3D&quot;<a href=3D"http://www.w3.org/2000/svg" rel=3D"noreferre=
r" target=3D"_blank">http://www.w3.org/2000/svg</a>&quot;&gt;&lt;defs id=3D=
&quot;defs2&quot;&gt;&lt;marker id=3D&quot;Arrow1Mend&quot; overflow=3D&quo=
t;visible&quot; orient=3D&quot;auto&quot;&gt;&lt;path id=3D&quot;path26121&=
quot; transform=3D&quot;scale(-.6)&quot; d=3D&quot;m8.7186 4.0337-10.926-4.=
0177 10.926-4.0177c-1.7455 2.3721-1.7354 5.6175-6e-7 8.0354z&quot; fill=3D&=
quot;context-stroke&quot; fill-rule=3D&quot;evenodd&quot; stroke-linejoin=
=3D&quot;round&quot; stroke-width=3D&quot;.625&quot;/&gt;&lt;/marker&gt;&lt=
;/defs&gt;&lt;g id=3D&quot;text10527&quot; stroke-width=3D&quot;.26458px&qu=
ot; aria-label=3D&quot;/=C2=A0 foo/=C2=A0=C2=A0 =C2=A0a=C2=A0 =C2=A0 b=C2=
=A0 bar/=C2=A0 =C2=A0 c=C2=A0 =C2=A0 d&quot;&gt;&lt;path id=3D&quot;path71&=
quot; d=3D&quot;m5.3131 16.476h0.65457l-2.7078 5.7981h-0.65801z&quot;/&gt;&=
lt;path id=3D&quot;path73&quot; d=3D&quot;m14.408 23.435v0.5271h-0.72003q-0=
.34106 0-0.47542 0.14125-0.13091 0.1378-0.13091 0.49265v0.34106h1.3264v0.49=
265h-1.3264v3.3659h-0.6339v-3.3659h-1.0301v-0.49265h1.0301v-0.26872q0-0.633=
9 0.28939-0.93362 0.29283-0.29972 0.90951-0.29972z&quot;/&gt;&lt;path id=3D=
&quot;path75&quot; d=3D&quot;m17.116 25.381q-0.48231 0-0.73036 0.37552-0.24=
805 0.37552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.73036=
 0.37552 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.73725=
-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.80271 0 1.2265=
 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.42375 0.5=
1676-1.2299 0.51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375-1.509 =
0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2265-0.52021z&quot;/&gt;&lt;path =
id=3D&quot;path77&quot; d=3D&quot;m21.364 25.381q-0.48231 0-0.73036 0.37552=
-0.24805 0.37552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.24805 0.37552 0.=
73036 0.37552 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1.1128 0-0.=
73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0.80271 0 1=
.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.509-0.4237=
5 0.51676-1.2299 0.51676-0.80271 0-1.2265-0.51676-0.42375-0.52021-0.42375-1=
.509 0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2265-0.52021z&quot;/&gt;&lt;=
path id=3D&quot;path79&quot; d=3D&quot;m26.552 23.652h0.65457l-2.7078 5.798=
1h-0.65801z&quot;/&gt;&lt;path id=3D&quot;path81&quot; d=3D&quot;m21.66 34.=
032h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.57878 0 0=
.34796 0.21015 0.54088 0.21015 0.19293 0.58222 0.19293 0.52365 0 0.82338-0.=
36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h-0.6373=
4v-0.57189q-0.20326 0.34451-0.51332 0.50987-0.30661 0.16192-0.74759 0.16192=
-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0.43064-=
0.97841 0.43408-0.33417 1.2712-0.33417h0.85094v-0.09991q-0.0034-0.46164-0.2=
3427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.09302-0.33=
073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0.32384-=
0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.55122 0.4=
2375 0.13091 0.17226 0.18604 0.42719 0.05512 0.25149 0.05512 0.75792z&quot;=
/&gt;&lt;path id=3D&quot;path83&quot; d=3D&quot;m22.404 41.222q0-0.73725-0.=
23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46164 0-0.69936 0.37896-0.23=
771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69936=
 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.8638-1=
.4401q0.15158-0.2825 0.41686-0.43408 0.26872-0.15158 0.62012-0.15158 0.6959=
1 0 1.0955 0.53744 0.39963 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.4986-=
0.39963 0.54088-1.099 0.54088-0.34451 0-0.60978-0.14814-0.26183-0.15158-0.4=
203-0.43753v0.48576h-0.6339v-5.3606h0.6339z&quot;/&gt;&lt;path id=3D&quot;p=
ath85&quot; d=3D&quot;m13.909 48.398q0-0.73725-0.23427-1.1128-0.23427-0.375=
52-0.69246-0.37552-0.46164 0-0.69935 0.37896-0.23771 0.37552-0.23771 1.1093=
 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.69935 0.37896 0.4582 0 0.69246-=
0.37552 0.23427-0.37552 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.416=
86-0.43408 0.26872-0.15158 0.62012-0.15158 0.69591 0 1.0955 0.53744 0.39963=
 0.53399 0.39963 1.4745 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099 0.54=
088-0.34451 0-0.60978-0.14814-0.26183-0.15158-0.4203-0.43753v0.48576h-0.633=
9v-5.3606h0.6339z&quot;/&gt;&lt;path id=3D&quot;path87&quot; d=3D&quot;m17.=
412 48.384h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.19293-0.27905 0.57=
878 0 0.34795 0.21015 0.54088 0.21015 0.19292 0.58222 0.19292 0.52366 0 0.8=
2338-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.2299-0.26183v2.2014h=
-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.30661 0.16192-0.74759 =
0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.89228 0-0.64423 0=
.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0.85094v-0.09991q-0.0034-0.46=
164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.32384 0-0.65457 0.093=
02-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19982 0=
.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125 0.55=
122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512 0.25149 0.05512 0.75792=
z&quot;/&gt;&lt;path id=3D&quot;path89&quot; d=3D&quot;m23.221 47.261q-0.20=
326-0.15848-0.41341-0.23082-0.21015-0.07235-0.46164-0.07235-0.59256 0-0.906=
06 0.37207-0.3135 0.37207-0.3135 1.0749v1.9189h-0.63734v-3.8585h0.63734v0.7=
5448q0.15847-0.40997 0.48576-0.62701 0.33073-0.22049 0.78204-0.22049 0.2342=
7 0 0.43753 0.05857t0.3893 0.18259z&quot;/&gt;&lt;path id=3D&quot;path91&qu=
ot; d=3D&quot;m26.552 45.18h0.65457l-2.7078 5.7981h-0.65801z&quot;/&gt;&lt;=
path id=3D&quot;path93&quot; d=3D&quot;m22.897 57.303q-0.25494 0.14814-0.52=
71 0.22049-0.26872 0.07579-0.55122 0.07579-0.89572 0-1.4022-0.53744-0.50298=
-0.53744-0.50298-1.4883t0.50298-1.4883q0.50643-0.53744 1.4022-0.53744 0.279=
05 0 0.54433 0.07235 0.26527 0.07235 0.53399 0.22393v0.6649q-0.25149-0.2239=
3-0.50643-0.32384-0.25149-0.09991-0.57189-0.09991-0.596 0-0.9164 0.38585t-0=
.32039 1.1024q0 0.71314 0.32039 1.1024 0.32384 0.38585 0.9164 0.38585 0.330=
73 0 0.59256-0.09991 0.26183-0.10335 0.48576-0.31695z&quot;/&gt;&lt;path id=
=3D&quot;path95&quot; d=3D&quot;m22.198 61.31v-1.9947h0.6339v5.3606h-0.6339=
v-0.48576q-0.15848 0.28594-0.42375 0.43753-0.26183 0.14814-0.60634 0.14814-=
0.69936 0-1.1024-0.54088-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1=
.4745 0.40308-0.53744 1.099-0.53744 0.34796 0 0.61323 0.15158 0.26527 0.148=
14 0.41686 0.43408zm-1.8638 1.4401q0 0.73725 0.23427 1.1128 0.23427 0.37552=
 0.69246 0.37552t0.69591-0.37896q0.24116-0.37896 0.24116-1.1093 0-0.73381-0=
.24116-1.1093-0.23771-0.37896-0.69591-0.37896t-0.69246 0.37552q-0.23427 0.3=
7552-0.23427 1.1128z&quot;/&gt;&lt;/g&gt;&lt;path id=3D&quot;path25696&quot=
; d=3D&quot;m4.5344 23.535v22.663&quot; fill=3D&quot;none&quot; stroke=3D&q=
uot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.529=
17&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;pat=
h25958&quot; d=3D&quot;m4.5344 24.564c0 1.5071 1.5429 1.4354 1.5429 1.4354l=
3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Me=
nd)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stro=
ke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&l=
t;path id=3D&quot;path27085&quot; d=3D&quot;m4.5344 46.199c0 1.5071 1.5429 =
1.4354 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=
=3D&quot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D=
&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-ord=
er:normal&quot;/&gt;&lt;path id=3D&quot;path27490&quot; d=3D&quot;m13.266 3=
0.8-0.0056 8.5867&quot; fill=3D&quot;none&quot; stroke=3D&quot;#000&quot; s=
troke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=
=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path27629&quot; d=
=3D&quot;m13.26 32.462c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&qu=
ot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; strok=
e=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quo=
t;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&qu=
ot;path27844&quot; d=3D&quot;m13.26 39.387c0 1.5071 1.5429 1.4354 1.5429 1.=
4354l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arr=
ow1Mend)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot;=
 stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&=
gt;&lt;path id=3D&quot;path28236&quot; d=3D&quot;m13.266 52.334-0.0056 8.58=
67&quot; fill=3D&quot;none&quot; stroke=3D&quot;#000&quot; stroke-linecap=
=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-=
order:normal&quot;/&gt;&lt;path id=3D&quot;path28238&quot; d=3D&quot;m13.26=
 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quo=
t;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&=
quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; =
style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path28240&qu=
ot; d=3D&quot;m13.26 60.92c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.001=
9&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; s=
troke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D=
&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;g id=3D&q=
uot;text31368&quot; stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;=
VFS tree:&quot;&gt;&lt;path id=3D&quot;path54&quot; d=3D&quot;m2.096 5.3688=
-1.9637-5.1435h0.72692l1.6295 4.3305 1.633-4.3305h0.72347l-1.9603 5.1435z&q=
uot;/&gt;&lt;path id=3D&quot;path56&quot; d=3D&quot;m5.5962 0.22531h2.9559v=
0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564h-0.69591z&quot;/&gt;&lt;=
path id=3D&quot;path58&quot; d=3D&quot;m12.614 0.39412v0.67868q-0.39619-0.1=
8948-0.74759-0.2825-0.3514-0.093018-0.67868-0.093018-0.56844 0-0.8785 0.220=
49-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 0.51676 0.20671 0.1722=
5 0.77859 0.27905l0.4203 0.086127q0.77859 0.14814 1.1472 0.52365 0.37207 0.=
37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.49954 0.38585-1.4676 0.385=
85-0.36518 0-0.77859-0.082682-0.40997-0.082682-0.85094-0.2446v-0.71658q0.42=
375 0.23771 0.83027 0.35829 0.40652 0.12058 0.79926 0.12058 0.596 0 0.91984=
-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896-0.23427-0.59256-0.23082-=
0.2136-0.76137-0.32039l-0.42375-0.082682q-0.77859-0.15503-1.1265-0.48576t-0=
.34795-0.91984q0-0.68213 0.47887-1.0749 0.48231-0.39274 1.3264-0.39274 0.36=
174 0 0.73725 0.065457 0.37552 0.065457 0.76826 0.19637z&quot;/&gt;&lt;path=
 id=3D&quot;path60&quot; d=3D&quot;m16.851 0.41479v1.0955h1.3057v0.49265h-1=
.3057v2.0946q0 0.47198 0.12747 0.60634 0.13091 0.13436 0.5271 0.13436h0.651=
12v0.53054h-0.65112q-0.7338 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.9990=
8v-2.0946h-0.46509v-0.49265h0.46509v-1.0955z&quot;/&gt;&lt;path id=3D&quot;=
path62&quot; d=3D&quot;m21.227 2.1029q-0.1068-0.062012-0.23427-0.089573-0.1=
2402-0.031006-0.27561-0.031006-0.53744 0-0.82682 0.3514-0.28594 0.34795-0.2=
8594 1.0025v2.0326h-0.63734v-3.8585h0.63734v0.59945q0.19982-0.3514 0.52021-=
0.52021 0.32039-0.17225 0.77859-0.17225 0.06546 0 0.14469 0.010335 0.07924 =
0.00689 0.1757 0.024116z&quot;/&gt;&lt;path id=3D&quot;path64&quot; d=3D&qu=
ot;m25.037 3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0=
.34106 0.9853 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573 0.68213-0=
.26872v0.59945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.075792-0.72692 0.=
075792-0.92329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.5=
0987-1.5021 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475=
 0.49954 0.45475 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0=
.2825-0.31006-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.3=
6518 0.84405z&quot;/&gt;&lt;path id=3D&quot;path66&quot; d=3D&quot;m29.378 =
3.2811v0.31006h-2.9146q0.04134 0.65457 0.39274 0.99908 0.35484 0.34106 0.98=
53 0.34106 0.36518 0 0.70624-0.089573 0.34451-0.089573 0.68213-0.26872v0.59=
945q-0.34106 0.14469-0.69936 0.22049-0.35829 0.075792-0.72692 0.075792-0.92=
329 0-1.4642-0.53744-0.53744-0.53744-0.53744-1.4538 0-0.9474 0.50987-1.5021=
 0.51332-0.55811 1.3815-0.55811 0.77859 0 1.2299 0.50298 0.45475 0.49954 0.=
45475 1.3608zm-0.6339-0.18604q-0.00689-0.52021-0.29283-0.83027-0.2825-0.310=
06-0.75103-0.31006-0.53054 0-0.85094 0.29972-0.31695 0.29972-0.36518 0.8440=
5z&quot;/&gt;&lt;path id=3D&quot;path68&quot; d=3D&quot;m30.58 4.4938h0.726=
92v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z&quot;/&gt;&lt;/g&gt=
;&lt;g id=3D&quot;text36298&quot; fill=3D&quot;#0081cf&quot; stroke-width=
=3D&quot;.26458px&quot; aria-label=3D&quot;(unnamed)&quot;&gt;&lt;path id=
=3D&quot;path107&quot; d=3D&quot;m51.063 16.265q-0.4582 0.78548-0.68557 1.5=
675-0.22393 0.77859-0.22393 1.571 0 0.78893 0.22393 1.571 0.22738 0.78204 0=
.68557 1.5744h-0.55122q-0.52021-0.81993-0.77515-1.5951-0.25494-0.77859-0.25=
494-1.5503 0-0.76826 0.25494-1.5468 0.25494-0.77859 0.77515-1.5916z&quot;/&=
gt;&lt;path id=3D&quot;path109&quot; d=3D&quot;m52.934 20.158v-2.3909h0.633=
9v2.3909q0 0.52021 0.18259 0.76481 0.18604 0.2446 0.57189 0.2446 0.44786 0 =
0.68557-0.3135 0.23771-0.31695 0.23771-0.90606v-2.1807h0.63734v3.8516h-0.63=
734v-0.57878q-0.16881 0.33417-0.46164 0.50643-0.28939 0.17226-0.67868 0.172=
26-0.59256 0-0.88194-0.38585-0.28939-0.3893-0.28939-1.1748z&quot;/&gt;&lt;p=
ath id=3D&quot;path111&quot; d=3D&quot;m60.13 19.228v2.3909h-0.63734v-2.390=
9q0-0.52021-0.18259-0.76481-0.18259-0.2446-0.57189-0.2446-0.44442 0-0.68557=
 0.31695-0.23771 0.3135-0.23771 0.90262v2.1807h-0.6339v-3.8585h0.6339v0.578=
78q0.16881-0.33073 0.4582-0.49954 0.28939-0.17226 0.68557-0.17226 0.58911 0=
 0.8785 0.3893 0.29283 0.38585 0.29283 1.1713z&quot;/&gt;&lt;path id=3D&quo=
t;path113&quot; d=3D&quot;m64.378 19.228v2.3909h-0.63734v-2.3909q0-0.52021-=
0.18259-0.76481-0.18259-0.2446-0.57189-0.2446-0.44442 0-0.68558 0.31695-0.2=
3771 0.3135-0.23771 0.90262v2.1807h-0.6339v-3.8585h0.6339v0.57878q0.16881-0=
.33073 0.4582-0.49954 0.28939-0.17226 0.68558-0.17226 0.58911 0 0.8785 0.38=
93 0.29283 0.38585 0.29283 1.1713z&quot;/&gt;&lt;path id=3D&quot;path115&qu=
ot; d=3D&quot;m67.424 19.68h-0.21015q-0.55466 0-0.83716 0.19637-0.27905 0.1=
9292-0.27905 0.57878 0 0.34796 0.21015 0.54088 0.21015 0.19293 0.58222 0.19=
293 0.52366 0 0.82338-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1.229=
9-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50987-0.30661=
 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33417-0.3514-0.=
89228 0-0.64423 0.43064-0.97841 0.43408-0.33417 1.2712-0.33417h0.85094v-0.0=
9991q-0.0034-0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.3238=
4 0-0.65457 0.09302-0.33073 0.09302-0.64423 0.27216v-0.6339q0.3514-0.13436 =
0.67179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.3=
4106 0.14125 0.55122 0.42375 0.13091 0.17226 0.18604 0.42719 0.05512 0.2514=
9 0.05512 0.75792z&quot;/&gt;&lt;path id=3D&quot;path117&quot; d=3D&quot;m7=
1.582 18.153q0.11713-0.24805 0.29628-0.36518 0.18259-0.12058 0.43753-0.1205=
8 0.46509 0 0.65457 0.36174 0.19292 0.35829 0.19292 1.3539v2.2359h-0.57878v=
-2.2083q0-0.81649-0.09302-1.0129-0.08957-0.19982-0.33073-0.19982-0.27561 0-=
0.37896 0.2136-0.09991 0.21015-0.09991 0.99908v2.2083h-0.57878v-2.2083q0-0.=
82682-0.09991-1.0197-0.09646-0.19292-0.3514-0.19292-0.25149 0-0.3514 0.2136=
-0.09646 0.21015-0.09646 0.99908v2.2083h-0.57533v-3.8585h0.57533v0.33073q0.=
11369-0.20671 0.2825-0.3135 0.17225-0.11024 0.3893-0.11024 0.26183 0 0.4340=
8 0.12058 0.1757 0.12058 0.27216 0.36518z&quot;/&gt;&lt;path id=3D&quot;pat=
h119&quot; d=3D&quot;m77.332 19.531v0.31006h-2.7457v0.02067q0 0.63045 0.327=
28 0.97496 0.33073 0.34451 0.93018 0.34451 0.30317 0 0.6339-0.09646 0.33073=
-0.09646 0.70624-0.29283v0.63045q-0.36174 0.14814-0.69936 0.22049-0.33418 0=
.07579-0.64768 0.07579-0.89917 0-1.4056-0.53744-0.50643-0.54088-0.50643-1.4=
883 0-0.92329 0.49609-1.4745 0.49609-0.55122 1.3229-0.55122 0.73725 0 1.161=
 0.49954 0.42719 0.49954 0.42719 1.3643zm-0.6339-0.18604q-0.01378-0.55811-0=
.26527-0.84749-0.24805-0.29283-0.71658-0.29283-0.4582 0-0.75448 0.30317-0.2=
9628 0.30317-0.3514 0.8406z&quot;/&gt;&lt;path id=3D&quot;path121&quot; d=
=3D&quot;m80.705 18.253v-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15848 0.2=
8594-0.42375 0.43753-0.26183 0.14814-0.60634 0.14814-0.69935 0-1.1024-0.540=
88-0.39963-0.54433-0.39963-1.4986 0-0.94051 0.40308-1.4745 0.40308-0.53744 =
1.099-0.53744 0.34796 0 0.61323 0.15158 0.26527 0.14814 0.41686 0.43408zm-1=
.8638 1.44q0 0.73725 0.23427 1.1128 0.23427 0.37552 0.69246 0.37552t0.69591=
-0.37896q0.24116-0.37896 0.24116-1.1093 0-0.7338-0.24116-1.1093-0.23771-0.3=
7896-0.69591-0.37896t-0.69246 0.37552q-0.23427 0.37552-0.23427 1.1128z&quot=
;/&gt;&lt;path id=3D&quot;path123&quot; d=3D&quot;m83.195 16.265h0.55122q0.=
52021 0.81304 0.77515 1.5916t0.25494 1.5468q0 0.77515-0.25494 1.5537t-0.775=
15 1.5916h-0.55122q0.4582-0.79926 0.68213-1.5813 0.22738-0.78204 0.22738-1.=
5641 0-0.78548-0.22738-1.5675-0.22393-0.78204-0.68213-1.571z&quot;/&gt;&lt;=
/g&gt;&lt;g id=3D&quot;text36320&quot; stroke-width=3D&quot;.26458px&quot; =
aria-label=3D&quot;FS B:&quot;&gt;&lt;path id=3D&quot;path98&quot; d=3D&quo=
t;m58.036 0.22531h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0395v2.4564=
h-0.69591z&quot;/&gt;&lt;path id=3D&quot;path100&quot; d=3D&quot;m65.053 0.=
39412v0.67868q-0.39619-0.18948-0.74759-0.2825-0.3514-0.093018-0.67868-0.093=
018-0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20=
326 0.51676 0.20671 0.17225 0.77859 0.27905l0.4203 0.086127q0.77859 0.14814=
 1.1472 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.=
49954 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.082682-0.40997-0.082682-0.=
85094-0.2446v-0.71658q0.42375 0.23771 0.83027 0.35829 0.40652 0.12058 0.799=
26 0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.3789=
6-0.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42375-0.082682q-0.77859=
-0.15503-1.1265-0.48576-0.34795-0.33073-0.34795-0.91984 0-0.68213 0.47887-1=
.0749 0.48231-0.39274 1.3264-0.39274 0.36174 0 0.73725 0.065457 0.37552 0.0=
65457 0.76826 0.19637z&quot;/&gt;&lt;path id=3D&quot;path102&quot; d=3D&quo=
t;m69.387 2.9125v1.8845h1.1162q0.56155 0 0.83027-0.23082 0.27216-0.23427 0.=
27216-0.71314 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-=
2.1153v1.5503h1.0301q0.50987 0 0.75792-0.18948 0.25149-0.19293 0.25149-0.58=
567 0-0.3893-0.25149-0.58222-0.24805-0.19293-0.75792-0.19293zm-0.69591-0.57=
189h1.7777q0.79582 0 1.2265 0.33073t0.43064 0.94051q0 0.47198-0.22049 0.751=
03t-0.64768 0.34795q0.51332 0.11024 0.79582 0.46164 0.28594 0.34795 0.28594=
 0.87161 0 0.68902-0.46853 1.0645-0.46853 0.37552-1.3333 0.37552h-1.8466z&q=
uot;/&gt;&lt;path id=3D&quot;path104&quot; d=3D&quot;m73.666 4.4938h0.72692=
v0.87505h-0.72692zm0-2.7733h0.72692v0.87505h-0.72692z&quot;/&gt;&lt;/g&gt;&=
lt;g id=3D&quot;text44877&quot; stroke-width=3D&quot;.26458px&quot; aria-la=
bel=3D&quot;Mounting FS Bon /foo/a:&quot;&gt;&lt;path id=3D&quot;path126&qu=
ot; d=3D&quot;m98.942 0.34933h1.037l1.3126 3.5002 1.3195-3.5002h1.037v5.143=
5h-0.67869v-4.5165l-1.3264 3.5278h-0.69935l-1.3264-3.5278v4.5165h-0.67524z&=
quot;/&gt;&lt;path id=3D&quot;path128&quot; d=3D&quot;m106.5 2.0788q-0.5098=
7 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887 0 0.69246 0.29284 1.0921=
 0.29627 0.39619 0.80959 0.39619 0.50643 0 0.80271-0.39963t0.29628-1.0887q0=
-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.82683 =
0 1.2988 0.53744 0.47197 0.53744 0.47197 1.4883 0 0.9474-0.47197 1.4883-0.4=
7198 0.53744-1.2988 0.53744-0.83026 0-1.3022-0.53744-0.46854-0.54088-0.4685=
4-1.4883 0-0.95085 0.46854-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt=
;&lt;path id=3D&quot;path130&quot; d=3D&quot;m109.25 3.9701v-2.3358h0.6339v=
2.3117q0 0.54777 0.2136 0.82338 0.21359 0.27216 0.64079 0.27216 0.51331 0 0=
.80959-0.32728 0.29973-0.32728 0.29973-0.89228v-2.1876h0.63389v3.8585h-0.63=
389v-0.59256q-0.23082 0.3514-0.53744 0.52365-0.30317 0.16881-0.70624 0.1688=
1-0.66491 0-1.0094-0.41341-0.34451-0.41341-0.34451-1.2092z&quot;/&gt;&lt;pa=
th id=3D&quot;path132&quot; d=3D&quot;m117 3.164v2.3289h-0.6339v-2.3082q0-0=
.54777-0.21359-0.81993-0.2136-0.27216-0.64079-0.27216-0.51332 0-0.8096 0.32=
728t-0.29628 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.59945q0.22738-0.3479=
5 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0 1.006 0.41341 0.=
34106 0.40997 0.34106 1.2092z&quot;/&gt;&lt;path id=3D&quot;path134&quot; d=
=3D&quot;m118.89 0.53881v1.0955h1.3057v0.49265h-1.3057v2.0946q0 0.47198 0.1=
2747 0.60634 0.13091 0.13436 0.5271 0.13436h0.65112v0.53055h-0.65112q-0.733=
81 0-1.0129-0.27216-0.27905-0.27561-0.27905-0.99908v-2.0946h-0.46509v-0.492=
65h0.46509v-1.0955z&quot;/&gt;&lt;path id=3D&quot;path136&quot; d=3D&quot;m=
121.03 1.6344h0.63389v3.8585h-0.63389zm0-1.5021h0.63389v0.80271h-0.63389z&q=
uot;/&gt;&lt;path id=3D&quot;path138&quot; d=3D&quot;m126.2 3.164v2.3289h-0=
.6339v-2.3082q0-0.54777-0.21359-0.81993-0.2136-0.27216-0.64079-0.27216-0.51=
332 0-0.8096 0.32728t-0.29628 0.89228v2.1807h-0.63734v-3.8585h0.63734v0.599=
45q0.22738-0.34795 0.53399-0.52021 0.31006-0.17225 0.71314-0.17225 0.6649 0=
 1.006 0.41341 0.34106 0.40997 0.34106 1.2092z&quot;/&gt;&lt;path id=3D&quo=
t;path140&quot; d=3D&quot;m130 3.5188q0-0.68902-0.28594-1.068-0.2825-0.3789=
6-0.79582-0.37896-0.50987 0-0.79582 0.37896-0.2825 0.37896-0.2825 1.068 0 0=
.68557 0.2825 1.0645 0.28595 0.37896 0.79582 0.37896 0.51332 0 0.79582-0.37=
896 0.28594-0.37896 0.28594-1.0645zm0.6339 1.4952q0 0.9853-0.43753 1.4642-0=
.43753 0.48231-1.3401 0.48231-0.33418 0-0.63045-0.051677-0.29628-0.048231-0=
.57534-0.15158v-0.61667q0.27906 0.15158 0.55122 0.22393 0.27216 0.072347 0.=
55466 0.072347 0.62356 0 0.93362-0.32728 0.31006-0.32384 0.31006-0.98185v-0=
.3135q-0.19637 0.34106-0.50298 0.50987-0.30662 0.16881-0.73381 0.16881-0.70=
969 0-1.1438-0.54088-0.43408-0.54088-0.43408-1.4332 0-0.89573 0.43408-1.436=
6 0.43408-0.54088 1.1438-0.54088 0.42719 0 0.73381 0.16881 0.30661 0.16881 =
0.50298 0.50987v-0.58567h0.6339z&quot;/&gt;&lt;path id=3D&quot;path142&quot=
; d=3D&quot;m134.21 0.34933h2.9559v0.58567h-2.26v1.5158h2.0395v0.58567h-2.0=
395v2.4564h-0.69591z&quot;/&gt;&lt;path id=3D&quot;path144&quot; d=3D&quot;=
m141.23 0.51814v0.67868q-0.39618-0.18948-0.74758-0.2825t-0.67869-0.093018q-=
0.56844 0-0.8785 0.22049-0.30661 0.22049-0.30661 0.62701 0 0.34106 0.20326 =
0.51676 0.20671 0.17225 0.77859 0.27905l0.42031 0.086127q0.77859 0.14814 1.=
1472 0.52365 0.37207 0.37207 0.37207 0.99908 0 0.74759-0.50298 1.1334-0.499=
54 0.38585-1.4676 0.38585-0.36518 0-0.77859-0.082682-0.40997-0.082682-0.850=
94-0.2446v-0.71658q0.42374 0.23771 0.83026 0.35829 0.40653 0.12058 0.79927 =
0.12058 0.596 0 0.91984-0.23427 0.32384-0.23427 0.32384-0.66835 0-0.37896-0=
.23427-0.59256-0.23082-0.2136-0.76137-0.32039l-0.42374-0.082682q-0.77859-0.=
15503-1.1266-0.48576-0.34795-0.33073-0.34795-0.91984 0-0.68213 0.47886-1.07=
49 0.48232-0.39274 1.3264-0.39274 0.36173 0 0.73725 0.065457 0.37551 0.0654=
57 0.76825 0.19637z&quot;/&gt;&lt;path id=3D&quot;path146&quot; d=3D&quot;m=
145.56 3.0365v1.8845h1.1162q0.56155 0 0.83027-0.23082 0.27216-0.23427 0.272=
16-0.71314 0-0.48231-0.27216-0.70969-0.26872-0.23082-0.83027-0.23082zm0-2.1=
153v1.5503h1.0301q0.50988 0 0.75792-0.18948 0.2515-0.19293 0.2515-0.58567 0=
-0.3893-0.2515-0.58222-0.24804-0.19293-0.75792-0.19293zm-0.69591-0.57189h1.=
7777q0.79582 0 1.2264 0.33073 0.43064 0.33073 0.43064 0.94051 0 0.47198-0.2=
2049 0.75103-0.22048 0.27905-0.64767 0.34795 0.51332 0.11024 0.79581 0.4616=
4 0.28595 0.34795 0.28595 0.87161 0 0.68902-0.46854 1.0645-0.46853 0.37552-=
1.3332 0.37552h-1.8466z&quot;/&gt;&lt;path id=3D&quot;path148&quot; d=3D&qu=
ot;m108.99 9.2549q-0.50987 0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887=
t0.29283 1.0921q0.29628 0.39619 0.8096 0.39619 0.50643 0 0.80271-0.39963t0.=
29628-1.0887q0-0.68557-0.29628-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.=
53744q0.82683 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47=
198 1.4883-0.47197 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46854-=
0.54088-0.46854-1.4883 0-0.95085 0.46854-1.4883 0.47197-0.53744 1.3022-0.53=
744z&quot;/&gt;&lt;path id=3D&quot;path150&quot; d=3D&quot;m115.02 10.34v2.=
3289h-0.63389v-2.3082q0-0.54777-0.2136-0.81993-0.2136-0.27216-0.64079-0.272=
16-0.51332 0-0.8096 0.32728t-0.29628 0.89228v2.1807h-0.63734v-3.8585h0.6373=
4v0.59945q0.22738-0.34795 0.534-0.52021 0.31005-0.17225 0.71313-0.17225 0.6=
649 0 1.006 0.41341 0.34106 0.40997 0.34106 1.2092z&quot;/&gt;&lt;path id=
=3D&quot;path152&quot; d=3D&quot;m119.65 7.5255h0.58567l-1.7914 5.7981h-0.5=
8567z&quot;/&gt;&lt;path id=3D&quot;path154&quot; d=3D&quot;m122.86 7.3084v=
0.5271h-0.60634q-0.34106 0-0.47542 0.1378-0.13091 0.1378-0.13091 0.49609v0.=
34106h1.0439v0.49265h-1.0439v3.3659h-0.63735v-3.3659h-0.60633v-0.49265h0.60=
633v-0.26872q0-0.64423 0.29973-0.93707 0.29972-0.29628 0.95084-0.29628z&quo=
t;/&gt;&lt;path id=3D&quot;path156&quot; d=3D&quot;m124.88 9.2549q-0.50988 =
0-0.80615 0.39963-0.29628 0.39619-0.29628 1.0887t0.29283 1.0921q0.29628 0.3=
9619 0.8096 0.39619 0.50643 0 0.80271-0.39963 0.29627-0.39963 0.29627-1.088=
7 0-0.68557-0.29627-1.0852-0.29628-0.40308-0.80271-0.40308zm0-0.53744q0.826=
82 0 1.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-=
0.47198 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.4=
6853-1.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/=
&gt;&lt;path id=3D&quot;path158&quot; d=3D&quot;m129.2 9.2549q-0.50988 0-0.=
80616 0.39963-0.29627 0.39619-0.29627 1.0887t0.29283 1.0921q0.29628 0.39619=
 0.8096 0.39619 0.50643 0 0.8027-0.39963 0.29628-0.39963 0.29628-1.0887 0-0=
.68557-0.29628-1.0852-0.29627-0.40308-0.8027-0.40308zm0-0.53744q0.82682 0 1=
.2988 0.53744 0.47198 0.53744 0.47198 1.4883 0 0.9474-0.47198 1.4883-0.4719=
8 0.53744-1.2988 0.53744-0.83027 0-1.3022-0.53744-0.46853-0.54088-0.46853-1=
.4883 0-0.95085 0.46853-1.4883 0.47198-0.53744 1.3022-0.53744z&quot;/&gt;&l=
t;path id=3D&quot;path160&quot; d=3D&quot;m133.15 7.5255h0.58567l-1.7915 5.=
7981h-0.58566z&quot;/&gt;&lt;path id=3D&quot;path162&quot; d=3D&quot;m136.1=
5 10.729q-0.76825 0-1.0645 0.1757t-0.29628 0.59945q0 0.33762 0.22049 0.5374=
4 0.22393 0.19637 0.60633 0.19637 0.5271 0 0.84405-0.37207 0.3204-0.37552 0=
.3204-0.99563v-0.14125zm1.2644-0.26183v2.2014h-0.63389v-0.58567q-0.21704 0.=
3514-0.54088 0.52021-0.32384 0.16536-0.79238 0.16536-0.59255 0-0.94395-0.33=
073-0.34796-0.33417-0.34796-0.89228 0-0.65112 0.43408-0.98185 0.43753-0.330=
73 1.3022-0.33073h0.88884v-0.06201q0-0.43753-0.28939-0.67524-0.28594-0.2411=
6-0.80615-0.24116-0.33073 0-0.64424 0.079237-0.3135 0.079237-0.60289 0.2377=
1v-0.58567q0.34796-0.13436 0.67524-0.19982 0.32728-0.068902 0.63734-0.06890=
2 0.83716 0 1.2506 0.43408t0.41341 1.316z&quot;/&gt;&lt;path id=3D&quot;pat=
h164&quot; d=3D&quot;m138.88 11.794h0.72691v0.87506h-0.72691zm0-2.7733h0.72=
691v0.87505h-0.72691z&quot;/&gt;&lt;/g&gt;&lt;g id=3D&quot;text18565&quot; =
stroke-width=3D&quot;.26458px&quot; aria-label=3D&quot;/=C2=A0 foo/=C2=A0 =
=C2=A0 b=C2=A0 bar/=C2=A0 =C2=A0 c=C2=A0 =C2=A0 d&quot;&gt;&lt;path id=3D&q=
uot;path167&quot; d=3D&quot;m114.16 16.476h0.65457l-2.7078 5.7981h-0.65801z=
&quot;/&gt;&lt;path id=3D&quot;path169&quot; d=3D&quot;m123.25 23.435v0.527=
1h-0.72003q-0.34106 0-0.47542 0.14125-0.13092 0.1378-0.13092 0.49265v0.3410=
6h1.3264v0.49265h-1.3264v3.3659h-0.63389v-3.3659h-1.0301v-0.49265h1.0301v-0=
.26872q0-0.6339 0.28938-0.93362 0.29284-0.29972 0.90951-0.29972z&quot;/&gt;=
&lt;path id=3D&quot;path171&quot; d=3D&quot;m125.96 25.381q-0.48231 0-0.730=
36 0.37552-0.24804 0.37552-0.24804 1.1128 0 0.73381 0.24804 1.1128 0.24805 =
0.37552 0.73036 0.37552 0.48576 0 0.73381-0.37552 0.24805-0.37896 0.24805-1=
.1128 0-0.73725-0.24805-1.1128-0.24805-0.37552-0.73381-0.37552zm0-0.53744q0=
.80271 0 1.2265 0.52021 0.42719 0.52021 0.42719 1.5055 0 0.98874-0.42375 1.=
509-0.42374 0.51676-1.2299 0.51676-0.8027 0-1.2264-0.51676-0.42375-0.52021-=
0.42375-1.509 0-0.9853 0.42375-1.5055 0.42375-0.52021 1.2264-0.52021z&quot;=
/&gt;&lt;path id=3D&quot;path173&quot; d=3D&quot;m130.21 25.381q-0.48231 0-=
0.73036 0.37552-0.24805 0.37552-0.24805 1.1128 0 0.73381 0.24805 1.1128 0.2=
4805 0.37552 0.73036 0.37552 0.48576 0 0.7338-0.37552 0.24805-0.37896 0.248=
05-1.1128 0-0.73725-0.24805-1.1128-0.24804-0.37552-0.7338-0.37552zm0-0.5374=
4q0.80271 0 1.2264 0.52021 0.4272 0.52021 0.4272 1.5055 0 0.98874-0.42375 1=
.509-0.42375 0.51676-1.2299 0.51676-0.80271 0-1.2265-0.51676-0.42374-0.5202=
1-0.42374-1.509 0-0.9853 0.42374-1.5055 0.42375-0.52021 1.2265-0.52021z&quo=
t;/&gt;&lt;path id=3D&quot;path175&quot; d=3D&quot;m135.4 23.652h0.65457l-2=
.7078 5.7981h-0.65801z&quot;/&gt;&lt;path id=3D&quot;path177&quot; d=3D&quo=
t;m131.25 41.222q0-0.73725-0.23427-1.1128-0.23426-0.37552-0.69246-0.37552-0=
.46165 0-0.69936 0.37896-0.23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1=
.1093 0.23771 0.37896 0.69936 0.37896 0.4582 0 0.69246-0.37552 0.23427-0.37=
552 0.23427-1.1128zm-1.8638-1.4401q0.15158-0.2825 0.41686-0.43408 0.26872-0=
.15158 0.62012-0.15158 0.6959 0 1.0955 0.53744 0.39963 0.53399 0.39963 1.47=
45 0 0.95429-0.40308 1.4986-0.39963 0.54088-1.099 0.54088-0.3445 0-0.60978-=
0.14814-0.26182-0.15158-0.4203-0.43753v0.48576h-0.6339v-5.3606h0.6339z&quot=
;/&gt;&lt;path id=3D&quot;path179&quot; d=3D&quot;m122.75 48.398q0-0.73725-=
0.23427-1.1128-0.23427-0.37552-0.69246-0.37552-0.46165 0-0.69936 0.37896-0.=
23771 0.37552-0.23771 1.1093 0 0.73036 0.23771 1.1093 0.23771 0.37896 0.699=
36 0.37896 0.45819 0 0.69246-0.37552 0.23427-0.37552 0.23427-1.1128zm-1.863=
8-1.4401q0.15158-0.2825 0.41686-0.43408 0.26871-0.15158 0.62011-0.15158 0.6=
9591 0 1.0955 0.53744 0.39964 0.53399 0.39964 1.4745 0 0.95429-0.40308 1.49=
86-0.39963 0.54088-1.099 0.54088-0.34451 0-0.60978-0.14814-0.26183-0.15158-=
0.4203-0.43753v0.48576h-0.6339v-5.3606h0.6339z&quot;/&gt;&lt;path id=3D&quo=
t;path181&quot; d=3D&quot;m126.26 48.384h-0.21015q-0.55466 0-0.83716 0.1963=
7-0.27905 0.19293-0.27905 0.57878 0 0.34795 0.21015 0.54088 0.21015 0.19292=
 0.58222 0.19292 0.52366 0 0.82338-0.36174 0.29972-0.36518 0.30317-1.006v-0=
.14125zm1.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.=
50988-0.30661 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33=
417-0.3514-0.89228 0-0.64423 0.43064-0.97841 0.43408-0.33418 1.2712-0.33418=
h0.85094v-0.09991q-3e-3 -0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.=
21015-0.32384 0-0.65457 0.09302t-0.64423 0.27216v-0.6339q0.3514-0.13436 0.6=
7179-0.19982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.3410=
6 0.14125 0.55121 0.42375 0.13092 0.17226 0.18604 0.42719 0.0551 0.25149 0.=
0551 0.75792z&quot;/&gt;&lt;path id=3D&quot;path183&quot; d=3D&quot;m132.07=
 47.261q-0.20326-0.15848-0.41342-0.23082-0.21015-0.07235-0.46164-0.07235-0.=
59255 0-0.90606 0.37207-0.3135 0.37207-0.3135 1.0749v1.9189h-0.63735v-3.858=
5h0.63735v0.75448q0.15847-0.40997 0.48576-0.62701 0.33073-0.22049 0.78203-0=
.22049 0.23427 0 0.43753 0.05857t0.3893 0.18259z&quot;/&gt;&lt;path id=3D&q=
uot;path185&quot; d=3D&quot;m135.4 45.18h0.65457l-2.7078 5.7981h-0.65801z&q=
uot;/&gt;&lt;path id=3D&quot;path187&quot; d=3D&quot;m131.74 57.303q-0.2549=
4 0.14814-0.5271 0.22049-0.26872 0.07579-0.55122 0.07579-0.89572 0-1.4022-0=
.53744-0.50299-0.53744-0.50299-1.4883t0.50299-1.4883q0.50643-0.53744 1.4022=
-0.53744 0.27905 0 0.54433 0.07235 0.26527 0.07235 0.53399 0.22393v0.6649q-=
0.25149-0.22393-0.50643-0.32384-0.25149-0.09991-0.57189-0.09991-0.596 0-0.9=
1639 0.38585-0.3204 0.38585-0.3204 1.1024 0 0.71314 0.3204 1.1024 0.32384 0=
.38585 0.91639 0.38585 0.33073 0 0.59256-0.09991 0.26183-0.10335 0.48576-0.=
31695z&quot;/&gt;&lt;path id=3D&quot;path189&quot; d=3D&quot;m131.04 61.31v=
-1.9947h0.6339v5.3606h-0.6339v-0.48576q-0.15847 0.28594-0.42374 0.43753-0.2=
6183 0.14814-0.60634 0.14814-0.69936 0-1.1024-0.54088-0.39963-0.54433-0.399=
63-1.4986 0-0.94051 0.40307-1.4745 0.40308-0.53744 1.099-0.53744 0.34795 0 =
0.61323 0.15158 0.26527 0.14814 0.41685 0.43408zm-1.8638 1.4401q0 0.73725 0=
.23427 1.1128t0.69247 0.37552q0.45819 0 0.69591-0.37896 0.24115-0.37896 0.2=
4115-1.1093 0-0.73381-0.24115-1.1093-0.23772-0.37896-0.69591-0.37896-0.4582=
 0-0.69247 0.37552t-0.23427 1.1128z&quot;/&gt;&lt;/g&gt;&lt;path id=3D&quot=
;path18567&quot; d=3D&quot;m113.38 23.535v22.663&quot; fill=3D&quot;none&qu=
ot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-wid=
th=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path=
 id=3D&quot;path18569&quot; d=3D&quot;m113.38 24.564c0 1.5071 1.5429 1.4354=
 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quo=
t;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;r=
ound&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:norm=
al&quot;/&gt;&lt;path id=3D&quot;path18571&quot; d=3D&quot;m113.38 46.199c0=
 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&qu=
ot; marker-end=3D&quot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; str=
oke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&=
quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path18573&quot; d=3D&=
quot;m122.11 30.8-6e-3 8.5867&quot; fill=3D&quot;none&quot; stroke=3D&quot;=
#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&q=
uot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path185=
75&quot; d=3D&quot;m122.11 32.462c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.84=
6-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&=
quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-w=
idth=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;pa=
th id=3D&quot;path18577&quot; d=3D&quot;m122.11 39.387c0 1.5071 1.5429 1.43=
54 1.5429 1.4354l3.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&q=
uot;url(#Arrow1Mend)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot=
;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quot;paint-order:no=
rmal&quot;/&gt;&lt;path id=3D&quot;path18579&quot; d=3D&quot;m122.11 52.334=
-6e-3 8.5867&quot; fill=3D&quot;none&quot; stroke=3D&quot;#000&quot; stroke=
-linecap=3D&quot;round&quot; stroke-width=3D&quot;.52917&quot; style=3D&quo=
t;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;path18581&quot; d=3D&quo=
t;m122.11 53.996c0 1.5071 1.5429 1.4354 1.5429 1.4354l3.846-0.0019&quot; fi=
ll=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Mend)&quot; stroke=3D&q=
uot;#000&quot; stroke-linecap=3D&quot;round&quot; stroke-width=3D&quot;.529=
17&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt;path id=3D&quot;pat=
h18583&quot; d=3D&quot;m122.11 60.92c0 1.5071 1.5429 1.4354 1.5429 1.4354l3=
.846-0.0019&quot; fill=3D&quot;none&quot; marker-end=3D&quot;url(#Arrow1Men=
d)&quot; stroke=3D&quot;#000&quot; stroke-linecap=3D&quot;round&quot; strok=
e-width=3D&quot;.52917&quot; style=3D&quot;paint-order:normal&quot;/&gt;&lt=
;g id=3D&quot;text22069&quot; fill=3D&quot;#0081cf&quot; stroke-width=3D&qu=
ot;.26458px&quot; aria-label=3D&quot;a&quot;&gt;&lt;path id=3D&quot;path192=
&quot; d=3D&quot;m130.57 33.771h-0.21015q-0.55466 0-0.83716 0.19637-0.27905=
 0.19292-0.27905 0.57878 0 0.34796 0.21015 0.54088 0.21015 0.19292 0.58222 =
0.19292 0.52365 0 0.82338-0.36174 0.29972-0.36518 0.30317-1.006v-0.14125zm1=
.2299-0.26183v2.2014h-0.63734v-0.57189q-0.20326 0.34451-0.51332 0.50988-0.3=
0662 0.16192-0.74759 0.16192-0.58911 0-0.94051-0.33073-0.3514-0.33418-0.351=
4-0.89228 0-0.64423 0.43064-0.97841 0.43408-0.33418 1.2712-0.33418h0.85094v=
-0.09991q-3e-3 -0.46164-0.23427-0.66835-0.23082-0.21015-0.73725-0.21015-0.3=
2384 0-0.65457 0.09302t-0.64423 0.27216v-0.6339q0.3514-0.13436 0.67179-0.19=
982 0.32384-0.0689 0.62701-0.0689 0.47887 0 0.81649 0.14125 0.34106 0.14125=
 0.55121 0.42375 0.13092 0.17226 0.18604 0.42719 0.0551 0.25149 0.0551 0.75=
792z&quot;/&gt;&lt;/g&gt;&lt;/svg&gt;<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Klaus Heinrich Kiwi &lt;<a href=3D"mailto:kkiwi@redhat.co=
m" target=3D"_blank">kkiwi@redhat.com</a>&gt;<div>Manager, Software Enginee=
ring - Red Hat Virtualization</div></div></div></div>

--0000000000004165f905c9eda3bd--


