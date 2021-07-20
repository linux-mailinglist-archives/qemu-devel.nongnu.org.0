Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCCA3D012D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:03:56 +0200 (CEST)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u5z-0003Z6-PX
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m5u4S-0001hT-9U
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:02:20 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:34520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m5u4Q-0007Vz-AU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:02:20 -0400
Received: by mail-io1-xd2a.google.com with SMTP id g22so25007664iom.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmzfQfJMjjD+gdFOX7Otl3JCUiM/oTfjSkiwPqY+v4w=;
 b=s6PS+WsE1r+2fkV0iKyNFVsTlX1s23jKPn6bJwMzy+jG5aX9Gss/PzSNLdt5T9aoI0
 d7yk0YoqxffADas8S5U3ueiFkfZ6oYym6j3ImfotC345yzMnVDnlNsDNnVKX8LZaS7F2
 qZx4/Yuy6KFE/2Dmx0T5ipvfMKybFSyD/WEJ4G6qPgup5ILM1AoaFp58SX+o6B3PU/Ue
 PPz4djg6n+cgbIG5ocSrSP5PyvC4oMv8rtds2L5M60RgihuIiZ25OQQNz2XEJEnh1YCL
 OuJurFt1rvB7Im8TFpc8/Lo8TGiQl7ufMcdMzAPCfY6YOVUzG6Cw5OkYD27CliWio5p9
 Rp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmzfQfJMjjD+gdFOX7Otl3JCUiM/oTfjSkiwPqY+v4w=;
 b=Ees9cDEFDAZqhTyAbSr2VGzYU4tmkFD4LaPynrS7A2kJO3somM5H+quMl5GX6uY3oW
 SNZZSeKNwtKdMnsuvqrtLyOvrOQG4SAtf6FMIATBVN4U9UP3Y/4n7u5X4X/Rh8u/GjFy
 XLxAzjArdWMlFwp0SRT2/u1nKANWuiT9/LIVQKYlIchDwClahpQxfOnRSCSwwdfrVoy2
 9lhnS3Qu1n1+oqWWKfsUnn5NU3g6RQ54i5ItXHCRIW65YmfGLabraBNwPQ8FBFznGmFu
 /K4FFChoXx3g+gQC3b11+F/K2nrk2FJ0VAQHD/V0mOFZjPI7oSlD+IVHhG3IA07JIOcA
 Q7wQ==
X-Gm-Message-State: AOAM533PBjG8ip9IFEnUcx6cPAPiS7nCQmG+2YvjaQ1WrGrxd0SMMyyp
 0IfSvUQzJs50zpkyKSVSPDLOfYQXlQytFnA7CUs=
X-Google-Smtp-Source: ABdhPJx5B+suYoSAn9li2lhnFiQRsxxOm8TA/Ut46duhTZk0TMoIfHAZiG/dex8ytgmd73hzmgP27kkUDLZLECmvWOY=
X-Received: by 2002:a6b:1406:: with SMTP id 6mr23998987iou.25.1626804134686;
 Tue, 20 Jul 2021 11:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
 <20210713220734.26302-4-niteesh.gs@gmail.com>
 <CAFn=p-YCbDEv3E2MucVb1ZqLfzZAObxDSkkSUB7PHBV_-v4eyw@mail.gmail.com>
In-Reply-To: <CAFn=p-YCbDEv3E2MucVb1ZqLfzZAObxDSkkSUB7PHBV_-v4eyw@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Tue, 20 Jul 2021 23:31:48 +0530
Message-ID: <CAN6ztm-80U8cZRE6uoMAyu_k-ynu6ZCPskGtYyivevhogJDhZg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] python/aqmp-tui: Add AQMP TUI draft
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000091342105c791da7d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2a.google.com
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000091342105c791da7d
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 11:27 PM John Snow <jsnow@redhat.com> wrote:

