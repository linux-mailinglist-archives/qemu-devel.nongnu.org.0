Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E385B22E5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 17:56:59 +0200 (CEST)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWJti-00082D-JI
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 11:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oWJrU-0006XO-V3
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 11:54:40 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:35351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oWJrS-00038z-PC
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 11:54:40 -0400
Received: by mail-qk1-x733.google.com with SMTP id b9so13248274qka.2
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cR2XwatVKCJTRcjX6S7miO8zVMtmZP5OsC9DriUouZk=;
 b=GPCuj2fX/A5sjQ8zDjhXgSdvDTemi94VIqfm4AunjtiLl0cGiEQAQpVPma3O/UF4YG
 9tDGg36NnLC0+tP+HAw6WmowspAM3UGPXMaYc56cS7m0eTQ37TEbJZvlE8C9wMmrerDQ
 x9x2n188w7ZAvyhwfOCdy6Nm+hD++gP+nRCU3Qv+yVBser/X9OfKDyORhLW6WdjjRNC3
 OMO5BO/3/Xwnopcyw/K/Yp5GqBcnihFJhQ49A8g9DOtutQgsPy2Ecg3G5J/8WcRjSNEG
 +dVugLV4+CQcZd1uRAJgRViPm3p7bMyBLgmcSBQLUABw9KvFh4WdDxq9WpCEFZEzdHzX
 xzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cR2XwatVKCJTRcjX6S7miO8zVMtmZP5OsC9DriUouZk=;
 b=LNZbTWl1BnhJjil6khWy+RrIuUmkdfwu4aNV57zxSKElslcuWzdkO16u5xZdE6m8vN
 lUDY3CGTZ97yCqkGPKVmcXdf+OUo43a4lBQgARxVzZ4fDK1/V+nZQgbgm6dMF/jkvOEg
 A5BKI/lYohvD0L26WizHRXazh8iXZCdECj05riLxsMX80cOfGBc5pGBU5mGcuE3ambmv
 UJWup74zmkFIQMfyNek3jQeK7IBHnfXIh0rHmjayRwfwkmuwFChzehs9nNXmoQTIaL1m
 8KTbdnDidgqQbW/ao9XChl43ga0okOgELyL9gTUUgJBYk8MWWS80tew+S4m3ukRcPiMX
 CKyg==
X-Gm-Message-State: ACgBeo0XPKYeGXmc8kDsdlghGdW4VsltRsimkBbntqM8A4NVGRIHqxP2
 phKypzlWfxmo4R6Um2Xu6g1lOoipoUAxuFTtTOf3hA==
X-Google-Smtp-Source: AA6agR7UhH7LFKKnBKHDqH0Hy3FkJyV3tfWbknlRnwx02SWSbNvJWuGmz24o05I/RsWp2mgloVX5I8Nj05KZy+TJxuo=
X-Received: by 2002:a05:620a:1994:b0:6bb:54af:c69b with SMTP id
 bm20-20020a05620a199400b006bb54afc69bmr6979298qkb.782.1662652477113; Thu, 08
 Sep 2022 08:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwARj6d+UygiU4-JBKMJtyOhHmcNFp7C5jwqJReFT-kew@mail.gmail.com>
 <CAFEAcA9brqMEZfyB-c2OjYFWuQPSS28u9_8vFte=zGwePh_Srw@mail.gmail.com>
In-Reply-To: <CAFEAcA9brqMEZfyB-c2OjYFWuQPSS28u9_8vFte=zGwePh_Srw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 8 Sep 2022 08:54:26 -0700
Message-ID: <CAO=notxqhKoUS8Mahp=HLGO1XKt07Z7qH3SEe3-Tfo9skk9rBQ@mail.gmail.com>
Subject: Re: Seeing qtest assertion failure with 7.1
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="00000000000048e8cb05e82c7235"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=venture@google.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000048e8cb05e82c7235
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 10:40 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 7 Sept 2022 at 16:39, Patrick Venture <venture@google.com> wrote:
> >
> > # Start of nvme tests
> > # Start of pci-device tests
> > # Start of pci-device-tests tests
> > # starting QEMU: exec ./qemu-system-aarch64 -qtest
> unix:/tmp/qtest-1431.sock -qtest-log /dev/null -chardev
> socket,path=/tmp/qtest-1431.qmp,id=char0 -mon chardev=char0,mode=control
> -display none -M virt, -cpu max -drive
> id=drv0,if=none,file=null-co://,file.read-zeroes=on,format=raw -object
> memory-backend-ram,id=pmr0,share=on,size=8 -device
> nvme,addr=04.0,drive=drv0,serial=foo -accel qtest
> >
> > #
> ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
> > stderr:
> > double free or corruption (out)
> > socket_accept failed: Resource temporarily unavailable
> > **
> >
> ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_qmp_handshake:
> assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
> > ../../src/qemu/tests/qtest/libqtest.c:165: kill_qemu() detected QEMU
> death from signal 6 (Aborted) (core dumped)
> >
> > I'm not seeing this reliably, and we haven't done a lot of digging yet,
> such as enabling sanitizers, so I'll reply back to this thread with details
> as I have them.
> >
> > Has anyone seen this before or something like it?
>
> Have a look in the source at what exactly the assertion
> failure in libqtest.c is checking for -- IIRC it's a pretty
> basic "did we open a socket fd" one. I think sometimes I
> used to see something like this if there's an old stale socket
> lying around in the test directory and the randomly generated
> socket filename happens to clash with it.
>

