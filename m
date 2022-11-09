Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214462336B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 20:26:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osqi6-0000tR-Hb; Wed, 09 Nov 2022 14:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1osqi4-0000t9-6T
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 14:26:04 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1osqi1-0001iO-JL
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 14:26:03 -0500
Received: by mail-vs1-xe35.google.com with SMTP id k1so17772528vsc.13
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 11:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jXnm5HjW9gUuHdo5Xktf7EEWxssN1Z13Xiqeu6vMDtU=;
 b=Xjk+r9liHg/JBRzanj6znNLepclEM4KD3Q8em2arL7HZgOL6xIahpvSNiRf3IzdUnh
 5hzzo7BFt4DDAq2/1CJl/TlH0wtkiydck7HvLU3L4SwSmSCL4aKhUrFMEMXON6SDZnFa
 nlVyxOtesknV4v+4zIECi+YP6nftbQz6DGT3G79YvxVOJVYAmO66o4W9KHRqjMjC7fU/
 XkibqhQKgYsb3odSCc6RaoYYTNY1Wk7MuHP0paRScskE3epXOJU60e/Dl1kdEGMh73SR
 nq2jL6UHHDTGjhIsAoeFhh6ha2+R/ZfJ4NdEcfGDx//aqBXQm4udHlF8rmW4WmMdEVTx
 /RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jXnm5HjW9gUuHdo5Xktf7EEWxssN1Z13Xiqeu6vMDtU=;
 b=WarcuoQAvaX0LIuTJz9MADHqCmV217W/OmzZRl4wV/seHpu71P1Pq99Jwreg6tKXfx
 OV/Y60CpWqftKAlsJpMA/Q0gIg1NtYO/gjFgyL+uUHWZF5x7Efjdcnv+yzSm6oY8Xhmh
 H+i32q6sYCA4aSF/exbKgSbQIJBJZe9UePdyt06BHdZktwjvp5trQs07oHAetUepAPdE
 uim/CIjK+UbjdAbk2Hj7jrv0oTgN/Dzrxs5hYIVaSJYgV+gaZcAbvO03UZzFIkpHQm3m
 pq2cQXE06V+5V0NFdMbqot4eXjolCjLO3jq6FAGIUnE1Ja1p6jdbi2e90yGEqwakZWfY
 +tCg==
X-Gm-Message-State: ACrzQf3wiUGcXdePqkI8fqwb/c1TKxRMO9NT2GWnxN8PXcNBRsh8TTzl
 t9Vif6SKfJ86Ivil5deaL+6wa+22yfReZ4MKAbsXrrggQKscrw==
X-Google-Smtp-Source: AMsMyM6/QX/g6WDdLmm/7UTm1RarnqbiluVy7z4OPPHIYXLgTMoV9xQYXTR1QaSNzLixRiqkIZDYfTz1ltf55420z+8=
X-Received: by 2002:a67:e281:0:b0:398:8b:12df with SMTP id
 g1-20020a67e281000000b00398008b12dfmr32812558vsf.66.1668021960185; 
 Wed, 09 Nov 2022 11:26:00 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notxSQTki5NsdVbRsrj+_=XoS9cTGY3R6eP5drB0DEuoJFg@mail.gmail.com>
In-Reply-To: <CAO=notxSQTki5NsdVbRsrj+_=XoS9cTGY3R6eP5drB0DEuoJFg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 9 Nov 2022 11:25:48 -0800
Message-ID: <CAO=notyJFfQm4VrZ0ye_bK696P7LgPeR6CaDvd7SLro8qme-cQ@mail.gmail.com>
Subject: Re: Weird qtest FileNotFoundError errors
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="0000000000006a67cf05ed0ea0e6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=venture@google.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006a67cf05ed0ea0e6
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 9, 2022 at 11:20 AM Patrick Venture <venture@google.com> wrote:

> Hi all,
>
> I've been trying to debug qtest problems recently.  I have seen the assert
> socket failures a bunch now and am digging into why.  I've also seen this a
> lot and I'm curious if anyone has any ideas:
>
> ./configure --target-list=aarch64-softmmu,aarch64-linux-user
> make -i check-report-qtest-aarch64.junit.xml
>
> Exception in callback TestHarness._run_tests.<locals>.test_done(<Task
> finishe...r directory')>) at
> /usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py:1843
> handle: <Handle TestHarness._run_tests.<locals>.test_done(<Task
> finishe...r directory')>) at
> /usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py:1843>
> Traceback (most recent call last):
>   File "/usr/lib/python3.10/asyncio/events.py", line 80, in _run
>     self._context.run(self._callback, *self._args)
>   File
> "/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
> 1845, in test_done
>     f.result()
>   File
> "/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
> 1840, in run_test
>     res = await test.run(self)
>   File
> "/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
> 1384, in run
>     await self._run_cmd(harness, cmd)
>   File
> "/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
> 1438, in _run_cmd
>     p = await self._run_subprocess(cmd + extra_cmd,
>   File
> "/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
> 1412, in _run_subprocess
>     p = await asyncio.create_subprocess_exec(*args,
>   File "/usr/lib/python3.10/asyncio/subprocess.py", line 218, in
> create_subprocess_exec
>     transport, protocol = await loop.subprocess_exec(
>   File "/usr/lib/python3.10/asyncio/base_events.py", line 1667, in
> subprocess_exec
>     transport = await self._make_subprocess_transport(
>   File "/usr/lib/python3.10/asyncio/unix_events.py", line 207, in
> _make_subprocess_transport
>     transp = _UnixSubprocessTransport(self, protocol, args, shell,
>   File "/usr/lib/python3.10/asyncio/base_subprocess.py", line 36, in
> __init__
>     self._start(args=args, shell=shell, stdin=stdin, stdout=stdout,
>   File "/usr/lib/python3.10/asyncio/unix_events.py", line 799, in _start
>     self._proc = subprocess.Popen(
>   File "/usr/lib/python3.10/subprocess.py", line 969, in __init__
>     self._execute_child(args, executable, preexec_fn, close_fds,
>   File "/usr/lib/python3.10/subprocess.py", line 1845, in _execute_child
>     raise child_exception_type(errno_num, err_msg, err_filename)
> FileNotFoundError: [Errno 2] No such file or directory:
> '/usr/local/google/git/workspaces/qemu_71/build/tests/qtest/arm-cpu-features'
>
> In the past I've seen it unable to find other qtest files.  I'm a bit
> stumped as to why this would be flaky about finding the test files it needs.
>

If the problem is that I didn't run the regular make first.  Which it looks
like it, since I Just ran the normal "make" and saw:

[864/867] Compiling C object
tests/qtest/arm-cpu-features.p/arm-cpu-features.c.o
[865/867] Linking target tests/qtest/arm-cpu-features

I'm going to be sad.  I don't know why making the test target wouldn't
trigger the thing to be built, but I'm definitely starting to think that's
my problem.



>
> Patrick
>

--0000000000006a67cf05ed0ea0e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 9, 2022 at 11:20 AM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr">Hi all,<div><br></div><div>I&#39;ve been trying=C2=A0to debug =
qtest problems recently.=C2=A0 I have seen the assert socket failures a bun=
ch now and am digging into why.=C2=A0 I&#39;ve also seen this a lot and I&#=
39;m curious if anyone has any ideas:</div><div><br></div><div>./configure =
--target-list=3Daarch64-softmmu,aarch64-linux-user<br></div><div>make -i ch=
eck-report-qtest-aarch64.junit.xml<br></div><div><br></div><div>Exception i=
n callback TestHarness._run_tests.&lt;locals&gt;.test_done(&lt;Task finishe=
...r directory&#39;)&gt;) at /usr/local/google/git/workspaces/qemu_71/meson=
/mesonbuild/mtest.py:1843<br>handle: &lt;Handle TestHarness._run_tests.&lt;=
locals&gt;.test_done(&lt;Task finishe...r directory&#39;)&gt;) at /usr/loca=
l/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py:1843&gt;<br>Trace=
back (most recent call last):<br>=C2=A0 File &quot;/usr/lib/python3.10/asyn=
cio/events.py&quot;, line 80, in _run<br>=C2=A0 =C2=A0 self._context.run(se=
lf._callback, *self._args)<br>=C2=A0 File &quot;/usr/local/google/git/works=
paces/qemu_71/meson/mesonbuild/mtest.py&quot;, line 1845, in test_done<br>=
=C2=A0 =C2=A0 f.result()<br>=C2=A0 File &quot;/usr/local/google/git/workspa=
ces/qemu_71/meson/mesonbuild/mtest.py&quot;, line 1840, in run_test<br>=C2=
=A0 =C2=A0 res =3D await test.run(self)<br>=C2=A0 File &quot;/usr/local/goo=
gle/git/workspaces/qemu_71/meson/mesonbuild/mtest.py&quot;, line 1384, in r=
un<br>=C2=A0 =C2=A0 await self._run_cmd(harness, cmd)<br>=C2=A0 File &quot;=
/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py&quot;, l=
ine 1438, in _run_cmd<br>=C2=A0 =C2=A0 p =3D await self._run_subprocess(cmd=
 + extra_cmd,<br>=C2=A0 File &quot;/usr/local/google/git/workspaces/qemu_71=
/meson/mesonbuild/mtest.py&quot;, line 1412, in _run_subprocess<br>=C2=A0 =
=C2=A0 p =3D await asyncio.create_subprocess_exec(*args,<br>=C2=A0 File &qu=
ot;/usr/lib/python3.10/asyncio/subprocess.py&quot;, line 218, in create_sub=
process_exec<br>=C2=A0 =C2=A0 transport, protocol =3D await loop.subprocess=
_exec(<br>=C2=A0 File &quot;/usr/lib/python3.10/asyncio/base_events.py&quot=
;, line 1667, in subprocess_exec<br>=C2=A0 =C2=A0 transport =3D await self.=
_make_subprocess_transport(<br>=C2=A0 File &quot;/usr/lib/python3.10/asynci=
o/unix_events.py&quot;, line 207, in _make_subprocess_transport<br>=C2=A0 =
=C2=A0 transp =3D _UnixSubprocessTransport(self, protocol, args, shell,<br>=
=C2=A0 File &quot;/usr/lib/python3.10/asyncio/base_subprocess.py&quot;, lin=
e 36, in __init__<br>=C2=A0 =C2=A0 self._start(args=3Dargs, shell=3Dshell, =
stdin=3Dstdin, stdout=3Dstdout,<br>=C2=A0 File &quot;/usr/lib/python3.10/as=
yncio/unix_events.py&quot;, line 799, in _start<br>=C2=A0 =C2=A0 self._proc=
 =3D subprocess.Popen(<br>=C2=A0 File &quot;/usr/lib/python3.10/subprocess.=
py&quot;, line 969, in __init__<br>=C2=A0 =C2=A0 self._execute_child(args, =
executable, preexec_fn, close_fds,<br>=C2=A0 File &quot;/usr/lib/python3.10=
/subprocess.py&quot;, line 1845, in _execute_child<br>=C2=A0 =C2=A0 raise c=
hild_exception_type(errno_num, err_msg, err_filename)<br>FileNotFoundError:=
 [Errno 2] No such file or directory: &#39;/usr/local/google/git/workspaces=
/qemu_71/build/tests/qtest/arm-cpu-features&#39;<br></div><div><br></div><d=
iv>In the past I&#39;ve seen it unable to find other qtest files.=C2=A0 I&#=
39;m a bit stumped as to why this would be flaky about finding the test fil=
es it needs.</div></div></blockquote><div><br></div><div>If the problem is =
that I didn&#39;t run the regular make first.=C2=A0 Which it looks like it,=
 since I Just ran the normal &quot;make&quot; and saw:</div><div><br></div>=
[864/867] Compiling C object tests/qtest/arm-cpu-features.p/arm-cpu-feature=
s.c.o<br><div>[865/867] Linking target tests/qtest/arm-cpu-features</div><d=
iv><br></div><div>I&#39;m going to be sad.=C2=A0 I don&#39;t know why makin=
g the test target wouldn&#39;t trigger the thing to be built, but I&#39;m d=
efinitely starting to think that&#39;s my problem.</div><div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div><br></div><div>Patrick</div></div>
</blockquote></div></div>

--0000000000006a67cf05ed0ea0e6--