>
>
> On Tue, Jul 13, 2021 at 6:07 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Added a draft of AQMP TUI.
>>
>> Implements the follwing basic features:
>> 1) Command transmission/reception.
>> 2) Shows events asynchronously.
>> 3) Shows server status in the bottom status bar.
>>
>> Also added necessary pylint, mypy configurations
>>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/qemu/aqmp/aqmp_tui.py | 332 +++++++++++++++++++++++++++++++++++
>>  python/setup.cfg             |  21 ++-
>>  2 files changed, 352 insertions(+), 1 deletion(-)
>>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> new file mode 100644
>> index 0000000000..f853efc1f5
>> --- /dev/null
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -0,0 +1,332 @@
>> +# Copyright (c) 2021
>> +#
>> +# Authors:
>> +#  Niteesh Babu G S <niteesh.gs@gmail.com>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +import argparse
>> +import asyncio
>> +import logging
>> +from logging import Handler
>> +import signal
>> +
>> +import urwid
>> +import urwid_readline
>> +
>> +from .error import MultiException
>> +from .protocol import ConnectError
>> +from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError
>> +from .util import create_task, pretty_traceback
>> +
>> +
>> +UPDATE_MSG = 'UPDATE_MSG'
>> +
>> +# Using root logger to enable all loggers under qemu and asyncio
>> +LOGGER = logging.getLogger()
>> +
>> +palette = [
>> +    (Token.Punctuation, '', '', '', 'h15,bold', 'g7'),
>> +    (Token.Text, '', '', '', '', 'g7'),
>> +    (Token.Name.Tag, '', '', '', 'bold,#f88', 'g7'),
>> +    (Token.Literal.Number.Integer, '', '', '', '#fa0', 'g7'),
>> +    (Token.Literal.String.Double, '', '', '', '#6f6', 'g7'),
>> +    (Token.Keyword.Constant, '', '', '', '#6af', 'g7'),
>> +    ('background', '', 'black', '', '', 'g7'),
>> +]
>> +
>>
>
> It looks like this bled forward, this part belongs in the next patch. Can
> you fix this and re-send?
>
> jsnow@scv ~/s/q/python (review)> make check-dev
> ACTIVATE .dev-venv
> make[1]: Entering directory '/home/jsnow/src/qemu/python'
> JOB ID     : f766a463cfc6bd3f0d6286e0653752bb8bc5ea6f
> JOB LOG    :
> /home/jsnow/avocado/job-results/job-2021-07-20T13.55-f766a46/job.log
>  (1/4) tests/flake8.sh: FAIL: Exited with status: '1' (0.36 s)
>  (2/4) tests/isort.sh: PASS (0.11 s)
>  (3/4) tests/mypy.sh: FAIL: Exited with status: '1' (0.36 s)
>  (4/4) tests/pylint.sh: FAIL: Exited with status: '2' (6.62 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 3 | SKIP 0 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> JOB TIME   : 7.80 s
> Log file "stdout" content for test "1-tests/flake8.sh" (FAIL):
> qemu/aqmp/aqmp_tui.py:30:6: F821 undefined name 'Token'
> qemu/aqmp/aqmp_tui.py:31:6: F821 undefined name 'Token'
> qemu/aqmp/aqmp_tui.py:32:6: F821 undefined name 'Token'
> qemu/aqmp/aqmp_tui.py:33:6: F821 undefined name 'Token'
> qemu/aqmp/aqmp_tui.py:34:6: F821 undefined name 'Token'
> qemu/aqmp/aqmp_tui.py:35:6: F821 undefined name 'Token'
> qemu/aqmp/aqmp_tui.py:138:21: F821 undefined name 'lexers'
>
> While you're at it, you might as well rebase on top of AQMP v2.
>
Ah sorry, messed up while rebasing. I'll send a v3 fixing this(and other
upcoming comments)
and will also rebase on top of AQMP v2.

>
>

