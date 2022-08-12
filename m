Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CE0590C15
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 08:46:16 +0200 (CEST)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMOQw-0006Ep-V1
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 02:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oMONw-0004pK-Hi
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 02:43:08 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oMONu-0005od-V3
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 02:43:08 -0400
Received: by mail-vs1-xe31.google.com with SMTP id o123so20458249vsc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 23:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sdKr2AxO0aesGrae4RkePuyC1E+6yvc4uOZSl0QBD10=;
 b=KlnqsqFFpwkWV+aSfThxpt33y8dBYjs9eXEphhoNgBf3W3R9Jmq2C/wPNuWKQxfUCo
 4xz2RQ6vwnRwtuiw4hwPeSmFBSqEnrEGYF2vOZAA0jzFgXojIR0ZK4dHmmb3PdfRVxBN
 OvwSX7yVwVM75LXnYdA572CJJsXMTFVH6YBAK7WCWcQ7fZ8tVdxHbMIaaD0tlE7B/d8U
 DF1zXegHq4g8dQtoVel491i9nOxMP+YmfTZhFes4ao+MCn42zTxrKuc+uLI50Br/PAeW
 J/vTwCO5pg5j8RUtbzz7iPoYLfyq1JZ+KPc6jGflMZJko2BjszraozUfY6SZmMSxI3iJ
 ZLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sdKr2AxO0aesGrae4RkePuyC1E+6yvc4uOZSl0QBD10=;
 b=TDsBvoWgZkr+Mfd64H+1fcyRbYw8ObM77SX0jkgZ+4SV/GYFc/pIyDrO0+1qCZtnGW
 kG4SRehiW00S+/4bSmdtESOapn5rDXtzUE6pNJrZiLPdRfUbDneW2H5b0VEk2Q/wWzFR
 6om7JRia+3D/1/vOxjv7nH+eDGxi0iuNAKqtsuDoVm83myC4Yff09RGsV5cNyAkQ67qh
 0w5VZqskBrw0zF3rppISq1wDTfiAPA0c5afNHMkZCiVOj/7xEQPNM0z7SGaisQih7NvT
 KmjnSmhFZjl7jfCQLdPJjwDCV/3rmOTrJhpF6sdV1ORdYYxMf6jkE8fuoUT4/gnjQNd3
 DlHw==
X-Gm-Message-State: ACgBeo0VjVAMh8MSd0j9Lj5NEU4TBnx0BTIRo9MiMI1EweEjYNGbBM7E
 6PzCgeGGH953S4RgP5wbdkj5AvbFjzwCIm83Y48=
X-Google-Smtp-Source: AA6agR4LrQVx/xW9ZBNI9sO13M8m10XRa0nozRCyRrCSWWPrSlfdEV0H1BM2M/Gcj9ZQmwov1o9c3SoBUikqUAmhvTs=
X-Received: by 2002:a67:c814:0:b0:385:1a6b:7284 with SMTP id
 u20-20020a67c814000000b003851a6b7284mr1363215vsk.15.1660286584900; Thu, 11
 Aug 2022 23:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <Mailbird-b8b59964-b286-46fb-a5ce-ad43ad8c76d0@comcast.net>
In-Reply-To: <Mailbird-b8b59964-b286-46fb-a5ce-ad43ad8c76d0@comcast.net>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 12 Aug 2022 14:42:53 +0800
Message-ID: <CAE2XoE_qESRD6_rN15JaDiLtmnZWsrqsJTdqGkX7W4kR8R+HLQ@mail.gmail.com>
Subject: Re: Missing dll
To: Peter Butler <peter-butler@comcast.net>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001e566d05e605981a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe31.google.com
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

--0000000000001e566d05e605981a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 6:15 AM Peter Butler <peter-butler@comcast.net>
wrote:
>
> In x64 win10 I today I d/l QEMU into new directory. Then navigated to
that dir and=E2=80=A6
>
> qemu-system-aarch64 -boot d -cdrom
f:\Downloads\debian-11.4.0-arm64-netinst.iso -m 2048
>

Where do you download? I think it's because libncursesw6 is not pack into
that packages.
I am using msys2 install qemu, I think that's would be fine, downloading
qemu is third-party's work.

> Error message:=E2=80=A6libncursesw6.dll not found=E2=80=A6
>
> Please help
> Thank you



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000001e566d05e605981a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Aug 11, 2022 at 6:15 AM Peter Butler &lt;<=
a href=3D"mailto:peter-butler@comcast.net">peter-butler@comcast.net</a>&gt;=
 wrote:<br>&gt;<br>&gt; In x64 win10 I today I d/l QEMU into new directory.=
 Then navigated to that dir and=E2=80=A6<br>&gt;<br>&gt; qemu-system-aarch6=
4 -boot d -cdrom f:\Downloads\debian-11.4.0-arm64-netinst.iso -m 2048<br>&g=
t;<br><br>Where do you download? I think it&#39;s because libncursesw6=C2=
=A0is not pack into that packages.<div>I am using msys2 install qemu, I thi=
nk that&#39;s would be fine, downloading qemu is third-party&#39;s work.<br=
><br>&gt; Error message:=E2=80=A6libncursesw6.dll not found=E2=80=A6<br>&gt=
;<br>&gt; Please help<br>&gt; Thank you<br><br><br><br>--<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=
=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<br></div></d=
iv>

--0000000000001e566d05e605981a--

