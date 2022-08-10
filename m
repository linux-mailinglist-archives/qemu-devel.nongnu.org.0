Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6DF58ECDA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:13:38 +0200 (CEST)
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlWj-0007Pi-Bg
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dankobabro@gmail.com>)
 id 1oLjYP-0003Nx-Q8
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 07:07:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dankobabro@gmail.com>)
 id 1oLjYO-00034t-34
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 07:07:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id j1so17381262wrw.1
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=S5asI9KK1+RsysRkQuErm1as7ovllb7k/alLf//M9Xo=;
 b=ccvClM3Rr5vPYqSfL3JSAPCd/0I1XnVoN/m5kJ2XmNnuSYtqh82Y+9giWZAgglQfJP
 H1m+ZbfoSixHse3SEF098nCqLXSWtFCskG7VeBJm3yGm1mWkzZAojaNKEy9ccbHLJhUg
 Dv5MN5gWNWgjGIyY6vwkyBoSq38hFbuDyZs99UW7hWCQUiQfBWc2wFIxZNy6r6HmdBHh
 897ej31Whu2SecqzcrI6INoDwhCeCOzPHA6cGxpJPOtLKIww7zgjFipDiGyKTICZy+Do
 0+56kUs6vFuI0Sw5iLuo60auo9sCUHjBYFXAJQBdRkXF/2KI6/daFqeL5VO/jNgRl3OX
 0t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=S5asI9KK1+RsysRkQuErm1as7ovllb7k/alLf//M9Xo=;
 b=DoRIHh+/QqxNvpZmKTbG/rXue+InZjfFW7FwsUqWrKysuWfNuheaLZkedlAlVt3ylz
 5feCaIMR7x1YwJGBxvg0Uc2kSUwokTtJfJlTGFaEJNH492xnact52j+8iGVFWfKQJIFQ
 2SjYlNJvfUTtQ8JWUpLMjVHb/kuDsIvMRwGDrcZYyvNo5sNjpNuE1kuIQKIc+5GiDwvX
 PnRI6zLTrKzCfHLkMjxHJ0A1TqfxAk5GViyeNzlX0usSKmJJekH0879xp02V8iGMDsDI
 1XMzgkpBWJhy0egZGgCLwSzbxigCvTzTEPKCgA4z5TzWXWKIEe87FpyPmIZdoz33Zp0Q
 t6qg==
X-Gm-Message-State: ACgBeo0SoVenAVFIFZ1SGVi8eQ8eLAI5h9zYqoS3M7Cu/jorQgpJhRUS
 bxwd9GmolcGNONPmvH+zpsMnQqX3T49zHhpdae8kPO+H
X-Google-Smtp-Source: AA6agR7jOaEByRQOTf3ZZLPnwixGOR8VJEbFmkyuoY1cJVk7PgqPlE5ukRVWBYsWLLFNB/9hZaRwdaE45mw3SlYpI3A=
X-Received: by 2002:a5d:588f:0:b0:220:761a:6894 with SMTP id
 n15-20020a5d588f000000b00220761a6894mr17322905wrf.406.1660129629981; Wed, 10
 Aug 2022 04:07:09 -0700 (PDT)
MIME-Version: 1.0
From: danko babro <dankobabro@gmail.com>
Date: Wed, 10 Aug 2022 13:06:59 +0200
Message-ID: <CADfEUTJ4AvfUnwcWtiBk+V1gXrGt6W8cpxcUMbx_MtociwEC7g@mail.gmail.com>
Subject: Using QEMU for VRChat
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e050ae05e5e10cc0"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=dankobabro@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Aug 2022 09:09:25 -0400
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

--000000000000e050ae05e5e10cc0
Content-Type: text/plain; charset="UTF-8"

Dear QEMU dev team,
Recently a game called VRChat got a security update, implementing Easy Anti
Cheat into their game (pretty much spyware that logs everything happening
on the users PC) which made me want to install their game on a virtual
machine.

The problem now is, that the anti cheat detects if the user is playing on a
virtual machine, but in the official documentation by their dev team there
is a workaround for that, specifically for QEMU, that can be found here:

https://docs.vrchat.com/docs/using-vrchat-in-a-virtual-machine

I simply cant understand what that code (on the given website) does. Does
it open up a backdoor for the anti cheat to access my real pc?

Is QEMU in general a good solution for when it comes to protecting my
actual PC from threats like these, or any other sorts of viruses for
example, since it uses a kernel based VM.

All the best,
David

--000000000000e050ae05e5e10cc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Dear QEMU dev team,<div dir=3D"auto">Recently a game call=
ed VRChat got a security update, implementing Easy Anti Cheat into their ga=
me (pretty much spyware that logs everything happening on the users PC) whi=
ch made me want to install their game on a virtual machine.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">The problem now is, that the anti che=
at detects if the user is playing on a virtual machine, but in the official=
 documentation by their dev team there is a workaround for that, specifical=
ly for QEMU, that can be found here:=C2=A0=C2=A0</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><a href=3D"https://docs.vrchat.com/docs/using-vrch=
at-in-a-virtual-machine">https://docs.vrchat.com/docs/using-vrchat-in-a-vir=
tual-machine</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">I simpl=
y cant understand what that code (on the given website) does. Does it open =
up a backdoor for the anti cheat to access my real pc?</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Is QEMU in general a good solution for when =
it comes to protecting my actual PC from threats like these, or any other s=
orts of viruses for example, since it uses a kernel based VM.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">All the best,</div><div dir=3D"auto">=
David</div></div>

--000000000000e050ae05e5e10cc0--

