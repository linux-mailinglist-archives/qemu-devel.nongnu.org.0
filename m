Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491873A3009
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:02:41 +0200 (CEST)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrN8h-0002tO-N4
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrN5c-0000WT-7o
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:59:29 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrN5Y-0004Q8-7M
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:59:27 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id h15so11676807ybm.13
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fq0rk/oKuglsSSZoTA1CLXyHRH8LUFqhk0NVPD1/GIk=;
 b=AdbxEYCwX3brdxWK9sXuA+W+mrqIk4YHP22pXVrUFummdQBPM1gV+eF2to7XvvNM26
 smQN9FFg5/SabPSnGvJogr+UN3Ymh3u4ZsIoD4Z10LF9U19Zcs/GJknCgYDEoARW+T80
 lEQd22zkvbLgTPRNs7nb8K00hVNfJs4CItMa/GArkCR0j/JvDb5Q0t+V3/ZfKiOeZ9TD
 Mqjdz4nLIppve6WDuzW2jScFipGBib1CvvE90yEPficlVvQQwsrnWe9nWhh5wHUMb6wH
 CfCPCzQg9J2o+f1A6BGAx2g9bGuDNHCYYH75WzNSQnlnw3fwukDBU0PsrrbzmgevS3J7
 r8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fq0rk/oKuglsSSZoTA1CLXyHRH8LUFqhk0NVPD1/GIk=;
 b=tf9ixpca6yk7WSS6Yps0VD9J1RbxDl23fegkmKdsHqjrlguD9r43i9XcPlRCaywO/q
 /CrlcPs8D61xz1IL5F2779UuOYIV0IA3eIZ8ScqS4mGGAyCmem/z0FodWEmOjOLAvy7y
 7fxHiDId1qELYyLpLaHhy6CjEQq5IeAn2fu7DI129Qq2MOB+4e5TTGzqGfXFx33662Ym
 GFxrULjR5kjauOlSuokeQNh90wRQiw/P5qO+B4S6M0ha/1ZwJufoZZ8ef0W1ZxzJasLu
 cyaY1RxuzclhgHkwvmAPiGQbgpFZIl6W2pRQJBjDJkL5p+/aJax+qO3DyxlLpNJEeQiX
 qPIQ==
X-Gm-Message-State: AOAM531aEde7toUtAXviMEe7TzHwVJ+jU+zcGuPhzyzeR261UHOfqa6b
 aBDOvGtRrLNkXZs9or8cZqFRp2YMY/ayLyXkJBsc6g==
X-Google-Smtp-Source: ABdhPJwFgqZZZAdUJPNMO3UNxopzqVUZmC5tZjjDX2Rrg+s2sjNQBAOkEzNPFLNicOwdKzflI2rmWo1OYDRvA7NyOgg=
X-Received: by 2002:a25:b53:: with SMTP id 80mr5112999ybl.379.1623340763283;
 Thu, 10 Jun 2021 08:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210610143800.3293854-1-konstantin@daynix.com>
 <CAJ+F1C+WhQRd7W4ATJh=QeyRnYULipPFHr38MODwrLc6Gu73eQ@mail.gmail.com>
 <CAJ28CFROd2KPknSoT=P6NS2PzizsTi=K4tKx0dV5By=cqKUDJg@mail.gmail.com>
 <YMIuWtE9VjZDUQYz@redhat.com>
In-Reply-To: <YMIuWtE9VjZDUQYz@redhat.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 10 Jun 2021 18:59:12 +0300
Message-ID: <CAJ28CFS7btno-t-rpP_Q98uwWCAdDnX2os41RYjdickcgaWVBQ@mail.gmail.com>
Subject: Re: [PATCH] qga-win: Free GMatchInfo properly
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008b990005c46b7989"
Received-SPF: none client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2c.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008b990005c46b7989
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Daniel!

A new patch was sent.

Best wishes,
Kostiantyn Kostiuk


On Thu, Jun 10, 2021 at 6:23 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Thu, Jun 10, 2021 at 05:53:35PM +0300, Konstantin Kostiuk wrote:
> > Hi All,
> >
> > For freeing GMatchInfo struct, a special function is required. I'm not
> sure is
> > it possible to use g_autoptr in this case or no.
> > In GLib example
> >
> https://developer.gnome.org/glib/stable/glib-Perl-compatible-regular-expr=
essions.html#g-regex-match
> ,
> > g_match_info_free is used directly.
>
> That is fine - g_autoptr calls the required deallocation function
> that was previously registered. This is different from g_autofree
> which merely calls g_free.
>
> We can see GMatchInfo is configured to call g_match_info_free:
>
> $ grep GMatchIn /usr/include/glib-2.0/glib/*.h
> /usr/include/glib-2.0/glib/glib-autocleanups.h:G_DEFINE_AUTOPTR_CLEANUP_F=
UNC(GMatchInfo,
> g_match_info_unref)
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000008b990005c46b7989
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Daniel!<br><div><br></div><div>A new patch was sen=
t.<br></div><font color=3D"#888888"><br></font><div><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div>Best wishes,</div><div>Kostiantyn Kostiuk</div></div></div></div><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jun 10, 2021 at 6:23 PM Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jun 10, 2021 at =
05:53:35PM +0300, Konstantin Kostiuk wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; For freeing GMatchInfo struct, a special function is required. I&#39;m=
 not sure is<br>
&gt; it possible to use g_autoptr in this case or no.<br>
&gt; In GLib example<br>
&gt; <a href=3D"https://developer.gnome.org/glib/stable/glib-Perl-compatibl=
e-regular-expressions.html#g-regex-match" rel=3D"noreferrer" target=3D"_bla=
nk">https://developer.gnome.org/glib/stable/glib-Perl-compatible-regular-ex=
pressions.html#g-regex-match</a>,<br>
&gt; g_match_info_free is used directly.<br>
<br>
That is fine - g_autoptr calls the required deallocation function<br>
that was previously registered. This is different from g_autofree<br>
which merely calls g_free.<br>
<br>
We can see GMatchInfo is configured to call g_match_info_free:<br>
<br>
$ grep GMatchIn /usr/include/glib-2.0/glib/*.h<br>
/usr/include/glib-2.0/glib/glib-autocleanups.h:G_DEFINE_AUTOPTR_CLEANUP_FUN=
C(GMatchInfo, g_match_info_unref)<br>
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

--0000000000008b990005c46b7989--

