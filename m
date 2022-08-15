Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77B593A9A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 22:22:33 +0200 (CEST)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNgbY-0005SG-G2
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 16:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <padmajain071991@gmail.com>)
 id 1oNeTc-0002ib-7t
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 14:06:12 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <padmajain071991@gmail.com>)
 id 1oNeTa-000653-N3
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 14:06:11 -0400
Received: by mail-pl1-x641.google.com with SMTP id x10so7010189plb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 11:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=0CVNp7i+A7IIjZdyPfwS9bymjiGyCV/NxmtzpfwUAro=;
 b=dUIGy1duCj2JHATClPQg3XrmGteD4Wf3In8v2bEXOlDPoYukrS7ODEHnYc7FV/vU97
 jQo6Zu9YufErHaNGby/xVAhEwEgaAE9iJGCWGdU0tjngd4okujY0GeFNN2cAZU+Z6uvD
 dMmxzMZlQl+ayntWPL9tF3eBosQOoGEom7qrFNsgH+8tOxDs3dQAIvn3kGThet6Ta0uV
 EloolMDGcxfIpwyjoiOUt75lh73FaUzzSLmOPNfun0KF9pQM4Y0LQyd9CdX1cHuO9Fd3
 +U1cNzWXHSZAkJQiBBYGCGL8aQ8x+o29Gu+4CJi11jph7TCdaBrP4xBVAy8UQjD7fACc
 KhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=0CVNp7i+A7IIjZdyPfwS9bymjiGyCV/NxmtzpfwUAro=;
 b=Yw/PAlD2X8iHRcxggFYkWbKSlLer1izTcR95jjkNnivrLQt/HIPhykObzjV9+G/vHL
 jMYZTLX6+JIodamm8ZqY4yFBiZ92aqbMQNvkLpet9XCyOEDXjPXZK+mWqUQP06M/h71c
 rA8vlGbsZQvJFlIJ2v2I0UKGHWPYdEtzPACAOq7wemxugsIvmBsQrgilKM54zQCOBQ16
 txfXtSDwDYP6FPavL0QG832WvTX7qgL3DblNu+29miWaVSS9jOIXXzXRyzkY7m3MjfnO
 of5w9J8s4z86xrZ0RWdNjrxQjw3Dgu/U9G4hQUWmM7nH5wiWv3aP5P1yBqG7WamdgMDU
 mbqw==
X-Gm-Message-State: ACgBeo2SfHpiYvz/OOgBj4JBJC/m3q08GoB70KaM5czURsJatnYpqr9K
 7fQqy5jTNyyBfXP6Kw67PEt69FA/PcjDDh0rK4SpWAVpX8ODmA==
X-Google-Smtp-Source: AA6agR7aKS+5+FTvoveTixsiP31zaKbwRzUvEqXoUBPIzD9xP9c/u82EbICZH+8RARceJd4WO8asblph8UzizX5LVd0=
X-Received: by 2002:a17:90b:3d0a:b0:1f4:f03c:5f55 with SMTP id
 pt10-20020a17090b3d0a00b001f4f03c5f55mr19719509pjb.103.1660586768931; Mon, 15
 Aug 2022 11:06:08 -0700 (PDT)
MIME-Version: 1.0
From: Jainpadma Jain <padmajain071991@gmail.com>
Date: Mon, 15 Aug 2022 23:35:57 +0530
Message-ID: <CAKBwASM+Z+qib91EWArvnUxhXhCPvwhkBRScQWNJUjSgwHHfOw@mail.gmail.com>
Subject: Issue while making audio passthrough
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007b206f05e64b7cba"
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=padmajain071991@gmail.com; helo=mail-pl1-x641.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Aug 2022 16:14:48 -0400
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

--0000000000007b206f05e64b7cba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hi all,
>           I am trying to do audio passthrough with qemu. I have tried thi=
s
> before as well and it was working fine. Now when I launch qemu with
> graphics and audio passthrough, I am getting below error message and qemu
> launch is failing.
>
> qemu-system-x86_64: iommu has granularity incompatible with target AS
> qemu-system-x86_64: iommu map to non memory area 80000000
> qemu-system-x86_64: iommu map to non memory area c0000000
> .
> .
> .
> qemu-system-x86_64: iommu map to non memory area fed68000Aborted
>
> After this it=E2=80=99s aborting. With graphics passthrough alone, qemu l=
aunch is
> fine . Same way I M trying to do audio passthrough also (have taken care =
of
> unbinding other components in same iommu group of audio and attaching to
> vfio ). Any suggestions?
>
     Thanks
      Padma

>

--0000000000007b206f05e64b7cba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_=
quote" style=3D"width:358px;margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
"><div dir=3D"auto">Hi all, =C2=A0 =C2=A0=C2=A0</div><div dir=3D"auto">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I am trying to do audio passthrough with qe=
mu. I have tried this before as well and it was working fine. Now when I la=
unch qemu with graphics and audio passthrough, I am getting below error mes=
sage and qemu launch is failing.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div dir=3D"auto" style=3D"border-color:rgb(0,0,0)">qemu-system-x=
86_64: iommu has granularity incompatible with target AS=C2=A0</div><div di=
r=3D"auto" style=3D"border-color:rgb(0,0,0)">qemu-system-x86_64: iommu map =
to non memory area 80000000</div><div dir=3D"auto" style=3D"border-color:rg=
b(0,0,0)"><span style=3D"border-color:rgb(0,0,0)">qemu-system-x86_64: iommu=
 map to non memory area c0000000</span><br></div><div dir=3D"auto" style=3D=
"border-color:rgb(0,0,0)"><span style=3D"border-color:rgb(0,0,0)">.</span><=
/div><div dir=3D"auto" style=3D"border-color:rgb(0,0,0)"><span style=3D"bor=
der-color:rgb(0,0,0)">.</span></div><div dir=3D"auto" style=3D"border-color=
:rgb(0,0,0)"><span style=3D"border-color:rgb(0,0,0)">.</span></div><div dir=
=3D"auto" style=3D"border-color:rgb(0,0,0)"><span style=3D"border-color:rgb=
(0,0,0)"><span style=3D"border-color:rgb(0,0,0)">qemu-system-x86_64: iommu =
map to non memory area fed68000Aborted</span><br></span></div><div dir=3D"a=
uto" style=3D"border-color:rgb(0,0,0)"><span style=3D"border-color:rgb(0,0,=
0)"><br></span></div><div dir=3D"auto" style=3D"border-color:rgb(0,0,0)"><s=
pan style=3D"border-color:rgb(0,0,0)">After this it=E2=80=99s aborting. Wit=
h graphics passthrough alone, qemu launch is fine . Same way I M trying to =
do audio passthrough also (have taken care of unbinding other components in=
 same iommu group of audio and attaching to vfio ). Any=C2=A0suggestions?</=
span></div></div></blockquote><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0Thanks=
=C2=A0</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 Padma</div><blockquote c=
lass=3D"gmail_quote" style=3D"width:358px;margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"><div dir=3D"auto"><div dir=3D"auto" style=3D"border-color:r=
gb(0,0,0)"><span style=3D"border-color:rgb(0,0,0)"></span></div></div></blo=
ckquote>

--0000000000007b206f05e64b7cba--

