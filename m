Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3F49FBD9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:37:13 +0100 (CET)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSNE-0003G5-6K
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:37:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDRSw-0004Og-1G
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:39:02 -0500
Received: from [2a00:1450:4864:20::12e] (port=47048
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDRSu-000497-9m
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:39:01 -0500
Received: by mail-lf1-x12e.google.com with SMTP id z19so11759462lfq.13
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 05:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXZ85EWybzHi8SnqXykeRpdDzKkOKcLnjP6n8qTlHuw=;
 b=Yyu2ujqcM7YYzRFrTU2II5kDf5z3bISn4aTjXzC/R45D+b4o73qjM61ZOV5j3/BvOG
 1CnvME+e946b/ZZLkjCjvB/XLZlIyB4k4XCA6ngWmyGCZf1cO46+NRPMyxCRrzgoRXlm
 gmWuO3IugiwZgIfSr95mnMjY2OyiEGyZUeeoHejLta4AKElSpmNa0OC3aDjNc+r1BNo2
 cTcEQvy1Tn2ZDYdW3jKiccOBcu0PXS1tlVzrXz57PPZAUyblCRVLJ/K6raY5WUbATs8U
 K28coQGCr5J37/dx9CDJr3RyX+GXNScMSVppb2WeNBQrs+Ga5MckNyhM3JUfy4P1aeMH
 nv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXZ85EWybzHi8SnqXykeRpdDzKkOKcLnjP6n8qTlHuw=;
 b=KBNy3SUcf9Q8i36s1D7WGixaBUwuMd80cigDi1y7uGLtoXltrNTcmOOymSEvhBnIBe
 MGLHz8FMlOf9rlZDpak5cL0qjDZb5m85FW8rVbbUhDKEUUkyUHk5ZvWbpuPXuONBlfa2
 VGzQdKHDYXm0lX0vIXNh7Fz7kRTyjM8ixU/u1uRGO0DDmruHlikQcxtXcCGY+vKTZ1pe
 1uEEDHTobyp8826OzqF7A1UtDX+nr2lM6Fn3S8/RPI8f74NELWJKQjJ8f7cEsfEnIEwY
 bFeisQKmPd/1YMIZ1Oe9A8o63T3iPXiZL7G55zIrtTEqBkgW28HZ46BS+xfTsqUiRulB
 IfMg==
X-Gm-Message-State: AOAM5302Veu5kUnfzkdNOfJT870YANi5pgWQ4PFRLEccNcbcrF0kgfLT
 biHP/hNQ8XpzwBXcthBxsxHOZAvtPer9b/CF9AY=
X-Google-Smtp-Source: ABdhPJy9Vkzpyz9CLniCu19C5xRxDK/lfosNDqXQD/+aUe0ENfg+PYbyIRJfhJs0WR6fuMLly3Y6VQv5Yiw+Gs3Z3Vk=
X-Received: by 2002:a19:5f58:: with SMTP id a24mr6017282lfj.46.1643377137317; 
 Fri, 28 Jan 2022 05:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20220128005611.87185-1-wwcohen@gmail.com>
 <20220128005611.87185-12-wwcohen@gmail.com>
 <94e2290b-e31b-15d0-4f44-3c33ffbbfcf1@redhat.com>
In-Reply-To: <94e2290b-e31b-15d0-4f44-3c33ffbbfcf1@redhat.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Fri, 28 Jan 2022 08:38:43 -0500
Message-ID: <CAB26zV3ej+Bp1M0czmFPTgisdFKKwkOQwQfm+TorUtqyPAjsCw@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] 9p: darwin: adjust assumption on virtio-9p-test
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000807e8905d6a48e5a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000807e8905d6a48e5a
Content-Type: text/plain; charset="UTF-8"

Apologies! The explanation (and what I'll include in v4) is below:

The previous test depended on the assumption that P9_DOTL_AT_REMOVEDIR and
AT_REMOVEDIR have the same value.

While this is true on Linux, it is not true everywhere, and leads to an
incorrect test failure on unlink_at, noticed when adding 9p to darwin.

On Fri, Jan 28, 2022 at 2:04 AM Thomas Huth <thuth@redhat.com> wrote:

>
> -EMISSINGPATCHDESCRIPTION
>
> Please avoid sending patches without patch description. E.g. explain here
> *why* this needs to be adjusted.
>
>   Thanks,
>    Thomas
>
>
> On 28/01/2022 01.56, Will Cohen wrote:
> > Signed-off-by: Fabian Franz <github@fabian-franz.de>
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >   tests/qtest/virtio-9p-test.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index 41fed41de1..6bcf89f0f8 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -1270,7 +1270,7 @@ static void fs_unlinkat_dir(void *obj, void *data,
> QGuestAllocator *t_alloc)
> >       /* ... and is actually a directory */
> >       g_assert((st.st_mode & S_IFMT) == S_IFDIR);
> >
> > -    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
> > +    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
> >       /* directory should be gone now */
> >       g_assert(stat(new_dir, &st) != 0);
> >
>
>

--000000000000807e8905d6a48e5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologies! The explanation (and what I&#39;ll include in v=
4) is below:<br><br><div>The previous test depended on the assumption that =
P9_DOTL_AT_REMOVEDIR and AT_REMOVEDIR have the same value. <br></div><div><=
br></div><div>While this is true on Linux, it is not true everywhere, and l=
eads to an incorrect test failure on unlink_at, noticed when adding 9p to d=
arwin.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jan 28, 2022 at 2:04 AM Thomas Huth &lt;<a href=3D"=
mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
-EMISSINGPATCHDESCRIPTION<br>
<br>
Please avoid sending patches without patch description. E.g. explain here <=
br>
*why* this needs to be adjusted.<br>
<br>
=C2=A0 Thanks,<br>
=C2=A0 =C2=A0Thomas<br>
<br>
<br>
On 28/01/2022 01.56, Will Cohen wrote:<br>
&gt; Signed-off-by: Fabian Franz &lt;<a href=3D"mailto:github@fabian-franz.=
de" target=3D"_blank">github@fabian-franz.de</a>&gt;<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qtest/virtio-9p-test.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test=
.c<br>
&gt; index 41fed41de1..6bcf89f0f8 100644<br>
&gt; --- a/tests/qtest/virtio-9p-test.c<br>
&gt; +++ b/tests/qtest/virtio-9p-test.c<br>
&gt; @@ -1270,7 +1270,7 @@ static void fs_unlinkat_dir(void *obj, void *dat=
a, QGuestAllocator *t_alloc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ... and is actually a directory */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert((st.st_mode &amp; S_IFMT) =3D=3D S_=
IFDIR);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 do_unlinkat(v9p, &quot;/&quot;, &quot;02&quot;, AT_REMO=
VEDIR);<br>
&gt; +=C2=A0 =C2=A0 do_unlinkat(v9p, &quot;/&quot;, &quot;02&quot;, P9_DOTL=
_AT_REMOVEDIR);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* directory should be gone now */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert(stat(new_dir, &amp;st) !=3D 0);<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div>

--000000000000807e8905d6a48e5a--

