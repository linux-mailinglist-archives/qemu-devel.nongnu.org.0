Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468A623360
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 20:22:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osqdQ-00084C-Qc; Wed, 09 Nov 2022 14:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1osqdP-00083u-I6
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 14:21:15 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1osqdG-0007US-J2
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 14:21:15 -0500
Received: by mail-vs1-xe36.google.com with SMTP id 1so17829117vsx.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 11:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3OeE+ALoBk+vmhpyfrRQ5hNcOxuPiu+VK07i+JzqNXM=;
 b=lLITDy9gFmAJqq+ldZcFfQHxndUwyaaJP7VL3A+BwBTOBMD1waOx+IbowPuUuPhcjU
 c+lwfx9RHUyGHPavKJdiGYCnbUflt0qxF7401LMsXlvUfCmAbQl6By/4lFvzPxNW8xD/
 fcPF5NRfKFAfKP5NXEqd6S9P1GGffFWnoioYOXVnpNwemQ5m9f00CWjnrmNRaaT6v6wd
 y6lstbnR8WRBbVzcFrLxujwr+P/jMKmRNeluoP1Xu93Z5wSI67CS+YRLYgNSxgCRzWxG
 joLr2WGzaB2TYKxnYFCN3MY/g9NT9F9v/kuxJB7kfHd2OtGK/gosJenHYRUzBjcwhXhw
 1t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3OeE+ALoBk+vmhpyfrRQ5hNcOxuPiu+VK07i+JzqNXM=;
 b=fK1TL5CgKCxGY5kygzntJ5NPxiRs5JLNtSaM89dDAZp4XKKM/B9K09Va8MmYoW6UYv
 fv6xoV6up9QIf4+cwubYujr3VNmtj8O9obEbKH+pStofXxaptdftB29DzEZMfygF2RTT
 OaQs6yhwtYNmYKZs0Z7OPJQt9YzRIjijhkzLZQTVBm2jXuEWoG+3Tb+MehgQsQBqBoqQ
 jir/RTRUnH3SRAXV40I5ajCmfEu4Du9d2zhQ8Pv/AOuXrutejbXvg3x+wFblt/g53LDQ
 DpPCk4hGBH6pL6Fpzx97bLdSYyH1BMe5FQhIpZicPeGN46eraDjMFl9RSlRbxtL+bNoK
 ZL2Q==
X-Gm-Message-State: ACrzQf0F3AjyTXrDLuaPChdcaGzamhJiI4dPbt1EqcrWbv6tTrwzrddr
 3iBMBXhRohnxTuL2+jJVk4N5pwqSxxyGsPNlqowRYF5iP7voug==
X-Google-Smtp-Source: AMsMyM5QdCdSdOnoeRDePp7zjcT+XtuHQEwljSwA1tSU7et4ukJ5a7xUj7CeJ/JlIcwN9jXrU1trp64LLuU18bCInok=
X-Received: by 2002:a05:6102:578b:b0:3ad:7f2:a01b with SMTP id
 dh11-20020a056102578b00b003ad07f2a01bmr1346154vsb.57.1668021663917; Wed, 09
 Nov 2022 11:21:03 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 9 Nov 2022 11:20:52 -0800
Message-ID: <CAO=notxSQTki5NsdVbRsrj+_=XoS9cTGY3R6eP5drB0DEuoJFg@mail.gmail.com>
Subject: Weird qtest FileNotFoundError errors
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="000000000000c1f49505ed0e8e9d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=venture@google.com; helo=mail-vs1-xe36.google.com
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

--000000000000c1f49505ed0e8e9d
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been trying to debug qtest problems recently.  I have seen the assert
socket failures a bunch now and am digging into why.  I've also seen this a
lot and I'm curious if anyone has any ideas:

./configure --target-list=aarch64-softmmu,aarch64-linux-user
make -i check-report-qtest-aarch64.junit.xml

