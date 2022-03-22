Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78D4E4443
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:32:55 +0100 (CET)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhRE-0006i7-Uh
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:32:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhPF-0003QW-G7
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:30:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhPD-0007Z5-BS
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647966646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aviOVJJe/zAC3ZpokErGsVNF26XWqoXagZoyur5yUFI=;
 b=TRei5I5Uzp8VKSdyzl+8m4iqTyiCQ0sVn31QyEJyB1rLwC2gdUmBOeeNSZyHCTuxJGm5Nu
 +09xLS5rPjFhwAxEIcOlTfg2iJVSvyo02AMG2HOrYBF6IotgORA0Gw+9t6eToqG74abhOm
 EXh7Yr2PtRjxQPzGdcnlPtUL8Ej9yV8=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-Vh2A3W3mOuWAujQU_IrW9w-1; Tue, 22 Mar 2022 12:30:45 -0400
X-MC-Unique: Vh2A3W3mOuWAujQU_IrW9w-1
Received: by mail-vk1-f199.google.com with SMTP id
 s191-20020a1f2cc8000000b00331bc5a8878so2822056vks.6
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aviOVJJe/zAC3ZpokErGsVNF26XWqoXagZoyur5yUFI=;
 b=vGWogJvbklWkki2q5A21ZGYrYRpd59L83qPaAHI3gK9pf1CgkJ8iZbekb6Z0Tv5pQX
 tvBWjqjUGL6IdMcXn2YwYwkkKiT4Ze3DDYSxCB46/8Ij4wykE0um6l/cEwt+bQ+31fkQ
 HNwHwntqxQLY3/AsSExKfYgbl+G9XkAx7lpU8DECNUs1Ppjy1bcEy1HrnyTDp+j+WDlA
 l4USzp04A6l4NdAPsPDrzr9wIlVUOSzYCdLwRAoTDviEHOKog6SfSGC0flc+bMvT8re1
 cw3XcPWARDWRlCuh/vz/2f/ngZnSUTr/Z+Odxi4BNPIxcGigsGOgoBrX4kxqPoDl+Q05
 nl1w==
X-Gm-Message-State: AOAM530l1QGmTh16z9KalHUci7o6PkU4IfNd7CP+R0aUMBl4fulTBHCG
 1QtelKWQF+f3/aHUcU0Sv6Q6orABL0PkEC1Kjj/ki3r01BXUIJD7dL2T8uhbvB0mUY/ZwCIcPR1
 eIgqm10uIAUvK5MCMFhZ1Tegb0rloKSk=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr8965281vsv.35.1647966644591; 
 Tue, 22 Mar 2022 09:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqopdwM4XasFBQzgiEBW5eRAs9QK78fVt5yGMsTlp1OtjY2OMsGdXt8Ysj10WaxK33M/9ACuNW+FeBcR1O1tg=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr8965269vsv.35.1647966644299; Tue, 22
 Mar 2022 09:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-7-jsnow@redhat.com>
 <d89a365d-161b-e7bb-e5a0-80418e60d063@redhat.com>
