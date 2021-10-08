Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE067426A65
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:06:30 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYody-00089F-0p
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1mYobd-0006US-76
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:04:05 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1mYobW-0005JD-S3
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:04:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id k23so7440381pji.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M4NY4E07dM+uQmPW2VSBQgCRG7peZMgsxM4u/f3F2R4=;
 b=QBw6dae0qC8uriGFYz7EcHb5qV8x9YrRYlL8qWbrTb/6Cb/QhYd4rMbu7ZeBFSfaPM
 v0CTHBY+1I8CBl2ZPsxpT9ArABRAsHRQrDvuhHHACVbW9zpjXhkbagTyVj1QzZySxDGt
 OzuqMNVFvlM7UVMHwjzqcezmypVxzPB6PsRTz2WIXe7Ak3ZDoK644KOJJkOJi3vxTLzb
 OrRYiW7yiiBpQiZFvuJcjmcyrAlho2VY5CZlMAA5cv2pX0G+j0N1pfeuEpxJlpIqL5GA
 hdPnbQBCqTrAUmUqWSdIOMP+gow51RVfm+f6rGJt4p1dppkrtr5lq4iungpt1Y3hFMzF
 yGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M4NY4E07dM+uQmPW2VSBQgCRG7peZMgsxM4u/f3F2R4=;
 b=1TW8mkVITRWl0m1HmX5rZHe/MttGcS0DyUM+u5z82bgNyurHtBOKz8B8bufctJVOvd
 BD19YUT/J0IAJKerjRAn4SU6m3BGOPfMsrzcdzUsaVV1NTEVqVe5hpoGrQOuuqOLfEZO
 SCSF6hu81R3mwT8UFYkFIkJSwnA87vTMx/9BO46h/DkUQMFL3qSe3cyZtBU66jwvJkX2
 TcQZEnaCdVaT33VsIov1wMJiVEPLnT0xisnLZI9IDdO01JGlDfG421QiQtIzetD+BOFB
 AXd7m3UehoOvQR2Rn3mm0S4PoLECb7IXBRDZ6qsbO9VASl8xNHFhxKuVrhzjhAdYcxZR
 kMwQ==
X-Gm-Message-State: AOAM53216pPU8lAFs+bfxcA0KRNy/5d2kv6+Y4yofQFeSQZGIs6i/HOa
 dhez+0O3N06xWgrUXIFHQgQ8TQsLjpwANPEpPR7HKQ==
X-Google-Smtp-Source: ABdhPJzAf4u989BULq2X384f7Ia7Upst/6lL7hcrZFY6Sg/vQ9BBz3Wt61zt3nZR00IsuzzD99IAncVL/zaEeTcFB7g=
X-Received: by 2002:a17:90b:354e:: with SMTP id
 lt14mr11189955pjb.244.1633694634978; 
 Fri, 08 Oct 2021 05:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <4E271071-0799-4948-A445-134E7FAAD48D@gmail.com>
In-Reply-To: <4E271071-0799-4948-A445-134E7FAAD48D@gmail.com>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Fri, 8 Oct 2021 14:03:43 +0200
Message-ID: <CAAibmn2wMmpRCn3GCxY0=gkAW=ZkxVB0+yMrY-w20Je++h3yiw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
To: =?UTF-8?Q?Pedro_To=CC=82rres?= <t0rr3sp3dr0@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000063c59205cdd62c08"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::102f;
 envelope-from=phil@philjordan.eu; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: rene@exactcode.de, jan.kiszka@siemens.com, qemu-devel@nongnu.org,
 agraf@suse.de, "Gabriel L. Somlo" <gsomlo@gmail.com>, suse@csgraf.de,
 afaerber@suse.de, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063c59205cdd62c08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies for the late reply, I've been rather busy=E2=80=A6