--00000000000091342105c791da7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 11:27 PM John Snow &lt;<a h=
ref=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jul 13, 2021 at 6:07 PM G S Niteesh B=
abu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.g=
s@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Added a draft of AQMP TUI.<br>
<br>
Implements the follwing basic features:<br>
1) Command transmission/reception.<br>
2) Shows events asynchronously.<br>
3) Shows server status in the bottom status bar.<br>
<br>
Also added necessary pylint, mypy configurations<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 332 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 21 ++-<br>
=C2=A02 files changed, 352 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 python/qemu/aqmp/aqmp_tui.py<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
new file mode 100644<br>
index 0000000000..f853efc1f5<br>
--- /dev/null<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -0,0 +1,332 @@<br>
+# Copyright (c) 2021<br>
+#<br>
+# Authors:<br>
+#=C2=A0 Niteesh Babu G S &lt;<a href=3D"mailto:niteesh.gs@gmail.com" targe=
t=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
+#<br>
+# This work is licensed under the terms of the GNU GPL, version 2 or<br>
+# later.=C2=A0 See the COPYING file in the top-level directory.<br>
+<br>
+import argparse<br>
+import asyncio<br>
+import logging<br>
+from logging import Handler<br>
+import signal<br>
+<br>
+import urwid<br>
+import urwid_readline<br>
+<br>
+from .error import MultiException<br>
+from .protocol import ConnectError<br>
+from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError<br>
+from .util import create_task, pretty_traceback<br>
+<br>
+<br>
+UPDATE_MSG =3D &#39;UPDATE_MSG&#39;<br>
+<br>
+# Using root logger to enable all loggers under qemu and asyncio<br>
+LOGGER =3D logging.getLogger()<br>
+<br>
+palette =3D [<br>
+=C2=A0 =C2=A0 (Token.Punctuation, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39=
;h15,bold&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Text, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;,=
 &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Name.Tag, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;bo=
ld,#f88&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Literal.Number.Integer, &#39;&#39;, &#39;&#39;, &#39;=
&#39;, &#39;#fa0&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Literal.String.Double, &#39;&#39;, &#39;&#39;, &#39;&=
#39;, &#39;#6f6&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Keyword.Constant, &#39;&#39;, &#39;&#39;, &#39;&#39;,=
 &#39;#6af&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;background&#39;, &#39;&#39;, &#39;black&#39;, &#39;&#3=
9;, &#39;&#39;, &#39;g7&#39;),<br>
+]<br>
+<br></blockquote><div><br></div><div><div>It looks like this bled forward,=
 this part belongs in the next patch. Can you fix this and re-send?</div><d=
iv><br></div><div>jsnow@scv ~/s/q/python (review)&gt; make check-dev<br>ACT=
IVATE .dev-venv<br>make[1]: Entering directory &#39;/home/jsnow/src/qemu/py=
thon&#39;<br>JOB ID =C2=A0 =C2=A0 : f766a463cfc6bd3f0d6286e0653752bb8bc5ea6=
f<br>JOB LOG =C2=A0 =C2=A0: /home/jsnow/avocado/job-results/job-2021-07-20T=
13.55-f766a46/job.log<br>=C2=A0(1/4) tests/flake8.sh: FAIL: Exited with sta=
tus: &#39;1&#39; (0.36 s)<br>=C2=A0(2/4) tests/isort.sh: PASS (0.11 s)<br>=
=C2=A0(3/4) tests/mypy.sh: FAIL: Exited with status: &#39;1&#39; (0.36 s)<b=
r>=C2=A0(4/4) tests/pylint.sh: FAIL: Exited with status: &#39;2&#39; (6.62 =
s)<br>RESULTS =C2=A0 =C2=A0: PASS 1 | ERROR 0 | FAIL 3 | SKIP 0 | WARN 0 | =
INTERRUPT 0 | CANCEL 0<br>JOB TIME =C2=A0 : 7.80 s<br>Log file &quot;stdout=
&quot; content for test &quot;1-tests/flake8.sh&quot; (FAIL):<br>qemu/aqmp/=
aqmp_tui.py:30:6: F821 undefined name &#39;Token&#39;<br>qemu/aqmp/aqmp_tui=
.py:31:6: F821 undefined name &#39;Token&#39;<br>qemu/aqmp/aqmp_tui.py:32:6=
: F821 undefined name &#39;Token&#39;<br>qemu/aqmp/aqmp_tui.py:33:6: F821 u=
ndefined name &#39;Token&#39;<br>qemu/aqmp/aqmp_tui.py:34:6: F821 undefined=
 name &#39;Token&#39;<br>qemu/aqmp/aqmp_tui.py:35:6: F821 undefined name &#=
39;Token&#39;<br>qemu/aqmp/aqmp_tui.py:138:21: F821 undefined name &#39;lex=
ers&#39;</div><div><br></div><div>While you&#39;re at it, you might as well=
 rebase on top of AQMP v2.</div></div></div></div></blockquote><div><span c=
lass=3D"gmail_default" style=3D"font-size:small">Ah sorry, messed up while =
rebasing. I&#39;ll send a v3 fixing this(and other upcoming comments)</span=
></div><div><span class=3D"gmail_default" style=3D"font-size:small">and wil=
l also rebase on top of=C2=A0</span><span class=3D"gmail_default">AQMP v2. =
</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div></div></div>
</blockquote></div></div>

--00000000000091342105c791da7d--

