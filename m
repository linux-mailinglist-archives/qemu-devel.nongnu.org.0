Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD850EC3B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 00:41:12 +0200 (CEST)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj7OJ-0004sM-O3
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 18:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <starardev@gmail.com>)
 id 1nj7NM-0004Ck-Nu
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:40:12 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <starardev@gmail.com>)
 id 1nj7NK-0008ED-RM
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:40:12 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bx5so6913856pjb.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvoSStx9PeiyLITi07lJBqPlMiKWf1fQ47dvAEeaiHM=;
 b=btuibId8NoBpz0BdW3aUvsvrh6AFjUFyWJfnBBuHfxiiZGHXPGGw5eWr8bfw1km87f
 8eXqW/f1VQyq+LzT7X6nSc9XUGLXok2mV/C3360vso5z4xn7MkdtnNOrbyZqPefDiNrk
 YyxP2Dhec23G4P65yQidkHaUFCmB2AMNCIXsJ9RkIjrdHDbTZ8I8olDKZF5qI6G/BvUp
 jd84GH5szKrAjm8uktHwDcupO3xYpepXRw2FSVfx3bM4SJnOvFBswByFPmTz8XluJkyI
 RFUrMUkOkEgMES5/IRYtyYJ3yHMDICgMYx191HUfMWeofLL9e0RGkrmVu+o/imuPraVb
 5tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvoSStx9PeiyLITi07lJBqPlMiKWf1fQ47dvAEeaiHM=;
 b=1bb9vLEHf3+aqWm26UEEuK6DxCi6C4RgF/y2rliHpHdU/VKrUWQGVoU3RPaoFugpXF
 bZ+11hcn5btDJ0pvuFGdamiwlAcETrvKmt0bt4IScE3zZy2Ijz6L4YGsIYSQrGSkzJ1L
 7XTPkqVQaVrUvn7X7M53X9vVHvcK9JtsfHpTnHttsVuO8vST8nUQyGMOT7qx4VbIavYt
 AltcYEsQZkjx/ynqQ7A5Dy3ALvv3RW5/pWkqzloTL6OH2U98mml+HuT0kDjxRJ0y6CUu
 7wl+erMW4QdvLVnCZz3GTs3gYePhZnoTWfWsYDsF2+2voLggDwf6YLY4SLr/7xbvJrfR
 swag==
X-Gm-Message-State: AOAM531wIO3sgz4GqkzOopme4iovWExxhsXc1juj1K2g0MtxGke8UH4/
 5GGAOU4YXj6Toacdlh8AeFzSglgk+UAMDyvZWzE=
X-Google-Smtp-Source: ABdhPJxviWZOb7JYKmGbBhThSDMH3U7VA7a961iLIb+Pyav2FJwKoVD95QbRcrImD6OmaMIa0C/VELeKxBXV/Ldyyig=
X-Received: by 2002:a17:90a:a82:b0:1c9:ef95:486 with SMTP id
 2-20020a17090a0a8200b001c9ef950486mr34081831pjw.93.1650926409276; Mon, 25 Apr
 2022 15:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+inuZ85ktnAuvmmMcxJFX0EVZC6A_g2fR5BSQRTshDoxdv8=Q@mail.gmail.com>
 <YmbpoyhTXB4jdgx+@xz-m1.local>
In-Reply-To: <YmbpoyhTXB4jdgx+@xz-m1.local>
From: Artyom <starardev@gmail.com>
Date: Tue, 26 Apr 2022 01:39:58 +0300
Message-ID: <CA+inuZ_o5eyc+dFyTxKe1v1nw8fmhXP1P4gysY0+L7N6VRtMwQ@mail.gmail.com>
Subject: Re: Live Migration ToDo
To: Peter Xu <peterx@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002ce13805dd8242b5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=starardev@gmail.com; helo=mail-pj1-x1029.google.com
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

--0000000000002ce13805dd8242b5
Content-Type: text/plain; charset="UTF-8"

Thank you for your response. Yes, I would like to work on some task, and
eventually I would like to use it as my student project. For example, it
might be possible to implement the technique from the article Post-Copy,
Hines, 2009: demand paging, active push, prepaging and dynamic
self-ballooning. As far as I understood from the postcopy documentation,
the pages are pushed sequentially, but it is possible to implement a new
prepaging strategy. Or are there any obstacles to implementing the ideas of
this paper in QEMU?

On Mon, Apr 25, 2022 at 9:34 PM Peter Xu <peterx@redhat.com> wrote:

> Hi,
>
> On Mon, Apr 25, 2022 at 01:41:27PM +0300, Artyom wrote:
> > Hello! I would like to see a list of suggestions/ideas/tickets for
> > improving live migration (especially performance and algorithms). There
> is
> > a page https://wiki.qemu.org/ToDo/LiveMigration, but it has not been
> > updated for a long time. Thanks
>
> Yes I think you're right and it's a good idea we should at some point
> revive the page so it always contains up-to-date contents.
>
> Do you mean that you want to contribute to QEMU project by working on some
> (obviously, not bit-sized) performance related tasks on live migration to
> improve the software?
>
> So far I am aware that Leonardo was working on zero-copy sender side for
> it, Juan was experimenting some bitmap split researches, and I'm working on
> a bit of the postcopy specific enhancements.  I'm not sure what I can do
> here to help you start any form of contribution, maybe starting from
> knowing more context of what you want and plan. :)
>
> Thanks,
>
> --
> Peter Xu
>
>

--0000000000002ce13805dd8242b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you for your response. Yes, I would=
 like to work on some task, and eventually I would like to use it as my stu=
dent project. For example, it might be possible to implement the technique =
from the article Post-Copy, Hines, 2009: demand paging, active push, prepag=
ing and dynamic self-ballooning. As far as I understood from the postcopy d=
ocumentation, the pages are pushed sequentially, but it is possible to impl=
ement a new prepaging strategy. Or are there any obstacles to implementing =
the ideas of this paper in QEMU?<br><br></div><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 25, 2022 at 9:34 PM Peter X=
u &lt;<a href=3D"mailto:peterx@redhat.com">peterx@redhat.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Mon, Apr 25, 2022 at 01:41:27PM +0300, Artyom wrote:<br>
&gt; Hello! I would like to see a list of suggestions/ideas/tickets for<br>
&gt; improving live migration (especially performance and algorithms). Ther=
e is<br>
&gt; a page <a href=3D"https://wiki.qemu.org/ToDo/LiveMigration" rel=3D"nor=
eferrer" target=3D"_blank">https://wiki.qemu.org/ToDo/LiveMigration</a>, bu=
t it has not been<br>
&gt; updated for a long time. Thanks<br>
<br>
Yes I think you&#39;re right and it&#39;s a good idea we should at some poi=
nt<br>
revive the page so it always contains up-to-date contents.<br>
<br>
Do you mean that you want to contribute to QEMU project by working on some<=
br>
(obviously, not bit-sized) performance related tasks on live migration to<b=
r>
improve the software?<br>
<br>
So far I am aware that Leonardo was working on zero-copy sender side for<br=
>
it, Juan was experimenting some bitmap split researches, and I&#39;m workin=
g on<br>
a bit of the postcopy specific enhancements.=C2=A0 I&#39;m not sure what I =
can do<br>
here to help you start any form of contribution, maybe starting from<br>
knowing more context of what you want and plan. :)<br>
<br>
Thanks,<br>
<br>
-- <br>
Peter Xu<br>
<br>
</blockquote></div></div>

--0000000000002ce13805dd8242b5--

