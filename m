Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB322FF4E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 04:04:00 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0EyF-0000bC-2Z
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 22:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k0ExO-0008Gr-GR
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 22:03:06 -0400
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1k0ExL-000857-Q2
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 22:03:05 -0400
Received: by mail-qv1-xf41.google.com with SMTP id s15so4036753qvv.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 19:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PYcEOI78+CGfoVXZ79AHQMC/x5WeWDNy7ob370YoQWw=;
 b=bXvNTtqn8cuK1VjbGMXAdY5Ri8jPoMeWkz6PhNmYBRx+PXNTyt5IWHkR5TnnVpAxYZ
 Kubn4ik9GoDonHu+s3QJY3mw2+ZR3fSyrp1852s87L5j7xw+S1vt5z9ERTMGHFtPk2g7
 59hDiT9t2DBNuTn4VtTDu3jvzP+uBgT0w/0IhbPMbcyhea40Skd98WxbCWi6F1fYlR7k
 emW769m/Ern9Ep0bB9Jd8V49pp5RnwMZ4Y7bvhBQsItF3P3ZEdwfd/9pHMMycippa49Y
 KuO0Fxa5dLdZct1CmzVvW9B2F8vpHpaOoQj64XM3nSuzTQSIEOVAaL1GfiknRioM2IcY
 SM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYcEOI78+CGfoVXZ79AHQMC/x5WeWDNy7ob370YoQWw=;
 b=Cn2CR2qlPuEISaaInjfxrQPyV+4At+XeUpBUdKna0K5/JldhwaVy36LWVLxHUNLmv4
 vzCsT0TqgGjEAMG58yjPpvPRZl8A9kHxB6KbaIvS/+8L2yCBe7cx56t6sct2RskKgV9j
 7yewAinBwMYEyiY9zaja0Plq5NCo5DyaS+zT+JkRYYVeh+a9CTVVMGJofD3kXWf97udC
 m1LHxNfVH/v7VxI5/0fhCKrBt/anBNi2kt9gExgGbWAwBx/e8LGlTepy9DCWtXoQ1snx
 4ShTQcLh/Zt7MD4sCDBkjePwVGC40ubn3y3SLGa1vqQGupzwJoMadYfZGGqsosyS/0NG
 8zqQ==
X-Gm-Message-State: AOAM533BpkrYmwMZOqAs6DwQuXVLoE799BG8qHoiqPI9Bgoa2x/PZGBC
 jrzZJdi/C4oPP/CQ1rDcT4RvA3ndd0C5ZHhCe0nBIQ==
X-Google-Smtp-Source: ABdhPJzvcs3zcxEi0RDNSBJMEr6PDqH4MLDAx5JG35X4h9zxukc51rLKwTy/87RZIxuqWbKKc3kAVUyaLdjZRfJLNyI=
X-Received: by 2002:a0c:99c8:: with SMTP id y8mr26029599qve.100.1595901782109; 
 Mon, 27 Jul 2020 19:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200724095112.2615-1-green.wan@sifive.com>
 <20200724095112.2615-2-green.wan@sifive.com>
 <CAEUhbmVgqNEe9k9p7Fto08_Rsu0W3d7UfzSK0HcprTk3cSzgaQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVgqNEe9k9p7Fto08_Rsu0W3d7UfzSK0HcprTk3cSzgaQ@mail.gmail.com>
From: Green Wan <green.wan@sifive.com>
Date: Tue, 28 Jul 2020 10:02:49 +0800
Message-ID: <CAJivOr7qLJvryjQXUE7Oro2aSzWv1Sj6AR0gO9TO6+FL9HwkGw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] hw/riscv: sifive_u: Add file-backed OTP.
 softmmu/vl: add otp-file to boot option
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d1d5f605ab76d6ff"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f41;
 envelope-from=green.wan@sifive.com; helo=mail-qv1-xf41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d1d5f605ab76d6ff
Content-Type: text/plain; charset="UTF-8"

Hi Bin,

Thanks for the reply.

I think we can add property to sifive_u_otp_properties[] (something like
below) and remove generic code dependency. What do you think of it?

