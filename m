Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D05FC18D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 09:59:50 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiWeb-0001if-95
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 03:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiWcq-0000GN-O0
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 03:58:00 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oiWco-0007Y3-J3
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 03:58:00 -0400
Received: by mail-lf1-x132.google.com with SMTP id f37so24557892lfv.8
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 00:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3X32AnQ4lHT8D6fDhKs1HHx9Brx2z/sCqDNCb3SnP+Y=;
 b=aAQvyG34KaH+mencT1+UU+LzTrxgZQlpoDjD28L9/IpMrcFOiibfRO/0R9Um4vt6yr
 Zt+MDzq1rDa+NgtXdrFhsybK8oWJMpb3mhkZ9ioonT9+lubia45yhtzZP2iGf+h8vF/B
 l+pkEK1lgjwjnDNKRnuc6P8j0QLf47AparTB0j12cp4J7JB1GaLLjSbFMvK41Nnr+O0a
 M8isO81Bx2xrv7pN+0TXXIpFfJt26zhMQIqR6h10mx7H+8Ef4yxV45x11gGil91/JoeT
 nXAcvpvK9NGepNgGpJ4aqWYtPBOseQlv7TruJm5MUajRQlrD9sK09TRe6MVFB9UuhSOm
 +T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3X32AnQ4lHT8D6fDhKs1HHx9Brx2z/sCqDNCb3SnP+Y=;
 b=EAYS6pQiwXRzUr6fzJI8Q9KpSo77sT5h2T26buzUtktcKJy9IPGafe727+ToKZuSio
 PDiaVP9XOzKGGtRHq0Pi8q7M0zf4Yh3DcH6DnY0TWzY6trYJhqfOdLZhAkUzkbhDj+ND
 6wmtLj5OddkXJlhkujrBK78LmwWLfMquWaIje30kPehZrtqWUjN8ZbJTUCl8R957eB7m
 nS32C1dAwcQMw479TMlrvtqH/BXDO6y2gXoiwPnk4VMvNKyQsMKPcnAIwrs4ZtjRGbT/
 qobGvhYyFCzIm2BznRUk+e9xQAkqPDx+eeI2zTcTDBpQG64D5LrqCekbW6mLNJk8uvfN
 un9Q==
X-Gm-Message-State: ACrzQf10aRrY2FeL9q08hss9EuZ/ZPtmOKlwVe9lIOlm1fsPBSShMFcz
 HmQ5k8S0lSYh433PxJ/jKIRnRzAg4y9Cv9oMKOA=
X-Google-Smtp-Source: AMsMyM5pEHg1VFYc5h4xCdR8oSvwLp/U6/48H+Egho6HSUKa86BCO5zZVIYjnMGXXZwcwfTyzaeldRyqxUSn2PeKHXE=
X-Received: by 2002:a05:6512:c0d:b0:4a2:4129:366e with SMTP id
 z13-20020a0565120c0d00b004a24129366emr10782278lfu.328.1665561476118; Wed, 12
 Oct 2022 00:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-13-bmeng.cn@gmail.com>
In-Reply-To: <20221006151927.2079583-13-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 Oct 2022 11:57:44 +0400
Message-ID: <CAJ+F1CLMLFgiwCM6po=59yCmWwMeHrUVOsqwQ0C8Tru6TaxE8Q@mail.gmail.com>
Subject: Re: [PATCH v5 12/18] tests/qtest: migration-test: Make sure QEMU
 process "to" exited after migration is canceled
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000022bf0805ead1c054"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

--00000000000022bf0805ead1c054
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 6, 2022 at 8:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Make sure QEMU process "to" exited before launching another target
> for migration in the test_multifd_tcp_cancel case.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Add a usleep(1) in the busy wait loop
>
> Changes in v2:
> - Change to a busy wait after migration is canceled
>
>  tests/qtest/migration-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index ef4427ff4d..e5ba0e21d2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2140,6 +2140,10 @@ static void test_multifd_tcp_cancel(void)
>      wait_for_migration_pass(from);
>
>      migrate_cancel(from);
> +    /* Make sure QEMU process "to" exited */
> +    while (qtest_probe_child(to)) {
> +        usleep(1);
> +    }
>
>
As discussed earlier, I think we can introduce a qtest_wait_qemu() instead,
something like that should work:


-void qtest_kill_qemu(QTestState *s)
+static void qtest_check_status(QTestState *s)
 {
-    pid_t pid =3D s->qemu_pid;
-#ifndef _WIN32
-    int wstatus;
-#else
-    DWORD ret, exit_code;
-#endif
-
-    /* Skip wait if qtest_probe_child already reaped.  */
-    if (pid !=3D -1) {
-#ifndef _WIN32
-        kill(pid, SIGTERM);
-        TFR(pid =3D waitpid(s->qemu_pid, &s->wstatus, 0));
-        assert(pid =3D=3D s->qemu_pid);
-#else
-        TerminateProcess((HANDLE)pid, s->expected_status);
-        ret =3D WaitForSingleObject((HANDLE)pid, INFINITE);
-        assert(ret =3D=3D WAIT_OBJECT_0);
-#endif
-        s->qemu_pid =3D -1;
-    }
-
     /*
      * Check whether qemu exited with expected exit status; anything else
is
      * fishy and should be logged with as much detail as possible.
      */
 #ifndef _WIN32
-    wstatus =3D s->wstatus;
+    int wstatus =3D s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) !=3D s->expected_status=
) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
                 "process but encountered exit status %d (expected %d)\n",
@@ -208,17 +191,50 @@ void qtest_kill_qemu(QTestState *s)
         abort();
     }
 #else
-    GetExitCodeProcess((HANDLE)pid, &exit_code);
-    CloseHandle((HANDLE)pid);
-    if (exit_code !=3D s->expected_status) {
+    if (s->exit_code !=3D s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
                 "process but encountered exit status %ld (expected %d)\n",
-                __FILE__, __LINE__, exit_code, s->expected_status);
+                __FILE__, __LINE__, s->exit_code, s->expected_status);
         abort();
     }
 #endif
 }

+void qtest_kill_qemu(QTestState *s)
+{
+    /* Skip wait if qtest_probe_child already reaped.  */
+    if (s->qemu_pid !=3D -1) {
+#ifndef _WIN32
+        kill(s->qemu_pid, SIGTERM);
+#else
+        TerminateProcess((HANDLE)s->qemu_pid, s->expected_status);
+#endif
+        qtest_wait_qemu(s);
+        s->qemu_pid =3D -1;
+    }
+
+    qtest_check_status(s);
+}
+
+void qtest_wait_qemu(QTestState *s)
+{
+#ifndef _WIN32
+    pid_t pid;
+
+    TFR(pid =3D waitpid(s->qemu_pid, &s->wstatus, 0));
+    assert(pid =3D=3D s->qemu_pid);
+#else
+    DWORD ret;
+
+    ret =3D WaitForSingleObject((HANDLE)s->qemu_pid, INFINITE);
+    assert(ret =3D=3D WAIT_OBJECT_0);
+    GetExitCodeProcess((HANDLE)s->qemu_pid, &s->exit_code);
+    CloseHandle((HANDLE)s->qemu_pid);
+#endif
+
+    qtest_check_status(s);
+}
+
 static void kill_qemu_hook_func(void *s)
 {
     qtest_kill_qemu(s);




--=20
Marc-Andr=C3=A9 Lureau

--00000000000022bf0805ead1c054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 8:12 PM Bin =
Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuzh=
ou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blank=
">xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
Make sure QEMU process &quot;to&quot; exited before launching another targe=
t<br>
for migration in the test_multifd_tcp_cancel case.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
(no changes since v3)<br>
<br>
Changes in v3:<br>
- Add a usleep(1) in the busy wait loop<br>
<br>
Changes in v2:<br>
- Change to a busy wait after migration is canceled<br>
<br>
=C2=A0tests/qtest/migration-test.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c<br=
>
index ef4427ff4d..e5ba0e21d2 100644<br>
--- a/tests/qtest/migration-test.c<br>
+++ b/tests/qtest/migration-test.c<br>
@@ -2140,6 +2140,10 @@ static void test_multifd_tcp_cancel(void)<br>
=C2=A0 =C2=A0 =C2=A0wait_for_migration_pass(from);<br>
<br>
=C2=A0 =C2=A0 =C2=A0migrate_cancel(from);<br>
+=C2=A0 =C2=A0 /* Make sure QEMU process &quot;to&quot; exited */<br>
+=C2=A0 =C2=A0 while (qtest_probe_child(to)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep(1);<br>
+=C2=A0 =C2=A0 }<br>
<br></blockquote><div><br></div><div>As discussed earlier, I think we can i=
ntroduce a qtest_wait_qemu() instead, something like that should work:<br><=
/div><div><br></div><div><br>-void qtest_kill_qemu(QTestState *s)<br>+stati=
c void qtest_check_status(QTestState *s)<br>=C2=A0{<br>- =C2=A0 =C2=A0pid_t=
 pid =3D s-&gt;qemu_pid;<br>-#ifndef _WIN32<br>- =C2=A0 =C2=A0int wstatus;<=
br>-#else<br>- =C2=A0 =C2=A0DWORD ret, exit_code;<br>-#endif<br>-<br>- =C2=
=A0 =C2=A0/* Skip wait if qtest_probe_child already reaped. =C2=A0*/<br>- =
=C2=A0 =C2=A0if (pid !=3D -1) {<br>-#ifndef _WIN32<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kill(pid, SIGTERM);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0TFR(pid =3D w=
aitpid(s-&gt;qemu_pid, &amp;s-&gt;wstatus, 0));<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0assert(pid =3D=3D s-&gt;qemu_pid);<br>-#else<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TerminateProcess((HANDLE)pid, s-&gt;expected_status);<br>- =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ret =3D WaitForSingleObject((HANDLE)pid, INFINITE);<br=
>- =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(ret =3D=3D WAIT_OBJECT_0);<br>-#endif<=
br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<br>- =C2=A0 =C2=A0}<=
br>-<br>=C2=A0 =C2=A0 =C2=A0/*<br>=C2=A0 =C2=A0 =C2=A0 * Check whether qemu=
 exited with expected exit status; anything else is<br>=C2=A0 =C2=A0 =C2=A0=
 * fishy and should be logged with as much detail as possible.<br>=C2=A0 =
=C2=A0 =C2=A0 */<br>=C2=A0#ifndef _WIN32<br>- =C2=A0 =C2=A0wstatus =3D s-&g=
t;wstatus;<br>+ =C2=A0 =C2=A0int wstatus =3D s-&gt;wstatus;<br>=C2=A0 =C2=
=A0 =C2=A0if (WIFEXITED(wstatus) &amp;&amp; WEXITSTATUS(wstatus) !=3D s-&gt=
;expected_status) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &q=
uot;%s:%d: kill_qemu() tried to terminate QEMU &quot;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;process but encountered =
exit status %d (expected %d)\n&quot;,<br>@@ -208,17 +191,50 @@ void qtest_k=
ill_qemu(QTestState *s)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>=
=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0#else<br>- =C2=A0 =C2=A0GetExitCodeProcess((=
HANDLE)pid, &amp;exit_code);<br>- =C2=A0 =C2=A0CloseHandle((HANDLE)pid);<br=
>- =C2=A0 =C2=A0if (exit_code !=3D s-&gt;expected_status) {<br>+ =C2=A0 =C2=
=A0if (s-&gt;exit_code !=3D s-&gt;expected_status) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;%s:%d: kill_qemu() tried to terminat=
e QEMU &quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;process but encountered exit status %ld (expected %d)\n&quot;,<=
br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __LIN=
E__, exit_code, s-&gt;expected_status);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0__FILE__, __LINE__, s-&gt;exit_code, s-&gt;expec=
ted_status);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>=C2=A0 =C2=A0=
 =C2=A0}<br>=C2=A0#endif<br>=C2=A0}<br>=C2=A0<br>+void qtest_kill_qemu(QTes=
