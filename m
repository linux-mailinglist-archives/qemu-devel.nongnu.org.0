Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAAE306C3B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 05:29:40 +0100 (CET)
Received: from localhost ([::1]:42030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4yw7-0002eg-38
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 23:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l4yvB-0002EF-Fi
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:28:43 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l4yv7-0001Aj-Bo
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:28:40 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l18so3523228pji.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+y0sqyteaixXQpO5a0NpNvbbrnff7j6pEmO8pfWGFOk=;
 b=km97IWkj2qAQq7jz6ERCoKDudDnYuy7CBj1js4366kpYpKp0Qcx2HBAODtjZZq+ChH
 1pUpkwZiAThE12a0vyYJAffNi5F7rGqcUz9pL3eZHOI0hr/3oF7kpPHdFY4HGA76N2vp
 db8SjuUkDE6VBSc6eDgsbVv8TESXJEZUwEOqcZck8XG/v1DbtjK/psuXk9+3gVd42Pfx
 nxeDGGPm4Q1FsQbFYt7AZFC9G3EgTYcoZkqbLO3x0GnBNDG1djuldq/Dz7jgwAbSI0hM
 vA04Icgb078h+fagF8ToNMZNXawGl4GSww3m9fbOFdhXCnkwB1Nng8HvTdFtapzYmqcX
 N8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+y0sqyteaixXQpO5a0NpNvbbrnff7j6pEmO8pfWGFOk=;
 b=FcW6XCb3xlM0EnyG6Ai4m5TA4moADFDWihAq3rnNoHA1t54sB1KJzAAF05D4fQFcX0
 RjiPpGxEH/6A5GHWtHKmXnqZwy61xUJjxBx1sVhzZdtSX/K/o5+bfb8NNfHWkF0vbB0m
 S4uwMcZZLA5cRjs+7ychpPYQKwnPeYR4/0ADTeFrT+Uyn9EisIB+pdeGjOGtl8qjt+Wa
 rnhZ8E6fO2kSs7zoQy+EC5wfjS8D4gyZBywJwY9iwPMym09hIgZFWXx97/QLnsut8yI5
 5fyq6a3mbsM4RgFCrgoVg/RPcZk55EU7NtP03KxRXcseyA9+Cb0JPyRYzwdRQdnfzMuc
 Nsow==
X-Gm-Message-State: AOAM532226ZUIBMDUpkIh6D9jrlm6BVKqs2KKNKIPTsY4RJca61XBLiI
 THPMbA7+PV2KVNT6LDMYC84MidVDcz9En4M52GY=
X-Google-Smtp-Source: ABdhPJyOjgYQ0GzZOFiCWIZ6DBzOvUbaNjmvQMB9hqh1szU2ERNHgH7On8IK9BsfVbnpJSNCeRahbKw1dN9JTLzfkNk=
X-Received: by 2002:a17:902:6b01:b029:da:d295:2582 with SMTP id
 o1-20020a1709026b01b02900dad2952582mr14935646plk.14.1611808115166; Wed, 27
 Jan 2021 20:28:35 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
In-Reply-To: <87v9blmf1x.fsf@linaro.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 28 Jan 2021 09:58:23 +0530
Message-ID: <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000026916005b9ee52b6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000026916005b9ee52b6
Content-Type: text/plain; charset="UTF-8"

Thanks a lot Alex!

> All QEMU devices have two parts, a frontend (which the guest sees) and a
> backend (which is how the data gets to somewhere in the host). Some of
> the command line options in QEMU elide the details for convenience (-nic
> and -drive are examples). The -netdev device is all about configuring
> the backend of the network part for a paired -device front end. There is
> a similar setup for audio (-audiodev) although I'll defer to Gerd's
> expertise on how the two interact.

This helped me understand a bit more about how the devices work. In the
source
code, I found the `virtio-net-pci.c` and `virtio-net.c` files, I think the
pci device is what is visible to the guest.
So `virtio-net-pci.c` should be the front end?

For the realize function, I saw that the `virtio_net_device_realize`
function initializes
the `net_conf` for the device. So I am guessing that the
`virtio_snd_device_realize` function
should initialize the number of jacks and streams a device has, along with
the configuration
for all these jacks and streams?

The thing is I do not understand `net` devices all that well so I get a bit
confused with
what is specific to a net device and what should I actually be worried
about :)

The device initalization step mentions that the jack and streams should be
read and
a query should be made for the config of all jacks and streams. What should
be the
default values of these configurations? I think the realize function is
responsible
for setting these up.

--00000000000026916005b9ee52b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks a lot Alex!</div><div><br></div><div>&gt; All =
QEMU devices have two parts, a frontend (which the guest sees) and a<br>
&gt; backend (which is how the data gets to somewhere in the host). Some of=
<br>
&gt; the command line options in QEMU elide the details for convenience (-n=
ic<br>
&gt; and -drive are examples). The -netdev device is all about configuring<=
br>
&gt; the backend of the network part for a paired -device front end. There =
is<br>&gt; a similar setup for audio (-audiodev) although I&#39;ll defer to=
 Gerd&#39;s<br>
&gt; expertise on how the two interact.</div><div><br></div><div>This helpe=
d me understand a bit more about how the devices work. In the source</div><=
div>code, I found the `virtio-net-pci.c` and `virtio-net.c` files, I think =
the pci device is what is visible to the guest. <br></div><div>So `virtio-n=
et-pci.c` should be the front end?<br></div><div><br></div><div>For the rea=
lize function, I saw that the `virtio_net_device_realize` function initiali=
zes</div><div>the `net_conf` for the device. So I am guessing that the `vir=
tio_snd_device_realize` function</div><div>should initialize the number of =
jacks and streams a device has, along with the configuration<br></div><div>=
for all these jacks and streams?<br><br></div><div>The thing is I do not un=
derstand `net` devices all that well so I get a bit confused with</div><div=
>what is specific to a net device and what should I actually be worried abo=
ut :)<br><br></div><div>The device initalization step mentions that the jac=
k and streams should be read and</div><div>a query should be made for the c=
onfig of all jacks and streams. What should be the</div><div>default values=
 of these configurations? I think the realize function is responsible</div>=
<div>for setting these up.</div></div>

--00000000000026916005b9ee52b6--

