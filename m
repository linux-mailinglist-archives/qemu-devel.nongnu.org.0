Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A321E33A24C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 03:14:35 +0100 (CET)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLGH4-0006Qm-68
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 21:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLGFJ-0005wB-8q; Sat, 13 Mar 2021 21:12:45 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLGFG-0004zW-C2; Sat, 13 Mar 2021 21:12:44 -0500
Received: by mail-io1-xd29.google.com with SMTP id k2so29918591ioh.5;
 Sat, 13 Mar 2021 18:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+sHaJOa3bSv8wuweQ8uhsgK44MRV8GwcZ1+qBDuueB8=;
 b=ZYYE5ydUnUBJo0tDXspGMIbEXt6DRM9dR5oHvuzL/+LwMNC9uepHF8St6ipSV1y6CY
 O8RpvIfzMaG5nDL/ySGQsvqW06AlSqj3UCZBtimB+HGcxHyMYIfxiN/Gv4qrpiGDAG9J
 0LVb9zCBnHCAfinujZci9zg4mjrUK9Sq7Ai9JjG0IifL1kSe6+xZEBLU8DmWjVEXCvS4
 B3SuSqkvaVt9ZczCqPPHtL9Pi+4QbExSyYM3gZRvw5iBJ6p6SM/HJ5u59EKezGbtKP7p
 SSqas4AQJB+0y367dkuWn8zOiIZ6JwfLA3m7cbMNwvAZFsOCtjTMp4IxCHJZzbcAp+v+
 Aghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+sHaJOa3bSv8wuweQ8uhsgK44MRV8GwcZ1+qBDuueB8=;
 b=STix4RyZaVYH6s4uj6gUtUR3WI41sV3Vq9PxIaumzNtn5s3idvJMT0TczIaoXHDofz
 xsH+FGfoZwNuwougMy1zvI9Hx7wA0NSR2VsEcm848h9BcgV5gegdhI5QZQts72QcpzVF
 BrggWS7+XXMunxwdLJ+Nix622A/GzRyZa8kWl/85JU87b84EPSllVBtnp+HT69Hjcsww
 v5E43Xvz24hHD3EYaYZpC4e6r3Fj+LUpdFUUqOq/x3WjuLkykhZgAWWYcSt7vQugAhsI
 Hlb1c8UZP1/vSJf++koZt6GiQEd1n6DqP3gC6ywQ6BKmbstACt9vXCiUHQAbaNLAu54H
 zjLg==
X-Gm-Message-State: AOAM532JQowR/GI1hiA8fkr3At8PISLuOPfBEUx9THVu4GUT9wRwP0A2
 iye36JpUDRc8ZE0ztey6KLQ7lGymsGgmoY+blpA=
X-Google-Smtp-Source: ABdhPJzQrVPHUXF4NT31GM9CoGFpal+Jm24WvyA2keYszqAIssfBg9lub+lCpggZl9L5zKmSH+FhWyzNPiZwe6afFkc=
X-Received: by 2002:a05:6638:102f:: with SMTP id
 n15mr4972941jan.28.1615687960351; 
 Sat, 13 Mar 2021 18:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
 <20210313163653.37089-5-ma.mandourr@gmail.com>
 <04476a7d-5c6f-3f17-834c-cc0cebfc5c18@de.ibm.com>
In-Reply-To: <04476a7d-5c6f-3f17-834c-cc0cebfc5c18@de.ibm.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Sun, 14 Mar 2021 04:12:29 +0200
Message-ID: <CAD-LL6hv-R8v_u==5LRaWuje9geJ4ZtEv97jp3VymD_9XpPwXg@mail.gmail.com>
Subject: Re: [PATCH 4/9] pc-bios/s390-ccw/netmain.c: Changed a malloc/free to
 GLib's variants
To: Christian Borntraeger <borntraeger@de.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000f1d54305bd75aa73"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:S390-ccw boot" <qemu-s390x@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f1d54305bd75aa73
Content-Type: text/plain; charset="UTF-8"

>
> Nack.
>
> This is BIOS code and it does not have glib.
>

Thank you so much for the helping notice. This did not cause
build problems nor was mentioned in the bite-sized tasks
page as a place to not change. In any case, there are some
more problems with this series so I was going to resend it (after
amending those problems). Therefore I'm going to exclude this commit.

