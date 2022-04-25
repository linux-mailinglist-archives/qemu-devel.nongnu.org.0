Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D001D50EC8A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:19:17 +0200 (CEST)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj7zA-0000rM-He
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <starardev@gmail.com>)
 id 1nj7xs-0000A7-PM
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:17:56 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <starardev@gmail.com>)
 id 1nj7xq-0004x7-Tu
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:17:56 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k29so14544385pgm.12
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/xZiOn41mXg3pXPx9xe+/P3d+0Jjlprql7axDPX8TI=;
 b=L528nnKdLq06hh+DWdD1poGVgoIYZAD30PuGUsPqBqKc/TG+PxTuZKbQfBwAHy4wN6
 pVQT/BiPe+8cRMlxhSDpWBelfBVB7RLOcVEDhA0M/zdYXEtbfUQua/ej28aW8Y23W5M6
 90k8jKmFhMDEfP3fHooPjp7Wik87E+WqOA7pyv3NzwBfSZA6sUNNFXKRXZ6mYlPsntST
 sGN2iTJwqN8PRnDwGVvwEQg069tGtQ9MPQltYRgieNgNKhWSTjMGSpVTa3iglTzkBX2a
 JfSRRv75iFQTFF8A7+OV1sIRFiPoHUDU0P6q5XRi8ZZrr0B1xQzlE6QK5JImt5UuouJq
 w6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/xZiOn41mXg3pXPx9xe+/P3d+0Jjlprql7axDPX8TI=;
 b=koQw9Mx3Jrf0K6uTnHeaMYK9Jam8VcFMix3r4d+PyPvLCzSXg68Y1I8euBeOZsfU0R
 znGdUt0sJwkwksif4TQwIluCCXhk5eQEzCV+oZvvwPLjT+tfiTjcHpz//p9dUO3eiDbO
 RSbeFhPSr1edCaTKcgUB9SJEAeGQvRxwmaYbSP4ZkmUKLAAcmpcEpsQ+99HVD5oVcw8U
 +xm1Br+rDFmhmFX7V/PFqpA9iPlpFPGtEsmr5rHk7Vce2rwmPXm6SPF4R8N9hRUrDEyt
 qeLEUbPkdBxTRJblhNCnzgJJCh8QkmAGVnlvmu4fIahZ4uzMCZl89yj5DA1OJWjrZiEc
 y0ag==
X-Gm-Message-State: AOAM532Sf4eBWiYBbKgqagJWDtFC0rHxEhSL0l2ZRxFJs8EU9shvwt4L
 TMzJsV84TYDUmAU5KUHm1gI/cHoknFQUugAvKgU=
X-Google-Smtp-Source: ABdhPJwNeZyjSAko2PWZgWAm61IYcRsgcLWbkF27wFq2jlfqXdDrf5yIcgzRsfZUQXqwcibjk1Y7auWuYaINqUjFkAM=
X-Received: by 2002:a63:8b4a:0:b0:3ab:255c:ff8e with SMTP id
 j71-20020a638b4a000000b003ab255cff8emr7278337pge.285.1650928672263; Mon, 25
 Apr 2022 16:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+inuZ85ktnAuvmmMcxJFX0EVZC6A_g2fR5BSQRTshDoxdv8=Q@mail.gmail.com>
 <YmbpoyhTXB4jdgx+@xz-m1.local>
 <CA+inuZ_o5eyc+dFyTxKe1v1nw8fmhXP1P4gysY0+L7N6VRtMwQ@mail.gmail.com>
 <Ymcl5OB8xpqP2bTx@xz-m1.local>
In-Reply-To: <Ymcl5OB8xpqP2bTx@xz-m1.local>
From: Artyom <starardev@gmail.com>
Date: Tue, 26 Apr 2022 02:17:41 +0300
Message-ID: <CA+inuZ9rxHFXtJZFBpwFWgBRHdtfM+NHe-9y=myDDyU8W2hsig@mail.gmail.com>
Subject: Re: Live Migration ToDo
To: Peter Xu <peterx@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000f536b05dd82c9fc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=starardev@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: leobras@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f536b05dd82c9fc
Content-Type: text/plain; charset="UTF-8"

Yes, the original postcopy paper (
https://kartikgopalan.github.io/publications/hines09postcopy_osr.pdf)
suggests optimizations. For example, prepaging uses hints from the VM's
page access patterns to reduce both the number of major network faults and
the duration of the migration phase. After examining the code in
migration/, I could not find any mention of these optimizations. Perhaps
the ideas from the paper have already been tried to implement in QEMU, but
they were abandoned?

On Tue, Apr 26, 2022 at 1:51 AM Peter Xu <peterx@redhat.com> wrote:

> On Tue, Apr 26, 2022 at 01:39:58AM +0300, Artyom wrote:
> > Thank you for your response. Yes, I would like to work on some task, and
> > eventually I would like to use it as my student project. For example, it
> > might be possible to implement the technique from the article Post-Copy,
> > Hines, 2009: demand paging, active push, prepaging and dynamic
> > self-ballooning. As far as I understood from the postcopy documentation,
> > the pages are pushed sequentially, but it is possible to implement a new
> > prepaging strategy. Or are there any obstacles to implementing the ideas
> of
> > this paper in QEMU?
>
> I'm a bit confused.  Firstly, Dave implemented postcopy for QEMU years ago,
> please see migration/postcopy-ram.c.  Or do you mean you want to implement
> some specific optimization for QEMU's postcopy?
>
> Thanks,
>
> --
> Peter Xu
>
>

--0000000000000f536b05dd82c9fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Yes, the original postcopy paper (<a href=
=3D"https://kartikgopalan.github.io/publications/hines09postcopy_osr.pdf">h=
ttps://kartikgopalan.github.io/publications/hines09postcopy_osr.pdf</a>) su=
ggests optimizations. For example, prepaging uses hints from the VM&#39;s p=
age access patterns to reduce=C2=A0both the number of major network faults =
and the duration of the migration phase. After examining the code in migrat=
ion/, I could not find any mention of these optimizations. Perhaps the idea=
s from the paper have already been tried to implement in QEMU,=C2=A0but the=
y were abandoned?<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 26, 2022 at 1:51 AM Peter Xu &lt;<a href=
=3D"mailto:peterx@redhat.com">peterx@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Apr 26, 2022 at 01:3=
9:58AM +0300, Artyom wrote:<br>
&gt; Thank you for your response. Yes, I would like to work on some task, a=
nd<br>
&gt; eventually I would like to use it as my student project. For example, =
it<br>
&gt; might be possible to implement the technique from the article Post-Cop=
y,<br>
&gt; Hines, 2009: demand paging, active push, prepaging and dynamic<br>
&gt; self-ballooning. As far as I understood from the postcopy documentatio=
n,<br>
&gt; the pages are pushed sequentially, but it is possible to implement a n=
ew<br>
&gt; prepaging strategy. Or are there any obstacles to implementing the ide=
as of<br>
&gt; this paper in QEMU?<br>
<br>
I&#39;m a bit confused.=C2=A0 Firstly, Dave implemented postcopy for QEMU y=
ears ago,<br>
please see migration/postcopy-ram.c.=C2=A0 Or do you mean you want to imple=
ment<br>
some specific optimization for QEMU&#39;s postcopy?<br>
<br>
Thanks,<br>
<br>
-- <br>
Peter Xu<br>
<br>
</blockquote></div></div>

--0000000000000f536b05dd82c9fc--