In-Reply-To: <d89a365d-161b-e7bb-e5a0-80418e60d063@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 12:30:34 -0400
Message-ID: <CAFn=p-YWjxRpMf3c3V4YkLJgii2jm97qrjHHmRc=7ezSyJ+UUQ@mail.gmail.com>
Subject: Re: [PATCH 06/15] iotests: rebase qemu_io() on top of qemu_tool()
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006f7c0b05dad1222a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006f7c0b05dad1222a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022, 11:04 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 18.03.22 21:36, John Snow wrote:
> > Rework qemu_io() to be analogous to qemu_img(); a function that require=
s
> > a return code of zero by default unless disabled explicitly.
> >
> > Tests that use qemu_io():
> > 030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 205
> > 209 219 236 245 248 254 255 257 260 264 280 298 300 302 304
> > image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test
> > migrate-during-backup migration-permissions
> >
> > Test that use qemu_io_log():
> > 242 245 255 274 303 307 nbd-reconnect-on-open
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > Note: This breaks several tests at this point. I'll be fixing each
> > broken test one by one in the subsequent commits. We can squash them al=
l
> > on merge to avoid test regressions.
>
> Well, absolutely.
>
> > (Seems like a way to have your cake and eat it too with regards to
> > maintaining bisectability while also having nice mailing list patches.)
>
> I personally find reviewability to not be affected whether this is one
> patch or multiple, given that the changes are in different files anyway.
>
> I am afraid someone might forgot to squash when merging this series,
> though...
>
> Also, I don=E2=80=99t know how to squash R-b tags, and I don=E2=80=99t fe=
el like I can
> give an R-b for a patch that decidedly breaks tests.
>
> >
> > Copy-pastables:
> >
> > ./check -qcow2 030 040 041 044 055 056 124 129 132 151 152 163 165 209 =
\
> >                 219 236 242 245 248 254 255 257 260 264 274 \
> >                 280 298 300 302 303 304 307 image-fleecing \
> >                 migrate-bitmaps-postcopy-test migrate-bitmaps-test \
> >                 migrate-during-backup nbd-reconnect-on-open
> >
> > ./check -raw 093 136 148 migration-permissions
> >
> > ./check -nbd 205
> >
> > # ./configure configure --disable-gnutls --enable-gcrypt
> > # this ALSO requires passwordless sudo.
> > ./check -luks 149
> >
> >
> > # Just the ones that fail:
> > ./check -qcow2 030 040 242 245
> > ./check -raw migration-permissions
> > ./check -nbd 205
> > ./check -luks 149
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/iotests.py | 19 +++++++++++++------
> >   1 file changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/iotests.py
> b/tests/qemu-iotests/iotests.py
> > index 974a2b0c8d..58ea766568 100644
> > --- a/tests/qemu-iotests/iotests.py
> > +++ b/tests/qemu-iotests/iotests.py
> > @@ -354,16 +354,23 @@ def qemu_io_wrap_args(args: Sequence[str]) ->
> List[str]:
> >   def qemu_io_popen(*args):
> >       return qemu_tool_popen(qemu_io_wrap_args(args))
> >
> > -def qemu_io(*args):
> > -    '''Run qemu-io and return the stdout data'''
> > -    return qemu_tool_pipe_and_status('qemu-io',
> qemu_io_wrap_args(args))[0]
> > +def qemu_io(*args: str, check: bool =3D True, combine_stdio: bool =3D =
True
> > +            ) -> subprocess.CompletedProcess[str]:
>
> I guess this return type probably has to be quoted.
>

Yep. Sent this just before I figured out the problem from the prior series.
I'll make sure this whole series passes CI before I send it out a second
time.

I'll rebase on your staging branch and take my time with v2.


> > +    """
> > +    Run QEMU_IO_PROG and return the status code and console output.
> > +
> > +    This function always prepends either QEMU_IO_OPTIONS or
> > +    QEMU_IO_OPTIONS_NO_FMT.
> > +    """
> > +    return qemu_tool(*qemu_io_wrap_args(args),
> > +                     check=3Dcheck, combine_stdio=3Dcombine_stdio)
> >
> >   def qemu_io_pipe_and_status(*args):
> >       return qemu_tool_pipe_and_status('qemu-io',
> qemu_io_wrap_args(args))
> >
> > -def qemu_io_log(*args):
> > -    result =3D qemu_io(*args)
> > -    log(result, filters=3D[filter_testfiles, filter_qemu_io])
> > +def qemu_io_log(*args: str) -> subprocess.CompletedProcess[str]:
>
> ...and this one.
>
> Hanna
>
> > +    result =3D qemu_io(*args, check=3DFalse)
> > +    log(result.stdout, filters=3D[filter_testfiles, filter_qemu_io])
> >       return result
> >
> >   def qemu_io_silent(*args):
>
>

--0000000000006f7c0b05dad1222a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 22, 2022, 11:04 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 18.03.22 21:36, John Snow wrote:<br>
&gt; Rework qemu_io() to be analogous to qemu_img(); a function that requir=
es<br>
&gt; a return code of zero by default unless disabled explicitly.<br>
&gt;<br>
&gt; Tests that use qemu_io():<br>
&gt; 030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 20=
5<br>
&gt; 209 219 236 245 248 254 255 257 260 264 280 298 300 302 304<br>
&gt; image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test<br>
&gt; migrate-during-backup migration-permissions<br>
&gt;<br>
&gt; Test that use qemu_io_log():<br>
&gt; 242 245 255 274 303 307 nbd-reconnect-on-open<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Note: This breaks several tests at this point. I&#39;ll be fixing each=
<br>
&gt; broken test one by one in the subsequent commits. We can squash them a=
ll<br>
&gt; on merge to avoid test regressions.<br>
<br>
Well, absolutely.<br>
<br>
&gt; (Seems like a way to have your cake and eat it too with regards to<br>
&gt; maintaining bisectability while also having nice mailing list patches.=
)<br>
<br>
I personally find reviewability to not be affected whether this is one <br>
patch or multiple, given that the changes are in different files anyway.<br=
>
<br>
I am afraid someone might forgot to squash when merging this series, <br>
though...<br>
<br>
Also, I don=E2=80=99t know how to squash R-b tags, and I don=E2=80=99t feel=
 like I can <br>
