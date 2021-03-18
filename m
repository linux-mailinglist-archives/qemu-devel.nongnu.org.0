Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E903402FE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:16:43 +0100 (CET)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMphq-0007OI-61
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMpgz-0006q1-Go
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:15:49 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lMpgw-0004j9-QL
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:15:49 -0400
Received: by mail-qt1-x82b.google.com with SMTP id a11so3626697qto.2
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HfeQfjeLc2Uys84a8Hc7X9MzIKsVZ1rOnjVlsbabGUw=;
 b=IKKfxkUQsxl6I+QXCCBSB5l1dmKYj/hXvjobQsbpj7a3zIYzICJsWJPwuxSbaA1plo
 dxP/KKDGpUHDNvgBP5qimy0MayYG/tGhuMzXEVH60j5NQFJnt34iP0x8akBkArK45GBp
 5tAaWoXZnmKAoQq/V0MMamewN4dZu3HT4PGam9HNCOkiTNQ2O74bpjQ7BtJplVQcY2Ai
 G8Jo5rE0TEt7bbimb3HvgXzlJMX36cJGBji5bNO97ilwhz/xRdvSjREVhe47PzIvkjAQ
 XUuOXjr7mYitO1jIFSQm+CaRw3C2nOPLVi6mtFW01WKLalbxOn4xg7fZVSrj+NMKJUG5
 vsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HfeQfjeLc2Uys84a8Hc7X9MzIKsVZ1rOnjVlsbabGUw=;
 b=ReLveZEQ6XbK/f3UHKpF0icRMLmsGMZ6DKF7cXSwy5X0Fz5ejiV0VYcR459DZg9XfH
 f1WjOu4V5/7/KKM1zhLtThqO80/ZJr16l3SgpjANXcBvtVYgJfvBPdLAgFmdNUqdC5fn
 +NIp/n1Ys8oGvkmSkwGKwGeSECArwphWkZzhZokzhXIEHecl/KMSCobmxw5+yDr3jbF5
 5CA+uOASkwGYmihPS+3zWNiZs25lYLKkjh/jEGAeGuqESBhcIe1BVw3ZU/qqAeDrS2nz
 ChQjbL+v8YMlel0rKFoXkd3AcxZudR2SKD7wrayYN8xdeftq427tn5E3596dD+SZzO2Y
 XlOA==
X-Gm-Message-State: AOAM530kLVPqefS6wFTVDwtmQd+M8lY7ULYdCpt5dHsDNrcfsyx1V0Et
 YvScKFUVjGC2KMnB20lv2c19Z9kpDwnTLp8rfCSnsQbu
X-Google-Smtp-Source: ABdhPJxp5uwJr4CbcrZJ+t9b8RwzaGmEcCOpE/haceQ6waXaB98bctRgApmv5cuM5goesgVCNFMf79P0sZbATrbURY0=
X-Received: by 2002:a05:622a:84:: with SMTP id
 o4mr2973580qtw.382.1616062545743; 
 Thu, 18 Mar 2021 03:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAK4993j08YrWb4CFZ_rgiCdGQDcc7fCcL4O3VT9Zz3mGL=9+2Q@mail.gmail.com>
 <YFMjmwZ2PgKIfDTE@work-vm>
In-Reply-To: <YFMjmwZ2PgKIfDTE@work-vm>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Thu, 18 Mar 2021 12:15:09 +0200
Message-ID: <CAK4993iHtY=V_Wh-LZ5dQu2qiiugBt83fz8zn+jeOuN+EVgnwQ@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f9521805bdcce16a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=mrolnik@gmail.com; helo=mail-qt1-x82b.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f9521805bdcce16a
Content-Type: text/plain; charset="UTF-8"

ok. I will try to fix it.

Regards,
Michael Rolnik

