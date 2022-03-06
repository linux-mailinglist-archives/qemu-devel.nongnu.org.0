Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1144CEBE3
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 15:23:28 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQrnD-0006Wq-EW
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 09:23:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stacymatthew44@gmail.com>)
 id 1nQjHy-0003eA-MX
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 00:18:38 -0500
Received: from [2607:f8b0:4864:20::c30] (port=38875
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stacymatthew44@gmail.com>)
 id 1nQjHx-0008VY-5F
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 00:18:38 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 o7-20020a056820040700b003205d5eae6eso13563044oou.5
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 21:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=7lMkeV9Xfn9Eu5H3Oe3Kuo6QtD6is05J70CAl6FLGk4=;
 b=fi4GeggRiYUJQdkOEVFm7Huwa1WL/BhAA/8uLRg7SXqwfNjJ5gwO8QPOMJqMs1syeO
 r7ArROeILyffvH08TcqXMA934eDwTNkLsUYYWgzAGyIfAsWm7JFx+mwEer3+3aE0PREo
 1DK6tBQHWRTnhIf53ViNrozMavDgXaLE39OIszzgV0XYVa5BMJGJ6jcBjD3T3A7C+5j1
 sL5jQ6vZE6Oy3sxtuTysIMJZFgzfCs3pFmY2pFdsxuE7qQJeUHo+mqDJxDhf/tv3FICa
 VUnJoIfUeFyB0qocgnVh5EvmMWv6uXzX+7PjknR1oDb/MUGaRI5KXBl4rPVsHp5Y5qu9
 zQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7lMkeV9Xfn9Eu5H3Oe3Kuo6QtD6is05J70CAl6FLGk4=;
 b=DxgArIJqk6m6u5e/JjXKFW00+ii077myx5pfC2hbYTtKAvBUy5UufZJGH9zNhnGtrW
 R4Yh8Evm0rShfny7FVdDlZ5JtLZAzdu+wUuNJZUTDSWy/UEvkHJ8Iav2HJfoqwfasoud
 hqEjF2dJ06sD6W+VP3maGdsNafE5pLJyvfu5qxKYWzUotH2HlCZ9rgJkdEfEHbFRC11J
 5NlXYED4KqsIG7Pabri855DCMm4ILnu3Fy5ofbyh+Fy9wVYSUB+tW2zlpTN5nmjOxRQR
 kt0WG36b4KzpYVMeX03ujXUS+pNdFYkVW6XOuu0Lw3jab27djxmhAwsiKs289XT7YwN6
 edRA==
X-Gm-Message-State: AOAM531X02RmN8L0fwabn1seYDTfjJ2ZNaUQSgE2pdvTsKWGv2szhDDh
 ZYyoug3pOtDgRYWNM4SXbXeDBOWMWReAbrDSYCGRJ7xvu64=
X-Google-Smtp-Source: ABdhPJxGdnDwCdFTfWSTYxuQgSiVSqc8BixTSZNpaAk8IyEK1E1uDRAvg0hf9OzEiHqfnjCxeu8QYfB4QV40tFLFhYk=
X-Received: by 2002:a05:6870:a90a:b0:da:b3f:3249 with SMTP id
 eq10-20020a056870a90a00b000da0b3f3249mr2600010oab.249.1646543914232; Sat, 05
 Mar 2022 21:18:34 -0800 (PST)
MIME-Version: 1.0
From: Matt Stacy <stacymatthew44@gmail.com>
Date: Sun, 6 Mar 2022 00:18:23 -0500
Message-ID: <CAKMPAK40opFMqqdH1VbVhxr5EqX_iqh4ARbrfnXqJb4ywnrsvw@mail.gmail.com>
Subject: I have a question. - Matthew Stacy
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001d6c7b05d985e12e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=stacymatthew44@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 06 Mar 2022 09:22:14 -0500
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

--0000000000001d6c7b05d985e12e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Qemu Linux Developers,

I=E2=80=99m looking for a solution to keep Hackintoshing a possibly for peo=
ple like
me. I saw a group of people use your program and turned it into UTM a
problem using Qemu, but can emulate .ipsw restores of MacOS that include
the M1 Chip. The thing is UTM can only be run on a Mac Operating System.
They don=E2=80=99t have the program for Windows or Linux. If you guys could=
 make an
option to load .ipsw restores and be able to boot MacOS that would be
great. I really don=E2=80=99t want to lose my Hackintosh and I believe your=
 program
so far is the only program of emulation that can accomplish what not just I
want, but many people want as well. We want to make the impossible,
possible.

Please help me out so many of us Hackintoshers can prove to people that
it=E2=80=99s not the end of Hackintoshing. It=E2=80=99s just that emulation=
 is the =E2=80=9CNew
Way=E2=80=9D of Hackintoshing.

--0000000000001d6c7b05d985e12e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Qemu Linux Developers,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">I=
=E2=80=99m looking for a solution to keep Hackintoshing a possibly for peop=
le like me. I saw a group of people use your program and turned it into UTM=
 a problem using Qemu, but can emulate .ipsw restores of MacOS that include=
 the M1 Chip. The thing is UTM can only be run on a Mac Operating System. T=
hey don=E2=80=99t have the program for Windows or Linux. If you guys could =
make an option to load .ipsw restores and be able to boot MacOS that would =
be great. I really don=E2=80=99t want to lose my Hackintosh and I believe y=
our program so far is the only program of emulation that can accomplish wha=
t not just I want, but many people want as well. We want to make the imposs=
ible, possible.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Please h=
elp me out so many of us Hackintoshers can prove to people that it=E2=80=99=
s not the end of Hackintoshing. It=E2=80=99s just that emulation is the =E2=
=80=9CNew Way=E2=80=9D of Hackintoshing.=C2=A0</div>

--0000000000001d6c7b05d985e12e--

