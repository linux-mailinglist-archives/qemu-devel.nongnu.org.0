Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5745EC914
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:08:27 +0200 (CEST)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odD8E-0003Wb-9O
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odBV0-0005Ig-A4
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:24:01 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:45608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odBUy-0007Lu-39
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:23:49 -0400
Received: by mail-lj1-x232.google.com with SMTP id c7so11069327ljm.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=37pld8SJ8bAX3DYFrAqW82CFpXv9NON7z+VG3qU5uTQ=;
 b=j4x36JURoQ5opCE07HObOfkK/GcHH3ph6zNgKqaIVbHTtaCc5BkkrGANiTCs5EIlJy
 Nm+BO+QzQhEzOyL2QP8/ykOIZ3zu/kOQybo9DbUtdCD2tJ1tO4jWtV1dp+sQKQwvwwMT
 2n9VtWrpHZjLtpMlDYEKszg4oq0W39DZ42x91X8xpK8d+BACZH2p+WhImeIEZJz/MeG6
 kn+ePjEHLwrwjddIqbeJe7+ugCMo+faWDhpf07Ob0yO9wOyayhXk617cRNHohBP3Qkrg
 FULukEH/9vHzsU6KN+Jz24vCbbNSRCQ3a/hsHIxmp0+J4z40Dhv+rhnGs6/BeMnopj+q
 EhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=37pld8SJ8bAX3DYFrAqW82CFpXv9NON7z+VG3qU5uTQ=;
 b=HI9NqGITMIRGxdAmqxuK6dhsibHfoC2lKXI26kmDCOe+E1BuA7KH8MxCc7LJrnc3wI
 Tfv4p4j/3st3PknH8CTfP+JfN/whVWeIsBXZ5qP86NQnmCPHAN97PQmnyy4GPwn23Vbn
 SJ4YwOU5tGLZKH6B3ftOP/g+NnlgNi5UVqj9wUU2mKmobw8N4gOpqjmi+YiwKiPlVHqP
 EbFSs/4fMk1SEI5JT3BI3A3AQ4X5uxgv4akfj9hS59+y45qsf5o7yk8eDkNJb8NoD3hq
 sgBCJKyxfzIfybyPElQQwnccC64tuesCYuhElts78Gka+EeiLA2QboLQ1b+Slo9xh2Io
 1hug==
X-Gm-Message-State: ACrzQf0utu6nG55lPz6VATHTJipWNWU0eW0adeg3TanZUG95LHmdVkUF
 xflY1aVSEbcjBEdm61C2Jgc43oLT3WbmArZN65Y=
X-Google-Smtp-Source: AMsMyM7gZZcq/R7i5dfI/eLIK4FDAPkDXi4QvxuGjiZK+kw3XnLSy/iHVSKc6IPmqqfhZpoKXrMs/YHtjKvBeiVozzU=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr9503579ljn.94.1664288621633; Tue, 27
 Sep 2022 07:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-44-bmeng.cn@gmail.com>
 <CAJ+F1C+BsM16peLANydiBtRamWada6S8Hg5hLYD=Z274AbN_3A@mail.gmail.com>
 <CAEUhbmWHn_XYh1+xmvxUuK7DAuJf7=kq1zEhsxmLLs9Pb_B+YA@mail.gmail.com>
In-Reply-To: <CAEUhbmWHn_XYh1+xmvxUuK7DAuJf7=kq1zEhsxmLLs9Pb_B+YA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 18:23:30 +0400
Message-ID: <CAJ+F1CLKh-g=d+THtGUG6LiA+Hrx-RJ-GJhZgUniPn5ML5Kokg@mail.gmail.com>
Subject: Re: [PATCH v4 43/54] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000018a60d05e9a9649d"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000018a60d05e9a9649d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Sep 27, 2022 at 5:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Tue, Sep 27, 2022 at 9:15 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Tue, Sep 27, 2022 at 5:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >>
> >> Make sure QEMU process "to" exited before launching another target
> >> for migration in the test_multifd_tcp_cancel case.
> >>
> >> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> ---
> >>
> >> (no changes since v3)
> >>
> >> Changes in v3:
> >> - Add a usleep(1) in the busy wait loop
> >>
> >> Changes in v2:
> >> - Change to a busy wait after migration is canceled
> >>
> >>  tests/qtest/migration-test.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test=
.c
> >> index 45c5f5761b..6f9fe13488 100644
> >> --- a/tests/qtest/migration-test.c
> >> +++ b/tests/qtest/migration-test.c
> >> @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
> >>      wait_for_migration_pass(from);
> >>
> >>      migrate_cancel(from);
> >> +    /* Make sure QEMU process "to" exited */
> >> +    while (qtest_probe_child(to)) {
> >> +        usleep(1);
> >
> >
> > Why not add a qtest_wait_qemu() ? (I think qtest_probe_child() should
> also be renamed)
> >
>
> Do you mean adding:
>
> void qtest_wait_qemu(QTestState *s)
> {
>     while (qtest_probe_child(s)) {
>         usleep(1);
>     }
> }
>

No, more like qtest_probe_child() but without WNOHANG.


>
> Do you have a better name for qtest_probe_child()?
>
>
Perhaps qtest_wait_child() with a new argument "bool nohang" then?


--=20
Marc-Andr=C3=A9 Lureau

--00000000000018a60d05e9a9649d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 27, 2022 at 5:21 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, S=
ep 27, 2022 at 9:15 PM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Tue, Sep 27, 2022 at 5:02 PM Bin Meng &lt;<a href=3D"mailto:bmeng.c=
n@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Make sure QEMU process &quot;to&quot; exited before launching anot=
her target<br>
&gt;&gt; for migration in the test_multifd_tcp_cancel case.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@win=
driver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.c=
om" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; (no changes since v3)<br>
&gt;&gt;<br>
&gt;&gt; Changes in v3:<br>
&gt;&gt; - Add a usleep(1) in the busy wait loop<br>
&gt;&gt;<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - Change to a busy wait after migration is canceled<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 tests/qtest/migration-test.c | 4 ++++<br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-=
test.c<br>
&gt;&gt; index 45c5f5761b..6f9fe13488 100644<br>
&gt;&gt; --- a/tests/qtest/migration-test.c<br>
&gt;&gt; +++ b/tests/qtest/migration-test.c<br>
&gt;&gt; @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 wait_for_migration_pass(from);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 migrate_cancel(from);<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Make sure QEMU process &quot;to&quot; exited */<=
br>
&gt;&gt; +=C2=A0 =C2=A0 while (qtest_probe_child(to)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep(1);<br>
&gt;<br>
&gt;<br>
&gt; Why not add a qtest_wait_qemu() ? (I think qtest_probe_child() should =
also be renamed)<br>
&gt;<br>
<br>
Do you mean adding:<br>
<br>
void qtest_wait_qemu(QTestState *s)<br>
{<br>
=C2=A0 =C2=A0 while (qtest_probe_child(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep(1);<br>
=C2=A0 =C2=A0 }<br>
}<br></blockquote><div><br></div><div>No, more like qtest_probe_child() but=
 without WNOHANG.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Do you have a better name for qtest_probe_child()?<br>
<br></blockquote><div><br></div><div>Perhaps qtest_wait_child() with a new =
argument &quot;bool nohang&quot; then?</div><br clear=3D"all"></div><br>-- =
<br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></=
div></div>

--00000000000018a60d05e9a9649d--

