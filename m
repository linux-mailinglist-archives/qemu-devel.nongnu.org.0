Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3355373A7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 04:54:42 +0200 (CEST)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvVYH-0003x2-E2
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 22:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nvVWn-0003Dx-TV
 for qemu-devel@nongnu.org; Sun, 29 May 2022 22:53:09 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:39808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nvVWm-0000Tg-Ah
 for qemu-devel@nongnu.org; Sun, 29 May 2022 22:53:09 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 w19-20020a9d6393000000b0060aeb359ca8so6914196otk.6
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 19:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=D7kIx7MZPVzF38b1JcHt+LnIRWiFlBVvWwA4ouScDgY=;
 b=PTYhXnb7w5ArSTQHaUl+qDKEqFjIrxamujSf7qNuTG4vejDbbKWGn97uaPkwPnqFXv
 ySCQOJM0hUFdmXkxL+c4JpKQJa0fFuvM5FebaHzaA6n6yUYBoB6ZEpxo4JDwC1Yuuc+N
 oQCKIDCfsBHrXETXu6pBZSfwlkzdbjPt/WFmvGcmhgjhTgaOGh8pcEUX5cs1K06osLLN
 FcVjJs0/fr0g2VLYR2Dk0PcOzWgIbV3vaw+mhQ8f4uuKseRzSsgy69RWl3KqtT1tU1RR
 8Uzf4eMKAqNc++u5p9KD1mhiITmhk2SaNYHBsYo6zNl0d4nf/de4EvTZg6DdBM6LLOsE
 x7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D7kIx7MZPVzF38b1JcHt+LnIRWiFlBVvWwA4ouScDgY=;
 b=R1aQRAM4abRFM0ONGeR7BEdU0zvrdz18vLC1qf/zBpQJvZV8F3uuQvJTl+8xvsnQ/e
 juVtsI4QxPCuF+erg2sSNO+mf/cAabUUViUjSOQEwn4G4AjrmXpsm76s5IUulnXppPK5
 z9eTsTyJu+mfeV9dI9cqhSzD8cqG0teEW880OrsfBKnY/CLjVNO+tZbwgkO2qtXHuivw
 DLo62njKAVxlQPH6RLQXOKNK+i7fSMQ8L0haDcvn9ohxzOggfwjqAOsihvYbx87RYK4r
 320UBMNE0sHLLnhDk6UVij2izfZ62LJRVoHbkj79NbewiagYTPptPYpwn71X5ZG8m5vG
 NQWg==
X-Gm-Message-State: AOAM532UNtaxjVIxGNFOgaOk/cGVMOi4t2lcXX4sGS1CQ7QOEtgGPl78
 i2VLnZ7JeHNOYyzzQllJdT7Vrz5SrPQ1LsCiWylagoNl
X-Google-Smtp-Source: ABdhPJwgFvnsPoPkhv4n1XrL7cIGWMNvAydsUZ51O0VzYORwORGMRbErGh8Nu9Z2SAlz8zypmDinlc6Zg/896ABZchc=
X-Received: by 2002:a9d:761a:0:b0:60b:6c4d:414e with SMTP id
 k26-20020a9d761a000000b0060b6c4d414emr3430328otl.25.1653879186579; Sun, 29
 May 2022 19:53:06 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sun, 29 May 2022 22:52:55 -0400
Message-ID: <CAK7rcp9Pa5cEwYuJL3VYDq8kMf9NVVS4DFxfcLu-BPqAezUC1Q@mail.gmail.com>
Subject: Type table?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006ae43805e031c11c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006ae43805e031c11c
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm starting to develop with the surrounding qemu libraries trying to add
the internals of a system target. I am working with the type system right
now, which I do know how to interact with. I think there is like some way
to script or interact with the qemu periphery via a cli. I found this once,
where there was some command that I could enter that would show me the
virtual structure of the guest. I didn't use that much, so I've lost it and
think I need to be pointed to it.

I'm wondering if it would let me introspect the state I need to. The
qom/object.c uses a static singleton to store types. I would also like to
find where that is added to in order to know what was added to it. Can
anyone help me?

--0000000000006ae43805e031c11c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello all,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"a=
uto">I&#39;m starting to develop with the surrounding qemu libraries trying=
 to add the internals of a system target. I am working with the type system=
 right now, which I do know how to interact with. I think there is like som=
e way to script or interact with the qemu periphery via a cli. I found this=
 once, where there was some command that I could enter that would show me t=
he virtual structure of the guest. I didn&#39;t use that much, so I&#39;ve =
lost it and think I need to be pointed to it.=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I&#39;m wondering if it would let me introspect=
 the state I need to. The qom/object.c uses a static singleton to store typ=
es. I would also like to find where that is added to in order to know what =
was added to it. Can anyone help me?<br></div><div dir=3D"auto"><br></div><=
div dir=3D"auto"><br></div></div>

--0000000000006ae43805e031c11c--

