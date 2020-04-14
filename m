Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF11A89BA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 20:36:59 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOQQb-0005AL-LT
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 14:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mansourweb@gmail.com>) id 1jOQOb-0004B7-LO
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 14:34:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mansourweb@gmail.com>) id 1jOQOa-0000tj-4c
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 14:34:53 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:45972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mansourweb@gmail.com>)
 id 1jOQOZ-0000iX-Rn; Tue, 14 Apr 2020 14:34:52 -0400
Received: by mail-lf1-x133.google.com with SMTP id f8so539169lfe.12;
 Tue, 14 Apr 2020 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=akcFBqDpgpseprupEuVffBvAo4OaWunc9XDKF/6Io0Y=;
 b=mUvUyC4m2JBYAzsFs+An+T28AORoPWuBlH6atjgJ39vXfVxWryQ3GuZ5OdD2BT22vB
 TEpuLWJC9WlBCVtbS4dQG+5TcdWSAO2V2N8bvkF9Klaq89SRDLTGVsoTCZS+llbUly/Y
 NgrqWBPKx5BZ24uWBozfzGnopJR9bKciWzuC0568dEtH+9yg8VDrEJGYj20B5JaKCb90
 ynOgU/KWrD+LDd5SWHGXqlekAeGDJ4LKdNZ3B+W3gvn5EkVZt6f42/2dhsY+u0cjoZdw
 wIYEjpIwF4//uRnsSLcLc7nQ4sye1erv5nQ636U2e8qYN0jOCbwY2yZGnlGz/x/1xhiV
 EZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akcFBqDpgpseprupEuVffBvAo4OaWunc9XDKF/6Io0Y=;
 b=dVOicFSblKo4yJtQxlKPNxOsXyRLFWvV+74FZnEyCwm2TPmhB36Z+Uqf0aMogIG3sf
 Sv1nCDBPA0v6BZrridSHblHl49PoEKpQlPmQ7/grkmsy9KB5iNdz8u6QmpWmnmNTmmH9
 XotWZKYPBkTZx5DFnNmhCKSs4khoIt1UEUGDQa022/sQfQWAaLA8HEN8Kfusn5j3hs8B
 ucKhhIw1yPJLybZ/7kRoMzuhefc2FFOQCWz437pC8A/ndFcLLshHX4U6tmfY5ycJTv0H
 YaLjo1dzVcoiHxIO0mE8hRs8npie5A2SqNp9TjXnMQCsRIVCQJ8vY7Gev+7zyez4VmYC
 EdXw==
X-Gm-Message-State: AGi0PuaJU0PmOpYJxgOIcxJfzzkkzYg2aVpkvXVYk0wgyojBrVA29lAc
 aY6yhvuMTXPrXGSXoCyYD3ystTmSHb44UpZOw0w=
X-Google-Smtp-Source: APiQypICPqhHL/KOLtY2HGgs1W6AEQs+oN3iSLclbnHhKpjRmgd8fPqC26EFl4Cmu0VK3FjwjIZ5ks9aF8kfVtVsvLM=
X-Received: by 2002:a19:5f4e:: with SMTP id a14mr681051lfj.57.1586889289066;
 Tue, 14 Apr 2020 11:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200414133052.13712-1-philmd@redhat.com>
 <20200414133052.13712-11-philmd@redhat.com>
In-Reply-To: <20200414133052.13712-11-philmd@redhat.com>
From: Mansour Ahmadi <mansourweb@gmail.com>
Date: Tue, 14 Apr 2020 14:34:38 -0400
Message-ID: <CAGT9xrCSLPNgTgUD_QveEFVdW65PNG3vOB8_1xEoON04=da+_A@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 10/12] hw/block/pflash: Check return value of
 blk_pwrite()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005f6f1a05a3447475"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::133
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005f6f1a05a3447475
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for fixing the patch, Philippe!


