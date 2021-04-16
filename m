Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D6361BB1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:47:00 +0200 (CEST)
Received: from localhost ([::1]:45360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXK7v-00079h-VG
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXK4Q-0005VN-CK
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 04:43:22 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lXK4O-0002LY-Ee
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 04:43:22 -0400
Received: by mail-il1-x132.google.com with SMTP id y10so615619ilv.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UrANIj1o+xA0orqtcu8sYkGOJmUmrxmV1iCfhK3tcd4=;
 b=BFOpmNQLn4gCMAW+ZWJhr75oMHlMMV1yhTJr/zbXZ5rqwGd0/GTf6Mg5h/h93eN6BM
 pno0sOE990DgP45mHkj738IkLLJIAj51nuf71ywOa86hQH0UJkcw+zZzAn18XLAjADcq
 cIh38k9CMOGExXzpHwCJHTumbW9doaleM4vEXxBnSioCad/gALPkyQ1KDaIn/dd2xP4n
 o0yUL5hFOzwUfnxdWdx3CSoh2Xe3brkblV92pTummA4yBNhP1YpSk2e/A4GBnATjhuF5
 ZsM/gFjQ0/qp48gzsG17UJEpThlBfA5xiEm20e2/wuxugxP9KpliqqbFRUsuJyl4pEzo
 wh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UrANIj1o+xA0orqtcu8sYkGOJmUmrxmV1iCfhK3tcd4=;
 b=BkAidns38xWNpqhyhiyW5hQCHN7KOInr3IRzzFl20J/Y0gRxqXJFF8rac3tmw+M8UB
 eECFdDo+YWhwZT955164DVRNhXAQ8iVZbpq4qbElE6744ACuMeuY25y4Pq0yBS5WqLpO
 FEE8ZNLmdClVhhUqoLBzdVkUawu8MtixuPl/LPeDfY++UfAZ64S98aY0IsLbLCR69PdE
 SfBUHARQdCpaSsq8ZpaHbDHLFVLngR89c/QaHeUaSPkMDzNBzJrUFYf5re4AN514+cte
 wO/+jkxdYJfzWmjzrkdOLhD9vSy+qXp0Zeg8rgjtboxhAn+7N30xmCk1VXhidpR+3CmO
 bCpw==
X-Gm-Message-State: AOAM531FZWr/Q97ziFa/115DJlTNL19fGiEuVZyZ+ZPb7+P9dqaSjNiW
 RqnGzSkrWvNOYw/6iqIm8oXRAoCbyPJuTtpu/BM=
X-Google-Smtp-Source: ABdhPJxMgn7qb6czXY73DV3yUcTdGJFFUfOIgvvnzzNKqCZdVF2gw01xGDeU8YKQklNJ15a4ObeyhskPSP/EET2Cn/Y=
X-Received: by 2002:a92:ca06:: with SMTP id j6mr6360706ils.234.1618562597771; 
 Fri, 16 Apr 2021 01:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <CAD-LL6hpUObLT-sQcDPnLt4m406TBv_SDUYgT346ZDc8eWsSig@mail.gmail.com>
 <YFi9WoL1hqY/0MWU@stefanha-x1.localdomain>
In-Reply-To: <YFi9WoL1hqY/0MWU@stefanha-x1.localdomain>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Fri, 16 Apr 2021 10:43:07 +0200
Message-ID: <CAD-LL6gkQnBo5rxJFHsHGTUq=aS+=u=FaeK1Uhak7BL1Giba2g@mail.gmail.com>
Subject: Re: [PATCH 0/8] virtiofsd: Changed various allocations to GLib
 functions
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000afdd0905c012f819"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x132.google.com
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000afdd0905c012f819
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 22, 2021 at 5:53 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Fri, Mar 19, 2021 at 03:47:03PM +0200, Mahmoud Mandour wrote:
> > On Fri, Mar 19, 2021 at 3:25 PM Mahmoud Mandour <ma.mandourr@gmail.com>
> > wrote:
> >
> > > Replaced allocations done using malloc(), calloc(), and realloc()
> > > to their equivalent functions in GLib.
> > >
> > > Memory that is allocated locally and freed when the function exits
> > > are annotated g_autofree so that the deallocation is automatically
> > > handled. Subsequently, I could remove a bunch of free() calls.
> > >
> > > Also, tried to keep the semantics of the code as is, but when the
> > > allocation is a small one, or a crucial one, I replaced the
> > > NULL-checking mechanisms with glib's functions that crash on error.
> > >
> > > This is related to a patch that I had submitted as a part of a
> > > previous series. The previous patch had some errors. Also, I thought
> > > that it's better to split the patch into smaller pieces.
> > >
> > > The previous patch can be found here:
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg05153.html
> > >
> > > Mahmoud Mandour (8):
> > >   virtiofsd: Changed allocations of fuse_req to GLib functions
> > >   virtiofds: Changed allocations of iovec to GLib's functions
> > >   virtiofsd: Changed fuse_pollhandle allocation to GLib's functions
> > >   virtiofsd: Changed allocations of fuse_session to GLib's functions
> > >   virtiofsd: Changed allocation of lo_map_elems to GLib's functions
> > >   virtiofsd: Changed allocations of fv_VuDev & its internals to GLib
> > >     functions
> > >   virtiofsd/passthrough_ll.c: Changed local allocations to GLib
> > >     functions
> > >   virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib
> > >
> > >  tools/virtiofsd/fuse_lowlevel.c  | 43 +++++++++++---------------------
> > >  tools/virtiofsd/fuse_virtio.c    | 34 ++++++++-----------------
> > >  tools/virtiofsd/passthrough_ll.c | 21 ++++++----------
> > >  3 files changed, 34 insertions(+), 64 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > Hello,
> > For some reason, my get_maintainers script auto cc-filling did not work,
> so
> > I had to manually cc
> > you.
> > Sorry for the inconvenience.
>
> Thanks, will review tomorrow.
>
> Stefan
>

Hello

I wanted to ask whether I need to resend the patch series with updates
utilizing
the feedback I got? There are patches that are overall superfluous, and
others are
"reviewed". Should I resend an updated series with only the patches
reviewed?

Yours,
Mahmoud

--000000000000afdd0905c012f819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 5:53=
 PM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Fri, Mar 19, 2021 at 03:47:03PM +0200, Mahmoud Mandour wrote:<br>
&gt; On Fri, Mar 19, 2021 at 3:25 PM Mahmoud Mandour &lt;<a href=3D"mailto:=
ma.mandourr@gmail.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; Replaced allocations done using malloc(), calloc(), and realloc()=
<br>
&gt; &gt; to their equivalent functions in GLib.<br>
&gt; &gt;<br>
&gt; &gt; Memory that is allocated locally and freed when the function exit=
s<br>
&gt; &gt; are annotated g_autofree so that the deallocation is automaticall=
y<br>
&gt; &gt; handled. Subsequently, I could remove a bunch of free() calls.<br=
>
&gt; &gt;<br>
&gt; &gt; Also, tried to keep the semantics of the code as is, but when the=
<br>
&gt; &gt; allocation is a small one, or a crucial one, I replaced the<br>
&gt; &gt; NULL-checking mechanisms with glib&#39;s functions that crash on =
error.<br>
&gt; &gt;<br>
&gt; &gt; This is related to a patch that I had submitted as a part of a<br=
>
&gt; &gt; previous series. The previous patch had some errors. Also, I thou=
ght<br>
&gt; &gt; that it&#39;s better to split the patch into smaller pieces.<br>
&gt; &gt;<br>
&gt; &gt; The previous patch can be found here:<br>
&gt; &gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-03/=
msg05153.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/a=
rchive/html/qemu-devel/2021-03/msg05153.html</a><br>
&gt; &gt;<br>
&gt; &gt; Mahmoud Mandour (8):<br>
&gt; &gt;=C2=A0 =C2=A0virtiofsd: Changed allocations of fuse_req to GLib fu=
nctions<br>
&gt; &gt;=C2=A0 =C2=A0virtiofds: Changed allocations of iovec to GLib&#39;s=
 functions<br>
&gt; &gt;=C2=A0 =C2=A0virtiofsd: Changed fuse_pollhandle allocation to GLib=
&#39;s functions<br>
&gt; &gt;=C2=A0 =C2=A0virtiofsd: Changed allocations of fuse_session to GLi=
b&#39;s functions<br>
&gt; &gt;=C2=A0 =C2=A0virtiofsd: Changed allocation of lo_map_elems to GLib=
&#39;s functions<br>
&gt; &gt;=C2=A0 =C2=A0virtiofsd: Changed allocations of fv_VuDev &amp; its =
internals to GLib<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0functions<br>
&gt; &gt;=C2=A0 =C2=A0virtiofsd/passthrough_ll.c: Changed local allocations=
 to GLib<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0functions<br>
&gt; &gt;=C2=A0 =C2=A0virtiofsd/fuse_virtio.c: Changed allocations of local=
s to GLib<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 tools/virtiofsd/fuse_lowlevel.c=C2=A0 | 43 +++++++++++-----=
----------------<br>
&gt; &gt;=C2=A0 tools/virtiofsd/fuse_virtio.c=C2=A0 =C2=A0 | 34 ++++++++---=
--------------<br>
&gt; &gt;=C2=A0 tools/virtiofsd/passthrough_ll.c | 21 ++++++----------<br>
&gt; &gt;=C2=A0 3 files changed, 34 insertions(+), 64 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Hello,<br>
&gt; For some reason, my get_maintainers script auto cc-filling did not wor=
k, so<br>
&gt; I had to manually cc<br>
&gt; you.<br>
&gt; Sorry for the inconvenience.<br>
<br>
Thanks, will review tomorrow.<br>
<br>
Stefan<br></blockquote><div><br></div>Hello<div><br></div><div>I wanted to =
ask whether I need to resend the patch series with updates utilizing</div><=
div>the feedback I got? There are patches that are overall superfluous, and=
 others are</div><div>&quot;reviewed&quot;. Should I resend an updated seri=
es with only the patches reviewed?</div><div><br></div><div>Yours,</div><di=
v>Mahmoud=C2=A0</div></div></div></div>

--000000000000afdd0905c012f819--

