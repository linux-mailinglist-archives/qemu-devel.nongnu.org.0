Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1EA541F3F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:58:45 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi9s-0004LO-GQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyh77-00075O-Ub
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:51:49 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nyh76-00030F-05
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:51:49 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id i186so17948917vsc.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpUZeXhuSO8cOPbT50QhoPhKD3CKVJh//XHaylXBGV4=;
 b=3B/c/d2gM1S1im9HoENg+l/ElyQRGGNK1dhQlzcpMDLgyQk2EAB2cXQd8T5BwPdeOD
 2f2XED0yV91MnZLUendc4TB2MAVn6P+MVYaklVC8f28o41hzvffNQprQms2ZWUbF97L9
 anVgod1n0RNvB+usalGwdBzowHfaxah9Q5HtlmkGPIr9wMNPqlTMqjeCuLpUfe2Cn8WU
 dnUz/ZeBILMJ3HsGtHR4uqmPi3LxmxRS24Apc1CVS8kW+GfvIKSVbJcG/5C9PoAYnQj6
 Gdt4XL4djugkjgdSVICTpv0xIOUg179ZMGjj30mYzBD+/07TJnjY0qtbUxjmEWQlbxpM
 ic+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpUZeXhuSO8cOPbT50QhoPhKD3CKVJh//XHaylXBGV4=;
 b=I7mOCBJRaNt1mbGWVUG8NsDJbbkB8JJcANLkiWl77K8CtTBQbxxA0zBHmLXX9pZRhS
 X8wSITsDAPZAaTQoJI8xjQrYKU931QOlGL/GVH8R4AMqyw1x2AgQmCTk9GVbYu2fxpoP
 DJkQzdckYoYPt0+GIUR6CRh1GRB6+DDtA6SUj5CRb5dSufswljwOfnTyoAf6cpFdZoEk
 dQtOPP3agxvCRlZ4EpnkkTqQDEowb8ffhNfgB+T7kmxWz8ce3SATzXhGY4dMFelSnZUL
 6pv6XjZiPRpz4PtrTXPTYMAkeAb888kQS5hmVGHXUgeO6DXoy3ME3vO69MR9+m6NFvPd
 vygg==
X-Gm-Message-State: AOAM531erzG6tPHeFkVfIMjOo1Ok0dpfov5T1FWRO/HMRk0QECCON3iG
 oVc803o55CUwg/Dr5jggRO9dn40GyBkmH7a03dVtmQ==
X-Google-Smtp-Source: ABdhPJxzcuQLYcqNwiRgd9OUa9iJyDgIzkYdOV2WxpgT8JUUtgkn2e7D5MXRvmqwutGF0Tod9i9k+9zXtv98K/8GBdA=
X-Received: by 2002:a67:f3d0:0:b0:34b:b52d:d676 with SMTP id
 j16-20020a67f3d0000000b0034bb52dd676mr6687997vsn.6.1654638706724; Tue, 07 Jun
 2022 14:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-3-imp@bsdimp.com>
 <4279f170-76df-c329-24ec-26e1e68446eb@linaro.org>
