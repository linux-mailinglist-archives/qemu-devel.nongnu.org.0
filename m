Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46994403AFD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:52:53 +0200 (CEST)
Received: from localhost ([::1]:39870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNy0S-00014N-Cz
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNxxF-0006v9-2U
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:49:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mNxxD-0005zV-Cv
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631108970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9xfmtNEMyrdcimaJb2bZVEbqyqTiGAsQJ7oBnzPJGmc=;
 b=eaqUWCpmVS66B59vfUbiiksdJjUsXJsB/EaPu/Yn/DvzeVy9LYF2R1w6RdMMw2JXVVo3o+
 6h509NqJKH7bMNwtJUDblMOAms3acsuHfyQ15j/8G4wpIGp6gRYFEqqxm6MhWT1rIqNH5N
 RhoVBPWtm3IBdm6xROdzpNNAFLWgQaU=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-INhMoGlWNtyPu14n2du6Rw-1; Wed, 08 Sep 2021 09:49:28 -0400
X-MC-Unique: INhMoGlWNtyPu14n2du6Rw-1
Received: by mail-pf1-f200.google.com with SMTP id
 a24-20020a62e218000000b003fdd5bdf6baso1450352pfi.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 06:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9xfmtNEMyrdcimaJb2bZVEbqyqTiGAsQJ7oBnzPJGmc=;
 b=ClCdNuRTCYXRFA7J+c1PX7pvprOmExnxnfQdOW9mjj9jk9tXMLpeRcTv+SZ10vMzK7
 iRiP4Cmz4LEs0kqkHuR9vkJyZCEWpx6YEnSy81V6wlwffsaMj7syExZqT0mcOV7RbZi9
 YDl+0plByCLrR4L0MgzJSZsJisxYhNB34vwnfpGeqG+Dnv+d2KdrgXuEZkagJh0Qojkz
 1FIAUu93zcBtyg3QaO5u4p8YMouogu0B82Ca3V+bz9cwYP9KQNxSozVYdg2J9taKTAUC
 /QYhWjS1H19bbF5WiyHpuOz739+coYt0v1cpaRSNs2QccccCIhZGZ2M5e4/syshSzAxs
 Owrw==
X-Gm-Message-State: AOAM5303jNZJ0qo4NvEAzDh/P/ODmyT+8OUZD9F4j86Yy2B/k2Vub1LV
 dyNmyb+uGCeiFl45ivUZnCFzimrpaIQdZ2Yt8h6wHPv4j+5c2dViC3irWeyRaa6qvHksWS03Og5
 cOu2c39PcGFdF7I+0f94K1N4m5Ek2/Tw=
X-Received: by 2002:a17:90a:6f01:: with SMTP id
 d1mr4319606pjk.36.1631108967832; 
 Wed, 08 Sep 2021 06:49:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB8VmsXmuvMKjBL/goftDYPy+dJNRvOddcAxSxEo6jzkzPeDmYI9+3i4oasF76s5F4U6M4r4P2tNiYJqjXpFw=
X-Received: by 2002:a17:90a:6f01:: with SMTP id
 d1mr4319576pjk.36.1631108967506; 
 Wed, 08 Sep 2021 06:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-5-marcandre.lureau@redhat.com>
 <87r1dzw9cc.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1dzw9cc.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Sep 2021 17:49:16 +0400
Message-ID: <CAMxuvaw-As3Lk5CS+g51L3YSsEO=r4sO+piFiPf2nS7ZTiV1nQ@mail.gmail.com>
Subject: Re: [RFC v3 04/32] glib-compat: add G_SIZEOF_MEMBER
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000993d9b05cb7c267d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, "P. Berrange,
 Daniel" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000993d9b05cb7c267d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 8, 2021 at 4:16 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The macro was introduced in 2.64. Let's redefine it, to allow its usage
> > with older versions and silence the deprecation warning.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/glib-compat.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/include/glib-compat.h b/include/glib-compat.h
> > index 9e95c888f5..e278e09d1d 100644
> > --- a/include/glib-compat.h
> > +++ b/include/glib-compat.h
> > @@ -110,4 +110,11 @@ qemu_g_test_slow(void)
> >
> >  #pragma GCC diagnostic pop
> >
> > +/* introduced in 2.64 */
> > +#ifdef G_SIZEOF_MEMBER
> > +#undef G_SIZEOF_MEMBER
> > +#endif
> > +
> > +#define G_SIZEOF_MEMBER(type, member) sizeof(((type *)0)->member)
> > +
> >  #endif
>
> What's wrong with
>
>    #if !GLIB_VERSION(2, 64, 0)
>    #define G_SIZEOF_MEMBER(type, member) sizeof(((type *)0)->member)
>    #endif
>
>
You would get "deprecation" warnings with glib >=3D 2.64.

--000000000000993d9b05cb7c267d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 8, 2021 at 4:16 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The macro was introduced in 2.64. Let&#39;s redefine it, to allow its =
usage<br>
&gt; with older versions and silence the deprecation warning.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/glib-compat.h | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;<br>
&gt; diff --git a/include/glib-compat.h b/include/glib-compat.h<br>
&gt; index 9e95c888f5..e278e09d1d 100644<br>
&gt; --- a/include/glib-compat.h<br>
&gt; +++ b/include/glib-compat.h<br>
&gt; @@ -110,4 +110,11 @@ qemu_g_test_slow(void)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #pragma GCC diagnostic pop<br>
&gt;=C2=A0 <br>
&gt; +/* introduced in 2.64 */<br>
&gt; +#ifdef G_SIZEOF_MEMBER<br>
&gt; +#undef G_SIZEOF_MEMBER<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#define G_SIZEOF_MEMBER(type, member) sizeof(((type *)0)-&gt;member)<=
br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
<br>
What&#39;s wrong with<br>
<br>
=C2=A0 =C2=A0#if !GLIB_VERSION(2, 64, 0)<br>
=C2=A0 =C2=A0#define G_SIZEOF_MEMBER(type, member) sizeof(((type *)0)-&gt;m=
ember)<br>
=C2=A0 =C2=A0#endif<br>
<br></blockquote><div><br></div><div>You would get &quot;deprecation&quot; =
warnings with glib &gt;=3D 2.64.</div><div><br></div></div></div>

--000000000000993d9b05cb7c267d--


