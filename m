Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30637C906
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:45:40 +0200 (CEST)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrzP-0005QE-1M
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lgrwy-0003vS-O3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:43:08 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:34647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lgrww-0003gX-Sg
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:43:08 -0400
Received: by mail-ua1-x92d.google.com with SMTP id h4so6234762uap.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I6iJ4B+8D2JcU5dvvoKmrXlDhusBBts/KKqTx0jnYiU=;
 b=YUhvUnkQusMvLphDvkz+NRxtsKHso0C2+E+n3u0oDVwSlMbBq99ZLnkxmivSwy8VRu
 +D3vo6f66YTvCtSMVuZwgpGdk5amVF6jfJEyndVp+2MNWLmmz+pQS/J6XKRftY7ZQPA+
 K/+pRILeA4mexoz4nMcdq0teM8Z18kC2Wy4ofnI506on8BCHHotXgu9YMBxLptSmHRcY
 9e+vpg2aG6hG2SbpUtBOrXLEHXUKETQ2AOGS2UXaf7eVSYDUE8q2a5rYiLhnNLBUZaW/
 kZEZ0k3Qzn36y/QCix+Z4MyoMarwpDZTNyDybF42+Mv3o43ST1l0qpQFdRGzuWcv5Oef
 T0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I6iJ4B+8D2JcU5dvvoKmrXlDhusBBts/KKqTx0jnYiU=;
 b=ju2nWIouewAj4/uCQb7P9P7KuQOKzNnAO1rw8h7Tng8tFo4UDPclSoBQyNw0aaYZbV
 R8c2Zn8JQ1Dk2EOa7jrZPjdW9Pk4iPf6+PIlTSVy3VXCexfFhviP4pEib6kdy5MjfA03
 qHGrVjZvWJaXMyoRHnZKBekn6hrMhSOnbPcwTpbxT1raiMUm86y9zMFCwoXyOPM5QG10
 qiu9gmWghRxHbXNlapISPtxEJ5cpzsENYR9tdtRMhrx3g3fFCu11pAhorKXYeNdwG54j
 mTa7e27kPm2jogs0Mcj2x7x3Rh++ZdXCFVvCmOcZkkmspkYCP8xqbQBgBp8k/11iZzjm
 DlzQ==
X-Gm-Message-State: AOAM531pW8ClqjSARHGYwSNNbLjhztu+7EdjUcOo5VpQB7ArUIHVTqhj
 v13yGGOf7xtmReMshEx2vvTbPe089u1TDfGvzKawrA==
X-Google-Smtp-Source: ABdhPJwdkxmmUllh7JAhnUaovXZD0DHhK0wMQ2tJ5izJnTtBl1KhagagLPJ6KPDIGwVuomc7MxSSvcm9MVITWDooE2A=
X-Received: by 2002:ab0:4e0b:: with SMTP id g11mr15145063uah.22.1620837784204; 
 Wed, 12 May 2021 09:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-2-dje@google.com>
 <CAJ+F1CJZSbH-QsaAYFWc6kU++vQXcTdmaLsno8dXX5uVrhrLCA@mail.gmail.com>
 <CADPb22Ta2YXj51_2xTV2JD=Nv1z3KF9qCftRbtQ5xF1aUpayZg@mail.gmail.com>
In-Reply-To: <CADPb22Ta2YXj51_2xTV2JD=Nv1z3KF9qCftRbtQ5xF1aUpayZg@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Wed, 12 May 2021 09:42:26 -0700
Message-ID: <CADPb22S2cGbMhoX1kFNgSY5vK3_UwKXV9E3ttAKT71WpB_5CFg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005e773405c224b470"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=dje@google.com; helo=mail-ua1-x92d.google.com
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

--0000000000005e773405c224b470
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.

On Fri, May 7, 2021 at 8:46 AM Doug Evans <dje@google.com> wrote:

> On Fri, May 7, 2021 at 8:23 AM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@gmail.com> wrote:
>
>> Hi
>>
>> [...]
>>>
>>>
>>> Changes from v5:
>>>
>>> 1/4 slirp: Advance libslirp submodule to current master
>>> NOTE TO REVIEWERS: It may be a better use of everyone's time if a
>>> maintainer takes on advancing QEMU's libslirp to libslirp's master.
>>> Beyond that, I really don't know what to do except submit this patch as
>>> is currently provided.
>>>
>>>
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> It can do, but it should rather be a diff of the commits that are new,
>> those that were not in the stable branch.
>>
>
>
> Can you elaborate?
> E.g., Should a new libslirp release be made first, and then update
> qemu-master to that new release?
>


Hey Marc-Andr=C3=A9 and Samuel,
What's the next step here (if any)?
Would it be preferable to make a new libslirp release instead?
[I also don't understand the comment "it should rather be a diff of the
commits that are new, ...".
I haven't seen this request before (apologies if I missed it), but more
importantly
isn't it trivial to generate such diffs, without adding them to the email?
I could be missing something of course.]

At some point a new libslirp release needs to be made, and at some point
QEMU needs to be updated to use it.
Seems like now is a good time, but maybe there are reasons to prefer not
doing so now.
I can imagine QEMU wanting to always use a stable branch of libslirp,
so I just want to be absolutely clear that switching QEMU to use libslirp's
master branch is desired,
and if anything more is needed from me.
I'm happy with whatever you decide, but I don't want to waste your time
guessing and then having to iterate when I guess wrong.

--0000000000005e773405c224b470
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Ping.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">On Fr=
i, May 7, 2021 at 8:46 AM Doug Evans &lt;<a href=3D"mailto:dje@google.com">=
dje@google.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small">On Fri, May 7, 2021 at 8:23 AM Marc-An=
dr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D=
"_blank">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" =
style=3D"font-size:small">[...]</span><br><br>
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
div></div></blockquote><div><br></div><div><br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Hey Marc-Andr=C3=A9 and Samuel,</div><div =
class=3D"gmail_default" style=3D"font-size:small">What&#39;s the next step =
here (if any)?</div><div class=3D"gmail_default" style=3D"font-size:small">=
Would it be preferable to make a new libslirp=C2=A0release instead?</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">[I also don&#39;t unde=
rstand the comment &quot;it should rather be a diff of the commits that are=
 new, ...&quot;.</div><div class=3D"gmail_default" style=3D"font-size:small=
">I haven&#39;t seen this request before (apologies if I missed it), but mo=
re importantly</div><div class=3D"gmail_default" style=3D"font-size:small">=
isn&#39;t it trivial to generate such diffs, without adding them to the ema=
il?</div><div class=3D"gmail_default" style=3D"font-size:small">I could be =
missing something of course.]</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">At some point a new libslirp=C2=A0release needs to be made, and at som=
e point QEMU needs to be updated to use it.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Seems like now is a good time, but maybe there=
 are reasons to prefer not doing so now.</div><div class=3D"gmail_default" =
style=3D"font-size:small">I can imagine QEMU wanting to always use a stable=
 branch of libslirp,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">so I just want to be absolutely clear that switching QEMU to use libs=
lirp&#39;s master branch is desired,</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">and if anything more is needed from me.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I&#39;m happy with whatever =
you decide, but I don&#39;t want to waste your time guessing and then havin=
g to iterate when I guess wrong.</div></div></div>

--0000000000005e773405c224b470--

