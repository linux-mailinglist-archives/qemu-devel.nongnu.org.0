Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C3446D9A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 12:26:04 +0100 (CET)
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjJpj-0003R5-5B
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 07:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mjJof-0002ki-Uh
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:24:57 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mjJod-0001mh-GG
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 07:24:57 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so4048320pjb.1
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 04:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bLA9ApXP4MVMyJSAkbUs5ISsSXfl2ajA8OpG8XF3x0Q=;
 b=dA1jF3MjTXvtO+C0JqEyk+Ija6S0dEV9l6rEMphOlyxezayJuG8sIn10tLSOz1SGhv
 s7F7hLrMSJ/5YiD6ly/fjbbuRLBDgywZ9IdozoC9aDN3O9YUZTYTeq7oE/JQE+v7cKDB
 AASTqw9r+pnjNow0jK6nW3Jnd/JWIXAN+PKEbHqvx3P0vKauyTgeIaSSpz64sCu1w+gW
 4zSrJ4GLILWduwIpvZlO86AJaxoYKaoEFx5RfeSaAsxcfFPJcJcmO/ocJGYuPBcW8W34
 vKD0hYo+vDK+QjY3S9bIoa9Y9vBWutaJfeibBv8lHga+M8XNlRORyguJIs8Zd3YoPvz6
 sIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bLA9ApXP4MVMyJSAkbUs5ISsSXfl2ajA8OpG8XF3x0Q=;
 b=vkgo74DDQiPOaOCLCe9kvR6NUkaHeqy9q5fg/OiLCxApHH8s0OQb74rAvSynvHW6o4
 HLjhSuj8MLLS4W1LPBoXxtLe98oxKfiPMJXphN2V3ZGGZ9mFU84hszzNU812M9+MoVAv
 3JxCL6af7EKBBsg8nlmx+HAuFOlIpwj92Mk7MybpwVbIxftX0sge8b08dTJZDQDPzqXe
 AsK4b3xWdegg/hdlnRl6BChtPvNhB2RhwlKM4zGXGM464UtrBCfSPLvOZJ9C6VEUunIz
 hPxIJ+OzZ4mXTFPVsU96/mj9el784q8cChxh5ClaK+rdUwTeuJuL6j2Sipx0wrCqAO/V
 sMQg==
X-Gm-Message-State: AOAM532CEmSeBRE6LMJNhj5fCB5q5TQtf/h754nMwWjbi8aOMecFtd0O
 Eo4S0vnz319fy7J8Wzf29/ucemG7eoDHUnuUe/URjKj5pa0=
X-Google-Smtp-Source: ABdhPJwtdtqEo7ZLlJJfY+So1nf8JYxCTWBgyj2Q24CHA3U6vyz3jFbtGtQzYXoSs/WFg1mGyr9uvPmiPjz77Aqxjn4=
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr11344829pjb.157.1636197893429; 
 Sat, 06 Nov 2021 04:24:53 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 6 Nov 2021 11:24:41 +0000
Message-ID: <CAJSP0QWvz3TQOD3kmiLYKk_REgzXzukpWT3G-ZH6VknXf_UWmw@mail.gmail.com>
Subject: Lei: a new tool for filtering patch series
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000385ca305d01d02a0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000385ca305d01d02a0
Content-Type: text/plain; charset="UTF-8"

Hi,
lore.kernel.org has been archiving qemu-devel for some time. You can use b4
(https://pypi.org/project/b4/) to easily apply patch series. Now there is a
new tool called lei that could be of interest to the QEMU community.

lei let's you query the mailing list for patch series that match queries
like specific filenames or functions touched by a patch. It keeps track of
patch series that you've already downloaded so you can see just the new
stuff.

Instead of adding "R:" entries to the MAINTAINERS file in qemu.git you can
now do that locally using lei.

I haven't tried it yet but it seems like a useful tool!

https://people.kernel.org/monsieuricon/lore-lei-part-1-getting-started

Stefan

--000000000000385ca305d01d02a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto"><a href=3D"h=
ttp://lore.kernel.org">lore.kernel.org</a> has been archiving qemu-devel fo=
r some time. You can use b4 (<a href=3D"https://pypi.org/project/b4/">https=
://pypi.org/project/b4/</a>) to easily apply patch series. Now there is a n=
ew tool called lei that could be of interest to the QEMU community.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">lei let&#39;s you query the mai=
ling list for patch series that match queries like specific filenames or fu=
nctions touched by a patch. It keeps track of patch series that you&#39;ve =
already downloaded so you can see just the new stuff.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Instead of adding &quot;R:&quot; entries to t=
he MAINTAINERS file in qemu.git you can now do that locally using lei.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I haven&#39;t tried it yet b=
ut it seems like a useful tool!</div><div dir=3D"auto"><br></div><a href=3D=
"https://people.kernel.org/monsieuricon/lore-lei-part-1-getting-started">ht=
tps://people.kernel.org/monsieuricon/lore-lei-part-1-getting-started</a><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Stefan</div></div>

--000000000000385ca305d01d02a0--