In-Reply-To: <4279f170-76df-c329-24ec-26e1e68446eb@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 7 Jun 2022 14:51:36 -0700
Message-ID: <CANCZdfq5L5Q3ePmdF6_ap73h5CGgtc6ZVK0e+tPfUOqW5SKBkw@mail.gmail.com>
Subject: Re: [PATCH 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gleb Popov <arrowd@freebsd.org>, 
 Konrad Witaszczyk <def@freebsd.org>, Jessica Clarke <jrtc27@freebsd.org>,
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000058a8a705e0e298f6"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2b.google.com
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

--00000000000058a8a705e0e298f6
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 2:28 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 6/7/22 13:14, Warner Losh wrote:
> > +void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
> > +        int count, int copy)
> > +{
> > +    struct target_iovec *target_vec;
> > +
> > +    target_vec = lock_user(VERIFY_READ, target_addr,
> > +                           count * sizeof(struct target_iovec), 1);
> > +    if (target_vec) {
>
> Locking the same region twice seems like a bad idea.
>

We unlock the iovec memory in the lock_iovec()


> How about something like
>
> typedef struct {
>      struct target_iovec *target;
>      abi_ulong target_addr;
>      int count;
>      struct iovec host[];
> } IOVecMap;
>
> IOVecMap *lock_iovec(abi_ulong target_addr, int count, bool copy_in)
> {
>      IOVecMap *map;
>
>      if (count == 0) ...
>      if (count < 0) ...
>
>      map = g_try_malloc0(sizeof(IOVecNew) + sizeof(struct iovec) * count);
>      if (!map) ...
>
>      map->target = lock_user(...);
>      if (!map->target) {
>          g_free(map);
>          errno = EFAULT;
>          return NULL;
>      }
>      map->target_addr = target_addr;
>      map->count = count;
>
>      // lock loop
>
>   fail:
>      unlock_iovec(vec, false);
>      errno = err;
>      return NULL;
> }
>
> void unlock_iovec(IOVecMap *map, bool copy_out)
> {
>      for (int i = 0, count = map->count; i < count; ++i) {
>          if (map->host[i].iov_base) {
>              abi_ulong target_base = tswapal(map->target[i].iov_base);
>              unlock_user(map->host[i].iov_base, target_base,
>                          copy_out ? map->host[i].iov_len : 0);
>          }
>

And wouldn't we want to filter out the iov_base that == 0 since
we may terminate the loop before we get to the count. When the
I/O is done, we'll call it not with the number we mapped, but with
the original number...  Or am I not understanding something here...

Warner


>      }
>      unlock_user(map->target, map->target_addr, 0);
>      g_free(map);
> }
>
>
> r~
>

--00000000000058a8a705e0e298f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022 at 2:28 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 6/7/22 13:14, Warner Losh wrote:<br>
&gt; +void unlock_iovec(struct iovec *vec, abi_ulong target_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int count, int copy)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct target_iovec *target_vec;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 target_vec =3D lock_user(VERIFY_READ, target_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0count * sizeof(struct target_iovec), 1);<br>
&gt; +=C2=A0 =C2=A0 if (target_vec) {<br>
<br>
Locking the same region twice seems like a bad idea.<br></blockquote><div><=
br></div><div>We unlock the iovec memory in the lock_iovec()</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
How about something like<br>
<br>
typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0struct target_iovec *target;<br>
=C2=A0 =C2=A0 =C2=A0abi_ulong target_addr;<br>
=C2=A0 =C2=A0 =C2=A0int count;<br>
=C2=A0 =C2=A0 =C2=A0struct iovec host[];<br>
} IOVecMap;<br>
<br>
IOVecMap *lock_iovec(abi_ulong target_addr, int count, bool copy_in)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0IOVecMap *map;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (count =3D=3D 0) ...<br>
=C2=A0 =C2=A0 =C2=A0if (count &lt; 0) ...<br>
<br>
=C2=A0 =C2=A0 =C2=A0map =3D g_try_malloc0(sizeof(IOVecNew) + sizeof(struct =
iovec) * count);<br>
=C2=A0 =C2=A0 =C2=A0if (!map) ...<br>
<br>
=C2=A0 =C2=A0 =C2=A0map-&gt;target =3D lock_user(...);<br>
=C2=A0 =C2=A0 =C2=A0if (!map-&gt;target) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno =3D EFAULT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0map-&gt;target_addr =3D target_addr;<br>
=C2=A0 =C2=A0 =C2=A0map-&gt;count =3D count;<br>
<br>
=C2=A0 =C2=A0 =C2=A0// lock loop<br>
<br>
=C2=A0 fail:<br>
=C2=A0 =C2=A0 =C2=A0unlock_iovec(vec, false);<br>
=C2=A0 =C2=A0 =C2=A0errno =3D err;<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
}<br>
<br>
void unlock_iovec(IOVecMap *map, bool copy_out)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0for (int i =3D 0, count =3D map-&gt;count; i &lt; count=
; ++i) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (map-&gt;host[i].iov_base) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abi_ulong target_base =3D t=
swapal(map-&gt;target[i].iov_base);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_user(map-&gt;host[i]=
.iov_base, target_base,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0copy_out ? map-&gt;host[i].iov_len : 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>And=
 wouldn&#39;t we want to filter out the iov_base that =3D=3D 0 since</div><=
div>we may terminate the loop before we get to the count. When the</div><di=
v>I/O is done, we&#39;ll call it not with the number we mapped, but with</d=
iv><div>the original number...=C2=A0 Or am I not understanding something he=
re...</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0unlock_user(map-&gt;target, map-&gt;target_addr, 0);<br=
>
=C2=A0 =C2=A0 =C2=A0g_free(map);<br>
}<br>
<br>
<br>
r~<br>
</blockquote></div></div>

--00000000000058a8a705e0e298f6--

