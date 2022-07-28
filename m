Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0871583B4B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:35:07 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzv8-00064b-NY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oGzpV-0001R5-0A
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:29:20 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:40776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oGzpS-0007Ti-Rl
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:29:16 -0400
Received: by mail-ua1-x92a.google.com with SMTP id r12so499530uaf.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 02:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=4D/xERkLJ6XFPcqjuGz3MiCmAW7KZMcyOyZblu0wp6Q=;
 b=kdWmHgXcBBIuElsoMqemq964kpVRSl4elrf5+q1e1QxpDb9BPCL8cFdLbbmYEKMcHh
 Hv1YQW/g3095fBTaG+zilOjN5Jj2F5p7YwwkfNV8dGM7jQ7GRNUDMRpwhEbW9t5/PJLr
 Pys+PjVglx2D2slEUjY5z6OL5pkFEbjGNzC6Jvi40Gn10jX+hkCubLCCa/1jTzUve466
 6tpFtkdjY5CUY64e/gXXsuom6GjbgnuPq+MNjReb2z2cx2EODy0yM7hCaJUDbvWSaMez
 S2iNutzNhgQ/Hdl3d4dRXVBkYo+p2iTnSOj+TbLshu6cIk6c3TFtuRps7MjA8mKkI4uJ
 jLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=4D/xERkLJ6XFPcqjuGz3MiCmAW7KZMcyOyZblu0wp6Q=;
 b=ZNKuFoPUv/OrYvRU4PWvknMBZwlwDInPY7yuyBXo2aG2UiqnPXelvETItqbdraUeeX
 7StiJ55ivKsifYeBsSF7enpMZK7Bp65lmYKcIzst4Q9JzVaqQ8+F76CcVZOTFi3Tg4+8
 jaH+1xn5+zU5tkYQZBZnJmVPX1kqjJIJQen1p9X6fomrPkF58kNnOa+HVax4J/SOqocW
 zcPGa2Tvpev6wnICrDItxKFxbB70e9lh6OxZDkaiO3DbKNgK3aNipXE0axuJx0RJV4WE
 fmoxviAK+VSpuZeQb8Ngm62038mlJ18NL2oKX5lJIvEr+2Pn/VbuIVzc3v4qRm9reMmZ
 ji7Q==
X-Gm-Message-State: AJIora9JpbHQMiYXv/5rN61GB3c48fDviVlj0R0EUlDuPaAnQSYhl3YU
 OkKg44FEhDSlcXKQQjAARb2IXzLGRa0W8myqLAU=
X-Google-Smtp-Source: AGRyM1uDdCrFk5J4jEUFbuRevMKjI2lOy7gMqDbB+dtggRJVD2tiQ/JdJVewb6hRxxZNtdhwc2+vs0N6+CA88P9bDPM=
X-Received: by 2002:ab0:3303:0:b0:384:dd5b:ef55 with SMTP id
 r3-20020ab03303000000b00384dd5bef55mr2211996uao.27.1659000552442; Thu, 28 Jul
 2022 02:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2XoE_Ki5QJSH9LNkFOzOwMFJdS=y6=bb2g=9ODawuFymADdA@mail.gmail.com>
 <YuJLKn8y7LrjnBjK@redhat.com>
In-Reply-To: <YuJLKn8y7LrjnBjK@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 28 Jul 2022 17:28:59 +0800
Message-ID: <CAE2XoE-KfoKtcepFgT9zSj6TDtu+T04=TA=4eDxumF6RNrPYyA@mail.gmail.com>
Subject: Re: When create a new qemu fork, can not run pipeline,
 what I need to do?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009c522105e4da2ae9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009c522105e4da2ae9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 4:39 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:
>
> On Wed, Jul 27, 2022 at 07:20:51PM +0800, =E7=BD=97=E5=8B=87=E5=88=9A(Yon=
ggang Luo) wrote:
> > =C2=B7=C2=B7=C2=B7
> > Pipeline cannot be run.
> >
> > No stages / jobs for this pipeline.
>
> No jobs are created until you set 'QEMU_CI=3D1', which creates jobs and
> lets them be manually started, or set 'QEMU_CI=3D2' which creates jobs
> and runs them all immediately. Please see:
>
>   docs/devel/ci-jobs.rst.inc
>

Thanks, I've tried to locate this but not found it

>
> > The form contains the following warning:
> >
> > 121 warnings found: showing first 25
>
> The warnings are harmless since we don't use merge requests.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
https://www.instagram.com/dberrange :|
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000009c522105e4da2ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Jul 28, 2022 at 4:39 PM Daniel P. Berrang=
=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&g=
t; wrote:<br>&gt;<br>&gt; On Wed, Jul 27, 2022 at 07:20:51PM +0800, =E7=BD=
=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:<br>&gt; &gt; =C2=B7=C2=B7=C2=B7<=
br>&gt; &gt; Pipeline cannot be run.<br>&gt; &gt;<br>&gt; &gt; No stages / =
jobs for this pipeline.<br>&gt;<br>&gt; No jobs are created until you set &=
#39;QEMU_CI=3D1&#39;, which creates jobs and<br>&gt; lets them be manually =
started, or set &#39;QEMU_CI=3D2&#39; which creates jobs<br>&gt; and runs t=
hem all immediately. Please see:<br>&gt;<br>&gt; =C2=A0 docs/devel/ci-jobs.=
rst.inc<br>&gt;<div><br></div><div>Thanks, I&#39;ve tried to locate this bu=
t not found it</div><div><br>&gt;<br>&gt; &gt; The form contains the follow=
ing warning:<br>&gt; &gt;<br>&gt; &gt; 121 warnings found: showing first 25=
<br>&gt;<br>&gt; The warnings are harmless since we don&#39;t use merge req=
uests.<br>&gt;<br>&gt; With regards,<br>&gt; Daniel<br>&gt; --<br>&gt; |: <=
a href=3D"https://berrange.com">https://berrange.com</a> =C2=A0 =C2=A0 =C2=
=A0-o- =C2=A0 =C2=A0<a href=3D"https://www.flickr.com/photos/dberrange">htt=
ps://www.flickr.com/photos/dberrange</a> :|<br>&gt; |: <a href=3D"https://l=
ibvirt.org">https://libvirt.org</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://fstop138.berrange.com"=
>https://fstop138.berrange.com</a> :|<br>&gt; |: <a href=3D"https://entangl=
e-photo.org">https://entangle-photo.org</a> =C2=A0 =C2=A0-o- =C2=A0 =C2=A0<=
a href=3D"https://www.instagram.com/dberrange">https://www.instagram.com/db=
errange</a> :|<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=
=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--0000000000009c522105e4da2ae9--

