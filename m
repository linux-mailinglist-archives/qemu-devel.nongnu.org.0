Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293E06DAAD8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 11:26:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkiKy-0003C3-30; Fri, 07 Apr 2023 05:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkiKu-0003BS-PE
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:24:49 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkiKr-0001S7-Bo
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:24:47 -0400
Received: by mail-il1-x130.google.com with SMTP id t5so10569612ilu.5
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680859483; x=1683451483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8RAGYZ37ImIGmfU8cYTgZPjkvmpZVWuj6In1+rB5upg=;
 b=d/QzDwEwRWz0kS2hI9keDeAujx5Vtc4+vAWI7P8OLsFLl0wgvQd6Zv1EpSzz1g2BYH
 4r/M3DzRqrq8VhCx1GcLcMqtWyqbqJg3VMxG+Ss1FZBjdBBkNdiVs57vn77s+k3cL1Mw
 +9/hkPY6Rovlx1Hgv/h+Ie9C0Zz55X6BL3/evH4AVzi/ucVZMzGCaQTyaAp7AI4jscA/
 fUxPSOGmIW5RLQEsDauRu3ozl6w907TdMnqwFUyIboXQwqUrjazE+/fT/ppZOSKm9aPo
 H8eby83/yoWcdjxYh8/Q/tJjZM7XeNFC0k9sQCcGvLX7zc6RSVhmYRzCGz7a6YqtuN5x
 0xdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680859483; x=1683451483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8RAGYZ37ImIGmfU8cYTgZPjkvmpZVWuj6In1+rB5upg=;
 b=lI8E0CeaYVIjhyJGStJDChgCtRk9Qr5ZHFS5z6knHxPZhYP5VNFuBOCuBy3pHzZxyE
 fMH62oImXxdMbl8JziAQ3zHEF9DgRHfg6FK9+i1CybEbiDMfBhikEZGtJLqt5/32AI4o
 Mtm3vZbslhVHzqMiy8a+GkCkZCp2AaNU3s+XgGMHjKqin/d2/bQLRSKzKvp8gVNS8o6L
 K7kL0s+Qx288DhIo+9HsW59MeF/WVzQv9EOePz3em7uNmglde+6pn/oOPDF0IB58hkok
 D3Sj4UWXEEJcwHwWrZCDl3iAaCYRWpGDPB9slawqnc0SvG/coPaG/Ml7WZiQ9xvhD0ZJ
 pgKA==
X-Gm-Message-State: AAQBX9et7j/XYwL3OvxQ4QrIK6Z5GpId/ZmdGV1TorRDIz4UYBO1g73r
 Buv/S4bmDhjlKgXvqI1whoQKgD8q4lo5egLvSUY+jOO9V9Z0yIx5Cld5jw==
X-Google-Smtp-Source: AKy350YI5kr9a3TmPwjz4oHEeY7Qcf9hdpWjoogHXx439mNUIZKnhMnPj21n/VkxCC4YcFZe9aM1mVZJ+9h4TemTYX8=
X-Received: by 2002:a92:ca4b:0:b0:323:cab8:3c0c with SMTP id
 q11-20020a92ca4b000000b00323cab83c0cmr1003958ilo.5.1680859482981; Fri, 07 Apr
 2023 02:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230407035709-mutt-send-email-mst@kernel.org>
From: David Turner <digit@google.com>
Date: Fri, 7 Apr 2023 11:24:30 +0200
Message-ID: <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000670f7205f8bb987b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=digit@google.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000670f7205f8bb987b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The <linux/vhost.h> of glib-2.17 begins with:

#ifndef _LINUX_VHOST_H
#define _LINUX_VHOST_H
/* Userspace interface for in-kernel virtio accelerators. */
/* vhost is used to reduce the number of system calls involved in virtio.
 *
 * Existing virtio net code is used in the guest without modification.
 *
 * This header includes interface used by userspace hypervisor for
 * device configuration.
 */
#include <linux/types.h>
#include <linux/ioctl.h>
#include <linux/virtio_config.h>
#include <linux/virtio_ring.h>


See
https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x86_=
64-linux-glibc2.17-4.8/+/refs/heads/master/sysroot/usr/include/linux/vhost.=
h

Here's the compilation error I get in this case:

FAILED: subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o

/src/prebuilts/clang/clang-r487747/bin/clang --sysroot=3D/out/sysroot -m64
-mcx16 -Isubprojects/libvhost-user/libvhost-user.a.p
-Isubprojects/libvhost-user -I../../
src/third_party/qemu/subprojects/libvhost-user
-I/out/dest-install/usr/include -fcolor-diagnostics -Wall -Winvalid-pch
-std=3Dgnu99 -O2 -g -Wsign-compare -Wdeclarat
ion-after-statement -Wstrict-aliasing -fno-pie -D_FILE_OFFSET_BITS=3D64
-D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef
-Wwrite-strings -Wmissi
ng-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-b
ody -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wmissing-format-attribute -Wthread-safety -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-sh
ift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-Wno-gnu-variable-sized-type-not-at-end -fstack-
protector-strong -pthread -D_GNU_SOURCE -MD -MQ
subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -MF
subprojects/libvhost-user/libvhost-user.a.p/libv
host-user.c.o.d -o
subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c
../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c

