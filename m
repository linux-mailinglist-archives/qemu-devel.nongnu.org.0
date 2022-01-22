Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F728496D05
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 18:08:19 +0100 (CET)
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBJsA-0006xx-4f
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 12:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nBJqW-00062n-LD
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 12:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nBJqE-0003a5-EQ
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 12:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642871176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LC9GADRIZOzdMOV/Fwo+RFSX22U2tTMDBu9V07CZGFQ=;
 b=HgsZhwAMewWrEEupNU+kdDyFSbSQD9621mlyj1tQE51ER9RKTkYT8CxSttBIKr2NEfqieN
 uGeAIilkxPsUHCvI5BrzAJW+mKBFA8l/oW3oeoxG5aCZe2jnwruChqi177vAc7kwyAcL/d
 wC5ZaOLLpDiFqqIcq59UZrgVWX96yxs=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-q6Y6J7oWOMa_XhspYJMDHQ-1; Sat, 22 Jan 2022 12:06:15 -0500
X-MC-Unique: q6Y6J7oWOMa_XhspYJMDHQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 z4-20020a9f3704000000b0030bb302b19dso1004174uad.11
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 09:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LC9GADRIZOzdMOV/Fwo+RFSX22U2tTMDBu9V07CZGFQ=;
 b=O2PM5XD7ZGE7D8UM5KceW58MmnS+Vk1utdWIpB7AnnwWiSkj4q3kYN9uubbcAEInmJ
 ayku8awLGRSDSbNtZhwobkrDJxDos74ha/PBo/7cK7sLjZtDIrcbHGgFKyfTz0bqC//U
 Eh6nbQ4tHbBCOk/LNCiiD4p3x8NUUm9qiuomKsOFtOGaeL3NxkzTbWN2sb8T0GlvasJu
 voOZAh9CeHmYN+ncQJ5nWIhpJmBEwLWOiaZYWOBqsVToqC4LQDCsvfDNsCV6SfXNBSjr
 AAb/ZJa22F+tBi6DFLmdt2F62IWT35FaPu4CMNFah6omM3qYMihMKCcXLb/BgrHzMXcx
 mzYA==
X-Gm-Message-State: AOAM533sprS7QDD0Zm1iKWm7YaPzBbz9SAbP6fT/3hKDtgDprzmIxGOZ
 ZNZTPSbJZVGlZ851hsmLxfFYhx2Bsx2DkUw4RSSLEDkRotVqcjVPvxitgw89mbphZNC8QmdLrT1
 g6pg+ABvOXdwCEW1v/wdMMQxVK7kHOCw=
X-Received: by 2002:ab0:6584:: with SMTP id v4mr935216uam.87.1642871174620;
 Sat, 22 Jan 2022 09:06:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDoSRxx8EmDikKdrrsXciPR7ptli7BrxbL28QcNQYtRXhsW8A/YuXwJgeIFCgmhYC8r1OOg34hRshLLdIfa2I=
X-Received: by 2002:ab0:6584:: with SMTP id v4mr935210uam.87.1642871174346;
 Sat, 22 Jan 2022 09:06:14 -0800 (PST)
MIME-Version: 1.0
References: <20220122000931.536322-1-jsnow@redhat.com>
 <CAFEAcA8h++yFCYhx7Fecaz3AnSXA3HmmaRbUWeGkg8zWG9VptA@mail.gmail.com>
