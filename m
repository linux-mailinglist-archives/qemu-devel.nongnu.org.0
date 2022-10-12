Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E775FC94A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:29:24 +0200 (CEST)
Received: from localhost ([::1]:49570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiebj-0008PO-P7
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oieEb-0003Lq-7n
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oieEP-0005hl-Rc
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:05:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id bv10so23356593wrb.4
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ttdsxqe1BCv5kbTJINwfIADTokOMlF+5K/6lRVYzsbs=;
 b=Wj8c8Ky4I2i3YDGwUnBon0HS1WFMgWON1/6YousJWGI8MWgRUH2HjTzekuPErjImB+
 PiZcl9mDOwY2FQ36+dDDF41n0HbdB0ALYxR5HWR0YFzSi7A3/w6B1IJMVcs2u2wH7JF8
 GIb6gWdtt4bhBd0qR4onzrBz/ViV2i07IKF28TlDxS0zrqVnEovqshfOJrHMicRfZMau
 z7vbAjOWNJUuvHJbffmRD51hAEkmzeTPDixewB/ouVtL6DFhH9S8OFObiXZATrQkZj9a
 ewnDLHLM83kbmBWbWbBkGSkaaMhgsTQJXVp5H0y9MtMm1cAQ2OVZCpO0f4e3l0waYisx
 nr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ttdsxqe1BCv5kbTJINwfIADTokOMlF+5K/6lRVYzsbs=;
 b=TxuzKSkny4yw/4ABl+Tx7xQLs0L1wnTl5VN2d68PARDZGh8hqv3PKEF2AdCcV6iYeH
 AI/6doFolKH6SJXKMtepc0Oi4cX/Foch2OX9CzC7IqyvDCpaiVKuuxvVJtQ86yVjIfN/
 jPuu5r1oelL4X7bijGJ8oMEsn9ZzZvhee37zT17TKhd8un52fK9/ov+ub10/reIZU1Cw
 6XmzC3qU4RIM4FerkysrOgKYTzrZwGqhSz9vSVboDuL4/h+vRkQA0yh0QX1tYFuvi6Np
 ZVEuccmaw+n6sWmL77QI9Y9zMWr/lWXeCe0RANvNMgcIa8iHoPTBwFguGghQDIWEnOtI
 mfZQ==
X-Gm-Message-State: ACrzQf2UgRGRTv2qOcqcia+Aa44nMDWPIUT3sAqK6OUvjtLX5/PwTbOA
 h2jPR3fvMvLjmDob0EZMfvBzu3XZcDmEW9JxNQwhWw==
X-Google-Smtp-Source: AMsMyM7Pj/uxUbDfJHoKBjOlnOCX5g0QQCkp2T5ZIguYbnr7kq/I6G/1EbY8WO+seLD6RXQg6AevVXJnpH97XVTORVs=
X-Received: by 2002:adf:d215:0:b0:22e:479e:8cc1 with SMTP id
 j21-20020adfd215000000b0022e479e8cc1mr19728853wrh.39.1665590715931; Wed, 12
 Oct 2022 09:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao87Dbjc11xE9b2Mj=6VMX5J4LHJ2vt_Kn-SPEHWQ7Gu_g@mail.gmail.com>
 <CAEUhbmU561dwFmVCqZG7WdTUhRtfSR_wB8pa0KP2YVXwyHaZuQ@mail.gmail.com>
 <2564015.mS1nRVYtUv@silver>
In-Reply-To: <2564015.mS1nRVYtUv@silver>
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Wed, 12 Oct 2022 19:05:05 +0300
Message-ID: <CAAJ4Ao_RN=GN1DdrKAicAzBjqJ=Mqn3DokCVhDLKvJr7XTzvXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] error handling: Use RETRY_ON_EINTR() macro where
 applicable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f6f47d05ead88e5f"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=nivanov@cloudlinux.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000f6f47d05ead88e5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!
Execuse me, my fault. Overlooked TFR occurrences in second patch. I will
correct it.

=D1=81=D1=80, 12 =D0=BE=D0=BA=D1=82. 2022 =D0=B3., 18:43 Christian Schoeneb=
eck <qemu_oss@crudebyte.com>:

