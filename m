Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A737635C679
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 14:42:27 +0200 (CEST)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVvta-00084t-7C
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 08:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lVvso-0007eW-8M
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 08:41:38 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lVvsk-0000kI-2k
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 08:41:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id sd23so11355346ejb.12
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7pKGoP4TCNdXuYE63MaFeJbdz02iKoYGNtKSXQZeY6k=;
 b=QUEMisfCjHVMtNWdq1clKjKhq/ekxWPqFaKc0E1Bc16AGyun2y4i9AoYLYeh/j2AI/
 rXdiAfIgYlDOw3KzFNuMlsmo164Bducq1MC8SycjwfL4w37Mr+Um03hEz+5L8HjGImf5
 2DEOfbgolPjnYiShm1KATKrnDi+z51+E2twMjUUIdoMTqc6ZDrJBwhRshUe67wwZv1ec
 DmuXvN4YyLPWr9HKbbjtAwVqH7dF6yfL6aIXOXou1rLLGWu4Xujxn1fSP7JPR5okAUjR
 nJt58V8lo3NEj+ilyjSZRKQ970nElr0TvwKXLUYUTkG2pMpC5WFMRqyjb9+jlTrSUkn/
 14Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7pKGoP4TCNdXuYE63MaFeJbdz02iKoYGNtKSXQZeY6k=;
 b=Za4F48LO+8pZuPs/bqaQXe2vd3LMz3dBvP5P0eo9SRf/hwau97symcBnyuKyCx/18n
 Apusw3oLBo/JtcfGV+CQqiXhkWWeHk13TlzLsXU1ZE45eTZVEEOXSixI2z44w3wJpn7a
 181df1DNzqoJPBwr39zhTdYc9snLjc0zZGIg/3ekHqoSIXslEJ6UwQY30GlzwQ5R0RMY
 vYeswUuB2RkDVOrULqCrXorzAWYJKCO2dSRt7Z/ncNJnBQqA+/G2kSpVcCFP3RSNSmWU
 Nkcem9HPDjhcD3p50KQgVUPsSbmpaKZcZiW3Sohhf3xZEO+G8mcHQVvZKi4e4UPPbMuL
 oUOw==
X-Gm-Message-State: AOAM531CLyIVtSDtMXgvaGY+jWESTA0rMYDSkIFyzsP7vizXS9pRsz7l
 wsi2LJmJ5W8DxRHCm9uNB/y+6ot2+9sK+PSSW4F8Jg==
X-Google-Smtp-Source: ABdhPJyUmYeWvw1EeWzlOyjUAdhD/w7D+zEgLS5sMpHNXdWkjZuEiZMG9fAblTsN3J9c4n1cZ69SPFc1A+/DWhzlJWw=
X-Received: by 2002:a17:906:f1cf:: with SMTP id
 gx15mr11311076ejb.143.1618231290487; 
 Mon, 12 Apr 2021 05:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <CAEM4iGG67hQDPVrKbSsSpsrpbc12+ky=ROh26QUqO5C0+q0jXg@mail.gmail.com>
 <874kgykmgv.fsf@dusky.pond.sub.org>
In-Reply-To: <874kgykmgv.fsf@dusky.pond.sub.org>
From: Li Zhang <li.zhang@ionos.com>
Date: Mon, 12 Apr 2021 14:41:19 +0200
Message-ID: <CAEM4iGG4F7eBNXDhjtnFGiy2paJxVuZOm7xYWTMrm9MKEgU8JA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003bfc0f05bfc5d569"
Received-SPF: permerror client-ip=2a00:1450:4864:20::62f;
 envelope-from=li.zhang@ionos.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 QEMU <qemu-devel@nongnu.org>, Li Zhang <li.zhang@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, Li Zhang <zhlcindy@gmail.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003bfc0f05bfc5d569
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

Any suggestions on this patch?

Thanks
Li

On Fri, Mar 26, 2021 at 3:40 PM Markus Armbruster <armbru@redhat.com> wrote:

> Li Zhang <li.zhang@ionos.com> writes:
>
> > Hi,
> >
> > Any comments about this patch?
>
> I wanted to review this before my Easter break, but I'm out of time :(
>
> When I'm back (April 6), I'll check whether it still needs review, but I
> do hope somebody else can look at it sooner.
>
>

--0000000000003bfc0f05bfc5d569
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Markus,=C2=A0<div><br></div><div>Any suggestions on thi=
s patch?=C2=A0</div><div><br></div><div>Thanks</div><div>Li</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Ma=
r 26, 2021 at 3:40 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat=
.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Li Zhang &lt;<a href=3D"mailto:li.zhang@ionos.com" t=
arget=3D"_blank">li.zhang@ionos.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; Any comments about this patch?<br>
<br>
I wanted to review this before my Easter break, but I&#39;m out of time :(<=
br>
<br>
When I&#39;m back (April 6), I&#39;ll check whether it still needs review, =
but I<br>
do hope somebody else can look at it sooner.<br>
<br>
</blockquote></div>

--0000000000003bfc0f05bfc5d569--

