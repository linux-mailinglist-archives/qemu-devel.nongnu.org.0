Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD634042B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:06:58 +0100 (CET)
Received: from localhost ([::1]:40440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqUS-0003q5-VD
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMqS5-0002tm-Oo
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:04:31 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMqS2-0008Jg-AL
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:04:29 -0400
Received: by mail-qt1-x82a.google.com with SMTP id u7so3677184qtq.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9bSSX8NczwPFTWjnpK+B3GTyYilsaY1d1Sii6iLs9qI=;
 b=j/UnQNrj4u6UA+5E6LO+g3CYrx1dgHCsO85qqGeemeC+/STesSCrYKcTfDe2HJcNHq
 OAQSbWa3G5zes9qSsRiwttVmJsQO+kBXLBMoOcXa32wn069gSdbRmkJK4+OVBtSe7N7R
 0R1v33fLrI7NdlUDOxvUrDXNZh0SI2wz2s3X2tSUEdkV54f/S19k8nG5FUoAXaQibIin
 HDmXhUD8v0s4zwWOzJ5sQ8GQwBQL9MDtps6WyXAbF6l+kpGASMXWcLM74s/a/UXgclte
 LxvcVes2nB3DEYn1BosT2pfhNVbj2UrHmVPYPFyAdC9kD2N6udtYIkDYTTHHRbAdlKfV
 FVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9bSSX8NczwPFTWjnpK+B3GTyYilsaY1d1Sii6iLs9qI=;
 b=V3cI83frkq9r/V3WnqUa372Vor7cgXRmFI7IF2X5matIlLeQ9IJIJw9EJadMAhokA3
 Eh80ZpFR9TKjTiERWU2uybgMkZ84pYo3+XU6fn5qYRhRQ5jVTA+L+lyy9xKaDVjwGF9W
 dj+286HrKOEzCLnkwBTHk07v+KzCj31bHtjcfjfC5+1HT1CkO2WVPs67YTlKnBLY4hmQ
 ZSdzSYdWsI42AJeGn1mXuEIvi4EN6QBSR51938o9xM/1fPUdAzIy98eg4AXjXm3Bq6M/
 gtGo4MlU/tFXUrS200fqbylzqHjJuX+AveNR+wScd03gTxmKGUx0AXKFpetAvIKaAUNX
 /d+w==
X-Gm-Message-State: AOAM533i6yMgHtI/jmriRIjNpfi5pYeos54h1Cy/3326xKOJtQpfqm4Y
 75icXFXMyylJl7wmbfLiztP6PzsU1pIiLCrc/sY=
X-Google-Smtp-Source: ABdhPJyBPJ8cqy5LdY55BNIj/mAq397CBn/AO6YltlK7JO+4ObVrtqibS2IkZmtbtWtVUmdQb9sSjX7guSxSKpph1HE=
X-Received: by 2002:ac8:734c:: with SMTP id q12mr3215564qtp.160.1616065461502; 
 Thu, 18 Mar 2021 04:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
 <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
 <YFMqmDmwDZwRQviM@work-vm>
 <CAFEAcA825k8uttjmJuwNM=rDa-m7nOWJZEAQzP9Zz3e7yyS9Aw@mail.gmail.com>
 <YFMvO/79vcSFOEix@work-vm>
In-Reply-To: <YFMvO/79vcSFOEix@work-vm>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Thu, 18 Mar 2021 13:03:45 +0200
Message-ID: <CAK4993jx4zcuUTW--Qq-YLwqv-y3YxNZ0QU=KT0HVr09TpPLNg@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c4482605bdcd8f9e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=mrolnik@gmail.com; helo=mail-qt1-x82a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c4482605bdcd8f9e
Content-Type: text/plain; charset="UTF-8"

how do I test my fix? Is there a procedure?

Thanks,
Michael Rolnik

On Thu, Mar 18, 2021 at 12:45 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Thu, 18 Mar 2021 at 10:25, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > > Oh yes, just:
> > >
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index 52537f14ac..a7269955b5 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -81,6 +81,8 @@
> > >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > >
> > > +#define RAM_SAVE_FLAG__MAX RAM_SAVE_FLAG_COMPRESS_PAGE
> > > +
> > >  static inline bool is_zero_range(uint8_t *p, uint64_t size)
> > >  {
> > >      return buffer_is_zero(p, size);
> > > @@ -4090,5 +4092,6 @@ static SaveVMHandlers savevm_ram_handlers = {
> > >  void ram_mig_init(void)
> > >  {
> > >      qemu_mutex_init(&XBZRLE.lock);
> > > +    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >= (1 <<
> TARGET_PAGE_BITS_MIN));
> > >      register_savevm_live("ram", 0, 4, &savevm_ram_handlers,
> &ram_state);
> > >  }
> > >
> > >
> > > works; lets keep that in mind somewhere after Michael fixes AVR.
> >
> > You don't have a great deal of headroom even after getting AVR
> > to change, by the way -- TARGET_PAGE_BITS_MIN for Arm is 10.
> > So you might want to think about ways to eg reclaim usage of
> > that "obsolete, not used" RAM_SAVE_FLAG_FULL bit.
>
> Yep, I've been warning anyone who adds one for ages
>
> > Also, what does the
> >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > comment refer to? migration.h has no instances of "RAM_SAVE"
> > or 0x80 or 1 << 7...
>
> It looks like it got moved to qemu-file.h a few years ago
> as RAM_SAVE_FLAG_HOOK.
>
> Dave
>
> > thanks
> > -- PMM
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000c4482605bdcd8f9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">how do I test my fix? Is there a procedure?<div><br></div>=
<div>Thanks,</div><div>Michael Rolnik</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 18, 2021 at 12:45 PM=
 Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">* Peter Maydell (<a href=3D"mailto:peter.maydell@linaro.org" tar=
get=3D"_blank">peter.maydell@linaro.org</a>) wrote:<br>
&gt; On Thu, 18 Mar 2021 at 10:25, Dr. David Alan Gilbert<br>
&gt; &lt;<a href=3D"mailto:dgilbert@redhat.com" target=3D"_blank">dgilbert@=
redhat.com</a>&gt; wrote:<br>
&gt; &gt; Oh yes, just:<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/migration/ram.c b/migration/ram.c<br>
&gt; &gt; index 52537f14ac..a7269955b5 100644<br>
&gt; &gt; --- a/migration/ram.c<br>
&gt; &gt; +++ b/migration/ram.c<br>
&gt; &gt; @@ -81,6 +81,8 @@<br>
&gt; &gt;=C2=A0 /* 0x80 is reserved in migration.h start with 0x100 next */=
<br>
&gt; &gt;=C2=A0 #define RAM_SAVE_FLAG_COMPRESS_PAGE=C2=A0 =C2=A0 0x100<br>
&gt; &gt;<br>
&gt; &gt; +#define RAM_SAVE_FLAG__MAX RAM_SAVE_FLAG_COMPRESS_PAGE<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 static inline bool is_zero_range(uint8_t *p, uint64_t size)=
<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return buffer_is_zero(p, size);<br>
&gt; &gt; @@ -4090,5 +4092,6 @@ static SaveVMHandlers savevm_ram_handlers =
=3D {<br>
&gt; &gt;=C2=A0 void ram_mig_init(void)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_mutex_init(&amp;XBZRLE.lock);<br>
&gt; &gt; +=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX &gt;=3D (1 &l=
t;&lt; TARGET_PAGE_BITS_MIN));<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 register_savevm_live(&quot;ram&quot;, 0, 4, &=
amp;savevm_ram_handlers, &amp;ram_state);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; works; lets keep that in mind somewhere after Michael fixes AVR.<=
br>
&gt; <br>
&gt; You don&#39;t have a great deal of headroom even after getting AVR<br>
&gt; to change, by the way -- TARGET_PAGE_BITS_MIN for Arm is 10.<br>
&gt; So you might want to think about ways to eg reclaim usage of<br>
&gt; that &quot;obsolete, not used&quot; RAM_SAVE_FLAG_FULL bit.<br>
<br>
Yep, I&#39;ve been warning anyone who adds one for ages<br>
<br>
&gt; Also, what does the<br>
&gt;=C2=A0 /* 0x80 is reserved in migration.h start with 0x100 next */<br>
&gt; comment refer to? migration.h has no instances of &quot;RAM_SAVE&quot;=
<br>
&gt; or 0x80 or 1 &lt;&lt; 7...<br>
<br>
It looks like it got moved to qemu-file.h a few years ago<br>
as RAM_SAVE_FLAG_HOOK.<br>
<br>
Dave<br>
<br>
&gt; thanks<br>
&gt; -- PMM<br>
&gt; <br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000c4482605bdcd8f9e--