On Thu, Mar 18, 2021 at 11:55 AM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Michael Rolnik (mrolnik@gmail.com) wrote:
> > Hi Dave.
> >
> > What is the smallest supported page size?
>
> Currently 512 I think; in migration/ram.c we have:
>
> #define RAM_SAVE_FLAG_FULL     0x01 /* Obsolete, not used anymore */
> #define RAM_SAVE_FLAG_ZERO     0x02
> #define RAM_SAVE_FLAG_MEM_SIZE 0x04
> #define RAM_SAVE_FLAG_PAGE     0x08
> #define RAM_SAVE_FLAG_EOS      0x10
> #define RAM_SAVE_FLAG_CONTINUE 0x20
> #define RAM_SAVE_FLAG_XBZRLE   0x40
> /* 0x80 is reserved in migration.h start with 0x100 next */
> #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>
> so we're already using the 0x100 (256) flag.
>
> I spotted this yesterday because a patch tried to use the 0x200 flag.
>
> Dave
> >
> > On Wed, Mar 17, 2021 at 10:14 PM Dr. David Alan Gilbert <
> dgilbert@redhat.com>
> > wrote:
> >
> > > Hi Michael,
> > >   I noticed your AVR code defines:
> > >
> > >   #define TARGET_PAGE_BITS 8
> > >
> > > and has an explanation of why.
> > >
> > > Note however that's not going to work with the current live
> > > migration/snapshotting code, since you're a couple of bits smaller
> > > than the smallest page size we had so far, and for many years
> > > the RAM migration code has stolen the bottom few bits of the address
> > > as a flag field, and has already used 0x100 up; see migration/ram.c
> > > RAM_SAVE_FLAG_*    - and it's actually tricky to change it, because if
> > > you change it then it'll break migration compatibility with existing
> > > qemu's.
> > >
> > > Hmm.
> > >
> > > Dave
> > >
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > >
> > >
> >
> > --
> > Best Regards,
> > Michael Rolnik
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

-- 
Best Regards,
Michael Rolnik

--000000000000f9521805bdcce16a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ok. I will try to fix it.<div><br></div><div>Regards,</div=
><div>Michael Rolnik</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Mar 18, 2021 at 11:55 AM Dr. David Alan G=
ilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Mich=
ael Rolnik (<a href=3D"mailto:mrolnik@gmail.com" target=3D"_blank">mrolnik@=
gmail.com</a>) wrote:<br>
&gt; Hi Dave.<br>
&gt; <br>
&gt; What is the smallest supported page size?<br>
<br>
Currently 512 I think; in migration/ram.c we have:<br>
<br>
#define RAM_SAVE_FLAG_FULL=C2=A0 =C2=A0 =C2=A00x01 /* Obsolete, not used an=
ymore */<br>
#define RAM_SAVE_FLAG_ZERO=C2=A0 =C2=A0 =C2=A00x02<br>
#define RAM_SAVE_FLAG_MEM_SIZE 0x04<br>
#define RAM_SAVE_FLAG_PAGE=C2=A0 =C2=A0 =C2=A00x08<br>
#define RAM_SAVE_FLAG_EOS=C2=A0 =C2=A0 =C2=A0 0x10<br>
#define RAM_SAVE_FLAG_CONTINUE 0x20<br>
#define RAM_SAVE_FLAG_XBZRLE=C2=A0 =C2=A00x40<br>
/* 0x80 is reserved in migration.h start with 0x100 next */<br>
#define RAM_SAVE_FLAG_COMPRESS_PAGE=C2=A0 =C2=A0 0x100<br>
<br>
so we&#39;re already using the 0x100 (256) flag.<br>
<br>
I spotted this yesterday because a patch tried to use the 0x200 flag.<br>
<br>
Dave<br>
&gt; <br>
&gt; On Wed, Mar 17, 2021 at 10:14 PM Dr. David Alan Gilbert &lt;<a href=3D=
"mailto:dgilbert@redhat.com" target=3D"_blank">dgilbert@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi Michael,<br>
&gt; &gt;=C2=A0 =C2=A0I noticed your AVR code defines:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0#define TARGET_PAGE_BITS 8<br>
&gt; &gt;<br>
&gt; &gt; and has an explanation of why.<br>
&gt; &gt;<br>
&gt; &gt; Note however that&#39;s not going to work with the current live<b=
r>
&gt; &gt; migration/snapshotting code, since you&#39;re a couple of bits sm=
aller<br>
&gt; &gt; than the smallest page size we had so far, and for many years<br>
&gt; &gt; the RAM migration code has stolen the bottom few bits of the addr=
ess<br>
&gt; &gt; as a flag field, and has already used 0x100 up; see migration/ram=
.c<br>
&gt; &gt; RAM_SAVE_FLAG_*=C2=A0 =C2=A0 - and it&#39;s actually tricky to ch=
ange it, because if<br>
&gt; &gt; you change it then it&#39;ll break migration compatibility with e=
xisting<br>
&gt; &gt; qemu&#39;s.<br>
&gt; &gt;<br>
&gt; &gt; Hmm.<br>
&gt; &gt;<br>
&gt; &gt; Dave<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" t=
arget=3D"_blank">dgilbert@redhat.com</a> / Manchester, UK<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; -- <br>
&gt; Best Regards,<br>
&gt; Michael Rolnik<br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--000000000000f9521805bdcce16a--

