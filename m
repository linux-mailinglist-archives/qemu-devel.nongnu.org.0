Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658DE2CC5E2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:53:39 +0100 (CET)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXFy-0007ZI-FZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1kkXFD-00078e-CL
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:52:51 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:46196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1kkXFB-0003jB-Ha
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:52:51 -0500
Received: by mail-ua1-x92b.google.com with SMTP id k12so794981uae.13
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=f8LR83ii1ijzS3Kj2N25wqMiKzKloWqa09ErwthdmFQ=;
 b=WImpiiykquRCNav72g5RWSGRjV/c9urNdVYsky97E5JpRtg1KB5b9I1mxt+YVLE5Y4
 4ACCIRomAXHGIzY7L/lPGuCuX+TwvDXpMZWys+AZcAA28urd2nHaZvGBSVoPaPa/U2mJ
 aF4XVqFN24SeMpUZmSSJxPHZaIKYsj9BkDoMZZ+38dbiTMbe52DsPhHZgB4G/S1fBVNE
 WaWWaT0JZQXQyPEGTznPaUxlU0Uq4o3IJ2JMrMPgs4VQb2i/+EaXqxVwr6EysFwbYZzO
 Ue/UQZoBPdMtkz1jxi7kvlhHiSa+HehzpVxDS9np5nYOc9m4Cy7zNopJLhlgBcKiigxI
 xvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=f8LR83ii1ijzS3Kj2N25wqMiKzKloWqa09ErwthdmFQ=;
 b=sAVWulE7gUQUZa4kgmWGGYe/s3u0QSawr9MIZZ3ewF4P2KXZnyhbIXQQB/SG8YoMei
 YbrpDa+TBWZFks1XSeMs0aLovLIF3chuCJvNbXEYKsge6FNfWHACJtacDKuodfjkaw1w
 t3Ab2oVwqcq7CkA4bpJREhns19y1EL9fT8eHH9UCGxAoXC+PLtAHieoE2t5nW6xwy1lO
 MXaF9gOPppkWtyNPvDHMaNP470DCuUD6oGuNHACXNZkt5yhfW8A/x08h1fwuddJ14ie6
 2oPBjnvN3EMM1fcbgAYxSZkgJ22cpFX2UzSpSqfcbHYb36pNI6BQAv5ssEbih/TnjkCg
 JDmw==
X-Gm-Message-State: AOAM532+fmZoNQZ97fm5/fhmHysTWB3Be7JqPP046zoiw7BE2kncpxMH
 YBaF6pl0Uxk36BYq4F/PxQ1b0J/fkc/hySCsqOAMbOjvmpGF+uLJ
X-Google-Smtp-Source: ABdhPJzOEJcQScJ/Zv5xEXKn6DRCs2W2zt191Ts7tFaX03z5X5n1lwqWiwui4xQQvxnpwZakrAXk3oKwRw8MIb6jdjg=
X-Received: by 2002:ab0:3b01:: with SMTP id n1mr2934107uaw.6.1606935167826;
 Wed, 02 Dec 2020 10:52:47 -0800 (PST)
MIME-Version: 1.0
From: Doug Evans <dje@google.com>
Date: Wed, 2 Dec 2020 10:52:11 -0800
Message-ID: <CADPb22T6ML4hzOaa7Y1K8X-2vB6j-7=JJpYdtuDMwv+889fLpg@mail.gmail.com>
Subject: [DISCUSSION] How to set properties of non-pluggable devices?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000db6a4405b57fbf9e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=dje@google.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000db6a4405b57fbf9e
Content-Type: text/plain; charset="UTF-8"

Hi.

Suppose I want to set a property of a non-pluggable device that cannot be
set after the device has been realized (e.g., I can't use qmp to set the
property after QEMU has started).
Being non-pluggable means I can't use "-device foo,bar=baz" on the command
line.
[But I can use "-device foo,help" to list its properties :-)  (if I also
specify -M bar) ]

How do people do this?

The device is part of a "machine" (board really), so I could add the
property to the machine to be passed on to the device when it's realized
(at least I think I can), but that doesn't feel right: The machine has lots
of devices -> it feels cleaner to associate the property with the device
and not the machine (lest the machine over time collect a myriad of random
properties to pass on to its devices). Things get a little complicated
because the machine can have multiple copies of a device: specifying the
device's name is insufficient.

The device has an object path: /machine/foo/bar/device[0]. There's also
/.../device[1].
IWBN to be able to do something along the lines of:
-device-property /device/path[,PROP1=VALUE1,...]
copying the syntax used for "-object".

It's perhaps even nicer if this could be accomplished with -device:
avoiding further confusion on what -device can and can't be used for (e.g.,
can I use -device-property to set a property that could also be set with
-device?).

If what I'm asking for is reasonable and isn't doable today (I'm certainly
willing to believe I'm missing something), I'm happy to work on the patch
(with some guidance as to what would be acceptable).

One thought that comes to mind is to use -object, store the properties
there, and have the machine collect them from there when realizing its
devices. Or is that an abuse of -object ?

--000000000000db6a4405b57fbf9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v class=3D"gmail_default">Hi.</div><div class=3D"gmail_default"><br></div><=
div class=3D"gmail_default">Suppose I want to set a property of a non-plugg=
able device that cannot be set after the device has been realized (e.g., I =
can&#39;t use qmp to set the property after QEMU has started).</div><div cl=
ass=3D"gmail_default">Being non-pluggable means I can&#39;t use &quot;-devi=
ce foo,bar=3Dbaz&quot; on the command line.</div><div class=3D"gmail_defaul=
t">[But I can use &quot;-device foo,help&quot; to list its properties :-)=
=C2=A0 (if I also specify -M bar) ]</div><div class=3D"gmail_default"><br><=
/div><div class=3D"gmail_default">How do people do this?</div><div class=3D=
"gmail_default"><br></div><div class=3D"gmail_default">The device is part o=
f a &quot;machine&quot; (board really), so I could add the property to the =
machine to be passed on to the device when it&#39;s realized (at least I th=
ink I can), but that doesn&#39;t feel right: The machine has lots of device=
s -&gt; it feels cleaner to associate the property with the device and not =
the machine (lest the machine over time collect a myriad of random properti=
es to pass on to its devices). Things get a little complicated because the =
machine can have multiple copies of a device: specifying the device&#39;s n=
ame is insufficient.</div><div class=3D"gmail_default"><br></div><div class=
=3D"gmail_default">The device has an object path: /machine/foo/bar/device[0=
]. There&#39;s also /.../device[1].</div><div class=3D"gmail_default">IWBN =
to be able to do something along the lines of:</div><div class=3D"gmail_def=
ault">-device-property /device/path[,PROP1=3DVALUE1,...]<br>copying the syn=
tax used for &quot;-object&quot;.<br><br>It&#39;s perhaps even nicer if thi=
s could be accomplished with -device: avoiding further confusion on what -d=
evice can and can&#39;t be used for (e.g., can I use -device-property to se=
t a property that could also be set with -device?).<br><br>If what I&#39;m =
asking for is reasonable and isn&#39;t doable today (I&#39;m certainly will=
ing to believe I&#39;m missing something), I&#39;m happy to work on the pat=
ch (with some guidance as to what would be acceptable).<br><br>One thought =
that comes to mind is to use -object, store the properties there, and have =
the machine collect them from there when realizing its devices. Or is that =
an abuse of -object ?<div class=3D"gmail-yj6qo"></div><div class=3D"gmail-a=
dL"><br></div></div></div></div>

--000000000000db6a4405b57fbf9e--