../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:529:17=
:
error: use of undeclared identifier 'VIRTIO_F_VERSION_1'

        1ULL << VIRTIO_F_VERSION_1 |

                ^
../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:563:30=
:
error: use of undeclared identifier 'VIRTIO_F_VERSION_1'

    if (!vu_has_feature(dev, VIRTIO_F_VERSION_1)) {

                             ^
../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:632:22=
:
warning: unused variable 'dev_region' [-Wunused-variable]

        VuDevRegion *dev_region =3D &dev->regions[i];

                     ^
../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:633:13=
:
warning: unused variable 'ret' [-Wunused-variable]

        int ret;

            ^
2 warnings and 2 errors generated.


On Fri, Apr 7, 2023 at 10:03=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> If you are reposting, please version patchsets, E.g.
> -v2 flag for git format-patch will enerate [PATCH v2] for you.
>
> Repeating what I said on previous version:
>
> On Wed, Apr 05, 2023 at 07:21:07PM +0200, David 'Digit' Turner wrote:
> > The source file uses VIRTIO_F_VERSION_1 which is
> > not defined by <linux/virtio_config.h> on Debian 10.
> >
> > The system-provided <linux/virtio_config.h> which
> > does not include the macro definition is included
> > through <linux/vhost.h>, so fix the issue by including
> > the standard-headers version before that.
> >
> > Signed-off-by: David 'Digit' Turner <digit@google.com>
>
> This happens to work usually but there's no guarantee
> "standard-headers/linux/virtio_config.h"
> and <linux/virtio_config.h> are interchangeable or
> even do not conflict.
>
> But where is <linux/vhost.h> using <linux/virtio_config.h>?
> Everyone should be using "standard-headers/linux/virtio_config.h".
>
>
> > ---
> >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/subprojects/libvhost-user/libvhost-user.c
> b/subprojects/libvhost-user/libvhost-user.c
> > index 0200b78e8e..0a5768cb55 100644
> > --- a/subprojects/libvhost-user/libvhost-user.c
> > +++ b/subprojects/libvhost-user/libvhost-user.c
> > @@ -32,6 +32,12 @@
> >  #include <sys/mman.h>
> >  #include <endian.h>
> >
> > +/* Necessary to provide VIRTIO_F_VERSION_1 on system
> > + * with older linux headers. Must appear before
> > + * <linux/vhost.h> below.
> > + */
> > +#include "standard-headers/linux/virtio_config.h"
> > +
> >  #if defined(__linux__)
> >  #include <sys/syscall.h>
> >  #include <fcntl.h>
> > --
> > 2.40.0.348.gf938b09366-goog
>
>

--000000000000670f7205f8bb987b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The &lt;linux/vhost.h&gt; of glib-2.17 begins with:<br><br=
><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><font face=
=3D"monospace" size=3D"1">#ifndef _LINUX_VHOST_H<br>#define _LINUX_VHOST_H<=
br>/* Userspace interface for in-kernel virtio accelerators. */<br>/* vhost=
 is used to reduce the number of system calls involved in virtio.<br>=C2=A0=
*<br>=C2=A0* Existing virtio net code is used in the guest without modifica=
tion.<br>=C2=A0*<br>=C2=A0* This header includes interface used by userspac=
e hypervisor for<br>=C2=A0* device configuration.<br>=C2=A0*/<br>#include &=
lt;linux/types.h&gt;<br>#include &lt;linux/ioctl.h&gt;<br>#include &lt;linu=
x/virtio_config.h&gt;<br>#include &lt;linux/virtio_ring.h&gt;</font></block=
quote><br>See=C2=A0<a href=3D"https://android.googlesource.com/platform/pre=
builts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/+/refs/heads/master/sy=
sroot/usr/include/linux/vhost.h">https://android.googlesource.com/platform/=
prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/+/refs/heads/master=
/sysroot/usr/include/linux/vhost.h</a><br><br>Here&#39;s the compilation er=
ror I get in this case:<br><br><blockquote style=3D"margin:0 0 0 40px;borde=
r:none;padding:0px"><font face=3D"monospace">FAILED: subprojects/libvhost-u=
ser/libvhost-user.a.p/libvhost-user.c.o =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br></font><font face=3D"monospace">/src/prebuilts/clang/clang-r48774=
7/bin/clang --sysroot=3D/out/sysroot -m64 -mcx16 -Isubprojects/libvhost-use=
r/libvhost-user.a.p -Isubprojects/libvhost-user -I../../<br></font><font fa=
ce=3D"monospace">src/third_party/qemu/subprojects/libvhost-user -I/out/dest=
-install/usr/include -fcolor-diagnostics -Wall -Winvalid-pch -std=3Dgnu99 -=
O2 -g -Wsign-compare -Wdeclarat<br></font><font face=3D"monospace">ion-afte=
r-statement -Wstrict-aliasing -fno-pie -D_FILE_OFFSET_BITS=3D64 -D_LARGEFIL=
E_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -=
Wmissi<br></font><font face=3D"monospace">ng-prototypes -Wstrict-prototypes=
 -Wredundant-decls -Wold-style-definition -Wtype-limits -Wformat-security -=
Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-b<br></font><font face=
=3D"monospace">ody -Wnested-externs -Wendif-labels -Wexpansion-to-defined -=
Wmissing-format-attribute -Wthread-safety -Wno-initializer-overrides -Wno-m=
issing-include-dirs -Wno-sh<br></font><font face=3D"monospace">ift-negative=
-value -Wno-string-plus-int -Wno-typedef-redefinition -Wno-tautological-typ=
e-limit-compare -Wno-psabi -Wno-gnu-variable-sized-type-not-at-end -fstack-=
<br></font><font face=3D"monospace">protector-strong -pthread -D_GNU_SOURCE=
 -MD -MQ subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -MF =
subprojects/libvhost-user/libvhost-user.a.p/libv<br></font><font face=3D"mo=
nospace">host-user.c.o.d -o subprojects/libvhost-user/libvhost-user.a.p/lib=
vhost-user.c.o -c ../../src/third_party/qemu/subprojects/libvhost-user/libv=
host-user.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"mono=
space">../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c=
:529:17: error: use of undeclared identifier &#39;VIRTIO_F_VERSION_1&#39; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1ULL &lt;&lt; VIRTIO_F_VERSION_1 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font fa=
ce=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> <=
/font><font face=3D"monospace">../../src/third_party/qemu/subprojects/libvh=
ost-user/libvhost-user.c:563:30: error: use of undeclared identifier &#39;V=
IRTIO_F_VERSION_1&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"mono=
space">=C2=A0 =C2=A0 if (!vu_has_feature(dev, VIRTIO_F_VERSION_1)) { =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^ =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"mono=
space">../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c=
:632:22: warning: unused variable &#39;dev_region&#39; [-Wunused-variable] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 VuDevRegion *dev_region =3D &amp;dev-&gt;regions[i]; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=
../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:633:13=
: warning: unused variable &#39;ret&#39; [-Wunused-variable] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 int ret; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monos=
pace">2 warnings and 2 errors generated.=C2=A0=C2=A0</font></blockquote></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Fri, Apr 7, 2023 at 10:03=E2=80=AFAM Michael S. Tsirkin &lt;<a href=3D"mail=
to:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">If you are reposting, please version patch=
sets, E.g.<br>
-v2 flag for git format-patch will enerate [PATCH v2] for you.<br>
<br>
Repeating what I said on previous version:<br>
<br>
On Wed, Apr 05, 2023 at 07:21:07PM +0200, David &#39;Digit&#39; Turner wrot=
e:<br>
&gt; The source file uses VIRTIO_F_VERSION_1 which is<br>
&gt; not defined by &lt;linux/virtio_config.h&gt; on Debian 10.<br>
&gt; <br>
&gt; The system-provided &lt;linux/virtio_config.h&gt; which<br>
&gt; does not include the macro definition is included<br>
&gt; through &lt;linux/vhost.h&gt;, so fix the issue by including<br>
&gt; the standard-headers version before that.<br>
&gt; <br>
&gt; Signed-off-by: David &#39;Digit&#39; Turner &lt;<a href=3D"mailto:digi=
t@google.com" target=3D"_blank">digit@google.com</a>&gt;<br>
<br>
This happens to work usually but there&#39;s no guarantee<br>
&quot;standard-headers/linux/virtio_config.h&quot;<br>
and &lt;linux/virtio_config.h&gt; are interchangeable or<br>
even do not conflict.<br>
<br>
But where is &lt;linux/vhost.h&gt; using &lt;linux/virtio_config.h&gt;?<br>
Everyone should be using &quot;standard-headers/linux/virtio_config.h&quot;=
.<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 subprojects/libvhost-user/libvhost-user.c | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/l=
ibvhost-user/libvhost-user.c<br>
&gt; index 0200b78e8e..0a5768cb55 100644<br>
&gt; --- a/subprojects/libvhost-user/libvhost-user.c<br>
&gt; +++ b/subprojects/libvhost-user/libvhost-user.c<br>
&gt; @@ -32,6 +32,12 @@<br>
&gt;=C2=A0 #include &lt;sys/mman.h&gt;<br>
&gt;=C2=A0 #include &lt;endian.h&gt;<br>
&gt;=C2=A0 <br>
&gt; +/* Necessary to provide VIRTIO_F_VERSION_1 on system<br>
&gt; + * with older linux headers. Must appear before<br>
&gt; + * &lt;linux/vhost.h&gt; below.<br>
&gt; + */<br>
&gt; +#include &quot;standard-headers/linux/virtio_config.h&quot;<br>
&gt; +<br>
&gt;=C2=A0 #if defined(__linux__)<br>
&gt;=C2=A0 #include &lt;sys/syscall.h&gt;<br>
&gt;=C2=A0 #include &lt;fcntl.h&gt;<br>
&gt; -- <br>
&gt; 2.40.0.348.gf938b09366-goog<br>
<br>
</blockquote></div>

--000000000000670f7205f8bb987b--

