Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9E3F3C90
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 23:22:32 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHYRj-0003Pj-Mt
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 17:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mHYQI-0002QN-5U
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 17:21:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:47059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mHYQG-0000I5-8z
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 17:21:01 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so3311770pjx.5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0kclWbcgfGkkgtlwhTUx/lA/BtyCHL4/8li1Zyv7jM=;
 b=lzaLd+cHenvvu5CGnDAzXP4s9Aud+HxSn6vWTdRN88ZmuXFc9CNxKAogr+q+46x7nZ
 n0aGe57jDdIuAp5M3eiw/Y1g/T+0qk3kiq7l4QLwpN332qbg5WpA6ONBCtatLYh8fZAL
 29ctouzAZEfXqzot4TV72eBQNxL5eSEIJoitZFoeJNaQ9/m36yk8ASYrHZ2NCTSnh1rt
 3eAUJupMvSr3BJq73aDUikZWO1HgIZXVaBPiTIuGFJcv+Mzrh7bABAoqLjLbD8ojlCe3
 6ycyhucXUdiulACPc8vc+6O4GO9nel2975ZMU5oPSiYAO0QBRmUcqHtyjNQjS6nD44sB
 +DHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0kclWbcgfGkkgtlwhTUx/lA/BtyCHL4/8li1Zyv7jM=;
 b=VwNR1w4XyVjCJqL7PNOcH/TX4HoRbrL3qdntCLngozbtkz99cTx0Mga8dxwKZI4lox
 8fBdaDW6nVYKeG9IibPcMvUqnvk6nRcOoYTV2PtT/yMYwtr5C9w5Xz3W7BYz2Bgd9RIQ
 behkSumWNVgHJ5Ab+0pfvywEZZu6srPLVLvGm7zDqRI++PZa+5vEAxW6lrp0DG8xH9OR
 /Fspb4hOq+Cr5tkXvTHCZEuwZ8YWU4ouVgnDJFYmimDE2ucQYMpaCjS3BM5sCT8KjSKA
 pLYjaxLvXoNXSh1Epha1xp8AOVP7G6My02ujR/FuPEk3lMz8+jlv0rWx/ewGw/P+8MoC
 Opdg==
X-Gm-Message-State: AOAM532GmxV0ELLDyKnkObjnfX0LVYgfNI2UzncU3K+XDujFC7JKTm2R
 BnzgYVWmAnFCyqSm+sv7zCQV/bgOrhruV11OkAo=
X-Google-Smtp-Source: ABdhPJzrwck5Q+udLQ2M8H4laWwwn4c5IQy4E6ecFJQWbNjDkw3bBQ62hA11rDHd0s8GxA0z6IYGYBPZXO4eXQdeQdk=
X-Received: by 2002:a17:90a:7848:: with SMTP id
 y8mr11292178pjl.223.1629580857658; 
 Sat, 21 Aug 2021 14:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
 <CAFn=p-aGU-T=vPY+LUHtcc7OVWH_BX880N_ZKN15Pcr5tqTEzw@mail.gmail.com>
In-Reply-To: <CAFn=p-aGU-T=vPY+LUHtcc7OVWH_BX880N_ZKN15Pcr5tqTEzw@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Sun, 22 Aug 2021 02:50:31 +0530
Message-ID: <CAN6ztm_CkN+CaU8McRvEiJDjvj8QUv8tTvy3URJbCwiKECWXfA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] AQMP TUI Draft
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000027514705ca185c5f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1033.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000027514705ca185c5f
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 21, 2021 at 9:39 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Thu, Aug 19, 2021 at 1:39 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Hello all,
>>
>> Gitlab:
>> https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v4
>> CI: https://gitlab.com/niteesh.gs/qemu/-/pipelines/356024270
>>
>> Revision since v3:
>> 1) Added docstrings
>> 2) Minor changes in AQMP TUI Draft
>> 3) Switched to constant retry delay in QMP connection manager and other
>>    minor changes.
>>
>> G S Niteesh Babu (7):
>>   python: disable pylint errors for aqmp-tui
>>   python: Add dependencies for AQMP TUI
>>   python/aqmp-tui: Add AQMP TUI draft
>>   python: Add entry point for aqmp-tui
>>   python: add optional pygments dependency
>>   python/aqmp-tui: Add syntax highlighting
>>   python/aqmp-tui: Add QMP connection manager
>>
>>  python/Pipfile.lock          |  20 +
>>  python/qemu/aqmp/aqmp_tui.py | 681 +++++++++++++++++++++++++++++++++++
>>  python/setup.cfg             |  29 +-
>>  3 files changed, 729 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>
>> --
>> 2.17.1
>>
>>
> Hiya, please specify what your branch is based on when you submit your
> patchsets using the Based-On tag.
>
Oops sorry, I'll make sure to add it in the next revision.