On Tue, Apr 14, 2020 at 9:31 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> From: Mansour Ahmadi <mansourweb@gmail.com>
>
> When updating the PFLASH file contents, we should check for a
> possible failure of blk_pwrite(). Similar to commit 3a688294e.
>
> Signed-off-by: Mansour Ahmadi <mansourweb@gmail.com>
> Message-Id: <20200408003552.58095-1-mansourweb@gmail.com>
> [PMD: Add missing "qemu/error-report.h" include and TODO comment]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 8 +++++++-
>  hw/block/pflash_cfi02.c | 8 +++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 24f3bce7ef..be1954c5d8 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -42,6 +42,7 @@
>  #include "hw/qdev-properties.h"
>  #include "sysemu/block-backend.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "qemu/timer.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
> @@ -399,13 +400,18 @@ static void pflash_update(PFlashCFI01 *pfl, int
> offset,
>                            int size)
>  {
>      int offset_end;
> +    int ret;
>      if (pfl->blk) {
>          offset_end =3D offset + size;
>          /* widen to sector boundaries */
>          offset =3D QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
>          offset_end =3D QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
> -        blk_pwrite(pfl->blk, offset, pfl->storage + offset,
> +        ret =3D blk_pwrite(pfl->blk, offset, pfl->storage + offset,
>                     offset_end - offset, 0);
> +        if (ret < 0) {
> +            /* TODO set error bit in status */
> +            error_report("Could not update PFLASH: %s", strerror(-ret));
> +        }
>      }
>  }
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 12f18d401a..c6b6f2d082 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -37,6 +37,7 @@
>  #include "hw/block/flash.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/timer.h"
>  #include "sysemu/block-backend.h"
> @@ -393,13 +394,18 @@ static uint64_t pflash_read(void *opaque, hwaddr
> offset, unsigned int width)
>  static void pflash_update(PFlashCFI02 *pfl, int offset, int size)
>  {
>      int offset_end;
> +    int ret;
>      if (pfl->blk) {
>          offset_end =3D offset + size;
>          /* widen to sector boundaries */
>          offset =3D QEMU_ALIGN_DOWN(offset, BDRV_SECTOR_SIZE);
>          offset_end =3D QEMU_ALIGN_UP(offset_end, BDRV_SECTOR_SIZE);
> -        blk_pwrite(pfl->blk, offset, pfl->storage + offset,
> +        ret =3D blk_pwrite(pfl->blk, offset, pfl->storage + offset,
>                     offset_end - offset, 0);
> +        if (ret < 0) {
> +            /* TODO set error bit in status */
> +            error_report("Could not update PFLASH: %s", strerror(-ret));
> +        }
>      }
>  }
>
> --
> 2.21.1
>
>

--0000000000005f6f1a05a3447475
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:garamond=
,serif;font-size:large">Thank you for fixing the patch, Philippe!</div><br>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Apr 14, 2020 at 9:31 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"=
mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">From: Mansour Ahmadi &lt;<a href=
=3D"mailto:mansourweb@gmail.com" target=3D"_blank">mansourweb@gmail.com</a>=
&gt;<br>
<br>
When updating the PFLASH file contents, we should check for a<br>
possible failure of blk_pwrite(). Similar to commit 3a688294e.<br>
<br>
Signed-off-by: Mansour Ahmadi &lt;<a href=3D"mailto:mansourweb@gmail.com" t=
arget=3D"_blank">mansourweb@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20200408003552.58095-1-mansourweb@gmail.c=
om" target=3D"_blank">20200408003552.58095-1-mansourweb@gmail.com</a>&gt;<b=
r>
[PMD: Add missing &quot;qemu/error-report.h&quot; include and TODO comment]=
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/block/pflash_cfi01.c | 8 +++++++-<br>
=C2=A0hw/block/pflash_cfi02.c | 8 +++++++-<br>
=C2=A02 files changed, 14 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c<br>
index 24f3bce7ef..be1954c5d8 100644<br>
--- a/hw/block/pflash_cfi01.c<br>
+++ b/hw/block/pflash_cfi01.c<br>
@@ -42,6 +42,7 @@<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/bitops.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
@@ -399,13 +400,18 @@ static void pflash_update(PFlashCFI01 *pfl, int offse=
t,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int offset_end;<br>
+=C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0if (pfl-&gt;blk) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset_end =3D offset + size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* widen to sector boundaries */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D QEMU_ALIGN_DOWN(offset, BDRV_S=
ECTOR_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset_end =3D QEMU_ALIGN_UP(offset_end, =
BDRV_SECTOR_SIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_pwrite(pfl-&gt;blk, offset, pfl-&gt;storag=
e + offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D blk_pwrite(pfl-&gt;blk, offset, pfl-&g=
t;storage + offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offse=
t_end - offset, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO set error bit in status =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not upd=
ate PFLASH: %s&quot;, strerror(-ret));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c<br>
index 12f18d401a..c6b6f2d082 100644<br>
--- a/hw/block/pflash_cfi02.c<br>
+++ b/hw/block/pflash_cfi02.c<br>
@@ -37,6 +37,7 @@<br>
=C2=A0#include &quot;hw/block/flash.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/bitmap.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
@@ -393,13 +394,18 @@ static uint64_t pflash_read(void *opaque, hwaddr offs=
et, unsigned int width)<br>
=C2=A0static void pflash_update(PFlashCFI02 *pfl, int offset, int size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int offset_end;<br>
+=C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0if (pfl-&gt;blk) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset_end =3D offset + size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* widen to sector boundaries */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D QEMU_ALIGN_DOWN(offset, BDRV_S=
ECTOR_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset_end =3D QEMU_ALIGN_UP(offset_end, =
BDRV_SECTOR_SIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blk_pwrite(pfl-&gt;blk, offset, pfl-&gt;storag=
e + offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D blk_pwrite(pfl-&gt;blk, offset, pfl-&g=
t;storage + offset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offse=
t_end - offset, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TODO set error bit in status =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not upd=
ate PFLASH: %s&quot;, strerror(-ret));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-- <br>
2.21.1<br>
<br>
</blockquote></div>

--0000000000005f6f1a05a3447475--

