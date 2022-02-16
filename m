Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15FB4B876F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:16:53 +0100 (CET)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJEq-0000BF-Gc
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:16:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nKJDk-0007pN-Fx
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:15:44 -0500
Received: from [2607:f8b0:4864:20::1036] (port=35772
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1nKJDX-00058v-En
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:15:42 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso6311350pjg.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 04:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eGw3uMhscDWIaNNKqErCuAGExMjHPVtjhPSQn7hbK0M=;
 b=dSUQNmnJ7QNzWtLnL8rMh9lHjjhtLCxiAl7HKnyW6rXOUeajWCCzzdWRwTkWv4j46m
 e9W5H7aCyakJxZRENiBsvG6mAI1/9DMW9zHBgQYPmh3FPPiQQyGTgmY5+wUS+bYZ9c87
 kWKLZZC2AcGnD/C36pq7VKFxOYWGOmtCabMzb68nr0xaGCMOQUyUiVdbbLW/DmTcLRuB
 qQJUUS5SzgSU/KH023jNkKEutNdcn7RIl+pSqjZOibnu1gW0lrRqOyVjz2Tmxi7M2Y7S
 ES8mzWMvFwmMudvkDsOLFYrqcMkdPtzk7XFCXM28PJQ92WWV5DMYjKjkwowJHwy8Cnqe
 BAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eGw3uMhscDWIaNNKqErCuAGExMjHPVtjhPSQn7hbK0M=;
 b=LjjLufId01QqtdORKcvK4Gxdg5o/QJRZm885NihPXp+PONiroIvl01pLLHrynXSp0L
 vl/eq4m+9WuKmeYHIyLSmNmDvO7u6nWOGlb6cWcy70FpyM5nL1X+XmKDFmnDsMb0mUPu
 UHG53Bo6eIcLskyiUpZYYUSyOsUV7BdVAXg0K1FTri1prHB9RVP8EhahgQ3N75kRCkOw
 i7pxqUnI2x2AI6kOS0JPmMuR6GiDe9nN51GavgInWikHtSuZjIO8G7kJ1FU+C0zALlGC
 zqXMqAJ+iH/+qsh4VuJEQmv8yfdVsdxHdfC1F3IbNE4iAp+toaO0k3vrE1OAfEJlE+tu
 98LA==
X-Gm-Message-State: AOAM532vuz+Ef/dq5IBPyZSBpo5AOF5Gxc9dPM8nu2qOXNizUD/yJAnQ
 JZO27yBSl7NGAGcWqG+OogaMnOyqzDmV86E8x7Id4AAKq3IVXw==
X-Google-Smtp-Source: ABdhPJzMHBS6nsbW8doF6J9V06eUdznjcUVRvuW8uFHHd5l7RZXsd5wekpmnM5S7he6LMM6LWqTg8p6i6kt3ahNXQhM=
X-Received: by 2002:a17:902:82c7:b0:14f:252d:67e7 with SMTP id
 u7-20020a17090282c700b0014f252d67e7mr2598110plz.27.1645013726034; Wed, 16 Feb
 2022 04:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20220113152836.60398-1-yaroshchuk2000@gmail.com>
In-Reply-To: <20220113152836.60398-1-yaroshchuk2000@gmail.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Wed, 16 Feb 2022 15:15:15 +0300
Message-ID: <CADO9X9TqnmBrEKDxNkny05-YhS=wMQ7dEG18jUBaOZ_EiGXvgQ@mail.gmail.com>
Subject: Re: [PATCH v8] isa-applesmc: provide OSK forwarding on Apple hosts
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ca7edc05d8219a41"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, suse@csgraf.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca7edc05d8219a41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping
https://patchew.org/QEMU/20220113152836.60398-1-yaroshchuk2000@gmail.com/

=D1=87=D1=82, 13 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 18:28, Vladislav Y=
aroshchuk <yaroshchuk2000@gmail.com
>:

> On Apple hosts we can read AppleSMC OSK key directly from host's
> SMC and forward this value to QEMU Guest.
>
> New 'hostosk' property is added:
> * `-device isa-applesmc,hostosk=3Don`
> The property is set to 'on' by default for machine version > 6.2
>
> Apple licence allows use and run up to two additional copies
> or instances of macOS operating system within virtual operating system
> environments on each Apple-branded computer that is already running
> the Apple Software, for purposes of:
>  * software development
>  * testing during software development
>  * using macOS Server
>  * personal, non-commercial use
>
> Guest macOS requires AppleSMC with correct OSK. The most legal
> way to pass it to the Guest is to forward the key from host SMC
> without any value exposion.
>
> Based on
> https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter=
7/tpmdrmmyth/
>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>  hw/core/machine.c  |   4 +-
>  hw/misc/applesmc.c | 125 +++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 125 insertions(+), 4 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index debcdc0e70..ea70be0270 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>
> -GlobalProperty hw_compat_6_2[] =3D {};
> +GlobalProperty hw_compat_6_2[] =3D {
> +    { "isa-applesmc", "hostosk", "off" }
> +};
>  const size_t hw_compat_6_2_len =3D G_N_ELEMENTS(hw_compat_6_2);
>
>  GlobalProperty hw_compat_6_1[] =3D {
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1b9acaf1d3..99bcc937f9 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -37,6 +37,11 @@
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
>  #include "qom/object.h"
> +#include "qapi/error.h"
> +
> +#if defined(__APPLE__) && defined(__MACH__)
> +#include <IOKit/IOKitLib.h>
> +#endif
>
>  /* #define DEBUG_SMC */
>
> @@ -80,7 +85,7 @@ enum {
>  #define smc_debug(...) do { } while (0)
>  #endif
>
> -static char default_osk[64] =3D "This is a dummy key. Enter the real key=
 "
> +static char default_osk[65] =3D "This is a dummy key. Enter the real key=
 "
>                                "using the -osk parameter";
>
>  struct AppleSMCData {
> @@ -109,6 +114,7 @@ struct AppleSMCState {
>      uint8_t data_pos;
>      uint8_t data[255];
>      char *osk;
> +    bool hostosk;
>      QLIST_HEAD(, AppleSMCData) data_def;
>  };
>
> @@ -312,6 +318,101 @@ static const MemoryRegionOps applesmc_err_io_ops =
=3D {
>      },
>  };
>
> +#if defined(__APPLE__) && defined(__MACH__)
> +/*
> + * Based on
> + *
> https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter=
7/tpmdrmmyth/
> + */
> +enum {
> +    SMC_HANDLE_EVENT     =3D 2,
> +    SMC_READ_KEY         =3D 5
> +};
> +
> +struct AppleSMCParam {
> +    uint32_t key;
> +    uint8_t pad0[22];
> +    IOByteCount data_size;
> +    uint8_t pad1[10];
> +    uint8_t command;
> +    uint32_t pad2;
> +    uint8_t bytes[32];
> +};
> +
> +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> +{
> +    assert(host_osk !=3D NULL);
> +
> +    io_service_t hostsmc_service =3D IO_OBJECT_NULL;
> +    io_connect_t hostsmc_connect =3D IO_OBJECT_NULL;
> +    size_t smc_param_size =3D sizeof(struct AppleSMCParam);
> +    IOReturn status =3D kIOReturnError;
> +    int i;
> +
> +    struct AppleSMCParam smc_param[2] =3D {
> +         {
> +             .key =3D ('OSK0'),
> +             .data_size =3D sizeof(smc_param[0].bytes),
> +             .command =3D SMC_READ_KEY,
> +         }, {
> +             .key =3D ('OSK1'),
> +             .data_size =3D sizeof(smc_param[0].bytes),
> +             .command =3D SMC_READ_KEY,
> +         },
> +    };
> +
> +    hostsmc_service =3D IOServiceGetMatchingService(
> +        kIOMasterPortDefault,
> +        IOServiceMatching("AppleSMC"));
> +    if (hostsmc_service =3D=3D IO_OBJECT_NULL) {
> +        error_setg(errp, "Unable to get host-AppleSMC service");
> +        goto error;
> +    }
> +
> +    status =3D IOServiceOpen(hostsmc_service,
> +                           mach_task_self(),
> +                           0,
> +                           &hostsmc_connect);
> +    if (status !=3D kIOReturnSuccess || hostsmc_connect =3D=3D IO_OBJECT=
_NULL) {
> +        error_setg(errp, "Unable to open host-AppleSMC service");
> +        goto error;
> +    }
> +
> +    for (i =3D 0; i < ARRAY_SIZE(smc_param); ++i) {
> +        status =3D IOConnectCallStructMethod(
> +                hostsmc_connect,
> +                SMC_HANDLE_EVENT,
> +                &smc_param[i],
> +                sizeof(struct AppleSMCParam),
> +                &smc_param[i],
> +                &smc_param_size
> +            );
> +
> +        if (status !=3D kIOReturnSuccess) {
> +            error_setg(errp, "Unable to read OSK from host-AppleSMC");
> +            goto error;
> +        }
> +    }
> +
> +    memcpy(host_osk, smc_param[0].bytes, 32);
> +    memcpy(host_osk + 32, smc_param[1].bytes, 32);
> +
> +    IOServiceClose(hostsmc_connect);
> +    IOObjectRelease(hostsmc_service);
> +    return true;
> +
> +error:
> +    IOServiceClose(hostsmc_connect);
> +    IOObjectRelease(hostsmc_service);
> +    return false;
> +}
> +#else
> +static bool applesmc_read_host_osk(char *host_osk, Error **errp)
> +{
> +    error_setg(errp, "OSK read is not supported on this host");
> +    return false;
> +}
> +#endif
> +
>  static void applesmc_isa_realize(DeviceState *dev, Error **errp)
>  {
>      AppleSMCState *s =3D APPLE_SMC(dev);
> @@ -331,9 +432,26 @@ static void applesmc_isa_realize(DeviceState *dev,
> Error **errp)
>      isa_register_ioport(&s->parent_obj, &s->io_err,
>                          s->iobase + APPLESMC_ERR_PORT);
>
> -    if (!s->osk || (strlen(s->osk) !=3D 64)) {
> -        warn_report("Using AppleSMC with invalid key");
> +    if (s->osk && s->hostosk) {
> +        error_setg(errp, "-osk property cannot be used with -hostosk=3Do=
n");
> +    }
> +
> +    if (!s->osk && !s->hostosk) {
>          s->osk =3D default_osk;
> +        warn_report("Using AppleSMC with default (dummy) OSK");
> +    }
> +
> +    if (s->hostosk) {
> +        s->osk =3D g_malloc0(65);
> +        /* Fail hard if we cannot read requested host OSK */
> +        if (!applesmc_read_host_osk(s->osk, errp)) {
> +            g_assert_not_reached();
> +        }
> +    }
> +
> +    if (s->osk && strlen(s->osk) !=3D 64) {
> +        /* Only valid OSK is accepted within 'osk' property */
> +        error_setg(errp, "Using AppleSMC with key of invalid length");
>      }
>
>      QLIST_INIT(&s->data_def);
> @@ -344,6 +462,7 @@ static Property applesmc_isa_properties[] =3D {
>      DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState, iobase,
>                         APPLESMC_DEFAULT_IOBASE),
>      DEFINE_PROP_STRING("osk", AppleSMCState, osk),
> +    DEFINE_PROP_BOOL("hostosk", AppleSMCState, hostosk, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.23.0
>
>

--000000000000ca7edc05d8219a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping=C2=A0<a href=3D"https://patchew.org/QEMU/202201131528=
36.60398-1-yaroshchuk2000@gmail.com/">https://patchew.org/QEMU/202201131528=
36.60398-1-yaroshchuk2000@gmail.com/</a></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 13 =D1=8F=D0=BD=D0=B2=
. 2022 =D0=B3. =D0=B2 18:28, Vladislav Yaroshchuk &lt;<a href=3D"mailto:yar=
oshchuk2000@gmail.com">yaroshchuk2000@gmail.com</a>&gt;:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Apple hosts we can read AppleSM=
C OSK key directly from host&#39;s<br>
SMC and forward this value to QEMU Guest.<br>
<br>
New &#39;hostosk&#39; property is added:<br>
* `-device isa-applesmc,hostosk=3Don`<br>
The property is set to &#39;on&#39; by default for machine version &gt; 6.2=
<br>
<br>
Apple licence allows use and run up to two additional copies<br>
or instances of macOS operating system within virtual operating system<br>
environments on each Apple-branded computer that is already running<br>
the Apple Software, for purposes of:<br>
=C2=A0* software development<br>
=C2=A0* testing during software development<br>
=C2=A0* using macOS Server<br>
=C2=A0* personal, non-commercial use<br>
<br>
Guest macOS requires AppleSMC with correct OSK. The most legal<br>
way to pass it to the Guest is to forward the key from host SMC<br>
without any value exposion.<br>
<br>
Based on <a href=3D"https://web.archive.org/web/20200103161737/osxbook.com/=
book/bonus/chapter7/tpmdrmmyth/" rel=3D"noreferrer" target=3D"_blank">https=
://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdr=
mmyth/</a><br>
<br>
Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk2000@gm=
ail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/core/machine.c=C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0hw/misc/applesmc.c | 125 +++++++++++++++++++++++++++++++++++++++++++-=
-<br>
=C2=A02 files changed, 125 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/hw/core/machine.c b/hw/core/machine.c<br>
index debcdc0e70..ea70be0270 100644<br>
--- a/hw/core/machine.c<br>
+++ b/hw/core/machine.c<br>
@@ -37,7 +37,9 @@<br>
=C2=A0#include &quot;hw/virtio/virtio.h&quot;<br>
=C2=A0#include &quot;hw/virtio/virtio-pci.h&quot;<br>
<br>
-GlobalProperty hw_compat_6_2[] =3D {};<br>
+GlobalProperty hw_compat_6_2[] =3D {<br>
+=C2=A0 =C2=A0 { &quot;isa-applesmc&quot;, &quot;hostosk&quot;, &quot;off&q=
uot; }<br>
+};<br>
=C2=A0const size_t hw_compat_6_2_len =3D G_N_ELEMENTS(hw_compat_6_2);<br>
<br>
=C2=A0GlobalProperty hw_compat_6_1[] =3D {<br>
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c<br>
index 1b9acaf1d3..99bcc937f9 100644<br>
--- a/hw/misc/applesmc.c<br>
+++ b/hw/misc/applesmc.c<br>
@@ -37,6 +37,11 @@<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+<br>
+#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
+#include &lt;IOKit/IOKitLib.h&gt;<br>
+#endif<br>
<br>
=C2=A0/* #define DEBUG_SMC */<br>
<br>
@@ -80,7 +85,7 @@ enum {<br>
=C2=A0#define smc_debug(...) do { } while (0)<br>
=C2=A0#endif<br>
<br>
-static char default_osk[64] =3D &quot;This is a dummy key. Enter the real =
key &quot;<br>
+static char default_osk[65] =3D &quot;This is a dummy key. Enter the real =
key &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;using the -osk parameter&quot;;=
<br>
<br>
=C2=A0struct AppleSMCData {<br>
@@ -109,6 +114,7 @@ struct AppleSMCState {<br>
=C2=A0 =C2=A0 =C2=A0uint8_t data_pos;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t data[255];<br>
=C2=A0 =C2=A0 =C2=A0char *osk;<br>
+=C2=A0 =C2=A0 bool hostosk;<br>
=C2=A0 =C2=A0 =C2=A0QLIST_HEAD(, AppleSMCData) data_def;<br>
=C2=A0};<br>
<br>
@@ -312,6 +318,101 @@ static const MemoryRegionOps applesmc_err_io_ops =3D =
{<br>
=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0};<br>
<br>
+#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
+/*<br>
+ * Based on<br>
+ * <a href=3D"https://web.archive.org/web/20200103161737/osxbook.com/book/=
bonus/chapter7/tpmdrmmyth/" rel=3D"noreferrer" target=3D"_blank">https://we=
b.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth=
/</a><br>
+ */<br>
+enum {<br>
+=C2=A0 =C2=A0 SMC_HANDLE_EVENT=C2=A0 =C2=A0 =C2=A0=3D 2,<br>
+=C2=A0 =C2=A0 SMC_READ_KEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 5<br>
+};<br>
+<br>
+struct AppleSMCParam {<br>
+=C2=A0 =C2=A0 uint32_t key;<br>
+=C2=A0 =C2=A0 uint8_t pad0[22];<br>
+=C2=A0 =C2=A0 IOByteCount data_size;<br>
+=C2=A0 =C2=A0 uint8_t pad1[10];<br>
+=C2=A0 =C2=A0 uint8_t command;<br>
+=C2=A0 =C2=A0 uint32_t pad2;<br>
+=C2=A0 =C2=A0 uint8_t bytes[32];<br>
+};<br>
+<br>
+static bool applesmc_read_host_osk(char *host_osk, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 assert(host_osk !=3D NULL);<br>
+<br>
+=C2=A0 =C2=A0 io_service_t hostsmc_service =3D IO_OBJECT_NULL;<br>
+=C2=A0 =C2=A0 io_connect_t hostsmc_connect =3D IO_OBJECT_NULL;<br>
+=C2=A0 =C2=A0 size_t smc_param_size =3D sizeof(struct AppleSMCParam);<br>
+=C2=A0 =C2=A0 IOReturn status =3D kIOReturnError;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 struct AppleSMCParam smc_param[2] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.key =3D (&#39;OSK0&#39;),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data_size =3D sizeof(smc_=
param[0].bytes),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.command =3D SMC_READ_KEY,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}, {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.key =3D (&#39;OSK1&#39;),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data_size =3D sizeof(smc_=
param[0].bytes),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.command =3D SMC_READ_KEY,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 hostsmc_service =3D IOServiceGetMatchingService(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kIOMasterPortDefault,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IOServiceMatching(&quot;AppleSMC&quot;));<br>
+=C2=A0 =C2=A0 if (hostsmc_service =3D=3D IO_OBJECT_NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to get host-Appl=
eSMC service&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 status =3D IOServiceOpen(hostsmc_service,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0mach_task_self(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&amp;hostsmc_connect);<br>
+=C2=A0 =C2=A0 if (status !=3D kIOReturnSuccess || hostsmc_connect =3D=3D I=
O_OBJECT_NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to open host-App=
leSMC service&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(smc_param); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D IOConnectCallStructMethod(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hostsmc_connect,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SMC_HANDLE_EVENT,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;smc_param[i],=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct Appl=
eSMCParam),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;smc_param[i],=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;smc_param_siz=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status !=3D kIOReturnSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unable to=
 read OSK from host-AppleSMC&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memcpy(host_osk, smc_param[0].bytes, 32);<br>
+=C2=A0 =C2=A0 memcpy(host_osk + 32, smc_param[1].bytes, 32);<br>
+<br>
+=C2=A0 =C2=A0 IOServiceClose(hostsmc_connect);<br>
+=C2=A0 =C2=A0 IOObjectRelease(hostsmc_service);<br>
+=C2=A0 =C2=A0 return true;<br>
+<br>
+error:<br>
+=C2=A0 =C2=A0 IOServiceClose(hostsmc_connect);<br>
+=C2=A0 =C2=A0 IOObjectRelease(hostsmc_service);<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+#else<br>
+static bool applesmc_read_host_osk(char *host_osk, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, &quot;OSK read is not supported on this hos=
t&quot;);<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+#endif<br>
+<br>
=C2=A0static void applesmc_isa_realize(DeviceState *dev, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AppleSMCState *s =3D APPLE_SMC(dev);<br>
@@ -331,9 +432,26 @@ static void applesmc_isa_realize(DeviceState *dev, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0isa_register_ioport(&amp;s-&gt;parent_obj, &amp;s-&gt;i=
o_err,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0s-&gt;iobase + APPLESMC_ERR_PORT);<br>
<br>
-=C2=A0 =C2=A0 if (!s-&gt;osk || (strlen(s-&gt;osk) !=3D 64)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Using AppleSMC with invalid =
key&quot;);<br>
+=C2=A0 =C2=A0 if (s-&gt;osk &amp;&amp; s-&gt;hostosk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;-osk property cannot be=
 used with -hostosk=3Don&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!s-&gt;osk &amp;&amp; !s-&gt;hostosk) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;osk =3D default_osk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Using AppleSMC with default =
(dummy) OSK&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;hostosk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;osk =3D g_malloc0(65);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Fail hard if we cannot read requested host =
OSK */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!applesmc_read_host_osk(s-&gt;osk, errp)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;osk &amp;&amp; strlen(s-&gt;osk) !=3D 64) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only valid OSK is accepted within &#39;osk&=
#39; property */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Using AppleSMC with key=
 of invalid length&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0QLIST_INIT(&amp;s-&gt;data_def);<br>
@@ -344,6 +462,7 @@ static Property applesmc_isa_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT32(APPLESMC_PROP_IO_BASE, AppleSMCState=
, iobase,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 APPLESMC_DEFAULT_IOBASE),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;osk&quot;, AppleSMCState, osk)=
,<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;hostosk&quot;, AppleSMCState, hostosk=
, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
=C2=A0};<br>
<br>
-- <br>
2.23.0<br>
<br>
</blockquote></div>

--000000000000ca7edc05d8219a41--

