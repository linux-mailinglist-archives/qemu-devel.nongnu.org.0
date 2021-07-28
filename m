Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E243D8925
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:55:15 +0200 (CEST)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ePK-00058X-GX
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m8eOA-0003K4-QM
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:54:02 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1m8eO8-0003Dm-NR
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:54:02 -0400
Received: by mail-yb1-xb36.google.com with SMTP id f26so2457959ybj.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dEXb+C+110v6lLhnLt+mg/+SDu8+xBhuNq+A7JkwWE8=;
 b=Y8bUFR/rnRTE9gShshiMfo4iPHzqwJcMjk7hg2V7Ub8Lb1aHxR5uHbGnwJzCqm3/Ru
 50yPwt11pe3udVElABL39yp7c6GD834ra9EV+jTdamtBOWJurrT745SSoTp9G6krDCul
 /RbpP0kzpo4ybVR6GruAlHERndbKvEHGKnQGteX+zyFqtoaEhfsHQTggNhEt82hQOkEp
 AVrMt7vSg4pqHazVuKbZLzqlivX5b3zvAan3Uo5N030gUsAsPeRpY3CcvqJ4c2u8z01W
 05NUFRRmtyYxfhP/JdK/22EraSoBsgWqprbwVNi/ltItgcKYsJzM3nIc776pOGsZ7kRo
 6UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEXb+C+110v6lLhnLt+mg/+SDu8+xBhuNq+A7JkwWE8=;
 b=Qn2shv0JmY+ZsNxnxWtlEDLxKVoBf54av4A1BVRm4oB4vwOiqCFgQByC+KU039bkmy
 XW5pCRUr5u2O7aWNcjkA/jlvev+gZYWYYCqjlPlsTRgP3H1Q6O5vbzgXRbUCxBcMN5E0
 rYoCVSU6GpePQ9xOOjiQuVIFJ1rpRM+PMShsiOb9mHYSCHwZCytsPoF91xBnElly3rlO
 kNcQJU2jLLjiDwUBODAoMU2oLDh7qWn20Lbj2QmxDZSDCmlMz7NTcg9OvuHxGExSAsNz
 CO9da056k6aipFV7Xrxc8ON+3lJ+I39VqF8XXNng9kdWv0szuWsA7pKlJhSTQazBfG+g
 Hg6w==
X-Gm-Message-State: AOAM530tMc0Jk/t4Zbidebh+RdIkxlDih5f3r+ctUVrT8hmYOJNUyH3Z
 bvvn9NfmUDZnsEX6MPYKUEgsm5Z0rb5qA7tM6Tyz9A==
X-Google-Smtp-Source: ABdhPJzRtstMfcHG8VPeqChrpUuBM57lesNOBhhgn0WhIetGEVyQpPi7BF5jnrMpyuwY/jNcEOtFlQAjghrJUV8P6QI=
X-Received: by 2002:a25:4486:: with SMTP id
 r128mr32790230yba.372.1627458839971; 
 Wed, 28 Jul 2021 00:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210405131420.598273-1-basil@daynix.com>
 <CAJ28CFRCW+Z+j2MunL_+PpNc0a1UUPvZ+baW=eopVJ6Odj3zTA@mail.gmail.com>
 <162620162248.49683.11801775260591979390@amd.com>
 <CAJ28CFSV-=caj-3VqZ=CFjEAdJ19296PNpcVAOc1TOWhxZccew@mail.gmail.com>
In-Reply-To: <CAJ28CFSV-=caj-3VqZ=CFjEAdJ19296PNpcVAOc1TOWhxZccew@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Wed, 28 Jul 2021 10:53:49 +0300
Message-ID: <CAJ28CFR=2c7g6VsdZbjvjHW4g7n0kr-zi1AJoq1YytFEmFm+ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] qga-win: Increase VSS freeze timeout to 60 secs
 instead of 10
To: Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000000b1dbc05c82a4ac4"
Received-SPF: none client-ip=2607:f8b0:4864:20::b36;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb36.google.com
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

