Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7D37D00B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:39:39 +0200 (CEST)
Received: from localhost ([::1]:52218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgspe-0003C9-9P
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgsVc-0000bi-15
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:18:56 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgsVY-0000WO-M6
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:18:55 -0400
Received: by mail-ej1-x634.google.com with SMTP id k10so4897335ejj.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QpSMEbW9aiXqyCEmKwpEieam8rZ0zLvL0eVtoJtxjHk=;
 b=WWqUKTXS8T7GweeXXFg+tq66ukzHmfai+U05ovIPFSaC3iboz9GvrNzYGo60O+/1nt
 /7UFSakGr+qd6SxOhlpC5AsUYiHn0l2+BRP/2KL6rf4ulyDaiqpwD8LY6y9ZI4cGeGX9
 RTWin+H2582nV2EqEzYC3xfkrDNLBMhKtDo8CBbse9dOO2FTdImVEwjDPE/VGArx9MB6
 wTHHuPRhEAPZUqzw3QRcNJPx6mR0R+OsSx+2uCsfmsVdhz8gOSh49W0Rut93kqhMvz/T
 EHNBIre2CRvgeKVhQLb+H05cvNyMY30h0D56Aq0yImzACJyf8KVwIkzsij/Ya39BooWA
 Dw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QpSMEbW9aiXqyCEmKwpEieam8rZ0zLvL0eVtoJtxjHk=;
 b=qXbxDav/UDn3bKgch+9VUNj1dW9DYVboApuDTGHNBLvPWTdff8w2rkQOPNTmPhyw2C
 xJC3CV/BD0bsDBjsVq1CNzkEOhBC5rk3byDLlETgddMgdmzrbVe51xuPgIEcmuMB9/Kj
 sW9qZj/LxVifX0Qp7dihM34Vau4dvOppRE4krr2gAR0fccVmlvuMi+LmRIjV1O6k4kFV
 KJpMx8eNIMsg0kcIMgLoGHQ8Q/PnGfqfEcBKFGBhi4iHuiKd8ommyf3nRTCys0dkupac
 py/vMAi/U96smEAhbmep319gxbuazBY4WhLT5PCB2BqwWhInPW522a15t/EIn8OslfLX
 FiXQ==
X-Gm-Message-State: AOAM532Av+8ewGpk+q+zpUINlvUFZ9UrMUD8QhUBlkoqS0xHPZqxw+4B
 z166UjtQTjHLhRBbT30qsjLPdVq0GYxWQc7lHEs=
X-Google-Smtp-Source: ABdhPJwd0lCHGlGSBxqobXaushYU13D+F81t/0yhJMwDHF02SloWfB3u9Jo4KnG1BqROAwgEnts6v0tQ24mnRnwbDlA=
X-Received: by 2002:a17:907:1b1e:: with SMTP id
 mp30mr38683129ejc.532.1620839930337; 
 Wed, 12 May 2021 10:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-2-dje@google.com>
 <CAJ+F1CJZSbH-QsaAYFWc6kU++vQXcTdmaLsno8dXX5uVrhrLCA@mail.gmail.com>
 <CADPb22Ta2YXj51_2xTV2JD=Nv1z3KF9qCftRbtQ5xF1aUpayZg@mail.gmail.com>
 <CADPb22S2cGbMhoX1kFNgSY5vK3_UwKXV9E3ttAKT71WpB_5CFg@mail.gmail.com>
In-Reply-To: <CADPb22S2cGbMhoX1kFNgSY5vK3_UwKXV9E3ttAKT71WpB_5CFg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 May 2021 21:18:38 +0400
Message-ID: <CAJ+F1C+TzUNq7BOCn7RaKKOztMymY6=+BPxmAYYV8Md=5MQU0A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="00000000000049210405c2253488"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, jasowang@redhat.com,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000049210405c2253488
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 12, 2021 at 8:43 PM Doug Evans <dje@google.com> wrote:

> Ping.
>
> On Fri, May 7, 2021 at 8:46 AM Doug Evans <dje@google.com> wrote:
>
>> On Fri, May 7, 2021 at 8:23 AM Marc-Andr=C3=A9 Lureau <
>> marcandre.lureau@gmail.com> wrote:
>>
>>> Hi
>>>
>>> [...]
>>>>
>>>>
>>>> Changes from v5:
>>>>
>>>> 1/4 slirp: Advance libslirp submodule to current master
>>>> NOTE TO REVIEWERS: It may be a better use of everyone's time if a
>>>> maintainer takes on advancing QEMU's libslirp to libslirp's master.
>>>> Beyond that, I really don't know what to do except submit this patch a=
s
>>>> is currently provided.
>>>>
>>>>
>>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>
>>> It can do, but it should rather be a diff of the commits that are new,
>>> those that were not in the stable branch.
>>>
>>
>>
>> Can you elaborate?
>> E.g., Should a new libslirp release be made first, and then update
>> qemu-master to that new release?
>>
>
>
> Hey Marc-Andr=C3=A9 and Samuel,
> What's the next step here (if any)?
>

There isn't much point in bumping qemu dependency if it doesn't make use of
the new API. Thus first step is to get the rest of the series
reviewed/approved imho.

Would it be preferable to make a new libslirp release instead?
>

yes, as I said in some other path review, we would need a libslirp release
AND compatiblity with older slirp releases.

[I also don't understand the comment "it should rather be a diff of the
> commits that are new, ...".
> I haven't seen this request before (apologies if I missed it), but more
> importantly
> isn't it trivial to generate such diffs, without adding them to the email=
?
> I could be missing something of course.]
>
> At some point a new libslirp release needs to be made, and at some point
> QEMU needs to be updated to use it.
> Seems like now is a good time, but maybe there are reasons to prefer not
> doing so now.
> I can imagine QEMU wanting to always use a stable branch of libslirp,
> so I just want to be absolutely clear that switching QEMU to use
> libslirp's master branch is desired,
> and if anything more is needed from me.
> I'm happy with whatever you decide, but I don't want to waste your time
> guessing and then having to iterate when I guess wrong.
>

You need to rework the series to be compatible with current libslirp. That
may be one of the reason why you don't get more reviews, Jason, the
maintainer, may expect you to do that based on feedback received earlier.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000049210405c2253488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 12, 2021 at 8:43 P=
M Doug Evans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small">Ping.</div><div st=
yle=3D"font-size:small"><br></div><div style=3D"font-size:small">On Fri, Ma=
y 7, 2021 at 8:46 AM Doug Evans &lt;<a href=3D"mailto:dje@google.com" targe=
t=3D"_blank">dje@google.com</a>&gt; wrote:<br></div></div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div dir=3D"ltr"><div style=3D"font-size:small">On Fri, May 7, 2021 at 8:=
23 AM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.c=
om" target=3D"_blank">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gm=
ail_default" style=3D"font-size:small">[...]</span><br><br>
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
f the series reviewed/approved imho.</div><div> <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div style=3D"font-size:small">Would it be preferable to make a new libsl=
irp=C2=A0release instead?</div></div></div></blockquote><div><br></div><div=
>yes, as I said in some other path review, we would need a libslirp release=
 AND compatiblity with older slirp releases.<br></div><div> <br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><div style=3D"font-size:small">[I also don&#39;t understand t=
he comment &quot;it should rather be a diff of the commits that are new, ..=
.&quot;.</div><div style=3D"font-size:small">I haven&#39;t seen this reques=
t before (apologies if I missed it), but more importantly</div><div style=
=3D"font-size:small">isn&#39;t it trivial to generate such diffs, without a=
dding them to the email?</div><div style=3D"font-size:small">I could be mis=
sing something of course.]</div><div style=3D"font-size:small"><br></div><d=
iv style=3D"font-size:small">At some point a new libslirp=C2=A0release need=
s to be made, and at some point QEMU needs to be updated to use it.</div><d=
iv style=3D"font-size:small">Seems like now is a good time, but maybe there=
 are reasons to prefer not doing so now.</div><div style=3D"font-size:small=
">I can imagine QEMU wanting to always use a stable branch of libslirp,</di=
v><div style=3D"font-size:small">so I just want to be absolutely clear that=
 switching QEMU to use libslirp&#39;s master branch is desired,</div><div s=
tyle=3D"font-size:small">and if anything more is needed from me.</div><div =
style=3D"font-size:small">I&#39;m happy with whatever you decide, but I don=
&#39;t want to waste your time guessing and then having to iterate when I g=
uess wrong.</div></div></div>
</blockquote></div><br clear=3D"all"></div><div>You need to rework the seri=
es to be compatible with current libslirp. That may be one of the reason wh=
y you don&#39;t get more reviews, Jason, the maintainer, may expect you to =
do that based on feedback received earlier.<br></div><div><br></div><div>th=
anks<br></div><div><br></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--00000000000049210405c2253488--

