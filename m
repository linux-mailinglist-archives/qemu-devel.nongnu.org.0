Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A125B454E3F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:01:55 +0100 (CET)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnR7x-0005u5-ER
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:01:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnR5l-0004N4-8d
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnR5i-0002SB-BX
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637179173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LEnvswbltrXOPW0aj6zIgLwCVa3Lon58I/mB6Q8ryk=;
 b=bOt4ys8hH0vVE6QTyjmsoS0FZxow2p54j14Lggvh9G+reuvM6NgASgPaU50wH6SEojtALt
 fXsjQAeHhdNn1YHSdt/fk9D6LZJWUeIpoCRr4yGmdDbc+jFuxGXxVVJ9TwP8P/b5l8v3iq
 4KrKJ89j3ZBNC7OG4gmu4R1NbfkQhf0=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-G5-ZvjQdOBizbjPyQHTRag-1; Wed, 17 Nov 2021 14:59:29 -0500
X-MC-Unique: G5-ZvjQdOBizbjPyQHTRag-1
Received: by mail-vk1-f197.google.com with SMTP id
 m25-20020a056122215900b002fac70f81c1so1904028vkd.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 11:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/LEnvswbltrXOPW0aj6zIgLwCVa3Lon58I/mB6Q8ryk=;
 b=g+PiBEN1k4hb3U3kl++rFpvlQbUc6l6YAjyKomUwDpPxSbJQOD5NWJSisynNp0kY5k
 eA9dEhTa8+veZV8kNryBYvshByspRtK7aFIB1UDzkQgB9cchYS6CbIG6zYOZTzzII/Ei
 urfsdzlz4u7/cIJ9jJDck+YbAOQxIeNETLG37ZiGKvqmt7e1SWq22m51rngqwbKYasgS
 P7kXZpcc+NRUDTCZbYvmnQBDH8xZRXLotbp8PKc1WqfLkC8NoUc97Wln8Yjy93DbKsUB
 419DGjqkZY0Ew7RP/hCkanN2VoG7AOehBaKmYVPM/Q1030VbMH3g2S6wGZvXGOladJ9b
 6fQA==
X-Gm-Message-State: AOAM530zLY3hxSwExsF6JyRLnMBvZqwFgiYdNsvwPiBZNNKoyfKLHbKP
 IYVtqeHWnlYpaRxXk96L7KdF/23e2nrOVYJaVrJNVDPSzWifhqH+cTZwEZk6LxC1xV1D64gA3Dz
 pdlzHrKAvJNbTgvJiRn122WhKpgXKWzw=
X-Received: by 2002:a67:cf45:: with SMTP id f5mr12591246vsm.31.1637179169303; 
 Wed, 17 Nov 2021 11:59:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyw/UrWk1COShZ5mS4sakks80XRAvk5ANd0M3EnqM33y8QkxU27sFG+hXyChi5ZUBNpx3WQbCG2tap9+hWEel4=
X-Received: by 2002:a67:cf45:: with SMTP id f5mr12591205vsm.31.1637179169095; 
 Wed, 17 Nov 2021 11:59:29 -0800 (PST)
MIME-Version: 1.0
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
 <CAFn=p-akTO0Q3jct_PHYyc=yH6q1XwRWwv3EYBc49yKqT9YCeg@mail.gmail.com>
 <f9015aa2-e513-b760-6579-5457fff0e969@redhat.com>
In-Reply-To: <f9015aa2-e513-b760-6579-5457fff0e969@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 17 Nov 2021 14:59:18 -0500
Message-ID: <CAFn=p-YSYuQeMhiipjSFmWEuCTS3hbAwHg0SK87jfx7qLZoXdg@mail.gmail.com>
Subject: Re: Failing QEMU iotests
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ced5a305d1017a06"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ced5a305d1017a06
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 2:45 PM Thomas Huth <thuth@redhat.com> wrote:

