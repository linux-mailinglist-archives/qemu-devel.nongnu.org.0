Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0641D0BF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 02:51:26 +0200 (CEST)
Received: from localhost ([::1]:35746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVkIH-0000fP-Bo
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 20:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVkGN-0008Ji-QR
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVkGK-0000qn-TX
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632962963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KeQrvwHusvizvOOReC83kIQjeXdbT+p0jJ4MpFWYJMM=;
 b=VOT7v2nqoL1l/28IdBeLnuYDGKCshlhacq/sfA/y97M00cBLPrxVjWlQFD/xHCLBQPYMkm
 fxhWScA+Hk+V0Q+oldyyq1eYejylLcXoKxQLcIqYRpGpQTx/ykbUvDmSIb5XTY/mUTfYca
 8GSIRmMOHiZlzGQNXRYUgko/+I89LPo=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-_YBjmxwtOwWk9LOzUpcHhg-1; Wed, 29 Sep 2021 20:49:21 -0400
X-MC-Unique: _YBjmxwtOwWk9LOzUpcHhg-1
Received: by mail-vs1-f72.google.com with SMTP id
 v12-20020a672f0c000000b002d7c2f1d9ffso918654vsv.14
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 17:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KeQrvwHusvizvOOReC83kIQjeXdbT+p0jJ4MpFWYJMM=;
 b=O4419aWvje45BFwOSJFR96xpgeIBJ55upUVlJTizWwK5QJ9VEbTbk9GzE2AGwDMjFV
 yUjTeVPxnLiGIIwt2jh2e+8OLLfFmqc4cKRlm0zqGjNDVk75YwbMq8DUn9a/2h+ac7Mv
 xkCxr9UMvwbHqpQpNVrXJqRLp0kpoypYq7dKqXC8620dD8Xn3JnkNsyasgUZxv2rT9Tr
 coBLmnt2n8ZfUYBQL/cbMpqjffDIDoWBgcKYNsrnBhizovH3pPn6N+MW9IX9YQ0Xp0lw
 sUqAtAzH+Tmf297uZHOmpzRcA8Op6gI8U72Ob3zGFr0wPuUx92V6gYxzhNqalif19tgc
 vC2Q==
X-Gm-Message-State: AOAM53298v6L9VXWxIINcc2jC0vhlOpyWX8XQwc23ID1lcGXl6/LRNBr
 +3qDvS8jro//0pdHphcCHRzLS6NRIlqKQoxMyjNqKr1CxgESlMUsr1lz0EHmeK7s3VaKbTsJXsB
 nJ91pW8pSe5s0RtNdqkG1mlDgsgTh7oM=
X-Received: by 2002:ab0:3c89:: with SMTP id a9mr3503591uax.32.1632962961077;
 Wed, 29 Sep 2021 17:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziNwWSn4b3Q277BlUyQFkHeUfxpFiR+3mxng8bse0UOemKEsOl4Jq6nqQPBJCAoekJT9wdT3gywXWfGiNVRlE=
X-Received: by 2002:ab0:3c89:: with SMTP id a9mr3503579uax.32.1632962960932;
 Wed, 29 Sep 2021 17:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 <87ee97y3q5.fsf@dusky.pond.sub.org>
In-Reply-To: <87ee97y3q5.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 29 Sep 2021 20:49:10 -0400
Message-ID: <CAFn=p-ZeXPux5rh_fuC1joSAiOyt1WsLCAoMw7iE1eUtdgmiBA@mail.gmail.com>
Subject: Re: QAPI sync meeting
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000037d24b05cd2bd1ac"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000037d24b05cd2bd1ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 8:18 AM Markus Armbruster <armbru@redhat.com> wrote=
:

> John Snow <jsnow@redhat.com> writes:
>
> > On Tue, Sep 28, 2021 at 9:53 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> >> On Mon, Sep 27, 2021 at 12:55:34PM -0400, John Snow wrote:
>
> [...]
>
> >> > - Any weekday after 13:00 UTC. Wednesdays, Thursdays and Fridays wor=
k
> >> > particularly well for me at the moment.
> >> > - bluejeans and google meeting both work well for me. Open to
> alternatives.
>
> Congratulations, you've just crowned yourself meeting organizer!  Pick a
> date, time, and place, then herd the cats there.
>
>
ACK. Will send out a proper invite.


> I can't do next Friday.  I think we should aim for next week, to give us
> time to coordinate and to prepare.
>
>
ACK


> >> Are you suggesting a 1-off meeting or a regular meeting, or an adhoc
> >> set of meetings ?
> >>
> >>
> > I'm proposing a one-off here just for some initial discussion and
> planning.
> > (We didn't have a QAPI BoF at KVM Forum and I'd like something similar
> > now.) I don't expect we'll really "finish" plotting out a roadmap in a
> > single 60 minute meeting, but it will probably give us good, targeted
> > discussions on the ML to follow. If more meetings are desired to discus=
s
> > specific topics, I'm not against scheduling them as-needed.
>
> Let's have one now, and then more as needed.
>
> Jumping into the meeting unprepared, then spending half of the alloted
> time listening to people explaining where they want to take QAPI seems
> like a bad use of our time.  Better: write it up and post it, so we can
> all read before we meet.  Do not reply, except perhaps to ask for
> clarification.  Discuss in the meeting.
>
> I can see such posts from Marc-Andre, Kevin, and Daniel.  Some of them
> could use a bit more detail, perhaps.
>
> Thoughts?
>
>
Works for me. I can send out a short summary beforehand, too, but I will
want to aggregate them in bullet-list digestible form for the meeting
minutes. I am suggesting a call to begin with so that I can set aside a
time specifically to discuss items with all interested parties ... at a
time when I'm awake. O:-)


> > (I personally don't really mind semi-regular sync-up meetings, like onc=
e
> > every other month or something to that effect -- it keeps me motivated
> and
> > on track. I suspect that Markus does not quite feel the same way about
> 'em,
> > so I'm just trying to not sign him up for stuff.)
>
> More regular meetings sit fairly low on my personal wish list.
>
>
O:-) O:-) O:-)