In-Reply-To: <CAFEAcA8h++yFCYhx7Fecaz3AnSXA3HmmaRbUWeGkg8zWG9VptA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Sat, 22 Jan 2022 12:06:04 -0500
Message-ID: <CAFn=p-bx+=GQGeKTXOBKdQ+8KKUL5g0u9_ryQ1X6D5pTBTA_LQ@mail.gmail.com>
Subject: Re: [PULL 00/17] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c24fb005d62ec0c8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c24fb005d62ec0c8
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 22, 2022, 8:58 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sat, 22 Jan 2022 at 00:09, John Snow <jsnow@redhat.com> wrote:
> >
> > The following changes since commit
> 5e9d14f2bea6df89c0675df953f9c839560d2266:
> >
> >   Merge remote-tracking branch
> 'remotes/alistair/tags/pull-riscv-to-apply-20220121-1' into staging
> (2022-01-21 10:31:25 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> >
> > for you to fetch changes up to 05908602429cf9d6fce9b60704b8395f6d295441:
> >
> >   scripts/render-block-graph: switch to AQMP (2022-01-21 16:01:31 -0500)
> >
> > ----------------------------------------------------------------
> > Python patches
> >
> > A few fixes to the Python CI tests, a few fixes to the (async) QMP
> > library, and a set of patches that begin to shift us towards using the
> > new qmp lib.
> >
> > ----------------------------------------------------------------
>
> Was this set of patches supposed to fix the NetBSD VM intermittents?
>

No, nobody reviewed or tested that series yet, so I didn't pull it.

(Is that too conservative ...?)

If you'd like, I can include them anyway in a v2 pull here and you can test
it as part of your merge.


> I still see that failure, though it looks a little different now:
>
>   TEST   iotest-qcow2: 040 [fail]
> QEMU          --
>
> "/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -display none -accel qtest -machine virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio threads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- NetBSD/amd64 localhost 9.2
> TEST_DIR      --
> /home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmpb3k9h89o
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
>
> --- /home/qemu/qemu-test.ArLruP/src/tests/qemu-iotests/040.out
> +++ 040.out.bad
> @@ -1,5 +1,30 @@
> -.................................................................
> +............ERROR:qemu.aqmp.qmp_client.qemu-11749:Failed to establish
> connection: concurrent.futures._base.CancelledError
> +E....................................................
> +======================================================================
> +ERROR: test_top_invalid (__main__.TestActiveZeroLengthImage)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.ArLruP/src/tests/qemu-iotests/040", line
> 94, in setUp
> +    self.vm.launch()
> +  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/machine.py",
> line 399, in launch
> +    self._launch()
> +  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/machine.py",
> line 434, in _launch
> +    self._post_launch()
> +  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/qtest.py",
> line 147, in _post_launch
> +    super()._post_launch()
> +  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/machine.py",
> line 340, in _post_launch
> +    self._qmp.accept(self._qmp_timer)
> +  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/aqmp/legacy.py",
> line 92, in accept
> +    timeout
> +  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/aqmp/legacy.py",
> line 65, in _sync
> +    asyncio.wait_for(future, timeout=timeout)
> +  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
> run_until_complete
> +    return future.result()
> +  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
> +    raise futures.TimeoutError()
> +concurrent.futures._base.TimeoutError
> +
>  ----------------------------------------------------------------------
>  Ran 65 tests
>
> -OK
> +FAILED (errors=1)
>
> thanks
> -- PMM
>
>

--000000000000c24fb005d62ec0c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Jan 22, 2022, 8:58 AM Peter Maydell &lt;<a hre=
f=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Sat, 22 Jan 2022 at 00:09, Jo=
hn Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"no=
referrer">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 5e9d14f2bea6df89c0675df953f9c839560=
d2266:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/alistair/tags/pu=
ll-riscv-to-apply-20220121-1&#39; into staging (2022-01-21 10:31:25 +0000)<=
br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/jsnow/qemu.git" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu.git</a> t=
ags/python-pull-request<br>
&gt;<br>
&gt; for you to fetch changes up to 05908602429cf9d6fce9b60704b8395f6d29544=
1:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0scripts/render-block-graph: switch to AQMP (2022-01-21 16:=
01:31 -0500)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Python patches<br>
&gt;<br>
&gt; A few fixes to the Python CI tests, a few fixes to the (async) QMP<br>
&gt; library, and a set of patches that begin to shift us towards using the=
<br>
&gt; new qmp lib.<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
<br>
Was this set of patches supposed to fix the NetBSD VM intermittents?<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No, nob=
ody reviewed or tested that series yet, so I didn&#39;t pull it.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">(Is that too conservative ...?)</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">If you&#39;d like, I can i=
nclude them anyway in a v2 pull here and you can test it as part of your me=
rge.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
I still see that failure, though it looks a little different now:<br>
<br>
=C2=A0 TEST=C2=A0 =C2=A0iotest-qcow2: 040 [fail]<br>
QEMU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
&quot;/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-syste=
m-aarch64&quot;<br>
-nodefaults -display none -accel qtest -machine virt<br>
QEMU_IMG=C2=A0 =C2=A0 =C2=A0 --<br>
&quot;/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-img&q=
uot;<br>
QEMU_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&quot;/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-io&qu=
ot;<br>
--cache writeback --aio threads -f qcow2<br>
QEMU_NBD=C2=A0 =C2=A0 =C2=A0 --<br>
&quot;/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-nbd&q=
uot;<br>
IMGFMT=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- qcow2<br>
IMGPROTO=C2=A0 =C2=A0 =C2=A0 -- file<br>
PLATFORM=C2=A0 =C2=A0 =C2=A0 -- NetBSD/amd64 localhost 9.2<br>
TEST_DIR=C2=A0 =C2=A0 =C2=A0 -- /home/qemu/qemu-test.ArLruP/build/tests/qem=
u-iotests/scratch<br>
SOCK_DIR=C2=A0 =C2=A0 =C2=A0 -- /tmp/tmpb3k9h89o<br>
GDB_OPTIONS=C2=A0 =C2=A0--<br>
VALGRIND_QEMU --<br>
PRINT_QEMU_OUTPUT --<br>
<br>
--- /home/qemu/qemu-test.ArLruP/src/tests/qemu-iotests/040.out<br>
+++ 040.out.bad<br>
@@ -1,5 +1,30 @@<br>
-.................................................................<br>
+............ERROR:qemu.aqmp.qmp_client.qemu-11749:Failed to establish<br>
connection: concurrent.futures._base.CancelledError<br>
+E....................................................<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+ERROR: test_top_invalid (__main__.TestActiveZeroLengthImage)<br>
+----------------------------------------------------------------------<br>
+Traceback (most recent call last):<br>
+=C2=A0 File &quot;/home/qemu/qemu-test.ArLruP/src/tests/qemu-iotests/040&q=
uot;, line<br>
94, in setUp<br>
+=C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 File &quot;/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/mach=
ine.py&quot;,<br>
line 399, in launch<br>
+=C2=A0 =C2=A0 self._launch()<br>
+=C2=A0 File &quot;/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/mach=
ine.py&quot;,<br>
line 434, in _launch<br>
+=C2=A0 =C2=A0 self._post_launch()<br>
+=C2=A0 File &quot;/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/qtes=
t.py&quot;,<br>
line 147, in _post_launch<br>
+=C2=A0 =C2=A0 super()._post_launch()<br>
+=C2=A0 File &quot;/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/mach=
ine.py&quot;,<br>
line 340, in _post_launch<br>
+=C2=A0 =C2=A0 self._qmp.accept(self._qmp_timer)<br>
+=C2=A0 File &quot;/home/qemu/qemu-test.ArLruP/src/python/qemu/aqmp/legacy.=
py&quot;,<br>
line 92, in accept<br>
+=C2=A0 =C2=A0 timeout<br>
+=C2=A0 File &quot;/home/qemu/qemu-test.ArLruP/src/python/qemu/aqmp/legacy.=
py&quot;,<br>
line 65, in _sync<br>
+=C2=A0 =C2=A0 asyncio.wait_for(future, timeout=3Dtimeout)<br>
+=C2=A0 File &quot;/usr/pkg/lib/python3.7/asyncio/base_events.py&quot;, lin=
e 587, in<br>
run_until_complete<br>
+=C2=A0 =C2=A0 return future.result()<br>
+=C2=A0 File &quot;/usr/pkg/lib/python3.7/asyncio/tasks.py&quot;, line 449,=
 in wait_for<br>
+=C2=A0 =C2=A0 raise futures.TimeoutError()<br>
+concurrent.futures._base.TimeoutError<br>
+<br>
=C2=A0---------------------------------------------------------------------=
-<br>
=C2=A0Ran 65 tests<br>
<br>
-OK<br>
+FAILED (errors=3D1)<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000c24fb005d62ec0c8--


