Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770AD2DD6B6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:01:11 +0100 (CET)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxaP-0004lU-Se
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kpxYo-0003lb-PA
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:59:30 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1kpxYl-0004tR-QY
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:59:30 -0500
Received: by mail-qt1-x82c.google.com with SMTP id b9so20714288qtr.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 09:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rJKaMneizJgCzs3oaS8ikmUiDGM9ktaRn7/MWxalvyk=;
 b=zTF9H9HsfJWZpcDg0fiBoJUaXLi7aGs94UrI6vl52VuT/ktY4KVz68Y5CNgjbmxscH
 zbRxq3B+ftx79IR6gaf60KrlyXd7sm8fDcOe/WitOp+9knhZ+03gfwUUDbEdPED0E3+k
 aZ9Th9fs3hm8B7W8YItdlCeLXsoT2sNUiyyFjHyqZTYqTXrKuGz9CD+JZ1c2nYyLQwWi
 VqXTRs1o8rG2lUwmay4qnQabmnuVwtMXKnEJnA20AKcPntynluBQuG2vDLTThp0U6ou7
 DlxPsQtGuiAGTqoMxpILZZ8/3Z3zOv5R3aCv7TWSgy+8aIeKzDQX/wvAaEZ2yUZmQiUb
 LAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rJKaMneizJgCzs3oaS8ikmUiDGM9ktaRn7/MWxalvyk=;
 b=TA2D4qKpKpAgGtFZIjsDKQKNwc9e+DIsj2O8taTM4t2scYtH7vC7L0N/BdqRdu6Gyq
 IafEx3KIxCwc8zFGV7JDLpMAJznQ9p+YOUm7VERy3x5hHsGtVZPjyHcEvdMnoIu2DlQG
 Dk/rO7Zerpd0C2L6JlUiwxXBr8+tYxK7UUlOflW2VIl9NW6l7aGlzUauuWy/E+8pqwdh
 uHk4vN5mL6COe6kxV78ftn/ib+pG593iA16UncHnlc3pEEFPaDc8itI+LBDmFr43bocC
 rsp3+zxjWSczzAYj/tWI/LPnQDUHcSwlM3WWGqcUqtEs8dOWAqFDU0J8H9bIwDGtjh3k
 kbHw==
X-Gm-Message-State: AOAM530HHeRmS/T3WX3ovpB74b/aVH31T4sa/OQoOAfhknq59pdjkj1S
 9iwqajnNR6qJgKR3XUni4KtNR0JFKlH6sqb2UvZE2g==
X-Google-Smtp-Source: ABdhPJwWFotkTp7kW5fIRxNpW4Gg2j1qlwateQ6jZ3hLWNZnhyCZGtrObMpemc9RI2NRVB5exs7ekP+qlbKSsB+GbyY=
X-Received: by 2002:ac8:58d2:: with SMTP id u18mr46652266qta.235.1608227965530; 
 Thu, 17 Dec 2020 09:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20201216172949.57380-1-thuth@redhat.com>
 <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
 <a6271697-c645-968a-7e0f-e1993140633b@redhat.com>
 <20201217140012.GF247354@redhat.com>
 <CANCZdfpQeiWNt38D60W7un0vkK-GRCU-fShW0amfiwjKs=Wv-Q@mail.gmail.com>
 <CAFEAcA_gs5wqr258FBTAKbctKLf4J4etvvu0hfeFPtH6gRy2+g@mail.gmail.com>
 <CANCZdfpJ0iGWoSaz3Qarea2nUEM_tkyHw+z7C6J49CrtjrKANg@mail.gmail.com>
