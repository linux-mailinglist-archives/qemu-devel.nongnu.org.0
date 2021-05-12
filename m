Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4B737D401
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:53:22 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguv3-00056G-F3
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lgutN-0002rr-5a
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:51:37 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:37530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lgutK-0008Hr-IP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 15:51:36 -0400
Received: by mail-ua1-x931.google.com with SMTP id z7so7869208uav.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 12:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8BUVjNlrUOsyaN8oE2LAVrcVpYwU2JpASe1pm0zLqc=;
 b=RsaGYJLUztjeTnedqjb2UTHd2L3kjdj4ZchLUNlH/lZtul9jqomMAupThEqoVBjE8/
 mtsYTqmdJHNWRf8Ph3oGIHNv5vZY/YMhC864gAj8EAZvzVlzGlSE0+BnlIVbf8svX8Sm
 qUI1y/J1VW8wpHM4Kn8B3RbOpem7pgAI4nJl9r+KgoEHA/JO5qNHMh3hTAiLrQDSjNTK
 mde8w94ytQlLuqvSFLrIzyFUiKa+fl9wXaWN330WjrPYtHAlb+e6DzKiboSbifl+cDng
 mbGONR9nn2aD5QHufNlp+uOxuAC6kxzWLNNWvRhxI4dn7xFsoFDD3NnJ52jicqzAFoAX
 /6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8BUVjNlrUOsyaN8oE2LAVrcVpYwU2JpASe1pm0zLqc=;
 b=pgvpfUMTJDb3QEXsDQV9jmHh8QqzTspFwkDge5etJBXyaaauh6D4m3hP0+17rr0/SS
 OVvna72pceSlb2AwhBvjzKyw86MSSM2D28wn/sIfXzohoubmyPMCD6hkYce/R6+ectPR
 38q9OzGcXL0kx+2pXvYZtbrOfGIW7yPZH3QmVYDF2WcrroUiNrzx0eFsyhqrwbpsq/OK
 BFCo1lkjL/QJpXqT6U2LtjpFnu3lSgf7rnghtbc/wMaK95f1JKhZnWFK5MtHMQ64Sd0C
 s0WUtapX/nUHTrkfZ8GA2LlEkjBYiYNFxnvnN/8CPFtK2m/WuRqNfoPiPZUVnwdiZ+37
 tACQ==
X-Gm-Message-State: AOAM5338AeBfJF2FR6tbkQbIzGS4J1KgNnq3xXEJ2JnA6G3NY9gN0ahO
 hQEBxHh/EcKGQ/UF2Ov1VM6udnnNOzbdfRnXCpHV9Q==
X-Google-Smtp-Source: ABdhPJyANZA9z+prG8Qjpr6QbYINANjm9rUj0RxCFhMgJRJ7Yu5VtvzVfCl5S9zsW0NHatEBDb5VC/nAa4RVMHyYSkI=
X-Received: by 2002:ab0:4e0b:: with SMTP id g11mr16067110uah.22.1620849093169; 
 Wed, 12 May 2021 12:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-2-dje@google.com>
 <CAJ+F1CJZSbH-QsaAYFWc6kU++vQXcTdmaLsno8dXX5uVrhrLCA@mail.gmail.com>
 <CADPb22Ta2YXj51_2xTV2JD=Nv1z3KF9qCftRbtQ5xF1aUpayZg@mail.gmail.com>
 <CADPb22S2cGbMhoX1kFNgSY5vK3_UwKXV9E3ttAKT71WpB_5CFg@mail.gmail.com>
 <CAJ+F1C+TzUNq7BOCn7RaKKOztMymY6=+BPxmAYYV8Md=5MQU0A@mail.gmail.com>
In-Reply-To: <CAJ+F1C+TzUNq7BOCn7RaKKOztMymY6=+BPxmAYYV8Md=5MQU0A@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Wed, 12 May 2021 12:50:56 -0700
Message-ID: <CADPb22SGrvWe5+Aonkwq1pcrBENMTMJetzR7WZN6zDkjxjGJNw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006f812905c227566a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=dje@google.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006f812905c227566a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 10:18 AM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Wed, May 12, 2021 at 8:43 PM Doug Evans <dje@google.com> wrote:
>
>> Ping.
>>
>> On Fri, May 7, 2021 at 8:46 AM Doug Evans <dje@google.com> wrote:
>>
>>> On Fri, May 7, 2021 at 8:23 AM Marc-Andr=C3=A9 Lureau <
>>> marcandre.lureau@gmail.com> wrote:
>>>
>>>> Hi
>>>>
>>>> [...]
>>>>>
>>>>>
>>>>> Changes from v5:
>>>>>
>>>>> 1/4 slirp: Advance libslirp submodule to current master
>>>>> NOTE TO REVIEWERS: It may be a better use of everyone's time if a
>>>>> maintainer takes on advancing QEMU's libslirp to libslirp's master.
>>>>> Beyond that, I really don't know what to do except submit this patch =
as
>>>>> is currently provided.
>>>>>
>>>>>
>>>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>>
>>>> It can do, but it should rather be a diff of the commits that are new,
>>>> those that were not in the stable branch.
>>>>
>>>
>>>
>>> Can you elaborate?
>>> E.g., Should a new libslirp release be made first, and then update
>>> qemu-master to that new release?
>>>
>>
>>
>> Hey Marc-Andr=C3=A9 and Samuel,
>> What's the next step here (if any)?
>>
>
> There isn't much point in bumping qemu dependency if it doesn't make use
> of the new API. Thus first step is to get the rest of the series
> reviewed/approved imho.
>


