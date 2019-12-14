Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52E11F456
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 22:49:58 +0100 (CET)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igFIT-0003WY-7e
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 16:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1igFH2-0002bN-2s
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:48:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1igFH0-0000M0-Kj
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:48:27 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42475)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1igFGz-0000JG-IV; Sat, 14 Dec 2019 16:48:26 -0500
Received: by mail-ot1-x333.google.com with SMTP id 66so3765943otd.9;
 Sat, 14 Dec 2019 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=22Xie9AzVxk20tNtnNAjSLZmLhAA28fbehMxyVbIO+w=;
 b=OTuq/b2aotnqEf7kTknuq9fvbsX+vNtk/kKWduu0frt0daRER6QdMjxeeCM7OfWmeS
 6l5C14n/4elKQPNYDaAppS2Xr+Uxf8mDBvs+K9kvDAGgeDtrvsk8zjbQQzTMvJk1lQGB
 HKZVuuILvpE7jlO/ewMb3gFVl1lguWYIjqO0/rHh6H54mv5C1kZgeD7UUdDqLLcGTAbi
 YHGZY6FzU0NeK/VB6saG3Psvw9agn8KCSeBjS7qpUHVp56Dc6h61rwa3SQPhAcM+ZNiN
 KAK5UWJBp/GXFgv/c2G2b16FeSF+VAskKHMMkqOb2/+C4U7u8g2O5QBQoDnUHB1H9s4a
 3Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=22Xie9AzVxk20tNtnNAjSLZmLhAA28fbehMxyVbIO+w=;
 b=LZ2ylxBksg4HGweoYPrVhpW715x/cJydLmVxPpnJGOuxTADoOYmXzSKdOC1HCYCkXh
 MnOkniqOLAT2W874jKk09oA0pY0ABlrv6IhaIMv4u30sDD/xlzDyEXcRGDrHdq1x/bIO
 Ol6VphCZB6CSM/IYX/FATWem9lRLvW9NuYY2vuU2N4pn6PO8nh/rHhzV3Ez6BzSh8VA5
 UZr8kE5orueGoRVwRl5GLcM88gjWRsUF53AfLJ8L1QOPtk1Ebh9tBBliSXl3LXf1BmRn
 uMY2UhnpKZ76lf8qbNtdmx5fn2+SrMg6RwBFOA9xLiAJQxoJn0/f5YZ2BVSS7NGCp+Rr
 Cm1Q==
X-Gm-Message-State: APjAAAU/cURf3GUMKWKLhCGmJ6u+Rfvr76/Y8Gq0QNASBKM2WdGkxQLQ
 jLWPqKKxnMJTo9iIdGwfeTuz+Hq0Yp2d6FyO/w5VoA==
X-Google-Smtp-Source: APXvYqwoU94NKUlkZlLqeUQcVXfb/fM1vgLkCA9AIv6rJJ2kAyMmrQqJE4Sr8eKEXUONgjakr+h8TIQxm1zu3sj9AFI=
X-Received: by 2002:a05:6830:1042:: with SMTP id
 b2mr21379234otp.306.1576343854808; 
 Sat, 14 Dec 2019 09:17:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Sat, 14 Dec 2019 09:17:34 -0800 (PST)
In-Reply-To: <cover.1576286757.git.fthain@telegraphics.com.au>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 14 Dec 2019 18:17:34 +0100
Message-ID: <CAL1e-=gwxSDa1NSevcCbjG1r5vg6A49Kg_FP2EL1jW+BMn7Ghw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Fixes for DP8393X SONIC device emulation
To: Finn Thain <fthain@telegraphics.com.au>
Content-Type: multipart/alternative; boundary="00000000000082848b0599ad27cd"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::333
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
Cc: Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Herve Poussineau <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082848b0599ad27cd
Content-Type: text/plain; charset="UTF-8"

On Saturday, December 14, 2019, Finn Thain <fthain@telegraphics.com.au>
wrote:

> Hi All,
>
> There is a bug in the DP8393X emulation that can stop packet reception.
>
>
Can you provide the details of your test scenario?

Thanks,
Aleksandar




> Whilst debugging that issue I found that the receiver algorithm differs
> from the one described in the National Semiconductor datasheet.
>
> These issues and others are addressed by this patch series.
>
> This series has only been tested with Linux/m68k guests. It needs further
> testing with MIPS Jazz guests such as NetBSD or Windows NT.
>
> Thanks.
>
>
> Finn Thain (10):
>   dp8393x: Mask EOL bit from descriptor addresses
>   dp8393x: Clean up endianness hacks
>   dp8393x: Have dp8393x_receive() return the packet size
>   dp8393x: Don't advance RX descriptor twice
>   dp8393x: Update LLFA register
>   dp8393x: Clear RRRA command register bit only when appropriate
>   dp8393x: Implement TBWC0 and TBWC1 registers to restore buffer state
>   dp8393x: Implement packet size limit and RBAE interrupt
>   dp8393x: Don't stop reception upon RBE interrupt assertion
>   dp8393x: Don't clobber packet checksum
>
>  hw/net/dp8393x.c | 80 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 52 insertions(+), 28 deletions(-)
>
> --
> 2.23.0
>
>
>

--00000000000082848b0599ad27cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, December 14, 2019, Finn Thain &lt;<a href=3D"mailto:ft=
hain@telegraphics.com.au">fthain@telegraphics.com.au</a>&gt; wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hi All,<br>
<br>
There is a bug in the DP8393X emulation that can stop packet reception.<br>
<br></blockquote><div><br></div><div>Can you provide the details of your te=
st scenario?</div><div><br></div><div>Thanks,</div><div>Aleksandar</div><di=
v><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Whilst debugging that issue I found that the receiver algorithm differs<br>
from the one described in the National Semiconductor datasheet.<br>
<br>
These issues and others are addressed by this patch series.<br>
<br>
This series has only been tested with Linux/m68k guests. It needs further<b=
r>
testing with MIPS Jazz guests such as NetBSD or Windows NT.<br>
<br>
Thanks.<br>
<br>
<br>
Finn Thain (10):<br>
=C2=A0 dp8393x: Mask EOL bit from descriptor addresses<br>
=C2=A0 dp8393x: Clean up endianness hacks<br>
=C2=A0 dp8393x: Have dp8393x_receive() return the packet size<br>
=C2=A0 dp8393x: Don&#39;t advance RX descriptor twice<br>
=C2=A0 dp8393x: Update LLFA register<br>
=C2=A0 dp8393x: Clear RRRA command register bit only when appropriate<br>
=C2=A0 dp8393x: Implement TBWC0 and TBWC1 registers to restore buffer state=
<br>
=C2=A0 dp8393x: Implement packet size limit and RBAE interrupt<br>
=C2=A0 dp8393x: Don&#39;t stop reception upon RBE interrupt assertion<br>
=C2=A0 dp8393x: Don&#39;t clobber packet checksum<br>
<br>
=C2=A0hw/net/dp8393x.c | 80 ++++++++++++++++++++++++++++++<wbr>+-----------=
------<br>
=C2=A01 file changed, 52 insertions(+), 28 deletions(-)<br>
<br>
-- <br>
2.23.0<br>
<br>
<br>
</blockquote>

--00000000000082848b0599ad27cd--

