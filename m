Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C258A3D0115
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:59:29 +0200 (CEST)
Received: from localhost ([::1]:49146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u1g-0004M5-Rq
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tzh-0001z5-M0
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tzf-0004F0-KY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626803842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QxggCNDmv+kFwKeXlEIxk9JE5ThZEbzVMW9mmrKjRHY=;
 b=I1JOcjeQkA3LOLQZOo1RKhxZA2OoURAnogaB7wKc3HLsds8CSlNZVprtt70iY8H53KyPPj
 N0wD1pJOHba3sIKgeJHq7o0SCGy4b/DIknhHoeDQFq2+mUscEmht3rl4aaabnjhFLbbYt8
 xYar1uV2R8PaGnk5r+YYdym+H0dFYRg=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-2E8sK7syNNOcHbSm9gnnTg-1; Tue, 20 Jul 2021 13:57:17 -0400
X-MC-Unique: 2E8sK7syNNOcHbSm9gnnTg-1
Received: by mail-oi1-f197.google.com with SMTP id
 11-20020aca0d0b0000b029025c8b99a102so20128oin.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 10:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QxggCNDmv+kFwKeXlEIxk9JE5ThZEbzVMW9mmrKjRHY=;
 b=XsbhG9j5EY3t9gZoEUaBzu01uhBFy/apu3ZE1Gvsn7LO04jnataZYvSAc2KPtvGGqX
 hMs96Pu8z2Q7JVApPKmWxa7hy5K0YGN9sWlZ/lv/DkiiyqdDkkHLbnrHROp5WS1cBfMo
 ujUu586iSdZ232wLaBMWATPiwFfBtCN7l0PVieS0fuQNJmRlEeg1zuBgVHlV9Hq3eO0g
 C+K8zeL3Q+8UL1kh6YdbyeXs4ygACLMN3tddCTD6vnE/LBs9Lxqz+D1E22L2vBXBG7Mx
 2F+3l8T8oY1SpTcR4x284LVlcAHXgAp1SjcpNrPKjqblWkCR++k6QxQ3IjKlyI0GKaeH
 PEcg==
X-Gm-Message-State: AOAM531BgYHr0tW12hdUpQmrzU5Jj0ReylRhbMX6mxSM08UD+3BZr1Fg
 Oz5eBCaTRpiHuGqL+aEqc17U7yPwQ76GCGo0D6dG6ssSNWZsBXCGNj2W6549J+weNkPRJbLTE6Z
 HoEumkyjhTkPjj/iTDPt+7eSjh+xYV24=
X-Received: by 2002:a9d:86d:: with SMTP id 100mr23747604oty.45.1626803837286; 
 Tue, 20 Jul 2021 10:57:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoB0xeqrKnrwofeHYCXOqWj4Pp/gDrgEchZ9xv/NILC7+zjlMtqwIlQ1yWwZblXK/Pkc3mHXL8sY3oP4cCRoA=
X-Received: by 2002:a9d:86d:: with SMTP id 100mr23747592oty.45.1626803837115; 
 Tue, 20 Jul 2021 10:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
 <20210713220734.26302-4-niteesh.gs@gmail.com>
In-Reply-To: <20210713220734.26302-4-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 13:57:06 -0400
Message-ID: <CAFn=p-YCbDEv3E2MucVb1ZqLfzZAObxDSkkSUB7PHBV_-v4eyw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] python/aqmp-tui: Add AQMP TUI draft
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d4b21105c791c8f9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000d4b21105c791c8f9
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 13, 2021 at 6:07 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Added a draft of AQMP TUI.
>
> Implements the follwing basic features:
> 1) Command transmission/reception.
> 2) Shows events asynchronously.
> 3) Shows server status in the bottom status bar.
>
> Also added necessary pylint, mypy configurations
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  python/qemu/aqmp/aqmp_tui.py | 332 +++++++++++++++++++++++++++++++++++
>  python/setup.cfg             |  21 ++-
>  2 files changed, 352 insertions(+), 1 deletion(-)
>  create mode 100644 python/qemu/aqmp/aqmp_tui.py
>
> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
> new file mode 100644
> index 0000000000..f853efc1f5
> --- /dev/null
> +++ b/python/qemu/aqmp/aqmp_tui.py
> @@ -0,0 +1,332 @@
> +# Copyright (c) 2021
> +#
> +# Authors:
> +#  Niteesh Babu G S <niteesh.gs@gmail.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import argparse
> +import asyncio
> +import logging
> +from logging import Handler
> +import signal
> +
> +import urwid
> +import urwid_readline
> +
> +from .error import MultiException
> +from .protocol import ConnectError
> +from .qmp_protocol import QMP, ExecInterruptedError, ExecuteError
> +from .util import create_task, pretty_traceback
> +
> +
> +UPDATE_MSG = 'UPDATE_MSG'
> +
> +# Using root logger to enable all loggers under qemu and asyncio
> +LOGGER = logging.getLogger()
> +
> +palette = [
> +    (Token.Punctuation, '', '', '', 'h15,bold', 'g7'),
> +    (Token.Text, '', '', '', '', 'g7'),
> +    (Token.Name.Tag, '', '', '', 'bold,#f88', 'g7'),
> +    (Token.Literal.Number.Integer, '', '', '', '#fa0', 'g7'),
> +    (Token.Literal.String.Double, '', '', '', '#6f6', 'g7'),
> +    (Token.Keyword.Constant, '', '', '', '#6af', 'g7'),
> +    ('background', '', 'black', '', '', 'g7'),
> +]
> +
>

It looks like this bled forward, this part belongs in the next patch. Can
you fix this and re-send?

jsnow@scv ~/s/q/python (review)> make check-dev
ACTIVATE .dev-venv
make[1]: Entering directory '/home/jsnow/src/qemu/python'
JOB ID     : f766a463cfc6bd3f0d6286e0653752bb8bc5ea6f
JOB LOG    :
/home/jsnow/avocado/job-results/job-2021-07-20T13.55-f766a46/job.log
 (1/4) tests/flake8.sh: FAIL: Exited with status: '1' (0.36 s)
 (2/4) tests/isort.sh: PASS (0.11 s)
 (3/4) tests/mypy.sh: FAIL: Exited with status: '1' (0.36 s)
 (4/4) tests/pylint.sh: FAIL: Exited with status: '2' (6.62 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 3 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 7.80 s
Log file "stdout" content for test "1-tests/flake8.sh" (FAIL):
qemu/aqmp/aqmp_tui.py:30:6: F821 undefined name 'Token'
qemu/aqmp/aqmp_tui.py:31:6: F821 undefined name 'Token'
qemu/aqmp/aqmp_tui.py:32:6: F821 undefined name 'Token'
qemu/aqmp/aqmp_tui.py:33:6: F821 undefined name 'Token'
qemu/aqmp/aqmp_tui.py:34:6: F821 undefined name 'Token'
qemu/aqmp/aqmp_tui.py:35:6: F821 undefined name 'Token'
qemu/aqmp/aqmp_tui.py:138:21: F821 undefined name 'lexers'

While you're at it, you might as well rebase on top of AQMP v2.

--000000000000d4b21105c791c8f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 13, 2021 at 6:07 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Added a draft of AQMP TUI.<br>
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
 rebase on top of AQMP v2.</div></div><div>=C2=A0</div></div></div>

--000000000000d4b21105c791c8f9--


