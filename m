Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC15F7126
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 00:32:37 +0200 (CEST)
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogZPw-00010N-EO
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 18:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogZMc-0006oZ-Hl
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 18:29:11 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogZMa-0006K5-0F
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 18:29:10 -0400
Received: by mail-ej1-x62f.google.com with SMTP id d26so538621eje.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 15:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isshiki-clinic-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xpI351UrllS7Ljrxf9V9Bg0QJKUNdw28YyQClhM6U6k=;
 b=TyigxujBm9e0mTOfefFhSJzJSVGma188UN+rTOc1eNkqPl3MbZkSyBTxjLzr2KPTDH
 t/FV7lFSiE8ofrs0N3u4vcMHQDWdfOndB5nOgFKwRnEPC3HJp3OWlTNSX3liNwbWGM96
 v4/sgQrWfuv05iWu+a+Lwe4gqm0Qiqb7u1kP14mJ5R2iYz09iXka6iYcJ1isKK0MzBVb
 qDCM5h871Rhq9RP7pvsk2KGm1OGliLiKhulj2zU9WyK06rv7zL5EwiZdrCQSK9JBWUcl
 5DRGguUKhXYbaQq8haH9SskW12xloIkla6mq0q0tERx7ia5jDF+A5toftBBlZ3IDJlt9
 wvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xpI351UrllS7Ljrxf9V9Bg0QJKUNdw28YyQClhM6U6k=;
 b=AKWaa9THL2TR8U4QMQNAFCJkgPTz/Pim5dMkLaUS8NmUa2MUgqRG5Csu68eg86BBc0
 o5B6aC0c7MZgyAEqvfYfmojNWQODzyKBG3/mHbR8mPJP7lhidoDVXISx31cGUwEYITY0
 g5lVunnMs7Lwysy5Rod6yY3uGB0cSYVF6LZTHFCqniAVRld6UlOD437H4MSnNF+/4upa
 4qapnweJ/+P3dzK+UlkgCaKLravM03x9wZwy1+Il1MXBC99ZlzRbEkecM/b3CT+QR0Ly
 2OO7PBfbqr4Hbk7UU57YUDa+S9zu4vUGD21rw2KPwjw20vEU1iE9TjS27fagcn+u9JHO
 skog==
X-Gm-Message-State: ACrzQf2vUiqGnpefwuZCa2piJ2fLgHsBqMeB9ve9GstX/89er52xtYb9
 fqfnSZIEWpYABcL2GncORe+wqLbr1jmehXbcUJHirQ==
X-Google-Smtp-Source: AMsMyM6F65SLLis+Y2ihZmTmAiNK03FxZNrTux5wVXtfqCrN6J3dQ8RPYCtcm/DTHqwSNFdybkWfC8F3aTRmjO76obc=
X-Received: by 2002:a17:907:1c24:b0:78d:3518:2e58 with SMTP id
 nc36-20020a1709071c2400b0078d35182e58mr1646903ejc.574.1665095345535; Thu, 06
 Oct 2022 15:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221006153841.10750-1-sisshiki@mac.com>
 <CAFEAcA-fXq47T2kNUcjbpZ9fQbLdc=jzkT_phMqJ5wyKrdXNmg@mail.gmail.com>
 <15c94fb7-3861-7933-91e9-49a6983a185d@linaro.org>
In-Reply-To: <15c94fb7-3861-7933-91e9-49a6983a185d@linaro.org>
From: =?UTF-8?B?5LiA6Imy6IGh5LiA6YOO?= <sisshiki@isshiki-clinic.com>
Date: Fri, 7 Oct 2022 07:28:55 +0900
Message-ID: <CAJ159us2mdn=wOqK3p3YMqg07pg9FtObnvphT_CN6=M7WfHKUg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org, sisshiki1969 <sisshiki@mac.com>
Content-Type: multipart/alternative; boundary="0000000000009691e105ea6538ff"
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=sisshiki@isshiki-clinic.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--0000000000009691e105ea6538ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your response.

Yes, we can also modify guest_range_valid_untagged() like this:

 static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong
len)
 {
-    return len - 1 <=3D GUEST_ADDR_MAX && start <=3D GUEST_ADDR_MAX - len =
+ 1;
+   return !len || len - 1 <=3D GUEST_ADDR_MAX && start <=3D GUEST_ADDR_MAX=
 -
len + 1;
 }

But actually, guest_range_valid_untagged() is called from several sites
other than target_mprotect().
(1) target_mmap() in bsd-user
(2) target_madvise() in linux-user
(3) target_mmap() in linux-user
(4) target_munmap() in linux-user
(5) access_ok_untagged() in linux-user/qemu.h
(6) target_mremap() in linux-user
(7) do_shmat() in linux-user/syscall.c

(1)-(5) have explicit guards for the condition of len =3D 0 in front of
calling  guest_range_valid_untagged().
(1) https://gitlab.com/qemu-project/qemu/-/blob/master/bsd-user/mmap.c#L477
(2)
https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user/mmap.c#L900
(3)
https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user/mmap.c#L456
(4)
https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user/mmap.c#L724
(5)
https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user/qemu.h#L176

But I'm not sure whether this change is correct for (6) and (7).

2022=E5=B9=B410=E6=9C=887=E6=97=A5(=E9=87=91) 3:31 Richard Henderson <richa=
rd.henderson@linaro.org>:

