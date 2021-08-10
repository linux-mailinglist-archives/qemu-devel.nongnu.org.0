Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703233E5898
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 12:51:05 +0200 (CEST)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDPLb-0001a1-Vs
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 06:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mDPKH-0000uM-64
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 06:49:41 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:42519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mDPKF-00035e-5C
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 06:49:41 -0400
Received: by mail-yb1-xb35.google.com with SMTP id m193so35338100ybf.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWLujHPQ4/g8AmacMmRo/fv1bMVCXnahrQexLGlUv5E=;
 b=Un+Iz/dg2etQEMufYNthRMWpVPF/32uH/VEwGw8q8QxO5wxV/fG9TpMYaTJ9akfig0
 NYydon7EM0/vYYEZhLlDyZP2+KB6H9JeoilUx/+csiZ+I2b4YOSYVmQKdXJtvb5+HJ5a
 P1HFh5XJqf/a9bTQCvB51pHb3dLB0FyJ6+Pv4hvni8DoGMu9xaX7sV+XD7M7gmsi9drZ
 4gGYpY8aluerT0AJDd0tD5Kr2hD4tgLdGOqIG1bJ4UHCsXIKuBk+CUrs3B/cQj2uBoMS
 4CsenNkJMf2DQyKj21ah1jmUTtVSQY3Ez0UK0nYmoJC5cawkBxGCLaaGEl0xf+OXgDtt
 RjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWLujHPQ4/g8AmacMmRo/fv1bMVCXnahrQexLGlUv5E=;
 b=Tket2jRGK3GbvN4Q/nvVOn2Ovu13WylDOJdq0pSg7KMAQNHhSyi6nZSg9KM+T/oqlL
 sw77/XNcwTb4aJSCFZm7V/M352F7t9/E0YIL1OSd3nA6vgE6cnu7YHtmjXMNqb2byMHN
 SYyFDrDGMxFFpGERxEjxHVHodJNxUOilB56nLI/JHxBvaVo4/z9Ge3N2uflGUdhZwXkZ
 Xp+wdIUJoj0QGXTki+Bqi5MDFkyfZw8RmTVDs7cbGoD1gbMGehIVZMQeuoi+r3TL8UNP
 YMnHRHYwvG4UQh4dwpg09YLZuU5zRpD3zvuDW+sJmUroCgg1XSs8HrEVgQA52c8f7y4a
 MWNQ==
X-Gm-Message-State: AOAM532gixqxKXu6VoCdO0WnoRj94hmSN9rMwvfKIM6/gymwuWyfMzB6
 Y7H95UgZ4xpeHx6ygA18JtS2oUZW5qt1CWz657T0iA==
X-Google-Smtp-Source: ABdhPJz00rzCWwUolm1Zb9jJlo5IYb2ndwTLkAUrryOS0qRLb93sVtZfu30MqzziWEJuoHoRSwRLXV8zwyoRYmSuFbE=
X-Received: by 2002:a25:ae97:: with SMTP id b23mr28532522ybj.379.1628592577592; 
 Tue, 10 Aug 2021 03:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210809094839.52312-1-konstantin@daynix.com>
 <20210809094839.52312-3-konstantin@daynix.com>
 <007231ff-bc43-50c2-9bd9-1becfbdf2281@redhat.com>
In-Reply-To: <007231ff-bc43-50c2-9bd9-1becfbdf2281@redhat.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Tue, 10 Aug 2021 13:49:26 +0300
Message-ID: <CAJ28CFQ0fTHTFBOuUbdnTUCbuUcL86C2VBFJs4AHTg_3uqenUA@mail.gmail.com>
Subject: Re: [RFC 3/4] gqa-win: get_pci_info: Add g_autofree for few variables
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001251b905c932429b"
Received-SPF: none client-ip=2607:f8b0:4864:20::b35;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Developers <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001251b905c932429b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Mon, Aug 9, 2021 at 1:46 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Hi Kostiantyn,
>
> On 8/9/21 11:48 AM, Kostiantyn Kostiuk wrote:
> > Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
>
> I'm not sure what you are trying to do here, fix a memory leak?
>

Yes. This set of patches fix a memory leak. The leak occurs in the case
when a storage device does not have a PCI parent.