> On Mittwoch, 12. Oktober 2022 17:17:46 CEST Bin Meng wrote:
> > Hi,
> >
> > On Wed, Oct 12, 2022 at 8:32 PM Nikita Ivanov <nivanov@cloudlinux.com>
> wrote:
> > > There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h which
> > > handles the same while loop.
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/415
> > >
> > > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>
> > > ---
> > >
> > >  block/file-posix.c        | 37 ++++++++++++++++---------------------
> > >  chardev/char-pty.c        |  4 +---
> > >  hw/9pfs/9p-local.c        |  8 ++------
> > >  net/l2tpv3.c              | 17 +++++------------
> > >  net/socket.c              | 16 +++++++---------
> > >  net/tap.c                 | 12 ++++--------
> > >  qga/commands-posix.c      |  4 +---
> > >  semihosting/syscalls.c    |  4 +---
> > >  tests/qtest/libqtest.c    | 14 ++++++--------
> > >  tests/vhost-user-bridge.c |  4 +---
> > >  util/main-loop.c          |  4 +---
> > >  util/osdep.c              |  4 +---
> > >  util/vfio-helpers.c       | 12 ++++++------
> > >  13 files changed, 52 insertions(+), 88 deletions(-)
> >
> > This patch has to be squashed into patch 1 for bisectability, as TFR
> > is already removed in patch 1.
>
> They are intentionally separated: 1st patch replaces occurrences of TFR,
> whereas 2nd patch introduces use of macro at locations where not used yet=
.
>
> Nikita, could you please move those 2 hunks that still had TFR()
> occurrence to
> patch 1?
>
> And please use git's --thread option next time, so that individual patch
> emails are linked to cover letter email (which adds appropriate
> `References:`
> and `In-Reply-To:` email headers).
>
> Best regards,
> Christian Schoenebeck
>
>
>

--000000000000f6f47d05ead88e5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi!<div dir=3D"auto">Execuse me, my fault. Overlooked TFR=
 occurrences in second patch. I will correct it.=C2=A0</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 1=
2 =D0=BE=D0=BA=D1=82. 2022 =D0=B3., 18:43 Christian Schoenebeck &lt;<a href=
=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt;:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Mittwoch, 12. Oktober 2022 17:17:46 CEST=
 Bin Meng wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; On Wed, Oct 12, 2022 at 8:32 PM Nikita Ivanov &lt;<a href=3D"mailto:ni=
vanov@cloudlinux.com" target=3D"_blank" rel=3D"noreferrer">nivanov@cloudlin=
ux.com</a>&gt; wrote:<br>
&gt; &gt; There is a defined RETRY_ON_EINTR() macro in qemu/osdep.h which<b=
r>
&gt; &gt; handles the same while loop.<br>
&gt; &gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issue=
s/415" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/q=
emu-project/qemu/-/issues/415</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Nikita Ivanov &lt;<a href=3D"mailto:nivanov@cloudl=
inux.com" target=3D"_blank" rel=3D"noreferrer">nivanov@cloudlinux.com</a>&g=
t;<br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 block/file-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 ++++++++=
++++++++---------------------<br>
&gt; &gt;=C2=A0 chardev/char-pty.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--=
-<br>
&gt; &gt;=C2=A0 hw/9pfs/9p-local.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++-=
-----<br>
&gt; &gt;=C2=A0 net/l2tpv3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 17 +++++------------<br>
&gt; &gt;=C2=A0 net/socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 16 +++++++---------<br>
&gt; &gt;=C2=A0 net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 12 ++++--------<br>
&gt; &gt;=C2=A0 qga/commands-posix.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +---<br>
&gt; &gt;=C2=A0 semihosting/syscalls.c=C2=A0 =C2=A0 |=C2=A0 4 +---<br>
&gt; &gt;=C2=A0 tests/qtest/libqtest.c=C2=A0 =C2=A0 | 14 ++++++--------<br>
&gt; &gt;=C2=A0 tests/vhost-user-bridge.c |=C2=A0 4 +---<br>
&gt; &gt;=C2=A0 util/main-loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 +---<br>
&gt; &gt;=C2=A0 util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +---<br>
&gt; &gt;=C2=A0 util/vfio-helpers.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++--=
----<br>
&gt; &gt;=C2=A0 13 files changed, 52 insertions(+), 88 deletions(-)<br>
&gt; <br>
&gt; This patch has to be squashed into patch 1 for bisectability, as TFR<b=
r>
&gt; is already removed in patch 1.<br>
<br>
They are intentionally separated: 1st patch replaces occurrences of TFR,<br=
>
whereas 2nd patch introduces use of macro at locations where not used yet.<=
br>
<br>
Nikita, could you please move those 2 hunks that still had TFR() occurrence=
 to<br>
patch 1?<br>
<br>
And please use git&#39;s --thread option next time, so that individual patc=
h <br>
emails are linked to cover letter email (which adds appropriate `References=
:`<br>
and `In-Reply-To:` email headers).<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
<br>
</blockquote></div>

--000000000000f6f47d05ead88e5f--

