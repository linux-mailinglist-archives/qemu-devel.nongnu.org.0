Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8F4E2DE8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:29:07 +0100 (CET)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKu2-0002Hd-I8
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:29:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWKpB-0003Gv-Dq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWKp7-0001Oe-7m
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hndn9dhS38pR5E4IwnvR3pHjY/n/j2M59mYCxeGB6m8=;
 b=LtULYzuq21NDIgIeRtiSjbeaMSmnYYNQfQwDotP4w/6xSpMfTQa6rC78o+Le725bF/Y/yv
 himIggCrcoCJqVBLGeRYqkUqzfI23/SvzILB+gKS2yM0ddAiojFvvJ5vubhogzCusjJBOt
 tyO7M5/P4WiOZ58J3JrMdGgIMIkixko=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-wO9eRD3ZO5eP01rFSWts-Q-1; Mon, 21 Mar 2022 12:23:57 -0400
X-MC-Unique: wO9eRD3ZO5eP01rFSWts-Q-1
Received: by mail-ua1-f72.google.com with SMTP id
 p13-20020ab02a4d000000b0034c69e9477dso6372156uar.11
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hndn9dhS38pR5E4IwnvR3pHjY/n/j2M59mYCxeGB6m8=;
 b=sCBcEGIV/O+1B6iNg2o67LDxbG8baPYS+tnx6wVeKhiCG0vgSXGVvfXN5vtMyvUq1t
 BrRjJQo7ScS1ka/WX7tDBkZG5a6vnkGGgFktLfTI+TFtJ6Rg2adnGpXb2qJ/Ebx/PQr7
 I03FXfU9QpET7VNEUIKTT/r5b8HZjOkeGfzPSyCjYm27qezaQhBGim//PHl2/7W51M3s
 epLapvwVjQJhU1vIjHQNW2LrlQn6wCChdY2cXg8z52fQjfoMFUQYMeSoRF5NF+RQ3CDW
 c1p20RqmCpVdZA+FeMf32ZDbW7SHel2Y9zepF1+RiMaIns1IzDSwPfWbh6ztNDreSv0l
 g97A==
X-Gm-Message-State: AOAM530ktpoX71Jxfnzkr08jn4mZdHRMEXoQuXwC+C1PdKHxHcR2zaIW
 pSGV/IdfyKPx8ZOqsTT4su8yXeDad3HaNw8M3/Ot76ksmhy5Ca04T1lMVgfLwrPLFeCmHzCDexY
 OhiTAozKtS6a91ouAraV/tVJbQDZFtkI=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr5410589vse.61.1647879837036; 
 Mon, 21 Mar 2022 09:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzerMHiRVzIDbOAoVyW3ir+hm6mgfXBP3g3MNcofi/gheSSs7AECzP54UfAKvQOToQb7fTu1GGJOZhuL5JvfIk=
X-Received: by 2002:a67:4c3:0:b0:324:ddd7:70d3 with SMTP id
 186-20020a6704c3000000b00324ddd770d3mr5410563vse.61.1647879836480; Mon, 21
 Mar 2022 09:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220317234937.569525-1-jsnow@redhat.com>
 <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
 <CAFn=p-bffj3CK9o2haN-3PDRQvyMcdnMRJ0fKpqAFifYq_L63A@mail.gmail.com>
 <96332ab4-c4fb-75c3-d865-4fe3d2588325@redhat.com>
 <c75ad6d2-c4cc-bf79-3f7b-ac150450dd65@redhat.com>