give an R-b for a patch that decidedly breaks tests.<br>
<br>
&gt;<br>
&gt; Copy-pastables:<br>
&gt;<br>
&gt; ./check -qcow2 030 040 041 044 055 056 124 129 132 151 152 163 165 209=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0219 236 2=
42 245 248 254 255 257 260 264 274 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0280 298 3=
00 302 303 304 307 image-fleecing \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate-b=
itmaps-postcopy-test migrate-bitmaps-test \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migrate-d=
uring-backup nbd-reconnect-on-open<br>
&gt;<br>
&gt; ./check -raw 093 136 148 migration-permissions<br>
&gt;<br>
&gt; ./check -nbd 205<br>
&gt;<br>
&gt; # ./configure configure --disable-gnutls --enable-gcrypt<br>
&gt; # this ALSO requires passwordless sudo.<br>
&gt; ./check -luks 149<br>
&gt;<br>
&gt;<br>
&gt; # Just the ones that fail:<br>
&gt; ./check -qcow2 030 040 242 245<br>
&gt; ./check -raw migration-permissions<br>
&gt; ./check -nbd 205<br>
&gt; ./check -luks 149<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/iotests.py | 19 +++++++++++++------<br>
&gt;=C2=A0 =C2=A01 file changed, 13 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotest=
s.py<br>
&gt; index 974a2b0c8d..58ea766568 100644<br>
&gt; --- a/tests/qemu-iotests/iotests.py<br>
&gt; +++ b/tests/qemu-iotests/iotests.py<br>
&gt; @@ -354,16 +354,23 @@ def qemu_io_wrap_args(args: Sequence[str]) -&gt;=
 List[str]:<br>
&gt;=C2=A0 =C2=A0def qemu_io_popen(*args):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return qemu_tool_popen(qemu_io_wrap_args(arg=
s))<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -def qemu_io(*args):<br>
&gt; -=C2=A0 =C2=A0 &#39;&#39;&#39;Run qemu-io and return the stdout data&#=
39;&#39;&#39;<br>
&gt; -=C2=A0 =C2=A0 return qemu_tool_pipe_and_status(&#39;qemu-io&#39;, qem=
u_io_wrap_args(args))[0]<br>
&gt; +def qemu_io(*args: str, check: bool =3D True, combine_stdio: bool =3D=
 True<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) -&gt; subprocess.Complete=
dProcess[str]:<br>
<br>
I guess this return type probably has to be quoted.<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Yep. Sent this just befo=
re I figured out the problem from the prior series. I&#39;ll make sure this=
 whole series passes CI before I send it out a second time.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I&#39;ll rebase on your staging branc=
h and take my time with v2.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 Run QEMU_IO_PROG and return the status code and console=
 output.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 This function always prepends either QEMU_IO_OPTIONS or=
<br>
&gt; +=C2=A0 =C2=A0 QEMU_IO_OPTIONS_NO_FMT.<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 return qemu_tool(*qemu_io_wrap_args(args),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0check=3Dcheck, combine_stdio=3Dcombine_stdio)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def qemu_io_pipe_and_status(*args):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return qemu_tool_pipe_and_status(&#39;qemu-i=
o&#39;, qemu_io_wrap_args(args))<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -def qemu_io_log(*args):<br>
&gt; -=C2=A0 =C2=A0 result =3D qemu_io(*args)<br>
&gt; -=C2=A0 =C2=A0 log(result, filters=3D[filter_testfiles, filter_qemu_io=
])<br>
&gt; +def qemu_io_log(*args: str) -&gt; subprocess.CompletedProcess[str]:<b=
r>
<br>
...and this one.<br>
<br>
Hanna<br>
<br>
&gt; +=C2=A0 =C2=A0 result =3D qemu_io(*args, check=3DFalse)<br>
&gt; +=C2=A0 =C2=A0 log(result.stdout, filters=3D[filter_testfiles, filter_=
qemu_io])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return result<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def qemu_io_silent(*args):<br>
<br>
</blockquote></div></div></div>

--0000000000006f7c0b05dad1222a--


