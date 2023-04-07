Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779D6DAAE0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 11:30:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkiPz-0004sn-FU; Fri, 07 Apr 2023 05:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkiPw-0004rW-QI
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:30:00 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkiPu-00036R-Fn
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:30:00 -0400
Received: by mail-io1-xd31.google.com with SMTP id d20so7723021ioe.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680859797; x=1683451797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dHO9KA8JpQ5CfqySJeFQV2bgX6M9hDKalHykdCfkL+w=;
 b=WB1WTy4I2KV0w8Ts1WxajBdB4DxVe2Nwdsn+yLGh9i3DHRX+qz2wPtRbZdj+RPa9uf
 bOInV/JTTZKoXKvCR1pTlTTcy7UA4pgg8l0NdFFgLAwnDTYhz/Pnnnyj4THBMa/Q1pp3
 5rYV0OVB68qrZ45Z3Qsz4F/YH13BInWs5MZb6TWCg+jsFk8cPo+2ah+ML6wfGPQqSP5Y
 ZxwcOpXFxo5BgM+3wfYyfuNRxPU8VZtOALfOQ3xzfHVhwRXumovEggMnynxd1DOVPy9Z
 jx3Br97vQ9qXEqJX8gLHOoiJhPSQ8Xl71d18MNONRf7cuIVCWRqxcQ5xTeBCtjltC7uq
 O9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680859797; x=1683451797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dHO9KA8JpQ5CfqySJeFQV2bgX6M9hDKalHykdCfkL+w=;
 b=JoOc6frlW0tCaDR3JWriCadwRPS92gXVVTy3VEDf9q8UplLy7NLFQCfXEkvZsF3xt9
 gXmaihmXowKF9HlFV03WL2cB0OPE9K3dTuPkQ7Cj9b9UmnB6BjbFZeFlIFmqOzwJW89j
 98ximOLw2QzJJk5UWVYJ+ZNeAjYBhh6FSH/sAUwTbPQzDEaAjwmrkdADKJngPZ+fAnyt
 wJn64ymeEt+pCExgd+5svB4TUSV5PkiW67L0ohv7s70vQMh9dJLezT15godaOeZWezY0
 ILyEfJ/AGU56jANPE0kqxbCGzoK8pzmN2SP0i94/bq97SqyFDAisX90OyYlDsvT7qCCX
 rEFA==
X-Gm-Message-State: AAQBX9cgTk9/ImeHPlDyOdA8LoaJ7Iqo/zw+iIhePIhPHbvmEJQ1qDp5
 HkXiGUWmTJn9JAg4KIBoINyMGCujZpeawyqxjX9zv3IG2/CRhG2cBpg=
X-Google-Smtp-Source: AKy350b3Kf3QW8HWWP584IL6fd7bQ4ep9ESkNhl3+BSrqH/Li7l8SoiRMeRGHVYSu5Q9jvDNO0pg8koTNLiLnQtW9s4=
X-Received: by 2002:a02:a1d5:0:b0:405:8be:eaaa with SMTP id
 o21-20020a02a1d5000000b0040508beeaaamr483486jah.5.1680859797267; Fri, 07 Apr
 2023 02:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
 <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
In-Reply-To: <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
From: David Turner <digit@google.com>
Date: Fri, 7 Apr 2023 11:29:46 +0200
Message-ID: <CACnJMqp_+8W74_xbfkiAcR5_o6kgmyz46gkiroccNMye9ubdUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000229c5f05f8bbab55"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=digit@google.com; helo=mail-io1-xd31.google.com
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

--000000000000229c5f05f8bbab55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So it looks like that for some reason, the QEMU linux-headers directory is
not in the include search path for this compilation command, and that the
system-or-sysroot provided <linux/vhost.h> is picked instead. Fixing this
might be a better long-term fix than what I am proposing in this patch. I
am not sure how to do that yet though. Do you have any recommendations?


On Fri, Apr 7, 2023 at 11:25=E2=80=AFAM David Turner <digit@google.com> wro=
te:

> I meant glibc-2.17, I am using a sysroot to ensure the generated binaries
> run on older Linux distributions.
>
> On Fri, Apr 7, 2023 at 11:24=E2=80=AFAM David Turner <digit@google.com> w=
rote:
>
>> The <linux/vhost.h> of glib-2.17 begins with:
>>
>> #ifndef _LINUX_VHOST_H
>> #define _LINUX_VHOST_H
>> /* Userspace interface for in-kernel virtio accelerators. */
>> /* vhost is used to reduce the number of system calls involved in virtio=
.
>>  *
>>  * Existing virtio net code is used in the guest without modification.
>>  *
>>  * This header includes interface used by userspace hypervisor for
>>  * device configuration.
>>  */
>> #include <linux/types.h>
>> #include <linux/ioctl.h>
>> #include <linux/virtio_config.h>
>> #include <linux/virtio_ring.h>
>>
>>
>> See
>> https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x=
86_64-linux-glibc2.17-4.8/+/refs/heads/master/sysroot/usr/include/linux/vho=
st.h
>>
>> Here's the compilation error I get in this case:
>>
>> FAILED: subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o
>>
>> /src/prebuilts/clang/clang-r487747/bin/clang --sysroot=3D/out/sysroot -m=
64
>> -mcx16 -Isubprojects/libvhost-user/libvhost-user.a.p
>> -Isubprojects/libvhost-user -I../../
>> src/third_party/qemu/subprojects/libvhost-user
>> -I/out/dest-install/usr/include -fcolor-diagnostics -Wall -Winvalid-pch
>> -std=3Dgnu99 -O2 -g -Wsign-compare -Wdeclarat
>> ion-after-statement -Wstrict-aliasing -fno-pie -D_FILE_OFFSET_BITS=3D64
>> -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef
>> -Wwrite-strings -Wmissi
>> ng-prototypes -Wstrict-prototypes -Wredundant-decls
>> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
>> -Winit-self -Wignored-qualifiers -Wempty-b
>> ody -Wnested-externs -Wendif-labels -Wexpansion-to-defined
>> -Wmissing-format-attribute -Wthread-safety -Wno-initializer-overrides
>> -Wno-missing-include-dirs -Wno-sh
>> ift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition
>> -Wno-tautological-type-limit-compare -Wno-psabi
>> -Wno-gnu-variable-sized-type-not-at-end -fstack-
>> protector-strong -pthread -D_GNU_SOURCE -MD -MQ
>> subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -MF
>> subprojects/libvhost-user/libvhost-user.a.p/libv
>> host-user.c.o.d -o
>> subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c
>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c
>>
>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:529=
:17:
>> error: use of undeclared identifier 'VIRTIO_F_VERSION_1'
>>
>>         1ULL << VIRTIO_F_VERSION_1 |
>>
>>                 ^
>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:563=
:30:
>> error: use of undeclared identifier 'VIRTIO_F_VERSION_1'
>>
>>     if (!vu_has_feature(dev, VIRTIO_F_VERSION_1)) {
>>
>>                              ^
>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:632=
:22:
>> warning: unused variable 'dev_region' [-Wunused-variable]
>>
>>         VuDevRegion *dev_region =3D &dev->regions[i];
>>
>>                      ^
>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:633=
:13:
>> warning: unused variable 'ret' [-Wunused-variable]
>>
>>         int ret;
>>
>>             ^
>> 2 warnings and 2 errors generated.
>>
>>
>> On Fri, Apr 7, 2023 at 10:03=E2=80=AFAM Michael S. Tsirkin <mst@redhat.c=
om>
>> wrote:
>>
>>> If you are reposting, please version patchsets, E.g.
>>> -v2 flag for git format-patch will enerate [PATCH v2] for you.
>>>
>>> Repeating what I said on previous version:
>>>
>>> On Wed, Apr 05, 2023 at 07:21:07PM +0200, David 'Digit' Turner wrote:
>>> > The source file uses VIRTIO_F_VERSION_1 which is
>>> > not defined by <linux/virtio_config.h> on Debian 10.
>>> >
>>> > The system-provided <linux/virtio_config.h> which
>>> > does not include the macro definition is included
>>> > through <linux/vhost.h>, so fix the issue by including
>>> > the standard-headers version before that.
>>> >
>>> > Signed-off-by: David 'Digit' Turner <digit@google.com>
>>>
>>> This happens to work usually but there's no guarantee
>>> "standard-headers/linux/virtio_config.h"
>>> and <linux/virtio_config.h> are interchangeable or
>>> even do not conflict.
>>>
>>> But where is <linux/vhost.h> using <linux/virtio_config.h>?
>>> Everyone should be using "standard-headers/linux/virtio_config.h".
>>>
>>>
>>> > ---
>>> >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>>> >  1 file changed, 6 insertions(+)
>>> >
>>> > diff --git a/subprojects/libvhost-user/libvhost-user.c
>>> b/subprojects/libvhost-user/libvhost-user.c
>>> > index 0200b78e8e..0a5768cb55 100644
>>> > --- a/subprojects/libvhost-user/libvhost-user.c
>>> > +++ b/subprojects/libvhost-user/libvhost-user.c
>>> > @@ -32,6 +32,12 @@
>>> >  #include <sys/mman.h>
>>> >  #include <endian.h>
>>> >
>>> > +/* Necessary to provide VIRTIO_F_VERSION_1 on system
>>> > + * with older linux headers. Must appear before
>>> > + * <linux/vhost.h> below.
>>> > + */
>>> > +#include "standard-headers/linux/virtio_config.h"
>>> > +
>>> >  #if defined(__linux__)
>>> >  #include <sys/syscall.h>
>>> >  #include <fcntl.h>
>>> > --
>>> > 2.40.0.348.gf938b09366-goog
>>>
>>>

--000000000000229c5f05f8bbab55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So it looks like that for some reason, the QEMU linux-head=
ers directory is not in the include search path for this compilation comman=
d, and that the system-or-sysroot provided &lt;linux/vhost.h&gt; is picked =
instead. Fixing this might be a better long-term fix than what I am proposi=
ng in this patch. I am not sure how to do that yet though. Do you have any =
recommendations?<div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 11:25=E2=80=AFAM Davi=
d Turner &lt;<a href=3D"mailto:digit@google.com">digit@google.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">I meant glibc-2.17, I am using a sysroot to ensure the generated b=
inaries run on older Linux distributions.</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 11:24=E2=80=
=AFAM David Turner &lt;<a href=3D"mailto:digit@google.com" target=3D"_blank=
">digit@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">The &lt;linux/vhost.h&gt; of glib-2.17 b=
egins with:<br><br><blockquote style=3D"margin:0px 0px 0px 40px;border:none=
;padding:0px"><font face=3D"monospace" size=3D"1">#ifndef _LINUX_VHOST_H<br=
>#define _LINUX_VHOST_H<br>/* Userspace interface for in-kernel virtio acce=
lerators. */<br>/* vhost is used to reduce the number of system calls invol=
ved in virtio.<br>=C2=A0*<br>=C2=A0* Existing virtio net code is used in th=
e guest without modification.<br>=C2=A0*<br>=C2=A0* This header includes in=
terface used by userspace hypervisor for<br>=C2=A0* device configuration.<b=
r>=C2=A0*/<br>#include &lt;linux/types.h&gt;<br>#include &lt;linux/ioctl.h&=
gt;<br>#include &lt;linux/virtio_config.h&gt;<br>#include &lt;linux/virtio_=
ring.h&gt;</font></blockquote><br>See=C2=A0<a href=3D"https://android.googl=
esource.com/platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.=
8/+/refs/heads/master/sysroot/usr/include/linux/vhost.h" target=3D"_blank">=
https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/host/x86_=
64-linux-glibc2.17-4.8/+/refs/heads/master/sysroot/usr/include/linux/vhost.=
h</a><br><br>Here&#39;s the compilation error I get in this case:<br><br><b=
lockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><font f=
ace=3D"monospace">FAILED: subprojects/libvhost-user/libvhost-user.a.p/libvh=
ost-user.c.o =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=
=3D"monospace">/src/prebuilts/clang/clang-r487747/bin/clang --sysroot=3D/ou=
t/sysroot -m64 -mcx16 -Isubprojects/libvhost-user/libvhost-user.a.p -Isubpr=
ojects/libvhost-user -I../../<br></font><font face=3D"monospace">src/third_=
party/qemu/subprojects/libvhost-user -I/out/dest-install/usr/include -fcolo=
r-diagnostics -Wall -Winvalid-pch -std=3Dgnu99 -O2 -g -Wsign-compare -Wdecl=
arat<br></font><font face=3D"monospace">ion-after-statement -Wstrict-aliasi=
ng -fno-pie -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasi=
ng -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissi<br></font><font face=
=3D"monospace">ng-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-st=
yle-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wi=
gnored-qualifiers -Wempty-b<br></font><font face=3D"monospace">ody -Wnested=
-externs -Wendif-labels -Wexpansion-to-defined -Wmissing-format-attribute -=
Wthread-safety -Wno-initializer-overrides -Wno-missing-include-dirs -Wno-sh=
<br></font><font face=3D"monospace">ift-negative-value -Wno-string-plus-int=
 -Wno-typedef-redefinition -Wno-tautological-type-limit-compare -Wno-psabi =
-Wno-gnu-variable-sized-type-not-at-end -fstack-<br></font><font face=3D"mo=
nospace">protector-strong -pthread -D_GNU_SOURCE -MD -MQ subprojects/libvho=
st-user/libvhost-user.a.p/libvhost-user.c.o -MF subprojects/libvhost-user/l=
ibvhost-user.a.p/libv<br></font><font face=3D"monospace">host-user.c.o.d -o=
 subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c ../../src=
/third_party/qemu/subprojects/libvhost-user/libvhost-user.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace">../../src/third_par=
ty/qemu/subprojects/libvhost-user/libvhost-user.c:529:17: error: use of und=
eclared identifier &#39;VIRTIO_F_VERSION_1&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> =
</font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 1ULL &lt;&lt; V=
IRTIO_F_VERSION_1 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=
../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:563:30=
: error: use of undeclared identifier &#39;VIRTIO_F_VERSION_1&#39; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">=C2=A0 =C2=A0 if (!vu=
_has_feature(dev, VIRTIO_F_VERSION_1)) { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><=
/font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace">../../src/third_party/=
qemu/subprojects/libvhost-user/libvhost-user.c:632:22: warning: unused vari=
able &#39;dev_region&#39; [-Wunused-variable] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></=
font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 VuDevRegion *dev_=
region =3D &amp;dev-&gt;regions[i]; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></fon=
t><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br> </font><font face=3D"monospace">../../src/third_party/qemu/subproje=
cts/libvhost-user/libvhost-user.c:633:13: warning: unused variable &#39;ret=
&#39; [-Wunused-variable] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> <=
/font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> <=
/font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br></font><font face=3D"monospace">2 warnings and 2 errors gener=
ated.=C2=A0=C2=A0</font></blockquote></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 10:03=E2=80=AFA=
M Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank=
">mst@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">If you are reposting, please version patchsets, E.g.<br>
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
</blockquote></div>

--000000000000229c5f05f8bbab55--