I'm not suggesting the dependency be bumped prior to the entire series
being approved.
By "next step" I meant whether this patch (1/4) in the series is done.
The question I asked: "Should a new libslirp release be made and then have
qemu-master use that (*1)?" was outstanding as it wasn't(isn't) clear
whether the plan was indeed to first make a new libslirp release (even
taking into account the comments on patch 3/4).

(*1): When using QEMU-provided libslirp. When not using QEMU-provided
slirp, of course, be compatible with the libslirp that is being used.
Thanks for bringing that to my attention btw, it's easy to forget given
that QEMU provides its own copy of libslirp and I have completely left that
out of v1 to v5.



> Would it be preferable to make a new libslirp release instead?
>>
>
> yes, as I said in some other path review, we would need a libslirp releas=
e
> AND compatiblity with older slirp releases.
>


Indeed! I was, perhaps errantly, treating them as orthogonal discussions.
[On the theory that:
- if we resolve all issues for each piece of the current iteration then
that will reduce the number of iterations,
and I'm not sure patch 1/4 is complete and what happens next for it (given
that a separate repo is involved)
- discussions of making a new libslirp release can proceed independent of
updating patch 3/4
That was the theory anyway.]



> [I also don't understand the comment "it should rather be a diff of the
>> commits that are new, ...".
>> I haven't seen this request before (apologies if I missed it), but more
>> importantly
>> isn't it trivial to generate such diffs, without adding them to the emai=
l?
>> I could be missing something of course.]
>>
>> At some point a new libslirp release needs to be made, and at some point
>> QEMU needs to be updated to use it.
>> Seems like now is a good time, but maybe there are reasons to prefer not
>> doing so now.
>> I can imagine QEMU wanting to always use a stable branch of libslirp,
>> so I just want to be absolutely clear that switching QEMU to use
>> libslirp's master branch is desired,
>> and if anything more is needed from me.
>> I'm happy with whatever you decide, but I don't want to waste your time
>> guessing and then having to iterate when I guess wrong.
>>
>
> You need to rework the series to be compatible with current libslirp. Tha=
t
> may be one of the reason why you don't get more reviews, Jason, the
> maintainer, may expect you to do that based on feedback received earlier.
>


I'm indeed updating v7 in this series to be compatible with current
libslirp, but let's get the issue of a new libslirp release resolved too.

Btw, can you elaborate on "should rather be a diff of the commits that are
new"?
Up until now I've been told to provide "git shortlog old..new" output.
The patch itself is just a one-liner to update the subproject sha1.

--0000000000006f812905c227566a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, May 12, 2021 at 10:18 AM Marc-Andr=C3=A9 Lureau &lt;<=
a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lu=
reau@gmail.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div d=
ir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, May 12, 2021 at 8:43 PM Doug Evans &lt;<a href=3D"=
mailto:dje@google.com" target=3D"_blank">dje@google.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small">Ping.</div><div style=3D"font-=
size:small"><br></div><div style=3D"font-size:small">On Fri, May 7, 2021 at=
 8:46 AM Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_blank"=
>dje@google.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><div style=3D"font-size:small">On Fri, May 7, 2021 at 8:23 AM Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=
=3D"_blank">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_defaul=
t" style=3D"font-size:small">[...]</span><br><br>
<br>
Changes from v5:<br>
<br>
1/4 slirp: Advance libslirp submodule to current master<br>
NOTE TO REVIEWERS: It may be a better use of everyone&#39;s time if a<br>
maintainer takes on advancing QEMU&#39;s libslirp to libslirp&#39;s master.=
<br>
Beyond that, I really don&#39;t know what to do except submit this patch as=
<br>
is currently provided.<br>
<br></blockquote><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lure=
au &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">mar=
candre.lureau@redhat.com</a>&gt;<br></div></div><br></div><div class=3D"gma=
il_quote">It can do, but it should rather be a diff of the commits that are=
 new, those that were not in the stable branch.</div></div></blockquote><di=