Generally, I think this is an awesome feature addition. (I also agree with
Paolo's modification.) A few additional concerns though:


1. Licensing
Given that the code it's heavily based on is copyright Apple Computer Inc.,
licensed under APSL, is it safe including it in qemu as is?
If the integrated code is going to be quite so "directly inspired" (down to
the inconsistent struct definition style and mixing unrelated constants in
the same anonymous enum), perhaps at minimum place it in its own isolated
source file with appropriate notice?


2. The actual code seems somewhat more verbose/generic than it needs to be,
from my point of view. For example:

- IOConnectCallMethod calls with kSMCUserClientOpen/kSMCUserClientClose
seem unnecessarily verbose. Using IOConnectCallStructMethod or
IOConnectCallScalarMethod would be a little more compact. Or you could
leave them out entirely, because the code still works if they're missing.
- There's error handling for cases that can't ever happen in the code as it
stands, such as:   if (key =3D=3D 0 || bytes =3D=3D NULL) {
- There's distinct error handling for different kinds of failure modes in
the helper function, percolating IOReturn codes to the caller, but the way
the helper function is called is effectively just a boolean
success/failure, so why bother with the complexity?
- The connection to the AppleSMC service is closed and reopened between
reading the OSK0 and OSK1 keys. This isn't necessary. (The way the whole
thing flows only really makes sense if you treat OSK0/OSK1 as 2 of many
other 1-off keys, but I don't think the others are ever likely to be used
in the same way in qemu as they'd constitute a VM escape.)

I realise each of these aspects has essentially survived 1:1 from Apple's
original code, which in my opinion would appear to make my first concern
all the more worrying=E2=80=A6


I'm not a Qemu maintainer though, so I'll leave it to actual maintainers to
decide how much of a problem any of this is.


On Sat, 2 Oct 2021 at 22:24, Pedro To=CC=82rres <t0rr3sp3dr0@gmail.com> wro=
te:

> When running on a Mac, QEMU is able to get the host OSK and use it as
> the default value for the AppleSMC device. The OSK query operation
> doesn't require administrator privileges and can be executed by any user
> on the system. This patch is based on open-source code from Apple, just
> like the implementation from VirtualBox.
>
> Apple:
>
> https://opensource.apple.com/source/IOKitUser/IOKitUser-647.6.13/pwr_mgt.=
subproj/IOPMLibPrivate.c
>
> https://opensource.apple.com/source/PowerManagement/PowerManagement-637.6=
0.1/pmconfigd/PrivateLib.c
>
> VirtualBox:
>
> https://www.virtualbox.org/browser/vbox/trunk/src/VBox/Devices/EFI/DevSmc=
.cpp#L516
>
> Signed-off-by: Pedro To=CC=82rres <t0rr3sp3dr0@gmail.com>
> ---
> hw/misc/applesmc.c | 185 +++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 185 insertions(+)
>
> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> index 1b9acaf..824135d 100644
> --- a/hw/misc/applesmc.c
> +++ b/hw/misc/applesmc.c
> @@ -38,6 +38,171 @@
> #include "qemu/timer.h"
> #include "qom/object.h"
>
> +#if defined(__APPLE__) && defined(__MACH__)
> +#include <IOKit/IOKitLib.h>
> +
> +enum {
> +    kSMCSuccess     =3D 0x00,
> +    kSMCKeyNotFound =3D 0x84
> +};
> +
> +enum {
> +    kSMCUserClientOpen  =3D 0x00,
> +    kSMCUserClientClose =3D 0x01,
> +    kSMCHandleYPCEvent  =3D 0x02,
> +    kSMCReadKey         =3D 0x05,
> +    kSMCGetKeyInfo      =3D 0x09
> +};
> +
> +typedef struct SMCVersion {
> +    uint8_t  major;
> +    uint8_t  minor;
> +    uint8_t  build;
> +    uint8_t  reserved;
> +    uint16_t release;
> +} SMCVersion;
> +
> +typedef struct SMCPLimitData {
> +    uint16_t version;
> +    uint16_t length;
> +    uint32_t cpuPLimit;
> +    uint32_t gpuPLimit;
> +    uint32_t memPLimit;
> +} SMCPLimitData;
> +
> +typedef struct SMCKeyInfoData {
> +    IOByteCount dataSize;
> +    uint32_t    dataType;
> +    uint8_t     dataAttributes;
> +} SMCKeyInfoData;
> +
> +typedef struct {
> +    uint32_t       key;
> +    SMCVersion     vers;
> +    SMCPLimitData  pLimitData;
> +    SMCKeyInfoData keyInfo;
> +    uint8_t        result;
> +    uint8_t        status;
> +    uint8_t        data8;
> +    uint32_t       data32;
> +    uint8_t        bytes[32];
> +} SMCParamStruct;
> +
> +static IOReturn smc_call_struct_method(uint32_t selector,
> +                                       SMCParamStruct *inputStruct,
> +                                       SMCParamStruct *outputStruct)
> +{
> +    IOReturn ret;
> +
> +    size_t inputStructCnt =3D sizeof(SMCParamStruct);
> +    size_t outputStructCnt =3D sizeof(SMCParamStruct);
> +
> +    io_service_t smcService =3D IO_OBJECT_NULL;
> +    io_connect_t smcConnect =3D IO_OBJECT_NULL;
> +
> +    smcService =3D IOServiceGetMatchingService(kIOMasterPortDefault,
> +
>  IOServiceMatching("AppleSMC"));
> +    if (smcService =3D=3D IO_OBJECT_NULL) {
> +        ret =3D kIOReturnNotFound;
> +        goto exit;
> +    }
> +
> +    ret =3D IOServiceOpen(smcService, mach_task_self(), 1, &smcConnect);
> +    if (ret !=3D kIOReturnSuccess) {
> +        smcConnect =3D IO_OBJECT_NULL;
> +        goto exit;
> +    }
> +    if (smcConnect =3D=3D IO_OBJECT_NULL) {
> +        ret =3D kIOReturnError;
> +        goto exit;
> +    }
> +
> +    ret =3D IOConnectCallMethod(smcConnect, kSMCUserClientOpen,
> +                              NULL, 0, NULL, 0,
> +                              NULL, NULL, NULL, NULL);
> +    if (ret !=3D kIOReturnSuccess) {
> +        goto exit;
> +    }
> +
> +    ret =3D IOConnectCallStructMethod(smcConnect, selector,
> +                                    inputStruct, inputStructCnt,
> +                                    outputStruct, &outputStructCnt);
> +
> +exit:
> +    if (smcConnect !=3D IO_OBJECT_NULL) {
> +        IOConnectCallMethod(smcConnect, kSMCUserClientClose,
> +                            NULL, 0, NULL, 0, NULL,
> +                            NULL, NULL, NULL);
> +        IOServiceClose(smcConnect);
> +    }
> +
> +    return ret;
> +}
> +
> +static IOReturn smc_read_key(uint32_t key,
> +                             uint8_t *bytes,
> +                             IOByteCount *dataSize)
> +{
> +    IOReturn ret;
> +
> +    SMCParamStruct inputStruct;
> +    SMCParamStruct outputStruct;
> +
> +    if (key =3D=3D 0 || bytes =3D=3D NULL) {
> +        ret =3D kIOReturnCannotWire;
> +        goto exit;
> +    }
> +
> +    /* determine key's data size */
> +    memset(&inputStruct, 0, sizeof(SMCParamStruct));
> +    inputStruct.data8 =3D kSMCGetKeyInfo;
> +    inputStruct.key =3D key;
> +
> +    memset(&outputStruct, 0, sizeof(SMCParamStruct));
> +    ret =3D smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct,
> &outputStruct);
> +    if (ret !=3D kIOReturnSuccess) {
> +        goto exit;
> +    }
> +    if (outputStruct.result =3D=3D kSMCKeyNotFound) {
> +        ret =3D kIOReturnNotFound;
> +        goto exit;
> +    }
> +    if (outputStruct.result !=3D kSMCSuccess) {
> +        ret =3D kIOReturnInternalError;
> +        goto exit;
> +    }
> +
> +    /* get key value */
> +    memset(&inputStruct, 0, sizeof(SMCParamStruct));
> +    inputStruct.data8 =3D kSMCReadKey;
> +    inputStruct.key =3D key;
> +    inputStruct.keyInfo.dataSize =3D outputStruct.keyInfo.dataSize;
> +
> +    memset(&outputStruct, 0, sizeof(SMCParamStruct));
> +    ret =3D smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct,
> &outputStruct);
> +    if (ret !=3D kIOReturnSuccess) {
> +        goto exit;
> +    }
> +    if (outputStruct.result =3D=3D kSMCKeyNotFound) {
> +        ret =3D kIOReturnNotFound;
> +        goto exit;
> +    }
> +    if (outputStruct.result !=3D kSMCSuccess) {
> +        ret =3D kIOReturnInternalError;
> +        goto exit;
> +    }
> +
> +    memset(bytes, 0, *dataSize);
> +    if (*dataSize > inputStruct.keyInfo.dataSize) {
> +        *dataSize =3D inputStruct.keyInfo.dataSize;
> +    }
> +    memcpy(bytes, outputStruct.bytes, *dataSize);
> +
> +exit:
> +    return ret;
> +}
> +#endif
> +
> /* #define DEBUG_SMC */
>
> #define APPLESMC_DEFAULT_IOBASE        0x300
> @@ -332,7 +497,27 @@ static void applesmc_isa_realize(DeviceState *dev,
> Error **errp)
>                         s->iobase + APPLESMC_ERR_PORT);
>
>     if (!s->osk || (strlen(s->osk) !=3D 64)) {
> +#if defined(__APPLE__) && defined(__MACH__)
> +        IOReturn ret;
> +        IOByteCount size =3D 32;
> +
> +        ret =3D smc_read_key('OSK0', (uint8_t *) default_osk, &size);
> +        if (ret !=3D kIOReturnSuccess) {
> +            goto failure;
> +        }
> +
> +        ret =3D smc_read_key('OSK1', (uint8_t *) default_osk + size, &si=
ze);
> +        if (ret !=3D kIOReturnSuccess) {
> +            goto failure;
> +        }
> +
> +        warn_report("Using AppleSMC with host key");
> +        goto success;
> +#endif
> +failure:
>         warn_report("Using AppleSMC with invalid key");
> +
> +success:
>         s->osk =3D default_osk;
>     }
>
> --
> 2.30.1 (Apple Git-130)
>
>