Exception in callback TestHarness._run_tests.<locals>.test_done(<Task
finishe...r directory')>) at
/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py:1843
handle: <Handle TestHarness._run_tests.<locals>.test_done(<Task finishe...r
directory')>) at
/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py:1843>
Traceback (most recent call last):
  File "/usr/lib/python3.10/asyncio/events.py", line 80, in _run
    self._context.run(self._callback, *self._args)
  File
"/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
1845, in test_done
    f.result()
  File
"/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
1840, in run_test
    res = await test.run(self)
  File
"/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
1384, in run
    await self._run_cmd(harness, cmd)
  File
"/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
1438, in _run_cmd
    p = await self._run_subprocess(cmd + extra_cmd,
  File
"/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py", line
1412, in _run_subprocess
    p = await asyncio.create_subprocess_exec(*args,
  File "/usr/lib/python3.10/asyncio/subprocess.py", line 218, in
create_subprocess_exec
    transport, protocol = await loop.subprocess_exec(
  File "/usr/lib/python3.10/asyncio/base_events.py", line 1667, in
subprocess_exec
    transport = await self._make_subprocess_transport(
  File "/usr/lib/python3.10/asyncio/unix_events.py", line 207, in
_make_subprocess_transport
    transp = _UnixSubprocessTransport(self, protocol, args, shell,
  File "/usr/lib/python3.10/asyncio/base_subprocess.py", line 36, in
__init__
    self._start(args=args, shell=shell, stdin=stdin, stdout=stdout,
  File "/usr/lib/python3.10/asyncio/unix_events.py", line 799, in _start
    self._proc = subprocess.Popen(
  File "/usr/lib/python3.10/subprocess.py", line 969, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib/python3.10/subprocess.py", line 1845, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory:
'/usr/local/google/git/workspaces/qemu_71/build/tests/qtest/arm-cpu-features'

In the past I've seen it unable to find other qtest files.  I'm a bit
stumped as to why this would be flaky about finding the test files it needs.

Patrick

--000000000000c1f49505ed0e8e9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;ve been trying=C2=A0to de=
bug qtest problems recently.=C2=A0 I have seen the assert socket failures a=
 bunch now and am digging into why.=C2=A0 I&#39;ve also seen this a lot and=
 I&#39;m curious if anyone has any ideas:</div><div><br></div><div>./config=
ure --target-list=3Daarch64-softmmu,aarch64-linux-user<br></div><div>make -=
i check-report-qtest-aarch64.junit.xml<br></div><div><br></div><div>Excepti=
on in callback TestHarness._run_tests.&lt;locals&gt;.test_done(&lt;Task fin=
ishe...r directory&#39;)&gt;) at /usr/local/google/git/workspaces/qemu_71/m=
eson/mesonbuild/mtest.py:1843<br>handle: &lt;Handle TestHarness._run_tests.=
&lt;locals&gt;.test_done(&lt;Task finishe...r directory&#39;)&gt;) at /usr/=
local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py:1843&gt;<br>T=
raceback (most recent call last):<br>=C2=A0 File &quot;/usr/lib/python3.10/=
asyncio/events.py&quot;, line 80, in _run<br>=C2=A0 =C2=A0 self._context.ru=
n(self._callback, *self._args)<br>=C2=A0 File &quot;/usr/local/google/git/w=
orkspaces/qemu_71/meson/mesonbuild/mtest.py&quot;, line 1845, in test_done<=
br>=C2=A0 =C2=A0 f.result()<br>=C2=A0 File &quot;/usr/local/google/git/work=
spaces/qemu_71/meson/mesonbuild/mtest.py&quot;, line 1840, in run_test<br>=
=C2=A0 =C2=A0 res =3D await test.run(self)<br>=C2=A0 File &quot;/usr/local/=
google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py&quot;, line 1384, i=
n run<br>=C2=A0 =C2=A0 await self._run_cmd(harness, cmd)<br>=C2=A0 File &qu=
ot;/usr/local/google/git/workspaces/qemu_71/meson/mesonbuild/mtest.py&quot;=
, line 1438, in _run_cmd<br>=C2=A0 =C2=A0 p =3D await self._run_subprocess(=
cmd + extra_cmd,<br>=C2=A0 File &quot;/usr/local/google/git/workspaces/qemu=
_71/meson/mesonbuild/mtest.py&quot;, line 1412, in _run_subprocess<br>=C2=
=A0 =C2=A0 p =3D await asyncio.create_subprocess_exec(*args,<br>=C2=A0 File=
 &quot;/usr/lib/python3.10/asyncio/subprocess.py&quot;, line 218, in create=
_subprocess_exec<br>=C2=A0 =C2=A0 transport, protocol =3D await loop.subpro=
cess_exec(<br>=C2=A0 File &quot;/usr/lib/python3.10/asyncio/base_events.py&=
quot;, line 1667, in subprocess_exec<br>=C2=A0 =C2=A0 transport =3D await s=
elf._make_subprocess_transport(<br>=C2=A0 File &quot;/usr/lib/python3.10/as=
yncio/unix_events.py&quot;, line 207, in _make_subprocess_transport<br>=C2=
=A0 =C2=A0 transp =3D _UnixSubprocessTransport(self, protocol, args, shell,=
<br>=C2=A0 File &quot;/usr/lib/python3.10/asyncio/base_subprocess.py&quot;,=
 line 36, in __init__<br>=C2=A0 =C2=A0 self._start(args=3Dargs, shell=3Dshe=
ll, stdin=3Dstdin, stdout=3Dstdout,<br>=C2=A0 File &quot;/usr/lib/python3.1=
0/asyncio/unix_events.py&quot;, line 799, in _start<br>=C2=A0 =C2=A0 self._=
proc =3D subprocess.Popen(<br>=C2=A0 File &quot;/usr/lib/python3.10/subproc=
ess.py&quot;, line 969, in __init__<br>=C2=A0 =C2=A0 self._execute_child(ar=
gs, executable, preexec_fn, close_fds,<br>=C2=A0 File &quot;/usr/lib/python=
3.10/subprocess.py&quot;, line 1845, in _execute_child<br>=C2=A0 =C2=A0 rai=
se child_exception_type(errno_num, err_msg, err_filename)<br>FileNotFoundEr=
ror: [Errno 2] No such file or directory: &#39;/usr/local/google/git/worksp=
aces/qemu_71/build/tests/qtest/arm-cpu-features&#39;<br></div><div><br></di=
v><div>In the past I&#39;ve seen it unable to find other qtest files.=C2=A0=
 I&#39;m a bit stumped as to why this would be flaky about finding the test=
 files it needs.</div><div><br></div><div>Patrick</div></div>

--000000000000c1f49505ed0e8e9d--