@@ -243,6 +245,7 @@ static const MemoryRegionOps sifive_u_otp_ops = {

 static Property sifive_u_otp_properties[] = {
     DEFINE_PROP_UINT32("serial", SiFiveUOTPState, serial, 0),
+    DEFINE_PROP_STRING("otp_file", SiFiveUOTPState, otp_file),
     DEFINE_PROP_END_OF_LIST(),
 };

 typedef struct SiFiveUOTPState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -77,6 +75,7 @@ typedef struct SiFiveUOTPState {
     uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
     /* config */
     uint32_t serial;
+    char *otp_file;
     uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
 } SiFiveUOTPState;

Regards,
Green


On Fri, Jul 24, 2020 at 10:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Green,
>
> On Fri, Jul 24, 2020 at 5:51 PM Green Wan <green.wan@sifive.com> wrote:
> >
> > Add a file-backed implementation for OTP of sifive_u machine. Use
> > '-boot otp-file=xxx' to enable it. Do file open, mmap and close
> > for every OTP read/write in case keep the update-to-date snapshot
> > of OTP.
> >
> > Signed-off-by: Green Wan <green.wan@sifive.com>
> > ---
> >  hw/riscv/sifive_u_otp.c         | 88 ++++++++++++++++++++++++++++++++-
> >  include/hw/riscv/sifive_u_otp.h |  2 +
> >  qemu-options.hx                 |  3 +-
> >  softmmu/vl.c                    |  6 ++-
> >  4 files changed, 96 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
> > index f6ecbaa2ca..26e1965821 100644
> > --- a/hw/riscv/sifive_u_otp.c
> > +++ b/hw/riscv/sifive_u_otp.c
> > @@ -24,6 +24,72 @@
> >  #include "qemu/log.h"
> >  #include "qemu/module.h"
> >  #include "hw/riscv/sifive_u_otp.h"
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <sys/types.h>
> > +#include <sys/stat.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> > +#include <sys/mman.h>
> > +#include <string.h>
> > +
> > +#define TRACE_PREFIX            "FU540_OTP: "
> > +#define SIFIVE_FU540_OTP_SIZE   (SIFIVE_U_OTP_NUM_FUSES * 4)
> > +
> > +static int otp_backed_fd;
> > +static unsigned int *otp_mmap;
> > +
> > +static void sifive_u_otp_backed_load(const char *filename);
> > +static uint64_t sifive_u_otp_backed_read(uint32_t fuseidx);
> > +static void sifive_u_otp_backed_write(uint32_t fuseidx,
> > +                                      uint32_t paio,
> > +                                      uint32_t pdin);
> > +static void sifive_u_otp_backed_unload(void);
> > +
> > +void sifive_u_otp_backed_load(const char *filename)
> > +{
> > +    if (otp_backed_fd < 0) {
> > +
> > +        otp_backed_fd = open(filename, O_RDWR);
> > +
> > +        if (otp_backed_fd < 0)
> > +            qemu_log_mask(LOG_TRACE,
> > +                          TRACE_PREFIX "Warning: can't open otp
> file\n");
> > +        else {
> > +
> > +            otp_mmap = (unsigned int *)mmap(0,
> > +                                            SIFIVE_FU540_OTP_SIZE,
> > +                                            PROT_READ | PROT_WRITE |
> PROT_EXEC,
> > +                                            MAP_FILE | MAP_SHARED,
> > +                                            otp_backed_fd,
> > +                                            0);
> > +
> > +            if (otp_mmap == MAP_FAILED)
> > +                qemu_log_mask(LOG_TRACE,
> > +                              TRACE_PREFIX "Warning: can't mmap otp
> file\n");
> > +        }
> > +    }
> > +
> > +}
> > +
> > +uint64_t sifive_u_otp_backed_read(uint32_t fuseidx)
> > +{
> > +    return (uint64_t)(otp_mmap[fuseidx]);
> > +}
> > +
> > +void sifive_u_otp_backed_write(uint32_t fuseidx, uint32_t paio,
> uint32_t pdin)
> > +{
> > +    otp_mmap[fuseidx] &= ~(pdin << paio);
> > +    otp_mmap[fuseidx] |= (pdin << paio);
> > +}
> > +
> > +
> > +void sifive_u_otp_backed_unload(void)
> > +{
> > +    munmap(otp_mmap, SIFIVE_FU540_OTP_SIZE);
> > +    close(otp_backed_fd);
> > +    otp_backed_fd = -1;
> > +}
> >
> >  static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned
> int size)
> >  {
> > @@ -46,7 +112,17 @@ static uint64_t sifive_u_otp_read(void *opaque,
> hwaddr addr, unsigned int size)
> >          if ((s->pce & SIFIVE_U_OTP_PCE_EN) &&
> >              (s->pdstb & SIFIVE_U_OTP_PDSTB_EN) &&
> >              (s->ptrim & SIFIVE_U_OTP_PTRIM_EN)) {
> > -            return s->fuse[s->pa & SIFIVE_U_OTP_PA_MASK];
> > +
> > +            if (otp_file) {
> > +                uint64_t val;
> > +
> > +                sifive_u_otp_backed_load(otp_file);
> > +                val = sifive_u_otp_backed_read(s->pa);
> > +                sifive_u_otp_backed_unload();
> > +
> > +                return val;
> > +            } else
> > +                return s->fuse[s->pa & SIFIVE_U_OTP_PA_MASK];
> >          } else {
> >              return 0xff;
> >          }
> > @@ -123,6 +199,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr
> addr,
> >          s->ptrim = val32;
> >          break;
> >      case SIFIVE_U_OTP_PWE:
> > +        if (otp_file) {
> > +            sifive_u_otp_backed_load(otp_file);
> > +            sifive_u_otp_backed_write(s->pa, s->paio, s->pdin);
> > +            sifive_u_otp_backed_unload();
> > +        }
> > +
> >          s->pwe = val32;
> >          break;
> >      default:
> > @@ -165,6 +247,10 @@ static void sifive_u_otp_reset(DeviceState *dev)
> >      /* Make a valid content of serial number */
> >      s->fuse[SIFIVE_U_OTP_SERIAL_ADDR] = s->serial;
> >      s->fuse[SIFIVE_U_OTP_SERIAL_ADDR + 1] = ~(s->serial);
> > +
> > +    /* Initialize file mmap and descriptor. */
> > +    otp_mmap = NULL;
> > +    otp_backed_fd = -1;
> >  }
> >
> >  static void sifive_u_otp_class_init(ObjectClass *klass, void *data)
> > diff --git a/include/hw/riscv/sifive_u_otp.h
> b/include/hw/riscv/sifive_u_otp.h
> > index 639297564a..1342bd7342 100644
> > --- a/include/hw/riscv/sifive_u_otp.h
> > +++ b/include/hw/riscv/sifive_u_otp.h
> > @@ -52,6 +52,8 @@
> >  #define SIFIVE_U_OTP(obj) \
> >      OBJECT_CHECK(SiFiveUOTPState, (obj), TYPE_SIFIVE_U_OTP)
> >
> > +extern const char *otp_file;
> > +
> >  typedef struct SiFiveUOTPState {
> >      /*< private >*/
> >      SysBusDevice parent_obj;
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 708583b4ce..eb9a54f4ed 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -415,10 +415,11 @@ ERST
> >
> >  DEF("boot", HAS_ARG, QEMU_OPTION_boot,
> >      "-boot [order=drives][,once=drives][,menu=on|off]\n"
> > -    "
> [,splash=sp_name][,splash-time=sp_time][,reboot-timeout=rb_time][,strict=on|off]\n"
> > +    "
> [,splash=sp_name][,splash-time=sp_time][,reboot-timeout=rb_time][,strict=on|off][,otp-file=otp_file]\n"
> >      "                'drives': floppy (a), hard disk (c), CD-ROM (d),
> network (n)\n"
> >      "                'sp_name': the file's name that would be passed to
> bios as logo picture, if menu=on\n"
> >      "                'sp_time': the period that splash picture last if
> menu=on, unit is ms\n"
> > +    "                'otp_file': the file name backed OTP\n"
> >      "                'rb_timeout': the timeout before guest reboot when
> boot failed, unit is ms\n",
>
> Instead of touching generic codes, could we add such property at the
> board level?
>
> >      QEMU_ARCH_ALL)
> >  SRST
>
> Regards,
> Bin
>

--000000000000d1d5f605ab76d6ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Bin,<br><br>Thanks for the reply.<br><=
br>I think we can add property to sifive_u_otp_properties[] (something like=
 below) and remove generic code dependency. What do you think of it?</div><=
div dir=3D"ltr"><br>@@ -243,6 +245,7 @@ static const MemoryRegionOps sifive=
_u_otp_ops =3D {<br>=C2=A0<br>=C2=A0static Property sifive_u_otp_properties=
[] =3D {<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT32(&quot;serial&quot;, SiFi=
veUOTPState, serial, 0),<br>+ =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;otp_fil=
e&quot;, SiFiveUOTPState, otp_file),<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END=
_OF_LIST(),<br>=C2=A0};<br><br>=C2=A0typedef struct SiFiveUOTPState {<br>=
=C2=A0 =C2=A0 =C2=A0/*&lt; private &gt;*/<br>=C2=A0 =C2=A0 =C2=A0SysBusDevi=
ce parent_obj;<br>@@ -77,6 +75,7 @@ typedef struct SiFiveUOTPState {<br>=C2=
=A0 =C2=A0 =C2=A0uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];<br>=C2=A0 =C2=A0 =
=C2=A0/* config */<br>=C2=A0 =C2=A0 =C2=A0uint32_t serial;<br>+ =C2=A0 =C2=
=A0char *otp_file;<br>=C2=A0 =C2=A0 =C2=A0uint32_t fuse_wo[SIFIVE_U_OTP_NUM=
_FUSES];<br>=C2=A0} SiFiveUOTPState;<br><br>Regards,<br>Green<br><br></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Jul 24, 2020 at 10:20 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.co=
m" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hi Green,<br>
<br>
On Fri, Jul 24, 2020 at 5:51 PM Green Wan &lt;<a href=3D"mailto:green.wan@s=
ifive.com" target=3D"_blank">green.wan@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add a file-backed implementation for OTP of sifive_u machine. Use<br>
&gt; &#39;-boot otp-file=3Dxxx&#39; to enable it. Do file open, mmap and cl=
ose<br>
&gt; for every OTP read/write in case keep the update-to-date snapshot<br>
&gt; of OTP.<br>
&gt;<br>
&gt; Signed-off-by: Green Wan &lt;<a href=3D"mailto:green.wan@sifive.com" t=
arget=3D"_blank">green.wan@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/sifive_u_otp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 88 ++=
++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 include/hw/riscv/sifive_u_otp.h |=C2=A0 2 +<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt;=C2=A0 softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++-<br>
&gt;=C2=A0 4 files changed, 96 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c<br>
&gt; index f6ecbaa2ca..26e1965821 100644<br>
&gt; --- a/hw/riscv/sifive_u_otp.c<br>
&gt; +++ b/hw/riscv/sifive_u_otp.c<br>
&gt; @@ -24,6 +24,72 @@<br>
&gt;=C2=A0 #include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/module.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/riscv/sifive_u_otp.h&quot;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;sys/types.h&gt;<br>
&gt; +#include &lt;sys/stat.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
&gt; +#include &lt;fcntl.h&gt;<br>
&gt; +#include &lt;sys/mman.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +<br>
&gt; +#define TRACE_PREFIX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;F=
U540_OTP: &quot;<br>
&gt; +#define SIFIVE_FU540_OTP_SIZE=C2=A0 =C2=A0(SIFIVE_U_OTP_NUM_FUSES * 4=
)<br>
&gt; +<br>
&gt; +static int otp_backed_fd;<br>
&gt; +static unsigned int *otp_mmap;<br>
&gt; +<br>
&gt; +static void sifive_u_otp_backed_load(const char *filename);<br>
&gt; +static uint64_t sifive_u_otp_backed_read(uint32_t fuseidx);<br>
&gt; +static void sifive_u_otp_backed_write(uint32_t fuseidx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t pa=
io,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t pd=
in);<br>
&gt; +static void sifive_u_otp_backed_unload(void);<br>
&gt; +<br>
&gt; +void sifive_u_otp_backed_load(const char *filename)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (otp_backed_fd &lt; 0) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 otp_backed_fd =3D open(filename, O_RDWR);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (otp_backed_fd &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_TRACE,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TRACE_PREFIX &quot;Warning: can&#39;t open otp file\n=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 otp_mmap =3D (unsigned int =
*)mmap(0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 SIFIVE_FU540_OTP_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 PROT_READ | PROT_WRITE | PROT_EXEC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MAP_FILE | MAP_SHARED,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 otp_backed_fd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (otp_mmap =3D=3D MAP_FAI=
LED)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask=
(LOG_TRACE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TRACE_PREFIX &quot;Warning: can&#39;t m=
map otp file\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +uint64_t sifive_u_otp_backed_read(uint32_t fuseidx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return (uint64_t)(otp_mmap[fuseidx]);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void sifive_u_otp_backed_write(uint32_t fuseidx, uint32_t paio, uint3=
2_t pdin)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 otp_mmap[fuseidx] &amp;=3D ~(pdin &lt;&lt; paio);<br>
&gt; +=C2=A0 =C2=A0 otp_mmap[fuseidx] |=3D (pdin &lt;&lt; paio);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +void sifive_u_otp_backed_unload(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 munmap(otp_mmap, SIFIVE_FU540_OTP_SIZE);<br>
&gt; +=C2=A0 =C2=A0 close(otp_backed_fd);<br>
&gt; +=C2=A0 =C2=A0 otp_backed_fd =3D -1;<br>
&gt; +}<br>
&gt;<br>
&gt;=C2=A0 static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, uns=
igned int size)<br>
&gt;=C2=A0 {<br>
&gt; @@ -46,7 +112,17 @@ static uint64_t sifive_u_otp_read(void *opaque, hw=
addr addr, unsigned int size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((s-&gt;pce &amp; SIFIVE_U_OTP_PC=
E_EN) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (s-&gt;pdstb &amp; SIF=
IVE_U_OTP_PDSTB_EN) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (s-&gt;ptrim &amp; SIF=
IVE_U_OTP_PTRIM_EN)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;fuse[s-&gt;pa =
&amp; SIFIVE_U_OTP_PA_MASK];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (otp_file) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_u_otp_=
backed_load(otp_file);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D sifiv=
e_u_otp_backed_read(s-&gt;pa);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_u_otp_=
backed_unload();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return val;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;=
fuse[s-&gt;pa &amp; SIFIVE_U_OTP_PA_MASK];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0xff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -123,6 +199,12 @@ static void sifive_u_otp_write(void *opaque, hwad=
dr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;ptrim =3D val32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case SIFIVE_U_OTP_PWE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (otp_file) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_u_otp_backed_load(ot=
p_file);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_u_otp_backed_write(s=
-&gt;pa, s-&gt;paio, s-&gt;pdin);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_u_otp_backed_unload(=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;pwe =3D val32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; @@ -165,6 +247,10 @@ static void sifive_u_otp_reset(DeviceState *dev)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Make a valid content of serial number */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;fuse[SIFIVE_U_OTP_SERIAL_ADDR] =3D s-&gt;ser=
ial;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;fuse[SIFIVE_U_OTP_SERIAL_ADDR + 1] =3D ~(s-&=
gt;serial);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Initialize file mmap and descriptor. */<br>
&gt; +=C2=A0 =C2=A0 otp_mmap =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 otp_backed_fd =3D -1;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void sifive_u_otp_class_init(ObjectClass *klass, void *da=
ta)<br>
&gt; diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive=
_u_otp.h<br>
&gt; index 639297564a..1342bd7342 100644<br>
&gt; --- a/include/hw/riscv/sifive_u_otp.h<br>
&gt; +++ b/include/hw/riscv/sifive_u_otp.h<br>
&gt; @@ -52,6 +52,8 @@<br>
&gt;=C2=A0 #define SIFIVE_U_OTP(obj) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OBJECT_CHECK(SiFiveUOTPState, (obj), TYPE_SIFIVE_U=
_OTP)<br>
&gt;<br>
&gt; +extern const char *otp_file;<br>
&gt; +<br>
&gt;=C2=A0 typedef struct SiFiveUOTPState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 708583b4ce..eb9a54f4ed 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -415,10 +415,11 @@ ERST<br>
&gt;<br>
&gt;=C2=A0 DEF(&quot;boot&quot;, HAS_ARG, QEMU_OPTION_boot,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-boot [order=3Ddrives][,once=3Ddrives][,menu=
=3Don|off]\n&quot;<br>
&gt; -=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 [,splash=3Dsp_name][,splash-=
time=3Dsp_time][,reboot-timeout=3Drb_time][,strict=3Don|off]\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 [,splash=3Dsp_name][,splash-=
time=3Dsp_time][,reboot-timeout=3Drb_time][,strict=3Don|off][,otp-file=3Dot=
p_file]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;drives&#39;: floppy (a), hard disk (c), CD-ROM (d), netw=
ork (n)\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;sp_name&#39;: the file&#39;s name that would be passed t=
o bios as logo picture, if menu=3Don\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;sp_time&#39;: the period that splash picture last if men=
u=3Don, unit is ms\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;otp_file&#39;: the file name backed OTP\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;rb_timeout&#39;: the timeout before guest reboot when bo=
ot failed, unit is ms\n&quot;,<br>
<br>
Instead of touching generic codes, could we add such property at the<br>
board level?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QEMU_ARCH_ALL)<br>
&gt;=C2=A0 SRST<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div></div>

--000000000000d1d5f605ab76d6ff--

