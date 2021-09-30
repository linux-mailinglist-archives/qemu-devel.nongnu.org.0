Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C332441D094
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 02:34:07 +0200 (CEST)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVk1W-0000Rj-Sk
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 20:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVjzc-00081d-6o
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVjza-0006WR-9R
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632961925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Sg16EQ/ELyLyN1NzQmcc4v/dFLkTNZ1/8al+M03WqI=;
 b=RmXR/txj6iJuog37jaEhXoWTchTbPHBPibqk0tkj+f/wxAyhlBKY2ofH7763TwEY+jJfX5
 XGVgPFQ0pyrkZBprU21pGoy7WMl8kDT/Iqa5dpUPYr6JGlvv99i9jAmusTsp+QOfr8qMo4
 6R2Peo+8Uc6nzThrTVUzR2knpNQOkTY=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-UFoW4oxrOCOkKMRBrz4t4w-1; Wed, 29 Sep 2021 20:32:03 -0400
X-MC-Unique: UFoW4oxrOCOkKMRBrz4t4w-1
Received: by mail-vs1-f70.google.com with SMTP id
 s22-20020a67d096000000b002d82ca46270so5472vsi.8
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 17:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Sg16EQ/ELyLyN1NzQmcc4v/dFLkTNZ1/8al+M03WqI=;
 b=0z4AgtJvXtA2JMfPBAPbFzrEevF0Pg9PW387JQY3ZbkeMS/DWNzVT6SPJ6ySnsMnKk
 EhSKvSca/TST+zCi54jXsgE/AZ0uNY+eUFYP3eHPNRj1AkBGuwX3bvWsDuGZtvfwRHP0
 438YEOvUzxOZf5CuPHLpXCR9UfndPx11roaLjcbolmaPdec6bYgcjNSYJApCJRn6bFNP
 by0/DtcLU8laJHnzWtUwvt1TWz2swThl2nepbxgJddqyAkSn/HZuvbifvMvFWcvIXnHz
 3uPmYICC4QmIQ6XN7QyP5rxOCUzpaQvSJb3BXkRzuCyse/CaPLEAGueEKatsK0oNDO0T
 KMYw==
X-Gm-Message-State: AOAM530GZux1AfcKz+b/77cw37vI0SJ37r1PxVmxhY87Y5wSSTyhRPfh
 JG7ZFY4ruBs7gslnccBLLtaagfzS7ZDKLGEKNAlcaUTztBhQmAHsHHPdbsXCEo1uRHd5G4Sqm9d
 moL/bgrrJUjTLI6ecD4SWKYZm2h8mAQE=
X-Received: by 2002:a67:f685:: with SMTP id n5mr1130634vso.31.1632961923216;
 Wed, 29 Sep 2021 17:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHRxI0dsMj8sPRrNZf/Nop9a7iVft86T7pde9Y3IgjVqkGFnlIfhe4tKcRhDnRrKZc4Tos6r4KrexBrA4fci4=
X-Received: by 2002:a67:f685:: with SMTP id n5mr1130621vso.31.1632961923063;
 Wed, 29 Sep 2021 17:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <3a2b391c-df8e-96ef-570e-4dde6002241e@greensocs.com>
In-Reply-To: <3a2b391c-df8e-96ef-570e-4dde6002241e@greensocs.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 29 Sep 2021 20:31:52 -0400
Message-ID: <CAFn=p-ZNU19DT7Ysqesey0hRVY1JAeHs-PhpNCrT8Wop-GEaBw@mail.gmail.com>
Subject: Re: QAPI sync meeting
To: Damien Hedde <damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005b3b9605cd2b930a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b3b9605cd2b930a
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 9:52 AM Damien Hedde <damien.hedde@greensocs.com>
wrote:

>
>
> On 9/27/21 18:55, John Snow wrote:
> > Hiya,
> >
> > I'd like to propose that at least the three of us arrange a time to have
> > a meeting where we discuss our plans and ideas for QAPI going forward,
> > including rust, python, and golang extensions to the QAPI generator,
> > what we hope to accomplish with those projects, and so on.
> >
> > What I am hoping to get out of this for myself is a high-level overview
> > of people's plans for QAPI and to produce some notes on those plans so
> > that I can have a reference that we've all acknowledged as roughly
> > accurate to be able to keep the community's design goals for QAPI in
> > mind as I continue my own development. Ultimately, I'd like some kind of
> > rough draft of a "QAPI roadmap".
> >
> > I know there was a rust meetup during KVM Forum, but I was unable to
> > attend due to the timing. I'd like to expand the focus a little more
> > broadly to QAPI in general and discuss our "personal" roadmaps, goals,
> > queued work, etc so that we can collaboratively formulate a broader
> > vision of our work.
> >
> > I'm posting to qemu-devel in case anyone else has an interest in this
> > area and would like to eavesdrop or share opinions, but we should
> > probably come up with an agenda first. So:
> >
>
> I would be interested too.
>
> My current topic of interest is somewhat distant (roughly: "remote"
> machine assembly) but I would like to better understand the QAPI roadmap.
>
>
The area that greensocs is working on is of direct interest to me as well:
I want 100% QEMU configuration via QMP.

(And then either I drop the command line, or re-architect the CLI such that
it is 100% a mapping onto equivalent QMP, or ... something. It's been a
somewhat hot topic at times, but 100% QMP configuration seems like where
the meat of the work is, anyway. Everything after that is kinda just
'details'.)


> --
> Damien
>
>

--0000000000005b3b9605cd2b930a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 29, 2021 at 9:52 AM Damie=
n Hedde &lt;<a href=3D"mailto:damien.hedde@greensocs.com">damien.hedde@gree=
nsocs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
On 9/27/21 18:55, John Snow wrote:<br>
&gt; Hiya,<br>
&gt; <br>
&gt; I&#39;d like to propose that at least the three of us arrange a time t=
o have <br>
&gt; a meeting where we discuss our plans and ideas for QAPI going forward,=
 <br>
&gt; including rust, python, and golang extensions to the QAPI generator, <=
br>
&gt; what we hope to accomplish with those projects, and so on.<br>
&gt; <br>
&gt; What I am hoping to get out of this for myself is a high-level overvie=
w <br>
&gt; of people&#39;s plans for QAPI and to produce some notes on those plan=
s so <br>
&gt; that I can have a reference that we&#39;ve all acknowledged as roughly=
 <br>
&gt; accurate to be able to keep the community&#39;s design goals for QAPI =
in <br>
&gt; mind as I continue my own development. Ultimately, I&#39;d like some k=
ind of <br>
&gt; rough draft of a &quot;QAPI roadmap&quot;.<br>
&gt; <br>
&gt; I know there was a rust meetup during KVM Forum, but I was unable to <=
br>
&gt; attend due to the timing. I&#39;d like to expand the focus a little mo=
re <br>
&gt; broadly to QAPI in general and discuss our &quot;personal&quot; roadma=
ps, goals, <br>
&gt; queued work, etc so that we can collaboratively formulate a broader <b=
r>
&gt; vision of our work.<br>
&gt; <br>
&gt; I&#39;m posting to qemu-devel in case anyone else has an interest in t=
his <br>
&gt; area and would like to eavesdrop or share opinions, but we should <br>
&gt; probably come up with an agenda first. So:<br>
&gt; <br>
<br>
I would be interested too.<br>
<br>
My current topic of interest is somewhat distant (roughly: &quot;remote&quo=
t; <br>
machine assembly) but I would like to better understand the QAPI roadmap.<b=
r>
<br></blockquote><div><br></div><div>The area that greensocs is working on =
is of direct interest to me as well: I want 100% QEMU configuration via QMP=
.</div><div><br></div><div>(And then either I drop the command line, or re-=
architect the CLI such that it is 100% a mapping onto equivalent QMP, or ..=
. something. It&#39;s been a somewhat hot topic at times, but 100% QMP conf=
iguration seems like where the meat of the work is, anyway. Everything afte=
r that is kinda just &#39;details&#39;.)<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
--<br>
Damien<br>
<br>
</blockquote></div></div>

--0000000000005b3b9605cd2b930a--


