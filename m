Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBECB455069
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 23:27:27 +0100 (CET)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnTOo-0001Oo-Hi
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 17:27:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnTNQ-0000af-7Q
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 17:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnTNN-0004Vm-FW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 17:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637187954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=saAM73SEnlvT3EMsxkEmNXoCArinXM9Ul2Az9sgHWZs=;
 b=NDBATP27Xor8p0rRRJ+9jYtzq0JpXxh9lia2mnNuvRoRZqemNCqQ4X7XIuENEHr/GNGhjQ
 hLdiGGGNj3WNQaM3dDDy9yIW1yL4Xm+J67G5f+wAn47OOTwhzHNdQnvu3yfI1woVy/jceh
 gh4l4n+P8Nq0vSVFliPM4p+hJto/ZHM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-vDTQeJLePXW8XXRa0lYzlQ-1; Wed, 17 Nov 2021 17:25:51 -0500
X-MC-Unique: vDTQeJLePXW8XXRa0lYzlQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 y15-20020a1f7d0f000000b002f244d4c479so2084859vkc.9
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 14:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=saAM73SEnlvT3EMsxkEmNXoCArinXM9Ul2Az9sgHWZs=;
 b=rwo3T4mVdW7OWx6IF/y//W7jG95I+Gu/csY36ICoNJdMPCvKrQOZsyijtHKloLyGxC
 oS42vO/l3Zzat4AaKL72MxXtEWflhlAq0xkACBNpYiFk8QmHqctaly8XfyAfC6FTNjkK
 exhq4WpuHwgAWhW4dwdz7hxktaFAyyXXYsAn9czjAgE9GehsZxdSNwLy7PrPfxYwiDVk
 Hzigps5Tgh1daBSRBlpDLDtoT7s74IZ9HsK5egbSk1Iv4qkE7HAfeWwMYV3Mm6/ANsY/
 scCh1S7SnFca4siQBHcVK4PZ6BJH+MWo3f9PKn20iHNqqlUSco119mIFd4op/5IPVGtl
 2H5g==
X-Gm-Message-State: AOAM532D+ZFXR3BlBi+2rY2pBD9gzEJXZ35sq2yTFwmmoc/dII8ijEQd
 u0EpoY2fygu0jxshtwpJsKnlfsalJy3D7x/3nLSoJRDGuRWfQeIZzDdl0I+shTNKdeErUc3rXUN
 myfgB9pz5aQ38MO1ovSiCgiZiAgVpUtE=
X-Received: by 2002:ab0:35d2:: with SMTP id x18mr28679033uat.32.1637187951026; 
 Wed, 17 Nov 2021 14:25:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTAMPOK6KJtKEbCukDPAyvtfve/Bd3eaffbtUpvfdUFnx1c6OsS4o610uMFhbdkOPMgQyM86tTHdyOsODO2Pw=
X-Received: by 2002:ab0:35d2:: with SMTP id x18mr28679008uat.32.1637187950813; 
 Wed, 17 Nov 2021 14:25:50 -0800 (PST)
MIME-Version: 1.0
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
 <CAFn=p-akTO0Q3jct_PHYyc=yH6q1XwRWwv3EYBc49yKqT9YCeg@mail.gmail.com>
 <f9015aa2-e513-b760-6579-5457fff0e969@redhat.com>
 <CAFn=p-YSYuQeMhiipjSFmWEuCTS3hbAwHg0SK87jfx7qLZoXdg@mail.gmail.com>
 <527e8991-60e8-75cb-ba2e-2dffc0191be1@redhat.com>
In-Reply-To: <527e8991-60e8-75cb-ba2e-2dffc0191be1@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 17 Nov 2021 17:25:40 -0500
Message-ID: <CAFn=p-YVyzgqpJWSVjh+2wmakB3gVM+oH60VrsO=Zp+rLKmFMA@mail.gmail.com>
Subject: Re: Failing QEMU iotests
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003d34dd05d10386cd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000003d34dd05d10386cd
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 4:33 PM Thomas Huth <thuth@redhat.com> wrote:

> On 17/11/2021 20.59, John Snow wrote:
> >
> >
> > On Wed, Nov 17, 2021 at 2:45 PM Thomas Huth <thuth@redhat.com
> > <mailto:thuth@redhat.com>> wrote:
> >
> >     On 17/11/2021 19.13, John Snow wrote:
> >      >
> >      >
> >      > On Wed, Nov 17, 2021 at 5:07 AM Thomas Huth <thuth@redhat.com
> >     <mailto:thuth@redhat.com>
> >      > <mailto:thuth@redhat.com <mailto:thuth@redhat.com>>> wrote:
> >      >
> >      >
> >      >        Hi!
> >      >
> >      >     I think it has been working fine for me a couple of weeks ago,
> >      >     but when I now run:
> >      >
> >      >        make check SPEED=slow
> >      >
> >      >     I'm getting a couple of failing iotests... not sure whether
> >      >     these are known issues already, so I thought I'd summarize
> them
> >      >     here:
> >      >
> >      >     *** First one is 045 in raw mode: ***
> >      >
> >      >        TEST   iotest-raw: 045 [fail]
> >      >     QEMU          --
> >      >
> >
>  "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64"
> >      >     -nodefaults -display none -accel qtest
> >      >     QEMU_IMG      --
> >      >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
> >      >     QEMU_IO       --
> >      >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io"
> --cache
> >      >     writeback --aio threads -f raw
> >      >     QEMU_NBD      --
> >      >     "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
> >      >     IMGFMT        -- raw
> >      >     IMGPROTO      -- file
> >      >     PLATFORM      -- Linux/x86_64 thuth
> 4.18.0-305.19.1.el8_4.x86_64
> >      >     TEST_DIR      --
> >     /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
> >      >     SOCK_DIR      -- /tmp/tmphlexdrlt
> >      >     GDB_OPTIONS   --
> >      >     VALGRIND_QEMU --
> >      >     PRINT_QEMU_OUTPUT --
> >      >
> >      >     --- /home/thuth/devel/qemu/tests/qemu-iotests/045.out
> >      >     +++ 045.out.bad
> >      >     @@ -1,5 +1,77 @@
> >      >     -...........
> >      >     +......EE.EE <http://EE.EE> <http://EE.EE <http://EE.EE>>
> >      >
> >
>  +======================================================================
> >      >     +ERROR: test_add_fd (__main__.TestSCMFd)
> >      >
> >
>  +----------------------------------------------------------------------
> >      >     +Traceback (most recent call last):
> >      >     +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line
> 148, in
> >      >     test_add_fd
> >      >     +    self._send_fd_by_SCM()
> >      >     +  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line
> 144, in
> >      >     _send_fd_by_SCM
> >      >     +    ret = self.vm.send_fd_scm(file_path=image0)
> >      >     +  File
> "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line
> >      >     229, in send_fd_scm
> >      >     +    self._qmp.send_fd_scm(fd)
> >      >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py",
> line
> >     138,
> >      >     in send_fd_scm
> >      >     +    self._aqmp.send_fd_scm(fd)
> >      >     +  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py",
> >     line 149,
> >      >     in _wrapper
> >      >     +    return func(proto, *args, **kwargs)
> >      >     +  File
> "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line
> >      >     644, in send_fd_scm
> >      >     +    sock = sock._sock  # pylint: disable=protected-access
> >      >     +AttributeError: 'socket' object has no attribute '_sock'
> >      >
> >      >
> >      > Well, that's not good.
> >      >
> >      > Can you tell me some details about what system produced this
> failure?
> >      > The python version used to run the test would be good, as well as
> distro
> >      > release, kernel version, etc.
> >      >
> >      > If you can reproduce it, I might want to give you a test branch
> of the
> >      > python code to produce some extra debugging information to help me
> >      > understand what's gone wrong here. Get in touch on IRC when you
> have
> >     some
> >      > spare time if you'd like to interactively debug it.
> >
> >     As you likely saw in Hanna's mail a little bit later, the problem
> was the
> >     old version of pylint. I did still have version 2.2 installed - after
> >     upgrading, the problem went away.
> >
> >
> > upgrading pylint made *this* problem in *045* go away and not just the
> > failure in *297*, are you positive?
>
> Ah, no, of course not, I just mixed them up :-/
>
>
I was able to repro, I have a fix on the way but I am doing additional
testing.
I still have a fix prepared for some device-crash-test behaviors, but I
found ... another bug that's even more annoying, so there is more
development and testing to do there.

(New problem is: device-crash-test does not set a timeout for QMP
connections, so if the binary dies entirely before it dials out to connect
to the QMP library in python at all, we will just hang waiting forever. I
don't think this is specific to the Async QMP library, either -- it's a
problem in machine.py. The iotests users all set a timeout, FWIW, but this
is still less than ideal ...)

--0000000000003d34dd05d10386cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 4:33 PM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17/11/202=
1 20.59, John Snow wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Nov 17, 2021 at 2:45 PM Thomas Huth &lt;<a href=3D"mailto:thut=
h@redhat.com" target=3D"_blank">thuth@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 17/11/2021 19.13, John Snow wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Wed, Nov 17, 2021 at 5:07 AM Thomas Huth &=
lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:thuth@redhat.com" targ=
et=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:thuth@redhat.com=
" target=3D"_blank">thuth@redhat.com</a> &lt;mailto:<a href=3D"mailto:thuth=
@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I think it has been workin=
g fine for me a couple of weeks ago,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0but when I now run:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 make check SPEED=
=3Dslow<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0I&#39;m getting a couple o=
f failing iotests... not sure whether<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0these are known issues alr=
eady, so I thought I&#39;d summarize them<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0*** First one is 045 in ra=
w mode: ***<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST=C2=A0 =C2=A0i=
otest-raw: 045 [fail]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0QEMU=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu-build/tests/qemu-=
iotests/../../qemu-system-x86_64&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0-nodefaults -display none =
-accel qtest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0QEMU_IMG=C2=A0 =C2=A0 =C2=
=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu=
-build/tests/qemu-iotests/../../qemu-img&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0QEMU_IO=C2=A0 =C2=A0 =C2=
=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu=
-build/tests/qemu-iotests/../../qemu-io&quot; --cache<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0writeback --aio threads -f=
 raw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0QEMU_NBD=C2=A0 =C2=A0 =C2=
