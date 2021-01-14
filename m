Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF742F5C44
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:18:37 +0100 (CET)
Received: from localhost ([::1]:39338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzxpy-0001Bk-AK
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kzxop-0000S7-Gm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 03:17:23 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:32816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kzxon-000265-NW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 03:17:23 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g21so4801412edy.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 00:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4TUurvJLKZaijuJMcjtx9fbREHvM7roY9n4QjVj5/Cs=;
 b=EYAu9Go4bYsvfHA07G1HnwnGCpzFn0ux/REX3KPgxgqfUD/8Qu8Pl2ylJDjHoGxrbo
 u15RHx2NwMiYfkDLJX3Fm4liCYncaMUpcwLd0oxL/0BwTtGCC1xS6dxigxOeYNbCx+zk
 9mGviZj1MF5iy6elX3KjPzsxOmwVBYWer5Cwhxrd2uqak2uiAh4xzKpg3+QzCPDKJseV
 lI/PqOscO1rf9g8ve5H9/j48xOC/OMN5c/u6uAtBOChJQxIky8PYWvJ2KQjn5fhVLA/O
 hMRYUpXDhpM9w9ttVVQhXSC3Sgg6y9jtu2hmu7ryN0ixKCbwnm1LAw+4N0yVD2neGr6v
 HaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4TUurvJLKZaijuJMcjtx9fbREHvM7roY9n4QjVj5/Cs=;
 b=U7EX7WLPS6GKvFCkQ1J1MO1aTjqFEOCYO3Rrxe+a2he08bOlgqZskB1gVZ22tUynRV
 h92yDR6yQsfycgHUg1/RuqpJQX0ctoQOP8rZIs2hBnTnRzh5sYn+QUnavo9GgDxLsKGO
 EiP7yMmFRIMbre9E+FDkyDqHsqbr9zifDPTg/ez8IPNBfn/12QEfWrAtPKRWX/jPkb2z
 ue185csKxzdfONHPCnzlgt2sppD6gb1+BJSkHQJi0g2Bo21JsTtpFFMT32JLFmlaqAHu
 WHISektPZaskDzGGIoC115+EhfEasNzpRKe2spVPdXnEtXdIP3jk9jr4TSqnGXxiQOXL
 FcQA==
X-Gm-Message-State: AOAM531821gQMQeS/aDOB8V51/LHJ8k4I2E4WvevVDkAhphlYF6o6sL2
 F3tXN50y17mif+/g4dRQdwhAXBs7Pf0Sd7vtnH8=
X-Google-Smtp-Source: ABdhPJwKrOTOCbDYOON0jLy7quQJS0xfGVpuWelaChc0mMO41OlVxVrsy17lcPyBXrCnQ47u4YLbz/EkHb200U5x5d4=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr3958036edc.164.1610612239364; 
 Thu, 14 Jan 2021 00:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-4-dbuono@linux.vnet.ibm.com>
 <4677dea1-bdd2-0095-e75c-2ca6d9be0cb9@redhat.com>
 <afff8e95-ac1f-552a-c8b3-ff008947bf98@linux.vnet.ibm.com>
In-Reply-To: <afff8e95-ac1f-552a-c8b3-ff008947bf98@linux.vnet.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 14 Jan 2021 12:17:07 +0400
Message-ID: <CAJ+F1CJ+v7v2QKqLfC1ZNL4Q2eTRcOJUy9RAqg4BNq8aFqE22A@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? v3 3/9] hw/usb: reorder fields in UASStatus
To: Daniele Buono <dbuono@linux.vnet.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000065f72e05b8d7e21b"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065f72e05b8d7e21b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Nov 19, 2020 at 8:19 PM Daniele Buono <dbuono@linux.vnet.ibm.com>
wrote:

> Hi Philippe,
>
> On 11/6/2020 9:28 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 11/5/20 11:18 PM, Daniele Buono wrote:
> >> The UASStatus data structure has a variable sized field inside of type
> uas_iu,
> >> that however is not placed at the end of the data structure.
> >>
> >> This placement triggers a warning with clang 11, and while not a bug
> right now,
> >> (the status is never a uas_iu_command, which is the variable-sized
> case),
> >> it could become one in the future.
> >
> > The problem is uas_iu_command::add_cdb, indeed.
> >
> >>
> >> ../qemu-base/hw/usb/dev-uas.c:157:31: error: field 'status' with
> variable sized type 'uas_iu' not at the end of a struct or class is a GNU
> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >
> > If possible remove the "../qemu-base/" as it does not provide
> > any useful information.
> >
> Sure, will do at the next cycle
> >>      uas_iu                    status;
> >>                                ^
> >> 1 error generated.
> >>
> >> Fix this by moving uas_iu at the end of the struct
> >
> > Your patch silents the warning, but the problem is the same.
> > It would be safer/cleaner to make 'status' a pointer on the heap IMO.
>
> I'm thinking of moving 'status' in a pointer with the following code
> changes:
>
> UASStatus is allocated in `usb_uas_alloc_status`, which currently does
> not take a type or size for the union field. I'm thinking of adding
> requested size for the status, like this:
>
> static UASStatus *usb_uas_alloc_status(UASDevice *uas, uint8_t id,
> uint16_t tag, size_t size);
>
> and the common call would be
> usb_uas_alloc_status([...],sizeof(uas_iu));
>
> Also we'd need a double free when the object is freed. Right now
> it's handled in the code when the object is not used anymore with a
> `g_free(st);`.
> I'd have to replace it with
> `g_free(st->status); g_free(st);`. Would you suggest doing it place
> or by adding a usb_uas_dealloc_status() function?
>
> ---
>
> However, I am confused by the use of that variable-lenght field.
> I'm looking at what seems the only place where a command is
> parsed, in `usb_uas_handle_data`.
>
> uas_iu iu;
> [...]
>      switch (p->ep->nr) {
>      case UAS_PIPE_ID_COMMAND:
>          length =3D MIN(sizeof(iu), p->iov.size);
>          usb_packet_copy(p, &iu, length);
>          [...]
>          break;
> [...]
>
> It would seem that the copy is limited to at most sizeof(uas_iu),
> so even if we had anything in add_cdb[], that wouldn't be copied
> here?
>
> Is this intended?
>
>
Any update on this patch?
thanks


--=20
Marc-Andr=C3=A9 Lureau

--00000000000065f72e05b8d7e21b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 19, 2020 at 8:19 PM Dan=
iele Buono &lt;<a href=3D"mailto:dbuono@linux.vnet.ibm.com">dbuono@linux.vn=
et.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Philippe,<br>
<br>
On 11/6/2020 9:28 AM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 11/5/20 11:18 PM, Daniele Buono wrote:<br>
&gt;&gt; The UASStatus data structure has a variable sized field inside of =
type uas_iu,<br>
&gt;&gt; that however is not placed at the end of the data structure.<br>
&gt;&gt;<br>
&gt;&gt; This placement triggers a warning with clang 11, and while not a b=
ug right now,<br>
&gt;&gt; (the status is never a uas_iu_command, which is the variable-sized=
 case),<br>
&gt;&gt; it could become one in the future.<br>
&gt; <br>
&gt; The problem is uas_iu_command::add_cdb, indeed.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; ../qemu-base/hw/usb/dev-uas.c:157:31: error: field &#39;status&#39=
; with variable sized type &#39;uas_iu&#39; not at the end of a struct or c=
lass is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]<br>
&gt; <br>
&gt; If possible remove the &quot;../qemu-base/&quot; as it does not provid=
e<br>
&gt; any useful information.<br>
&gt; <br>
Sure, will do at the next cycle<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 uas_iu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;&gt; 1 error generated.<br>
&gt;&gt;<br>
&gt;&gt; Fix this by moving uas_iu at the end of the struct<br>
&gt; <br>
&gt; Your patch silents the warning, but the problem is the same.<br>
&gt; It would be safer/cleaner to make &#39;status&#39; a pointer on the he=
ap IMO.<br>
<br>
I&#39;m thinking of moving &#39;status&#39; in a pointer with the following=
 code<br>
changes:<br>
<br>
UASStatus is allocated in `usb_uas_alloc_status`, which currently does<br>
not take a type or size for the union field. I&#39;m thinking of adding<br>
requested size for the status, like this:<br>
<br>
static UASStatus *usb_uas_alloc_status(UASDevice *uas, uint8_t id,<br>
uint16_t tag, size_t size);<br>
<br>
and the common call would be<br>
usb_uas_alloc_status([...],sizeof(uas_iu));<br>
<br>
Also we&#39;d need a double free when the object is freed. Right now<br>
it&#39;s handled in the code when the object is not used anymore with a<br>
`g_free(st);`.<br>
I&#39;d have to replace it with<br>
`g_free(st-&gt;status); g_free(st);`. Would you suggest doing it place<br>
or by adding a usb_uas_dealloc_status() function?<br>
<br>
---<br>
<br>
However, I am confused by the use of that variable-lenght field.<br>
I&#39;m looking at what seems the only place where a command is<br>
parsed, in `usb_uas_handle_data`.<br>
<br>
uas_iu iu;<br>
[...]<br>
=C2=A0 =C2=A0 =C2=A0switch (p-&gt;ep-&gt;nr) {<br>
=C2=A0 =C2=A0 =C2=A0case UAS_PIPE_ID_COMMAND:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0length =3D MIN(sizeof(iu), p-&gt;iov.size=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usb_packet_copy(p, &amp;iu, length);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[...]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
[...]<br>
<br>
It would seem that the copy is limited to at most sizeof(uas_iu),<br>
so even if we had anything in add_cdb[], that wouldn&#39;t be copied<br>
here?<br>
<br>
Is this intended?<br>
<br></blockquote><div><br></div><div>Any update on this patch?</div><div>th=
anks</div><div></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000065f72e05b8d7e21b--