>
> > ---
> >  qga/commands-win32.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> > index 724ce76a0e..a8a601776d 100644
> > --- a/qga/commands-win32.c
> > +++ b/qga/commands-win32.c
> > @@ -539,9 +539,9 @@ static GuestPCIAddress *get_pci_info(int number,
> Error **errp)
> >      dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
> >      dev_iface_data.cbSize =3D sizeof(SP_DEVICE_INTERFACE_DATA);
> >      for (i =3D 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data);
> i++) {
> > -        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data =3D NU=
LL;
> > +        g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA
> pdev_iface_detail_data =3D NULL;
> >          STORAGE_DEVICE_NUMBER sdn;
> > -        char *parent_dev_id =3D NULL;
> > +        g_autofree char *parent_dev_id =3D NULL;
> >          HDEVINFO parent_dev_info;
> >          SP_DEVINFO_DATA parent_dev_info_data;
> >          DWORD j;
> >
>
> Anyhow this function is confuse.
>
> I think it would be easier to review by replacing the while()
> by 2 calls, as suggested in the documentation:
>
> https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-s=
etupdigetdeviceinterfacedetaila
>
>
Ok. I will refactor these patches.



> -- >8 --
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 7bac0c5d422..2188c5dd80d 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -539,7 +539,6 @@ static GuestPCIAddress *get_pci_info(int number,
> Error **errp)
>      dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);
>      dev_iface_data.cbSize =3D sizeof(SP_DEVICE_INTERFACE_DATA);
>      for (i =3D 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i+=
+) {
> -        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data =3D NULL=
;
>          STORAGE_DEVICE_NUMBER sdn;
>          char *parent_dev_id =3D NULL;
>          HDEVINFO parent_dev_info;
> @@ -551,25 +550,36 @@ static GuestPCIAddress *get_pci_info(int number,
> Error **errp)
>          if (SetupDiEnumDeviceInterfaces(dev_info, &dev_info_data,
>                                          &GUID_DEVINTERFACE_DISK, 0,
>                                          &dev_iface_data)) {
> -            while (!SetupDiGetDeviceInterfaceDetail(dev_info,
> &dev_iface_data,
> -
> pdev_iface_detail_data,
> -                                                    size, &size,
> -                                                    &dev_info_data)) {
> -                if (GetLastError() =3D=3D ERROR_INSUFFICIENT_BUFFER) {
> -                    pdev_iface_detail_data =3D g_malloc(size);
> -                    pdev_iface_detail_data->cbSize =3D
> -                        sizeof(*pdev_iface_detail_data);
> -                } else {
> -                    error_setg_win32(errp, GetLastError(),
> -                                     "failed to get device interfaces");
> -                    goto free_dev_info;
> -                }
> +            g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA
> +                       pdev_iface_detail_data =3D NULL;
> +
> +            /* Get the required buffer size. */
> +            if (!SetupDiGetDeviceInterfaceDetail(dev_info,
> &dev_iface_data,
> +                                                 NULL, 0, &size,
> +                                                 &dev_info_data)
> +                    && GetLastError() !=3D ERROR_INSUFFICIENT_BUFFER) {
> +                error_setg_win32(errp, GetLastError(),
> +                                 "failed to get device interfaces
> buffer size");
> +                goto free_dev_info;
> +            }
> +
> +            /* Allocate an appropriately sized buffer. */
> +            pdev_iface_detail_data =3D g_malloc(size);
> +            pdev_iface_detail_data->cbSize =3D
> sizeof(*pdev_iface_detail_data);
> +
> +            /* Get the interface details. */
> +            if (!SetupDiGetDeviceInterfaceDetail(dev_info,
> &dev_iface_data,
> +                                                 pdev_iface_detail_data,
> +                                                 size, &size,
> +                                                 &dev_info_data)) {
> +                error_setg_win32(errp, GetLastError(),
> +                                 "failed to get device interfaces");
> +                goto free_dev_info;
>              }
>
>              dev_file =3D CreateFile(pdev_iface_detail_data->DevicePath, =
0,
>                                    FILE_SHARE_READ, NULL, OPEN_EXISTING, =
0,
>                                    NULL);
> -            g_free(pdev_iface_detail_data);
>
>              if (!DeviceIoControl(dev_file,
> IOCTL_STORAGE_GET_DEVICE_NUMBER,
>                                   NULL, 0, &sdn, sizeof(sdn), &size,
> NULL)) {
> ---
>
>

--0000000000001251b905c932429b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Philippe,</div><div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Aug 9, 2021 at 1:46 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Kostiantyn,<br>
<br>
On 8/9/21 11:48 AM, Kostiantyn Kostiuk wrote:<br>
&gt; Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@day=
nix.com" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
<br>
I&#39;m not sure what you are trying to do here, fix a memory leak?<br></bl=
ockquote><div><br></div><div>Yes. This set of patches fix a memory leak. Th=
e leak occurs in the case when a storage device does not have a PCI parent.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; ---<br>
&gt;=C2=A0 qga/commands-win32.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
&gt; index 724ce76a0e..a8a601776d 100644<br>
&gt; --- a/qga/commands-win32.c<br>
&gt; +++ b/qga/commands-win32.c<br>
&gt; @@ -539,9 +539,9 @@ static GuestPCIAddress *get_pci_info(int number, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 dev_iface_data.cbSize =3D sizeof(SP_DEVICE_INTERFA=
CE_DATA);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; SetupDiEnumDeviceInfo(dev_info, i, &=
amp;dev_info_data); i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_ifa=
ce_detail_data =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree PSP_DEVICE_INTERFACE_DETAIL_DA=
TA pdev_iface_detail_data =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STORAGE_DEVICE_NUMBER sdn;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *parent_dev_id =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree char *parent_dev_id =3D NULL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HDEVINFO parent_dev_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SP_DEVINFO_DATA parent_dev_info_data=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DWORD j;<br>
&gt; <br>
<br>
Anyhow this function is confuse.<br>
<br>
I think it would be easier to review by replacing the while()<br>
by 2 calls, as suggested in the documentation:<br>
<a href=3D"https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-s=
etupapi-setupdigetdeviceinterfacedetaila" rel=3D"noreferrer" target=3D"_bla=
nk">https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi=
-setupdigetdeviceinterfacedetaila</a><br>
<br></blockquote><div><br></div><div>Ok. I will refactor these patches.<br>=
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
-- &gt;8 --<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 7bac0c5d422..2188c5dd80d 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -539,7 +539,6 @@ static GuestPCIAddress *get_pci_info(int number,<br>
Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0dev_info_data.cbSize =3D sizeof(SP_DEVINFO_DATA);<br>
=C2=A0 =C2=A0 =C2=A0dev_iface_data.cbSize =3D sizeof(SP_DEVICE_INTERFACE_DA=
TA);<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; SetupDiEnumDeviceInfo(dev_info, i, &amp;d=
ev_info_data); i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_de=
tail_data =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STORAGE_DEVICE_NUMBER sdn;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *parent_dev_id =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HDEVINFO parent_dev_info;<br>
@@ -551,25 +550,36 @@ static GuestPCIAddress *get_pci_info(int number,<br>
Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (SetupDiEnumDeviceInterfaces(dev_info,=
 &amp;dev_info_data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;GUID_DEVINTERFACE_DISK, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;dev_iface_data)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (!SetupDiGetDeviceInterfac=
eDetail(dev_info,<br>
&amp;dev_iface_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev_iface_detail_data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size, &amp;size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dev_info_data)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (GetLastError()=
 =3D=3D ERROR_INSUFFICIENT_BUFFER) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev=
_iface_detail_data =3D g_malloc(size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev=
_iface_detail_data-&gt;cbSize =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sizeof(*pdev_iface_detail_data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 erro=
r_setg_win32(errp, GetLastError(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to =
get device interfaces&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto=
 free_dev_info;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree PSP_DEVICE_INTERFACE_=
DETAIL_DATA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pdev_iface_detail_data =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get the required buffer size.=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!SetupDiGetDeviceInterfaceDe=
tail(dev_info, &amp;dev_iface_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, &amp;size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dev_info_data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;&amp; GetLastError() !=3D ERROR_INSUFFICIENT_BUFFER) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(e=
rrp, GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to get device int=
erfaces<br>
buffer size&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto free_dev_info=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Allocate an appropriately siz=
ed buffer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev_iface_detail_data =3D g_mal=
loc(size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdev_iface_detail_data-&gt;cbSiz=
e =3D<br>
sizeof(*pdev_iface_detail_data);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get the interface details. */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!SetupDiGetDeviceInterfaceDe=
tail(dev_info, &amp;dev_iface_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0pdev_iface_detail_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0size, &amp;size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dev_info_data)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_win32(e=
rrp, GetLastError(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to get device int=
erfaces&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto free_dev_info=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_file =3D CreateFile(pde=
v_iface_detail_data-&gt;DevicePath, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FILE_SHARE_READ, NULL, =
OPEN_EXISTING, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(pdev_iface_detail_data);<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!DeviceIoControl(dev_fi=
le, IOCTL_STORAGE_GET_DEVICE_NUMBER,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, &amp;sdn, sizeof(sdn=
), &amp;size,<br>
NULL)) {<br>
---<br>
<br>
</blockquote></div></div>

--0000000000001251b905c932429b--