In-Reply-To: <c75ad6d2-c4cc-bf79-3f7b-ac150450dd65@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 21 Mar 2022 12:23:46 -0400
Message-ID: <CAFn=p-aDoMOf0urEibgsiNoKgrX9vqvk+11nB5gKOnqAGA-ohA@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000049494d05dabcec24"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000049494d05dabcec24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022, 11:50 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 21.03.22 14:14, Hanna Reitz wrote:
> > On 18.03.22 22:14, John Snow wrote:
> >> On Fri, Mar 18, 2022 at 9:36 AM Hanna Reitz <hreitz@redhat.com> wrote:
> >>> On 18.03.22 00:49, John Snow wrote:
> >>>> Hiya!
> >>>>
> >>>> This series effectively replaces qemu_img_pipe_and_status() with a
> >>>> rewritten function named qemu_img() that raises an exception on
> >>>> non-zero
> >>>> return code by default. By the end of the series, every last
> >>>> invocation
> >>>> of the qemu-img binary ultimately goes through qemu_img().
> >>>>
> >>>> The exception that this function raises includes stdout/stderr outpu=
t
> >>>> when the traceback is printed in a a little decorated text box so th=
at
> >>>> it stands out from the jargony Python traceback readout.
> >>>>
> >>>> (You can test what this looks like for yourself, or at least you
> >>>> could,
> >>>> by disabling ztsd support and then running qcow2 iotest 065.)
> >>>>
> >>>> Negative tests are still possible in two ways:
> >>>>
> >>>> - Passing check=3DFalse to qemu_img, qemu_img_log, or img_info_log
> >>>> - Catching and handling the CalledProcessError exception at the
> >>>> callsite.
> >>> Thanks!  Applied to my block branch:
> >>>
> >>> https://gitlab.com/hreitz/qemu/-/commits/block
> >>>
> >>> Hanna
> >>>
> >> Actually, hold it -- this looks like it is causing problems with the
> >> Gitlab CI. I need to investigate these.
> >> https://gitlab.com/jsnow/qemu/-/pipelines/495155073/failures
> >>
> >> ... and, ugh, naturally the nice error diagnostics are suppressed here
> >> so I can't see them. Well, there's one more thing to try and fix
> >> somehow.
> >
> > I hope this patch by Thomas fixes the logging at least:
> >
> > https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg02946.html
>
> So I found three issues:
>
> 1. check-patch wrongfully complains about the comment added in in
> =E2=80=9Cpython/utils: add add_visual_margin() text decoration utility=E2=
=80=9D that
> shows an example for how the output looks.  It complains the lines
> consisting mostly of =E2=80=9C=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=80=9D were too long.  I believe that=E2=
=80=99s because
> it counts bytes, not characters.
>
> Not fatal, i.e. doesn=E2=80=99t break the pipeline.  We should ignore tha=
t.
>

