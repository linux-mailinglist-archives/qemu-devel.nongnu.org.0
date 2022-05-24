Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F755326CB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 11:48:56 +0200 (CEST)
Received: from localhost ([::1]:50216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntR9r-0004nO-Gs
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 05:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntQoe-0006LN-Mm
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:27:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntQoT-0004gE-PN
 for qemu-devel@nongnu.org; Tue, 24 May 2022 05:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653384406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DD7ysE7Kro8h4G8myeHw1mEBhOFqlwUwhhOQEAQi4yY=;
 b=I/8jsPoFRlOEwcbWNS0ktfVMe5oQ1RCllf91T13/MsDdeDfgHbdibyrMKz+MwQNR8XH+Hu
 gHsJZuFhhDZDY6a7OCHBNIe36C69PtGSrsXS8HpP7jD1/cRjrod79ACn8o6AkQP1fCcyA1
 JfrQMZrp3+3JqykX7JAJ8HZWUVGuYfg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-UbNmixfzNYespBYvVuLOJA-1; Tue, 24 May 2022 05:26:44 -0400
X-MC-Unique: UbNmixfzNYespBYvVuLOJA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2f8398e99dcso149225177b3.9
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 02:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DD7ysE7Kro8h4G8myeHw1mEBhOFqlwUwhhOQEAQi4yY=;
 b=Ub6Q1HL5fG1F3evUTXbQquq51jEE/hPA3BMf9BcaYGNm7kcucfqR3Bo6jdERRjTvvr
 TCNdVhRpyuCFnxqAfov8pCFRpVs4RCD6atdUXZYQmVelJ3YBPHNazAkIY4cN3fXgvPGM
 HpAm30w9WB2JjPx1JcuqOrKoJ4D8fYgUP9V9oNAZrwtgorKTNi4F13geprobv3FVxj4E
 +BGJZF1Db0MdGtM/9sLEiLLTzWYo0F0B9t03xGsRkpZS/GHJ2YXxMjQYNlFqh6kbhLL/
 OSbc1HjBkZTD1J1BasrjixNe0LuxmcD9eZ+R8jj26RoxbY88DyRq1Y6o5fa96JirLYvA
 ZuHg==
X-Gm-Message-State: AOAM531Af+Qn+daVoD5W3wp82hKzkPcUCcryKa0Eb6sc88I1YFmsbtT5
 N1ig8CPhpVq2VwCUiSWoI67Mn6vId5GYo5eLkEHPORgJ2ovB+KhZOHe6PC7Jj5FcCEnmvWgPi51
 y7IJbx9qak4BDu3QN1/SF5K22prEGRvs=
X-Received: by 2002:a25:ba85:0:b0:650:225e:da80 with SMTP id
 s5-20020a25ba85000000b00650225eda80mr4329572ybg.138.1653384404072; 
 Tue, 24 May 2022 02:26:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfKQpGY7bigY3XtR7mvE4Q6YV3UYi2GyEKxZhdVNtcZclPh/iy6EDSK8MoINPQtldelkEVi+trL8xVz5WjNHc=
X-Received: by 2002:a25:ba85:0:b0:650:225e:da80 with SMTP id
 s5-20020a25ba85000000b00650225eda80mr4329563ybg.138.1653384403884; Tue, 24
 May 2022 02:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
In-Reply-To: <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 24 May 2022 12:26:33 +0300
Message-ID: <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000122e5a05dfbe8e6c"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000122e5a05dfbe8e6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the report. I will think about how to fix the build with old
mingw-headers.
BusTypeNvme and BusTypeSpaces were added to mingw-headers v 9.0.0


On Mon, May 23, 2022 at 11:55 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 5/23/22 12:41, Konstantin Kostiuk wrote:
> > Bus type spaces (Indicates a storage spaces bus) is not
> > supported, so return it as unknown.
> >
> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > Message-Id: <20220520201401.706630-1-kkostiuk@redhat.com>
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > ---
> >   qga/commands-win32.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> > index dcdeb76a68..36f94c0f9c 100644
> > --- a/qga/commands-win32.c
> > +++ b/qga/commands-win32.c
> > @@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] =3D {
> >   #if (_WIN32_WINNT >=3D 0x0601)
> >       [BusTypeVirtual] =3D GUEST_DISK_BUS_TYPE_VIRTUAL,
> >       [BusTypeFileBackedVirtual] =3D
> GUEST_DISK_BUS_TYPE_FILE_BACKED_VIRTUAL,
> > +    /*
> > +     * BusTypeSpaces currently is not suported
> > +     */
> > +    [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,
> > +    [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,
> >   #endif
> >   };
> >
>
> Build fails:
>
> ../qga/commands-win32.c:496:6: error: 'BusTypeSpaces' undeclared here (no=
t
> in a function);
> did you mean 'BusTypeSas'?
>    496 |     [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,
>        |      ^~~~~~~~~~~~~
>        |      BusTypeSas
> ../qga/commands-win32.c:496:6: error: array index in initializer not of
> integer type
> ../qga/commands-win32.c:496:6: note: (near initialization for 'win2qemu')
> ../qga/commands-win32.c:497:6: error: 'BusTypeNvme' undeclared here (not
> in a function);
> did you mean 'BusTypeMmc'?
>    497 |     [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,
>        |      ^~~~~~~~~~~
>        |      BusTypeMmc
> ../qga/commands-win32.c:497:6: error: array index in initializer not of
> integer type
> ../qga/commands-win32.c:497:6: note: (near initialization for 'win2qemu')
>
>

> r~
>
>

--000000000000122e5a05dfbe8e6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the report. I will think about how to fix =
the build with old mingw-headers.</div><div>BusTypeNvme and BusTypeSpaces w=
ere added to  mingw-headers v 9.0.0<br></div><div><br></div><div><br></div>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Ma=
y 23, 2022 at 11:55 PM Richard Henderson &lt;<a href=3D"mailto:richard.hend=
erson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On 5/23/22 12:41, Konstantin =
Kostiuk wrote:<br>
&gt; Bus type spaces (Indicates a storage spaces bus) is not<br>
&gt; supported, so return it as unknown.<br>
&gt; <br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20220520201401.706630-1-kkostiuk@red=
hat.com" target=3D"_blank">20220520201401.706630-1-kkostiuk@redhat.com</a>&=
gt;<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qga/commands-win32.c | 5 +++++<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
&gt; index dcdeb76a68..36f94c0f9c 100644<br>
&gt; --- a/qga/commands-win32.c<br>
&gt; +++ b/qga/commands-win32.c<br>
&gt; @@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] =3D {<br>
&gt;=C2=A0 =C2=A0#if (_WIN32_WINNT &gt;=3D 0x0601)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[BusTypeVirtual] =3D GUEST_DISK_BUS_TYPE_VIR=
TUAL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[BusTypeFileBackedVirtual] =3D GUEST_DISK_BU=
S_TYPE_FILE_BACKED_VIRTUAL,<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* BusTypeSpaces currently is not suported<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,<br>
&gt; +=C2=A0 =C2=A0 [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Build fails:<br>
<br>
../qga/commands-win32.c:496:6: error: &#39;BusTypeSpaces&#39; undeclared he=
re (not in a function); <br>
did you mean &#39;BusTypeSas&#39;?<br>
=C2=A0 =C2=A0496 |=C2=A0 =C2=A0 =C2=A0[BusTypeSpaces] =3D GUEST_DISK_BUS_TY=
PE_UNKNOWN,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 BusTypeSas<br>
../qga/commands-win32.c:496:6: error: array index in initializer not of int=
eger type<br>
../qga/commands-win32.c:496:6: note: (near initialization for &#39;win2qemu=
&#39;)<br>
../qga/commands-win32.c:497:6: error: &#39;BusTypeNvme&#39; undeclared here=
 (not in a function); <br>
did you mean &#39;BusTypeMmc&#39;?<br>
=C2=A0 =C2=A0497 |=C2=A0 =C2=A0 =C2=A0[BusTypeNvme] =3D GUEST_DISK_BUS_TYPE=
_NVME,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 BusTypeMmc<br>
../qga/commands-win32.c:497:6: error: array index in initializer not of int=
eger type<br>
../qga/commands-win32.c:497:6: note: (near initialization for &#39;win2qemu=
&#39;)<br>=C2=A0 <br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
r~<br>
<br>
</blockquote></div></div>

--000000000000122e5a05dfbe8e6c--