tState *s)<br>+{<br>+ =C2=A0 =C2=A0/* Skip wait if qtest_probe_child alread=
y reaped. =C2=A0*/<br>+ =C2=A0 =C2=A0if (s-&gt;qemu_pid !=3D -1) {<br>+#ifn=
def _WIN32<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0kill(s-&gt;qemu_pid, SIGTERM);<b=
r>+#else<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0TerminateProcess((HANDLE)s-&gt;qem=
u_pid, s-&gt;expected_status);<br>+#endif<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0q=
test_wait_qemu(s);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;qemu_pid =3D -1;<b=
r>+ =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0qtest_check_status(s);<br>+}<br>+=
<br>+void qtest_wait_qemu(QTestState *s)<br>+{<br>+#ifndef _WIN32<br>+ =C2=
=A0 =C2=A0pid_t pid;<br>+<br>+ =C2=A0 =C2=A0TFR(pid =3D waitpid(s-&gt;qemu_=
pid, &amp;s-&gt;wstatus, 0));<br>+ =C2=A0 =C2=A0assert(pid =3D=3D s-&gt;qem=
u_pid);<br>+#else<br>+ =C2=A0 =C2=A0DWORD ret;<br>+<br>+ =C2=A0 =C2=A0ret =
=3D WaitForSingleObject((HANDLE)s-&gt;qemu_pid, INFINITE);<br>+ =C2=A0 =C2=
=A0assert(ret =3D=3D WAIT_OBJECT_0);<br>+ =C2=A0 =C2=A0GetExitCodeProcess((=
HANDLE)s-&gt;qemu_pid, &amp;s-&gt;exit_code);<br>+ =C2=A0 =C2=A0CloseHandle=
((HANDLE)s-&gt;qemu_pid);<br>+#endif<br>+<br>+ =C2=A0 =C2=A0qtest_check_sta=
tus(s);<br>+}<br>+<br>=C2=A0static void kill_qemu_hook_func(void *s)<br>=C2=
=A0{<br>=C2=A0 =C2=A0 =C2=A0qtest_kill_qemu(s);</div><div><br></div><div><b=
r></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000022bf0805ead1c054--