Agree. (Though I did shorten the lines in my re-spin to see if I could make
it shut up, but it didn't work. Ignoring it is.)


> 2. riscv64-debian-cross-container breaks, but that looks pre-existing.
> apt complains about some dependencies.
>
> Also marked as allowed-to-fail, so I believe we should also just ignore
> that.  (Seems to fail on `master`, too.)
>

Yeah, I don't think this is me.


> 3. The rest are runs complaining about
> `subprocess.CompletedProcess[str]`.  Looks like the same issue I was
> facing for ec88eed8d14088b36a3495710368b8d1a3c33420, where I had to
> specify the type as a string.
>
> Indeed this is fixed by something like
>
> https://gitlab.com/hreitz/qemu/-/commit/87615eb536bdca7babe8eb4a35fd4ea81=
0d1da24
> .  Maybe squash that in?  (If it=E2=80=99s the correct way to go about th=
is?)
>
> Hanna
>

Yep, sorry for not replying. I respun the series and tested it, but it
became "way too Saturday" for me to hit send on the respin. Will do so
today.

(Annoying: I test under python 3.6, but I didn't *run the iotests with
3.6*, which is where this problem shows up. Meh.)

--00000000000049494d05dabcec24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Mar 21, 2022, 11:50 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 21.03.22 14:14, Hanna Reitz wrote:<br>
&gt; On 18.03.22 22:14, John Snow wrote:<br>
&gt;&gt; On Fri, Mar 18, 2022 at 9:36 AM Hanna Reitz &lt;<a href=3D"mailto:=
hreitz@redhat.com" target=3D"_blank" rel=3D"noreferrer">hreitz@redhat.com</=
a>&gt; wrote:<br>
&gt;&gt;&gt; On 18.03.22 00:49, John Snow wrote:<br>
&gt;&gt;&gt;&gt; Hiya!<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This series effectively replaces qemu_img_pipe_and_status(=
) with a<br>
&gt;&gt;&gt;&gt; rewritten function named qemu_img() that raises an excepti=
on on <br>
&gt;&gt;&gt;&gt; non-zero<br>
&gt;&gt;&gt;&gt; return code by default. By the end of the series, every la=
st <br>
&gt;&gt;&gt;&gt; invocation<br>
&gt;&gt;&gt;&gt; of the qemu-img binary ultimately goes through qemu_img().=
<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The exception that this function raises includes stdout/st=
derr output<br>
&gt;&gt;&gt;&gt; when the traceback is printed in a a little decorated text=
 box so that<br>
&gt;&gt;&gt;&gt; it stands out from the jargony Python traceback readout.<b=
r>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; (You can test what this looks like for yourself, or at lea=
st you <br>
&gt;&gt;&gt;&gt; could,<br>
&gt;&gt;&gt;&gt; by disabling ztsd support and then running qcow2 iotest 06=
5.)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Negative tests are still possible in two ways:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; - Passing check=3DFalse to qemu_img, qemu_img_log, or img_=
info_log<br>
&gt;&gt;&gt;&gt; - Catching and handling the CalledProcessError exception a=
t the <br>
&gt;&gt;&gt;&gt; callsite.<br>
&gt;&gt;&gt; Thanks!=C2=A0 Applied to my block branch:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://gitlab.com/hreitz/qemu/-/commits/block" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/hreitz/qemu=
/-/commits/block</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hanna<br>
&gt;&gt;&gt;<br>
&gt;&gt; Actually, hold it -- this looks like it is causing problems with t=
he<br>
&gt;&gt; Gitlab CI. I need to investigate these.<br>
&gt;&gt; <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/495155073/fai=
lures" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/j=
snow/qemu/-/pipelines/495155073/failures</a><br>
&gt;&gt;<br>
&gt;&gt; ... and, ugh, naturally the nice error diagnostics are suppressed =
here<br>
&gt;&gt; so I can&#39;t see them. Well, there&#39;s one more thing to try a=
nd fix<br>
&gt;&gt; somehow.<br>
&gt;<br>
&gt; I hope this patch by Thomas fixes the logging at least:<br>
&gt;<br>
&gt; <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2022-03/ms=
g02946.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
nongnu.org/archive/html/qemu-devel/2022-03/msg02946.html</a><br>
<br>
So I found three issues:<br>
<br>
1. check-patch wrongfully complains about the comment added in in <br>
=E2=80=9Cpython/utils: add add_visual_margin() text decoration utility=E2=
=80=9D that <br>
shows an example for how the output looks.=C2=A0 It complains the lines <br=
>
consisting mostly of =E2=80=9C=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=80=9D were too long.=C2=A0 I believe that=E2=
=80=99s because <br>
it counts bytes, not characters.<br>
<br>
Not fatal, i.e. doesn=E2=80=99t break the pipeline.=C2=A0 We should ignore =
that.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Agree. (Though I did shorten the lines in my re-spin to see if I could=
 make it shut up, but it didn&#39;t work. Ignoring it is.)</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
2. riscv64-debian-cross-container breaks, but that looks pre-existing.=C2=
=A0 <br>
apt complains about some dependencies.<br>
<br>
Also marked as allowed-to-fail, so I believe we should also just ignore <br=
>
that.=C2=A0 (Seems to fail on `master`, too.)<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Yeah, I don&#39;t think this i=
s me.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
3. The rest are runs complaining about <br>
`subprocess.CompletedProcess[str]`.=C2=A0 Looks like the same issue I was <=
br>
facing for ec88eed8d14088b36a3495710368b8d1a3c33420, where I had to <br>
specify the type as a string.<br>
<br>
Indeed this is fixed by something like <br>
<a href=3D"https://gitlab.com/hreitz/qemu/-/commit/87615eb536bdca7babe8eb4a=
35fd4ea810d1da24" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
itlab.com/hreitz/qemu/-/commit/87615eb536bdca7babe8eb4a35fd4ea810d1da24</a>=
 <br>
.=C2=A0 Maybe squash that in?=C2=A0 (If it=E2=80=99s the correct way to go =
about this?)<br>
<br>
Hanna<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Yep, sorry for not replying. I respun the series and tested it, but it=
 became &quot;way too Saturday&quot; for me to hit send on the respin. Will=
 do so today.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(Annoying:=
 I test under python 3.6, but I didn&#39;t *run the iotests with 3.6*, whic=
h is where this problem shows up. Meh.)</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000049494d05dabcec24--


