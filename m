Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFAA5420B8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 04:07:01 +0200 (CEST)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyl64-0002AN-PL
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 22:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyl1s-00074u-IS
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:02:40 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:37407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyl1q-00064G-6a
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:02:40 -0400
Received: by mail-ua1-x932.google.com with SMTP id i4so192488uaq.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 19:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6MwJLoEg4o+XnX5J3MKqvIpog8SQtbhnZGON02exT6k=;
 b=rn5a8dFRgxpvMHnDrEhygKDcxxDUOVGLq88Roy8NIlf8y8vJ1eKlzaeRgFjuBc7tXG
 B1YC6skJAQzPMHYvjjev28DR7+7Qkf4mqH4OnRGhiIGzKMOxj2+PSxFIGELLT4u5odnH
 wECtqsW2gcD1sBBc/UvECmCyXiEGgIP/aVyhmG3eF7sdHqiT9Bd4W/rg1lkrTDe7YC5k
 3IxXsRc5I2PKk3pNFMs3hldY301F7HDFv+ItXgb99FeAqJTMc2VBxokTlxMalZjcdKVZ
 yKSUComfrJ3GBhlrGb4f8JZjggd5AELJiQnqC5y51z+iQLswLfvpB8WUlNtempVL+kJH
 UjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6MwJLoEg4o+XnX5J3MKqvIpog8SQtbhnZGON02exT6k=;
 b=crpd37w60NR6epCtuhnzd0l7jRWyapl2wSD+0WtsFiUSByRipwwzIs5+TD1EYnnAjX
 eU0ZtU8W/dnp54czy96LJyuoHwVHuxTa7qx+LVxjghvHfhVdR+IV9RFCwyITeb6W8G4n
 4wQYj05rLvzz1Cx4J4u/MWQgwAmkhvMs1hR1VtRXSCe0iAk+OpSDxRgAQyZ7peaoS5Ry
 W6gfmu/3aAXm+838B7NNjWf8SlMpOCQAz986V+2cC64uhBSBZQJyhZSBsn7grUDdc48l
 0XvdYI2dhNIdokk4H/bcduIEa7guw/yx+Wm94N2qy0H5DvyaAg+AT3ASxlVn9cll8J4O
 OE8Q==
X-Gm-Message-State: AOAM530TLfRKj5kPyWdDhhrm+6f9PKV6tLExpWhfbrP1afIinfihWu6O
 7D045BHaLk8CcWzL7EMxaY+OrFtDUYJ2I623zX+gJQ==
X-Google-Smtp-Source: ABdhPJxE3RlDo44ZaYp/usbYhqihBktdsM3Ggf13iNOgORp7Og1zVBVF+oGB8IgUpaMLWWHEdXLJu6jaQ9QlZbKHehQ=
X-Received: by 2002:ab0:6907:0:b0:371:521c:7a1c with SMTP id
 b7-20020ab06907000000b00371521c7a1cmr19376648uas.48.1654653756979; Tue, 07
 Jun 2022 19:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-5-imp@bsdimp.com>
 <575c6936-c0e0-2c9f-8c5d-e9184001804b@linaro.org>
In-Reply-To: <575c6936-c0e0-2c9f-8c5d-e9184001804b@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 7 Jun 2022 19:02:26 -0700
Message-ID: <CANCZdfrca-pwZDLsr77YkkOPH6aTOEjEXR9iSCF+GPeASc0LzQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] bsd-user/bsd-file.h: Add implementations for read,
 pread, readv and preadv
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gleb Popov <arrowd@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000694fbf05e0e6198d"
Received-SPF: none client-ip=2607:f8b0:4864:20::932;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000694fbf05e0e6198d
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 2:45 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/7/22 13:14, Warner Losh wrote:
> > +/* read(2) */
> > +static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2,
> abi_long arg3)
>
> Why the inline markers?  Best to drop them.
>

static inline ensures that we don't get a warning if bsd-file.h is included
in multiple places and these routines aren't used.

Though it turns out....


> > +        /*
> > +         * File system calls.
> > +         */
> > +    case TARGET_FREEBSD_NR_read: /* read(2) */
> > +        ret = do_bsd_read(arg1, arg2, arg3);
> > +        break;
> > +
> > +    case TARGET_FREEBSD_NR_pread: /* pread(2) */
> > +        ret = do_bsd_pread(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
> > +        break;
> > +
> > +    case TARGET_FREEBSD_NR_readv: /* readv(2) */
> > +        ret = do_bsd_readv(arg1, arg2, arg3);
> > +        break;
>
> Missing preadv, which you added above.


It would have caught this :)  I'll update this and the write changes...

Warner

--000000000000694fbf05e0e6198d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022 at 2:45 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 6/7/22 13:14, Warner Losh wrote:<br>
&gt; +/* read(2) */<br>
&gt; +static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_=
long arg3)<br>
<br>
Why the inline markers?=C2=A0 Best to drop them.<br></blockquote><div><br><=
/div><div>static inline ensures that we don&#39;t get a warning if bsd-file=
.h is included in multiple places and these routines aren&#39;t used.</div>=
<div><br></div><div>Though it turns out....</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* File system calls.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_read: /* read(2) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_read(arg1, arg2, arg3);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_pread: /* pread(2) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_pread(cpu_env, arg1, arg2,=
 arg3, arg4, arg5, arg6);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case TARGET_FREEBSD_NR_readv: /* readv(2) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D do_bsd_readv(arg1, arg2, arg3);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
Missing preadv, which you added above.</blockquote><div><br></div><div>It w=
ould have caught this :)=C2=A0 I&#39;ll update this and the write changes..=
.</div><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000694fbf05e0e6198d--

