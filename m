Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA4C4E6649
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 16:48:20 +0100 (CET)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXPhC-0007oa-QF
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 11:48:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thesamprice@gmail.com>)
 id 1nXPea-00070V-KM
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:45:36 -0400
Received: from [2a00:1450:4864:20::235] (port=38449
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thesamprice@gmail.com>)
 id 1nXPeY-00067f-SV
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:45:36 -0400
Received: by mail-lj1-x235.google.com with SMTP id s25so6740191lji.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZRR/40p9YIF6zhmY1n2PaVapWCfUM03R8De4rkWP15M=;
 b=kFl3O/Ikidzf6+CXP8f1rzHNsDO3QnH0+adHYCgoCWN1IovhFTc0o4WW2eM7TCkbiL
 WTnCtp1rnd5Fre3A/Nx+st81NNv9IrGrEaiW+rmMr3VK5cxKbKsvYxWiKwQT4umSaFoI
 zpiKBuK59i+I+UyVmycLzV/XJFD7P9xOFZy4iUyNs3TA/ATVCSfNZz8vIv32VtJohV0J
 TEHse319+IVWOFQO0HCBm0P85qDJlNYn5dp5L9qaQHTvaxQYXwHn/JgFjHlzzI4eZw53
 g89fekA+MBu1Dn71q9jTfVaCrefdcoZ6us/dO1QEa46eRTujU0rR4lzqtpy+HmEqomdi
 05FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZRR/40p9YIF6zhmY1n2PaVapWCfUM03R8De4rkWP15M=;
 b=KdukdnKdvjIagQM+LfXyvySkVzmiIWRjWcZK3J2OCq/U1PN5brM8I90KVykDJV/j6u
 TRvsmvs5LaqBa7Le1cI+oiFVeoS6e4bqAEnw70zYYdeNU+TApajEN9KWfJOrDmhgwbY9
 FO3AW4KOkEZbfiYoE55UFywyt9Jz0w/9P3F2OL4v7QYO7eVq1XXN5zeqcDh2QP1+8u3Y
 Dc9sq15/4ozTaCTEudtDJFWDdHnPfOgGaagPK9T8b36R5U4wSS06SkS4pUy9az9IGIfg
 FMBYJsGefLhoXSSCT424SwLRL4dLvMQlcDQeD9g1hKMBhur1DTOAJ5uD6bLaonkmRyL2
 px1w==
X-Gm-Message-State: AOAM533lrtJsFI9nLqFc6/pTfIkEuqTj/DI8HDu2sVQBI6RQZuGvEKhG
 HfcRUwcOh8Te61tTNpRojK8sz7n+HyaeH/RzZ5zGg15MJVo=
X-Google-Smtp-Source: ABdhPJx/6qd+O664VHnjS6WbiNpXR5vmIW3Pilk2pUdFF0C5sfjMHZAzq89HDH68K1uO24fbQ5U5CqIXEeEMWj0jFwQ=
X-Received: by 2002:a2e:9847:0:b0:244:4deb:70d1 with SMTP id
 e7-20020a2e9847000000b002444deb70d1mr4540786ljj.146.1648136731295; Thu, 24
 Mar 2022 08:45:31 -0700 (PDT)
MIME-Version: 1.0
From: Sam Price <thesamprice@gmail.com>
Date: Thu, 24 Mar 2022 11:45:20 -0400
Message-ID: <CAEekfLZ2iJKTZoqDCusrn+Hvcdxxe9TpyshkU9VvrLAVREBWdA@mail.gmail.com>
Subject: Device driver api
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000069053105daf8bc48"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=thesamprice@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--00000000000069053105daf8bc48
Content-Type: text/plain; charset="UTF-8"

Is there a shared library interface in the works for writing firmware
device models without recompiling all of qemu?

I was reading through
https://sebastienbourdelin.com/2021/06/16/writing-a-custom-device-for-qemu/
but was wondering if there was a shared library approach where I could
build my device driver with some basic functions for getting memory ranges
this library supports / etc and then


https://elinux.org/images/9/95/Jw-ei-elc2010-final.pdf
10 years ago there was a presentation mentioning using dlopen to do thisd o
this type of thing.


-- 
Thank you,

Sam Price

--00000000000069053105daf8bc48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there a shared library interface in the works for writi=
ng firmware device models without recompiling all of qemu?<div><br></div><d=
iv>I was reading through=C2=A0</div><div><a href=3D"https://sebastienbourde=
lin.com/2021/06/16/writing-a-custom-device-for-qemu/">https://sebastienbour=
delin.com/2021/06/16/writing-a-custom-device-for-qemu/</a><br><div>but was =
wondering if there was a shared library approach where I could build my dev=
ice driver with some basic functions for getting memory ranges this library=
 supports / etc and then=C2=A0</div><div><br></div><div><br clear=3D"all"><=
div><a href=3D"https://elinux.org/images/9/95/Jw-ei-elc2010-final.pdf">http=
s://elinux.org/images/9/95/Jw-ei-elc2010-final.pdf</a><br></div><div>10 yea=
rs ago there was a presentation mentioning using dlopen to do thisd o this =
type of thing.</div><div><br></div><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Thank you,<br><=
br>Sam Price<br></div></div></div></div>

--00000000000069053105daf8bc48--

