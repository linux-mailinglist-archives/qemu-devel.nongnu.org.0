Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD132ECE5A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:01:26 +0100 (CET)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxT2j-0002KI-VG
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSz9-00009V-PC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:57:44 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSz5-0005zz-KL
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:57:43 -0500
Received: by mail-lf1-x12b.google.com with SMTP id o10so2675633lfl.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=FDH/5XUC5HqMO/EJlYlAybhszKVrAlEnT5mt6DZfrlQ=;
 b=sKTaTQSgjC6i6PG1OrmONuMvbgzgvCFD2HvasbHAT2nRS47sa1hXFFBwIweWiKNojU
 CPOWNXsgxj6JsGG1X4pjoZidCE6yI7Kw/08/Ys3hamPiS3nRuUMg1A6LfO+3cE98VC1h
 RhVxocxSMUhqssRSXjLGX++GI821phM9CmpYHZEi3x60hxaHN0fUAVpyzbnRiGO9j5Kf
 KJcu0YjnF3TJXYJWriXgeHcgz5IaB+VNtChsMce8R8e29eA9oQGOcb3RXk3djPYrTJfg
 cjBQ6Xc+PhfGVjf9/hfvb4buZNlyCwcLekpN/AqDmt/i8Q/neun3Z+FuiW0h6mAbnDJc
 Le1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=FDH/5XUC5HqMO/EJlYlAybhszKVrAlEnT5mt6DZfrlQ=;
 b=Qlg4CNEz/8sHLCGAqEHDRG/InjEvrFbdfMPvsiyOtuAK5znTEVF4qEUYOrK3HTbBMM
 z9cYCFMxsLren9+udPGmi+HRADGYC2E6qENNTqFEmWxl5l/R1Bt+4Pau3h2ShLYHq/SH
 imuRu0tnPI/RiRWdG5mgzhlY0npLr/lBDTBzz/2oKcoVMZZ6YOjKtJVW3L5wb1XvI9Wu
 YAQe6ykrLEf54VjQA+5O2WWjf1DqKd7eh75G8s2l448gAZ5XzOzptfazqVk5PFkfq0Fm
 vhYc976BKw6T7ay3CH0NGIJ/7AHUB6brLUme4CN6G/KXJKmn1Xd2cH3nlY/PkCWMJbYV
 7n0Q==
X-Gm-Message-State: AOAM5307bVRWuhVK91VfpWMdz2spsZPMopVrR1yLTSn93axlOnnwalqw
 o/J9SVSRGzCas3Ynj9As9K2m4JAZZ6GHvA+M8NA=
X-Google-Smtp-Source: ABdhPJxNTtDhbZ7Aum9SXtOzxDXCJmWzhiScFtszKi9101QQIB8Dx4lfPqhjzJ6y5Ph+SiGas0rFe7VN3JzbW2hhpLA=
X-Received: by 2002:a19:ecb:: with SMTP id 194mr3548712lfo.70.1610017056681;
 Thu, 07 Jan 2021 02:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20210107101919.80-1-luoyonggang@gmail.com>
 <20210107101919.80-6-luoyonggang@gmail.com>
 <CAJ+F1C+q9e08zX9OqkS4294oCNBAf-Gs7L9AomtYrc7vKyqCEA@mail.gmail.com>
 <7b3d24b7-d301-549d-abc2-613f02c8843e@redhat.com>
In-Reply-To: <7b3d24b7-d301-549d-abc2-613f02c8843e@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 7 Jan 2021 02:57:24 -0800
Message-ID: <CAE2XoE-4QYMnQUJb=KUBH1f9dRQaK5fGr9+BytMGa+ZYgzVdXw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] whpx: move whpx_lapic_state from header to c file
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bef42605b84d4e71"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x12b.google.com
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
Reply-To: luoyonggang@gmail.com
Cc: Ed Maste <emaste@freebsd.org>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bef42605b84d4e71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 7, 2021 at 2:55 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 07/01/21 11:28, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Jan 7, 2021 at 2:26 PM Yonggang Luo <luoyonggang@gmail.com
> > <mailto:luoyonggang@gmail.com>> wrote:
> >
> >     This struct only used in whpx-apic.c, there is no need
> >     expose it in whpx.h.
> >
> >     Signed-off-by: Yonggang Luo <luoyonggang@gmail.com
> >     <mailto:luoyonggang@gmail.com>>
> >
> >
> > Similar patch pending:
> >
https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201=
219090637.1700900-3-pbonzini@redhat.com/
> > <
https://patchew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201=
219090637.1700900-3-pbonzini@redhat.com/
>
>
> This one could still be applied before or after mine, it makes sense.
>
> Paolo
>
OK, prefer yours:) I am trying to green the CI,

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000bef42605b84d4e71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Jan 7, 2021 at 2:55 AM Paolo Bonzini &lt;<=
a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br=
>&gt;<br>&gt; On 07/01/21 11:28, Marc-Andr=C3=A9 Lureau wrote:<br>&gt; &gt;=
 Hi<br>&gt; &gt;<br>&gt; &gt; On Thu, Jan 7, 2021 at 2:26 PM Yonggang Luo &=
lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a><br>&g=
t; &gt; &lt;mailto:<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gma=
il.com</a>&gt;&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 This stru=
ct only used in whpx-apic.c, there is no need<br>&gt; &gt; =C2=A0 =C2=A0 ex=
pose it in whpx.h.<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 Signed-off-by: Y=
onggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.=
com</a><br>&gt; &gt; =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:luoyonggang=
@gmail.com">luoyonggang@gmail.com</a>&gt;&gt;<br>&gt; &gt;<br>&gt; &gt;<br>=
&gt; &gt; Similar patch pending:<br>&gt; &gt; <a href=3D"https://patchew.or=
g/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201219090637.1700900-=
3-pbonzini@redhat.com/">https://patchew.org/QEMU/20201219090637.1700900-1-p=
bonzini@redhat.com/20201219090637.1700900-3-pbonzini@redhat.com/</a><br>&gt=
; &gt; &lt;<a href=3D"https://patchew.org/QEMU/20201219090637.1700900-1-pbo=
nzini@redhat.com/20201219090637.1700900-3-pbonzini@redhat.com/">https://pat=
chew.org/QEMU/20201219090637.1700900-1-pbonzini@redhat.com/20201219090637.1=
700900-3-pbonzini@redhat.com/</a>&gt;<br>&gt;<br>&gt; This one could still =
be applied before or after mine, it makes sense.<br>&gt;<br>&gt; Paolo<br>&=
gt;<br>OK, prefer yours:) I am trying to green the CI,=C2=A0<br><br>--<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=
=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<=
/div>

--000000000000bef42605b84d4e71--

