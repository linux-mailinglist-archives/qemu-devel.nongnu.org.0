Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BFD4655DB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 19:52:47 +0100 (CET)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msUik-0001d3-C5
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 13:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1msUgq-00080y-1u
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:50:48 -0500
Received: from [2607:f8b0:4864:20::92d] (port=42741
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1msUgo-0003Go-Jg
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:50:47 -0500
Received: by mail-ua1-x92d.google.com with SMTP id t13so51099615uad.9
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 10:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=3+xSEUCaYMb3WQBYfduZ3A3xczttEM3qNhUWeCJ8YIg=;
 b=Oj/kLDpH2p+78GVIQ2OkYVystUtwu+q2V4+5L0jOF2JHfbJ+yKtbm/gH4+HBwTzgpI
 m76nkDEL6jvYREHPbKBJIKOncRM2PlkHGveDV5AwF9w2dtneTv0IFfskBE1i4epqTeCX
 Cy8HmnLOxLY4LdXJx+5phAVi7xDsPKp6YLkhzP1k7zURFotWRT4WBp/24JDpH+bn7wnR
 Kg4MDCspbLKWXcs1PvUjCKjP76+AmeDA+wAZNQMLWlFkSDPb63S6O5uRZz1vd5bpKc9Z
 ySRm+YYJKauW9ET2ld/IsniGzREp1sxD0zCLV/Fk8MajyNYFtQ0akE8gq+8PXdvqZCUP
 KfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=3+xSEUCaYMb3WQBYfduZ3A3xczttEM3qNhUWeCJ8YIg=;
 b=Ft4eyLsg6RGUyI66M0fFHp8Asz9x7QMyQWZtgtAfDyJ7lKL/QyFJ0+om5V5mrIBIJq
 +VvXuG8AEQsdnY2fEWGuxWr2kus8MSFy1CXCL6FQOXUD/IWPJtViOgpZid1C25t2Kyb3
 bu6gNYWkIlIv/RzDuHVaEQ7LTuN08E55AsjoZjH2Tjtr3ke+4gt80u+0YhDI1nP4flHu
 SC3ewuwJU71fgCZuVqLRnfbonakky503px2EKT9FHu7OxUfx/fPlsfhlrtcZx22F88aB
 b/tUzMqkVjYsw7+80fVzcbTbLwr1+SHEUu6Ykq7HRUpNo/DpHHLl8+tae1YJLYeQPkD+
 NBFA==
X-Gm-Message-State: AOAM533Vo/62jSJHMdjzsWTtfhEI5vN8RmV6WO5O6LhOFJJ07YdHIb81
 VwXvS9yCKcYkUfPHVvb/qdqwY9aXLZgjGwQGQzc=
X-Google-Smtp-Source: ABdhPJw9moQnVFf+iHE4LIzjBbCo+Z6Go4HOQYLJcooZIcJ9i/TSJG0hJOzTrOzoIXHC1XDledG/jFJJGRMeR4r2McQ=
X-Received: by 2002:ab0:70ce:: with SMTP id r14mr9737712ual.76.1638384645319; 
 Wed, 01 Dec 2021 10:50:45 -0800 (PST)
MIME-Version: 1.0
References: <CAE2XoE-RgL3762rVVjCmTajrPea2-5kcOaSj=qWsa3oHiEP+jw@mail.gmail.com>
 <20211124110552.inssty5eki6v6ywn@sirius.home.kraxel.org>
In-Reply-To: <20211124110552.inssty5eki6v6ywn@sirius.home.kraxel.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 2 Dec 2021 02:50:34 +0800
Message-ID: <CAE2XoE8xKf-p3wZZYkXDEUNubQTR==4ukKSpcCzzo2uuwO0YBw@mail.gmail.com>
Subject: Re: How to enable virgl in headless mode?
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ca337805d21a2609"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca337805d21a2609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 7:06 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> qemu -display egl-headless

Thanks a lot, I tried this, and it's forced me to provide  rendernode
option like this:
```
-display egl-headless,rendernode=3D/dev/dri/renderD128
```
My question is what I need to do to remove the need of rendernode, because
I wanna getting egl-headless to be usable on Windows.

>
> take care,
>   Gerd
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000ca337805d21a2609
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Nov 24, 2021 at 7:06 PM Gerd Hoffmann &lt;=
<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br>&g=
t;<br>&gt; qemu -display egl-headless<br><br>Thanks a lot, I tried this, an=
d it&#39;s forced me to provide=C2=A0

rendernode option like this:<div>```<br>-display egl-headless,rendernode=3D=
/dev/dri/renderD128<br>```</div><div>My question is what I need to do to re=
move the need of rendernode, because I wanna getting egl-headless to be usa=
ble on Windows.<br><br>&gt;<br>&gt; take care,<br>&gt; =C2=A0 Gerd<br>&gt;<=
br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=
=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerel=
y,<br>Yonggang Luo<br></div></div>

--000000000000ca337805d21a2609--

