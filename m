Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC343D892A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:56:38 +0200 (CEST)
Received: from localhost ([::1]:60968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8eQf-00078K-C7
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m8eOV-0003zx-Ft
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:54:23 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m8eOT-0003TU-Hs
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:54:23 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id p145so1413978ybg.6
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DjeOczhcqL3Id3xhMhFWu9Z8BY4v7Kv0f6BFxK8VYy0=;
 b=VFgZl+UKBbwU3iYJDzQwkNeMda6dEsCBWRvYDxtyjbrgouKDclR8VeM2M1ELHfYNi4
 zd/M8fZ+/Hz3hZqoukKVlE5+Crjt1apyH4pIGQKYH461aOstM/e6JFBjC3c4ead1T//K
 0digmMMIaXHmSZEKOYFJQFrvjZU8f+WvQNzNRqBnx3bfCDzi63mTuDCUdQ+h1e7HWmFU
 lC4tS3mHlhkvSQNmRFxJO93NiPdMeqg3B1NZagZ+tuFB46LibvprTiuxMH81Y5of5OCI
 4oEdE5mSuFm3eOUcAxp/m17Vs3BvxJjWMAPhD4FtGfgnlyLG/PMUzMCz67+iCv1cI+WX
 dqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DjeOczhcqL3Id3xhMhFWu9Z8BY4v7Kv0f6BFxK8VYy0=;
 b=G+RLuIrVx8CKy5dCfOlmXpWt78TnqjTDMYYMMw7eXpzoZNB6f1Eonl/hL4W+DUjSxD
 w0ILEac1sLPE7gCpc3ygNawAH4wzPb7eBAmlJcAfbXz3Vl41aBkkp65lOQjOGKWs9Dnr
 tRSn6tAF5lK3orqOseD3ODWyA7ieg5kxMSjW+Wm31b/VJt+2BzUDUnxEhS9dIC02+ir0
 fvZ/k73kFyID60QbctWFWqzMTY3AjbKzWLkAJ8CzX1w4FHW2sICvLP1BFgAW7nxBgFX6
 dR8ajxOd9sFr1tCqSn/JPWcCDBtLkUhu3afyWSgJYUMUkB1iCKer76m8/AOO4FCec83e
 YxzA==
X-Gm-Message-State: AOAM5322gYsVwjzTMt57wozlcW4SzUGcxhjXYBtwXuSkoiw/+2cyX6kA
 abyeZOsXhU29CHUJ+lCJtAF1bKc4n+3Qn/WI0/QB2A==
X-Google-Smtp-Source: ABdhPJzxIVeK+L2e+onyoruFbk5PK1574ToAhK5uI3ldOjqqBWc10scrDjIH2jCqLpQpkmENVOjLw/AbjiJEiUPKQXA=
X-Received: by 2002:a25:8888:: with SMTP id d8mr31629782ybl.379.1627458860667; 
 Wed, 28 Jul 2021 00:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210610155811.3313927-1-konstantin@daynix.com>
 <YMI3gundDsLZq1lw@redhat.com>
 <CAJ28CFR0CBAsq4WokeW_OG8gG2UFGSL3H0UB-p2FgXxH3pjhbg@mail.gmail.com>
 <YMI6dP82HBpGM5Bj@redhat.com>
 <CAJ28CFQ6yMm6kCPMY5DckAg1__Qrk+Ar47FNXc5ON6QfvtDmgg@mail.gmail.com>
In-Reply-To: <CAJ28CFQ6yMm6kCPMY5DckAg1__Qrk+Ar47FNXc5ON6QfvtDmgg@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Wed, 28 Jul 2021 10:54:09 +0300
Message-ID: <CAJ28CFQFxZxsEcy_3zDK1aLRbX0F2ZaMux8KgcE0thLXzm6kkA@mail.gmail.com>
Subject: Re: [PATCH v2] qga-win: Free GMatchInfo properly
To: Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="00000000000046e8a705c82a4b20"
Received-SPF: none client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2b.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Developers <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000046e8a705c82a4b20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Wed, Jul 14, 2021 at 10:26 AM Konstantin Kostiuk <konstantin@daynix.com>
wrote:

> CC Michael Roth
>
> On Thu, Jun 10, 2021 at 7:14 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> wrote:
>
>> On Thu, Jun 10, 2021 at 07:08:36PM +0300, Konstantin Kostiuk wrote:
>> > On Thu, Jun 10, 2021 at 7:02 PM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com
>> >
>> > wrote:
>> >
>> > > On Thu, Jun 10, 2021 at 06:58:11PM +0300, Kostiantyn Kostiuk wrote:
>> > > > The g_regex_match function creates match_info even if it
>> > > > returns FALSE. So we should always call g_match_info_free.
>> > > > A better solution is using g_autoptr for match_info variable.
>> > > >
>> > > > Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
>> > > > ---
>> > > >  qga/commands-win32.c | 3 +--
>> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>> > > > index 300b87c859..785a5cc6b2 100644
>> > > > --- a/qga/commands-win32.c
>> > > > +++ b/qga/commands-win32.c
>> > > > @@ -2494,7 +2494,7 @@ GuestDeviceInfoList
>> *qmp_guest_get_devices(Error
>> > > **errp)
>> > > >              continue;
>> > > >          }
>> > > >          for (j =3D 0; hw_ids[j] !=3D NULL; j++) {
>> > > > -            GMatchInfo *match_info;
>> > > > +            g_autoptr(GMatchInfo) match_info;
>> > >
>> > > This should be initialized to NULL otherwise...
>> > >
>> > > >              GuestDeviceIdPCI *id;
>> > > >              if (!g_regex_match(device_pci_re, hw_ids[j], 0,
>> > > &match_info)) {
>> > > >                  continue;
>> > >
>> > > this continue will trigger freeing of unintialized memory
>> > >
>> >
>> > But we always call match_info, so match_info is always initialized.
>> > The g_regex_match function creates match_info even if it returns FALSE=
.
>>
>> Opps, yes, you are right.
>>
>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>
>>
>> Regards,
>> Daniel
>> --
>> |: https://berrange.com      -o-
>> https://www.flickr.com/photos/dberrange :|
>> |: https://libvirt.org         -o-
>> https://fstop138.berrange.com :|
>> |: https://entangle-photo.org    -o-
>> https://www.instagram.com/dberrange :|
>>
>>

--00000000000046e8a705c82a4b20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 10:26 AM Konstantin Kostiu=
k &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr">CC Michael Roth<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jun 10, 2021 at 7:14 PM Daniel P. Ber=
rang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">ber=
range@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, Jun 10, 2021 at 07:08:36PM +0300, Konstantin Kostiu=
k wrote:<br>
&gt; On Thu, Jun 10, 2021 at 7:02 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Jun 10, 2021 at 06:58:11PM +0300, Kostiantyn Kostiuk wrot=
e:<br>
&gt; &gt; &gt; The g_regex_match function creates match_info even if it<br>
&gt; &gt; &gt; returns FALSE. So we should always call g_match_info_free.<b=
r>
&gt; &gt; &gt; A better solution is using g_autoptr for match_info variable=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:kons=
tantin@daynix.com" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 qga/commands-win32.c | 3 +--<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
&gt; &gt; &gt; index 300b87c859..785a5cc6b2 100644<br>
&gt; &gt; &gt; --- a/qga/commands-win32.c<br>
&gt; &gt; &gt; +++ b/qga/commands-win32.c<br>
&gt; &gt; &gt; @@ -2494,7 +2494,7 @@ GuestDeviceInfoList *qmp_guest_get_dev=
ices(Error<br>
&gt; &gt; **errp)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; hw_ids[j] !=
=3D NULL; j++) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GMatchInfo *match=
_info;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autoptr(GMatchI=
nfo) match_info;<br>
&gt; &gt;<br>
&gt; &gt; This should be initialized to NULL otherwise...<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestDeviceI=
dPCI *id;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_regex=
_match(device_pci_re, hw_ids[j], 0,<br>
&gt; &gt; &amp;match_info)) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
&gt; &gt;<br>
&gt; &gt; this continue will trigger freeing of unintialized memory<br>
&gt; &gt;<br>
&gt; <br>
&gt; But we always call match_info, so match_info is always initialized.<br=
>
&gt; The g_regex_match function creates match_info even if it returns FALSE=
.<br>
<br>
Opps, yes, you are right.<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div>
</blockquote></div>

--00000000000046e8a705c82a4b20--

