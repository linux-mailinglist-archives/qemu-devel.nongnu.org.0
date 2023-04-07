Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF26DAAD9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 11:26:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkiLg-0003Ih-Vr; Fri, 07 Apr 2023 05:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkiLe-0003I9-RL
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:25:34 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkiLX-0001lH-L8
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:25:32 -0400
Received: by mail-io1-xd2c.google.com with SMTP id x3so10965700iov.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680859525; x=1683451525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AjDslYH7BlKIRxsDxLo1O2cXgywJ3mHFvnHHI2Xs0MU=;
 b=QBj1u+NDlFt94qpCBX9vn1qW8y80XM2nT/C4BLl6dXFr3iv0t7K2mow61ajK8kWPkU
 Gr4sBQLFIRvK7Tda2kAneuVBMo6F8WTe3GjhTFyzu8CqD8GQjCgfFG+YKyQ/aXDsMcPC
 EUHDOhunppPZSsgKxSh5YmGD0wa0U8mDceg0gQJfqt26Nwj2HI0GIZjXKXUJtigVIIv2
 SBdYVjYF9iNLAK9MZlCJ7U9gZnhjyU3NeNfRFXIiEae5MbOUzyBNMXwLMhl5+bQ5cqv4
 Feifmir32pn2qWgmH/kD838/4+zltrTUpR2ApJ1+lU0S0FXWakA3BEsEsG7CkQn/WuAR
 2kBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680859525; x=1683451525;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AjDslYH7BlKIRxsDxLo1O2cXgywJ3mHFvnHHI2Xs0MU=;
 b=V+we6QNZYYqedVZi5VnFmr8O0Zpca6XVs1vVz2y0qZua7c6BvhJoPkwiUcGCukMH71
 RxtD3CJH9uNA+z9ujzK7rRwfnmDJ4eVuW+rV40A0OoafdjifKLSYBPBp/mMixZTMg5Vc
 hmwgITrSGiyoU1qLaaN8/XSSWMqZLlHziDca/0xfg35p++flY/96wHVg3No9iv233rH+
 e2heqwZqaqo363dlWV9E5yXFPSzdrWJgsm7uUexJlMLnPeOUIqSpRGKD2aJ3WZ5eeQUl
 PNJX20HAtiAHpRCNjPS843Pl/mUb0gGphWfh0AAl8LB1oWujiiXRfXOGZ41lOXeAsnmV
 cKVg==
X-Gm-Message-State: AAQBX9ezg2jyBIYF9q1HgyDaKK4lXpKh3E9J65T3QSrqRsqibRIVkNNX
 wl3fw2xGJuntCBISppN9JeAcca09WabFTBq01scpzvAAA+NZ3RKW99Y=
X-Google-Smtp-Source: AKy350ZG2uT6WuYxzS5NKtE7SykbzMZ00iFNCVFniletAX2doiZhcGmr/87aGUTrbP4pKkKCE/OMO73pF1jh0n9gPaM=
X-Received: by 2002:a02:85e7:0:b0:406:c43f:6320 with SMTP id
 d94-20020a0285e7000000b00406c43f6320mr601900jai.0.1680859525492; Fri, 07 Apr
 2023 02:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
In-Reply-To: <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
From: David Turner <digit@google.com>
Date: Fri, 7 Apr 2023 11:25:14 +0200
Message-ID: <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000eface805f8bb9ada"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=digit@google.com; helo=mail-io1-xd2c.google.com
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

--000000000000eface805f8bb9ada
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I meant glibc-2.17, I am using a sysroot to ensure the generated binaries
run on older Linux distributions.

On Fri, Apr 7, 2023 at 11:24=E2=80=AFAM David Turner <digit@google.com> wro=
te:

> The <linux/vhost.h> of glib-2.17 begins with:
>
> #ifndef _LINUX_VHOST_H
> #define _LINUX_VHOST_H
> /* Userspace interface for in-kernel virtio accelerators. */
> /* vhost is used to reduce the number of system calls involved in virtio.
>  *
>  * Existing virtio net code is used in the guest without modification.
>  *
>  * This header includes interface used by userspace hypervisor for
>  * device configuration.
>  */
> #include <linux/types.h>
> #include <linux/ioctl.h>
> #include <linux/virtio_config.h>
> #include <linux/virtio_ring.h>
>
>
> See
> https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x8=
6_64-linux-glibc2.17-4.8/+/refs/heads/master/sysroot/usr/include/linux/vhos=
t.h
>
> Here's the compilation error I get in this case:
>
> FAILED: subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o
>
> /src/prebuilts/clang/clang-r487747/bin/clang --sysroot=3D/out/sysroot -m6=
4
> -mcx16 -Isubprojects/libvhost-user/libvhost-user.a.p
> -Isubprojects/libvhost-user -I../../
> src/third_party/qemu/subprojects/libvhost-user
> -I/out/dest-install/usr/include -fcolor-diagnostics -Wall -Winvalid-pch
> -std=3Dgnu99 -O2 -g -Wsign-compare -Wdeclarat
> ion-after-statement -Wstrict-aliasing -fno-pie -D_FILE_OFFSET_BITS=3D64
> -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef
> -Wwrite-strings -Wmissi
> ng-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-definitio=
n
> -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
> -Wignored-qualifiers -Wempty-b
> ody -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wmissing-format-attribute -Wthread-safety -Wno-initializer-overrides
> -Wno-missing-include-dirs -Wno-sh
> ift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition
> -Wno-tautological-type-limit-compare -Wno-psabi
> -Wno-gnu-variable-sized-type-not-at-end -fstack-
> protector-strong -pthread -D_GNU_SOURCE -MD -MQ
> subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -MF
> subprojects/libvhost-user/libvhost-user.a.p/libv
> host-user.c.o.d -o
> subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c
> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c
>
> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:529:=
17:
> error: use of undeclared identifier 'VIRTIO_F_VERSION_1'
>
>         1ULL << VIRTIO_F_VERSION_1 |
>
>                 ^
> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:563:=
30:
> error: use of undeclared identifier 'VIRTIO_F_VERSION_1'
>
>     if (!vu_has_feature(dev, VIRTIO_F_VERSION_1)) {
>
>                              ^
> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:632:=
22:
> warning: unused variable 'dev_region' [-Wunused-variable]
>
>         VuDevRegion *dev_region =3D &dev->regions[i];
>
>                      ^
> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:633:=
13:
> warning: unused variable 'ret' [-Wunused-variable]
>
>         int ret;
>
>             ^
> 2 warnings and 2 errors generated.
>
>
> On Fri, Apr 7, 2023 at 10:03=E2=80=AFAM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
>
>> If you are reposting, please version patchsets, E.g.
>> -v2 flag for git format-patch will enerate [PATCH v2] for you.
>>
>> Repeating what I said on previous version:
>>
>> On Wed, Apr 05, 2023 at 07:21:07PM +0200, David 'Digit' Turner wrote:
>> > The source file uses VIRTIO_F_VERSION_1 which is
>> > not defined by <linux/virtio_config.h> on Debian 10.
>> >
>> > The system-provided <linux/virtio_config.h> which
>> > does not include the macro definition is included
>> > through <linux/vhost.h>, so fix the issue by including
>> > the standard-headers version before that.
>> >
>> > Signed-off-by: David 'Digit' Turner <digit@google.com>
>>
>> This happens to work usually but there's no guarantee
>> "standard-headers/linux/virtio_config.h"
>> and <linux/virtio_config.h> are interchangeable or
>> even do not conflict.
>>
>> But where is <linux/vhost.h> using <linux/virtio_config.h>?
>> Everyone should be using "standard-headers/linux/virtio_config.h".
>>
>>
>> > ---
>> >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/subprojects/libvhost-user/libvhost-user.c
>> b/subprojects/libvhost-user/libvhost-user.c
>> > index 0200b78e8e..0a5768cb55 100644
>> > --- a/subprojects/libvhost-user/libvhost-user.c
>> > +++ b/subprojects/libvhost-user/libvhost-user.c
>> > @@ -32,6 +32,12 @@
>> >  #include <sys/mman.h>
>> >  #include <endian.h>
>> >
>> > +/* Necessary to provide VIRTIO_F_VERSION_1 on system
>> > + * with older linux headers. Must appear before
>> > + * <linux/vhost.h> below.
>> > + */
>> > +#include "standard-headers/linux/virtio_config.h"
>> > +
>> >  #if defined(__linux__)
>> >  #include <sys/syscall.h>
>> >  #include <fcntl.h>
>> > --
>> > 2.40.0.348.gf938b09366-goog
>>
>>

--000000000000eface805f8bb9ada
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I meant glibc-2.17, I am using a sysroot to ensure the gen=
erated binaries run on older Linux distributions.</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 11:=
24=E2=80=AFAM David Turner &lt;<a href=3D"mailto:digit@google.com">digit@go=
ogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">The &lt;linux/vhost.h&gt; of glib-2.17 begins with=
:<br><br><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0=
px"><font face=3D"monospace" size=3D"1">#ifndef _LINUX_VHOST_H<br>#define _=
LINUX_VHOST_H<br>/* Userspace interface for in-kernel virtio accelerators. =
*/<br>/* vhost is used to reduce the number of system calls involved in vir=
tio.<br>=C2=A0*<br>=C2=A0* Existing virtio net code is used in the guest wi=
thout modification.<br>=C2=A0*<br>=C2=A0* This header includes interface us=
ed by userspace hypervisor for<br>=C2=A0* device configuration.<br>=C2=A0*/=
<br>#include &lt;linux/types.h&gt;<br>#include &lt;linux/ioctl.h&gt;<br>#in=
clude &lt;linux/virtio_config.h&gt;<br>#include &lt;linux/virtio_ring.h&gt;=
</font></blockquote><br>See=C2=A0<a href=3D"https://android.googlesource.co=
m/platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/+/refs/h=
eads/master/sysroot/usr/include/linux/vhost.h" target=3D"_blank">https://an=
droid.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x86_64-linux-g=
libc2.17-4.8/+/refs/heads/master/sysroot/usr/include/linux/vhost.h</a><br><=
br>Here&#39;s the compilation error I get in this case:<br><br><blockquote =
style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><font face=3D"mon=
ospace">FAILED: subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c=
.o =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monosp=
ace">/src/prebuilts/clang/clang-r487747/bin/clang --sysroot=3D/out/sysroot =
-m64 -mcx16 -Isubprojects/libvhost-user/libvhost-user.a.p -Isubprojects/lib=
vhost-user -I../../<br></font><font face=3D"monospace">src/third_party/qemu=
/subprojects/libvhost-user -I/out/dest-install/usr/include -fcolor-diagnost=
ics -Wall -Winvalid-pch -std=3Dgnu99 -O2 -g -Wsign-compare -Wdeclarat<br></=
font><font face=3D"monospace">ion-after-statement -Wstrict-aliasing -fno-pi=
e -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-co=
mmon -fwrapv -Wundef -Wwrite-strings -Wmissi<br></font><font face=3D"monosp=
ace">ng-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-defini=
tion -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qua=
lifiers -Wempty-b<br></font><font face=3D"monospace">ody -Wnested-externs -=
Wendif-labels -Wexpansion-to-defined -Wmissing-format-attribute -Wthread-sa=
fety -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-sh<br></font=
><font face=3D"monospace">ift-negative-value -Wno-string-plus-int -Wno-type=
def-redefinition -Wno-tautological-type-limit-compare -Wno-psabi -Wno-gnu-v=
ariable-sized-type-not-at-end -fstack-<br></font><font face=3D"monospace">p=
rotector-strong -pthread -D_GNU_SOURCE -MD -MQ subprojects/libvhost-user/li=
bvhost-user.a.p/libvhost-user.c.o -MF subprojects/libvhost-user/libvhost-us=
er.a.p/libv<br></font><font face=3D"monospace">host-user.c.o.d -o subprojec=
ts/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c ../../src/third_par=
ty/qemu/subprojects/libvhost-user/libvhost-user.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br></font><font face=3D"monospace">../../src/third_party/qemu/su=
bprojects/libvhost-user/libvhost-user.c:529:17: error: use of undeclared id=
entifier &#39;VIRTIO_F_VERSION_1&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><=
font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 1ULL &lt;&lt; VIRTIO_F_=
VERSION_1 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">../../s=
rc/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:563:30: error=
: use of undeclared identifier &#39;VIRTIO_F_VERSION_1&#39; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br> </font><font face=3D"monospace">=C2=A0 =C2=A0 if (!vu_has_fe=
ature(dev, VIRTIO_F_VERSION_1)) { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><=
font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br></font><font face=3D"monospace">../../src/third_party/qemu/su=
bprojects/libvhost-user/libvhost-user.c:632:22: warning: unused variable &#=
39;dev_region&#39; [-Wunused-variable] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><f=
ont face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 VuDevRegion *dev_region =
=3D &amp;dev-&gt;regions[i]; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font=
 face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=
 </font><font face=3D"monospace">../../src/third_party/qemu/subprojects/lib=
vhost-user/libvhost-user.c:633:13: warning: unused variable &#39;ret&#39; [=
-Wunused-variable] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><=
font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><=
font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br></font><font face=3D"monospace">2 warnings and 2 errors generated.=
=C2=A0=C2=A0</font></blockquote></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 10:03=E2=80=AFAM Mic=
hael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">If you are reposting, please version patchsets, E.g.<br>
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
</blockquote></div>

--000000000000eface805f8bb9ada--

