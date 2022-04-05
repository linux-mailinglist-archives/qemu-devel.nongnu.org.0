Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003014F3D21
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 20:09:30 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbncP-00059N-Sw
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 14:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbnbQ-0004Sr-QH
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbnbN-0007G4-Da
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649182104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bqb+sCXS2CFxSl/WVfgzCA8IMqMFxVwj/Hr+E4zBqKw=;
 b=hmu5viqTIdTYVYOallgKwBqRd/2Dkz7aSpRgKahlj/xAqS7MmEngNfPO8nTsaqTe0n52fo
 0IWQmbNAKsDXrtMdrWKpr770s3wcFtfa+rL3BnUK1dL+IVse7eh3rDw+yv7yI21FrhH0HN
 fedRCVA5nAKY0ajMhBJa7/1n8ghQZO4=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-rxDlqRGkOP-h5Vbhl6rTTQ-1; Tue, 05 Apr 2022 14:08:22 -0400
X-MC-Unique: rxDlqRGkOP-h5Vbhl6rTTQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 w16-20020ab067d0000000b0035ceb645456so569336uar.10
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 11:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bqb+sCXS2CFxSl/WVfgzCA8IMqMFxVwj/Hr+E4zBqKw=;
 b=gAwBMn+9/Bkyc0zEs8LTVmcPkd4ppNoaFg3CesgZFPjmTyxdNT2UdVUgEPJYE+0wRf
 NdNTo/OzLXYZWf9r8EW0u+NfV9ltD3aK6Xx69uil7I0k8mWjUwiyBR7TUT6F3O0VLPJL
 +De4jmrQPcWxZuuG7EIkTYHiOuRf4JGrXlc/+r3e+GQMUo4MzKOtG2TNWcOzuXwL1t0D
 IIan11eCk1MeMmZKGlq8gnXwrdvcTDpfvY6iAf1b3rCl0mSEyJuksELmzKHb/LJ4igjH
 QG3VWo33sb/1bEovrQS/xrMJWcUpZuGxPc4b2elfO3jDxYq2faKgSJKj1ry6ZIaJFPRy
 do8A==
X-Gm-Message-State: AOAM531ENdJHnR7XG5ABCpiarw6bRcAtKjom2YvUixeQKa4/UEPwg/M6
 ssRbJrWu6mpY2J2uZgg8iN2mI+EWF7qCmb883+DaWOxWUkj8ZsQ4RBBLQgSYveVp/vHtciYffsC
 9JKiBeAo0Z5NFB5urrYhd3PljZpDV2u4=
X-Received: by 2002:a05:6102:c91:b0:325:e47d:bab2 with SMTP id
 f17-20020a0561020c9100b00325e47dbab2mr1519040vst.35.1649182102209; 
 Tue, 05 Apr 2022 11:08:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyencLC7TlkwFaxOnxYoulbzKdhNXX++i6x+yFdHl7LCKvYRU8yMu7NdPrFK7kOJZ6cVY1Qd2ns17/83r+eaMA=
X-Received: by 2002:a05:6102:c91:b0:325:e47d:bab2 with SMTP id
 f17-20020a0561020c9100b00325e47dbab2mr1519030vst.35.1649182101997; Tue, 05
 Apr 2022 11:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095455.6473-1-damien.hedde@greensocs.com>
 <CAFn=p-bBExx6yKmRSvg2FJP74TP+7bB3w4xTZSJmj8RdkJiqdw@mail.gmail.com>
 <3d52da6c-124d-4de6-432d-be9e0bb16dfe@greensocs.com>
In-Reply-To: <3d52da6c-124d-4de6-432d-be9e0bb16dfe@greensocs.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 5 Apr 2022 14:08:11 -0400
Message-ID: <CAFn=p-Y=sTkeMDiht-TCrQKq8WOvbayXjSKiitJkVqUGL6MQNw@mail.gmail.com>
Subject: Re: [RFC PATCH] python: add qmp-send program to send raw qmp commands
 to qemu
To: Damien Hedde <damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005c1d8405dbec2121"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005c1d8405dbec2121
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 5, 2022, 5:03 AM Damien Hedde <damien.hedde@greensocs.com>
wrote:

>
>
> On 4/4/22 22:34, John Snow wrote:
> > On Wed, Mar 16, 2022 at 5:55 AM Damien Hedde <damien.hedde@greensocs.com>
> wrote:
> >>
> >> It takes an input file containing raw qmp commands (concatenated json
> >> dicts) and send all commands one by one to a qmp server. When one
> >> command fails, it exits.
> >>
> >> As a convenience, it can also wrap the qemu process to avoid having
> >> to start qemu in background. When wrapping qemu, the program returns
> >> only when the qemu process terminates.
> >>
> >> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> >> ---
> >>
> >> Hi all,
> >>
> >> Following our discussion, I've started this. What do you think ?
> >>
> >> I tried to follow Daniel's qmp-shell-wrap. I think it is
> >> better to have similar options (eg: logging). There is also room
> >> for factorizing code if we want to keep them aligned and ease
> >> maintenance.
> >>
> >> There are still some pylint issues (too many branches in main and it
> >> does not like my context manager if else line). But it's kind of a
> >> mess to fix theses so I think it's enough for a first version.
> >
> > Yeah, don't worry about these. You can just tell pylint to shut up
> > while you prototype. Sometimes it's just not worth spending more time
> > on a more beautiful factoring. Oh well.
> >
> >>
> >> I name that qmp-send as Daniel proposed, maybe qmp-test matches better
> >> what I'm doing there ?
> >>
> >
> > I think I agree with Dan's response.
> >
> >> Thanks,
> >> Damien
> >> ---
> >>   python/qemu/aqmp/qmp_send.py | 229 +++++++++++++++++++++++++++++++++++
> >
> > I recommend putting this in qemu/util/qmp_send.py instead.
> >
> > I'm in the process of pulling out the AQMP lib and hosting it
> > separately. Scripts like this I think should stay in the QEMU tree, so
> > moving it to util instead is probably best. Otherwise, I'll *really*
> > have to commit to the syntax, and that's probably a bigger hurdle than
> > you want to deal with.
>
> If it stays in QEMU tree, what licensing should I use ? LGPL does not
> hurt, no ?
>

Whichever you please. GPLv2+ would be convenient and harmonizes well with
other tools. LGPL is only something I started doing so that the "qemu.qmp"
package would be LGPL. Licensing the tools as LGPL was just a sin of
convenience so I could claim a single license for the whole wheel/egg/tgz.