=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/thuth/tmp/qemu=
-build/tests/qemu-iotests/../../qemu-nbd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0IMGFMT=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -- raw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0IMGPROTO=C2=A0 =C2=A0 =C2=
=A0 -- file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0PLATFORM=C2=A0 =C2=A0 =C2=
=A0 -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0TEST_DIR=C2=A0 =C2=A0 =C2=
=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/thuth/tmp/qemu-build/tests/qemu-iotests/scrat=
ch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0SOCK_DIR=C2=A0 =C2=A0 =C2=
=A0 -- /tmp/tmphlexdrlt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0GDB_OPTIONS=C2=A0 =C2=A0--=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0VALGRIND_QEMU --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0PRINT_QEMU_OUTPUT --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--- /home/thuth/devel/qemu=
/tests/qemu-iotests/045.out<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+++ 045.out.bad<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0@@ -1,5 +1,77 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0-...........<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+......<a href=3D"http://E=
E.EE" rel=3D"noreferrer" target=3D"_blank">EE.EE</a> &lt;<a href=3D"http://=
EE.EE" rel=3D"noreferrer" target=3D"_blank">http://EE.EE</a>&gt; &lt;<a hre=
f=3D"http://EE.EE" rel=3D"noreferrer" target=3D"_blank">http://EE.EE</a> &l=
t;<a href=3D"http://EE.EE" rel=3D"noreferrer" target=3D"_blank">http://EE.E=
E</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+ERROR: test_add_fd (__mai=
n__.TestSCMFd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+-------------------------------------------=
---------------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+Traceback (most recent ca=
ll last):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/t=
huth/devel/qemu/tests/qemu-iotests/045&quot;, line 148, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0test_add_fd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 self._send_=
fd_by_SCM()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/t=
huth/devel/qemu/tests/qemu-iotests/045&quot;, line 144, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0_send_fd_by_SCM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 ret =3D sel=
f.vm.send_fd_scm(file_path=3Dimage0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/t=
huth/devel/qemu/python/qemu/machine/machine.py&quot;, line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0229, in send_fd_scm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 self._qmp.s=
end_fd_scm(fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/t=
huth/devel/qemu/python/qemu/aqmp/legacy.py&quot;, line<br>
&gt;=C2=A0 =C2=A0 =C2=A0138,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0in send_fd_scm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 self._aqmp.=
send_fd_scm(fd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/t=
huth/devel/qemu/python/qemu/aqmp/protocol.py&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0line 149,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0in _wrapper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 return func=
(proto, *args, **kwargs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 File &quot;/home/t=
huth/devel/qemu/python/qemu/aqmp/qmp_client.py&quot;, line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0644, in send_fd_scm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 sock =3D so=
ck._sock=C2=A0 # pylint: disable=3Dprotected-access<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+AttributeError: &#39;sock=
et&#39; object has no attribute &#39;_sock&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Well, that&#39;s not good.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Can you tell me some details about what syste=
m produced this failure?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The python version used to run the test would=
 be good, as well as distro<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; release, kernel version, etc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; If you can reproduce it, I might want to give=
 you a test branch of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; python code to produce some extra debugging i=
nformation to help me<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; understand what&#39;s gone wrong here. Get in=
 touch on IRC when you have<br>
&gt;=C2=A0 =C2=A0 =C2=A0some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; spare time if you&#39;d like to interactively=
 debug it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As you likely saw in Hanna&#39;s mail a little bit =
later, the problem was the<br>
&gt;=C2=A0 =C2=A0 =C2=A0old version of pylint. I did still have version 2.2=
 installed - after<br>
&gt;=C2=A0 =C2=A0 =C2=A0upgrading, the problem went away.<br>
&gt; <br>
&gt; <br>
&gt; upgrading pylint made *this* problem in *045* go away and not just the=
 <br>
&gt; failure in *297*, are you positive?<br>
<br>
Ah, no, of course not, I just mixed them up :-/<br>
<br></blockquote><div><br></div><div>I was able to repro, I have a fix on t=
he way but I am doing additional testing.<br></div><div>I still have a fix =
prepared for some device-crash-test behaviors, but I found ... another bug =
that&#39;s even more annoying, so there is more development and testing to =
do there.<br><br></div><div>(New problem is: device-crash-test does not set=
 a timeout for QMP connections, so if the binary dies entirely before it di=
als out to connect to the QMP library in python at all, we will just hang w=
aiting forever. I don&#39;t think this is specific to the Async QMP library=
, either -- it&#39;s a problem in machine.py. The iotests users all set a t=
imeout, FWIW, but this is still less than ideal ...)</div><div><br></div></=
div></div>

--0000000000003d34dd05d10386cd--