--0000000000000b1dbc05c82a4ac4
Content-Type: text/plain; charset="UTF-8"

ping

On Wed, Jul 14, 2021 at 9:17 AM Konstantin Kostiuk <konstantin@daynix.com>
wrote:

> Hi Michael,
>
> qga-vss.dll has many dependencies. Please check that all DLLs are present
> in the same directory.
>
> Also, I have a similar problem in my setup. In my case, libgcc_s_seh-1.dll
> was renamed in MinGW which I used.
>
> Best wishes,
> Kostiantyn Kostiuk
>
>
> On Tue, Jul 13, 2021 at 9:40 PM Michael Roth <michael.roth@amd.com> wrote:
>
>> Quoting Konstantin Kostiuk (2021-04-22 02:43:25)
>> > ping
>>
>> I've been trying to get these queued but I'm hitting an issue where qga
>> reports:
>>
>>   failed to load qga-vss.dll: The specified module could not be found.
>>
>> via LoadLibraryA(QGA_VSS_DLL) returning error code 126. What's weird is
>> it seems to find qga-vss.dll in the install directory, and you can see it
>> access it in WinDBG and various trace tools, but somehow it reports not
>> found. Are you seeing this issue?
>>
>> I'll debug more this week and try to get these in for rc1, but if you
>> happen
>> to have more of a clue than me then any insights would be much
>> appreciated.
>>
>> >
>> > On Mon, Apr 5, 2021 at 4:14 PM Basil Salman <basil@daynix.com> wrote:
>> >
>> >     Currently Requester freeze times out after 10 seconds, while
>> >     the default timeout for Writer Freeze is 60 seconds. according to
>> >     VSS Documentation [1].
>> >     [1]: https://docs.microsoft.com/en-us/windows/win32/vss/
>> >     overview-of-processing-a-backup-under-vss
>> >
>> >     Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1909073
>> >
>> >     Signed-off-by: Basil Salman <bsalman@daynix.com>
>> >     Signed-off-by: Basil Salman <basil@daynix.com>
>> >     ---
>> >      qga/vss-win32/requester.cpp | 2 +-
>> >      1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> >     diff --git a/qga/vss-win32/requester.cpp
>> b/qga/vss-win32/requester.cpp
>> >     index 5378c55d23..940a2c8f55 100644
>> >     --- a/qga/vss-win32/requester.cpp
>> >     +++ b/qga/vss-win32/requester.cpp
>> >     @@ -18,7 +18,7 @@
>> >      #include <inc/win2003/vsbackup.h>
>> >
>> >      /* Max wait time for frozen event (VSS can only hold writes for 10
>> >     seconds) */
>> >     -#define VSS_TIMEOUT_FREEZE_MSEC 10000
>> >     +#define VSS_TIMEOUT_FREEZE_MSEC 60000
>> >
>> >      /* Call QueryStatus every 10 ms while waiting for frozen event */
>> >      #define VSS_TIMEOUT_EVENT_MSEC 10
>> >     --
>> >     2.17.2
>> >
>> >
>>
>

--0000000000000b1dbc05c82a4ac4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 9:17 AM Konstantin Kostiuk=
 &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hi Michael,<br></div><div dir=3D"ltr"><br></div><div dir=3D"l=
tr">qga-vss.dll has many dependencies. Please check that all DLLs are prese=
nt in the same directory. <br></div><div dir=3D"ltr"><br></div><div>Also, I=
 have a similar problem in my setup. In my case, libgcc_s_seh-1.dll was ren=
amed in MinGW <span lang=3D"en"><span><span>which I used.</span></span></sp=
an> </div><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Best wishes,</div><div>Kostiantyn Kostiuk</div></div></div></=
div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Jul 13, 2021 at 9:40 PM Michael Roth &lt;<a href=3D"mailto:=
michael.roth@amd.com" target=3D"_blank">michael.roth@amd.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Quoting Konstan=
tin Kostiuk (2021-04-22 02:43:25)<br>
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
</blockquote></div>

--0000000000000b1dbc05c82a4ac4--