(I didn't want to make separate qmp and qmp-tools packages.)

Go with what you feel is best.


> >
> >>   scripts/qmp/qmp-send         |  11 ++
> >>   2 files changed, 240 insertions(+)
> >>   create mode 100644 python/qemu/aqmp/qmp_send.py
> >>   create mode 100755 scripts/qmp/qmp-send
> >>
> >> diff --git a/python/qemu/aqmp/qmp_send.py b/python/qemu/aqmp/qmp_send.py
> >> new file mode 100644
> >> index 0000000000..cbca1d0205
> >> --- /dev/null
> >> +++ b/python/qemu/aqmp/qmp_send.py
> >
> > Seems broadly fine to me, but I didn't review closely this time. If it
> > works for you, it works for me.
> >
> > As for making QEMU hang: there's a few things you could do, take a
> > look at iotests and see how they handle timeout blocks in synchronous
> > code -- iotests.py line 696 or so, "class Timeout". When writing async
> > code, you can also do stuff like this:
> >
> > async def foo():
> >      await asyncio.wait_for(qmp.execute("some-command", args_etc),
> timeout=30)
> >
> > See https://docs.python.org/3/library/asyncio-task.html#asyncio.wait_for
> >
> > --js
> >
>
> Thanks for the tip,
> --
> Damien
>

Oh, and one more. the legacy.py bindings for AQMP also support a
configurable timeout that applies to most API calls by default.

see https://gitlab.com/jsnow/qemu.qmp/-/blob/main/qemu/qmp/legacy.py#L285

(Branch still in limbo here, but it should still be close to the same in
qemu.git)

I believe this is used by iotests.py when it sets up its machine.py
subclass ("VM", iirc) so that most qmp invocations in iotests have a
default timeout and won't hang tests indefinitely.

--js

>

--0000000000005c1d8405dbec2121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 5, 2022, 5:03 AM Damien Hedde &lt;<a href=
=3D"mailto:damien.hedde@greensocs.com">damien.hedde@greensocs.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 4/4/22 22:34, John Snow wrote:<br>
&gt; On Wed, Mar 16, 2022 at 5:55 AM Damien Hedde &lt;<a href=3D"mailto:dam=
ien.hedde@greensocs.com" target=3D"_blank" rel=3D"noreferrer">damien.hedde@=
greensocs.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; It takes an input file containing raw qmp commands (concatenated j=
son<br>
&gt;&gt; dicts) and send all commands one by one to a qmp server. When one<=
br>
&gt;&gt; command fails, it exits.<br>
&gt;&gt;<br>
&gt;&gt; As a convenience, it can also wrap the qemu process to avoid havin=
g<br>
&gt;&gt; to start qemu in background. When wrapping qemu, the program retur=
ns<br>
&gt;&gt; only when the qemu process terminates.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@gre=
ensocs.com" target=3D"_blank" rel=3D"noreferrer">damien.hedde@greensocs.com=
</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; Following our discussion, I&#39;ve started this. What do you think=
 ?<br>
&gt;&gt;<br>
&gt;&gt; I tried to follow Daniel&#39;s qmp-shell-wrap. I think it is<br>
&gt;&gt; better to have similar options (eg: logging). There is also room<b=
r>
&gt;&gt; for factorizing code if we want to keep them aligned and ease<br>
&gt;&gt; maintenance.<br>
&gt;&gt;<br>
&gt;&gt; There are still some pylint issues (too many branches in main and =
it<br>
&gt;&gt; does not like my context manager if else line). But it&#39;s kind =
of a<br>
&gt;&gt; mess to fix theses so I think it&#39;s enough for a first version.=
<br>
&gt; <br>
&gt; Yeah, don&#39;t worry about these. You can just tell pylint to shut up=
<br>
&gt; while you prototype. Sometimes it&#39;s just not worth spending more t=
ime<br>
&gt; on a more beautiful factoring. Oh well.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; I name that qmp-send as Daniel proposed, maybe qmp-test matches be=
tter<br>
&gt;&gt; what I&#39;m doing there ?<br>
&gt;&gt;<br>
&gt; <br>
&gt; I think I agree with Dan&#39;s response.<br>
&gt; <br>
&gt;&gt; Thanks,<br>
&gt;&gt; Damien<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0python/qemu/aqmp/qmp_send.py | 229 +++++++++++++++++++=
++++++++++++++++<br>
&gt; <br>
&gt; I recommend putting this in qemu/util/qmp_send.py instead.<br>
&gt; <br>
&gt; I&#39;m in the process of pulling out the AQMP lib and hosting it<br>
&gt; separately. Scripts like this I think should stay in the QEMU tree, so=
<br>
&gt; moving it to util instead is probably best. Otherwise, I&#39;ll *reall=
y*<br>
&gt; have to commit to the syntax, and that&#39;s probably a bigger hurdle =
than<br>
&gt; you want to deal with.<br>
<br>
If it stays in QEMU tree, what licensing should I use ? LGPL does not <br>
hurt, no ?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Whichever you please. GPLv2+ would be convenient and harmonizes w=
ell with other tools. LGPL is only something I started doing so that the &q=
uot;qemu.qmp&quot; package would be LGPL. Licensing the tools as LGPL was j=
ust a sin of convenience so I could claim a single license for the whole wh=
eel/egg/tgz.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(I didn&#39=
;t want to make separate qmp and qmp-tools packages.)</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Go with what you feel is best.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0scripts/qmp/qmp-send=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 11 ++<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 240 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 python/qemu/aqmp/qmp_send.py<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100755 scripts/qmp/qmp-send<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/python/qemu/aqmp/qmp_send.py b/python/qemu/aqmp/qmp_s=
end.py<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..cbca1d0205<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/python/qemu/aqmp/qmp_send.py<br>
&gt; <br>
&gt; Seems broadly fine to me, but I didn&#39;t review closely this time. I=
f it<br>
&gt; works for you, it works for me.<br>
&gt; <br>
&gt; As for making QEMU hang: there&#39;s a few things you could do, take a=
<br>
&gt; look at iotests and see how they handle timeout blocks in synchronous<=
br>
&gt; code -- iotests.py line 696 or so, &quot;class Timeout&quot;. When wri=
ting async<br>
&gt; code, you can also do stuff like this:<br>
&gt; <br>
&gt; async def foo():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 await asyncio.wait_for(qmp.execute(&quot;some-comm=
and&quot;, args_etc), timeout=3D30)<br>
&gt; <br>
&gt; See <a href=3D"https://docs.python.org/3/library/asyncio-task.html#asy=
ncio.wait_for" rel=3D"noreferrer noreferrer" target=3D"_blank">https://docs=
.python.org/3/library/asyncio-task.html#asyncio.wait_for</a><br>
&gt; <br>
&gt; --js<br>
&gt; <br>
<br>
Thanks for the tip,<br>
--<br>
Damien<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Oh, and one more. the legacy.py bindings for AQMP also support a conf=
igurable timeout that applies to most API calls by default.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">see=C2=A0<a href=3D"https://gitlab.co=
m/jsnow/qemu.qmp/-/blob/main/qemu/qmp/legacy.py#L285">https://gitlab.com/js=
now/qemu.qmp/-/blob/main/qemu/qmp/legacy.py#L285</a></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">(Branch still in limbo here, but it should sti=
ll be close to the same in qemu.git)</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I believe this is used by iotests.py when it sets up its machi=
ne.py subclass (&quot;VM&quot;, iirc) so that most qmp invocations in iotes=
ts have a default timeout and won&#39;t hang tests indefinitely.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">--js=C2=A0</div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></di=
v></div></div>

--0000000000005c1d8405dbec2121--