> On 10/6/22 11:13, Peter Maydell wrote:
> > On Thu, 6 Oct 2022 at 19:05, Soichiro Isshiki
> > <sisshiki@isshiki-clinic.com> wrote:
> >>
> >> From: sisshiki1969 <sisshiki@mac.com>
> >>
> >> For now, qemu-x86_64 returns ENOMEM when mprotect() was called with an
> argument
> >> len is 0 from a guest process.
> >> This behavior is incompatible with the current Linux implementation,
> >> which mprotect() with len =3D 0 does nothing and returns 0,
> >> although it does not appear to be explicitly described in man.
> >>
> >> This is due to the following function which always returns false if le=
n
> =3D 0.
> >>
> >> ```C
> >> static inline bool guest_range_valid_untagged(abi_ulong start,
> abi_ulong len)
> >> {
> >>      return len - 1 <=3D GUEST_ADDR_MAX && start <=3D GUEST_ADDR_MAX -=
 len
> + 1;
> >> }
> >>
> ...
> > Cc'ing Richard -- is this the right fix, or would it be better instead
> > to make guest_range_valid_untagged() correctly handle a zero-length
> > range ?
>
> I think fixing the range check might be best.
>
>
> r~
>

--0000000000009691e105ea6538ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div>Thank you for your response.</div><div><br></div><div>Yes, we c=
an also modify guest_range_valid_untagged() like this:</div><div><br></div>=
=C2=A0static inline bool guest_range_valid_untagged(abi_ulong start, abi_ul=
ong len)<br>=C2=A0{<br>-=C2=A0 =C2=A0 return len - 1 &lt;=3D GUEST_ADDR_MAX=
 &amp;&amp; start &lt;=3D GUEST_ADDR_MAX - len + 1;</div><div dir=3D"ltr" c=
lass=3D"gmail_signature"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0=
">+</a>=C2=A0 =C2=A0return !len || len - 1 &lt;=3D GUEST_ADDR_MAX &amp;&amp=
; start &lt;=3D GUEST_ADDR_MAX - len + 1;<br>=C2=A0}</div><div dir=3D"ltr" =
class=3D"gmail_signature"><div><br></div><div>But actually, guest_range_val=
id_untagged() is called from several sites other=C2=A0than target_mprotect(=
).</div><div>(1) target_mmap() in bsd-user</div><div>(2) target_madvise() i=
n linux-user<br></div><div>(3) target_mmap() in linux-user</div><div>(4) ta=
rget_munmap() in linux-user</div><div>(5)=C2=A0access_ok_untagged() in linu=
x-user/qemu.h<br></div><div>(6) target_mremap() in linux-user</div></div></=
div>(7) do_shmat() in linux-user/syscall.c</div><div dir=3D"ltr"><br></div>=
<div>(1)-(5) have explicit guards for the condition of len =3D 0 in front o=
f calling=C2=A0

guest_range_valid_untagged().</div><div>(1) <a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/bsd-user/mmap.c#L477">https://gitlab.com/qem=
u-project/qemu/-/blob/master/bsd-user/mmap.c#L477</a><br></div><div>(2)=C2=
=A0<a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user=
/mmap.c#L900">https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user=
/mmap.c#L900</a></div><div>(3)=C2=A0<a href=3D"https://gitlab.com/qemu-proj=
ect/qemu/-/blob/master/linux-user/mmap.c#L456">https://gitlab.com/qemu-proj=
ect/qemu/-/blob/master/linux-user/mmap.c#L456</a></div><div>(4)=C2=A0<a hre=
f=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user/mmap.c#L=
724">https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user/mmap.c#L=
724</a></div><div>(5) <a href=3D"https://gitlab.com/qemu-project/qemu/-/blo=
b/master/linux-user/qemu.h#L176">https://gitlab.com/qemu-project/qemu/-/blo=
b/master/linux-user/qemu.h#L176</a></div><div><br></div><div>But I&#39;m no=
t sure whether this change=C2=A0is correct for (6) and (7).</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">2022=E5=B9=B410=
=E6=9C=887=E6=97=A5(=E9=87=91) 3:31 Richard Henderson &lt;<a href=3D"mailto=
:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/6/22 11:13, Pete=
r Maydell wrote:<br>
&gt; On Thu, 6 Oct 2022 at 19:05, Soichiro Isshiki<br>
&gt; &lt;<a href=3D"mailto:sisshiki@isshiki-clinic.com" target=3D"_blank">s=
isshiki@isshiki-clinic.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: sisshiki1969 &lt;<a href=3D"mailto:sisshiki@mac.com" target=
=3D"_blank">sisshiki@mac.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; For now, qemu-x86_64 returns ENOMEM when mprotect() was called wit=
h an argument<br>
&gt;&gt; len is 0 from a guest process.<br>
&gt;&gt; This behavior is incompatible with the current Linux implementatio=
n,<br>
&gt;&gt; which mprotect() with len =3D 0 does nothing and returns 0,<br>
&gt;&gt; although it does not appear to be explicitly described in man.<br>
&gt;&gt;<br>
&gt;&gt; This is due to the following function which always returns false i=
f len =3D 0.<br>
&gt;&gt;<br>
&gt;&gt; ```C<br>
&gt;&gt; static inline bool guest_range_valid_untagged(abi_ulong start, abi=
_ulong len)<br>
&gt;&gt; {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return len - 1 &lt;=3D GUEST_ADDR_MAX &amp;&am=
p; start &lt;=3D GUEST_ADDR_MAX - len + 1;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
...<br>
&gt; Cc&#39;ing Richard -- is this the right fix, or would it be better ins=
tead<br>
&gt; to make guest_range_valid_untagged() correctly handle a zero-length<br=
>
&gt; range ?<br>
<br>
I think fixing the range check might be best.<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--0000000000009691e105ea6538ff--

