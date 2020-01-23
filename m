Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CA146CEB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:33:51 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iueUP-0001qd-W4
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iucch-00025R-QC
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:34:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iuccg-0001qJ-5o
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:34:15 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:42070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iuccf-0001oQ-UP
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:34:14 -0500
Received: by mail-ot1-x32c.google.com with SMTP id 66so2693385otd.9
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Si3APmcwJHaxnSgAAuSnn/eIyYPEXg/zE0raJgzRfWU=;
 b=RQdaw0XZrvXEap7+R2lYLZAPFMBThcxTw9px9uoMliEWPEYVH3OBkQZJSDg42tQfY0
 kaIruMPgnSElXojU0N1Nd2uaBabv0ZTEUX5DmQw1K9tRqsinI271lP5KhUaWpZvckfFr
 L0TzOBHEIgvhGrhk8jAl6dTKd+KlssvVn6T1NR3QpdvB0i1Vz7HCWR+M4QZzxDm5S6Jp
 TCPHrmBuozCjLn8LXDc4AM0tx3wNIkbrwB+NgB7liwVxx3XtttaV6iL4cn/MHNkgyxwm
 8kaPF0/uXWedEqtUh7pf1Jz0mk0w7lsrTUamJ/j4BHLTbbq7X+RCKY4ZOECiJoiMeNb+
 iQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Si3APmcwJHaxnSgAAuSnn/eIyYPEXg/zE0raJgzRfWU=;
 b=G3dKcaixg+R9yP+coBt5OLwg+kaCXwK4DLsdZfnDGg5QHyPA3H4vAEU+6Z6RsAOAjV
 F8XyCIJv3TwHCvnd3Ir+ZoutjD6aZpBVRR+5wZ7TZDTPZ7GxEvFTjxQVua0iU1NBwg66
 QuWEZK7JXh25pNgYg/l4BZqDwePRuRDqZ5AsNqRiK893E+hnOWFhFJebgwPmb4cT/e6g
 VCS0mLvs3JY5DmTGqnZjO22xkWpfEgKzt0TvgBRu3QCT86kzQTiNHmDlmWVTbhDxYGuE
 BjsckEHNgKbn7DuLaHbs1tHjG8V4k9ThZj3sWB4iSdxqNuCDgi069nY7dMZGKAojTYrF
 ltmw==
X-Gm-Message-State: APjAAAVHxbf0JD9lVdqlpV3n95a5BGUw7xVr96dpiUDXys38rxu1bdzq
 7PwNhUkm3IEWmGowihTEq0hHsvSrRWdOY6VuoEU=
X-Google-Smtp-Source: APXvYqy/jdevM6trYpTEH3W4czi1Fpw9oE2eeXSjsgSRnCemIQtQuMS3ZQtB0U9QUmz+qK3SvLw5Xo1tZyEyjW9E1Dg=
X-Received: by 2002:a9d:4c94:: with SMTP id m20mr11536931otf.341.1579786452358; 
 Thu, 23 Jan 2020 05:34:12 -0800 (PST)
MIME-Version: 1.0
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 23 Jan 2020 14:34:01 +0100
Message-ID: <CAL1e-=j5WJkV=X+KkfBuS3pjf6z3aJrtu4xpYeVbjEUYiWxxTQ@mail.gmail.com>
Subject: [GSoC/Outreachy QEMU proposal] Extend support for ioctls in QEMU
 linux-user mode
To: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000505bb8059cceb285"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
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

--000000000000505bb8059cceb285
Content-Type: text/plain; charset="UTF-8"

*Extend support for ioctls in QEMU linux-user mode*



*PLANNED ACTIVITIES*

BACKGROUND

There is currently 2500+ ioctls defined in Linux kernel. QEMU linux-user
currently supports only several hundred. There is a constant need for
expanding ioctl support in QEMU. Users use Linux-user mode in variety of
setups (for example, building and testing tools and applications under
chroot environment), and, on a regular basis, efforts by multiple people
are made to fill in missing support. However, these efforts have been
usually done on a piece-by-piece basis, i a limited way covering a
partucular need. This project will take more proactive stance, and try to
improve QEMU before users start complaining.

