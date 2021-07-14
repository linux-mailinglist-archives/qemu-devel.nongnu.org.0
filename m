Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9BD3C7E78
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:19:33 +0200 (CEST)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3YF2-0000Ts-Rv
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m3YDN-0006En-MT
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:17:49 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m3YDL-0003R6-Gy
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:17:49 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r135so1477582ybc.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 23:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yom4PzHqs0Rl+0jsM96/u7THIyjnabtP29YWSpEVfd4=;
 b=gdOWgn+A7yqWC5rDoayuGjplYb1IQm5m+Mw2a08W2LKRuL+QiykyPuutNtl48X6SYV
 geF2usG7IOMS6i8905Q7wax7OdxRLgpP0kPrjQphEEQo/I+8drcJDSjl/15H/wKwxG87
 AXO22hPnV7+/1zBdlWJzq7U9tRuXpSo6AHP3ETh6/XDLMq33Evx0pIQDTWRSZS6p1LAs
 wXCMZ/vCQ5SFueLvG/WPhZgNkqy+7eQcaDec3pNZGfIHBJKJuSkz06bLp1qhVhjPEBc5
 /wz1UOc7ENaU1SgI8ZtOyq17OCRqfA3CiT2TsuBGwhWDiTECzTfoWCSk0/XgyqhBV1f+
 K3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yom4PzHqs0Rl+0jsM96/u7THIyjnabtP29YWSpEVfd4=;
 b=fmiptddKozaXm99cSeyLXtr1EuLW07PJ9Dlx5IrvasMOyynrc9+tufDHM2jXEkYNpn
 QkP7Itbgz6FqSAJ+I2taiJNJprxO3oHoRw53eP9ARLYY/LULJBOdhDXKoiEY09XwO345
 KuQnXDhEXuZ9JgiINSR1aaAwve4ClL2GOHrRuVM6Xdeb0CjPlgfAm7spMudjHWuyyzVo
 vtszmVVZxsMXHhBnlh9tNiyT+5I2z5dSV+s8SeVRYj+8vYVx3cpRMMmG+4CqyjJe/Kks
 +pBWSCzqlbcElVKJlzXw4zIPkIWPCJbTJ512Vd5u/ECaLiA2jPUDs9Ve82cEmRdww4sI
 9D2Q==
X-Gm-Message-State: AOAM533/h9SLDh72SqJ/gV2jS7L+jVIaN8VpFkjMAEFXGGDvPZOcqasC
 QXk3OEelgoW0ox/Jo55hocEnVUNmz5MkM7FvbvN91Q==
X-Google-Smtp-Source: ABdhPJxqv4e+oDSBfiiiQf+NETI3mUlwO0fl8HnbJYXR3KMfv5lLpzAeR7VNU9RJ6k73Lo2N2OAObunaURu48jRgl54=
X-Received: by 2002:a25:3d41:: with SMTP id k62mr10728051yba.479.1626243466234; 
 Tue, 13 Jul 2021 23:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
 <CAJ28CFRCW+Z+j2MunL_+PpNc0a1UUPvZ+baW=eopVJ6Odj3zTA@mail.gmail.com>
 <162620162248.49683.11801775260591979390@amd.com>
In-Reply-To: <162620162248.49683.11801775260591979390@amd.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Wed, 14 Jul 2021 09:17:35 +0300
Message-ID: <CAJ28CFSV-=caj-3VqZ=CFjEAdJ19296PNpcVAOc1TOWhxZccew@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
To: Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000001fa0e605c70f503b"
Received-SPF: none client-ip=2607:f8b0:4864:20::b35;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001fa0e605c70f503b
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

qga-vss.dll has many dependencies. Please check that all DLLs are present
in the same directory.

Also, I have a similar problem in my setup. In my case, libgcc_s_seh-1.dll
was renamed in MinGW which I used.

Best wishes,
Kostiantyn Kostiuk


On Tue, Jul 13, 2021 at 9:40 PM Michael Roth <michael.roth@amd.com> wrote:

> Quoting Konstantin Kostiuk (2021-04-22 02:43:25)
> > ping
>
> I've been trying to get these queued but I'm hitting an issue where qga
> reports:
>
>   failed to load qga-vss.dll: The specified module could not be found.
>
> via LoadLibraryA(QGA_VSS_DLL) returning error code 126. What's weird is
> it seems to find qga-vss.dll in the install directory, and you can see it
> access it in WinDBG and various trace tools, but somehow it reports not
> found. Are you seeing this issue?
>
> I'll debug more this week and try to get these in for rc1, but if you
> happen
> to have more of a clue than me then any insights would be much appreciated.
>
> >
> > On Mon, Apr 5, 2021 at 4:14 PM Basil Salman <basil@daynix.com> wrote:
> >
> >     Currently Requester freeze times out after 10 seconds, while
> >     the default timeout for Writer Freeze is 60 seconds. according to
> >     VSS Documentation [1].
> >     [1]: https://docs.microsoft.com/en-us/windows/win32/vss/
> >     overview-of-processing-a-backup-under-vss
> >
> >     Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1909073
> >
> >     Signed-off-by: Basil Salman <bsalman@daynix.com>
> >     Signed-off-by: Basil Salman <basil@daynix.com>
> >     ---
> >      qga/vss-win32/requester.cpp | 2 +-
> >      1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >     diff --git a/qga/vss-win32/requester.cpp
> b/qga/vss-win32/requester.cpp
> >     index 5378c55d23..940a2c8f55 100644
> >     --- a/qga/vss-win32/requester.cpp
> >     +++ b/qga/vss-win32/requester.cpp
> >     @@ -18,7 +18,7 @@
> >      #include <inc/win2003/vsbackup.h>
> >
> >      /* Max wait time for frozen event (VSS can only hold writes for 10
> >     seconds) */
> >     -#define VSS_TIMEOUT_FREEZE_MSEC 10000
> >     +#define VSS_TIMEOUT_FREEZE_MSEC 60000
> >
> >      /* Call QueryStatus every 10 ms while waiting for frozen event */
> >      #define VSS_TIMEOUT_EVENT_MSEC 10
> >     --
> >     2.17.2
> >
> >
>

--0000000000001fa0e605c70f503b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michael,<br></div><div dir=3D"ltr"><br></div><div =
dir=3D"ltr">qga-vss.dll has many dependencies. Please check that all DLLs a=
re present in the same directory. <br></div><div dir=3D"ltr"><br></div><div=
>Also, I have a similar problem in my setup. In my case, libgcc_s_seh-1.dll=
 was renamed in MinGW <span class=3D"gmail-VIiyi" lang=3D"en"><span class=
=3D"gmail-JLqJ4b gmail-ChMk0b"><span>which I used.</span></span></span> </d=
iv><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best wi=
shes,</div><div>Kostiantyn Kostiuk</div></div></div></div><br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 1=
3, 2021 at 9:40 PM Michael Roth &lt;<a href=3D"mailto:michael.roth@amd.com"=
>michael.roth@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Quoting Konstantin Kostiuk (2021-04-22 02:43:25)<br>
&gt; ping<br>
<br>
I&#39;ve been trying to get these queued but I&#39;m hitting an issue where=
 qga<br>
reports:<br>
<br>
=C2=A0 failed to load qga-vss.dll: The specified module could not be found.=
<br>
<br>
via LoadLibraryA(QGA_VSS_DLL) returning error code 126. What&#39;s weird is=
<br>
it seems to find qga-vss.dll in the install directory, and you can see it<b=
r>
access it in WinDBG and various trace tools, but somehow it reports not<br>
found. Are you seeing this issue?<br>
<br>
I&#39;ll debug more this week and try to get these in for rc1, but if you h=
appen<br>
to have more of a clue than me then any insights would be much appreciated.=
<br>
<br>
&gt; <br>
&gt; On Mon, Apr 5, 2021 at 4:14 PM Basil Salman &lt;<a href=3D"mailto:basi=
l@daynix.com" target=3D"_blank">basil@daynix.com</a>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Currently Requester freeze times out after 10 secon=
ds, while<br>
&gt;=C2=A0 =C2=A0 =C2=A0the default timeout for Writer Freeze is 60 seconds=
. according to<br>
&gt;=C2=A0 =C2=A0 =C2=A0VSS Documentation [1].<br>
&gt;=C2=A0 =C2=A0 =C2=A0[1]: <a href=3D"https://docs.microsoft.com/en-us/wi=
ndows/win32/vss/" rel=3D"noreferrer" target=3D"_blank">https://docs.microso=
ft.com/en-us/windows/win32/vss/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0overview-of-processing-a-backup-under-vss<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Buglink: <a href=3D"https://bugzilla.redhat.com/sho=
w_bug.cgi?id=3D1909073" rel=3D"noreferrer" target=3D"_blank">https://bugzil=
la.redhat.com/show_bug.cgi?id=3D1909073</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Basil Salman &lt;<a href=3D"mailto:b=
salman@daynix.com" target=3D"_blank">bsalman@daynix.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Basil Salman &lt;<a href=3D"mailto:b=
asil@daynix.com" target=3D"_blank">basil@daynix.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0qga/vss-win32/requester.cpp | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 1 insertion(+), 1 deletion(-)=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/qga/vss-win32/requester.cpp b/qga/vss-=
win32/requester.cpp<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 5378c55d23..940a2c8f55 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/qga/vss-win32/requester.cpp<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/qga/vss-win32/requester.cpp<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -18,7 +18,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#include &lt;inc/win2003/vsbackup.h&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/* Max wait time for frozen event (VSS can on=
ly hold writes for 10<br>
&gt;=C2=A0 =C2=A0 =C2=A0seconds) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0-#define VSS_TIMEOUT_FREEZE_MSEC 10000<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define VSS_TIMEOUT_FREEZE_MSEC 60000<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/* Call QueryStatus every 10 ms while waiting=
 for frozen event */<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0#define VSS_TIMEOUT_EVENT_MSEC 10<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A02.17.2<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>

--0000000000001fa0e605c70f503b--