> On 17/11/2021 19.13, John Snow wrote:
> >
> >
> > On Wed, Nov 17, 2021 at 5:07 AM Thomas Huth <thuth@redhat.com
> > <mailto:thuth@redhat.com>> wrote:
> >
> >
> >        Hi!
> >
> >     I think it has been working fine for me a couple of weeks ago,
> >     but when I now run:
> >
> >        make check SPEED=slow
> >
> >     I'm getting a couple of failing iotests... not sure whether
> >     these are known issues already, so I thought I'd summarize them
> >     here:
> >
> >     *** First one is 045 in raw mode: ***
> >
> >        TEST   iotest-raw: 045 [fail]
> >     QEMU          --
> >
>  "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64"
> >     -nodefaults -display none -accel qtest
> >     QEMU_IMG      --
> >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
> >     QEMU_IO       --
> >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io" --cache
> >     writeback --aio threads -f raw
> >     QEMU_NBD      --
> >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
> >     IMGFMT        -- raw
> >     IMGPROTO      -- file
> >     PLATFORM      -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64
> >     TEST_DIR      --
> /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
> >     SOCK_DIR      -- /tmp/tmphlexdrlt
> >     GDB_OPTIONS   --
> >     VALGRIND_QEMU --
> >     PRINT_QEMU_OUTPUT --
> >
> >     --- /home/thuth/devel/qemu/tests/qemu-iotests/045.out
> >     +++ 045.out.bad
> >     @@ -1,5 +1,77 @@
> >     -...........
> >     +......EE.EE <http://EE.EE>
> >
>  +======================================================================
> >     +ERROR: test_add_fd (__main__.TestSCMFd)
> >
>  +----------------------------------------------------------------------
> >     +Traceback (most recent call last):
> >     +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 148, in
> >     test_add_fd
> >     +    self._send_fd_by_SCM()
> >     +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in
> >     _send_fd_by_SCM
> >     +    ret = self.vm.send_fd_scm(file_path=image0)
> >     +  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line
> >     229, in send_fd_scm
> >     +    self._qmp.send_fd_scm(fd)
> >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line
> 138,
> >     in send_fd_scm
> >     +    self._aqmp.send_fd_scm(fd)
> >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line
> 149,
> >     in _wrapper
> >     +    return func(proto, *args, **kwargs)
> >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line
> >     644, in send_fd_scm
> >     +    sock = sock._sock  # pylint: disable=protected-access
> >     +AttributeError: 'socket' object has no attribute '_sock'
> >
> >
> > Well, that's not good.
> >
> > Can you tell me some details about what system produced this failure?
> > The python version used to run the test would be good, as well as distro
> > release, kernel version, etc.
> >
> > If you can reproduce it, I might want to give you a test branch of the
> > python code to produce some extra debugging information to help me
> > understand what's gone wrong here. Get in touch on IRC when you have
> some
> > spare time if you'd like to interactively debug it.
>
> As you likely saw in Hanna's mail a little bit later, the problem was the
> old version of pylint. I did still have version 2.2 installed - after
> upgrading, the problem went away.
>
>
upgrading pylint made *this* problem in *045* go away and not just the
failure in *297*, are you positive?

--000000000000ced5a305d1017a06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 2:45 PM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17/11/202=
1 19.13, John Snow wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Nov 17, 2021 at 5:07 AM Thomas Huth &lt;<a href=3D"mailto:thut=
h@redhat.com" target=3D"_blank">thuth@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I think it has been working fine for me a couple of=
 weeks ago,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but when I now run:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 make check SPEED=3Dslow<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m getting a couple of failing iotests... not =
