Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F040247A414
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 05:27:46 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAH3-0006NJ-Kl
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 23:27:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzAFq-0005Wh-So
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:26:30 -0500
Received: from [2a00:1450:4864:20::129] (port=37778
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pratikp@vayavyalabs.com>)
 id 1mzAFo-0003oH-PY
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:26:30 -0500
Received: by mail-lf1-x129.google.com with SMTP id bq20so17682910lfb.4
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vayavyalabs.com; s=vayavyalabs;
 h=mime-version:from:date:message-id:subject:to;
 bh=8VwSt1FtvGwQp7FS/M/VZg3CO1habK0cVEhWhbio8Sk=;
 b=EA+ipdRu7asaptSplCGVY2eRZg97UwJaYS9FxXAxwZklHm99JNQpmA3m+lpH/3QYes
 iwo68WPtoAp9EVd9pZsosR/ukbBK3+J4dpdBb3UMfqdfE8hZb4STsxCdqi5khzdl/KUA
 YxGefDDBrsU0jyItIdn6SRCmyuE/k/lxU1f9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8VwSt1FtvGwQp7FS/M/VZg3CO1habK0cVEhWhbio8Sk=;
 b=8RPRHFCRcUDgJU8U9WJQVztyXWJmkLOmiNqmCGiqE0bwtuWGa+0DnZCqLb2fwXDjcq
 AqfApZb0ZfpAR+HB2c+wPX95qgMXb0bI1K9P+KgXSYcNvKFS36UuP7DnkaKnwUKpmMjH
 dCbFVd/1tf37wX6LBhTLW0XcIWv9sKgmgxVN+FrL/GxjvbDfOjFp6aXblQVX9xKyoFWd
 lZjcX/bFKJzqskbXn4te5bEnpq6+sfwvb6DG3JVC51AR1NadBOg008CsgDC4bV1R6y62
 svYxtizo8kmpGCW5tTfQj5NvFccj+C/R3PsQjZ3VhW40YBMKDI5G7kKxCvQRCKHQy/2m
 CnEw==
X-Gm-Message-State: AOAM533JmRDAV3hDjGVq/A85bNzU4sHnzkzlyk/iQSgWCK5gZ0fxl7/+
 Xdx1nR+u4PEHTIqM74tBXRspUZX87BgcjFFaEn2si1drHheKmA==
X-Google-Smtp-Source: ABdhPJyghycsmiZfJlBR3OS9+qEup5H+5Y2mUzJNETLQwSyY52WHdqecz1qYPt7FdF0+UYVPGkZsKIkF4X7V4g2bbSs=
X-Received: by 2002:ac2:52b1:: with SMTP id r17mr659327lfm.425.1639974385958; 
 Sun, 19 Dec 2021 20:26:25 -0800 (PST)
MIME-Version: 1.0
From: Pratik Parvati <pratikp@vayavyalabs.com>
Date: Mon, 20 Dec 2021 09:56:11 +0530
Message-ID: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
Subject: Virtio-GPU Xres and Yres seettings
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b7592d05d38c4a82"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=pratikp@vayavyalabs.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000b7592d05d38c4a82
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am working on a Virtio-GPU device (backend) for one of our customer
projects - we are using the Virtio-GPU driver (frontend) to drive our
device. Our device code has been written using Qemu virtio-gpu device code
as a reference. Our device is setting the resolution to 1024x768 as a
response to the command received from the driver (i.e,
VIRTIO_GPU_CMD_GET_DISPLAY_INFO) - I also verified that driver is receiving
the response bytes properly, but the next
command (i.e, VIRTIO_GPU_CMD_RESOURCE_CREATE_2D) that device receive has a
width and height as 4096 and 2160 respectively. The driver is assuming a 4k
display for some reason and I need your help to understand why this is
happening.

Our display is corrupted for the same Xres and Yres misunderstanding
between the device and the driver - Please guide me to understand the
problem. Let me know if you have any questions or need more information.

Thanks & Regards,
Pratik

--000000000000b7592d05d38c4a82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#000000">Hi Team,</div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif;color:#000000"><br></div><div class=3D"g=
mail_default" style=3D"font-family:verdana,sans-serif;color:#000000">I am w=
orking on a Virtio-GPU device (backend) for one of our customer projects - =
we are using the Virtio-GPU driver (frontend) to drive our device. Our devi=
ce code has been written using Qemu virtio-gpu device code as a reference. =
Our device is setting the resolution=C2=A0to 1024x768 as a response to the =
command received from the driver (i.e, VIRTIO_GPU_CMD_GET_DISPLAY_INFO) - I=
 also verified that driver is receiving the response bytes properly, but th=
e next command=C2=A0(i.e,=C2=A0VIRTIO_GPU_CMD_RESOURCE_CREATE_2D) that devi=
ce receive has a width and height as 4096 and 2160 respectively. The driver=
 is assuming a 4k display for some reason and I need your help to understan=
d why this is happening.</div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif;color:#000000"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif;color:#000000">Our display is co=
rrupted for the same Xres and Yres misunderstanding between=C2=A0the device=
 and the driver - Please guide me to understand the problem. Let me know if=
 you have=C2=A0any questions or need more information.</div><div class=3D"g=
mail_default" style=3D"font-family:verdana,sans-serif;color:#000000"><br></=
div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature"><div dir=3D"ltr"><div><font face=3D"verdana, sans-serif"><span =
class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb(0=
,0,0)">Thanks &amp; </span>Regards,<br></font></div><div><font face=3D"verd=
ana, sans-serif">Pratik</font></div></div></div></div></div>

--000000000000b7592d05d38c4a82--

