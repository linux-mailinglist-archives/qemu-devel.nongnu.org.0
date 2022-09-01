Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511C75A95DF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 13:44:13 +0200 (CEST)
Received: from localhost ([::1]:45100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTicA-0006Ww-4O
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 07:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiUE-0001mK-9h
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:35:54 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:38461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTiUC-0007eE-Cs
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 07:35:53 -0400
Received: by mail-lj1-x232.google.com with SMTP id s15so12426652ljp.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tbzkMnKsL/XkT4iJIWTO5fCC4b2xoql5hc8OjlPCVhg=;
 b=N91ztvPmJba7mns07HdjDSdCzU4mpR891GQ8d7LSt7J+HMTFuUg+/eJIa2lKyXEGSv
 5QbtNJ+t4I2pBZ2Di91VmcAuNAES2rGdkLAmWsD6gmLLTR35LhXa1P2v0b/p2w0/BiQ1
 J8pG9raSNRy3MaBB28poqMTaBXf0XfsVH7J9+IWYb26QipzYqEit1JgCUX7cJxtLy2jR
 vLuDm+iSv++eLK0y5ygCm4eWEFNX3hvdHEzKDWcCzaVQiSrknkVELNfnUDAv7xORwEtB
 TEjV9xd4IBbElOOxpB6AHJOagkue92RDw75z2Bk9X4XRzt3k4kaOY2bJ17yp+y7HJPOs
 5gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tbzkMnKsL/XkT4iJIWTO5fCC4b2xoql5hc8OjlPCVhg=;
 b=eplBIlcvEByG4tS2x19RLJqenFFC4/Q+JK3Zzyb5+ecEb9bSsGXfqz4Fe6a8T2nPoj
 gw6keiHicSCsk7lyF+Uqp7lLikZjse5i57cQ6Q4qUpXKlwUcdsZUM3yqb0RMOpVLKrT7
 YgBZFlhoGXKY9tTrLDLQyGLwebtGmE0suSgUrtAafJwNXwjUInpKvlpGkCFFqxfgcgXY
 grHRWmZLRKeI0kT7stHDQf9AMgLYJRdQO/olg34eMEmHFQu1Bo6+mAVObGur8+h1VKpN
 RK7ySrEgKY6Rpo+xeGSU6bK71vx8X8hawQQnXyAGUG9epXDtn5/aJFbsami3Ta5ert6q
 FhNw==
X-Gm-Message-State: ACgBeo2FCV3gE6JTGKTcyL9rtRjJWaI+x2kANBcs9e9iezbCqk0/5I5P
 0AerpmOww1qbofXHhn0JQ3uMEavibbqDpZn8t4o=
X-Google-Smtp-Source: AA6agR5BJw5CUyVpBkkoLqaDjTl9o6TRksh0v+F6WKa83ItAWxJngus34iMgfFiXN0v+1U9hRREx0kNNmzHR3yaIyaU=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr9104909ljh.267.1662032148946; Thu, 01
 Sep 2022 04:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-42-bmeng.cn@gmail.com>
 <YwZ0X6cGmK/4N1yk@work-vm>
In-Reply-To: <YwZ0X6cGmK/4N1yk@work-vm>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 1 Sep 2022 15:35:37 +0400
Message-ID: <CAJ+F1CLJ3SFzHrp=f7amCCi6cSwp0+ANk7gdO4tgPzJh12uKxg@mail.gmail.com>
Subject: Re: [PATCH 41/51] tests/qtest: migration-test: Kill "to" after
 migration is canceled
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d7e3cd05e79c038f"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000d7e3cd05e79c038f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 24, 2022 at 10:56 PM Dr. David Alan Gilbert <dgilbert@redhat.co=
m>
wrote:

> * Bin Meng (bmeng.cn@gmail.com) wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Make sure QEMU process "to" is killed before launching another target
> > for migration in the test_multifd_tcp_cancel case.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  tests/qtest/migration-test.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.=
c
> > index 125d48d855..18ec079abf 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)
> >      wait_for_migration_pass(from);
> >
> >      migrate_cancel(from);
> > +    /* Make sure QEMU process "to" is killed */
> > +    if (qtest_probe_child(to)) {
> > +        qtest_kill_qemu(to);
> > +    }
>
> I'm not sure that's safe - what happens if the qemu exits between the
> probe and kill?
>

It looks safe to me, qtest_probe_child() resets the qemu_pid if it already
exited. Otherwise, there is a process/handle waiting for
waitpid/CloseHandle done in qtest_kill_qemu().

We are missing a CloseHandle() in qtest_probe_child() though, I'll send a
patch.

so lgtm,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d7e3cd05e79c038f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 10:56 PM Dr=
. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">* Bin Meng (<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_blank"=
>bmeng.cn@gmail.com</a>) wrote:<br>
&gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" t=
arget=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt; <br>
&gt; Make sure QEMU process &quot;to&quot; is killed before launching anoth=
er target<br>
&gt; for migration in the test_multifd_tcp_cancel case.<br>
&gt; <br>
&gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriv=
er.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" =
target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt;=C2=A0 tests/qtest/migration-test.c | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test=
.c<br>
&gt; index 125d48d855..18ec079abf 100644<br>
&gt; --- a/tests/qtest/migration-test.c<br>
&gt; +++ b/tests/qtest/migration-test.c<br>
&gt; @@ -2132,6 +2132,10 @@ static void test_multifd_tcp_cancel(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 wait_for_migration_pass(from);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 migrate_cancel(from);<br>
&gt; +=C2=A0 =C2=A0 /* Make sure QEMU process &quot;to&quot; is killed */<b=
r>
&gt; +=C2=A0 =C2=A0 if (qtest_probe_child(to)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_kill_qemu(to);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
I&#39;m not sure that&#39;s safe - what happens if the qemu exits between t=
he<br>
probe and kill?<br></blockquote><div><br></div><div>It looks safe to me, qt=
est_probe_child() resets the qemu_pid if it already exited. Otherwise, ther=
e is a process/handle waiting for waitpid/CloseHandle done in qtest_kill_qe=
mu().<br></div></div><div><br></div><div>We are missing a CloseHandle() in =
qtest_probe_child() though, I&#39;ll send a patch.<br></div><div><br></div>=
<div>so lgtm,</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"=
mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br>=
</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc=
-Andr=C3=A9 Lureau<br></div></div>

--000000000000d7e3cd05e79c038f--