sure whether<br>
&gt;=C2=A0 =C2=A0 =C2=A0these are known issues already, so I thought I&#39;=
d summarize them<br>
&gt;=C2=A0 =C2=A0 =C2=A0here:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0*** First one is 045 in raw mode: ***<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST=C2=A0 =C2=A0iotest-raw: 045 [fail]<br>
&gt;=C2=A0 =C2=A0 =C2=A0QEMU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu-build/tests/qemu-iotests=
/../../qemu-system-x86_64&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-nodefaults -display none -accel qtest<br>
&gt;=C2=A0 =C2=A0 =C2=A0QEMU_IMG=C2=A0 =C2=A0 =C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu-build/tests/qemu-iotests=
/../../qemu-img&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0QEMU_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu-build/tests/qemu-iotests=
/../../qemu-io&quot; --cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0writeback --aio threads -f raw<br>
&gt;=C2=A0 =C2=A0 =C2=A0QEMU_NBD=C2=A0 =C2=A0 =C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu-build/tests/qemu-iotests=
/../../qemu-nbd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0IMGFMT=C2=A0 =C2=A0 =C2=A0 =C2=A0 -- raw<br>
&gt;=C2=A0 =C2=A0 =C2=A0IMGPROTO=C2=A0 =C2=A0 =C2=A0 -- file<br>
&gt;=C2=A0 =C2=A0 =C2=A0PLATFORM=C2=A0 =C2=A0 =C2=A0 -- Linux/x86_64 thuth =
4.18.0-305.19.1.el8_4.x86_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0TEST_DIR=C2=A0 =C2=A0 =C2=A0 -- /home/thuth/tmp/qem=
u-build/tests/qemu-iotests/scratch<br>
&gt;=C2=A0 =C2=A0 =C2=A0SOCK_DIR=C2=A0 =C2=A0 =C2=A0 -- /tmp/tmphlexdrlt<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0GDB_OPTIONS=C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0VALGRIND_QEMU --<br>
&gt;=C2=A0 =C2=A0 =C2=A0PRINT_QEMU_OUTPUT --<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /home/thuth/devel/qemu/tests/qemu-iotests/045.o=
ut<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ 045.out.bad<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,5 +1,77 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-...........<br>
&gt;=C2=A0 =C2=A0 =C2=A0+......<a href=3D"http://EE.EE" rel=3D"noreferrer" =
target=3D"_blank">EE.EE</a> &lt;<a href=3D"http://EE.EE" rel=3D"noreferrer"=
 target=3D"_blank">http://EE.EE</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ERROR: test_add_fd (__main__.TestSCMFd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--------------------------------------------------=
--------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/thuth/devel/qemu/tests/qem=
u-iotests/045&quot;, line 148, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0test_add_fd<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 self._send_fd_by_SCM()<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/thuth/devel/qemu/tests/qem=
u-iotests/045&quot;, line 144, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0_send_fd_by_SCM<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ret =3D self.vm.send_fd_scm(file_pat=
h=3Dimage0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qe=
mu/machine/machine.py&quot;, line<br>
&gt;=C2=A0 =C2=A0 =C2=A0229, in send_fd_scm<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 self._qmp.send_fd_scm(fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qe=
mu/aqmp/legacy.py&quot;, line 138,<br>
&gt;=C2=A0 =C2=A0 =C2=A0in send_fd_scm<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 self._aqmp.send_fd_scm(fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qe=
mu/aqmp/protocol.py&quot;, line 149,<br>
&gt;=C2=A0 =C2=A0 =C2=A0in _wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return func(proto, *args, **kwargs)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/thuth/devel/qemu/python/qe=
mu/aqmp/qmp_client.py&quot;, line<br>
&gt;=C2=A0 =C2=A0 =C2=A0644, in send_fd_scm<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sock =3D sock._sock=C2=A0 # pylint: =
disable=3Dprotected-access<br>
&gt;=C2=A0 =C2=A0 =C2=A0+AttributeError: &#39;socket&#39; object has no att=
ribute &#39;_sock&#39;<br>
&gt; <br>
&gt; <br>
&gt; Well, that&#39;s not good.<br>
&gt; <br>
&gt; Can you tell me some details about what system produced this failure?<=
br>
&gt; The python version used to run the test would be good, as well as dist=
ro <br>
&gt; release, kernel version, etc.<br>
&gt; <br>
&gt; If you can reproduce it, I might want to give you a test branch of the=
 <br>
&gt; python code to produce some extra debugging information to help me <br=
>
&gt; understand what&#39;s gone wrong here. Get in touch on IRC when you ha=
ve some <br>
&gt; spare time if you&#39;d like to interactively debug it.<br>
<br>
As you likely saw in Hanna&#39;s mail a little bit later, the problem was t=
he <br>
old version of pylint. I did still have version 2.2 installed - after <br>
upgrading, the problem went away.<br>
<br></blockquote><div><br></div><div>upgrading pylint made *this* problem i=
n *045* go away and not just the failure in *297*, are you positive?<br></d=
iv></div></div>

--000000000000ced5a305d1017a06--