In-Reply-To: <CANCZdfpJ0iGWoSaz3Qarea2nUEM_tkyHw+z7C6J49CrtjrKANg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 17 Dec 2020 10:59:14 -0700
Message-ID: <CANCZdfrVB+3+S_4eTuCvfdTSd2rt=GPbSDSt5BnAauomiTtuxg@mail.gmail.com>
Subject: Re: Status/future of QEMU bsd-user impl ? (Wea Re: [PULL 00/12]
 Compile QEMU with -Wimplicit-fallthrough)
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009a8f7005b6acc040"
Received-SPF: none client-ip=2607:f8b0:4864:20::82c;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Sean Bruno <sbruno@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009a8f7005b6acc040
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 10:10 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Thu, Dec 17, 2020 at 9:21 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Thu, 17 Dec 2020 at 16:03, Warner Losh <imp@bsdimp.com> wrote:
>> > On Thu, Dec 17, 2020 at 7:02 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com>
>> wrote:
>> >> I don't recall what happened after that initial discussion about
>> >> merging the new impl. Did Sean simply not have the time to invest
>> >> in the merge ? I'll CC him here to see what opinion he has on the
>> >> future of bsd-user in QEMU.
>> >
>> >
>> > I've actually taken over for Sean Bruno managing this.
>>
>> > I'd love to hear from people ways that I can speed things up.
>>
>> There was a bit of discussion about this on #qemu IRC the other
>> day, coincidentally. I think the conclusion we (upstream QEMU)
>> came to was that we'd be happy with a "delete all of bsd-user
>> and reinstate" approach, assuming that the "reinstate" part is
>> in reasonably logical chunks and not one big "here's what we
>> have all in one lump" patch.
>>
>> AIUI from IRC this is being primarily driven by FreeBSD and
>> NetBSD/OpenBSD support is merely "we hope it is not broken
>> by the delete-and-reinstate but it was probably broken anyway" ?
>>
>
> Yea, I don't think it actually works for anything non-trivial on the othe=
r
> BSDs.
>

Looking at the changes, it may be possible to get the first dozen or so
into a recent tree. It's not until after that that the changes touch areas
that have the high churn rate, but it may mean things like threaded apps
may have issues...  I'll see what I can do over the holidays.

Warner

--0000000000009a8f7005b6acc040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 10:10 AM Warn=
er Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 9:21 AM Peter Maydell &lt;<a=
 href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, 17 Dec 2020 at 16:03, Warner Losh &lt;<a href=3D"mailto:=
imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; On Thu, Dec 17, 2020 at 7:02 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; =
wrote:<br>
&gt;&gt; I don&#39;t recall what happened after that initial discussion abo=
ut<br>
&gt;&gt; merging the new impl. Did Sean simply not have the time to invest<=
br>
&gt;&gt; in the merge ? I&#39;ll CC him here to see what opinion he has on =
the<br>
&gt;&gt; future of bsd-user in QEMU.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;ve actually taken over for Sean Bruno managing this.<br>
<br>
&gt; I&#39;d love to hear from people ways that I can speed things up.<br>
<br>
There was a bit of discussion about this on #qemu IRC the other<br>
day, coincidentally. I think the conclusion we (upstream QEMU)<br>
came to was that we&#39;d be happy with a &quot;delete all of bsd-user<br>
and reinstate&quot; approach, assuming that the &quot;reinstate&quot; part =
is<br>
in reasonably logical chunks and not one big &quot;here&#39;s what we<br>
have all in one lump&quot; patch.<br>
<br>
AIUI from IRC this is being primarily driven by FreeBSD and<br>
NetBSD/OpenBSD support is merely &quot;we hope it is not broken<br>
by the delete-and-reinstate but it was probably broken anyway&quot; ?<br></=
blockquote><div><br></div><div>Yea, I don&#39;t think it actually works for=
 anything non-trivial on the other BSDs.</div></div></div></blockquote><div=
><br></div><div>Looking at the changes, it may be possible to get the first=
 dozen or so into a recent tree. It&#39;s not until after that that the cha=
nges touch areas that have the high churn rate, but it may mean things like=
 threaded apps may have issues...=C2=A0 I&#39;ll see what I can do over the=
 holidays.=C2=A0</div><div><br></div><div>Warner</div></div></div>

--0000000000009a8f7005b6acc040--

