Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054E331809
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 21:02:04 +0100 (CET)
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJM4p-00026Q-Im
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 15:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJM2t-0001ZJ-Ro
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:00:04 -0500
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:38525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lJM2o-0002qP-PH
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 15:00:02 -0500
Received: by mail-qk1-x72d.google.com with SMTP id f124so10637336qkj.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 11:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FSTB+M4GgLJO/6LLpKSCSN3j85OqYuvhnwsoFeLov28=;
 b=U3qLRVbrIdscAOi+XzLudTv7LuRLxYgRWnD1/QT/GOPbLIc7ui/CiOJz/HyO//jztk
 aq+/CvN+K9fFg/3hCTR0gvdiFVvBaDqQC5nTy3etdEvMR8WQRrkb/0Rvwm0LwnkPGnZ/
 OVwVFhfVrEY63gtHLEaOnFn+7iqw7U7dupSrVYd4VWI+bMjphMdFjnYf6e+CGg6CAKBZ
 Xz1wRY63+b1HTgVBOlzI1TbwKE+xq5+c30822EC7e5FIsuPmeWszBb19ZH7BMxUfmSZO
 IceByS92KfkwSOUbzlJuEla1XWHvXh7V/9FAMd80a1vA3G4m5xPCqO/V7aFT2ILkFJmP
 IocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSTB+M4GgLJO/6LLpKSCSN3j85OqYuvhnwsoFeLov28=;
 b=YIEQhKxgcow6n6Rfj/V6DYmAFo4PmZTo0OPfcFurxUnlU0YkbwvjE/osVgmLj+nYOE
 Z22bh6r+eRLjKo0KHdvBxZ7RVQAyx7DmKb42YpgsGJ02y0RJJB7Y5zRxPY4S/9ShysX0
 pKOU5765p6MjjFhMXIqrlg6AJvyK5hPSsI5CrjMOpRZ03s/HyNQqbTPk2N3NNfqklWwV
 rMzM5m9sGumdAFRrrAk3Z0XSYFzow3lWgQWu9NMwDhnMUX3DO+FGVeN2mec2Ooomqlnf
 zcKBnezOQAXllRjAEMclQ+ixmkh930Jjjgr10GEcJ457NIhgp/dobWmnf4o3ngz+0Ck6
 ipdQ==
X-Gm-Message-State: AOAM5337tVtKwqrXmamfJ1tqIT6AA2t6Y1JT4JpipUXWQpmvSrok4Q3g
 +GAnBNEs4myJ72dxy82I5qEWms8hn9/K7Y1QBvGoVg==
X-Google-Smtp-Source: ABdhPJzaDJXVxXgr2FTinPJR/PHBMcEwy5nHguiHWGDOeARZ4Sofsz/g7CEF59Ks4ftJ0NpYNh+1j+M6G3MUMfiUl/s=
X-Received: by 2002:a37:a845:: with SMTP id r66mr21820347qke.89.1615233597209; 
 Mon, 08 Mar 2021 11:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
 <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
 <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
 <YEYVPsRcE1S9vuo3@redhat.com>
 <843150bc-7a6e-38e7-8957-22087ce0d80e@redhat.com>
 <CANCZdfoS4n9Dcymj4G9pC=CZ3E_POvi8nSZwHfSqKoHORpYzZA@mail.gmail.com>
 <YEZCe6CjX0aEWapR@redhat.com>