Thanks for the debugging tip! I can't reproduce it at this point. I saw it
2-3 times, and now not at all.  So more than likely it's exactly what
you're describing.


>
> Everything after that is probably follow-on errors from the
> tests not being terribly clean about error handling.
>
> Are you running 'make check' with a -j option for parallel?
> (This is supposed to work, and it's the standard way I run
> 'make check', so if it's flaky we need to fix it, but it
> would be interesting to know if the issue repros at -j1.)
>

Since it's not reproducing reliably -- and I haven't actually seen it since
the first few instances (and it was unrelated to those patches in flight),
I'll have to sit on further debug until we reproduce it and then I can let
you know, but this seems to be flaky at the point where it's hard to detect.


>
> -- PMM
>

--00000000000048e8cb05e82c7235
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 7, 2022 at 10:40 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, 7 Sept 2022 at 16:39, Patrick Venture &lt;<a href=3D"mailto:v=
enture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; # Start of nvme tests<br>
&gt; # Start of pci-device tests<br>
&gt; # Start of pci-device-tests tests<br>
&gt; # starting QEMU: exec ./qemu-system-aarch64 -qtest unix:/tmp/qtest-143=
1.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-1431.qmp,id=
=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -M virt, -cpu ma=
x -drive id=3Ddrv0,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don,format=
=3Draw -object memory-backend-ram,id=3Dpmr0,share=3Don,size=3D8 -device nvm=
e,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo -accel qtest<br>
&gt;<br>
&gt; # ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_q=
mp_handshake: assertion failed: (s-&gt;fd &gt;=3D 0 &amp;&amp; s-&gt;qmp_fd=
 &gt;=3D 0)<br>
&gt; stderr:<br>
&gt; double free or corruption (out)<br>
&gt; socket_accept failed: Resource temporarily unavailable<br>
&gt; **<br>
&gt; ERROR:../../src/qemu/tests/qtest/libqtest.c:338:qtest_init_without_qmp=
_handshake: assertion failed: (s-&gt;fd &gt;=3D 0 &amp;&amp; s-&gt;qmp_fd &=
gt;=3D 0)<br>
&gt; ../../src/qemu/tests/qtest/libqtest.c:165: kill_qemu() detected QEMU d=
eath from signal 6 (Aborted) (core dumped)<br>
&gt;<br>
&gt; I&#39;m not seeing this reliably, and we haven&#39;t done a lot of dig=
ging yet, such as enabling sanitizers, so I&#39;ll reply back to this threa=
d with details as I have them.<br>
&gt;<br>
&gt; Has anyone seen this before or something like it?<br>
<br>
Have a look in the source at what exactly the assertion<br>
failure in libqtest.c is checking for -- IIRC it&#39;s a pretty<br>
basic &quot;did we open a socket fd&quot; one. I think sometimes I<br>
used to see something like this if there&#39;s an old stale socket<br>
lying around in the test directory and the randomly generated<br>
socket filename happens to clash with it.<br></blockquote><div><br></div><d=
iv>Thanks for the debugging tip! I can&#39;t reproduce it at this point. I =
saw it 2-3 times, and now not at all.=C2=A0 So more than likely it&#39;s ex=
actly what you&#39;re describing.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Everything after that is probably follow-on errors from the<br>
tests not being terribly clean about error handling.<br>
<br>
Are you running &#39;make check&#39; with a -j option for parallel?<br>
(This is supposed to work, and it&#39;s the standard way I run<br>
&#39;make check&#39;, so if it&#39;s flaky we need to fix it, but it<br>
would be interesting to know if the issue repros at -j1.)<br></blockquote><=
div><br></div><div>Since it&#39;s not reproducing reliably -- and I haven&#=
39;t actually seen it since the first few instances (and it was unrelated t=
o those patches in flight), I&#39;ll have to sit on further debug until we =
reproduce it and then I can let you know, but this seems to be flaky at the=
 point where it&#39;s hard to detect.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
</blockquote></div></div>

--00000000000048e8cb05e82c7235--

