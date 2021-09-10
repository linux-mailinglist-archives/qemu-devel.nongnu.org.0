Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D480F406CD9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:23:48 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgVP-0008SY-US
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mOgTX-0005j3-Ku
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:21:51 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mOgTV-0007vn-Q6
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:21:51 -0400
Received: by mail-qk1-x72d.google.com with SMTP id y144so1869049qkb.6
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=lH9PA6PRW7H6tMvhGEY2MuydTGodjOlWAKHaJkoqv2g=;
 b=g2moUGczaFZJTrSHLf4gvi1Qnv7j3jdmgxx1OBwarHRhnDISowLoEVUoHvCpqtt2zP
 gGB9/nt/KVaiPqvF9BFZ/F8WbSvjEczL8UQ/2jGRl3i9GJqAHxpIWHUT+gfvIRzGOZR6
 D2pmYbKrkEw5+KLA0ezm3KlYtd8GQ2Rz54nuv1bNIvqvsv0Vptxuiz9dbAftAC6Wtaf6
 L6VPkq3merKwKv7V+bZXSZhno1JJGR6K9w43RO7jmZCEyakrkIeXs17wbKUzdGOgJ4R3
 huwpTYmbtnvVcFLUEDhp0WRjHH3sohSwb3r23HewQVRx1MB9ysQtb4WseDAqZ0LEJU6G
 qNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lH9PA6PRW7H6tMvhGEY2MuydTGodjOlWAKHaJkoqv2g=;
 b=vwHr9b0yItHbWWLUXQF/OxYD6G82WK94uTONWXkbl72dsN7cb8BSdNLd4EpccORi+z
 bJ9Y8DaofEk1vDmWL54kyUSV+5nRs7c/5kU9NRojCgyH+Ixv1bTRg6GD7UvkWQtMzFNa
 a9YGcWhgt7rEqOFYg5dO66/WW35LVrEz2pYCjYtj/W2zDODRXU5SpKyqtpUKNQZoTPwh
 d9dSYN7WgziAyyRQ7D7VXpw6PkTbfVumRwtbd75rFCzJw2fa4ZyZiCOMSvmzh+oYv1m5
 LZArDTZ45LWF7DYgIvY6omJ82tRKYGf7oMtJ9wGntN3qlaqzXKMAOXn8qxulSK4FypEC
 1UCw==
X-Gm-Message-State: AOAM5314d2IykewTGR6wYUSLvh+wDu5dKNuQjtWV6+rfUmLx9uebpJlK
 5uxBfzTMAQA0I6VTonN4mDbg0vZS1IPEIinxhah25XzkywsQ6Q==
X-Google-Smtp-Source: ABdhPJyvTcSLnC3DAViEut58VHAj6hSS6Fo+vigd7xHtsZvwTE8zZaVVlyhTd1CVCgjpFwtof8nd1QF+/9TPy3fNPjg=
X-Received: by 2002:a37:9e55:: with SMTP id h82mr7444784qke.42.1631280108625; 
 Fri, 10 Sep 2021 06:21:48 -0700 (PDT)
MIME-Version: 1.0
From: Hinko Kocevar <hinkocevar@gmail.com>
Date: Fri, 10 Sep 2021 15:21:37 +0200
Message-ID: <CACOP0z-956f0eBdv5wdfqWKT140_mSTW3GwJ1fQ5WEDATB=2Aw@mail.gmail.com>
Subject: Adding IO memory region to mipssim
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000067612805cba3ff17"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=hinkocevar@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000067612805cba3ff17
Content-Type: text/plain; charset="UTF-8"

I'm trying to add an I/O memory region to mipssim machine to emulate a MMIO
region used by the u-boot loaded as BIOS image. I can confirm that the
machine starts and loads the BIOS, starts execution but hangs due to
unhandled IO access as described below.

The region should be at 0xB8810000, of size 0x10000.

I've added these lines of code to mispsim.c mips_mipssim_init():

    my_state *s = g_malloc0(sizeof(my_state));
    memory_region_init_io(&s->mmio, NULL, &my_ops, s,
                         "mips_mipssim.foo", 0x10000);
    memory_region_add_subregion(address_space_mem, 0xB8810000LL, &s->mmio);

All goes well, the machine starts, and I can see the newly added region in
qemu monitor info mtree output like so:

    00000000b8810000-00000000b881ffff (prio 0, i/o): mips_mipssim.foo

With some tracing enabled I see this error:

 Invalid access at addr 0x18810104, size 4, region '(null)', reason:
rejected

I know the u-boot is making request to 0xB8810104 and not 0x18810104. I
also can see 0xB8810104 address being handed to io_writex(), but mr_offset
becomes 0x18810104 here:

  mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;

What is going on?

FWIW, I can place my emulated memory region at 0x18810104, but would like
to understand the behavior above.

Thanks!
//hinko

--00000000000067612805cba3ff17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m trying to add an I/O memory region to mipssim mach=
ine to emulate a MMIO region used by the u-boot loaded as BIOS image. I can=
 confirm that the machine starts and loads the BIOS, starts execution but h=
angs due to unhandled IO access as described below.<div><br><div>The region=
 should be at=C2=A00xB8810000, of size 0x10000.</div><div><br></div><div>I&=
#39;ve added these lines of code to mispsim.c=C2=A0mips_mipssim_init():</di=
v><div><br></div><div>=C2=A0 =C2=A0 my_state *s =3D g_malloc0(sizeof(my_sta=
te));<br>=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio, NULL, &amp;my=
_ops, s,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mips_mipssim.foo&quot;, 0x10000);<br>=C2=
=A0 =C2=A0 memory_region_add_subregion(address_space_mem, 0xB8810000LL, &am=
p;s-&gt;mmio);<br><div><br></div><div>All goes well, the machine starts, an=
d I can see the newly added region in qemu monitor info mtree output like s=
o:</div><div><br></div><div>=C2=A0 =C2=A0 00000000b8810000-00000000b881ffff=
 (prio 0, i/o): mips_mipssim.foo<br></div><div><br></div><div>With some tra=
cing enabled I see this error:</div></div></div><div><br></div><div>=C2=A0I=
nvalid access at addr 0x18810104, size 4, region &#39;(null)&#39;, reason: =
rejected<br></div><div><br></div><div>I know the u-boot is making request t=
o 0xB8810104 and not 0x18810104. I also can see 0xB8810104 address being ha=
nded to=C2=A0io_writex(), but mr_offset becomes 0x18810104 here:</div><div>=
<br></div><div>=C2=A0=C2=A0mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_=
PAGE_MASK) + addr;</div><div><br></div><div>What is going on?</div><div><br=
></div><div>FWIW, I can place my emulated memory region at 0x18810104, but =
would like to understand the behavior above.</div><div><br></div><div>Thank=
s!</div><div>//hinko</div><div><br></div></div>

--00000000000067612805cba3ff17--