In-Reply-To: <YEZCe6CjX0aEWapR@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Mar 2021 12:59:46 -0700
Message-ID: <CANCZdfr107ziN2-PbupihUJe9i0SokiL4V_sVg9jYYtN05JQKQ@mail.gmail.com>
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ca956705bd0be059"
Received-SPF: none client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca956705bd0be059
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 8, 2021 at 8:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Mon, Mar 08, 2021 at 08:21:34AM -0700, Warner Losh wrote:
> > On Mon, Mar 8, 2021 at 6:14 AM Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com
> >
> > wrote:
> >
> > > On 3/8/21 1:14 PM, Daniel P. Berrang=C3=A9 wrote:
> > > > On Mon, Mar 08, 2021 at 12:55:10PM +0100, Thomas Huth wrote:
> > > >> On 08/03/2021 12.16, Philippe Mathieu-Daud=C3=A9 wrote:
> > > >>> Hi Peter,
> > > >>>
> > > >>> +Markus/Paolo/Laurent/Richard
> > > >>>
> > > >>> On 3/8/21 11:24 AM, Peter Maydell wrote:
> > > >>>> On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com>
> wrote:
> > > >>>>>
> > > >>>>> On 07/03/2021 16.56, Warner Losh wrote:
> > > >>>>>> The FreeBSD project has a number of enhancements to bsd-user.
> Add
> > > myself
> > > >>>>>> as maintainer and Kyle Evans as a reviewer. Also add our githu=
b
> > > repo.
> > > >>>>>>
> > > >>>>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
> > > >>>>>> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > > >>>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> > > >>>>>> ---
> > > >>>>>>    MAINTAINERS | 5 ++++-
> > > >>>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
> > > >>>>>>
> > > >>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
> > > >>>>>> index 26c9454823..ec0e935038 100644
> > > >>>>>> --- a/MAINTAINERS
> > > >>>>>> +++ b/MAINTAINERS
> > > >>>>>> @@ -2896,9 +2896,12 @@ F: thunk.c
> > > >>>>>>    F: accel/tcg/user-exec*.c
> > > >>>>>>
> > > >>>>>>    BSD user
> > > >>>>>> -S: Orphan
> > > >>>>>> +M: Warner Losh <imp@bsdimp.com>
> > > >>>>>> +R: Kyle Evans <kevans@freebsd.org>
> > > >>>>>> +S: Maintained
> > > >>>>>>    F: bsd-user/
> > > >>>>>>    F: default-configs/targets/*-bsd-user.mak
> > > >>>>>> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user
> > > bsd-user-rebase-3.1
> > > >>>>>
> > > >>>>> BSD is not really my home turf, but since nobody else picked
> this up
> > > and I
> > > >>>>> plan to send a pull request for a bunch of patches anyway this
> week,
> > > I can
> > > >>>>> also put it into my queue.
> > > >>>>
> > > >>>> Fine with me. (The v1 was in my to-review queue, but I'm current=
ly
> > > >>>> running somewhat behind on processing patches.)
> > > >>>
> > > >>> This is a patch for mainstream QEMU, I'm having hard time
> > > >>> understanding the point of it. This is some official way
> > > >>> to say that BSD-user is not maintained in mainstream but
> > > >>> has to be used in the referred fork which is way different
> > > >>> that mainstream...
> > > >>>
> > > >>> I'd rather wait for more mainstream contributions from Warner
> > > >>> and Kyle, or blow the current orphan/dead code and import
> > > >>> bsd-user-rebase-3.1 adding the maintainer entries along, but
> > > >>> certainly not mark this dead code as maintained.
> > > >>>
> > > >>> Please convince me why I'm wrong, because I'd prefer NAck this
> > > >>> patch...
> > > >>
> > > >> The idea has been discussed here:
> > > >>
> > > >> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01399.htm=
l
> > > >>
> > > >> So this is not about declaring that bsd-user is maintained in a
> > > different
> > > >> repository, but about giving Warner et al. a chance to finally
> upstream
> > > >> their work.
> > > >
> > > > Yep, I think this change in MAINTAINERS file is primarily about
> > > signalling
> > > > intent for future
> > >
> >
> >  Yes. Just so. We have the older fork that we're trying to port forward=
.
> If
> > people have changes as we do that, it sure would be nice to have them g=
o
> > through us rather than create more conflict with the main tree. I don't
> > need to have a new set of conflicts with main because someone thought
> that
> > it would be a good idea to move the space before or after the '(' or
> after
> > in a bunch of files. It's just extra work if I have to do it as part of
> the
> > merging. Better that goes into the top of our queue so it's managed and
> > easy and a click on github than another half hour I have to spend sorti=
ng
> > that out when I'd rather be sorting out the substantial change that go =
on
> > upstream in other areas that legitimately do make things much better.
> >
> > We talked about all this in the above thread, I thought, and I thought =
it
> > was all settled, so I was rather surprised to wake up to this thread th=
is
> > morning.
>
> From my POV, nothing has changed - I think the MAINTAINERS change is
> reasonable.
>
>
> > > > Marking the subsystem as maintained isn't saying the current code i=
s
> > > great,
> > > > just that there is someone committed to improving it hereafter.
> > >
> > > OK, thank Thomas / Daniel for explaining and referring to the "BSD-us=
er
> > > plans" (which I didn't notice earlier).
> > >
> > > Warner, what about mentioning your plans here in this patch?
> > >
> >
> > Where is there room in the MAINTAINERS file for that? How would you lik=
e
> me
> > to do that?
>
> I think he was just referring to mentioning the intention in the
> commit message.  The MAINTAINERS file isn't a suitable place for
> describing plans.
>

Ah, that makes sense... I can do that and resend.


> > > > If we want to warn people that the current impl isn't great, that's
> goes
> > > > back to the topic of having a way to classify QEMU features into
> quality
> > > > levels Tier 1/2/3.
> > >
> > > That indeed sounds good w.r.t. contributors / users expectations.
> > >
> > > I suppose 1=3Dhw_accel/security, 2=3Dtested, 3=3Drest?
> > >
> > > Not a single clue how to do that although.
> > >
> >
> > Yup. Why invent something new just to make it harder for me to get thin=
gs
> > into the tree? There's already the tiered maintainer stuff, and I'm
> trying
> > to get our stuff that turn the current bsd-user that's crap into
> something
> > that's quite solid.
>
>
> ...snip...
>
> You don't have to worry about this  - it is tangential to your patch
> here - a problem facing QEMU as a whole, not BSD specific, and there's
> no immediate answer here either.
>

Gotcha. I wasn't sure if there was something else I needed to do here or
not.

Warner

--000000000000ca956705bd0be059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 8:28 AM Daniel=
 P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Mon, Mar 08, 2021 at 08:21:34AM -0700, Warner Losh wrote:<br>
&gt; On Mon, Mar 8, 2021 at 6:14 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<b=
r>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On 3/8/21 1:14 PM, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt; &gt; On Mon, Mar 08, 2021 at 12:55:10PM +0100, Thomas Huth wrote:=
<br>
&gt; &gt; &gt;&gt; On 08/03/2021 12.16, Philippe Mathieu-Daud=C3=A9 wrote:<=
br>
&gt; &gt; &gt;&gt;&gt; Hi Peter,<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; +Markus/Paolo/Laurent/Richard<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; On 3/8/21 11:24 AM, Peter Maydell wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt; On Mon, 8 Mar 2021 at 10:09, Thomas Huth &lt;<a =
href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; On 07/03/2021 16.56, Warner Losh wrote:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; The FreeBSD project has a number of enha=
ncements to bsd-user. Add<br>
&gt; &gt; myself<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; as maintainer and Kyle Evans as a review=
er. Also add our github<br>
&gt; &gt; repo.<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Warner Losh &lt;<a href=
=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Kyle Evans &lt;<a href=3D=
"mailto:kevans@freebsd.org" target=3D"_blank">kevans@freebsd.org</a>&gt;<br=
>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; Reviewed-by: Thomas Huth &lt;<a href=3D"=
mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 MAINTAINERS | 5 ++++-<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 4 insertion=
s(+), 1 deletion(-)<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; diff --git a/MAINTAINERS b/MAINTAINERS<b=
r>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; index 26c9454823..ec0e935038 100644<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; --- a/MAINTAINERS<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; +++ b/MAINTAINERS<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; @@ -2896,9 +2896,12 @@ F: thunk.c<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 F: accel/tcg/user-exec*.c<b=
r>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 BSD user<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; -S: Orphan<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; +M: Warner Losh &lt;<a href=3D"mailto:im=
p@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; +R: Kyle Evans &lt;<a href=3D"mailto:kev=
ans@freebsd.org" target=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; +S: Maintained<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 F: bsd-user/<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 F: default-configs/targets/=
*-bsd-user.mak<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;&gt; +T: git <a href=3D"https://github.com/qe=
mu-bsd-user/qemu-bsd-user" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/qemu-bsd-user/qemu-bsd-user</a><br>
&gt; &gt; bsd-user-rebase-3.1<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; BSD is not really my home turf, but since no=
body else picked this up<br>
&gt; &gt; and I<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; plan to send a pull request for a bunch of p=
atches anyway this week,<br>
&gt; &gt; I can<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; also put it into my queue.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Fine with me. (The v1 was in my to-review queue,=
 but I&#39;m currently<br>
&gt; &gt; &gt;&gt;&gt;&gt; running somewhat behind on processing patches.)<=
br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; This is a patch for mainstream QEMU, I&#39;m having =
hard time<br>
&gt; &gt; &gt;&gt;&gt; understanding the point of it. This is some official=
 way<br>
&gt; &gt; &gt;&gt;&gt; to say that BSD-user is not maintained in mainstream=
 but<br>
&gt; &gt; &gt;&gt;&gt; has to be used in the referred fork which is way dif=
ferent<br>
&gt; &gt; &gt;&gt;&gt; that mainstream...<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; I&#39;d rather wait for more mainstream contribution=
s from Warner<br>
&gt; &gt; &gt;&gt;&gt; and Kyle, or blow the current orphan/dead code and i=
mport<br>
&gt; &gt; &gt;&gt;&gt; bsd-user-rebase-3.1 adding the maintainer entries al=
ong, but<br>
&gt; &gt; &gt;&gt;&gt; certainly not mark this dead code as maintained.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Please convince me why I&#39;m wrong, because I&#39;=
d prefer NAck this<br>
&gt; &gt; &gt;&gt;&gt; patch...<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; The idea has been discussed here:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel=
/2021-01/msg01399.html" rel=3D"noreferrer" target=3D"_blank">https://lists.=
gnu.org/archive/html/qemu-devel/2021-01/msg01399.html</a><br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; So this is not about declaring that bsd-user is maintain=
ed in a<br>
&gt; &gt; different<br>
&gt; &gt; &gt;&gt; repository, but about giving Warner et al. a chance to f=
inally upstream<br>
&gt; &gt; &gt;&gt; their work.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yep, I think this change in MAINTAINERS file is primarily ab=
out<br>
&gt; &gt; signalling<br>
&gt; &gt; &gt; intent for future<br>
&gt; &gt;<br>
&gt; <br>
&gt;=C2=A0 Yes. Just so. We have the older fork that we&#39;re trying to po=
rt forward. If<br>
&gt; people have changes as we do that, it sure would be nice to have them =
go<br>
&gt; through us rather than create more conflict with the main tree. I don&=
#39;t<br>
&gt; need to have a new set of conflicts with main because someone thought =
that<br>
&gt; it would be a good idea to move the space before or after the &#39;(&#=
39; or after<br>
&gt; in a bunch of files. It&#39;s just extra work if I have to do it as pa=
rt of the<br>
&gt; merging. Better that goes into the top of our queue so it&#39;s manage=
d and<br>
&gt; easy and a click on github than another half hour I have to spend sort=
ing<br>
&gt; that out when I&#39;d rather be sorting out the substantial change tha=
t go on<br>
&gt; upstream in other areas that legitimately do make things much better.<=
br>
&gt; <br>
&gt; We talked about all this in the above thread, I thought, and I thought=
 it<br>
&gt; was all settled, so I was rather surprised to wake up to this thread t=
his<br>
&gt; morning.<br>
<br>
From my POV, nothing has changed - I think the MAINTAINERS change is<br>
reasonable.<br>
<br>
<br>
&gt; &gt; &gt; Marking the subsystem as maintained isn&#39;t saying the cur=
rent code is<br>
&gt; &gt; great,<br>
&gt; &gt; &gt; just that there is someone committed to improving it hereaft=
er.<br>
&gt; &gt;<br>
&gt; &gt; OK, thank Thomas / Daniel for explaining and referring to the &qu=
ot;BSD-user<br>
&gt; &gt; plans&quot; (which I didn&#39;t notice earlier).<br>
&gt; &gt;<br>
&gt; &gt; Warner, what about mentioning your plans here in this patch?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Where is there room in the MAINTAINERS file for that? How would you li=
ke me<br>
&gt; to do that?<br>
<br>
I think he was just referring to mentioning the intention in the<br>
commit message.=C2=A0 The MAINTAINERS file isn&#39;t a suitable place for<b=
r>
describing plans.<br></blockquote><div><br></div><div>Ah, that makes sense.=
.. I can do that and resend.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; &gt; &gt; If we want to warn people that the current impl isn&#39;t gr=
eat, that&#39;s goes<br>
&gt; &gt; &gt; back to the topic of having a way to classify QEMU features =
into quality<br>
&gt; &gt; &gt; levels Tier 1/2/3.<br>
&gt; &gt;<br>
&gt; &gt; That indeed sounds good w.r.t. contributors / users expectations.=
<br>
&gt; &gt;<br>
&gt; &gt; I suppose 1=3Dhw_accel/security, 2=3Dtested, 3=3Drest?<br>
&gt; &gt;<br>
&gt; &gt; Not a single clue how to do that although.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Yup. Why invent something new just to make it harder for me to get thi=
ngs<br>
&gt; into the tree? There&#39;s already the tiered maintainer stuff, and I&=
#39;m trying<br>
&gt; to get our stuff that turn the current bsd-user that&#39;s crap into s=
omething<br>
&gt; that&#39;s quite solid.<br>
<br>
<br>
...snip...<br>
<br>
You don&#39;t have to worry about this=C2=A0 - it is tangential to your pat=
ch<br>
here - a problem facing QEMU as a whole, not BSD specific, and there&#39;s<=
br>
no immediate answer here either.<br></blockquote><div><br></div><div>Gotcha=
. I wasn&#39;t sure if there was something else I needed to do here or not.=
</div><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000ca956705bd0be059--