On Sat, Mar 13, 2021 at 8:50 PM Christian Borntraeger <
borntraeger@de.ibm.com> wrote:

> On 13.03.21 17:36, Mahmoud Mandour wrote:
> > Changed a call to malloc() and its respective calls free() with
> > GLib's allocation and deallocation functions.
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>
> Nack.
>
> This is BIOS code and it does not have glib.
>
>
> > ---
> >   pc-bios/s390-ccw/netmain.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/pc-bios/s390-ccw/netmain.c b/pc-bios/s390-ccw/netmain.c
> > index 056e93a818..7f78150144 100644
> > --- a/pc-bios/s390-ccw/netmain.c
> > +++ b/pc-bios/s390-ccw/netmain.c
> > @@ -243,7 +243,7 @@ static const char *get_uuid(void)
> >       int i, cc, chk = 0;
> >       static char uuid_str[37];
> >
> > -    mem = malloc(2 * PAGE_SIZE);
> > +    mem = g_try_malloc(2 * PAGE_SIZE);
> >       if (!mem) {
> >           puts("Out of memory ... can not get UUID.");
> >           return NULL;
> > @@ -261,7 +261,7 @@ static const char *get_uuid(void)
> >                    : "d" (r0), "d" (r1), [addr] "a" (buf)
> >                    : "cc", "memory");
> >       if (cc) {
> > -        free(mem);
> > +        g_free(mem);
> >           return NULL;
> >       }
> >
> > @@ -269,7 +269,7 @@ static const char *get_uuid(void)
> >           uuid[i] = buf[STSI322_VMDB_UUID_OFFSET + i];
> >           chk |= uuid[i];
> >       }
> > -    free(mem);
> > +    g_free(mem);
> >       if (!chk) {
> >           return NULL;
> >       }
> >
>

--000000000000f1d54305bd75aa73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Nack.<br><br>This is BIOS code and it does not have glib.<br></b=
lockquote><div><br></div><div>Thank you so much for the=C2=A0helping notice=
. This did not cause</div><div>build problems nor was mentioned in the bite=
-sized tasks</div><div>page as a place to not change. In any case, there ar=
e some=C2=A0</div><div>more problems with this series so I was going to res=
end it (after</div><div>amending those problems). Therefore I&#39;m going t=
o exclude this commit.</div></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 13, 2021 at 8:50 PM Christian=
 Borntraeger &lt;<a href=3D"mailto:borntraeger@de.ibm.com">borntraeger@de.i=
bm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 13.03.21 17:36, Mahmoud Mandour wrote:<br>
&gt; Changed a call to malloc() and its respective calls free() with<br>
&gt; GLib&#39;s allocation and deallocation functions.<br>
&gt; <br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
<br>
Nack.<br>
<br>
This is BIOS code and it does not have glib.<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0pc-bios/s390-ccw/netmain.c | 6 +++---<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/pc-bios/s390-ccw/netmain.c b/pc-bios/s390-ccw/netmain.c<b=
r>
&gt; index 056e93a818..7f78150144 100644<br>
&gt; --- a/pc-bios/s390-ccw/netmain.c<br>
&gt; +++ b/pc-bios/s390-ccw/netmain.c<br>
&gt; @@ -243,7 +243,7 @@ static const char *get_uuid(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, cc, chk =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0static char uuid_str[37];<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 mem =3D malloc(2 * PAGE_SIZE);<br>
&gt; +=C2=A0 =C2=A0 mem =3D g_try_malloc(2 * PAGE_SIZE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mem) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0puts(&quot;Out of memory ... c=
an not get UUID.&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; @@ -261,7 +261,7 @@ static const char *get_uuid(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=
 &quot;d&quot; (r0), &quot;d&quot; (r1), [addr] &quot;a&quot; (buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=
 &quot;cc&quot;, &quot;memory&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cc) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(mem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(mem);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -269,7 +269,7 @@ static const char *get_uuid(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uuid[i] =3D buf[STSI322_VMDB_U=
UID_OFFSET + i];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chk |=3D uuid[i];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 free(mem);<br>
&gt; +=C2=A0 =C2=A0 g_free(mem);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chk) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
</blockquote></div>

--000000000000f1d54305bd75aa73--