PART I:

   a) Add strace support for outputing ioctl IDs (the second argument of
ioctl()) as strings rather than numbers - for all platform independant
ioctls.
   b) Add strace support for printing the third argument of ioctl() (be it
int, string, structure or array) - limited to selected ioctls that are
frequently used.

PART II:

   a) Amend support for existing groups of ioctls that are not completed
100% (let's say, filesystem ioctls)
   b) Add support for a selected group of ioctls that are not currently
supported (for example, dm ioctls, Bluetooth ioctls, or Radeon DRM ioctls)

PART III:

  a) Develop unit tests for selected ioctls that are already supported in
QEMU.


*DELIVERABLES*

The deliverables are in the form of source code for each part, intended to
be upstreamed, and time needed for upstreaming (addressing reviews, etc.)
process is included int this project.

The delivery of results can and should be distributed over larger period of
time 2-3 months.


Montor: open (I propose Laurent Vivier)

Student: open

--000000000000505bb8059cceb285
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font size=3D"4"><b>Extend support for ioctls in QEMU linu=
x-user mode</b></font><br><br><br><i><font size=3D"4">PLANNED ACTIVITIES<br=
></font></i><div><br></div><div>BACKGROUND<br></div><div><br></div><div><di=
v>There is currently 2500+ ioctls defined in Linux kernel. QEMU linux-user =
currently supports only several hundred. <span id=3D"gmail-messageContent">=
</span><span id=3D"gmail-messageContent">There is a constant need for expan=
ding ioctl support in QEMU. Users use Linux-user mode in variety of setups =
(for example, building and testing tools and applications under chroot envi=
ronment), and, on a regular basis, efforts by multiple people are made to f=
ill in missing support. However,
these efforts have been usually done on a piece-by-piece basis, i a limited=
 way covering a partucular need. This=20
project will take more proactive stance, and try to improve QEMU before=20
users start complaining.</span><br><span id=3D"gmail-messageContent"></span=
></div></div><div><br></div><span id=3D"gmail-messageContent">PART I:<br><b=
r>=C2=A0=C2=A0 a) Add strace support for outputing ioctl IDs (the second ar=
gument of ioctl()) as strings rather than numbers - for all platform indepe=
ndant ioctls.<br>=C2=A0=C2=A0
 b) Add strace support for printing the third argument of ioctl() (be it in=
t, string, structure or array) - limited to selected ioctls that are freque=
ntly used.<br><br>PART II:<br><br>=C2=A0=C2=A0 a) Amend support for existin=
g groups of ioctls that are not completed 100% (let&#39;s say, filesystem i=
octls)<br>=C2=A0=C2=A0
 b) Add support for a selected group of ioctls that are not currently=20
supported (for example, dm ioctls, Bluetooth ioctls, or Radeon DRM ioctls)<=
br><br>PART III:<br><br></span><div><span id=3D"gmail-messageContent">=C2=
=A0 a) Develop unit tests for selected ioctls that are already supported in=
 QEMU.</span></div><div><span id=3D"gmail-messageContent"><br></span></div>=
<i><font size=3D"4">DELIVERABLES<br></font></i><div><br></div><div>The deli=
verables are in the form of source code for each part, intended to be upstr=
eamed, and time needed for upstreaming (addressing reviews, etc.) process i=
s included int this project.<br></div><div><br></div><div><span id=3D"gmail=
-messageContent">The delivery of results can and should be distributed over=
 larger period of time 2-3 months.<br></span></div><div><span id=3D"gmail-m=
essageContent"><br></span></div><div><br></div><div>Montor: open (I propose=
 Laurent Vivier)<br></div><div><br></div>Student: open</div>

--000000000000505bb8059cceb285--

