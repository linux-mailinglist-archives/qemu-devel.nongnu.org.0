Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC9122B05
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 13:14:58 +0100 (CET)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihBke-0005Ww-Ms
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 07:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhunxun@gmail.com>) id 1ihBju-00054p-Kz
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:14:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhunxun@gmail.com>) id 1ihBjt-00084I-Mo
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:14:10 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37349)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zhunxun@gmail.com>) id 1ihBjt-00083Z-G4
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 07:14:09 -0500
Received: by mail-io1-xd29.google.com with SMTP id k24so9077580ioc.4
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 04:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tonbqllWohf8UCmcVQIAyMXTjQy6DDVwfdYqJkUhvNQ=;
 b=o3RGHNwW62HKlE8SEnJQAavE62f1tcYHAqKXTUe62dgtJApKcsDbiIMoZa+L24f2ts
 6FNOHZQVc8n0UeUviHOM/m8J41z2DgNpvDt2o+3nS8BPGuudrUrYWUtOPZ5lIXvil1Wj
 ZqeY8QV2uaPtg/xbxjgqtA6HeXVxcp6JHKyJKenPeAgX3vxORnJxga57DEcoMDyC+ic1
 BDith5Dbbu5+4CeR65x+wXvj02Kasqyibcl4GCCj9q6oOaugDZmNqi1zixzcAf3VyKfd
 pe8X8LPkvaGBeyjUcw+dYfoyu9QLF0QN0lkwS3IzoU+/NJq2YUu6bylYbxZTfYbnEx9T
 niBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tonbqllWohf8UCmcVQIAyMXTjQy6DDVwfdYqJkUhvNQ=;
 b=TVEzapyzjd1lSdsCil7oyVI3g7oj55FpiXzGtRsh8QIQFWmF55MZMkZkk6pjQuIciu
 J58y3N4f0IKQv28ajf6/SoEllHkslj+t0g/aFUQr7y8LAyvLBhq4mVjMEVWIXT+c+heN
 wUqkQ64TMcBfGdZL7QLNWaC8eHZfvyOIg5rUsH5zZTQaV8oQ58eij809op9nrzuk7jou
 pfTutv8C2ZdaVWOTh6ngmsO1YUhNvSjCJB8uIohT0d2iIrVIvs4Fq01jN0fQE6nluE8S
 t8AI7zOE+3C7QTejLbOp8S8zZcbnxc/k4gv+X0yuvuxeOCjxnUue3pvNKs1t3xkLT9Rf
 z1Ww==
X-Gm-Message-State: APjAAAWPbSQ4XX69IC9wgMeZAD+Vv6naRGXarMr+rM1xrq9QXNLihCkx
 Z47o5E1drKXHF4U5emwuJxDBwr7nJGPs7IbojJFG4NGC
X-Google-Smtp-Source: APXvYqwtD+Zj5ip8gAY9Of+QwHkHZkzlzb6oMH8lCa1b0AxqA7l/JWSZmjgjJ6wXG3np3ydIy/YAyoL9g3LvrpLb4Ds=
X-Received: by 2002:a5d:9512:: with SMTP id d18mr3370196iom.85.1576584847965; 
 Tue, 17 Dec 2019 04:14:07 -0800 (PST)
MIME-Version: 1.0
From: "jack.chen" <zhunxun@gmail.com>
Date: Tue, 17 Dec 2019 20:13:57 +0800
Message-ID: <CADUDsAqN9S_CW2ctfbP-NM-uPocH8mnLHZW2Vpbwof04GnXudw@mail.gmail.com>
Subject: os_mem_prealloc questions
To: qemu <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d24b630599e543b4"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d29
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

--000000000000d24b630599e543b4
Content-Type: text/plain; charset="UTF-8"

hello:
     I found os_mem_prealloc prealloc memory by multiple threads ,and max
threads number is 16,I want do know the reason,why do not use smp_cpus?
(in fact,I also found smp_cpus can not reduce more start time,I just want
to know the reasion)

     thanks!

--000000000000d24b630599e543b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hello:<div>=C2=A0 =C2=A0 =C2=A0I found=C2=A0os_mem_preallo=
c prealloc memory by multiple=C2=A0threads ,and max threads number is 16,I =
want do know the reason,why do not use smp_cpus?=C2=A0<div>(in fact,I also =
found smp_cpus can not reduce more start time,I just want to know the reasi=
on)</div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0=
px"><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><blockq=
uote style=3D"margin:0 0 0 40px;border:none;padding:0px"><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px"><blockquote style=3D"margin:0 0 0 40px;=
border:none;padding:0px"><blockquote style=3D"margin:0 0 0 40px;border:none=
;padding:0px"><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0p=
x"><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><blockqu=
ote style=3D"margin:0 0 0 40px;border:none;padding:0px"><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div><div>=C2=A0 =C2=A0 =C2=
=A0thanks!</div></div></blockquote></blockquote></blockquote></blockquote><=
/blockquote></blockquote></blockquote></blockquote></blockquote></blockquot=
e></blockquote></div>

--000000000000d24b630599e543b4--