>
> - It's time to drop patch #1 entirely.
>
- We can drop the word 'draft' from the commit messages now, let's try to
> make this solid.
>
- If you want to keep the TODO comments in the code, add a pylint
> configuration item that allows "todo" but disallows "fixme" and "xxx"
> comments.
>

> Detailed review to follow tomorrow, but you can start working on these
> items right away. I might also squash patch #7 directly into patch #3, but
> haven't looked too closely yet.
>
I have addressed all your above comments in this branch
https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v5
except squashing of patches #3 and #7. Will do it once you review patch #7.

>
> (Note that due to an update to pylint that happened just today, check-tox
> is going to fail now -- that's fine, it's not your fault. As long as
> check-pipenv works, you're in good shape. I'll have a fix in my python
> branch tomorrow for these problems.)
>

--00000000000027514705ca185c5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, Aug 21, 2021 at 9:39 AM John Snow &l=
t;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 1:39 PM G S Nite=
esh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">nite=
esh.gs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hello all,<br>
<br>
Gitlab: <a href=3D"https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-pr=
ototype-v4" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh=
.gs/qemu/-/commits/aqmp-tui-prototype-v4</a><br>
CI: <a href=3D"https://gitlab.com/niteesh.gs/qemu/-/pipelines/356024270" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/niteesh.gs/qemu/-/pip=
elines/356024270</a><br>
<br>
Revision since v3:<br>
1) Added docstrings<br>
2) Minor changes in AQMP TUI Draft<br>
3) Switched to constant retry delay in QMP connection manager and other<br>
=C2=A0 =C2=A0minor changes.<br>
<br>
G S Niteesh Babu (7):<br>
=C2=A0 python: disable pylint errors for aqmp-tui<br>
=C2=A0 python: Add dependencies for AQMP TUI<br>
=C2=A0 python/aqmp-tui: Add AQMP TUI draft<br>
=C2=A0 python: Add entry point for aqmp-tui<br>
=C2=A0 python: add optional pygments dependency<br>
=C2=A0 python/aqmp-tui: Add syntax highlighting<br>
=C2=A0 python/aqmp-tui: Add QMP connection manager<br>
<br>
=C2=A0python/Pipfile.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +<br=
>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 681 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 29 +-<br>
=C2=A03 files changed, 729 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
-- <br>
2.17.1<br>
<br></blockquote><div><br></div><div>Hiya, please specify what your branch =
is based on when you submit your patchsets using the Based-On tag.</div></d=
iv></div></blockquote><div><span class=3D"gmail_default" style=3D"font-size=
:small">Oops sorry, I&#39;ll make sure to add it in the next revision.</spa=
n>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div><br></div><div>- It&#39;s time to dro=
p patch #1 entirely.</div></div></div></blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=
</div><div>- We can drop the word &#39;draft&#39; from the commit messages =
now, let&#39;s try to make this solid.</div></div></div></blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div>- If you want to keep the TODO comments in the code, add =
a pylint configuration item that allows &quot;todo&quot; but disallows &quo=
t;fixme&quot; and &quot;xxx&quot; comments.=C2=A0</div></div></div></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_quote"><div><br></div><div>Detailed review to follow tomor=
row, but you can start working on these items right away. I might also squa=
sh patch #7 directly into patch #3, but haven&#39;t looked too closely yet.=
</div></div></div></blockquote><div><span class=3D"gmail_default" style=3D"=
font-size:small">I have addressed all your above comments in this branch</s=
pan>=C2=A0<span class=3D"gmail_default" style=3D"font-size:small"><a href=
=3D"https://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v5">htt=
ps://gitlab.com/niteesh.gs/qemu/-/commits/aqmp-tui-prototype-v5</a></span><=
/div><div><span class=3D"gmail_default" style=3D"font-size:small">except sq=
uashing of patches #3 and #7. Will do it once you review patch #7.</span></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
 class=3D"gmail_quote"><div><br></div><div>(Note that due to an update to p=
ylint that happened just today, check-tox
 is going to fail now -- that&#39;s fine, it&#39;s not your fault. As long =
as=20
check-pipenv works, you&#39;re in good shape. I&#39;ll have a fix in my pyt=
hon branch tomorrow for these problems.)<br></div></div></div>
</blockquote></div></div>
</div>

--00000000000027514705ca185c5f--

