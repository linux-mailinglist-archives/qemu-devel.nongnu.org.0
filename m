Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E561B8761
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Apr 2020 17:29:23 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSMk5-0001Eg-PC
	for lists+qemu-devel@lfdr.de; Sat, 25 Apr 2020 11:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luoyonggang@gmail.com>) id 1jSMjJ-0000gS-IN
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 11:28:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <luoyonggang@gmail.com>) id 1jSMjI-00016V-S3
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 11:28:33 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1jSMjI-000161-CS
 for qemu-devel@nongnu.org; Sat, 25 Apr 2020 11:28:32 -0400
Received: by mail-lf1-x12f.google.com with SMTP id x23so10204052lfq.1
 for <qemu-devel@nongnu.org>; Sat, 25 Apr 2020 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=pJwPjlLqpCoovN01X5i5GatzEy+4Ec2f0pUOU6aMLa8=;
 b=a2BD/WT0al9aR+zyvj/L4PbuK39ySltb2aFx3arbhEu7E9FpLD/yS46xQD9USA/s/p
 laAWH9HTg499tfTkPspVcJGiE6Fa92nPoqGJjeSTcxsOVAx6JXljBf7hbPfZ0IdsULCp
 ESJXRpT6CaT9+FSDgNulMN0P3x+/K8R42kg/KZIcu1y1DGbF9sNmvuR1LxBZ7rMfkIGw
 sq8y7FWLIvP8PmJ2nhLTHAPYhq4PkAK0F+B40WS3Si+pyl0WiNHRP0IzPCsiCAwyzzmM
 lRQoEa8JOa4jjcXEOnIocTeGWA01DzVDEX6842JPosX6njZzex9cxFN8Mb2SVV9M6Q2i
 zfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=pJwPjlLqpCoovN01X5i5GatzEy+4Ec2f0pUOU6aMLa8=;
 b=N05pK4mT/IQvenemHMSSopG0RQyQYrPfR5gW0+Wl46JUyYosLeWHr/BQtA+x9lMa/Q
 BYGXRPKdkg8AcpBrYUlA5V4YqEjx2BBCT2303ddWOqAHododlNXUyCKl6YE7+3cfRZ+R
 t+1WauG20+5Tu+JQvVd3/FIN70Nt0D6iyKSZqpaN4Yb7NDmwfAsULhjw0uUHnn6Fl4wS
 4P2EHfcY0KU68rpBKCfxpmUEOYEW3OCmvxP+OOd42XrOtYK6hLWMPe4NFuitrxKHWHmB
 X0DLkS8GtedU+7opqhabdD0unnKLHBu4Y1drRCab3fnkCs+ggxnRGPinAWlWUI+9EWBG
 w4lA==
X-Gm-Message-State: AGi0PuaierYa834zkkOQ3akmRQNK29TS0PiuKRjcRhWyKypGz2Y/RfYd
 7rmbnrroQ1xpJRKD3vglrAZOo5tOFMvFvqTTAiUaDcj6BF4=
X-Google-Smtp-Source: APiQypLv1r27OSQElb6CItBRh9Zp+LCuQRiw7MK7rTouk786OHPkwE/xnQ+8y0NjfcNos/N7AFNYOu5UwXv/BAG3Awo=
X-Received: by 2002:ac2:4c39:: with SMTP id u25mr10014122lfq.54.1587828509306; 
 Sat, 25 Apr 2020 08:28:29 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sat, 25 Apr 2020 23:28:18 +0800
Message-ID: <CAE2XoE9FP=5SdGZKNAv5ZqvPR-go59eWP4pPKTTuNYCKUHe4xA@mail.gmail.com>
Subject: The -icount option document are confusing
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000042f6b805a41f2214"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x12f.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::12f
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000042f6b805a41f2214
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

-icount [shift=3DN|auto][,rr=3Drecord|replay,rrfile=3Dfilename,rrsnapshot=
=3Dsnapshot
]

When the virtual cpu is sleeping, the virtual time will advance at default
speed unless sleep=3Don|off is specified. With sleep=3Don|off, the virtual =
time
will jump to the next timer deadline instantly whenever the virtual cpu
goes to sleep mode and will not advance if no timer is enabled. This
behavior give deterministic execution times from the guest point of view.

I wanna to know what's the meaning when sleep=3Don, and what's the meaning
when sleep=3Doff

--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000042f6b805a41f2214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><dt style=3D"background-color:rgb(245,245,245);padding:0.5=
em"><samp style=3D"font-family:&quot;Roboto Mono&quot;,monospace">-icount [=
shift=3D<var>N</var>|auto][,rr=3Drecord|replay,rrfile=3D<var>filename</var>=
,rrsnapshot=3D<var>snapshot</var>]</samp></dt><dd><a name=3D"index-_002dico=
unt" style=3D"color:rgb(0,0,0);font-family:Roboto,sans-serif;font-size:14.6=
667px"></a><span style=3D"color:rgb(0,0,0);font-family:Roboto,sans-serif;fo=
nt-size:14.6667px"></span><br class=3D"gmail-Apple-interchange-newline"></d=
d><p style=3D"color:rgb(0,0,0);font-family:Roboto,sans-serif;font-size:14.6=
667px">When the virtual cpu is sleeping, the virtual time will advance at d=
efault speed unless=C2=A0<samp style=3D"font-family:&quot;Roboto Mono&quot;=
,monospace">sleep=3Don|off</samp>=C2=A0is specified. With=C2=A0<samp style=
=3D"font-family:&quot;Roboto Mono&quot;,monospace">sleep=3Don|off</samp>, t=
he virtual time will jump to the next timer deadline instantly whenever the=
 virtual cpu goes to sleep mode and will not advance if no timer is enabled=
. This behavior give deterministic execution times from the guest point of =
view.</p><div><br></div>I wanna to know what&#39;s the meaning when sleep=
=3Don, and what&#39;s the meaning when sleep=3Doff<br class=3D"gmail-Apple-=
interchange-newline"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 =E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yo=
urs<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<br></div></div>

--00000000000042f6b805a41f2214--

