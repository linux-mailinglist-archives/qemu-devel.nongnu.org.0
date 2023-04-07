Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E316DAB12
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 11:48:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkihZ-0000H9-JX; Fri, 07 Apr 2023 05:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkihV-0000FX-PA
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:48:09 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkihQ-0002Sc-OW
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:48:09 -0400
Received: by mail-il1-x132.google.com with SMTP id g8so155589ilr.9
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680860883; x=1683452883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NV/421k3G7dePl9dRbTzffoshWDvC+5BVo4yIicdGH0=;
 b=aCN8ImJEw6BukEI/JO6TUOLBxJ1BAaTii7tBkINLBdgR+rAyi32R5F7aJKmbTJpoxq
 47BSTLrwjd9tA2zkAJCqviKyS2NSwJHsE1fFQflBeVhcxdT26qHUSf2xpvswm4US/9x+
 ipQ5pKD4EYT9l1lwTiaTciedWnyi7iSwjENBWCKntGbTrTWwN4e/D2JmQp5k2XisTUhL
 /4N2Mix3eUkfIpWT1HG5VEHGJ8oKCgoYE+mLCjgzfWtlrKZxFaD5WxPMnVoA2GsSS46O
 CZoTvsrXcWboWvntB1WGt5aGcDSB8TDypAdqIj5kBuyObslKaS8/Jj17AWelPWQ8vl3M
 NSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680860883; x=1683452883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NV/421k3G7dePl9dRbTzffoshWDvC+5BVo4yIicdGH0=;
 b=cieaghOj3Hu0tlR3DP+dN5RBh1Xk4SCGzjVMo4S6M7bjzygr8w4K7w1FbJmZYipnrq
 x6uHX0jmNbo8GpDTrFMpDoQRKZ+ViuxSFv6hZkoteqsweL2O4oU4AtaEtp2ytLX/zY9o
 a8FLMruFDNya9SEOXPl9Wj6N7bty7AGr57WrAlCB/ksPs2r7fzZpqmqeJGBS2EoYoEb+
 OBoBy1vYiJd0E2iE9oCLu4iBtrMpMyqI26neRh0FWhUw65TCJLIsdQb+RFQilwIqLmj7
 ii7PWruVZybA2PO4EfkmW4UHCakM1yZMw2jgSLf+CF8vx4phgGuKIUCXh5h9JI8lS6nw
 0Nlw==
X-Gm-Message-State: AAQBX9eJ6cLH4HsxQNSUi/J+YiFXN1eGgluLcRfbzvSk+wGib5qlt4E7
 gBHrfA3OjL4Qk5Jc83w+2cj0fhCY1dJApM8+lEHCQA==
X-Google-Smtp-Source: AKy350a8fIXGhhf3zwbMtfvueaJTH381pSNPUAqc+RdoAI6ZINpSxshsZGD/pkHPajUjI+UsG3jvBsyyC6tjbkLPE/I=
X-Received: by 2002:a92:ca4b:0:b0:323:cab8:3c0c with SMTP id
 q11-20020a92ca4b000000b00323cab83c0cmr1037834ilo.5.1680860883154; Fri, 07 Apr
 2023 02:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
 <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
 <CACnJMqp_+8W74_xbfkiAcR5_o6kgmyz46gkiroccNMye9ubdUw@mail.gmail.com>
In-Reply-To: <CACnJMqp_+8W74_xbfkiAcR5_o6kgmyz46gkiroccNMye9ubdUw@mail.gmail.com>
From: David Turner <digit@google.com>
Date: Fri, 7 Apr 2023 11:47:50 +0200
Message-ID: <CACnJMqqte0Y7_SJt9Q3_ZVaj3=46tqNS6EPfp_gg91B_J3VD4A@mail.gmail.com>
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000dbe92a05f8bbeb68"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=digit@google.com; helo=mail-il1-x132.google.com
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

--000000000000dbe92a05f8bbeb68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Digging a little further, the top-level meson.build for qemu has the
following:

if targetos =3D=3D 'linux'
  add_project_arguments('-isystem', meson.current_source_dir() /
'linux-headers',
                        '-isystem', 'linux-headers',
                        language: all_languages)
endif


But this does not carry to the subprojects (and there is nothing equivalent
in subprojects/libvhost-user/meson.build)/
If I change the above to use add_global_arguments() instead, compilation
succeeds.

I don=C2=B4t know if this is going to break other things though, but I'd be
happy to change the patch to do that instead.


On Fri, Apr 7, 2023 at 11:29=E2=80=AFAM David Turner <digit@google.com> wro=
te:

> So it looks like that for some reason, the QEMU linux-headers directory i=
s
> not in the include search path for this compilation command, and that the
> system-or-sysroot provided <linux/vhost.h> is picked instead. Fixing this
> might be a better long-term fix than what I am proposing in this patch. I
> am not sure how to do that yet though. Do you have any recommendations?
>
>
> On Fri, Apr 7, 2023 at 11:25=E2=80=AFAM David Turner <digit@google.com> w=
rote:
>
>> I meant glibc-2.17, I am using a sysroot to ensure the generated binarie=
s
>> run on older Linux distributions.
>>
>> On Fri, Apr 7, 2023 at 11:24=E2=80=AFAM David Turner <digit@google.com> =
wrote:
>>
>>> The <linux/vhost.h> of glib-2.17 begins with:
>>>
>>> #ifndef _LINUX_VHOST_H
>>> #define _LINUX_VHOST_H
>>> /* Userspace interface for in-kernel virtio accelerators. */
>>> /* vhost is used to reduce the number of system calls involved in virti=
o.
>>>  *
>>>  * Existing virtio net code is used in the guest without modification.
>>>  *
>>>  * This header includes interface used by userspace hypervisor for
>>>  * device configuration.
>>>  */
>>> #include <linux/types.h>
>>> #include <linux/ioctl.h>
>>> #include <linux/virtio_config.h>
>>> #include <linux/virtio_ring.h>
>>>
>>>
>>> See
>>> https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/host/=
x86_64-linux-glibc2.17-4.8/+/refs/heads/master/sysroot/usr/include/linux/vh=
ost.h
>>>
>>> Here's the compilation error I get in this case:
>>>
>>> FAILED: subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o
>>>
>>> /src/prebuilts/clang/clang-r487747/bin/clang --sysroot=3D/out/sysroot -=
m64
>>> -mcx16 -Isubprojects/libvhost-user/libvhost-user.a.p
>>> -Isubprojects/libvhost-user -I../../
>>> src/third_party/qemu/subprojects/libvhost-user
>>> -I/out/dest-install/usr/include -fcolor-diagnostics -Wall -Winvalid-pch
>>> -std=3Dgnu99 -O2 -g -Wsign-compare -Wdeclarat
>>> ion-after-statement -Wstrict-aliasing -fno-pie -D_FILE_OFFSET_BITS=3D64
>>> -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef
>>> -Wwrite-strings -Wmissi
>>> ng-prototypes -Wstrict-prototypes -Wredundant-decls
>>> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
>>> -Winit-self -Wignored-qualifiers -Wempty-b
>>> ody -Wnested-externs -Wendif-labels -Wexpansion-to-defined
>>> -Wmissing-format-attribute -Wthread-safety -Wno-initializer-overrides
>>> -Wno-missing-include-dirs -Wno-sh
>>> ift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition
>>> -Wno-tautological-type-limit-compare -Wno-psabi
>>> -Wno-gnu-variable-sized-type-not-at-end -fstack-
>>> protector-strong -pthread -D_GNU_SOURCE -MD -MQ
>>> subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -MF
>>> subprojects/libvhost-user/libvhost-user.a.p/libv
>>> host-user.c.o.d -o
>>> subprojects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o -c
>>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c
>>>
>>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:52=
9:17:
>>> error: use of undeclared identifier 'VIRTIO_F_VERSION_1'
>>>
>>>         1ULL << VIRTIO_F_VERSION_1 |
>>>
>>>                 ^
>>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:56=
3:30:
>>> error: use of undeclared identifier 'VIRTIO_F_VERSION_1'
>>>
>>>     if (!vu_has_feature(dev, VIRTIO_F_VERSION_1)) {
>>>
>>>                              ^
>>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:63=
2:22:
>>> warning: unused variable 'dev_region' [-Wunused-variable]
>>>
>>>         VuDevRegion *dev_region =3D &dev->regions[i];
>>>
>>>                      ^
>>> ../../src/third_party/qemu/subprojects/libvhost-user/libvhost-user.c:63=
3:13:
>>> warning: unused variable 'ret' [-Wunused-variable]
>>>
>>>         int ret;
>>>
>>>             ^
>>> 2 warnings and 2 errors generated.
>>>
>>>
>>> On Fri, Apr 7, 2023 at 10:03=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com>
>>> wrote:
>>>
>>>> If you are reposting, please version patchsets, E.g.
>>>> -v2 flag for git format-patch will enerate [PATCH v2] for you.
>>>>
>>>> Repeating what I said on previous version:
>>>>
>>>> On Wed, Apr 05, 2023 at 07:21:07PM +0200, David 'Digit' Turner wrote:
>>>> > The source file uses VIRTIO_F_VERSION_1 which is
>>>> > not defined by <linux/virtio_config.h> on Debian 10.
>>>> >
>>>> > The system-provided <linux/virtio_config.h> which
>>>> > does not include the macro definition is included
>>>> > through <linux/vhost.h>, so fix the issue by including
>>>> > the standard-headers version before that.
>>>> >
>>>> > Signed-off-by: David 'Digit' Turner <digit@google.com>
>>>>
>>>> This happens to work usually but there's no guarantee
>>>> "standard-headers/linux/virtio_config.h"
>>>> and <linux/virtio_config.h> are interchangeable or
>>>> even do not conflict.
>>>>
>>>> But where is <linux/vhost.h> using <linux/virtio_config.h>?
>>>> Everyone should be using "standard-headers/linux/virtio_config.h".
>>>>
>>>>
>>>> > ---
>>>> >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>>>> >  1 file changed, 6 insertions(+)
>>>> >
>>>> > diff --git a/subprojects/libvhost-user/libvhost-user.c
>>>> b/subprojects/libvhost-user/libvhost-user.c
>>>> > index 0200b78e8e..0a5768cb55 100644
>>>> > --- a/subprojects/libvhost-user/libvhost-user.c
>>>> > +++ b/subprojects/libvhost-user/libvhost-user.c
>>>> > @@ -32,6 +32,12 @@
>>>> >  #include <sys/mman.h>
>>>> >  #include <endian.h>
>>>> >
>>>> > +/* Necessary to provide VIRTIO_F_VERSION_1 on system
>>>> > + * with older linux headers. Must appear before
>>>> > + * <linux/vhost.h> below.
>>>> > + */
>>>> > +#include "standard-headers/linux/virtio_config.h"
>>>> > +
>>>> >  #if defined(__linux__)
>>>> >  #include <sys/syscall.h>
>>>> >  #include <fcntl.h>
>>>> > --
>>>> > 2.40.0.348.gf938b09366-goog
>>>>
>>>>

--000000000000dbe92a05f8bbeb68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Digging a little further, the top-level meson.build for qe=
mu has the following:<br><br><blockquote style=3D"margin:0 0 0 40px;border:=
none;padding:0px"><font face=3D"monospace">if targetos =3D=3D &#39;linux&#3=
9;<br></font><font face=3D"monospace">=C2=A0 add_project_arguments(&#39;-is=
ystem&#39;, meson.current_source_dir() / &#39;linux-headers&#39;,<br></font=
><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-isystem&#39;, &#39;linux-headers&#=
39;,<br></font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 language: all_languages)<b=
r></font><font face=3D"monospace">endif</font></blockquote><br>But this doe=
s not carry to the subprojects (and there is nothing equivalent in subproje=
cts/libvhost-user/meson.build)/<br>If I change the above to use <font face=
=3D"monospace">add_global_arguments()</font> instead, compilation succeeds.=
<br><br>I don=C2=B4t know if this is going to break other things though, bu=
t I&#39;d be happy to change the patch to do that instead.<br><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, A=
pr 7, 2023 at 11:29=E2=80=AFAM David Turner &lt;<a href=3D"mailto:digit@goo=
gle.com">digit@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">So it looks like that for some re=
ason, the QEMU linux-headers directory is not in the include search path fo=
r this compilation command, and that the system-or-sysroot provided &lt;lin=
ux/vhost.h&gt; is picked instead. Fixing this might be a better long-term f=
ix than what I am proposing in this patch. I am not sure how to do that yet=
 though. Do you have any recommendations?<div><br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023=
 at 11:25=E2=80=AFAM David Turner &lt;<a href=3D"mailto:digit@google.com" t=
arget=3D"_blank">digit@google.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">I meant glibc-2.17, I am =
using a sysroot to ensure the generated binaries run on older Linux distrib=
utions.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Apr 7, 2023 at 11:24=E2=80=AFAM David Turner &lt;<a href=3D"=
mailto:digit@google.com" target=3D"_blank">digit@google.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
>The &lt;linux/vhost.h&gt; of glib-2.17 begins with:<br><br><blockquote sty=
le=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><font face=3D"monosp=
ace" size=3D"1">#ifndef _LINUX_VHOST_H<br>#define _LINUX_VHOST_H<br>/* User=
space interface for in-kernel virtio accelerators. */<br>/* vhost is used t=
o reduce the number of system calls involved in virtio.<br>=C2=A0*<br>=C2=
=A0* Existing virtio net code is used in the guest without modification.<br=
>=C2=A0*<br>=C2=A0* This header includes interface used by userspace hyperv=
isor for<br>=C2=A0* device configuration.<br>=C2=A0*/<br>#include &lt;linux=
/types.h&gt;<br>#include &lt;linux/ioctl.h&gt;<br>#include &lt;linux/virtio=
_config.h&gt;<br>#include &lt;linux/virtio_ring.h&gt;</font></blockquote><b=
r>See=C2=A0<a href=3D"https://android.googlesource.com/platform/prebuilts/g=
cc/linux-x86/host/x86_64-linux-glibc2.17-4.8/+/refs/heads/master/sysroot/us=
r/include/linux/vhost.h" target=3D"_blank">https://android.googlesource.com=
/platform/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/+/refs/he=
ads/master/sysroot/usr/include/linux/vhost.h</a><br><br>Here&#39;s the comp=
ilation error I get in this case:<br><br><blockquote style=3D"margin:0px 0p=
x 0px 40px;border:none;padding:0px"><font face=3D"monospace">FAILED: subpro=
jects/libvhost-user/libvhost-user.a.p/libvhost-user.c.o =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace">/src/prebuilts/=
clang/clang-r487747/bin/clang --sysroot=3D/out/sysroot -m64 -mcx16 -Isubpro=
jects/libvhost-user/libvhost-user.a.p -Isubprojects/libvhost-user -I../../<=
br></font><font face=3D"monospace">src/third_party/qemu/subprojects/libvhos=
t-user -I/out/dest-install/usr/include -fcolor-diagnostics -Wall -Winvalid-=
pch -std=3Dgnu99 -O2 -g -Wsign-compare -Wdeclarat<br></font><font face=3D"m=
onospace">ion-after-statement -Wstrict-aliasing -fno-pie -D_FILE_OFFSET_BIT=
S=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef=
 -Wwrite-strings -Wmissi<br></font><font face=3D"monospace">ng-prototypes -=
Wstrict-prototypes -Wredundant-decls -Wold-style-definition -Wtype-limits -=
Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-b<br=
></font><font face=3D"monospace">ody -Wnested-externs -Wendif-labels -Wexpa=
nsion-to-defined -Wmissing-format-attribute -Wthread-safety -Wno-initialize=
r-overrides -Wno-missing-include-dirs -Wno-sh<br></font><font face=3D"monos=
pace">ift-negative-value -Wno-string-plus-int -Wno-typedef-redefinition -Wn=
o-tautological-type-limit-compare -Wno-psabi -Wno-gnu-variable-sized-type-n=
ot-at-end -fstack-<br></font><font face=3D"monospace">protector-strong -pth=
read -D_GNU_SOURCE -MD -MQ subprojects/libvhost-user/libvhost-user.a.p/libv=
host-user.c.o -MF subprojects/libvhost-user/libvhost-user.a.p/libv<br></fon=
t><font face=3D"monospace">host-user.c.o.d -o subprojects/libvhost-user/lib=
vhost-user.a.p/libvhost-user.c.o -c ../../src/third_party/qemu/subprojects/=
libvhost-user/libvhost-user.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font>=
<font face=3D"monospace">../../src/third_party/qemu/subprojects/libvhost-us=
er/libvhost-user.c:529:17: error: use of undeclared identifier &#39;VIRTIO_=
F_VERSION_1&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"monospac=
e">=C2=A0 =C2=A0 =C2=A0 =C2=A0 1ULL &lt;&lt; VIRTIO_F_VERSION_1 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<b=
r> </font><font face=3D"monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0<br> </font><font face=3D"monospace">../../src/third_party/qe=
mu/subprojects/libvhost-user/libvhost-user.c:563:30: error: use of undeclar=
ed identifier &#39;VIRTIO_F_VERSION_1&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </fo=
nt><font face=3D"monospace">=C2=A0 =C2=A0 if (!vu_has_feature(dev, VIRTIO_F=
_VERSION_1)) { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monos=
pace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font>=
<font face=3D"monospace">../../src/third_party/qemu/subprojects/libvhost-us=
er/libvhost-user.c:632:22: warning: unused variable &#39;dev_region&#39; [-=
Wunused-variable] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace=
">=C2=A0 =C2=A0 =C2=A0 =C2=A0 VuDevRegion *dev_region =3D &amp;dev-&gt;regi=
ons[i]; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font face=3D"monospace">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=
=3D"monospace">../../src/third_party/qemu/subprojects/libvhost-user/libvhos=
t-user.c:633:13: warning: unused variable &#39;ret&#39; [-Wunused-variable]=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"mono=
space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br> </font><font face=3D"mono=
space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br></font><font=
 face=3D"monospace">2 warnings and 2 errors generated.=C2=A0=C2=A0</font></=
blockquote></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Apr 7, 2023 at 10:03=E2=80=AFAM Michael S. Tsirkin &lt;<=
a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If you are=
 reposting, please version patchsets, E.g.<br>
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
</blockquote></div>

--000000000000dbe92a05f8bbeb68--