--00000000000063c59205cdd62c08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologies for the late reply, I&#39;ve been rather busy=E2=
=80=A6<div><br></div><div>Generally, I think this is an awesome feature add=
ition. (I also agree with Paolo&#39;s modification.) A few additional conce=
rns though:<br><div><br></div><div><br></div><div>1. Licensing</div><div>Gi=
ven that the code it&#39;s heavily based on is copyright Apple Computer Inc=
., licensed under APSL, is it safe including it in qemu as is?</div><div>If=
 the integrated code is going to be quite so &quot;directly inspired&quot; =
(down to the inconsistent struct definition style and mixing unrelated cons=
tants in the same anonymous enum), perhaps at minimum place it in its own i=
solated source file with appropriate notice?<br></div><div><br></div><div><=
br></div><div>2. The actual code seems somewhat more verbose/generic than i=
t needs to be, from my point of view. For example:</div><div><br></div><div=
>- IOConnectCallMethod calls with kSMCUserClientOpen/kSMCUserClientClose se=
em unnecessarily verbose. Using IOConnectCallStructMethod or IOConnectCallS=
calarMethod would be a little more compact. Or you could leave them out ent=
irely, because the code still works if they&#39;re missing.</div><div>- The=
re&#39;s error handling for cases that can&#39;t ever happen in the code as=
 it stands, such as:=C2=A0 =C2=A0if (key =3D=3D 0 || bytes =3D=3D NULL) {</=
div><div>- There&#39;s distinct error handling for different kinds of failu=
re modes in the helper function, percolating IOReturn codes to the caller, =
but the way the helper function is called is effectively just a boolean suc=
cess/failure, so why bother with the complexity?</div><div>- The connection=
 to the AppleSMC service is closed and reopened between reading the OSK0 an=
d OSK1 keys. This isn&#39;t necessary. (The way the whole thing flows only =
really makes sense if you treat OSK0/OSK1 as 2 of many other 1-off keys, bu=
t I don&#39;t think the others are ever likely to be used in the same way i=
n qemu as they&#39;d constitute a VM escape.)=C2=A0</div><div><br></div><di=
v>I realise each of these aspects has essentially survived 1:1 from Apple&#=
39;s original code, which in my opinion would appear to make my first conce=
rn all the more worrying=E2=80=A6</div><div><br></div></div><div><br></div>=
<div>I&#39;m not a Qemu maintainer though, so I&#39;ll leave it to actual m=
aintainers to decide how much of a problem any of this is.</div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sat, 2 Oct 2021 at 22:24, Pedro To=CC=82rres &lt;<a href=3D"mailto:t=
0rr3sp3dr0@gmail.com">t0rr3sp3dr0@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">When running on a Mac, QEMU is a=
ble to get the host OSK and use it as<br>
the default value for the AppleSMC device. The OSK query operation<br>
doesn&#39;t require administrator privileges and can be executed by any use=
r<br>
on the system. This patch is based on open-source code from Apple, just<br>
like the implementation from VirtualBox.<br>
<br>
Apple:<br>
<a href=3D"https://opensource.apple.com/source/IOKitUser/IOKitUser-647.6.13=
/pwr_mgt.subproj/IOPMLibPrivate.c" rel=3D"noreferrer" target=3D"_blank">htt=
ps://opensource.apple.com/source/IOKitUser/IOKitUser-647.6.13/pwr_mgt.subpr=
oj/IOPMLibPrivate.c</a><br>
<a href=3D"https://opensource.apple.com/source/PowerManagement/PowerManagem=
ent-637.60.1/pmconfigd/PrivateLib.c" rel=3D"noreferrer" target=3D"_blank">h=
ttps://opensource.apple.com/source/PowerManagement/PowerManagement-637.60.1=
/pmconfigd/PrivateLib.c</a><br>
<br>
VirtualBox:<br>
<a href=3D"https://www.virtualbox.org/browser/vbox/trunk/src/VBox/Devices/E=
FI/DevSmc.cpp#L516" rel=3D"noreferrer" target=3D"_blank">https://www.virtua=
lbox.org/browser/vbox/trunk/src/VBox/Devices/EFI/DevSmc.cpp#L516</a><br>
<br>
Signed-off-by: Pedro To=CC=82rres &lt;<a href=3D"mailto:t0rr3sp3dr0@gmail.c=
om" target=3D"_blank">t0rr3sp3dr0@gmail.com</a>&gt;<br>
---<br>
hw/misc/applesmc.c | 185 +++++++++++++++++++++++++++++++++++++++++++++<br>
1 file changed, 185 insertions(+)<br>
<br>
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c<br>
index 1b9acaf..824135d 100644<br>
--- a/hw/misc/applesmc.c<br>
+++ b/hw/misc/applesmc.c<br>
@@ -38,6 +38,171 @@<br>
#include &quot;qemu/timer.h&quot;<br>
#include &quot;qom/object.h&quot;<br>
<br>
+#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
+#include &lt;IOKit/IOKitLib.h&gt;<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 kSMCSuccess=C2=A0 =C2=A0 =C2=A0=3D 0x00,<br>
+=C2=A0 =C2=A0 kSMCKeyNotFound =3D 0x84<br>
+};<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 kSMCUserClientOpen=C2=A0 =3D 0x00,<br>
+=C2=A0 =C2=A0 kSMCUserClientClose =3D 0x01,<br>
+=C2=A0 =C2=A0 kSMCHandleYPCEvent=C2=A0 =3D 0x02,<br>
+=C2=A0 =C2=A0 kSMCReadKey=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x05,<br>
+=C2=A0 =C2=A0 kSMCGetKeyInfo=C2=A0 =C2=A0 =C2=A0 =3D 0x09<br>
+};<br>
+<br>
+typedef struct SMCVersion {<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 major;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 minor;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 build;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 reserved;<br>
+=C2=A0 =C2=A0 uint16_t release;<br>
+} SMCVersion;<br>
+<br>
+typedef struct SMCPLimitData {<br>
+=C2=A0 =C2=A0 uint16_t version;<br>
+=C2=A0 =C2=A0 uint16_t length;<br>
+=C2=A0 =C2=A0 uint32_t cpuPLimit;<br>
+=C2=A0 =C2=A0 uint32_t gpuPLimit;<br>
+=C2=A0 =C2=A0 uint32_t memPLimit;<br>
+} SMCPLimitData;<br>
+<br>
+typedef struct SMCKeyInfoData {<br>
+=C2=A0 =C2=A0 IOByteCount dataSize;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 dataType;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0dataAttributes;<br>
+} SMCKeyInfoData;<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0key;<br>
+=C2=A0 =C2=A0 SMCVersion=C2=A0 =C2=A0 =C2=A0vers;<br>
+=C2=A0 =C2=A0 SMCPLimitData=C2=A0 pLimitData;<br>
+=C2=A0 =C2=A0 SMCKeyInfoData keyInfo;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 result;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 status;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 data8;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0data32;<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[32];<br>
+} SMCParamStruct;<br>
+<br>
+static IOReturn smc_call_struct_method(uint32_t selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SMCParamS=
truct *inputStruct,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SMCParamS=
truct *outputStruct)<br>
+{<br>
+=C2=A0 =C2=A0 IOReturn ret;<br>
+<br>
+=C2=A0 =C2=A0 size_t inputStructCnt =3D sizeof(SMCParamStruct);<br>
+=C2=A0 =C2=A0 size_t outputStructCnt =3D sizeof(SMCParamStruct);<br>
+<br>
+=C2=A0 =C2=A0 io_service_t smcService =3D IO_OBJECT_NULL;<br>
+=C2=A0 =C2=A0 io_connect_t smcConnect =3D IO_OBJECT_NULL;<br>
+<br>
+=C2=A0 =C2=A0 smcService =3D IOServiceGetMatchingService(kIOMasterPortDefa=
ult,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0IOServiceMatching(&quot;AppleSMC&quot;));<br>
+=C2=A0 =C2=A0 if (smcService =3D=3D IO_OBJECT_NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D kIOReturnNotFound;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D IOServiceOpen(smcService, mach_task_self(), 1, &amp;=
smcConnect);<br>
+=C2=A0 =C2=A0 if (ret !=3D kIOReturnSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 smcConnect =3D IO_OBJECT_NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (smcConnect =3D=3D IO_OBJECT_NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D kIOReturnError;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D IOConnectCallMethod(smcConnect, kSMCUserClientOpen,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, NULL, NULL);<br>
+=C2=A0 =C2=A0 if (ret !=3D kIOReturnSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D IOConnectCallStructMethod(smcConnect, selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inputStruct, inputStru=
ctCnt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outputStruct, &amp;out=
putStructCnt);<br>
+<br>
+exit:<br>
+=C2=A0 =C2=A0 if (smcConnect !=3D IO_OBJECT_NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IOConnectCallMethod(smcConnect, kSMCUserClient=
Close,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL, 0, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IOServiceClose(smcConnect);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static IOReturn smc_read_key(uint32_t key,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *bytes,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IOByteCount *dataSize)<br>
+{<br>
+=C2=A0 =C2=A0 IOReturn ret;<br>
+<br>
+=C2=A0 =C2=A0 SMCParamStruct inputStruct;<br>
+=C2=A0 =C2=A0 SMCParamStruct outputStruct;<br>
+<br>
+=C2=A0 =C2=A0 if (key =3D=3D 0 || bytes =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D kIOReturnCannotWire;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* determine key&#39;s data size */<br>
+=C2=A0 =C2=A0 memset(&amp;inputStruct, 0, sizeof(SMCParamStruct));<br>
+=C2=A0 =C2=A0 inputStruct.data8 =3D kSMCGetKeyInfo;<br>
+=C2=A0 =C2=A0 inputStruct.key =3D key;<br>
+<br>
+=C2=A0 =C2=A0 memset(&amp;outputStruct, 0, sizeof(SMCParamStruct));<br>
+=C2=A0 =C2=A0 ret =3D smc_call_struct_method(kSMCHandleYPCEvent, &amp;inpu=
tStruct, &amp;outputStruct);<br>
+=C2=A0 =C2=A0 if (ret !=3D kIOReturnSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (outputStruct.result =3D=3D kSMCKeyNotFound) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D kIOReturnNotFound;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (outputStruct.result !=3D kSMCSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D kIOReturnInternalError;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* get key value */<br>
+=C2=A0 =C2=A0 memset(&amp;inputStruct, 0, sizeof(SMCParamStruct));<br>
+=C2=A0 =C2=A0 inputStruct.data8 =3D kSMCReadKey;<br>
+=C2=A0 =C2=A0 inputStruct.key =3D key;<br>
+=C2=A0 =C2=A0 inputStruct.keyInfo.dataSize =3D outputStruct.keyInfo.dataSi=
ze;<br>
+<br>
+=C2=A0 =C2=A0 memset(&amp;outputStruct, 0, sizeof(SMCParamStruct));<br>
+=C2=A0 =C2=A0 ret =3D smc_call_struct_method(kSMCHandleYPCEvent, &amp;inpu=
tStruct, &amp;outputStruct);<br>
+=C2=A0 =C2=A0 if (ret !=3D kIOReturnSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (outputStruct.result =3D=3D kSMCKeyNotFound) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D kIOReturnNotFound;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (outputStruct.result !=3D kSMCSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D kIOReturnInternalError;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memset(bytes, 0, *dataSize);<br>
+=C2=A0 =C2=A0 if (*dataSize &gt; inputStruct.keyInfo.dataSize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *dataSize =3D inputStruct.keyInfo.dataSize;<br=
>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memcpy(bytes, outputStruct.bytes, *dataSize);<br>
+<br>
+exit:<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+#endif<br>
+<br>
/* #define DEBUG_SMC */<br>
<br>
#define APPLESMC_DEFAULT_IOBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x300<br>
@@ -332,7 +497,27 @@ static void applesmc_isa_realize(DeviceState *dev, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 s-&gt;iobase + APPLESMC_ERR_PORT);<br>
<br>
=C2=A0 =C2=A0 if (!s-&gt;osk || (strlen(s-&gt;osk) !=3D 64)) {<br>
+#if defined(__APPLE__) &amp;&amp; defined(__MACH__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IOReturn ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IOByteCount size =3D 32;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D smc_read_key(&#39;OSK0&#39;, (uint8_t =
*) default_osk, &amp;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D kIOReturnSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto failure;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D smc_read_key(&#39;OSK1&#39;, (uint8_t =
*) default_osk + size, &amp;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D kIOReturnSuccess) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto failure;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Using AppleSMC with host key=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
+#endif<br>
+failure:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Using AppleSMC with invalid k=
ey&quot;);<br>
+<br>
+success:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;osk =3D default_osk;<br>
=C2=A0 =C2=A0 }<br>
<br>
-- <br>
2.30.1 (Apple Git-130)<br>
<br>
</blockquote></div>

--00000000000063c59205cdd62c08--

