Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9B04CB7C0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 08:28:09 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPfse-0002wg-0o
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 02:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nPfrF-00025T-96
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:26:42 -0500
Received: from [2a00:1450:4864:20::435] (port=38771
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nPfrD-0007oA-Hn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:26:40 -0500
Received: by mail-wr1-x435.google.com with SMTP id t11so6334467wrm.5
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 23:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wnAgA4zRZyyazrCP4bB5cRK+SKTrQa2fAKEL6bnsEoA=;
 b=CYMRQjaJAyxLfOA7gshpFrxTxWVy52cLVzeAlfwqkTodWWbPpuw7n6yoCwsoMl5uTq
 CDjZuqQT2ADhCUPlZGB4vdMp8oQzT3UFNxhssWBv+Ah1DpJ93wvH9VDEmZJxWQiB4n12
 N8a6+sQiO1+QzrHKNWL8D7XwoWZM00RFpSsX2NNi3bCLccfOA+Qx1cugSL7lcg9i06rn
 4uN4vHHoHdBkhW+6s3ZOan8EMi8IWfvyXWbtoK5BRZbugryjcUWh5KhgXQModPdqKaPS
 OAG/aCCDWFoED5UKYtfDGhinx7QWE4JLUcoG/ix0Q2ypbm3w+JOo/va2pRXz2qSdRHa9
 JlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wnAgA4zRZyyazrCP4bB5cRK+SKTrQa2fAKEL6bnsEoA=;
 b=6NvBKXPuf2VYdWBL4oVcAlcptrPK5QM+HXvEP6H8YBk9NcAIT+3m0RNVBXrlB9WH9v
 BjgHWpqIsaHYzeodI/heXdUunyejCphf9pXqo4YqKNbYjaMlUyPMNc4XjvZN8WX8ddGQ
 LEcUj+p0mVCL6sUlrV9Ec4aJrbAbF+KP188uf9S5XUCxph5Ob2YhkTjwvqdLvWBRicjs
 /O1+SxRIvPKc5WRcYXMPzhRMHE9i6TXjznvErvDEERNbBc89XZNBgJ6ZAN+aSmKw1hp1
 Jsohj1wtloOXXPDM6/YZ2c80JGwNvmcnHASQe3GgviD1CiNDd4xYzjwHj+DT49/FTufH
 bEXA==
X-Gm-Message-State: AOAM533R4hw6PH6YZM4Jp3VitUcNgWksZCD9n0j4nLCoYpxs3wYieb85
 AOEL66PSQsP8F/mBEjvxHhqQkHpKSoqLK/IKUK0=
X-Google-Smtp-Source: ABdhPJxuBkmndkVh0DJiGy9mhApu1PVZv+T1h2H402reLI7z9e6UaJ5vOMojtGaERXu3hHgrDcDt+yHBjxe4HGKubvI=
X-Received: by 2002:a5d:4cd1:0:b0:1f0:24d5:7c37 with SMTP id
 c17-20020a5d4cd1000000b001f024d57c37mr5659076wrt.421.1646292397869; Wed, 02
 Mar 2022 23:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20220302105610.1304166-1-pizhenwei@bytedance.com>
In-Reply-To: <20220302105610.1304166-1-pizhenwei@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 3 Mar 2022 11:26:26 +0400
Message-ID: <CAJ+F1CJ5kvyPLWURyBh5oRP_gPxHBydY8=FYzHAdPZcFu8FDLg@mail.gmail.com>
Subject: Re: [RESEND] qga: Introduce NVMe disk bus type
To: zhenwei pi <pizhenwei@bytedance.com>
Content-Type: multipart/alternative; boundary="000000000000924d9705d94b5101"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000924d9705d94b5101
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 2, 2022 at 3:00 PM zhenwei pi <pizhenwei@bytedance.com> wrote:

> Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,
> a NVMe disk get exposed in guest side. Support NVMe disk bus type and
> implement posix version.
>
> Test PCI passthrough case:
> ~#virsh qemu-agent-command buster '{"execute":"guest-get-disks"}' | jq
>   ...
>     {
>       "name": "/dev/nvme0n1",
>       "dependencies": [],
>       "partition": false,
>       "address": {
>         "serial": "SAMSUNG MZQL23T8HCLS-00A07_S64HNE0N500076",
>         "bus-type": "nvme",
>         "bus": 0,
>         "unit": 0,
>         "pci-controller": {
>           "bus": 0,
>           "slot": 22,
>           "domain": 0,
>           "function": 0
>         },
>         "dev": "/dev/nvme0n1",
>         "target": 0
>       }
>   ...
>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  qga/commands-posix.c | 5 ++++-
>  qga/qapi-schema.json | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 75dbaab68e..4ec83bbfbc 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -889,7 +889,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const
> *syspath,
>          if (driver && (g_str_equal(driver, "ata_piix") ||
>                         g_str_equal(driver, "sym53c8xx") ||
>                         g_str_equal(driver, "virtio-pci") ||
> -                       g_str_equal(driver, "ahci"))) {
> +                       g_str_equal(driver, "ahci") ||
> +                       g_str_equal(driver, "nvme"))) {
>              break;
>          }
>
> @@ -984,6 +985,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const
> *syspath,
>              g_debug("no host for '%s' (driver '%s')", syspath, driver);
>              goto cleanup;
>          }
> +    } else if (strcmp(driver, "nvme") =3D=3D 0) {
> +        disk->bus_type =3D GUEST_DISK_BUS_TYPE_NVME;
>      } else {
>          g_debug("unknown driver '%s' (sysfs path '%s')", driver, syspath=
);
>          goto cleanup;
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 94e4aacdcc..1b5ea4c5f8 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -827,13 +827,14 @@
>  # @mmc: Win multimedia card (MMC) bus type
>  # @virtual: Win virtual bus type
>  # @file-backed-virtual: Win file-backed bus type
> +# @nvme: NVMe disks
>  #
>  # Since: 2.2; 'Unknown' and all entries below since 2.4
>

You have to update this comment.


>  ##
>  { 'enum': 'GuestDiskBusType',
>    'data': [ 'ide', 'fdc', 'scsi', 'virtio', 'xen', 'usb', 'uml', 'sata',
>              'sd', 'unknown', 'ieee1394', 'ssa', 'fibre', 'raid', 'iscsi'=
,
> -            'sas', 'mmc', 'virtual', 'file-backed-virtual' ] }
> +            'sas', 'mmc', 'virtual', 'file-backed-virtual', 'nvme' ] }
>
>
>
lgtm, otherwise.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000924d9705d94b5101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 2, 2022 at 3:00 PM zhen=
wei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com">pizhenwei@bytedance.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Assigning a NVMe disk by VFIO or emulating a NVMe controller by QEMU,<br>
a NVMe disk get exposed in guest side. Support NVMe disk bus type and<br>
implement posix version.<br>
<br>
Test PCI passthrough case:<br>
~#virsh qemu-agent-command buster &#39;{&quot;execute&quot;:&quot;guest-get=
-disks&quot;}&#39; | jq<br>
=C2=A0 ...<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;/dev/nvme0n1&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;dependencies&quot;: [],<br>
=C2=A0 =C2=A0 =C2=A0 &quot;partition&quot;: false,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;address&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;serial&quot;: &quot;SAMSUNG MZQL23T8HCLS-=
00A07_S64HNE0N500076&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bus-type&quot;: &quot;nvme&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bus&quot;: 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unit&quot;: 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pci-controller&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bus&quot;: 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;slot&quot;: 22,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;domain&quot;: 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;function&quot;: 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dev&quot;: &quot;/dev/nvme0n1&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;target&quot;: 0<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 ...<br>
<br>
Signed-off-by: zhenwei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com" ta=
rget=3D"_blank">pizhenwei@bytedance.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-posix.c | 5 ++++-<br>
=C2=A0qga/qapi-schema.json | 3 ++-<br>
=C2=A02 files changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 75dbaab68e..4ec83bbfbc 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -889,7 +889,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *=
syspath,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (driver &amp;&amp; (g_str_equal(driver=
, &quot;ata_piix&quot;) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_str_equal(driver, &quot;sym53c8xx&quot;) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_str_equal(driver, &quot;virtio-pci&quot;) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;ahci&quot;))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;ahci&quot;) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0g_str_equal(driver, &quot;nvme&quot;))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -984,6 +985,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *=
syspath,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;no host for &=
#39;%s&#39; (driver &#39;%s&#39;)&quot;, syspath, driver);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 } else if (strcmp(driver, &quot;nvme&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk-&gt;bus_type =3D GUEST_DISK_BUS_TYPE_NVME=
;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;unknown driver &#39;%s&#39;=
 (sysfs path &#39;%s&#39;)&quot;, driver, syspath);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>
index 94e4aacdcc..1b5ea4c5f8 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -827,13 +827,14 @@<br>
=C2=A0# @mmc: Win multimedia card (MMC) bus type<br>
=C2=A0# @virtual: Win virtual bus type<br>
=C2=A0# @file-backed-virtual: Win file-backed bus type<br>
+# @nvme: NVMe disks<br>
=C2=A0#<br>
=C2=A0# Since: 2.2; &#39;Unknown&#39; and all entries below since 2.4<br></=
blockquote><div><br></div><div>You have to update this comment.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;GuestDiskBusType&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: [ &#39;ide&#39;, &#39;fdc&#39;, &#39;scsi&#39;=
, &#39;virtio&#39;, &#39;xen&#39;, &#39;usb&#39;, &#39;uml&#39;, &#39;sata&=
#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sd&#39;, &#39;unknown&=
#39;, &#39;ieee1394&#39;, &#39;ssa&#39;, &#39;fibre&#39;, &#39;raid&#39;, &=
#39;iscsi&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;sas&#39;, &#39;mmc&#39;, &#=
39;virtual&#39;, &#39;file-backed-virtual&#39; ] }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;sas&#39;, &#39;mmc&#39;, &#=
39;virtual&#39;, &#39;file-backed-virtual&#39;, &#39;nvme&#39; ] }<br>
<br>
<br></blockquote><div><br></div><div>lgtm, otherwise.</div><br></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div=
></div>

--000000000000924d9705d94b5101--