v><br></div><div><br></div><div style=3D"font-size:small">Can you elaborate=
?</div><div style=3D"font-size:small">E.g., Should a new libslirp=C2=A0rele=
ase be made first, and then update qemu-master to that new release?</div></=
div></div></blockquote><div><br></div><div><br></div><div style=3D"font-siz=
e:small">Hey Marc-Andr=C3=A9 and Samuel,</div><div style=3D"font-size:small=
">What&#39;s the next step here (if any)?</div></div></div></blockquote><di=
v><br></div><div>There isn&#39;t much point in bumping qemu dependency if i=
t doesn&#39;t make use of the new API. Thus first step is to get the rest o=
f the series reviewed/approved imho.</div></div></div></div></blockquote><d=
iv><br></div><div><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">I&#39;m not suggesting the dependency be bumped prior to the entire=
 series being approved.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">By &quot;next step&quot; I meant whether this patch (1/4) in the s=
eries is done.</div><div class=3D"gmail_default" style=3D"font-size:small">=
The question I asked: &quot;Should a new libslirp release be made and then =
have qemu-master use that (*1)?&quot; was outstanding as it wasn&#39;t(isn&=
#39;t) clear whether the plan was indeed to first make a new libslirp relea=
se (even taking into account the comments on patch 3/4).</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">(*1): When using QEMU-provided libslirp. Wh=
en not using QEMU-provided slirp, of course, be compatible with the libslir=
p that is being used.</div><div class=3D"gmail_default" style=3D"font-size:=
small">Thanks for bringing that to my attention btw, it&#39;s easy to forge=
t given that QEMU provides its own copy of libslirp=C2=A0and I have complet=
ely left that out of v1 to v5.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div><div class=3D"gmail_quote"><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div style=3D"font-size:small">Would it be preferable to make a new libsl=
irp=C2=A0release instead?</div></div></div></blockquote><div><br></div><div=
>yes, as I said in some other path review, we would need a libslirp release=
 AND compatiblity with older slirp releases.<br></div></div></div></div></b=
lockquote><div><br></div><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Indeed! I was, perhaps errantly, treating them as orth=
ogonal discussions.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">[On the theory that:</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">- if we resolve all issues for each piece of the current iterati=
on then that will reduce the number of iterations,</div><div class=3D"gmail=
_default" style=3D"font-size:small">and I&#39;m not sure patch 1/4 is compl=
ete and what happens next for it (given that a separate repo is involved)</=
div><div class=3D"gmail_default" style=3D"font-size:small">- discussions of=
 making a new libslirp release can proceed independent of updating patch 3/=
4</div><div class=3D"gmail_default" style=3D"font-size:small">That was the =
theory anyway.]</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div class=3D"gm=
ail_quote"><div></div><div> <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div style=3D"font=
-size:small">[I also don&#39;t understand the comment &quot;it should rathe=
r be a diff of the commits that are new, ...&quot;.</div><div style=3D"font=
-size:small">I haven&#39;t seen this request before (apologies if I missed =
it), but more importantly</div><div style=3D"font-size:small">isn&#39;t it =
trivial to generate such diffs, without adding them to the email?</div><div=
 style=3D"font-size:small">I could be missing something of course.]</div><d=
iv style=3D"font-size:small"><br></div><div style=3D"font-size:small">At so=
me point a new libslirp=C2=A0release needs to be made, and at some point QE=
MU needs to be updated to use it.</div><div style=3D"font-size:small">Seems=
 like now is a good time, but maybe there are reasons to prefer not doing s=
o now.</div><div style=3D"font-size:small">I can imagine QEMU wanting to al=
ways use a stable branch of libslirp,</div><div style=3D"font-size:small">s=
o I just want to be absolutely clear that switching QEMU to use libslirp&#3=
9;s master branch is desired,</div><div style=3D"font-size:small">and if an=
ything more is needed from me.</div><div style=3D"font-size:small">I&#39;m =
happy with whatever you decide, but I don&#39;t want to waste your time gue=
ssing and then having to iterate when I guess wrong.</div></div></div>
</blockquote></div><br clear=3D"all"></div><div>You need to rework the seri=
es to be compatible with current libslirp. That may be one of the reason wh=
y you don&#39;t get more reviews, Jason, the maintainer, may expect you to =
do that based on feedback received earlier.</div></div></blockquote><div><b=
r></div><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">I&#39;m indeed updating v7 in this series to be compatible with cur=
rent libslirp, but let&#39;s get the issue of a new libslirp=C2=A0release r=
esolved too.</div></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">B=
tw, can you elaborate on &quot;should rather be a diff of the commits that =
are new&quot;?</div><div class=3D"gmail_default" style=3D"font-size:small">=
Up until now I&#39;ve been told to provide &quot;git shortlog old..new&quot=
; output.</div></div><div class=3D"gmail_default" style=3D"font-size:small"=
>The patch itself is just a one-liner to update the subproject sha1.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div></div></div=
>

--0000000000006f812905c227566a--