--00000000000037d24b05cd2bd1ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Sep 29, 2021 at 8:18 AM Markus Armbruster &lt;<a href=3D=
"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">John Snow &lt;<a href=3D"mailto=
:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Tue, Sep 28, 2021 at 9:53 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Mon, Sep 27, 2021 at 12:55:34PM -0400, John Snow wrote:<br>
<br>
[...]<br>
<br>
&gt;&gt; &gt; - Any weekday after 13:00 UTC. Wednesdays, Thursdays and Frid=
ays work<br>
&gt;&gt; &gt; particularly well for me at the moment.<br>
&gt;&gt; &gt; - bluejeans and google meeting both work well for me. Open to=
 alternatives.<br>
<br>
Congratulations, you&#39;ve just crowned yourself meeting organizer!=C2=A0 =
Pick a<br>
date, time, and place, then herd the cats there.<br>
<br></blockquote><div><br></div><div>ACK. Will send out a proper invite.<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I can&#39;t do next Friday.=C2=A0 I think we should aim for next week, to g=
ive us<br>
time to coordinate and to prepare.<br>
<br></blockquote><div><br></div><div>ACK<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; Are you suggesting a 1-off meeting or a regular meeting, or an adh=
oc<br>
&gt;&gt; set of meetings ?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; I&#39;m proposing a one-off here just for some initial discussion and =
planning.<br>
&gt; (We didn&#39;t have a QAPI BoF at KVM Forum and I&#39;d like something=
 similar<br>
&gt; now.) I don&#39;t expect we&#39;ll really &quot;finish&quot; plotting =
out a roadmap in a<br>
&gt; single 60 minute meeting, but it will probably give us good, targeted<=
br>
&gt; discussions on the ML to follow. If more meetings are desired to discu=
ss<br>
&gt; specific topics, I&#39;m not against scheduling them as-needed.<br>
<br>
Let&#39;s have one now, and then more as needed.<br>
<br>
Jumping into the meeting unprepared, then spending half of the alloted<br>
time listening to people explaining where they want to take QAPI seems<br>
like a bad use of our time.=C2=A0 Better: write it up and post it, so we ca=
n<br>
all read before we meet.=C2=A0 Do not reply, except perhaps to ask for<br>
clarification.=C2=A0 Discuss in the meeting.<br>
<br>
I can see such posts from Marc-Andre, Kevin, and Daniel.=C2=A0 Some of them=
<br>
could use a bit more detail, perhaps.<br>
<br>
Thoughts?<br>
<br></blockquote><div><br></div><div>Works for me. I can send out a short s=
ummary beforehand, too, but I will want to aggregate them in bullet-list di=
gestible form for the meeting minutes. I am suggesting a call to begin with=
 so that I can set aside a time specifically to discuss items with all inte=
rested parties ... at a time when I&#39;m awake. O:-)<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; (I personally don&#39;t really mind semi-regular sync-up meetings, lik=
e once<br>
&gt; every other month or something to that effect -- it keeps me motivated=
 and<br>
&gt; on track. I suspect that Markus does not quite feel the same way about=
 &#39;em,<br>
&gt; so I&#39;m just trying to not sign him up for stuff.)<br>
<br>
More regular meetings sit fairly low on my personal wish list.<br>
<br></blockquote><div><br></div><div>O:-) O:-) O:-) </div></div></div>

--00000000000037d24b05cd2bd1ac--


